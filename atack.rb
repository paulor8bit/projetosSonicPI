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



passagemUm :e3, 1
sleep 5
passagemDois :e3, 1
sleep 5
passagemTres :e3, 1
sleep 5
pausaPassagemUm=1
passagemQuatro :e3, 1
sleep 2
pausaPassagemQuatro=1
sleep 2
pausaPassagemUm=-1
pausaPassagemQuatro=-1
passagemUm :e3, 1
passagemQuatro :e3, 1
sleep 7
pausaPassagemQuatro=1
pausaPassagemDois=1
pausaPassagemUm=1
sleep 2
pausaPassagemTres=1
