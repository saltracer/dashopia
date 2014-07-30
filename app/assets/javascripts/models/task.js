App.Task = DS.Model.extend({
  name:    DS.attr('string'),
  user_id:    DS.attr('integer'),
  status:    DS.attr('integer'),
  priority:    DS.attr('integer'),
  location_id:    DS.attr('integer'),
  start_at:    DS.attr('datetime'),
  duration:    DS.attr('integer'),
  finish_at:    DS.attr('datetime'),
  due_at:    DS.attr('datetime'),
  due_event:    DS.attr('string '),
  reminder_at:    DS.attr('datetime'),
  reminder_type:    DS.attr('integer'),
  occurance_id:    DS.attr('integer'),
  occurance_deleted:    DS.attr('boolean'),
  parent_id:    DS.attr('integer'),
  collapse:    DS.attr('boolean'),
  child_duration:    DS.attr('integer'),
  created_at:    DS.attr('datetime'),
  updated_at:    DS.attr('datetime')
});


