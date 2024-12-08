require 'cocoapods-core'

module Pod
  class Podfile
    module DSL

      def apply_modular_headers_for_swift_dependencies(installer = nil)
        if installer.nil?
          pre_install do |pre_installer|
            _apply_modular_headers_for_swift_dependencies(pre_installer)
          end
        else
          _apply_modular_headers_for_swift_dependencies(installer)
        end
      end

      private def _apply_modular_headers_for_swift_dependencies(installer)
        Pod::UI.info "[Modular Headers] ".blue << "Enabling modular headers for Swift dependencies ✨"
        installer.analysis_result.pod_targets.each do |spec|
          if spec.dependent_targets.empty?
            next
          end

          if spec.all_files.any? { |file| file.extname == '.swift' }
            Pod::UI.info "[Modular Headers] ".blue << "Applying modular headers for #{spec}."
            Pod::UI.info "[Modular Headers] ".blue << "Dependent targets: #{spec.dependent_targets}"
            spec.dependent_targets.each do |target|
              root_spec_name = target.name.partition('/').first
              @current_target_definition.set_use_modular_headers_for_pod(root_spec_name, true)
            end
          end
        end
      end
    end
  end
end
