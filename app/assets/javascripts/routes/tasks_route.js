App.TasksRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find('task');
  }
});