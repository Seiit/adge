﻿using Adge.Data.Repositories;
using Adge.Model;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Pararmetricas.Models;
using System.Security.Claims;

namespace usuarios.Controllers
{
    [ApiController]
    [Route("Asignacion")]
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    public class AsignacionController : ControllerBase
    {
        private readonly IAsignacionRepository _asignacionRepository;

        public AsignacionController(IAsignacionRepository asignacionRepository)
        {
            _asignacionRepository = asignacionRepository;
        }

        [HttpGet]
        public async Task<dynamic> GetAsignaciones(string uid)
        {
            var identity = HttpContext.User.Identity as ClaimsIdentity;

            var rtoken = Jwt.validarToken(identity);

            if (!rtoken.success) return rtoken;

            return _asignacionRepository.GetAsignaciones(uid);
        }

        [HttpGet]
        [Route("asignacion")]
        public async Task<dynamic> GetAsignacionByUid(int idAsignacion)
        {
            var identity = HttpContext.User.Identity as ClaimsIdentity;

            var rtoken = Jwt.validarToken(identity);

            if (!rtoken.success) return rtoken;

            return _asignacionRepository.GetAsignacionById(idAsignacion);
        }

        [HttpDelete]
        public async Task<dynamic> DeleteAsignacionByUid(int id)
        {
            var identity = HttpContext.User.Identity as ClaimsIdentity;

            var rtoken = Jwt.validarToken(identity);

            if (!rtoken.success) return rtoken;

            return _asignacionRepository.DeleteAsignacion(id);
        }

        [HttpPost]
        public async Task<dynamic> PostAsignacion([FromBody] AsignacionPog asignacion)
        {
            var identity = HttpContext.User.Identity as ClaimsIdentity;

            var rtoken = Jwt.validarToken(identity);

            if (!rtoken.success) return rtoken;

            return _asignacionRepository.CreateAsignacion(asignacion);
        }

        [HttpPut]
        public async Task<dynamic> PutAsignacion([FromBody] AsignacionPog asignacion)
        {
            var identity = HttpContext.User.Identity as ClaimsIdentity;

            var rtoken = Jwt.validarToken(identity);

            if (!rtoken.success) return rtoken;

            return _asignacionRepository.UpdateAsignacion(asignacion);
        }
    }
}
