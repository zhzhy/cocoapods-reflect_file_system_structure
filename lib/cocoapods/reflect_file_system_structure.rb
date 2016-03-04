module Pod
  class Installer
    class FileReferencesInstaller
      def add_file_accessors_paths_to_pods_group(file_accessor_key, group_key = nil, reflect_file_system_structure_for_development = false)
        file_accessors.each do |file_accessor|
          pod_name = file_accessor.spec.name
          local = sandbox.local?(pod_name)
          paths = file_accessor.send(file_accessor_key)
          paths = allowable_project_paths(paths)
          paths.each do |path|
            group = pods_project.group_for_spec(file_accessor.spec.name, group_key)
            pods_project.add_file_reference(path, group, true)
          end
        end
      end

      def allowable_project_paths(paths)
        lproj_paths = Set.new
        lproj_paths_with_files = Set.new
        allowable_paths = paths.select do |path|
          path_str = path.to_s

          # We add the directory for a Core Data model, but not the items in it.
          next if path_str =~ /.*\.xcdatamodeld\/.+/i

          # We add the directory for a Core Data migration mapping, but not the items in it.
          next if path_str =~ /.*\.xcmappingmodel\/.+/i

          # We add the directory for an asset catalog, but not the items in it.
          next if path_str =~ /.*\.xcassets\/.+/i

          if path_str =~ /\.lproj(\/|$)/i
            # If the element is an .lproj directory then save it and potentially
            # add it later if we don't find any contained items.
            if path_str =~ /\.lproj$/i && path.directory?
              lproj_paths << path
              next
            end

            # Collect the paths for the .lproj directories that contain files.
            lproj_path = /(^.*\.lproj)\/.*/i.match(path_str)[1]
            lproj_paths_with_files << Pathname(lproj_path)

            # Directories nested within an .lproj directory are added as file
            # system references so their contained items are not added directly.
            next if path.dirname.dirname == lproj_path
          end

          true
        end

        # Only add the path for the .lproj directories that do not have anything
        # within them added as well. This generally happens if the glob within the
        # resources directory was not a recursive glob.
        allowable_paths + lproj_paths.subtract(lproj_paths_with_files).to_a
      end
      
    end
  end
end
