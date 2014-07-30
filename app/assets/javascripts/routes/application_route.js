App.ApplicationRoute = Ember.Route.extend({
  beforeModel: function() {
    this.transitionTo('tasks');
    var route = this;
    Ember.$.post('/users/sign_in', function() {
      route.controllerFor('application').set('signedIn', true);
    }).fail(function() {
      route.controllerFor('application').set('SignedIn', false);
    });
  }
});