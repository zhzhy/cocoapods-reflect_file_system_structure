require "cocoapods/reflect_file_system_structure/version"

module Pod
  class Project < Xcodeproj::Project
    def add_file_reference(absolute_path, group, reflect_file_system_structure = false)
      file_path_name = absolute_path.is_a?(Pathname) ? absolute_path : Pathname.new(absolute_path)
      group = group_for_path_in_group(file_path_name, group, true)

      if ref = reference_for_path(file_path_name.realpath)
        ref
      else
        ref = group.new_file(file_path_name.realpath)
        @refs_by_absolute_path[absolute_path.to_s] = ref
      end
    end
  end
end
