class DocsController < ApplicationController
  def index
    start_time = Time.current

    docs = Doc.where(status: ['draft','sent'],
                     sender_reference: ['Custom/1175', 'Client/362', 'Custom/280'])
               .limit(20)

    end_time = Time.current
    query_time = (end_time - start_time) * 1000 # milliseconds

    result = "Query executed in #{query_time.round(2)} ms\n\n"
    result += "Documents:\n"
    docs.each do |doc|
      result += "- #{doc.id}: #{doc.status}, #{doc.sender_reference}\n"
    end

    render plain: result
  end
end
