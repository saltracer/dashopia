App.ApplicationStore = DS.Store.extend({

});

DS.RESTAdapter.reopen({
  namespace: 'api/v1'
});

// Override the default adapter with the `DS.ActiveModelAdapter` which
// is built to work nicely with the ActiveModel::Serializers gem.
App.ApplicationAdapter = DS.ActiveModelAdapter.extend({

});
