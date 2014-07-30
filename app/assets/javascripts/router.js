// For more information see: http://emberjs.com/guides/routing/

App.Router.reopen({
  // location: 'auto',
  rootURL: '/'
});

App.Router.map(function() {
  this.resource('tasks', { path: '/tasks'}, function() {
    this.route('new');
  });
  this.resource('task', {path: 'task/:task_id'}, function() {
    this.route('edit');
  });


  this.route('sign_up');
  this.route('sign_in');
  this.route('sign_out');
});
