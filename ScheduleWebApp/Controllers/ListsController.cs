using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Database.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using ScheduleWebApp.Helpers;
using ScheduleWebApp.Services;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ScheduleWebApp.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ListsController : ControllerBase
    {
        private IListsService _listsService;

        public ListsController(IListsService listsService)
        {
            _listsService = listsService;
        }

        [HttpGet]
        public IActionResult Get()
        {
            return Ok(
                new {
                    Disciplines = _listsService.GetDisciplines(),
                    DisciplineTypes = _listsService.GetDisciplineTypes(),
                    Cabinets = _listsService.GetCabinets(),
                    Teachers = _listsService.GetTeachers(),
                    Groups = _listsService.GetStudyGroups()
                }
            );
        }

        [HttpGet("teachers")]
        public IActionResult GetTeachers()
        {
            return Ok(_listsService.GetTeachers());
        }

        [HttpGet("groups")]
        public IActionResult GetGroups()
        {
            return Ok(_listsService.GetStudyGroups());
        }

        [HttpPost("teacher")]
        public IActionResult SaveTeacher([FromBody] Teacher teacher)
        {
            _listsService.AddTeacher(teacher);
            return Ok(teacher);
        }

        [HttpPost("group")]
        public IActionResult SaveGroup([FromBody] StudyGroup group)
        {
            _listsService.AddGroup(group);
            return Ok(group);
        }

        [HttpPost("discipline")]
        public IActionResult SaveDiscipline([FromBody] Discipline discipline)
        {
            _listsService.AddDiscipline(discipline);
            return Ok(discipline);
        }
    }
}
