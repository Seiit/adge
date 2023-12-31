import 'package:adge/router/auth/auth_handlers.dart';
import 'package:adge/router/dashboard_handlers.dart';
import 'package:adge/router/no_page_found_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();

  static String rootRoute = '/';

  // Auth Router
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  // Dashboard
  static String dashboardRoute = '/dashboard';
  static String blankRoute = '/dashboard/blank';
  static String categoriesRoute = '/dashboard/categories';

  static String usersRoute = '/dashboard/users';
  static String userRoute = '/dashboard/users/:uid';

  static String rolesRoute = '/dashboard/roles';
  static String rolRoute = '/dashboard/roles/:id';

  static String empresasRoute = '/dashboard/empresas';
  static String empresaRoute = '/dashboard/empresas/:id';

  static String asignacionesRoute = '/dashboard/asignaciones/:uid';
  static String asignacionRoute = '/dashboard/asignacion/:id';

  static String eventosRoute = '/dashboard/eventos';
  static String eventoRoute = '/dashboard/eventos/:id';

  static String calendariosRoute = '/dashboard/calendarios';
  static String calendarioRoute = '/dashboard/calendarios/:id';

  static String evidenciaRoute = '/dashboard/evidencia/:id';

  static void configureRoutes() async {
    // Auth Routes
    router.define(rootRoute,
        handler: await AuthHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute,
        handler: await AuthHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute,
        handler: AuthHandlers.register, transitionType: TransitionType.none);

    // Dashboard
    router.define(dashboardRoute,
        handler: DashboardHandlers.dashboard,
        transitionType: TransitionType.fadeIn);

    router.define(rolesRoute,
        handler: DashboardHandlers.roles,
        transitionType: TransitionType.fadeIn);

    router.define(rolRoute,
        handler: DashboardHandlers.rol, transitionType: TransitionType.fadeIn);

    router.define(empresasRoute,
        handler: DashboardHandlers.empresas,
        transitionType: TransitionType.fadeIn);

    router.define(empresaRoute,
        handler: DashboardHandlers.empresa,
        transitionType: TransitionType.fadeIn);

    router.define(asignacionesRoute,
        handler: DashboardHandlers.asignaciones,
        transitionType: TransitionType.fadeIn);

    router.define(asignacionRoute,
        handler: DashboardHandlers.asignacion,
        transitionType: TransitionType.fadeIn);

    router.define(eventosRoute,
        handler: DashboardHandlers.eventos,
        transitionType: TransitionType.fadeIn);

    router.define(eventoRoute,
        handler: DashboardHandlers.evento,
        transitionType: TransitionType.fadeIn);

    router.define(calendariosRoute,
        handler: DashboardHandlers.calendarios,
        transitionType: TransitionType.fadeIn);

    router.define(calendarioRoute,
        handler: DashboardHandlers.calendario,
        transitionType: TransitionType.fadeIn);

    router.define(evidenciaRoute,
        handler: DashboardHandlers.evidencia,
        transitionType: TransitionType.fadeIn);

/*
// Dashboard
    
    router.define(blankRoute,
        handler: DashboardHandlers.dashboard,
        transitionType: TransitionType.fadeIn);
    router.define(categoriesRoute,
        handler: DashboardHandlers.dashboard,
        transitionType: TransitionType.fadeIn);
    router.define(iconsRoute,
        handler: DashboardHandlers.dashboard,
        transitionType: TransitionType.fadeIn);
*/
    // users
    router.define(usersRoute,
        handler: DashboardHandlers.users,
        transitionType: TransitionType.fadeIn);

    router.define(userRoute,
        handler: DashboardHandlers.user, transitionType: TransitionType.fadeIn);

    // 404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
