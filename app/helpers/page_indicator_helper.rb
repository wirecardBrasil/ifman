module PageIndicatorHelper

  def page_indicator(page_name)
    %Q( <span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span> #{page_name}).html_safe
  end
end
