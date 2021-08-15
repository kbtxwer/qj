<template>
  <div id="app">
    <Qjsq_list v-if=" !method || method==='list' " :item="item"  @detail="goToDatail"/>
    <Qjadd_container v-if="method==='add'"/>
    <Qjdatail_container v-if="method==='detail'" :detail="detail" :idx="detail_idx" @update="updateData"/>
  </div>
</template>

<script>
import Qjsq_list from "@/container/qjsq_list_container";
import Qjdatail_container from "@/container/qjdatail_container";
import Qjadd_container from "@/container/qjadd_container";
export default {
  name: "Index",
  components: {Qjadd_container, Qjdatail_container, Qjsq_list},
  data(){
    return {
      method : '',
      detail:{},
      item:[],
      detail_idx:0,
    }
  },
  methods:{
    updateData(detail){
      console.log(detail);
      this.item[0] = detail
      localStorage.setItem("leave_apply", JSON.stringify(this.item))
    },
    goToDatail(d,i){
      this.detail = d
      this.detail_idx = i
      this.method = 'detail'
    },
    goToAdd(){
      this.method = 'add'
    }
  },

  mounted() {
    let reg = new RegExp("(^|&)" + "method" + "=([^&]*)(&|$)", "i");
    let r = window.location.search.substr(1).match(reg);
    if (r != null) {
      this.method = unescape(r[2]);
    }else {
      this.method = 'list'
    }

    this.item = localStorage.getItem("leave_apply")
    if(this.item){
      this.item = JSON.parse(this.item)
    }

  }
}
</script>

<style scoped>

</style>