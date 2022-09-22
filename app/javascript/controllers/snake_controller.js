import { Controller } from "@hotwired/stimulus"
import consumer from '../channels/consumer';

// Connects to data-controller="controller"
class Snake {
  constructor(blocks) {
    this.blocks = blocks.map(({ x, y }) => new Block(x, y))
  }

  fill(context) {
    this.blocks.forEach(block => block.fill(context))
  }
}

class Block {
  constructor(x, y) {
    this.x = x
    this.y = y
  }

  fill(context) {
    context.fillRect(this.x, this.y, 10, 10)
  }
}

export default class extends Controller {
  connect() {
    this.gameId = this.element.dataset['gameId']
    this.gamePersonId = this.element.dataset['gamePersonId']
    this.channel = consumer.subscriptions.create('SnakeChannel', {
      connected: this._cableConnected.bind(this),
      disconnected: this._cableDisconnected.bind(this),
      received: this._cableReceived.bind(this),
    });

    this.keyListener = window.addEventListener('keyup', this.onKeyUp.bind(this))
  }

  disconnect() {
    this.element.removeEventListener(this.keyListener)
  }

  /**
   * @param {Event} event
   */
  onKeyUp(event) {
    event.preventDefault()

    const { gameId, gamePersonId } = this
    const direction = {
      "ArrowLeft": 'left',
      "ArrowRight": 'right',
      "ArrowUp": 'up',
      "ArrowDown": 'down'
    }[event.key]
    this.channel.send({ gameId, gamePersonId, direction })
  }

  _paint(person) {
    this._context().clearRect(0, 0, this.element.width, this.element.height);
    this._context().fillStyle = person.color
    new Snake(person.snake.blocks).fill(this._context())
  }

  _context() {
    return this.element.getContext('2d')
  }

  _cableConnected() {
    // Called when the subscription is ready for use on the server
    this._resetSnake()
    this._ping()
  }

  _cableDisconnected() {
    // Called when the subscription has been terminated by the server
  }

  /**
   * 
   * @param {Array} data 
   */
  _cableReceived(data) {
    // Called when there's incoming data on the websocket for this channel
    JSON.parse(data.message).forEach(person => this._paint(person))
  }

  _ping() {
    setTimeout(() => {
      this.channel.send({ gameId: this.gameId, alive: true })
      this._ping()
    }, 1000)
  }

  _resetSnake() {
    const { gameId, gamePersonId } = this
    this.channel.send({ gameId, gamePersonId, reset: true })
  }
}
