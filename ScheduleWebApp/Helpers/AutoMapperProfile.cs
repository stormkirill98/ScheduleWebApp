using AutoMapper;
using ScheduleWebApp.Dtos;
using ScheduleWebApp.Entities;

namespace ScheduleWebApp
{
    public class AutoMapperProfile : Profile
    {
        public AutoMapperProfile()
        {
            CreateMap<User, UserDto>();
            CreateMap<UserDto, User>();
        }
    }
}
