<%@page import="dao.PaisDao"%>
<%@page import="model.Pais"%>
<%@page import="model.Pais"%>
<%@page import="model.Pessoa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    // Transformando os dados que foram colocados na seção
    // em um objeto pessoa novamente

    Pessoa pessoa = (Pessoa) session.getAttribute("dados");

    // Verificando se o objeto pessoa não existe e se não é usuário
    if ((pessoa == null) || (!session.getAttribute("perfil").equals("gestor-oms"))) {
        // Caso for uma das duas opções
        // Redirecionar para o login
        response.sendRedirect("../login/");

    }

    // Caso contrário é um usuário válido, pode entrar na página  
%>
<%  
    try {
       
        Integer idPais = Integer.parseInt(request.getParameter("idPais"));
        Pais pais = PaisDao.findByIdPais(idPais);

        pageContext.setAttribute("pais", pais);

    } catch (Exception e) {
    }

%> 

<%@include file="header.jspf"%>
<script src="../public/assets/js/gestor-oms/painel-pais.js" defer></script>
</head>

<body class="hold-transition sidebar-mini">
    <div class="wrapper">

        <!-- Navbar --------------------------------------------->
        <%@include file="navbar.jspf" %>
        <!-- /.navbar ------------------------------------------------------->

        <!-- MENU Main Sidebar Container ------------------------------------>
        <%@include file="menu.jspf" %>

        <!-- Content Wrapper. Contains page content -------------------------->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0">Painel Pa&iacute;s</h1>
                        </div>
                        <!-- /.col -->

                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="" id="go-back">Voltar</a></li>
                                <li class="breadcrumb-item active">Painel Pa&iacute;s</li>
                            </ol>
                        </div>
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /.content-header ---------------------------------------------->

            <!-- Main content -->
            <div class="content">
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-12 mb-3">


                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">Dados Pa&iacute;s</h3>
                                </div>
                                <!-- /.card-header -->
                                <!-- form start -->
                                <form id="form-meus-dados">
                                    <div class="card-body">

                                        <%@include file="../partials/dados-pais-cadastro-disabled.jspf" %>
                                        <hr class = "m mt-4">
                                        <%@include file="../partials/tipo-doc-cadastro-disabled.jspf" %>
                                        <hr class = "mb-4 mt-4">
                                        <%@include file="../partials/dados-pais-divisao-territorial-pesquisa.jspf" %>                                                                                

                                    </div>
                                </form>

                            </div>
                        </div>
                        <!-- /.row -->
                    </div>
                    <div class="row">
                        <div class="col-12 pb-4">
                            <button type="button" class="btn btn-danger btn-lg" id="excluir" style="width:175px">Excluir</button>
                        </div>
                    </div>


                </div>
                <!-- /.container-fluid -->                

            </div>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->

        <!-- Main Footer -->
        <%@include file="footer.jspf" %>
    </div>
    <!-- ./wrapper -->

</body>
</html>