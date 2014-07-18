function setup_list(userId){
  // console.log("setup list; requesting tasks");
  // $.get("http://dashopia.com/json.php?userid="+userId)
  //   .done(function(data){
  //   console.log("tasks loaded" + data);
  //   $('#external-events').html(JSON.parse(data));
  // });
  tasks = Task.fetchAllFromServer(userId);

  // while(tasks.length === 0){ console.log(tasks.lenth);}
  render_list();

}

function render_list(){

  if(typeof tasks != 'undefined'){
  // console.log("render_list:" + tasks);
    var task_html = "";
    for (var i = 0; i < tasks.length; i++) {
      task_html = task_html.concat(tasks[i].toHtml());
      //console.log(task_html);
    }

    $('#external-events').html(task_html);
  }
}

function quickAdd(name){
  //http://thecrawfordfamily.net/todo/task_submit.php?name=quickadd1&status=-2"
  console.log(name);
}

function setup_calendar(userId){
            console.log("setting up calendar for "+ userId);
            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                events: "http://localhost:3000/tasks?userid="+userId,
                defaultView: 'agendaWeek',
                editable: true,
                droppable: true, // this allows things to be dropped onto the calendar !!!
                drop: function(date, allDay) { // this function is called when something is dropped

                    // retrieve the dropped element's stored Event Object
                    var originalEventObject = $(this).data('eventObject');

                    // we need to copy it, so that multiple events don't have a reference to the same object
                    var copiedEventObject = $.extend({}, originalEventObject);

                    // assign it the date that was reported
                    copiedEventObject.start = date;
                    console.log(copiedEventObject.start);
                    console.log(copiedEventObject.duration);
                    var unixtime_date = unixtime(date);
                    copiedEventObject.end = dateFromUnixtime(unixtime_date + copiedEventObject.duration);
                    copiedEventObject.allDay = allDay;

                    // console.log("copiedEventObject.start: " + copiedEventObject.start);
                    // console.log("copiedEventObject.end: " + copiedEventObject.end);
                    // console.log("copiedEventObject.duration: " + copiedEventObject.duration);

                    $.get('/task_submit.php',{ id: copiedEventObject.id, start: unixtime(copiedEventObject.start) })
                        .done(function( data ) {
                        console.log( "DropData Loaded: " + data );
                        });
                    // render the event on the calendar
                    // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
                    $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

                    console.log('drop:"' + copiedEventObject.id + '" was dropped at ' + unixtime(copiedEventObject.start) + '\n' +
                        '(database should be updated)');

                },

                eventDrop: function(event, delta, minuteDelta) {
                    secondDelta = minuteDelta*60;
                    //'http://thecrawfordfamily.net/todo/task_submit.php?id=2553&start=1397755800'
                    $.get('/task_submit.php',{ id: event.id, start: unixtime(event.start) })
                        .done(function( data ) {
                        console.log( "DragData Loaded: " + data );
                        });

                    console.log('eventDrop:"' + event.title + '"(' + event.id + ':' + unixtime(event.start) + ') was moved ' + delta + ' days and ' + secondDelta + ' seconds.\n' +
                        '(database should be updated to: ' + (unixtime(event.start)) + ')');
                },
                eventResize: function(event,dayDelta,minuteDelta,revertFunc) {
                  var newDurationInSeconds = parseInt(event.end - event.start, 10)/1000/3600;
                  console.log("newDurationInSeconds: " + newDurationInSeconds);
                  $.get('/task_submit.php',{ id: event.id, duration: newDurationInSeconds })
                        .done(function( data ) {
                        console.log( "EventResize completed: " + data );
                        });

                    console.log(
                        "The end date of " + event.title + " has been moved " +
                        dayDelta + " days and " +
                        minuteDelta + " minutes." + " This means the duration (" + newDurationInSeconds + ") is now: " +
                        event.end + " seconds."
                    );
                },

                loading: function(bool) {
                    if (bool) $('#loading').show();
                    else $('#loading').hide();
                }
            });
        }


$(document).ready(function() {

        // $('#task-details').html(here_doc(taskDetails));

        $("#quickadd .submit").on("click", function(){
          var name = $("#quickadd .name").val();
          //http://thecrawfordfamily.net/todo/task_submit.php?name=quickadd1&status=-2"
          $.get('/task_submit.php',{ id: event.id, name: name, status: "-2" })
            .done(function( data ) {
              var t = Task.quickAdd(name, data);
              $(".external-event:last").after(t.toHtml());
            });
          console.log(name);
      });

        $( "#external-events" ).on( "mouseover",  "div.external-event", function() {

          // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
          // it doesn't need to have a start or end
          var eventObject = {
              id: $.trim($(this).attr("data-task-id")),
              duration: parseInt($.trim($(this).attr("data-task-duration")), 10),
              title: $.trim($(this).text()) // use the element's text as the event title
          };

          // store the Event Object in the DOM element so we can get to it later
          $(this).data('eventObject', eventObject);

          // make the event draggable using jQuery UI
          $(this).draggable({
              zIndex: 999,
              revert: true,      // will cause the event to go back to its
              revertDuration: 0  //  original position after the drag
          });

        });

        /* initialize the external events

//USE THE NEW "ON" METHOD
        -----------------------------------------------------------------*/
        // $( document ).on( "mousedown", '#external-events div.external-event', function() {

        //     // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
        //     // it doesn't need to have a start or end
        //     var eventObject = {
        //         title: $.trim($(this).text()) // use the element's text as the event title
        //     };

        //     // store the Event Object in the DOM element so we can get to it later
        //     $(this).data('eventObject', eventObject);

        //     // make the event draggable using jQuery UI
        //     $(this).draggable({
        //         zIndex: 999,
        //         revert: true,      // will cause the event to go back to its
        //         revertDuration: 0  //  original position after the drag
        //     });

        // });


//ITERATE USING EACH
        // $('#external-events div.external-event').each(function() {

        //     // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
        //     // it doesn't need to have a start or end
        //     var eventObject = {
        //         title: $.trim($(this).text()) // use the element's text as the event title
        //     };

        //     // store the Event Object in the DOM element so we can get to it later
        //     $(this).data('eventObject', eventObject);

        //     // make the event draggable using jQuery UI
        //     $(this).draggable({
        //         zIndex: 999,
        //         revert: true,      // will cause the event to go back to its
        //         revertDuration: 0  //  original position after the drag
        //     });

        // });

        /* initialize the calendar
        -----------------------------------------------------------------*/


    console.log($('.fc-today').attr('data-date'));

    // $('.filter.menu .item')
    //   .tab()
    // ;

    $('.ui.rating')
      .rating({
        clearable: true
      })
    ;

    $('.ui.sidebar')
      .sidebar('attach events', '.open-items.button')
    ;

    $('.ui.dropdown')
      .dropdown()
    ;

    $('.appointment')
      .popup({
        on: 'click',
        inline: 'true'
    })
    ;

    setup_calendar();

});