<template>
  <div class="container">
    <img class="majsrc" v-for="(item,index) in majString " :src="'./majs/'+item+'.gif'" :key="index">
  </div>
</template>

<script>
export default {
  name: "majPics",
  props: ["majString"],
  data() {
    return {

    }
  },
  mounted() {
    // console.log(this.majString);
  }
}
</script>

<style scoped>
.container {
  text-align: center;
}
.majsrc{
  width: 20px;
  height:28px
}
</style>