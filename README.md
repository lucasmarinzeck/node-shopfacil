# node-shopfacil

Fornece integração à API de boleto bancário Bradesco ShopFácil usando Node.js.

## Instalação

`npm install shopfacil`

## Exemplo de código

```javascript
var Shopfacil = require('shopfacil');

var shopfacil = new Shopfacil({
  merchantId: 'merchant id',
  chaveDeSeguranca: 'chave de segurança',
  sandbox: true
});

shopfacil.pedido({
  numero: '0-9_A-Z_.MAX-27-CH99',
  valor: '15000',
  descricao: 'Descritivo do pedido'
});

shopfacil.comprador({
  nome: 'Nome do comprador/sacado',
  documento: '38604763007',
  endereco: {
    cep: '02010700',
    logradouro: 'Rua Domingos Sergio dos Anjos',
    numero: '277',
    complemento: '',
    bairro: 'Jardim Santo Elias',
    cidade: 'Sao Paulo',
    uf: 'SP'
  },
  ip: '000.000.000.000',
  userAgent: 'Chrome'
});

shopfacil.boleto({
  beneficiario: 'Scopus',
  carteira: '25',
  nossoNumero: '99123456789',
  dataEmissao: '2016-03-01',
  dataVencimento: '2016-03-05',
  valorTitulo: '15000',
  urlLogotipo: '',
  mensagemCabecalho: 'mensagem de cabecalho',
  tipoRenderizacao: '2',
  instrucoes: {
    linha1: 'instrucao 01',
    linha2: 'instrucao 02',
    linha3: 'instrucao 03'
  }
});

var token = '21323dsd23434ad12178DDasY';

shopfacil.enviar(token, function (err, res) {
  if (err) {
    console.log(err);
  }
  console.log(res);
});
```

## Manual

https://homolog.meiosdepagamentobradesco.com.br/manual/Manual_BoletoBancario.pdf
