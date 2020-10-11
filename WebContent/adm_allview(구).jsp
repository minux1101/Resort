<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> <!-- html에서 한글처리 -->
<%@page contentType="text/html; charset=utf-8" %>  <!-- jsp에서 한글처리 -->
<%@page import="domain.*, service.*, java.util.*, java.text.*, java.time.*" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@fullcalendar/core@4.4.0"></script>
<link href='packages/core/main.css' rel='stylesheet' />
<link href='packages/daygrid/main.css' rel='stylesheet' />
<script src='packages/core/main.js'></script>
<script src='packages/interaction/main.js'></script>
<script src='packages/daygrid/main.js'></script>
<link href='https://use.fontawesome.com/releases/v5.0.6/css/all.css' rel='stylesheet'>
<link href='lib/main.css' rel='stylesheet' />
<script src='lib/main.js'></script>
<script src='js/theme-chooser.js'></script>
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.0/lux/bootstrap.min.css" rel='stylesheet'>
<link rel="stylesheet" href="https://bootswatch.com/4/lux/bootstrap.min.css">
<%
   ReserveService rs = new ReserveService();
   RoomCountService rCountService = new RoomCountService();
   rCountService.delete();
   rCountService.makeData();
   
   RoomCount room1 = new RoomCount();
   RoomCount room2 = new RoomCount();
   RoomCount room3 = new RoomCount();
   
   LocalDate currentDate = LocalDate.now();
   int day = currentDate.getDayOfYear();
   int LengthYear = currentDate.lengthOfYear();
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
   List<Reserve> reserveList = rs.selectToday(currentDate);
%>
<script>
    document.addEventListener('DOMContentLoaded', function() {
      var calendarEl = document.getElementById('calendar');
      var calendar;
           
         calendar = new FullCalendar.Calendar(calendarEl, {
           eventClick: function(info) {
                  // alert('Event: ' + info.event.title);
                 //  alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
                  // alert('View: ' + info.view.type);
               var title = info.event.title;
               var date = info.event.start;
               date = moment(date).format("YYYY-MM-DD");
               window.location.href="./adm_oneview.jsp?title=" + title + "&date=" + date;
              
               // change the border color just for fun
               info.el.style.borderColor = 'red';
            },
            themeSystem: 'bootstrap',
            headerToolbar: {
              left: 'prev,next today',
              center: 'title',
              right: 'dayGridMonth,listMonth'
            },
            initialDate: '<%=currentDate%>',
            weekNumbers: true,
            navLinks: true, // can click day/week names to navigate views
            editable: true,
            selectable: true,
            nowIndicator: true,
            eventColor : '#999999',
            dayMaxEvents: true, // allow "more" link when too many events
            // showNonCurrentDates: false,
            events: [
                 <%for (Reserve r : reserveList) {   %>         
                  <% if (r.getRoom() == 1 ) { %>
                     {
                     title: '<%=r.getName()%> 스위트',
                     start: '<%=r.getResv_date()%>',
                       end: '<%=r.getResv_date()%>'
                     },
                 <%  }    %>
                <% if (r.getRoom() == 2 ) { %>
                    {
                     title: '<%=r.getName()%> 패밀리',
                     start: '<%=r.getResv_date()%>',
                       end: '<%=r.getResv_date()%>'
                    },
                <%  }   
                   if (r.getRoom() == 3 ) {%>
                    {
                     title: '<%=r.getName()%> 디럭스',
                     start: '<%=r.getResv_date()%>',
                       end: '<%=r.getResv_date()%>'
                    },
                <% }   
                  } %>
              {
                  title: '',
                  start: '',
                end: ''
              }
             ]
           });
          calendar.setOption('themeSystem', "bootstrap");
          calendar.render();
        });


</script>
<style>

 body {
    margin: 0;
    padding: 0;
    font-size: 14px;
  }

  #top,
  #calendar.fc-theme-standard {
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
  }

  #calendar.fc-theme-bootstrap {
    font-size: 14px;
  }

  #top {
    background: #eee;
    border-bottom: 1px solid #ddd;
    padding: 0 10px;
    line-height: 40px;
    font-size: 12px;
    color: #000;
  }

  #top .selector {
    display: inline-block;
    margin-right: 10px;
  }

  #top select {
    font: inherit; /* mock what Boostrap does, don't compete  */
  }

  .left { float: left }
  .right { float: right }
  .clear { clear: both }

  #calendar {
    max-width: 1100px;
    margin: 40px auto;
    padding: 0 10px;
  }


</style>
</head>
<body>

  <div id='calendar'></div>

</body>
</html>