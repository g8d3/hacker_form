types = ['text', 'radio', 'checkbox', 'textarea']
questionHtml = (hcf) ->
	lines = hcf.split('\n')
	header = lines[0].split(': ')
	id = header[0]
	name_and_id = (n = '') -> "name='#{id}' id='#{id + n}'"
	label = header[1]
	typed = (type = (lines[1] || '').trim()) in types
	type = if typed then type else 'text'

	# Works as default
	_for = "for='#{id}'"
	
	if type == 'text'
		input = "<input type='text' #{name_and_id()}>"
		"<label #{_for}>#{label}</label><br/>" + input  + "<br/>"
	else if type == 'textarea'
		input = "<textarea #{name_and_id()}></textarea>"
		"<label #{_for}>#{label}</label><br/>" + input + "<br/>"

	else
		options = if typed then lines.slice(2) else lines.slice(1)
		options.pop() # Empty String
		input = ''
		
		for option, i in options
			_for = "for='#{id}_#{i}'"
			input += "<label #{_for}>"
			hOption = "\n<span>#{option.trim()}</span>"

			if option == options[options.length - 1] and option.match(/\sother/i)
				input += "#{hOption} <input class='other' type='text' name='#{id}_other' id='#{id}'>"
			else
				input += "<input type='#{type}' #{name_and_id('_' + i)}>#{hOption}" 
			
			input += "</label><br/>"
		
		"<p>#{label}</p>" + input

render = (form) ->
	hcf = form.text()
	questions = hcf.split("- ").slice(1)
	html = ''
	for question in questions
		html += questionHtml(question)
	form.html html

render $('form.h')