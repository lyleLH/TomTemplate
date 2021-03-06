require 'xcodeproj'

module Pod
  #工程配置
  class ProjectManipulator
    attr_reader :configurator, :xcodeproj_path, :platform, :string_replacements, :prefix

    def self.perform(options)
      new(options).perform
    end

    def initialize(options)
      @xcodeproj_path = options.fetch(:xcodeproj_path)
      @configurator = options.fetch(:configurator)
      @platform = options.fetch(:platform)
      @prefix = options.fetch(:prefix)
    end

    def run
      @string_replacements = {
        "PROJECT_OWNER" => @configurator.user_name,
        "TODAYS_DATE" => @configurator.date,
        "TODAYS_YEAR" => @configurator.year,
        "PROJECT" => @configurator.pod_name,
        "CPD" => @prefix
      }
      #文件内容替换
      replace_internal_project_settings
      #文件名称替换
      rename_files
      #文件夹名称替换
      rename_project_folder
    end

    def project_folder
      File.dirname @xcodeproj_path
    end

    def rename_files
      # shared schemes have project specific names
      scheme_path = project_folder + "/PROJECT.xcodeproj/xcshareddata/xcschemes/"
      File.rename(scheme_path + "PROJECT.xcscheme", scheme_path +  @configurator.pod_name + ".xcscheme")

      # rename xcproject
      File.rename(project_folder + "/PROJECT.xcodeproj", project_folder + "/" +  @configurator.pod_name + ".xcodeproj")

      #rename file
      rename_filesWith(project_folder,"PROJECT",@configurator.pod_name)
      rename_filesWith(project_folder,"CPD",@prefix)

      # rename project related files
      ["PROJECT-Info.plist", "PROJECT-Prefix.pch"].each do |file|
        before = project_folder + "/PROJECT/" + file
        next unless File.exists? before

        after = project_folder + "/PROJECT/" + file.gsub("PROJECT", @configurator.pod_name)
        File.rename before, after
      end
    end

    def rename_project_folder
      # if Dir.exist? project_folder + "/PROJECT"
      #   File.rename(project_folder + "/PROJECT", project_folder + "/" + @configurator.pod_name)
      # end
      rename_folderWith(project_folder,"PROJECT",@configurator.pod_name)
      rename_folderWith(project_folder,"CPD",@prefix)
    end

    def replace_internal_project_settings
      Dir.glob(project_folder + "/**/**/**/**").each do |name|
        next if Dir.exists? name
        text = File.read(name)

        for find, replace in @string_replacements
            text = text.gsub(find, replace)
        end

        File.open(name, "w") { |file| file.puts text }
      end
    end

    #重命名文件夹名称
    def rename_folderWith(filePath,oldName,newName)
      if File.directory? filePath  
        Dir.foreach(filePath) do |file|
          nextFilePath = filePath + "/" + file
          if file!="." and file!=".."  and File.directory? nextFilePath
            rename_folderWith(nextFilePath,oldName,newName)
            basename = File.basename(nextFilePath)
            if basename.include?oldName
              before = File.dirname(nextFilePath)+"/"+basename
              after = File.dirname(nextFilePath)+"/"+basename.gsub(oldName, newName)
              File.rename before, after
            end
          end  
        end 
      end
    end

    # 重命名某个文件夹下文件名(模糊)
    def rename_filesWith(filePath,oldName,newName)
      if File.directory? filePath  
        Dir.foreach(filePath) do |file|  
          if file!="." and file!=".."  
            rename_filesWith(filePath+"/"+file,oldName,newName)
          end  
        end  
      else
        fileName = File.basename(filePath)
        if fileName.include?oldName
          before = File.dirname(filePath)+"/"+fileName
          after = File.dirname(filePath)+"/"+fileName.gsub(oldName, newName)
          File.rename before, after
        end
      end  
    end
  end
end
