
aceso = false;

if (tipo_poste == 0) {

    with (obj_CaixaLuz) {
        if (concluida) {
            other.aceso = true;
        }
    }

    cor_luz = make_color_rgb(255, 215, 110);
}

else if (tipo_poste == 1) {

    with (obj_CaixaSolar) {
        if (concluida) {
            other.aceso = true;
        }
    }

    cor_luz = make_color_rgb(255, 236, 165);
}

else if (tipo_poste == 2) {

    with (obj_CaixaSensor) {
        if (concluida) {
            other.aceso = true;
        }
    }

    cor_luz = make_color_rgb(150, 220, 255);
}

if (aceso) {
    intensidade_luz = min(1, intensidade_luz + 0.025);
}
else {
    intensidade_luz = max(0, intensidade_luz - 0.025);
}
