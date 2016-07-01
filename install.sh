#!/bin/bash
set x
NETRC=~/.ian_dev_test
`which git > /dev/null`

if [ $? != 0 ]; then
  echo 'Please install XCode Command Line Tools and try again. You can do this by running `gcc` in your terminal.'
  exit 1
fi

echo 'Please enter your github username:'
read GITHUB_USERNAME
GITHUB_USER_ID=`curl -s "https://api.github.com/users/${GITHUB_USERNAME}" | grep '"id"' | sed 's/[^0-9]*//g'`
echo ${GITHUB_USER_ID}

if [ -f ${NETRC} ]; then
  if grep -q flatiron-push ${NETRC}; then
    NETRC_NAME=`grep -A1 flatiron-push ${NETRC} | grep login | awk '{print $2}'`
    if [[ ${GITHUB_USERNAME} == ${NETRC_NAME} ]]; then
      echo "You're all set! "
      exit 0
    else
      echo 'not a match - updating...'
      sed -i '' -E '/flatiron-push/{N;N;d;}' ${NETRC}
      echo -e "machine flatiron-push\n  login ${GITHUB_USERNAME}\n  password ${GITHUB_USER_ID}" >> ${NETRC}
    fi
  else
    echo 'push not found'
    echo -e "machine flatiron-push\n  login ${GITHUB_USERNAME}\n  password ${GITHUB_USER_ID}" >> ${NETRC}
  fi
else
  echo -e "machine flatiron-push\n  login ${GITHUB_USERNAME}\n  password ${GITHUB_USER_ID}" > ${NETRC}
  chmod 600 ${NETRC}
  chown ${USER} ${NETRC}
fi

"$NETRC"



