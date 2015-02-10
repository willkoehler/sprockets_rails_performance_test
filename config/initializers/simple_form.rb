# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  # Wrappers are used by the form builder to generate a
  # complete input. You can remove any component from the
  # wrapper, change the order or even add your own to the
  # stack. The options given below are used to wrap the
  # whole input.

  # The default wrapper to be used by the FormBuilder.
  config.default_wrapper = :default
  
  config.wrappers :default, :tag => :div, :class => 'input', :error_class => 'field_with_errors' do |b|
    ## Extensions enabled by default
    # Any of these extensions can be disabled for a
    # given input by passing: `f.input EXTENSION_NAME => false`.
    # You can make any of these extensions optional by
    # renaming `b.use` to `b.optional`.

    #-- WCK Disable HTML5. Certain HTML5 attributes, such as tel, cause "Assertion Failed"
    #-- errors in the Safari console. This also causes simple_form to insert the required='required'
    #-- attribute in required fields which triggers Rails UJS to block form submit when required
    #-- fields are blank
    b.optional :html5
    # Calculates placeholders automatically from I18n
    # You can also pass a string as f.input :placeholder => "Placeholder"
    b.use :placeholder
    # Calculates maxlength from length validations for string inputs
    b.use :maxlength
    # Calculates pattern from format validations for string inputs
    b.optional :pattern
    # Calculates min and max from length validations for numeric inputs
    b.optional :min_max
    # Calculates readonly automatically from readonly attributes
    b.optional :readonly
    ## Inputs
    b.use :label_input
    b.use :hint, :wrap_with => { :tag => :div, :class => 'hint' }
    b.use :error, :wrap_with => { :tag => :div, :class => 'error' }
  end

  config.wrappers :inline_fields, :tag => :div, :class => 'input inline_fields', :error_class => 'field_with_errors' do |b|
    b.use :label
    b.wrapper :controls, :tag => :div, :class => 'controls' do |ba|
      ba.use :input
      ba.use :hint, :wrap_with => { :tag => :div, :class => 'hint' }
      ba.use :error, :wrap_with => { :tag => :div, :class => 'error' }
    end
  end
  
  config.wrappers :bubble_group, :tag => :div, :class => 'input bubble_group', :error_class => 'field_with_errors' do |b|
    b.use :label
    b.wrapper :controls, :tag => :div, :class => 'controls' do |ba|
      ba.use :input
    end
  end
  
  # Define the way to render check boxes / radio buttons with labels.
  # Defaults to :nested for bootstrap config.
  #   :inline => input + label
  #   :nested => label > input
  config.boolean_style = :nested

  # Default class for buttons
  config.button_class = 'button'

  # Method used to tidy up errors. Specify any Rails Array method.
  # :first lists the first message for each field.
  # Use :to_sentence to list all errors for each field.
  # config.error_method = :first

  # Default tag used for error notification helper.
  config.error_notification_tag = :div

  # CSS class to add for error notification helper.
  config.error_notification_class = 'alert alert-error'

  # ID to add for error notification helper.
  # config.error_notification_id = nil

  # Series of attempts to detect a default label method for collection.
  # config.collection_label_methods = [ :to_label, :name, :title, :to_s ]

  # Series of attempts to detect a default value method for collection.
  # config.collection_value_methods = [ :id, :to_s ]

  # You can wrap a collection of radio/check boxes in a pre-defined tag, defaulting to none.
  config.collection_wrapper_tag = :div

  # You can define the class to use on all collection wrappers. Defaulting to none.
  config.collection_wrapper_class = :controls

  # You can wrap each item in a collection of radio/check boxes with a tag,
  # defaulting to :span. Please note that when using :boolean_style = :nested,
  # SimpleForm will force this option to be a label.
  # config.item_wrapper_tag = :span

  # You can define a class to use in all item wrappers. Defaulting to none.
  # config.item_wrapper_class = nil

  # How the label text should be generated altogether with the required text.
  # config.label_text = lambda { |label, required| "#{required} #{label}" }

  # You can define the class to use on all labels. Default is nil.
  config.label_class = 'control-label'

  # You can define the class to use on all forms. Default is simple_form.
  # config.form_class = :simple_form

  # You can define which elements should obtain additional classes
  # config.generate_additional_classes_for = [:wrapper, :label, :input]

  # Whether attributes are required by default (or not). Default is true.
  # config.required_by_default = true

  # Tell browsers whether to use default HTML5 validations (novalidate option).
  # Default is enabled.
  config.browser_validations = false

  # Collection of methods to detect if a file type was given.
  # config.file_methods = [ :mounted_as, :file?, :public_filename ]

  # Custom mappings for input types. This should be a hash containing a regexp
  # to match as key, and the input type that will be used when the field name
  # matches the regexp as value.
  # config.input_mappings = { /count/ => :integer }

  # Default priority for time_zone inputs.
  # config.time_zone_priority = nil

  # Default priority for country inputs.
  # config.country_priority = nil

  # Default size for text inputs.
  # config.default_input_size = 50

  # When false, do not use translations for labels.
  # config.translate_labels = true

  # Automatically discover new inputs in Rails' autoload path.
  # config.inputs_discovery = true

  # Cache SimpleForm inputs discovery
  # config.cache_discovery = !Rails.env.development?
end
