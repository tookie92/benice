import Vue from 'vue/dist/vue.esm'
import TurbolinksAdapter from 'vue-turbolinks'
import VueResource from 'vue-resource'

Vue.use(VueResource)
Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')

  var element = document.getElementById("kunde-form")

  if (element != null) {
    var kunde = JSON.parse(element.dataset.kunde)

    var app = new Vue({
      el: element,
      data: function() {
        return {
          kunde: kunde
        }
      },



      methods: {


        //create a kunde
        saveKunde: function() {
          this.$http.post('/kundes', { kunde: this.kunde }).then(response => {
            Turbolinks.visit(`/kundes/${response.body.id}`)
          }, response => {
            console.log(response)
          })

      },

        //update a kunde
      updateKunde: function(kunde){

        this.$http.put(`/kundes/${this.kunde.id}`, { kunde: this.kunde }).then(response => {
          Turbolinks.visit(`/kundes/${response.body.id}`)
        }, response => {
          console.log(response)
        })
      }



      }
    });
  }
});
