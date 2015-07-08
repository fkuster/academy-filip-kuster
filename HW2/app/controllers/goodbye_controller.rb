class GoodbyeController < ApplicationController
  def bye
    @goodbye_messages = ["Here's to good cheer.",
       "When I see your smile, and I know it’s not for me, that’s when I’ll miss you.",
       "Farewell! God knows when we shall meet again.",
       "When your dreams turn to dust, it’s time to vacuum.",
       "You dont like site without CSS?:("
       ]

  end
end
