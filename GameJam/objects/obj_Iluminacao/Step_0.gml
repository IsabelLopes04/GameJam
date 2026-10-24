if (instance_exists(obj_CentralInteligente)) {
    var _central = instance_find(obj_CentralInteligente, 0);
    if (_central.missao_concluida || _central.ativar_iluminacao) {
        cidade_acesa = true;
        global.cidade_iluminada = true;
    }
}

if (cidade_acesa) {
    escuridao = max(escuridao_final, escuridao - velocidade_iluminacao);
} else {
    escuridao = escuridao_inicial;
}
