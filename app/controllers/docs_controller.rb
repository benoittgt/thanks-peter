class DocsController < ApplicationController
  def index
    start_time = Time.current

    docs = Doc.where(status: ['draft','sent'],
                     sender_reference: ['Custom/1175', 'Client/362', 'Custom/280'])
               .order(sent_at: :desc)
               .limit(20)
               .to_a # force the query to be executed

    query_time = (Time.current - start_time)

    postgresql_version = ActiveRecord::Base.connection.raw_connection.server_version
    result = "On PostgreSQL #{postgresql_version}. Query executed in #{query_time.round(2)} seconds\n\n"
    result += "Documents:\n"
    docs.each do |doc|
      result += "- #{doc.id}: #{doc.status}, #{doc.sender_reference}\n"
    end

    render plain: result
  end
end
