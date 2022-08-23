const mongoose = require('mongoose')

mongoose.connect('mongodb://localhost:27017/storedb', {
    useNewUrlParser: true,
    useUnifiedTopology: true
}).then(db => console.log('Connection establish successfully'))