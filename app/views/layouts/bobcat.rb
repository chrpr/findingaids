# app/views/layouts/bobcat.rb
module Views
  module Layouts
    class Bobcat < ActionView::Mustache
      def meta
        meta = '<!-- Mobile viewport optimization h5bp.com/ad -->
        <meta name="HandheldFriendly" content="True">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">

        <!-- Mobile IE allows us to activate ClearType technology for smoothing fonts for easy reading -->
        <meta http-equiv="cleartype" content="on">'.html_safe
        meta << tag("link", 
                :rel => "search", 
                :type => "application/opensearchdescription+xml", 
                :title =>  application_name,
                :href => opensearch_catalog_path(:format => 'xml', :only_path => false)
                )
        meta << favicon_link_tag('https://library.nyu.edu/favicon.ico')
        meta << csrf_meta_tags
        meta << raw(render_head_content)
      end
      
      def title 
        "Search"
      end

      def stylesheets
        catalog_stylesheets = stylesheet_link_tag "http://fonts.googleapis.com/css?family=Muli"
        catalog_stylesheets += stylesheet_link_tag "application"
      end

      def javascripts
        catalog_javascripts = javascript_include_tag "application"
      end

      def application
        application = link_to application_name, root_path
        application << (params[:controller] == "catalog" and !params[:id]) ? content_tag(:span, t('blacklight.search.search_results'), :id => 'results_text') : ""
      end
      
      def sidebar
        render :partial => "catalog/sidebar"
      end
      
      def breadcrumbs
        breadcrumbs = super
        breadcrumbs << link_to('Catalog', {:controller =>'catalog'})
        breadcrumbs << link_to_unless_current(controller.controller_name.humanize) unless controller.controller_name.eql? "catalog"
        return breadcrumbs
      end
      
      def footer

      end
      
      def prepend_body
        prepend_body = '<div class="modal-container"></div>'.html_safe
        prepend_body << '<div id="ajax-modal" class="modal hide fade" tabindex="-1"></div>'.html_safe
      end
      
      # Prepend search box to yield
      def prepend_yield
        
        prepend_yield = render :partial => 'shared/header_navbar'
      
        prepend_yield += content_tag :div, :id => "main-flashses" do
         render :partial => '/flash_msg'
        end
        
        return prepend_yield.html_safe
      end
      
      def onload
        "$('input#q').focus();" if params[:q].to_s.empty? and params[:f].to_s.empty? and params[:id].nil?
      end
      
      def body_class
       
      end
      
    end
  end
end