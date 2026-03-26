import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["canvas"]

  connect() {
  this.drawing = false
  this.points = []
  this.boundStart = (e) => { this.start(e) }
  this.boundDraw = (e) => { this.draw(e) }
  this.boundFinish = (e) => { this.finish(e) }
  this.canvasTarget.addEventListener("pointerdown", this.boundStart)
  this.canvasTarget.addEventListener("pointermove", this.boundDraw)
  this.canvasTarget.addEventListener("pointerup", this.boundFinish)
}

  disconnect() {
  this.canvasTarget.removeEventListener("pointerdown", this.boundStart)
  this.canvasTarget.removeEventListener("pointermove", this.boundDraw)
  this.canvasTarget.removeEventListener("pointerup", this.boundFinish)
}

  start(event) {
  console.log("START CALLED, drawing was:", this.drawing)
  event.preventDefault()
  if (this.drawing) return
  this.drawing = true
  this.points = []
  this.points.push({ x: event.offsetX, y: event.offsetY })
  try {
    this.canvasTarget.setPointerCapture(event.pointerId)
  } catch(e) {}
 }

  draw(event) {
  if (!this.drawing) return
  console.log("points count:", this.points.length)
  this.points.push({ x: event.offsetX, y: event.offsetY })
  const prev = this.points[this.points.length - 2]
  const curr = this.points[this.points.length - 1]
  const ctx = this.canvasTarget.getContext("2d")
  ctx.beginPath()
  ctx.strokeStyle = "black"
  ctx.lineWidth = 1
  ctx.moveTo(prev.x, prev.y)
  ctx.lineTo(curr.x, curr.y)
  ctx.stroke()
}

  finish(event) {
    console.log("FINISH CALLED")
    if (!this.drawing) return
    this.drawing = false
    const ctx = this.canvasTarget.getContext("2d")
    this.points.push({ x: event.offsetX, y: event.offsetY })
    this.dispatch("zone-selected", { detail: { points: this.points } })
    ctx.closePath()
    ctx.stroke()
    ctx.fillStyle = "rgba(255, 255, 255, 0.2)"
    ctx.fill()
  }
}
