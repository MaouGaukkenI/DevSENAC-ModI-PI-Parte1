CREATE INDEX idx_dados_base ON dados (titulo, prioridade, status, id_usuario);
CREATE INDEX idx_dados_data ON dados (data_inicio, data_vencimento);
CREATE INDEX idx_historico_data ON historico (data_fim, tempo_duracao);

