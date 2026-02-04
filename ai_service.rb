class AiService
  def call(user_prompt)
    response = ''
    model = Rllama.load_model('models/llama-3.2-1b-instruct-q8_0.gguf')
    result = model.generate(user_prompt) do |token|
      Glimmer::LibUI::queue_main { yield token }
    end
    model.close
    result.text
  end
end