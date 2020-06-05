h = 2
q = 1
e = 0.5
s = 0.25

pausaPassagemUm=-1
define :passagemUm do |root, repeats|
  repeats.times do
    in_thread do
      loop do
        
        if (pausaPassagemUm<0)
          #Começo Repetição
          use_synth :tb303
          use_synth_defaults sustain: q+e, release: q
          play (ring :d2,:e2,:c2,:a1).tick
          sleep h
          #Fim Repetição
          
        else
          stop
          
        end
        
      end
    end
    
  end
end

pausaPassagemDois=-1
define :passagemDois do |root, repeats|
  repeats.times do
    in_thread do
      loop do
        
        if (pausaPassagemDois<0)
          #Começo Repetição
          sample :bd_haus, rate: 1
          sleep 0.5
          #Fim Repetição
          
        else
          stop
          
        end
        
      end
    end
    
  end
end

pausaPassagemTres=-1
define :passagemTres do |root, repeats|
  repeats.times do
    in_thread do
      loop do
        
        if (pausaPassagemTres<0)
          #Começo Repetição
          tick
          use_synth :saw
          play (knit :d3,4,:e3,4,:c3,4,:a3,4).look
          sleep (ring e+s,e,s,e).look
          #Fim Repetição
          
        else
          stop
          
        end
        
      end
    end
    
  end
end

pausaPassagemQuatro=-1
define :passagemQuatro do |root, repeats|
  repeats.times do
    in_thread do
      loop do
        
        if (pausaPassagemQuatro<0 )
          #Começo Repetição
          tick
          sample :sn_dolf if (ring 1,1,0,1,1,0).look == 1
          sample :drum_cymbal_open if (ring 0,0,1,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0).look == 1
          sleep 0.25
          #Fim Repetição
          
        else
          stop
          
        end
        
      end
    end
    
  end
end


pausaPassagemCinco=-1
p_kik = (ring 1,0,0,1,0,3,0,0)
p_sna = (ring 0,0,1,0,0,0,1,0)
p_hat = (ring 1,1,5,5,3,4,5,3)
fill = 0
f_tom = (ring 4,4,4,4,4,4,4,4)
f_kik = (ring 0,3,3,0,3,0,4,4)
f_sna = (ring 5,3,0,5,6,7,0,5)
define :passagemCinco do |root, repeats|
  repeats.times do
    in_thread do
      loop do
        
        if (pausaPassagemCinco<0 )
          #Começo Repetição
          tick
          sample :drum_bass_hard if one_in(p_kik.look)
          sample :drum_snare_hard if one_in(p_sna.look)
          sample (knit :drum_cymbal_closed,5, :drum_cymbal_pedal,1).choose if one_in(p_hat.look)
          
          sleep 0.25
          #Fim Repetição
          
        else
          stop
          
        end
        
      end
    end
    
  end
end



passagemUm :e3, 1
sleep 7
passagemDois :e3, 1
sleep 5
passagemTres :e3, 1
sleep 5
passagemQuatro :e3, 1
sleep 2
pausaPassagemQuatro=1
sleep 2
pausaPassagemQuatro=-1
passagemCinco :e3, 1
sleep 25
pausaPassagemQuatro=1
pausaPassagemDois=1
pausaPassagemCinco=1
sleep 7
pausaPassagemUm=1
sleep 3
pausaPassagemTres=1
