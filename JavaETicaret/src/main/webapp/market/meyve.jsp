<%@ page import="java.io.*" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import ="Controller.urunController,Model.urunModel,java.util.*,Controller.kategoriController,Model.kategoriModel"%>

<!DOCTYPE html>
<html lang="">
<head>
<title>Nocobot | Pages | Gallery</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="../layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<body id="top">
<div class="wrapper row0">
  <div id="topbar" class="hoc clear">
    <div class="fl_left"> 
      <ul class="nospace">
      </ul>
    </div>
    <div class="fl_right"> 
      <ul class="nospace">
        <li><a href="#" title="Login"><i class="fas fa-sign-in-alt"></i></a></li>
        <li><a href="#" title="Sign Up"><i class="fas fa-edit"></i></a></li>
        <li id="searchform">
          <div>
            <form action="#" method="post">
              <fieldset>
                <legend>Urun Ara:</legend>
                <input type="text" placeholder="Ürün Adı&hellip;">
                <button type="submit"><i class="fas fa-search"></i></button>
              </fieldset>
            </form>
          </div>
        </li>
      </ul>
    </div>
  </div>
</div>
<div class="bgded"> 
  <div class="wrapper row1">
    <header id="header" class="hoc clear">
      <div id="logo" class="fl_left"> 
        <h1><a href="index.jsp">JavaETicaret</a></h1>
      </div>
      <nav id="mainav" class="fl_right"> 
        <ul class="clear">
          <li class="active"><a href="index.jsp">Ana Sayfa</a></li>
          <li><a class="drop" href="#">Kategoriler</a>
            <ul>
              <li><a href="meyve.jsp">Meyve, Sebze</a></li>
              <li><a href="et.jsp">Et, Tavuk, Balik</a></li>
              <li><a href="sut.jsp">Sut, Kahvaltilik</a></li>
              <li><a href="icecek.jsp">Icecek</a></li>
              <li><a href="gida.jsp">Gida, Sekerleme</a></li>
              <li><a href="dondurma.jsp">Dondurma</a></li>
            </ul>
          </li>
          <li><a class="drop" href="sepet.jsp">Sepetim</a>
          </li>
        </ul>
      </nav>
    </header>
  </div>
</div>
<div class="overlay">
    <div id="pageintro" class="hoc clear"> 
      <article>
        <h3 class="heading">Meyve - Sebze</h3>
      </article>
    </div>
  </div>
<div class="wrapper row3">
  <main class="hoc container clear"> 
    <section id="introblocks">
      <ul class="nospace group btmspace-80">
        <li class="one_third first">
          <figure><a class="imgover" href="#"><img src="https://migros-dali-storage-prod.global.ssl.fastly.net/sanalmarket/product/28303000/patlican-kemer-kg-2ac52c.jpg" alt=""></a>
            <figcaption>
              <h6 class="heading">Patlıcan</h6>
              <div>
                <p>Sepete Ekle</p>
              </div>
            </figcaption>
          </figure>
        </li>
        <li class="one_third">
          <figure><a class="imgover" href="#"><img src="https://migros-dali-storage-prod.global.ssl.fastly.net/sanalmarket/product/28080000/domates-kg-c7462d.jpg" alt=""></a>
            <figcaption>
              <h6 class="heading">Domates</h6>
              <div>
                <p>Sepete Ekle</p>
              </div>
            </figcaption>
          </figure>
        </li>
        <li class="one_third">
          <figure><a class="imgover" href="#"><img src="https://migros-dali-storage-prod.global.ssl.fastly.net/sanalmarket/product/28420000/sogan-kuru-dokme-kg-25131e.jpg" alt=""></a>
            <figcaption>
              <h6 class="heading">Soğan</h6>
              <div>
                <p>Sepete Ekle</p>
              </div>
            </figcaption>
          </figure>
        </li>
      </ul>
    </section>
    <hr class="btmspace-80">
    <div class="clear"></div>
  </main>
</div>
<div class="wrapper row3">
  <main class="hoc container clear"> 
    <section id="introblocks">
      <ul class="nospace group btmspace-80">
 		<%        
                         String uk=request.getParameter("urunKodu");
                         String urunFotograf=request.getParameter("urunFotograf");
                         String urunAd=request.getParameter("urunAdi");
                         String uf=request.getParameter("urunFiyati");
                         if((uk!=null) && (urunFotograf!=null) && (urunAd!=null) && (uf!=null)){
                             int urunKodu=Integer.valueOf(uk);
                             int urunFiyati=Integer.valueOf(uf);
                             List<urunModel> sepetim= (List<urunModel>)session.getAttribute("sepet");
                             if(sepetim==null){
                                 sepetim=new ArrayList<>();
                             }
                             urunModel sepetUrun=new urunModel(urunKodu,urunFotograf,urunAd,urunFiyati);
                             sepetim.add(sepetUrun);
                             session.setAttribute("sepet",sepetim);
                         }    
                 %>
<%
urunController data=new urunController();
List<urunModel> urunler=data.readingData("SELECT * FROM urun WHERE kategoriKodu=1");


for(urunModel urun:urunler){
    %>
    
    
    
        <li class="one_third">
          <figure><a class="imgover" href="meyve.jsp?urunKodu=<%=urun.getUrunKodu()%>&urunFotograf=<%=urun.getFotograf()%>&urunAdi=<%=urun.getUrunAdi()%>&urunFiyati=<%=urun.getUrunFiyat()%>"><img src="https://www.acibademhayat.com/Images/YayinMakaleler/kirmizi-et-balik-ve-beyaz-et-secme-tuyolari_1693_1.jpg" alt=""></a>
            <figcaption>
              <h6 class="heading"><%= urun.getUrunAdi() %></h6>
              <div>
                <p>Sepete Ekle</p>
              </div>
            </figcaption>
          </figure>
        </li>
    <% }


%>
        
      </ul>
    </section>
    <hr class="btmspace-80">
    <div class="clear"></div>
  </main>
</div>
<div class="wrapper row3">
  <main class="hoc container clear"> 
    <section id="introblocks">
      <ul class="nospace group btmspace-80">
   <li class="one_third first">
<figure><a class="imgover" href="#"><img src="https://migros-dali-storage-prod.global.ssl.fastly.net/sanalmarket/product/27260002/limon-kg-fbc52a.jpg" alt=""></a>
  <figcaption>
    <h6 class="heading">Limon</h6>
    <div>
      <p>Sepete Ekle</p>
    </div>
  </figcaption>
</figure>
</li>
        <li class="one_third">
          <figure><a class="imgover" href="#"><img src="https://migros-dali-storage-prod.global.ssl.fastly.net/sanalmarket/product/28290036/28290036-6a65f9.jpg" alt=""></a>
            <figcaption>
              <h6 class="heading">Patates</h6>
              <div>
                <p>Sepete Ekle</p>
              </div>
            </figcaption>
          </figure>
        </li>
        <li class="one_third">
          <figure><a class="imgover" href="#"><img src="https://migros-dali-storage-prod.global.ssl.fastly.net/sanalmarket/product/28054104/biber-koy-usulu-kg-48f25e.jpg" alt=""></a>
            <figcaption>
              <h6 class="heading">Biber</h6>
              <div>
                <p>Sepete Ekle</p>
              </div>
            </figcaption>
          </figure>
        </li>
      </ul>
    </section>
    <hr class="btmspace-80">
    <div class="clear"></div>
  </main>
</div>
<div class="wrapper row3">
  <main class="hoc container clear"> 
    <section id="introblocks">
      <ul class="nospace group btmspace-80">
        <li class="one_third first">
          <figure><a class="imgover" href="#"><img src="https://migros-dali-storage-prod.global.ssl.fastly.net/sanalmarket/product/27081000/27081000-7e292e.jpg" alt=""></a>
            <figcaption>
              <h6 class="heading">Çilek</h6>
              <div>
                <p>Sepete Ekle</p>
              </div>
            </figcaption>
          </figure>
        </li>
        <li class="one_third">
          <figure><a class="imgover" href="#"><img src="https://migros-dali-storage-prod.global.ssl.fastly.net/sanalmarket/product/28120036/28120036-a19bd0.jpg" alt=""></a>
            <figcaption>
              <h6 class="heading">Havuç</h6>
              <div>
                <p>Sepete Ekle</p>
              </div>
            </figcaption>
          </figure>
        </li>
        <li class="one_third">
          <figure><a class="imgover" href="#"><img src="https://migros-dali-storage-prod.global.ssl.fastly.net/sanalmarket/product/27191001/27191001-9f33c7.jpg" alt=""></a>
            <figcaption>
              <h6 class="heading">Karpuz</h6>
              <div>
                <p>Sepete Ekle</p>
              </div>
            </figcaption>
          </figure>
        </li>
      </ul>
    </section>
    <hr class="btmspace-80">
    <div class="clear"></div>
  </main>
</div>
<div class="wrapper coloured">
  <section id="ctdetails" class="hoc clear"> 
    <ul class="nospace clear">
      <li class="one_quarter first">
        <div class="block clear"><a href="#"><i class="fas fa-phone"></i></a> <span><strong>Telefon Numaramız:</strong> +00 (123) 456 7890</span></div>
      </li>
      <li class="one_quarter">
        <div class="block clear"><a href="#"><i class="fas fa-envelope"></i></a> <span><strong>Mail:</strong> destek@gmail.com</span></div>
      </li>
      <li class="one_quarter">
        <div class="block clear"><a href="#"><i class="fas fa-clock"></i></a> <span><strong> Pazartesi - Pazar:</strong> 00.00 - 00.00</span></div>
      </li>
      <li class="one_quarter">
        <div class="block clear"><a href="#"><i class="fas fa-map-marker-alt"></i></a> <span><strong>Adres:</strong> Atakum/SAMSUN <a href="#"></a></span></div>
      </li>
    </ul>
  </section>
</div>
<script src="../layout/scripts/jquery.min.js"></script>
<script src="../layout/scripts/jquery.backtotop.js"></script>
<script src="../layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>