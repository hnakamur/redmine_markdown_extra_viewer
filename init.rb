require 'redmine'
require 'rdiscount'

RepositoriesController.class_eval do
  alias markdown_extra_viewer_orig_entry entry
  def entry
    markdown_extra_viewer_orig_entry
    if not performed? and @path =~ /\.(md|mkdn|markdown)\z/
      @content = RDiscount.new(@content).to_html
      render :action => "entry_markdown"
    end
  end
end

Redmine::Plugin.register :redmine_markdown_extra_viewer do
  name 'Redmine Markdown Extra Viewer plugin'
  author 'Hiroaki Nakamura'
  description 'Redmine show Markdown Extra in repository'
  version '0.0.1'
  url 'http://github.com/hnakamur/redmine_markdown_extra_viewer'
  author_url 'http://github.com/hnakamur'
end
