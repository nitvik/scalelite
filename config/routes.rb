# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope 'bigbluebutton/api', as: 'bigbluebutton_api', format: false, defaults: { format: 'xml' } do
    post '/', to: 'bigbluebutton_api#index'
    post 'isMeetingRunning', to: 'bigbluebutton_api#is_meeting_running', as: :is_meeting_running
    post 'getMeetingInfo', to: 'bigbluebutton_api#get_meeting_info', as: :get_meeting_info
    post 'getMeetings', to: 'bigbluebutton_api#get_meetings', as: :get_meetings
    post 'create', to: 'bigbluebutton_api#create', as: :create
    post 'end', to: 'bigbluebutton_api#end'
    get 'join', to: 'bigbluebutton_api#join'
    post 'getRecordings', to: 'bigbluebutton_api#get_recordings', as: :get_recordings
    post 'publishRecordings', to: 'bigbluebutton_api#publish_recordings', as: :publish_recordings
    post 'updateRecordings', to: 'bigbluebutton_api#update_recordings', as: :update_recordings
    post 'deleteRecordings', to: 'bigbluebutton_api#delete_recordings', as: :delete_recordings
  end

  get 'health_check', to: 'health_check#all'

  match '*any', via: :all, to: 'errors#unsupported_request'
  root to: 'errors#unsupported_request', via: :all
end
