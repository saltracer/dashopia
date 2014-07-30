App.SignUpController = Ember.Controller.extend({
  actions : {
    signUp: function() {
      var controller = this;
      return Ember.$.post('/users.json',
        {
          user:
          {
            email: this.get('email'),
            password: this.get('password'),
            password_confirmation: this.get('password_confirmation')
          }
        },
        function(data) {
          location.reload();
        },
        'json'
      ).fail(function() {
        alert("sign up failed!");
      }
      );
    }
  }
});
