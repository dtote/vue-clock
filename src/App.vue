<template>
<div>
  <DigitalClock/>
  <DigitalClock color="green"/>
  <DigitalClock color="yellow"/>
</div>
</template>

<script>
import DigitalClock from './components/DigitalClock.vue'
export default {
  name: 'App',
  components: {
    DigitalClock
  }
}
</script>

<style>

</style>
