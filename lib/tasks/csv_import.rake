# frozen_string_literal: true

namespace :csv_import do
  desc 'Import Movies CSV records to the queue'
  task :movies, [:file] => :environment do |_task, args|
    import_csv(args[:file], MovieImportWorkerJob, chunk_size: 500, key_mapping: { movie: :title })
  end

  desc 'Import Reviews CSV records to the queue'
  task :reviews, [:file] => :environment do |_task, args|
    import_csv(args[:file], ReviewImportWorkerJob, chunk_size: 500)
  end

  def import_csv(file_path, worker_class, options = {})
    if file_path.nil?
      puts 'Usage: rake csv_import:movies[file_path]' if worker_class == MovieImportWorkerJob
      puts 'Usage: rake csv_import:reviews[file_path]' if worker_class == ReviewImportWorkerJob
      exit
    end

    begin
      SmarterCSV.process(file_path, options) do |chunk|
        worker_class.perform_async(chunk.to_json)
      end
      puts "Done importing #{worker_class.name} from #{file_path}"
    rescue StandardError => e
      puts "Error importing #{worker_class.name} from #{file_path}: #{e.message}"
    end
  end
end
