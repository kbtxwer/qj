<template>
  <div class="container leavedetails">
    <div class="topbar" style="height: 52px;display: none">
      <div class="top-head">
        <div @click="goToList()">
          <a>
            <i class="iconfont icon-back" style="color: #FFF;"></i>
          </a>
        </div>
        <div>请假信息</div>
        <div>
          <a>
            <i class="iconfont icon-fangzi" style="color: #FFF;"></i>
          </a>
        </div>
      </div>
    </div>
    <!--审核通过 调用class  pass   为通过调用  notpass-->
    <div class="leaveinfo pass">
      <form id="form1" name="form1">
        <div class="info gcp" data-form="form1" style="position:relative;">
          <div class="avatar" style="width: 45px;height: 45px;font-size: 17px;">
            {{ getName("who", 2) }}
          </div>
          <div class="name">
            <span style="font-size: 16px;color: white">{{ getName("who") }}</span>
            <span style="font-size: 12px;color: #cac0c0;">审批已通过</span>
          </div>
          <div class="weui-cell__ft">
          </div>
        </div>
      </form>
      <div class="infodetails">
        <div class="box">
          <div class="item">
            <span class="title">所在学院</span>
            <span>{{ detail.college }}</span>
          </div>
        </div>
        <div class="box">
          <div class="item">
            <span class="title">请假类型</span>
            <span>{{ detail.type }}</span>
          </div>
          <div class="item">
            <span class="title">请假时长</span>
            <span id="qjsxs">{{ getDelta(detail.start, detail.end) }}</span>
          </div>
        </div>
        <div class="box">
          <div class="item">
            <span class="title">请假开始时间</span>
            <span>{{ getTimeText(detail.start) }}</span>
          </div>
          <div class="item">
            <span class="title">请假结束时间</span>
            <span>{{ getTimeText(detail.end) }}</span>
          </div>
        </div>
      </div>
      <div class="explain" style="border-top: #f3f3f3 0px solid; margin-top: -30px;overflow: auto;">
        <div class="box">
          <span class="title">行程范围</span>
          <p class="infocontent">{{ detail.range }}</p>
        </div>
        <div class="box">
          <span class="title">事由说明</span>
          <p class="infocontent" style="white-space: pre-line">{{ detail.reason }}</p>
        </div>
        <div class="box">
          <span class="title">前往目的地</span>
          <p class="infocontent">{{ detail.place }}</p>
        </div>
        <div class="box" v-if="idx===0">
          <a @click="makeDelay" style="width:45%;height:46px;margin-top:15px;background-color:#d66f2b;color:#fff;" class="weui-btn bg-blue">请假延期</a>
          <a @click="goToList" style="width:45%;background-color:#46ad77;color:#fff;" class="weui-btn bg-blue">销假</a>
        </div>
      </div>
    </div>
    <div class="flow">
      <ul>
        <li>
          <!--审核通过 调用class  pass   为通过调用  notpass-->
          <div class="avatar">
            {{ getName("who", 2) }}
          </div>
          <div class="content">
            <div class="ttl"><span class="text" style="font-size: 16px;">发起申请</span> <span
                class="time">{{ detail.apply.substring(5, detail.apply.length - 3) }}</span></div>
          </div>
        </li>
        <li>
          <!--审核通过 调用class  pass   为通过调用  notpass-->
          <div class="avatar pass">
            {{ getName("teacher1", 2) }}
          </div>
          <div class="content">
            <div class="ttl"><span class="text" style="font-size: 16px;">{{ getName("teacher1") }}审核（已通过）</span>
              <span class="time" v-once v-text="getRandCheckDate(detail.apply)"></span>
            </div>
            <div class="ctn"></div>
          </div>
        </li>
        <li>
          <!--审核通过 调用class  pass   为通过调用  notpass-->
          <div class="avatar pass">
            {{ getName("teacher2", 2) }}
          </div>
          <div class="content">
            <div class="ttl"><span class="text" style="font-size: 16px;">{{ getName("teacher2") }}审核（已通过）</span> <span
                class="time" v-once v-text="getRandCheckDate(detail.apply)"></span></div>
            <div class="ctn"></div>
          </div>
        </li>
        <li v-if="idx > 0">
          <div class="avatar">
            {{ getName("who", 2) }}
          </div>
          <div class="content">
            <div class="ttl"><span class="text" style="font-size: 16px;">销假</span>
              <span class="time" v-once v-text="getRandCheckDate(detail.end)"></span>
            </div>
            <div class="ctn">完成</div>
          </div>
        </li>
        <li>
          <div class="pointer">
            <i class="icon"></i>
          </div>
          <div class="content pointer">
            <div class="ttl">审批共耗时{{ this.spdelta / 60000 }}分钟</div>
          </div>
        </li>
      </ul>
    </div>
    <div class="footer-copy-space">
      <div style="text-align:left;">
        <button type="button" @click="goToList"
                style="background-color:transparent;border-style:none;line-height:30px;color:#538fff;outline:0;"><i
            id="fhan" style="font-size:14px;margin-right:-3px;" class="icon iconfont "></i> 返回
        </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "qjdatail_container",
  props: ["detail", "idx"],
  data() {
    return {
      spdelta: 0,
    }
  },
  methods: {
    getTimeText(stime){
      stime = stime.replace(":00","")
      if(stime.indexOf(":") === -1) stime += "时"
      else{
        stime = stime.replace(":","时") + "分"
      }
      return stime
    },
    makeDelay(){
      let _start = new Date(new Date(this.detail.start).getTime() + 86400000)
      let _end = new Date(new Date(this.detail.end).getTime() + 86400000)
      let _apply = new Date(new Date(this.detail.apply).getTime() + 86400000)
      //格式化 yyyy-MM-dd HH:mm
      console.log(_start,_end,_apply)
      this.detail.start = this.formatDate(_start)
      this.detail.end = this.formatDate(_end)
      this.detail.apply = this.formatDate(_apply)
      this.$emit("update",this.detail)
    },
    formatDate(date){
      let sign1 = "-";
      let sign2 = ":";
      let year = date.getFullYear() // 年
      let month = date.getMonth() + 1; // 月
      let day = date.getDate(); // 日
      let hour = date.getHours(); // 时
      let minutes = date.getMinutes(); // 分
      // let seconds = date.getSeconds() //秒
      // 给一位数数据前面加 “0”
      if (month >= 1 && month <= 9) {
        month = "0" + month;
      }
      if (day >= 0 && day <= 9) {
        day = "0" + day;
      }
      if (hour >= 0 && hour <= 9) {
        hour = "0" + hour;
      }
      if (minutes >= 0 && minutes <= 9) {
        minutes = "0" + minutes;
      }
      // if (seconds >= 0 && seconds <= 9) {
      //   seconds = "0" + seconds;
      // }
      return year + sign1 + month + sign1 + day + " " + hour + sign2 + minutes;
    },
    goToList() {
      window.location = ""
    },
    getName(key, len) {
      let teacherName = localStorage.getItem(key)
      if (!len || !teacherName) return teacherName;
      return teacherName.substring(teacherName.length - len)
    },
    getDelta(start, end) {
      let _start = new Date(start)
      let _end = new Date(end)
      let delta = _end.getTime() - _start.getTime();
      let result = '';
      let hour = Math.floor(delta / 3600_000)
      if (hour >= 1) result += hour + "小时 "
      let min = Math.floor((delta % 3600_000) / 60_000)
      if (min >= 1) result += min + "分钟"
      return result
    },
    //要求审批一小时内完成，且请假的起始日期必须在当前时间的2小时后
    //审批共2轮，每轮设定在20~30分钟之间
    getRandCheckDate(apply) {
      let _apply = new Date(apply)
      let delta = this.spdelta
      //延后 20~30 分钟
      delta += (Math.floor(Math.random() * 10) + 20) * 60 * 1000;
      //记录审批延时
      this.spdelta = delta
      let _date = new Date(_apply.getTime() + delta)
      // console.log(_apply,_date)
      let month = _date.getMonth() + 1
      month = month < 10 ? '0' + month : month
      let day = _date.getDate()
      day = day < 10 ? '0' + day : day
      let hour = _date.getHours()
      hour = hour < 10 ? '0' + hour : hour
      let min = _date.getMinutes()
      min = min < 10 ? '0' + min : min
      return month + '-' + day + ' ' + hour + ':' + min
    }
  }
}
</script>

<style scoped>

</style>