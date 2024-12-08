require 'cocoapods-core'

module CocoaPodsModularHeaders
  class << self
    # Register for the pre-install hooks to setup & run Keys
    Pod::HooksManager.register('cocoapods-keys', :pre_install) do |installer|
      CocoaPodsModularHeaders.setup(installer)
    end

    def setup(installer)
      UI.info "[Modular Headers] ".blue << "Enabling modular headers for Swift dependencies ✨"

      installer.analysis_result.pod_targets.each do |spec|
        if spec.dependent_targets.empty?
          next
        end

        if spec.all_files.any? { |file| file.extname == '.swift' }
          UI.info "[Modular Headers] ".blue << "Applying modular headers for #{spec}."
          UI.info "[Modular Headers] ".blue << "Dependent targets: #{spec.dependent_targets}"
          spec.dependent_targets.each do |target|
            root_spec_name = target.name.partition('/').first
            @current_target_definition.set_use_modular_headers_for_pod(root_spec_name, true)
          end
        end
      end
    end

  end
end
