module I18nLazyScope::ActionView
  module Helper
    def lazy_scope
      [:views, view_path]
    end

  private

    def view_path
      if @virtual_path
        @virtual_path.gsub(%r{/_?}, ".")
      else
        raise "Cannot use lazy lookup because template path is not available"
      end
    end
  end
end
