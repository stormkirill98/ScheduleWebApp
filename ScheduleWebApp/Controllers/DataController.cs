using Database.Entities;
using Microsoft.AspNetCore.Mvc;
using ScheduleWebApp.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ScheduleWebApp.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class DataController: ControllerBase
    {
        private IDataService _dataService;

        public DataController(IDataService dataService)
        {
            _dataService = dataService;
        }

        [HttpPost("schedule")]
        public IActionResult Save([FromBody] List<Schedule> schedules)
        {
            _dataService.SaveSchedule(schedules);
            return Ok();
        }
        
        [HttpGet("group_schedule/{groupId}/{isParity}")]
        public IActionResult GetGroupSchedule(int groupId, bool isParity)
        {
            Week week = _dataService.GetGroupSchedule(groupId, isParity);
            return Ok(week);
        }
        
        [HttpGet("teacher_schedule/{teacherId}/{isParity}")]
        public IActionResult GetTeacherSchedule(int teacherId, bool isParity)
        {
            Week week = _dataService.GetTeacherSchedule(teacherId, isParity);
            return Ok(week);
        }
    }
}
