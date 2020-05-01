require 'open-uri'
class RemotiveService
  # def initialize
  # end

  def call(user)
    url = open("https://remotive.io/api/remote-jobs").read
    @json_remotive =  JSON.parse(url)
    @count_jobs = @json_remotive["job_count"]

    @results = @json_remotive["jobs"].take(5).each do |job|
      Mission.create!(title: job['title'], description: job["description"], company:  job['company_name'], location: job["candidate_required_location"], url: job["url"], salary: job["salary"], user: user)
      # job['category']
      # job['tags']
      # job['job_type']
      # job["publication_date"]

    end
  end

end
