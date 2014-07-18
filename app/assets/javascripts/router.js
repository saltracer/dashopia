// For more information see: http://emberjs.com/guides/routing/

App.Router.reopen({
  location: 'auto',
  rootURL: '/'
});

App.Router.map(function() {
  this.resource('tasks');


  this.route('sign_up');
  this.route('sign_in');
  this.route('sign_out');
});
