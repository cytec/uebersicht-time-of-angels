
command: "date +%H:%M:%S"

# Set the refresh frequency (milliseconds).
refreshFrequency: 1000

style: """
  top: 0%
  left: 0%
  width: 100%
  height: 100%

  .background
    top: 0%
    left: 0%
    height: 100%
    width: 100%
    position: absolute
    z-index:-1
    background-image: url('time-of-angels.widget/images/001.png')
    background-size: cover
    background-position: center center
    transition: all linear .5s

  .clock
      bottom: 6%
      right: 0
      position: absolute
      color: rgba(245,235,255,0.8)
      text-shadow: 0 0 10px #000
      background: rgba(0,0,0,0.5)
      padding: 0 2%
      font-size: 600%
      font-family: "Ayuthaya"
"""

render: (output) -> """
<div class='background' data-show='false'>
<div class='clock'>#{output}</div>
</div>
"""

update: (output, domEl) ->
  min = output.split(":")[1].split("")[1]
  bgEl = $(domEl).find('.background')
  minEndByNine = min % 10 == 9
  $(domEl).find('.clock').text output

  if minEndByNine == true && bgEl.data("show") == false
    bgEl.css "background-image", "url('time-of-angels.widget/images/002.png')"
    bgEl.data("show", true)

  if minEndByNine == false && bgEl.data("show") == true
    bgEl.css "background-image", "url('time-of-angels.widget/images/001.png')"
    bgEl.data("show", false)
