const functions = require('firebase-functions');
const admin = require("firebase-admin");
const app = require("express")();
const appdevocional = require("express")();
const appboletim = require("express")();
const apptestemunho = require("express")();
const appdocumento = require("express")();
const appdocumentos = require("express")();
const appescalas = require("express")();
const appatividade = require("express")();
const appusuarios = require("express")();
const apptoken = require("express")();
const appatividadepresenca = require("express")();
const apporacao = require("express")();
admin.initializeApp();

apptestemunho.get("/", async (request, response) => {
    await admin.firestore().collection('testemunho').orderBy('data','desc').get()
        .then(function (docs) {
          let todos = [];
          docs.forEach(function (doc) {
            todos.push({
              id: doc.id,
              titulo: doc.data().titulo,
              texto: doc.data().texto,
              data: doc.data().data,
              nome: doc.data().nome,
              foto: doc.data().foto,
            })
          })
          response.json(todos);
        });
})
exports.testemunho = functions.https.onRequest(apptestemunho)

appusuarios.get("/", async (request, response) => {
    await admin.firestore().collection('usuarios').get()
        .then(function (docs) {
          let todos = [];
          docs.forEach(function (doc) {
            todos.push({
              id: doc.id,
              ministerio: doc.data().ministerio,
              nome: doc.data().nome,
              tipodeacesso: doc.data().tipodeacesso
             })
          })
          response.json(todos);
        });
})
exports.usuarios = functions.https.onRequest(appusuarios)

appdocumentos.get("/", async (request, response) => {
    await admin.firestore().collection('documento').get()
        .then(function (docs) {
          let todos = [];
          docs.forEach(function (doc) {
            todos.push({
              id: doc.id,
              titulo: doc.data().titulo,
            })
          })
          response.json(todos);
        });
})
exports.documentos = functions.https.onRequest(appdocumentos)

appdocumento.get("/:id/arquivos", async (req, response) => {
    await admin.firestore().collection('documento').doc(req.params.id).collection('arquivos').orderBy('timestamp','desc').get()
        .then(function (docs) {
          let todos = [];
          docs.forEach(function (doc) {
            todos.push({
              id: doc.id,
              titulo: doc.data().titulo,
              autor: doc.data().autor,
              timestamp:doc.data().timestamp,
              documentourl: doc.data().documentourl,
             })
          })
          response.json(todos);
        });
})

exports.documento = functions.https.onRequest(appdocumento)

app.get("/", async (request, response) => {
    await admin.firestore().collection('bilhetes').get()
        .then(function (docs) {
          let todos = [];
          docs.forEach(function (doc) {
            todos.push({
              id: doc.id,
              titulo: doc.data().titulo,
              texto: doc.data().texto,
              data: doc.data().data
            })
          })
          response.json(todos);
        });
})

app.post("/", async (req, res) => {
  const user = req.body;

  await admin.firestore().collection("bilhetes").add(user);

  res.status(201).send();
});

app.put("/:id", async (req, res) => {
    const body = req.body;

    await admin.firestore().collection('bilhetes').doc(req.params.id).update(body);

    res.status(200).send()
});

app.delete("/:id", async (req, res) => {
    await admin.firestore().collection("bilhetes").doc(req.params.id).delete();

    res.status(200).send();
})

exports.bilhetes = functions.https.onRequest(app)
//FINAL BILHETES


appdevocional.get("/", async (request, response) => {
    await admin.firestore().collection('devocional').orderBy('timestamp','desc').get()
        .then(function (docs) {
          let todos = [];
          docs.forEach(function (doc) {
            todos.push({
              id: doc.id,
              urldevocional: doc.data().urldevocional,
              url: doc.data().url,
              titulo: doc.data().titulo,
              data: doc.data().data
            })
          })
          response.json(todos);
        });
})
appdevocional.put("/:id", async (req, res) => {
    const body = req.body;

    await admin.firestore().collection('devocional').doc(req.params.id).update(body);

    res.status(200).send()
});
exports.devocional = functions.https.onRequest(appdevocional)

appboletim.get("/", async (request, response) => {
    await admin.firestore().collection('boletim').get()
        .then(function (docs) {
          let todos = [];
          docs.forEach(function (doc) {
            todos.push({
              id: doc.id,
              pastoral: doc.data().pastoral,
              fotosboletim: doc.data().fotosboletim,
              titulo: doc.data().titulo,
              aniversariantes: doc.data().aniversariantes
            })
          })
          response.json(todos);
        });
})
appboletim.put("/:id", async (req, res) => {
    const body = req.body;

    await admin.firestore().collection('boletim').doc(req.params.id).update(body);

    res.status(200).send()
});
exports.boletimupdate = functions.https.onRequest(appboletim)

appboletim.delete("/:id", async (req, res) => {
    const body = req.body;

    await admin.firestore().collection("boletim").doc(req.params.id).delete(body);

    res.status(200).send();
})
appboletim.post("/", async (req, res) => {
  const user = req.body;

  await admin.firestore().collection("boletim").add(user);

  res.status(200).send();
});
exports.boletim = functions.https.onRequest(appboletim)

appatividade.post("/", async (req, res) => {
  const user = req.body;

  await admin.firestore().collection("atividade").add(user);

  res.status(200).send();
});
exports.atividade = functions.https.onRequest(appatividade)

appatividadepresenca.post("/:id/presenca/", async (req, res) => {
  const user = req.body;

  await admin.firestore().collection("atividade").doc(req.params.id).collection('presenca').add(user);

  res.status(200).send();
})
exports.presenca = functions.https.onRequest(appatividadepresenca)


appatividade.get("/", async (request, response) => {
    await admin.firestore().collection('atividade').get()
        .then(function (docs) {
          let todos = [];
          docs.forEach(function (doc) {
            todos.push({
              id: doc.id,
              descricao: doc.data().descricao,
              foto: doc.data().foto,
              data:doc.data().data,
              titulo:doc.data().titulo,
              vagas:doc.data().vagas
            })
          })
          response.json(todos);
        });
})
exports.atividadeget = functions.https.onRequest(appatividade)

appatividadepresenca.get("/:id/presenca/", async (req, res) => {
    await admin.firestore().collection('atividade').doc(req.params.id).collection('presenca').get()
        .then(function (docs) {
          let todos = [];
          docs.forEach(function (doc) {
            todos.push({
              id: doc.id,
              token: doc.data().token,
              inscrito: doc.data().inscrito,

            })
          })
          res.json(todos);
        });
})
exports.presencaget = functions.https.onRequest(appatividadepresenca)

appatividadepresenca.delete("/:id/presenca/:idpresenca", async (req, res) => {
    const body = req.body;

    await admin.firestore().collection("atividade").doc(req.params.id).collection('presenca').doc(req.params.idpresenca).delete(body);

    res.status(200).send();
})
exports.presencadelete = functions.https.onRequest(appatividadepresenca)

appescalas.post("/", async (req, res) => {
  const user = req.body;

  await admin.firestore().collection("escalas").add(user);

  res.status(200).send();
});
exports.escalas = functions.https.onRequest(appescalas)
appescalas.get("/", async (request, response) => {
    await admin.firestore().collection('escalas').orderBy('timestamp','desc').get()
        .then(function (docs) {
          let todos = [];
          docs.forEach(function (doc) {
            todos.push({
              id: doc.id,
              ministerio: doc.data().ministerio,
              integrantes: doc.data().integrantes,
              data: doc.data().data,
              tipodeacesso: doc.data().tipodeacesso,
              timestamp: doc.data().timestamp,
            })
          })
          response.json(todos);
        });
})
exports.escalas = functions.https.onRequest(appescalas)

apptoken.post("/:id", async (req, res) => {
  const user = req.body;

  await admin.firestore().collection("token").doc(req.params.id).set(user);

  res.status(200).send();
});
exports.token = functions.https.onRequest(apptoken)

apptoken.get("/", async (request, response) => {
    await admin.firestore().collection('token').get()
        .then(function (docs) {
          let todos = [];
          docs.forEach(function (doc) {
            todos.push({
              id: doc.id,
              token: doc.data().token,
            })
          })
          response.json(todos);
        });
})
apporacao.get("/", async (request, response) => {
    await admin.firestore().collection('oracao').orderBy('data','desc').get()
        .then(function (docs) {
          let todos = [];
          docs.forEach(function (doc) {
            todos.push({
              id: doc.id,
              pedido: doc.data().pedido,
              token: doc.data().token,
              data: doc.data().data,
            })
          })
          response.json(todos);
        });
})
apporacao.post("/", async (req, res) => {
  const user = req.body;

  await admin.firestore().collection("oracao").add(user);

  res.status(200).send();
})
apporacao.delete("/:id", async (req, res) => {
    const body = req.body;

    await admin.firestore().collection("oracao").doc(req.params.id).delete(body);

    res.status(200).send();
})
exports.oracao = functions.https.onRequest(apporacao)
