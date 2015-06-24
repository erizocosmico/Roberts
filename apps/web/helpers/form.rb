module Web::Helpers
  module Form
    FormField = Struct.new(:value, :error)

    # Saves the a form on the session with the values of the params with the given keys and the error for every of them if any.
    #
    # @param form_name Symbol name of the form
    # @param params Params lotus params passed to the action
    # @param keys Array array with all the form field keys
    # @param errors Hash hash containing all errors
    def save_form(form_name, params, keys, errors)
      form = {}
      keys.each do |k|
        form[k] = FormField.new(params[k], false)
      end

      errors.each do |e|
        form[e.attribute.to_sym].error = true
      end

      form_name = ('saved_form_' + form_name.to_s).to_sym
      @_env['rack.session'][form_name] = form
    end

    # Retrieves the previously saved data of a form with the given
    # name and passes it to the block. After that, the data of the
    # form is deleted from the session.
    #
    # @param name [Symbol]
    # @param blk [Proc]
    def with_form(name, &blk)
      name = ('saved_form_' + name.to_s).to_sym
      form = @_env['rack.session'][name]
      if form then blk.call(form) end
      @_env['rack.session'].delete name
    end
  end
end