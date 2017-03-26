

bpm = 120.0
one4th = 1.0/(bpm/60.0)

vol_rpg_low = 0.0
vol_rpg_high = 0.2
vol_snr = 1.0
vol_bd = 1.0
vol_hiss = 0.5
vol_saw = 0.7
vol_cym = 1.0
vol_prob = 1.0
vol_indi = 1.0
vol_bass = 0.5

bit_crusher_mix = 0.5

bass_attack = 0.04
bass_decay = 3.0

global_transpose = 12
mod_every = 2

halves_counter = 0

live_loop :bass do
  use_synth :tri
  3.times do
    sleep one4th/4.0
    play :C2, amp: 5*vol_bass, attack: bass_attack, decay: one4th/16*bass_decay, sustain: one4th/16, release: 0.1
    sleep 2*one4th/4.0
    play :G2, amp: 5*vol_bass, attack: bass_attack, decay: one4th/16*bass_decay, sustain: one4th/16, release: 0.1
    sleep 2*one4th/4.0
    play :C2, amp: 5*vol_bass, attack: bass_attack, decay: one4th/16*bass_decay, sustain: one4th/16, release: 0.1
    sleep 3*one4th/4.0
  end
  1.times do
    sleep one4th/4.0
    play :C2, amp: 5*vol_bass, attack: bass_attack, decay: one4th/16*bass_decay, sustain: one4th/16, release: 0.1
    sleep 2*one4th/4.0
    play :C2, amp: 5*vol_bass, attack: bass_attack, decay: one4th/16*bass_decay, sustain: one4th/16, release: 0.1
    sleep 2*one4th/4.0
    play :C2, amp: 5*vol_bass, attack: bass_attack, decay: one4th/16*bass_decay, sustain: one4th/16, release: 0.1
    sleep 3*one4th/4.0
  end
  3.times do
    sleep one4th/4.0
    play :C2, amp: 5*vol_bass, attack: bass_attack, decay: one4th/16*bass_decay, sustain: one4th/16, release: 0.1
    sleep 2*one4th/4.0
    play :G2, amp: 5*vol_bass, attack: bass_attack, decay: one4th/16*bass_decay, sustain: one4th/16, release: 0.1
    sleep 2*one4th/4.0
    play :C2, amp: 5*vol_bass, attack: bass_attack, decay: one4th/16*bass_decay, sustain: one4th/16, release: 0.1
    sleep 3*one4th/4.0
  end
  1.times do
    sleep one4th/4.0
    play :C2, amp: 5*vol_bass, decay: one4th/16, sustain: one4th/16*bass_decay, release: 0.1
    sleep 2*one4th/4.0
    play :C2, amp: 5*vol_bass, decay: one4th/16, sustain: one4th/16*bass_decay, release: 0.1
    sleep 2*one4th/4.0
    play :C2, amp: 5*vol_bass, decay: one4th/16, sustain: one4th/16*bass_decay, release: 0.1
    sleep 1*one4th/4.0
    play :C2, amp: 5*vol_bass, decay: one4th/16, sustain: one4th/16*bass_decay, release: 0.1
    sleep 1*one4th/4.0
    play :C2, amp: 5*vol_bass, decay: one4th/16, sustain: one4th/16*bass_decay, release: 0.1
    sleep 1*one4th/4.0
  end
end

live_loop :rpg do
  use_synth :sine
  1.times do
    with_fx :slicer, mix: 2.0/3.0, phase: one4th*2.0/3.0 do
      with_fx :echo, mix: 0.3, phase: one4th/4.0*3.0 do
        play :G4, pan: -0.2, amp: vol_rpg_low*1.0
        sleep one4th/3.0
        play :Ds3, amp: vol_rpg_low*1.0
        sleep one4th/3.0
        play :C3, pan: 0.2, amp: vol_rpg_low*1.0
        sleep one4th/3.0
      end
    end
  end
  7.times do
    if ((halves_counter+1) % (mod_every*4) == 0)
      tr = 1*global_transpose
    else
      tr = 0
    end
    with_transpose tr do
      with_fx :slicer, mix: 2.0/3.0, phase: one4th*2.0/3.0 do
        with_fx :echo, mix: 0.3, phase: one4th/4.0*3.0 do
          play :C3, pan: -0.2, amp: vol_rpg_low*1.0
          sleep one4th/3.0
          play :Ds3, amp: 1, amp: vol_rpg_low*1.0
          sleep one4th/3.0
          play :G3, pan: 0.2, amp: vol_rpg_low*1.0
          sleep one4th/3.0
        end
      end
    end
  end
end

live_loop :rpg_high do
  use_synth :beep
  7.times do
    with_fx :slicer, mix: 2.0/3.0, phase: one4th*1.0/3.0 do
      with_fx :echo, mix: 0.3, phase: one4th/4.0*6.0 do
        play :C5, pan: -0.2, amp: vol_rpg_high
        sleep one4th/4.0
        play :G5, amp: 1.2*vol_rpg_high
        sleep one4th/4.0
        play :Ds5, pan: 0.2, amp: vol_rpg_high
        sleep one4th/4.0
        play :As5, pan: 0.6, amp: vol_rpg_high
        sleep one4th/4.0
      end
    end
  end
  if ((halves_counter+1) % (mod_every*4) == 0)
    tr = 1*global_transpose
  else
    tr = 0
  end
  1.times do
    with_transpose tr do
      with_fx :slicer, mix: 2.0/3.0, phase: one4th*1.0/3.0 do
        with_fx :echo, mix: 0.3, phase: one4th/4.0*6.0 do
          play :C5, pan: -0.2, amp: vol_rpg_high
          sleep one4th/4.0
          play :G6, amp: 1*vol_rpg_high
          sleep one4th/4.0
          play :Ds5, pan: 0.2, amp: vol_rpg_high
          sleep one4th/4.0
          play :As5, pan: 0.6, amp: vol_rpg_high
          sleep one4th/4.0
        end
      end
    end
  end
end

live_loop :bd do
  4.times do
    sample :bd_haus, amp: 12*vol_bd
    sleep one4th
  end
end


live_loop :snr do
  7.times do
    sleep one4th
    with_fx :echo,
      mix: 0.01,
      rate: one4th*3.0/4.0,
    decay: 4*one4th do
      sample :sn_dolf, amp: 5*vol_snr, rate: 0.9
    end
    sleep one4th
  end
  1.times do
    sleep one4th
    with_fx :echo,
      mix: 0.01,
      rate: one4th*3.0/4.0,
    decay: 4*one4th do
      sample :sn_dolf, amp: 5*vol_snr, rate: 0.9
    end
    sleep 3.0*one4th/4.0
    sample :sn_dolf, amp: 5*vol_snr, rate: 0.9
    sleep 1.0*one4th/4.0
  end
end


live_loop :hh do
  sleep one4th/2.0
  sample :vinyl_hiss, amp: 2.0*vol_hiss,  rate: 1.0
  sleep one4th/2.0
  sample :ambi_lunar_land, rate: 1.0, amp: 1.0*vol_hiss
  sleep one4th/2.0
end

live_loop :saw do
  
  if ((halves_counter+1) % (mod_every*4) == 0)
    tr = global_transpose
  else
    tr = 0
  end
  with_transpose tr do
    use_synth :pluck
    with_fx :bitcrusher, mix: bit_crusher_mix, bits: 4, sample_rate: 10000 do
      with_fx :gverb, mix: 0.3,spread: 1.0, room: 1.0 do
        with_fx :panslicer, mix: 0.6, phase: one4th/2.0 do
          with_fx :echo, mix: 0.5, phase: one4th/4.0*3.0 do
            play :C4, amp: 0.8*vol_saw, release: 1
            sleep one4th/3.0
            play :G4, amp: 1.0*vol_saw, release: 0.1
            sleep one4th/3.0
            play :Ds4, amp: 0.7*vol_saw, release: 0.5
            sleep one4th/3.0
            play :C4, amp: 1.0*vol_saw, release: 1
            sleep one4th/3.0
            play :Ds4, amp: 1.0*vol_saw, release: 0.8
            sleep one4th/3.0
            
            sleep one4th/3.0
          end
        end
      end
    end
  end
  halves_counter += 1
end

live_loop :cym do
  with_fx :reverb, mix: 0.5, room: 1.0 do
    sleep one4th/2.0
    sample :drum_cymbal_open, amp: 0.5*vol_cym, rate: 4.0
    sleep one4th/2.0
  end
end

live_loop :prob do
  with_fx :reverb, mix: 0.2, room: 1.0 do
    sample "/Users/bfmaier/Music/sonic_pi/problem.wav", amp: 9.0*vol_prob
  end
  sleep 32*one4th
end

live_loop :individual do
  sleep 4*(4*one4th)
  with_fx :reverb, mix: 0.2, room: 1.0 do
    2.times do
      sample "/Users/bfmaier/Music/sonic_pi/individual.wav", amp: 8.0*vol_indi
      sleep 4*one4th
    end
    sample "/Users/bfmaier/Music/sonic_pi/individual.wav", amp: 8.0*vol_indi
    sleep 3.5*one4th
    1.times do
      with_fx :reverb, mix: 0.2, room: 1.0 do
        sample "/Users/bfmaier/Music/sonic_pi/all_alike.wav", amp: 8.0*vol_indi
      end
      sleep 4.5*one4th
    end
  end
end
