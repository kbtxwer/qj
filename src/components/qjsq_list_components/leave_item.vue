<template>
  <div class="weui-cells leavelist custom">
    <!--审核通过 调用class  pass   为通过调用  notpass-->
    <a class="weui-cell weui-cell_access pass">
      <div class="weui-cell__icon">
        {{getName("who",2)}}
      </div>
      <div class="weui-cell__bd">
        <span>所属学院：{{leaving_obj.college}}</span>
        <span>请假类型：{{leaving_obj.type}}</span>
        <span>行程范围：{{leaving_obj.range}}</span>
        <span>请假开始时间：{{leaving_obj.start}}</span>
        <span>请假结束时间：{{leaving_obj.end}}</span>
        <div class="datebox">
          <span class="date">{{leaving_obj.apply}}</span>
          <span class="status" style="color: #999;" v-if="idx > 0">已销假</span>
        </div>
      </div>
      <div class="weui-cell__ft">
      </div>
    </a>
  </div>
</template>

<script>
export default {
  props:["leaving_obj","idx"],
  name: "leave_item",
  methods:{
    getName(key, len){
      let teacherName = localStorage.getItem(key)
      if(!len || !teacherName) return teacherName;
      return teacherName.substring(teacherName.length - len)
    }
  }
}
</script>

<style scoped>

</style>