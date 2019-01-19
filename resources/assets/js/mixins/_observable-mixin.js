import riot from 'riot'

let store

function Store () {
    riot.observable(this)
}

export default new Store()