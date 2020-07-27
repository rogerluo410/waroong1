module ApplicationHelper

  def bread_crumb(&block)
    render layout: 'shared/bread_crumb', &block
  end

  def root_crumb
    '首页'
  end

end
