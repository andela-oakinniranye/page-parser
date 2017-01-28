class PageIndexerJob < ApplicationJob
  queue_as :default

  rescue_from(StandardError) do
    # retry counter in the db
    arguments.first.increment!(:retries)

    retry_job wait: 5.minutes, queue: :default
  end

  def perform(link)
    service = IndexingService.new(link)
    service.index_content!
  end
end
