aceso = false;

if (instance_exists(obj_CentralInteligente)) {

    var _central = instance_find(obj_CentralInteligente, 0);

    if (_central.missao_concluida && _central.ativar_iluminacao) {

        if (atraso_luz > 0) {
            atraso_luz--;
        }
        else {
            aceso = true;
        }
    }
}

if (tipo_poste == 0) {
    cor_luz = make_color_rgb(255, 215, 150);
}
else if (tipo_poste == 1) {
    cor_luz = make_color_rgb(255, 235, 180);
}
else if (tipo_poste == 2) {
    cor_luz = make_color_rgb(175, 220, 255);
}

if (aceso) {
    intensidade_luz = min(1, intensidade_luz + 0.012);
}
else {
    intensidade_luz = max(0, intensidade_luz - 0.025);
}