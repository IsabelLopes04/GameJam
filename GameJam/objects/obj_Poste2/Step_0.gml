if (instance_exists(obj_CentralInteligente)) {
    var _central = instance_find(obj_CentralInteligente, 0);
    if (_central.missao_concluida || _central.ativar_iluminacao) {
        luz_acesa = true;
    }
}

if (luz_acesa) {
    luz_intensidade = min(1, luz_intensidade + luz_velocidade);
} else {
    luz_intensidade = max(0, luz_intensidade - luz_velocidade);
}
