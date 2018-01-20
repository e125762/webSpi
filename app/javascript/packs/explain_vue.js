import Vue from 'vue/dist/vue.esm.js'
import axios from 'axios'
axios.defaults.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')

var vm = new Vue({
  el: '#explain',
  data: {
    show: false,
    flag: null,

    choices: gon.array_vue,

  },
  methods: {
      updateAns: function(q_num,e) {
	  //選択初回のみ動作
	  if (!this.show) {

	      e.currentTarget.className = "danger"
              var answer = document.getElementById("answer").innerHTML
              if (event.target.innerHTML === answer ) {
		  this.flag = 1;
              } else {
		  this.flag = 0;
              }
              this.show = true
	      //回答ログをPOST
	      axios.post('/spi_pages',{
                  question: q_num,
                  answer: this.flag
              });
	  }
      }
  }
})
