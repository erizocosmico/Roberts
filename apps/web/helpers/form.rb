# encoding: utf-8
module Web::Helpers
# encoding: utf-8
  module Form
# encoding: utf-8
    FormField = Struct.new(:value, :error)
# encoding: utf-8

# encoding: utf-8
    # Saves the a form on the session with the values of the params with the given keys and the error for every of them if any.
# encoding: utf-8
    #
# encoding: utf-8
    # @param form_name Symbol name of the form
# encoding: utf-8
    # @param params Params lotus params passed to the action
# encoding: utf-8
    # @param keys Array array with all the form field keys
# encoding: utf-8
    # @param errors Hash hash containing all errors
# encoding: utf-8
    def save_form(form_name, params, keys, errors)
# encoding: utf-8
      form = {}
# encoding: utf-8
      keys.each do |k|
# encoding: utf-8
        form[k] = FormField.new(params[k], false)
# encoding: utf-8
      end
# encoding: utf-8

# encoding: utf-8
      errors.each do |e|
# encoding: utf-8
        form[e.attribute.to_sym].error = true
# encoding: utf-8
      end
# encoding: utf-8

# encoding: utf-8
      form_name = ('saved_form_' + form_name.to_s).to_sym
# encoding: utf-8
      @_env['rack.session'][form_name] = form
# encoding: utf-8
    end
# encoding: utf-8

# encoding: utf-8
    # Retrieves the previously saved data of a form with the given
# encoding: utf-8
    # name and passes it to the block. After that, the data of the
# encoding: utf-8
    # form is deleted from the session.
# encoding: utf-8
    #
# encoding: utf-8
    # @param name [Symbol]
# encoding: utf-8
    # @param blk [Proc]
# encoding: utf-8
    def with_form(name, &blk)
# encoding: utf-8
      name = ('saved_form_' + name.to_s).to_sym
# encoding: utf-8
      form = @_env['rack.session'][name]
# encoding: utf-8
      if form then blk.call(form) end
# encoding: utf-8
      @_env['rack.session'].delete name
# encoding: utf-8
    end
# encoding: utf-8
  end
# encoding: utf-8
end
