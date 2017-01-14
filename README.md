# KupiProdaj

Interested in learning [Rails](http://rubyonrails.org/)?

####Familiar with Git?#####
Checkout this repo, install gems, setup database:

```
	> git clone https://github.com/vladoohr/KupiProdajServer.git
	> cd KupiProdajServer
	> bundle install
	> rake db:migrate
	> rails s
```

####Not Familiar with Git?#####
Click download the .zip file.  Extract the contents of the zip file, then open your terminal, change to the project directory, and:

```
	> bundle install
	> rake db:migrate
	> rails s
```

####Set cron job for worker#####

```
	> whenever --update-cron
```