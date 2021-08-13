<template>
  <div class="container details">
    <div class="topbar" style="height: 52px;border-bottom: 1px solid #f3f3f3;">
      <div class="top-head">
        <div @click="goToList">
          <a>
            <i class="iconfont icon-back" style="color: #FFF;"></i>
          </a>
        </div>
        <div>请假申请</div>
        <div>
          <a><i class="iconfont icon-fangzi" style="color: #FFF;"></i></a>
        </div>
      </div>
    </div>

    <div class="weui-cells custom" style="margin-top: 0;">

      <div class="weui-cell">
        <div class="weui-cell__bd">
          <p>起始时间</p>
        </div>
        <div class="weui-cell__ft">
          <input class="weui-input" type="datetime-local" v-model="start">
        </div>
      </div>
      <div class="weui-cell">
        <div class="weui-cell__bd">
          <p>截止时间</p>
        </div>
        <div class="weui-cell__ft">
          <input class="weui-input" type="datetime-local" v-model="end">
        </div>
      </div>
      <div class="weui-cell">
        <div class="weui-cell__bd">
          <p>请假类型</p>
        </div>
        <div class="weui-cell__ft">
          <select class="weui-input" type="text" v-model="type">
            <option value="其他事由" selected>其他事由</option>
          </select>
        </div>
      </div>
      <div class="weui-cell">
        <div class="weui-cell__bd">
          <p>事由说明</p>
        </div>
        <div class="weui-cell__ft">
          <input class="weui-input" type="text" v-model="reason">
        </div>
      </div>
      <div class="weui-cell">
        <div class="weui-cell__bd">
          <p>行程范围</p>
        </div>
        <div class="weui-cell__ft">
          <select class="weui-input" type="text" v-model="range">
            <option value="西安市内" selected>西安市内</option>
          </select>
        </div>
      </div>
      <div class="weui-cell">
        <div class="weui-cell__bd">
          <p>前往目的地</p>
        </div>
        <div class="weui-cell__ft">
          <input class="weui-input" type="text" v-model="place">
        </div>
      </div>

      <div class="weui-cell">
        <div class="weui-cell__bd">
          <p style="color: grey">全局配置</p>
        </div>
      </div>

      <div class="weui-cell">
        <div class="weui-cell__bd">
          <p>请假学生</p>
        </div>
        <div class="weui-cell__ft">
          <input class="weui-input" type="text" v-model="who">
        </div>
      </div>
      <div class="weui-cell">
        <div class="weui-cell__bd">
          <p>所在院校</p>
        </div>
        <div class="weui-cell__ft">
          <input class="weui-input" type="text" v-model="college">
        </div>
      </div>
      <div class="weui-cell">
        <div class="weui-cell__bd">
          <p>第一审批人</p>
        </div>
        <div class="weui-cell__ft">
          <input class="weui-input" type="text" v-model="p1">
        </div>
      </div>
      <div class="weui-cell">
        <div class="weui-cell__bd">
          <p>第二审批人</p>
        </div>
        <div class="weui-cell__ft">
          <input class="weui-input" type="text" v-model="p2">
        </div>
      </div>


    </div>
    <div class="sub-btn-box">
      <button type="submit" @click="commitApply" class="weui-btn bg-blue">提 交</button>
    </div>

    <div class="footer-copy-space"></div>
  </div>
</template>

<script>
export default {
  name: "qjadd_container",
  methods: {
    goToList() {
      window.location = "?"
    },
    commitApply() {
      let applies = localStorage.getItem("leave_apply");
      if (applies === null) {
        applies = []
      } else {
        applies = JSON.parse(applies)
      }
      let detail = {}
      detail.start = this.start.replace('T', ' ')
      detail.end = this.end.replace('T', ' ')
      detail.type = this.type
      detail.reason = this.reason
      detail.range = this.range
      detail.place = this.place
      detail.college=this.college
      detail.apply = this.getNowDate()
      applies.unshift(detail)
      while (applies.length > 10) {
        applies.remove(9)
      }
      localStorage.setItem("leave_apply", JSON.stringify(applies))
      localStorage.setItem("who", this.who)
      localStorage.setItem("teacher1", this.p1)
      localStorage.setItem("teacher2", this.p2)
      localStorage.setItem("college", this.college)
      this.goToList()
    },
    getNowDate() {
      let date = new Date();
      let sign1 = "-";
      let sign2 = ":";
      let year = date.getFullYear() // 年
      let month = date.getMonth() + 1; // 月
      let day = date.getDate(); // 日
      let hour = date.getHours(); // 时
      let minutes = date.getMinutes(); // 分
      let seconds = date.getSeconds() //秒
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
      if (seconds >= 0 && seconds <= 9) {
        seconds = "0" + seconds;
      }
      return year + sign1 + month + sign1 + day + " " + hour + sign2 + minutes + sign2 + seconds;
    }

  },
  data() {
    return {
      start: '',
      end: '',
      type: '其他事由',
      reason: '',
      range: '西安市内',
      place: '学校附近',
      who: '',
      college: '',
      p1: '',
      p2: ''
    }
  },
  mounted() {
    this.college = localStorage.getItem("college")
    this.who = localStorage.getItem("who")
    this.p1 = localStorage.getItem("teacher1")
    this.p2 = localStorage.getItem("teacher2")
  }
}
</script>

<style scoped>

</style>