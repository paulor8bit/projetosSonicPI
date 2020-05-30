
h = 2
q = 1
e = 0.5
s = 0.25
live_loop :synth2 do
  use_synth :tb303
  use_synth_defaults sustain: q+e, release: q
  play (ring :d2,:e2,:c2,:a1).tick
  sleep h
end

live_loop :flibble do
  sample :bd_haus, rate: 1
  sleep 0.5
end


with_fx :reverb do
  live_loop :synth1 do
    tick
    use_synth :saw
    play (knit :d3,4,:e3,4,:c3,4,:a3,4).look
    sleep (ring e+s,e,s,e).look
  end
end

blast = (ring 1,1,1,1,1,1,1,1)
kik = (ring 1,0,0,0,1,0,0,0)

#Beat:
live_loop :drums do
  tick
  sample :sn_dolf if (ring 1,1,0,1,1,0).look == 1
  sample :drum_cymbal_open if (ring 0,0,1,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0).look == 1
  sleep 0.25
end

