class ActionView::Helpers::FormBuilder

  # default value to use for submit button's :disable_with option
  def default_disable_with()
    object = convert_to_model(@object)
    key    = object ? (object.persisted? ? :updating : :creating) : :submitting
    model  = object.class.respond_to?(:model_name) ? object.class.model_name.human :  @object_name.to_s.humanize
    defaults = []
    defaults << :"helpers.submit.#{object_name}.#{key}"
    defaults << :"helpers.submit.#{key}"
    defaults << "#{key.to_s.humanize} #{model}..."
    I18n.t(defaults.shift, model: model, default: defaults)
  end

  # Submit button with cancel link
  def submit_or_cancel(options = {})
    cancel_path = options.delete(:cancel_path)
    disable_with = options.delete(:disable_with) || default_disable_with
    cancel_button = cancel_path ? @template.link_to('Cancel', cancel_path, class: 'button silver cancel') : ''
    submit_button = button :submit, options.merge({ class: 'blue text-center', data: { disable_with: disable_with } })
    @template.content_tag :div, class: 'button_group' do
      submit_button + cancel_button
    end
  end
end
