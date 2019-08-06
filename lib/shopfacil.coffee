request = require "request"

class shopfacil
  constructor: (cfg) ->
    @merchantId = cfg.merchantId
    @chaveDeSeguranca = cfg.chaveDeSeguranca
    @sandbox = cfg.sandbox or false

  pedido: (pedido) ->
    @pedido = {}
    @pedido.numero = pedido.numero if pedido.numero?
    @pedido.valor = pedido.valor if pedido.valor?
    @pedido.descricao = pedido.descricao if pedido.descricao?
    @

  comprador: (comprador) ->
    @comprador = {}
    @comprador.nome = comprador.nome if comprador.nome?
    @comprador.documento = comprador.documento if comprador.documento?
    @comprador.ip = comprador.ip if comprador.ip?
    @comprador.user_agent = comprador.userAgent if comprador.userAgent?
    if comprador.endereco
      @comprador.endereco = {}
      @comprador.endereco.cep = comprador.endereco.cep if comprador.endereco.cep?
      @comprador.endereco.logradouro = comprador.endereco.logradouro if comprador.endereco.logradouro?
      @comprador.endereco.numero = comprador.endereco.numero if comprador.endereco.numero?
      @comprador.endereco.complemento = comprador.endereco.complemento if comprador.endereco.complemento?
      @comprador.endereco.bairro = comprador.endereco.bairro if comprador.endereco.bairro?
      @comprador.endereco.cidade = comprador.endereco.cidade if comprador.endereco.cidade?
      @comprador.endereco.uf = comprador.endereco.uf if comprador.endereco.uf?
    @

  boleto: (boleto) ->
    @boleto = {}
    @boleto.beneficiario = boleto.beneficiario if boleto.beneficiario?
    @boleto.carteira = boleto.carteira if boleto.carteira?
    @boleto.nosso_numero = boleto.nossoNumero if boleto.nossoNumero?
    @boleto.data_emissao = boleto.dataEmissao if boleto.dataEmissao?
    @boleto.data_vencimento = boleto.dataVencimento if boleto.dataVencimento?
    @boleto.valor_titulo = boleto.valorTitulo if boleto.valorTitulo?
    @boleto.url_logotipo = boleto.urlLogotipo if boleto.urlLogotipo?
    @boleto.mensagem_cabecalho = boleto.mensagemCabecalho if boleto.mensagemCabecalho?
    @boleto.tipo_renderizacao = boleto.tipoRenderizacao if boleto.tipoRenderizacao?
    if boleto.instrucoes
      @boleto.instrucoes = {}
      @boleto.instrucoes.instrucao_linha_1 = boleto.instrucoes.linha1 if boleto.instrucoes.linha1?
      @boleto.instrucoes.instrucao_linha_2 = boleto.instrucoes.linha2 if boleto.instrucoes.linha2?
      @boleto.instrucoes.instrucao_linha_3 = boleto.instrucoes.linha3 if boleto.instrucoes.linha3?
      @boleto.instrucoes.instrucao_linha_4 = boleto.instrucoes.linha4 if boleto.instrucoes.linha4?
      @boleto.instrucoes.instrucao_linha_5 = boleto.instrucoes.linha5 if boleto.instrucoes.linha5?
      @boleto.instrucoes.instrucao_linha_6 = boleto.instrucoes.linha6 if boleto.instrucoes.linha6?
      @boleto.instrucoes.instrucao_linha_7 = boleto.instrucoes.linha7 if boleto.instrucoes.linha7?
      @boleto.instrucoes.instrucao_linha_8 = boleto.instrucoes.linha8 if boleto.instrucoes.linha8?
      @boleto.instrucoes.instrucao_linha_9 = boleto.instrucoes.linha9 if boleto.instrucoes.linha9?
      @boleto.instrucoes.instrucao_linha_10 = boleto.instrucoes.linha10 if boleto.instrucoes.linha10?
      @boleto.instrucoes.instrucao_linha_11 = boleto.instrucoes.linha11 if boleto.instrucoes.linha11?
      @boleto.instrucoes.instrucao_linha_12 = boleto.instrucoes.linha11 if boleto.instrucoes.linha11?
    if boleto.registro
      @boleto.registro = {}
      @boleto.registro.agencia_pagador = boleto.registro.agenciaPagador if boleto.registro.agenciaPagador?
      @boleto.registro.razao_conta_pagador = boleto.registro.razaoContaPagador if boleto.registro.razaoContaPagador?
      @boleto.registro.conta_pagador = boleto.registro.contaPagador if boleto.registro.contaPagador?
      @boleto.registro.controle_participante = boleto.registro.controleParticipante if boleto.registro.controleParticipante?
      @boleto.registro.qtde_dias_multa = boleto.registro.qtdeDiasMulta if boleto.registro.qtdeDiasMulta?
      @boleto.registro.aplicar_multa = boleto.registro.aplicarMulta if boleto.registro.aplicarMulta?
      @boleto.registro.valor_percentual_multa = boleto.registro.valorPercentualMulta if boleto.registro.valorPercentualMulta?
      @boleto.registro.valor_multa = boleto.registro.valorMulta if boleto.registro.valorMulta?
      @boleto.registro.valor_desconto_bonificacao = boleto.registro.valorDescontoBonificacao if boleto.registro.valorDescontoBonificacao?
      @boleto.registro.debito_automatico = boleto.registro.debitoAutomatico if boleto.registro.debitoAutomatico?
      @boleto.registro.rateio_credito = boleto.registro.rateioCredito if boleto.registro.rateioCredito?
      @boleto.registro.endereco_debito_automatico = boleto.registro.enderecoDebitoAutomatico if boleto.registro.enderecoDebitoAutomatico?
      @boleto.registro.tipo_ocorrencia = boleto.registro.tipoOcorrencia if boleto.registro.tipoOcorrencia?
      @boleto.registro.especie_titulo = boleto.registro.especieTitulo if boleto.registro.especieTitulo?
      @boleto.registro.primeira_instrucao = boleto.registro.primeiraInstrucao if boleto.registro.primeiraInstrucao?
      @boleto.registro.segunda_instrucao = boleto.registro.segundaInstrucao if boleto.registro.segundaInstrucao?
      @boleto.registro.qtde_dias_juros = boleto.registro.qtdeDiasJuros if boleto.registro.qtdeDiasJuros?
      @boleto.registro.valor_juros_mora = boleto.registro.valorJurosMora if boleto.registro.valorJurosMora?
      @boleto.registro.data_limite_desconto = boleto.registro.dataLimiteDesconto if boleto.registro.dataLimiteDesconto?
      @boleto.registro.valor_desconto = boleto.registro.valorDesconto if boleto.registro.valorDesconto?
      @boleto.registro.valor_iof = boleto.registro.valorIof if boleto.registro.valorIof?
      @boleto.registro.valor_abatimento = boleto.registro.valorAbatimento if boleto.registro.valorAbatimento?
      @boleto.registro.tipo_inscricao_pagador = boleto.registro.tipoInscricaoPagador if boleto.registro.tipoInscricaoPagador?
      @boleto.registro.sequencia_registro = boleto.registro.sequenciaRegistro if boleto.registro.sequenciaRegistro?
    @

  enviar: (token, callback) ->
    transacao =
      merchant_id: @merchantId
      meio_pagamento: "300"
      pedido: @pedido
      comprador: @comprador
      boleto: @boleto
      token_request_confirmacao_pagamento: token
    mediaType = "application/json"
    charSet = "UTF-8"
    header = "#{@merchantId}:#{@chaveDeSeguranca}"
    headerBase64 = Buffer.from(header).toString("base64")
    options =
      method: "POST"
      body: JSON.stringify(transacao)
      headers:
        "Authorization": "Basic #{headerBase64}"
        "Accept": mediaType
        "Accept-Charset": charSet
        "Content-Type": "#{mediaType};charset=#{charSet}"
    if @sandbox
      options.uri = "https://homolog.meiosdepagamentobradesco.com.br/apiboleto/transacao"
    else
      options.uri = "https://meiosdepagamentobradesco.com.br/apiboleto/transacao"
    return request options, (err, res, body) ->
      if err
        callback err
      else
        json = JSON.parse(body)
        resultado = {}
        resultado.merchantId = json.merchant_id if json.merchant_id?
        resultado.meioPagamento = json.meio_pagamento if json.meio_pagamento?
        if json.pedido
          resultado.pedido = {}
          resultado.pedido.numero = json.pedido.numero if json.pedido.numero?
          resultado.pedido.valor = json.pedido.valor if json.pedido.valor?
          resultado.pedido.descricao = json.pedido.descricao if json.pedido.descricao?
        if json.boleto
          resultado.boleto = {}
          resultado.boleto.valorTitulo = json.boleto.valor_titulo if json.boleto.valor_titulo?
          resultado.boleto.dataGeracao = json.boleto.data_geracao if json.boleto.data_geracao?
          resultado.boleto.dataAtualizacao = json.boleto.data_atualizacao if json.boleto.data_atualizacao?
          resultado.boleto.linhaDigitavel = json.boleto.linha_digitavel if json.boleto.linha_digitavel?
          resultado.boleto.linhaDigitavelFormatada = json.boleto.linha_digitavel_formatada if json.boleto.linha_digitavel_formatada?
          resultado.boleto.token = json.boleto.token if json.boleto.token?
          resultado.boleto.urlAcesso = json.boleto.url_acesso if json.boleto.url_acesso?
        if json.status
          resultado.status = {}
          resultado.status.codigo = json.status.codigo if json.status.codigo?
          resultado.status.mensagem = json.status.mensagem if json.status.mensagem?
          resultado.status.detalhes = json.status.detalhes if json.status.detalhes?
        callback null, resultado

module.exports = shopfacil
