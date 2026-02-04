require "glimmer-dsl-libui"
# Only for dev mode: after glimmer DSL to prevent errors
require "bundler/setup"
require "rllama"
require "pry"
require_relative './ai_service'

class AiChatApp
  include Glimmer
  attr_accessor :user_prompt, :ai_response

  def initialize
    self.user_prompt = ''
    self.ai_response = ''
  end

  def launch
    window('Ai Chat App', 600, 700) {
      margined true
      vertical_box {
        vertical_box {
          multiline_entry {
            text <=> [self, :user_prompt]
          }
          button('Send message') {
            stretchy false
            on_clicked do
              input = user_prompt
              self.ai_response = ''
              self.user_prompt = ''
              Thread.new do
                AiService.new.call(input) do |ai_chunk|
                  self.ai_response += ai_chunk
                end
              end
            end
          }
        }
        vertical_box {
          multiline_entry {
            read_only true
            text <= [self, :ai_response]
          }
        }
      }
    }.show
  end
end

AiChatApp.new.launch