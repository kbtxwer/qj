<template>
  <div class='pager' style="text-align: right;">
    <span style="font-size:12px">
     共{{ totalCount }}条&nbsp;{{currentPage}}/{{ Math.floor(totalCount/countPerPage) + !(totalCount%countPerPage===0)}}页</span> | <a>首页</a>
    <a class='pgbg02'>上一页</a>
    <!--  <a><b><FONT class="style4">1</FONT></b></a>-->
    <a class='pgbg'>下一页</a>
    | <a >末页</a>
    <br>
  </div>
</template>

<script>
export default {
  name: "pager",
  props:["totalCount","countPerPage","currentPage"],
}

</script>

<style scoped>

</style>