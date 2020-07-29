module ApplicationHelper

  def bread_crumb(&block)
    render layout: 'shared/bread_crumb', &block
  end

  def root_crumb
    '首页'
  end

  def ajax_flash
    name = flash.keys.first
    message = flash[name]
    toastr_js_tag(name, message)
  end

  private

  def toastr_js_tag(name, message)
    return unless message

    name = 'info' if name == 'notice'
    "toastr.#{name}('#{message}')".html_safe
  end

end
