persistent = true;

if (instance_number(obj_Musica) > 1) {
    instance_destroy();
    exit;
}

musica_id = audio_play_sound(snd_musica_fundo, 0, true);

audio_sound_gain(musica_id, 0.20, 0);