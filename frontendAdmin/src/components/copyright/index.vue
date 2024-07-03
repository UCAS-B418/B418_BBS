<template>
  <center>国科大在线管理平台FROM~B418 </center>
</template>

<script>
export default {
  name: 'copyRight',
  computed: {
    year: function () {
      return this.$date.getThisYear()
    }
  }
}
</script>

<style lang="scss" scoped>
center {
  text-align: center;
}
</style>
