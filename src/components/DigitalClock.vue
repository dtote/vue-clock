<template>
  <div class="container">
    <div class="clock-border">
      <div id="clock-inner">
        <div class="hour">{{ hours }}</div>
        <div class="dots">:</div>
        <div class="min">{{ minutes }}</div>
        <div class="dots">:</div>
        <div class="secs">{{ seconds }}</div>
        <div class="mode"></div>
      </div>
    </div>
    <div class="picker">
      <span>Pick a color</span>
      <color-picker class="color-picker" v-model="color" @change="setColor">Pick a color</color-picker>
    </div>

  </div>
</template>

<script>
export default {
  name: "DigitalClock",
  props: {
    color: {
      type: String,
      default: "red"
    }
  },
  data () {
    return {
      hours: 0,
      minutes: 0,
      seconds: 0
    }
  },
  methods: {
    setTime () {
      setInterval(() => {
        const date = new Date()
        this.hours = date.getHours()
        this.minutes = this.checkSingleDigit(date.getMinutes())
        this.seconds = this.checkSingleDigit(date.getSeconds())
      }, 1000)
    },
    checkSingleDigit (digit) {
      return ("0" + digit).slice(-2)
    },
    setColor () {
      document.getElementById("clock-inner").style.color = this.color
    }
  },
  updated () {
    this.setColor()
  },
  mounted () {
    this.setTime()
  }

}
</script>

<style>
.picker, .container {
  display: flex;
  justify-content: center;
  align-items: center;
}
.color-picker {
  margin-left: 2rem;
}
.container {
  margin: auto;
  flex-direction: column;
}
.hour,
.min,
.secs {
  font-size: 8em;
}
strong {
  color: blue;
}
p, span {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
  font-size: 20px;
}
.clock-border {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 700px;
  height: 200px;
  margin: 2rem;
  border-radius: 20px;
  background: linear-gradient(to right, grey, rgb(82, 76, 76))
}
#clock-inner {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 600px;
  height: 150px;
  background: black;
  border-radius: 20px;
  color: red;
}
.dots {
  font-size: 70px;
}
</style>
