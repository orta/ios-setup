repos = [] # add repo names here
count = 0
repos.each do |repo|
  system("git clone git@github.com:learn-co-curriculum/#{repo}.git")
  Dir.chdir repo
  if File.exist?('test_runner.sh')
    system("cp ../test_runner.sh .")
    system("git add .")
    system("git commit -m 'update test_runner.sh'")
    system("git push")
  else
    puts "skipping #{repo} - no test_runner.sh"
    count +=1
  end

  Dir.chdir ".."
  system("rm -rf #{repo}")
end
puts "#{count} did not have test runner"
