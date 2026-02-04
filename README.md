# Ruby local ai chat app

Use any local AI model from huggingface etc, in .gguf format.

### Installation guide

Requires Glimmer DSL Lib UI installed.

`gem install glimmer-dsl-libui`

Download code

`git clone https://github.com/indigotechtutorials/ruby-localai-chat`

Cd into codebase

`cd ruby-localai-chat`

Install dependencies 
`bundle install`

Start the app

`ruby app.rb`

### Download models

To use this you must download a model first from huggingface in .gguf format and put in the codebase then change the code in the ai_service.rb to use your new model.