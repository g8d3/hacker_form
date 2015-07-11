Hacker Form
=========

A DSL to create HTML forms(Using this currently for surveys) from plain text.

```
- weekly_time: How many hours do you learn web development per week?​
	radio
		Less than 5 hours
		More than 5 hours and less than 10 hours
		More than 10 hours and less than 15 hours
		More than 15 hours
- learning_resources: How have you learned? Which resources do you use?​
	checkbox
		Youtube
		Udemy
		Coursera
		University online courses
		Other or specify
- built_things: What have you built?​ Please share links if you have.
	textarea
- email: Write your email here if you want to talk more about your needs
```

This will generate a form like this:

```html
<p>How many hours do you learn web development per week?​</p>
<label for="weekly_time_0">
    <input type="radio" name="weekly_time" id="weekly_time_0">
    <span>Less than 5 hours</span>
</label>
<br>
<label for="weekly_time_1">
    <input type="radio" name="weekly_time" id="weekly_time_1">
    <span>More than 15 hours</span>
</label>
<br>
<p>How have you learned? Which resources do you use?​</p>
<label for="learning_resources_0">
    <input type="checkbox" name="learning_resources" id="learning_resources_0">
    <span>Youtube</span>
</label>
<br>
<label for="learning_resources_1">
    <span>Other or specify</span>
    <input class="other" type="text" name="learning_resources_other" id="learning_resources">
</label>
<br>
<label for="built_things">What have you built?​ Please share links if you have.</label>
<br>
<textarea name="built_things" id="built_things"></textarea>
<br>
<label for="email">Write your email here if you want to talk more about your needs</label>
<br>
<input type="text" name="email" id="email">
<br>
```

# Format

```
- name: question text
	type
		option 1
		option 2
```

Explanation:

1. `- ` is a question delimiter
1. `:` delimites name and question text
1. `name` is the name for the inputs
1. `question text` is the question text
1. `type` can be `text`, `checkbox`, `radio`, `textarea`
1. `option_1` and `option_2` are the texts to display as options

# Usage
 
 ```html
 	<form class='h'>
 	- age: What is your age?
 	- cookies: Do you like cookies?
 		radio
 			Yes
 			No
 	- weather: What weather do you like?
 		checkbox
 			Cold
 			Hot
 	</form>
 	<script src='path/to/hacker_form.js'>
 ```

 Example on `index.jade`.

# How to run

I use npm serve package:

```
npm i -g serve
serve
```

To watch for file changes I use [guard livereload](https://github.com/guard/guard-livereload) on Ubuntu:

1. Install gem and generate Guardfile
1. Add extensions you want the browser to reload when there is a change in files with that extensions
1. Run guard in the folder
1. Install [LiveReload for Chrome](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei?hl=en).
1. Go to [localhost:3000/index.jade](http://localhost:3000/index.jade)
1. Click on the extension icon

# Compile and Watch

Compile with `coffee -co dist .`

Watch with `coffee -wo dist .`

# TODO

