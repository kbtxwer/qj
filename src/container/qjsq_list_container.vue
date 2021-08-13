<template>
  <div class="container details">
    <div class="topbar" style="height: 52px;">
      <div class="top-head">
        <div>
          <a><i class="iconfont icon-back" style="color: #FFF;"></i></a>
        </div>
        <div>请假列表</div>
        <div @click="goToAdd">
          <a><i class="iconfont icon-fangzi" style="color: #FFF;"></i></a>
        </div>
      </div>
    </div>
    <div class="weui-cells__title custom" v-if="item.length===0">
      <span style="color: #ec9a2c;font-size: 14px;" @click="goToAdd">当前暂无“请假”记录，点击此处立即“请假”</span>
    </div>
    <form name="form1" v-if="item.length>0">
      <Leave_item v-for="(item,index) in item" :key="index" :leaving_obj="item" :idx="index" v-on:click.native="emitDetail(item,index)"/>
    </form>

    <div class="footer-copy-space"></div>

    <Pager count-per-page="10" current-page="1" :total-count="item.length"></Pager>

  </div>

</template>

<script>
import Leave_item from "@/components/qjsq_list_components/leave_item";
import Pager from "@/components/qjsq_list_components/pager";

export default {
  name: "qjsq_list",
  components: {Pager, Leave_item},
  methods:{
    emitDetail(detail,idx){
      this.$emit("detail",detail,idx)
    },
    goToAdd(){
      window.location='?method=add'
    }
  },
  data() {
    return {
      item: []
    }
  },
  mounted() {
    this.item = localStorage.getItem("leave_apply")
    if(this.item==null) {
      this.item = []
    } else{
      this.item = JSON.parse(this.item)
    }
    console.log(this.item)
  }
}
</script>

<style scoped>

</style>