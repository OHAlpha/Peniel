module Detailed extend ActiveSupport::Concern

  included do

    def detail_simple
      ns = icols
      vs = irow
      out = ''
      for i in ns.size do
        out += '<strong>' + ns[i] + '</strong>: ' + vs[i].to_s + '<br/>'
      end
    end
  
  end

end
