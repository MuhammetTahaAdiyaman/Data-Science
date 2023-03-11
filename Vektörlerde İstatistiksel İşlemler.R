#***************************VEKTÖRLERDE İSTATİSTİKSEL İŞLEMLER************************************
#Bu bölüm ile birlikte başlangıç düzeyini bitirip temel düzeye geçmiş bulunmaktayız.
#bu bölümde temel istatistiklerden bahsedeceğiz başka bir deyişle betimsel istatistikler
#bu istatistiklerin nasıl hesaplanacağından bahsedeceğiz.
#peki nedir göreceğimiz konular? ortalama, vektörlerin toplamı, varyans, standart sapma, normal dağılım hesaplamalarını
#normal dağılan verileri nasıl oluşturacağımzı göreceğiz bu bölüm kapsamında
#ilerleyen bölümlerde daha ileri ve daha derin istatistiksel hesaplamaları göreceğiz.

#bu bölümde toplam ve ortalamadan bahsedeceğiz
#toplam vektör içindeki elemanların toplamı şeklinde ifade edebiliriz
#ortalama ise vektör elemanlarının toplamının eleman sayısına bölümü ile elde edebiliriz. 
#bunların hepsinin fonk. var bu derste bunları kullanmayı öğreneceğiz.

x <- c(23,45,67,43,56)
#bizim vektörümüzde kaç tane elemanımız var bunu N veya n ile gösteriyoruz.
#bunu bulmayı daha önceki derslerde öğrendiğimiz length() fonk. ile buluyoruz.
length(x)

#toplamı nasıl bulurum ? 
#kısa elemanlı vektörlerde
x[1] + x[2] + x[3] + x[4] + x[5]
#şekkinde buluruz ama büyük veri setlerinde bu yöntemi yapmak imkansız.
#bundan dolayı R da bulunan sum() fonk. kullanırız.
sum(x)

#ortalama nasıl bulunur?
#ilk başta düz mantık ile hesaplayalım
sum(x) / 5
sum(x) / length(x)
#bu iki yöntem de doğru sonuca ulaştırır. ama pratik değil. 
#bundan dolayı R da ortalama bulmak için mean() fonk. kullanırız.
mean(x)

#***************BETİMSEL İSTATİSTİKLER SERBESTLİK DERECESİ NEDİR? NASIL HESAPLANIR?************************************
#Serbestlik derecesi nedir ?
#Aslında serbestlik derecesi = gözlem derecesinin 1 eksiği = (n-1) dir.
#Çoğu istatistiki raporlarda serbestlik derecesi görülür. İngilizce raporlarda ise degree of freedom olarak belirtilir.
#Peki neden biz n-1 olarak alıyoruz serbestlik derecesini. Hemen buna bir açıklık getirelim.

#Örneğin haftanın 7 günü için tam 7 adet şapkam olduğunu düşünelim.
#Her gün bu şapkalardan bir tanesini seçelim
#Pazartesi için 7 taneden 1 tane seçebilirim
#Salı 1 tane pzt seçtiğim için 6 taneden 1 tane seçebilirim
#Çarşamba 5 taneden 1 tane seçebilirim
#Perşembe 4 taneden 1 tane seçebilirim
#Cuma 3 taneden 1 tane seçebilirim
#Cumartesi 2 taneden 1 tane seçebilirim
#Amaa Pazar günü geriye bir tane kaldığı için onu takmak zorundayım. Orada seçim yapma hakkım yok.
#Pazar gününün bir serbestiliği yok, O yüzden serbestlik derecesi her zaman n-1 olarak alınır yani 7-1 = 6.

#bir de numeric veriler üzerinden örnek verelim.
#5 değerden oluşan bir değişken(vektör) ortalaması 20dir.
#sayıları bilmediğimiz için yani değerler verilmediği için biz 5 elemanı oluşturacağız.
#1.eleman 10 olsun
#2.eleman 2 olsun
#3.eleman 3 olsun
#4.eleman 6 olsun
#5.eleman ortalama 20 olması için 79 olmak zorunda ki toplamı 100 olsun ort 20 olsun.
#bu problem için bizim serbestlik derecesi 4 oluyor. Sadece ilk 4 eleman için istediğim değerleri verebiliyorum. Son elemana vermem gerekeni veriyorum bunun için bir serbestliğimiz yok.

#Serbestlik derecesinin R da bir fonk. yok. Zaten n-1 ile bulunuyor
#bir örnek yapalım.
x <- c(1,2,3,4,5)
length(x) #gözlem sayımız, eleman sayısı
sd <- length(x) - 1
sd

#serbestlik derecesini genellikle istatistiki tablolarda okunurken kullanılıyor. Mesela F tablosu okunurken veya T tablosu okunurken. Biz bu T tablosundan olasılık değeri. Doğal olarak olasılıkda serbestlik derecesini bağlı oluyor. 

#*****************************BETİMSEL İSTATİSTİKLER-STANDART SAPMA************************************
#Peki standart sapma nedir ? 
#bunu açıklamadan önce 2 tane formülü var 1.popülasyon ort. biliniyor 2.popülasyon ort. bilinmiyor
#xi-xi'nin ortalamasının karesinin n-1'e bölümünün karekökü sonucunda hesaplanıyor ve sigma ile gösteriliyor.
#peki ilk formülde tam olarak napılıyor. Toplam formülü var i=1 den N e kadar. 1 den popülasyonun sayısına kadar veya örneklem veya gözlem sayısına kadar gidiyor. Değişkendeki bütün elemanları değişkenin(örneklem) ortalamsından çıkartarak karesini alıyor ve n-1 bölüp karakökünü alıp sonuca ulaşıyor. 
#ikinci formülde ise mü işareti görüyor mü = popülasyon ortalamasıdır. Burada N e bölünüyor yukarıda n-1 e bölünüyordu. ikinci formülde genellikle popülasyon ortalaması biliniyor. ilk formül kullanıldığında da popülasyon ortalaması bilinmiyor. 
#Peki bu popülasyondan kastımız ne ?
#örneğin ben bir anket düzenliyorum ve bu anketi tam 100 kişiye yapacağım, belirli bir popülasyonum var, bu popülasyon ise bir üniversitedeki matematik öğrencileri diyelim öğrencilerin sayısı 100 ve ben 100 kişiye bu anketi yaptığım zaman artık popülasyonun tamamını tamamlamış oluyorum. Popülasyon ortalamasını da biliyorum olacağım. Bundan dolayı 2.formülde n-1 kullanılmıyor n kullanılıyor.
#fakat diyelim ki 100 öğrenci var ama 50 tanesi ile anket yaptık. bütün popülasyonu olmadık dolayısıyla popülasyonun gerçek ortalamasını bilmiyoruz ben sadece aldığımız örneklemin ortalamasını biliyorum bu durumda da n-1 kullanılıyor.
#n-1 serbestlik derecesinde bahsetmiştik. popülasyon ortalamasını bilmiyoruz örneklem almışız ve sonuncu örneklem bu popülasyonun gerçek ortalamasını belirleyen bir değer olabilir, o yüzden popülasyon ortalaması bilinmediği zaman sadece örneklem üzerinde çalışıyorsak bunu n-1 olarak alıyoruz.
#Türkiye geneli anketlerde örneklem alırız herkese anket yaptıramayız bundan dolayı n-1 alırız
#biyolojik araştırmalarda bütün popülasyon bilinir bir araştırma yapıyoruz ve deney ile ilgili bütün sonuçlar elimzidedir. bundan dolayı N kullanır.

#Peki gelelim standart sapma nedir ?
#Standart Sapma değişkendeki değerlerin ortalamadan ne kadar saptığını gösteren bir metriktir.
#Başka bir deyimle değerlerin ortalamadan sapma değerlerinin ortalaması
#Standart sapma değerinin yüksek olması 1 birim üzerinden değişkendeki değerlerinin birbirine uzak olduğunu, yani geniş dağıldığını göstermektedir.

#ileriki derslerde T dağılım, Normal dağılım göreceğiz.
#T dağılımın standart sapması Normal dağılıma oranla daha yüksektir. T dağılımı daha yayvan bir dağılımdır. Değerler birbirine uzak olabilirler.
#şimdi R da standart sapma hesaplamasına geçelim.

x <- c(12,34,56,34,23,45)
length(x)
#6 tane elemandan oluşuyor
#standart sapmayı hesaplamak için sd() fonksiyonunu kullanıyorum. Standar Deviation dan gelmektedir.
sd(x)

#bir de ortalamyı hesaplayalım
mean(x)

#standart sapma değerlerin ortalamadan ne kadar saptığını gösteriyor demiştik.
#34 + 15 = 49
#34 -15 = 19
#genellikle değerlerimiz 19 ile 49 arasında diyebiliriz.

#*****************************BETİMSEL İSTATİSTİKLER-VARYANS************************************
#standart sapmanın karesi varyansa eşittir.
#Varyans gözlemlerin değişkenliğini tanımlayan numeric bir değerdir. Yani standart sapma neydi ortalamadan ne kadar saptığını gösteriyordu. Varyan gözlemlerin(eleman, değerlerin) değişkenliğini tanımlıyor
#Başka bir deyimle gözlemlerin örneklemde ne kadar yayıldığını gösteren değerdir.
#Standart sapmanın farkı, standart sapma veri set içerisindeki gözlemlerin ortalamadan farklılığını tanımlar, varyans ise değişkenliliği tanımlar.

x <- c(12,14,10,11,13,17,16)
#standart sapma
sd1 <- sd(x)
#varyans, standart sapmanın karesi ile hesaplanır.
sd(x)**2
#varyan bir de var() fonk. ile de hesaplanır.
var1 <- var(x)
#ortalama
mean(x)

#biraz daha farklı bir vektör oluşturalım ve bunun üzerinde görelim farkı
y <- c(12,25,60,56,35,24,45)
sd2 <- sd(y)
var2 <- var(y)
mean(y)
sd1;var1;sd2;var2
#y vektörünün standart sapmasında artma var veriler fazla 
#ne demiştik standart sapma ortalamadan ne kadar sapma olduğunu gösterir.
#standart sapma büyükse daha yayvan bir dağılım yapıyordu.birbirinden daha uzak oluyordu değerlerimiz. #görüldüğü üzere 12 ile 14 arasındaki fark az iken 12 ile 25 arasındaki fark fazlalışıyor.
#varyans değişimden standart sapmaya göre çok daha etkileniyor.

#*****************************BETİMSEL İSTATİSTİKLER-MEDYAN, AÇIKLIK VE ÇEYREKLİKLER************************************
#Medyan = ortanca değer yani bir serimizi büyükten küçüğe doğru sıraladığımızda ortada kalan değer bize medyan değerini vermektedir.
#Açıklık = minimum değer ile maksimum değer arasındaki farkımız bize açıklık değerini veriyor.
#Çeyreklik = biz serimizi dört eşit parçaya böldüğümüzde elde ettiğimiz q1 q2 ve q3 değerleridir. bu değerler bizim 1.çeyrek 2.çeyrek ve 3.çeyrekleri elde etmemizi sağlıyordu.

x <- c(12,34,56,23,34,12,35)
median(x)
#medyan ortanca değer
mean(x)
#ortalaması

#açıklığın bir formülü yok ama e.b-e.k
max(x) - min(x)
#açıklık ingilizce de range olarak kullanılır ama burada aynı şey değil.
#R da range fonk. e.b ve e.k değerleri gösterir ama oradan açıklıkda bulabilriz.
r <- range(x)
r[2] - r[1]

#Çeyreklikler ise bir seriyi dörte böldüğümüzde elde ettiğimiz değerlerdir.
#çeyrekikleri bulmak için quantile() fonk. kullanırız.
quantile(x)
#%0 = e.k değer
#%100 = e.b değer
#%25 = 1. çeyrek
#50 = 2.çeyrek
#75 = 3.çeyreğimizi gösterir.

#ben quantile() fonk. sadece çeyrekliklerimi görmek için probs attribute kullanırız.
quantile(x, probs = c(0.25, 0.50, 0.75))
#bu oranları değiştirebiliriz de
quantile(x, probs = c(0.10, 0.60, 0.95))
#10% luk dilime, 60%lık dilime ve 95%lik dilime girenleri göstermektedir.

#*****************BETİMSEL İSTATİSTİKLER-MEDYAN VE ORTALAMA ARASINDAKI FARK************************************
#Ortalama = bir serideki bütün elemanların toplamının ortalama sayısına bölümüydü.
#Medyan = bir serideki bütün elemanları büyükten küçüğe sıralayıp ortanca elemanın elde edilmes ile bulunuyordu.
#İstatistik de testler 2 ye ayrılıyor. Bunlar non-parametric ve parametric testler
#Parametric testlerde genellikle ortalama baz alınırken
#Non-parametric testlerde genellikle medyan baz alınır.

#Şimdi bir grafik düşünelim mod, medyan ve mean değerleri var
#mod = bir seri de en çok tekrar eden sayıyı temsil eder ve grafikte en uç nokta orasıdır. en sağda
#medyan = ortanca değeri gösterir hemen modun altında yer alır.
#ortalama = en alt kısımda yer alır
#mean < median < mod şeklinde sıralanır.

#diğer grafikte ise mod en solda ve en uç noktası, sonra median sonra da mean gelir.
#diğer grafikte ise sıralama mod < median < mean
#eğer median ortalamadan büyükse değişken sola çarpık bir dağılım gösteriyor. Yani verimiz daha çok sağ tarafta yoğunlaşmış
#eğer tüm değerler eşit ise mean ortadaır.
#eğer median ortalamadan küçükse değişken sağa çarpık bir dağılım göstermektedir. Yani verimiz daha çok sol tarafta yoğunlaşmış

#genellikle bir serinin ortalaması alınmadan önce aykırı değerler var mı bakılır.
#aykırı değerler e.b veya e.k yani seri içinde sırıtan çok büyük ve çok küçük değerler
#eğer serimizde aykırı değerler varsa median kullanılması önerilir.
#eğer serimizde aykırı değerler yoksa mean kullanılması gerekir.

#*****************ÇARPIKLIK KATSAYISI NEDİR ? VE NASIL HESAPLANIR ?***********************************
#geçen dersimizde bir kaç tane terim kullanmıştık. Bu terimler sağa çarpıklık veya sola çarpıklıktı.
#sola çarpıklık = verilerimizin biraz daha sağ tarafta bulunması
#sağa çarpıklık = verilerimizin biraz daha sol tarafta bulunması
#sola çarpıklık şöyle akılda kalabilir verilerimizi sol taraftan bir şey itmiş ve verilerimiz sağa kaymış gibi düşünebiliriz.
#aynı şekilde sağa çarpıklık ise verilerimizi sağ taraftan bir şey itmişde verilerimiz sola kaymış gibi düşünebiliriiz.
#genellikle çarpıklık katsayıları -1 ile 1 arasındadır.
#verilerimiz 0 ile 1  arasında olduğu zaman değerlerimiz biz deriz ki verilerimiz daha çok sağa çarpık
#-1 ile 0 arasında yani -1 e doğru gidiyorsa değerlerimiz bu sefer diyoruz ki verilerimiz sola çarpık.
#şimdi r da bunları gösterelim. hem medyan ile ortalama arasında farkını da görmüş olalım

#şimdi vektör oluşturalım 2 tane değeride aykırı değer olsun
x <- c(12,13,14,15,16,100,120)
x
#hemen xin ortalamasına bakalım
mean(x)
#şimdi ortalama 41 küsür. dikkat ettiysek çoğunluk değerlerimiz 12 ile 16 arasında ama aykırı değerler 100 ve 120.
#şimdi tam bu noktada önceki derslerde bir hatırlatma yapalım. Eğer verilerimizde aykırı değerler varsa median kullanımı daha uygun olur demiştik.Çünkü median verilerimizin çoğunluk olduğu yere hitap ediyordu.
#şimdi verilerimizin median değerine bakalım
median(x)
#dikkat ettiysek median ve mean arasında devasa derecede fark var. Peki bunların hangisi doğru ?
#baktığımzıda aykırı değerler olduğu zaman median kullanımı daha doğru olacaktır. Verilerimiz daha çok 12 ile 16 arasında dağılmış. Yani biz tercihimizi çoğunluktan yana kullanıyorsak eğer median bize daha tutarlı sonuç verebilir.
#ama verilerimiz daha normal dağılıyorsa yani birbirine yakın şekilde artış gösteriyorsa mean kullanımı ile median kullanımı birbirine yakın değerler bize verecektir.
#hemen buna bir örnek verelim.
y <- c(12,15,17,18,20,24,26)
y
#ortalama
mean(y)
#medyan
median(y)
#veriler birbirine yakınsa ve aykırı değer yoksa ne elde ediyorum median ile mean değerimin birbirine yakın olduğunu elde ediyorum
#geçen dersimizde ne demiştik?
#eğer mean > median ise bizim verilerimiz sağa çarpıklık gösteriyor demektir.
#şimdi bunun üzerine bir çalışma yapalım hem de görselleştirmeye azıcık girelim.
#x ve y elemanlarının dağılımını incelemem için histogram grafiği çizmem gerekiyor.
#histogram grafiğini hist() fonk. ile çizdiriyoruz.
hist(x)
#x için konuştuğumuzda verilerimizin çoğu 0 ile 20 arasında, verilerimizden 2 tanesi 80 ile 100 arasında olduğunu görüyoruz.
#şimdi line çizersek eğer 120 den başlayıp 0 a kadar üst limit üzerinden bize sağa çarpıklıkda gördüğümüz grafiği veriyor. Yani sanki sağ tarafan bir şey ittirmiş ve değerlerimiz sol tarafa kaymış gibi.
#o zaman şimdi hemen çarpıklık katsayısını kontrol edelim.
#bunun için bir kütüphane install etmemzi gerek. Çünkü bu katsayıyı R da default bir fonk. yok. e1071 paketini yükleyelim.
install.packages('e1071')
library(e1071)
#e1071 kütüphanesi içinde skewness() fonk. bizim çarpıklık katsayımızı bulmamıza yarayan fonkdur.
#şimdi hemen kullanalım.
skewness(x)
#x vektörümün çarpıklık katsayısı 0.789901 olduğunu görüyoruz.
#biz ne demiştik; çarpıklık katsayısı -1 ile 1 arasında. Eğer 0 ile 1 arasında ise bu sağa çarpıklık gösteriyordu. 0.78 de 0 ile 1 arasında olduğu için x sağa çarpıklık gösteriyor.

#şimdi bunun tersi olan sola çarpıklık durumuna bir örnek yapalım.
z <- c(1,2,3,60,70,60,70,80,70)
z
#şimdi mean ve median kontrolü yapalım.
mean(z)
median(z)
#eğer median > mean ise sola çarpıklık durumu oluşuyordu bunu görmek için histogram çizdirelim.
hist(z)
#zaten üst sınırdan bir çizgi çizdiğimizde değerlerin 60 ile 80 arasında yükseldiğini görüyoruz. Ve sanki soldan bir kuvvet uygulanmış değerlerimiz sağa kaymış gibi görünüyor.
#hemen bunu kesinleştirmek için skewness() fonk. kullanarak çarpıklık katsayısını bulalım.
skewness(z)
#gördüğümüz üzere -0.59 çıktı. biz demiştik ki çarpıklık katsayısı -1 ile 0 arasında ise o sola çarpıktır.
#NOT: kural -1'e ne kadar çok yaklaşırsa o kadar çok sola çarpıklık gösterir.
#NOT2: pozitif 1'e ne kadar çok yaklaşırsa o kadar çok sağa çarpıklık gösterir.
#Z vektörü -0.50 yarı sola çarpıklık da diyebiliriz.

#*****************BETİMSEL İSTATİSTİKLER - FREKANSLARIN ELDE EDİLMESİ***********************************
#Frekans nedir?
#frekans bir değiken düşünün. Bu değişken içindeki elemanların tekrar sayısıdır.
#örneğin değişkenimiz 12 12 13 13 14 14 olsun. Bu değişkenimizin frekans sayısı 12 nin frekansı 2 dir. çünkü 2 kez tekrar ediyor. 13ün frekansı 2 dir çünkü 2 kez tekrar ediyor.
#frekasn bir seride bir değerin ne kadar tekrar ettiğini gösterir.
#şimdi hemen bununla ilgili bir örnek yapalım.

c <- c(12,12,13,13,14,14,13,12,15,15,16)
c

#şimdi frekans göstermeden önce unique() fonk. anlatmak istiyorum.
#unique() fonk. bir değişkendeki tekil elemanları yani uniq değerleri çıkartmamız yardımcı olur. aslında değişkenler tekrarlı ise hepsinden bir tanesini gösteriyor.
unique(c)

#şimdi frekansları ise table() fonk. ile buluyoruz.
#aslında table() fonk. bir tablo oluşturuyor ve bu sayede biz elemanların kaç kere tekrar ettiğini bulabiliyoruz
table(c)
#üstteki eleman altında yer alan sayı ise kaç defa tekrar ettiği.
t <- table(c)
t
#şimdi tablomuzda hangi elemanlar var bunu kontrol etmek için names() fonk. kullanmamız gerkeir.
names(t)
#şimdi biz tablomuzda spesifik olarak da seçimleri yapılabilir. 3 yöntem ile seçebiliriz.
#indis değeri ile seçim.
t[1]
t[2]
t[3]
t[4]
t[5]

#ikinci yöntem tek parantez ile seçim yapma
t[12]
#eğer bu şekilde seçersek NA alacağız çünkü 12.indise ait bir değer yok. Değer seçimlerini tırnak içinde yapmamız gerek.
#names() ile baktığımızda elemanlar "12" "13".. şeklinde yazıldı. Yani karakter şeklinde almış ondan dolayı şöyle yapmalıyız.
t["12"]

#şimdi listelerde gördüğümüz yöntem ise çift parantez ile listenin elemanına erişim sağlıyorduk.
t[["12"]]
#çift parantez ile kullanırsak ise direkt kaç kez tekrar ettiğine ulaşmış oluyoruz.

class(t)
#t değişkeni bir table'dır. R daki veri yapılarından bir tanesidir.
#matris, vektör, data.frame olduğu gibi buda bir veri yapısıdır.
#yukarıdaki örnek numeric bir örnekti.
#aynı şekilde karakterlerde de bir örnek yapalım.

c1 <- c('a','a','a','b','c','b','c','d')
c1

table(c1)
t1 <- table(c1)

#indis ile erişme
t1[1]

#değer ile erişme
t1["a"]

#direkt tekrar sayısına erişme
t1[["a"]]

#*****************KAYIP GÖZLEMLERİN HESAPLAMALARA ETKİSİ***********************************
#kayıp gözlem nedir ? 
#R da bunlar NA olarak geçer, SQL'de null veya farklı programlama dillerinde ise undefined olarak da geçebiliyor.
#bu dersimizde bu missing value'ların bizim hesaplamalarımıza etkisinden bahsedeceğim.

x <- c(12,13,14,15,NA)
#şimdi ilk olarak toplayalım elemanlarımızı
sum(x)
#gördüğümüz üzere sonuc NA çıktı. Peki neden NA ? çünkü vektörümün bir elemanı NA.
#sum() fonk. bütün elemanları toplayıp bana bir çıktı veriyordu. NA'nın sayısal bir değeri olmadığı için bana topluyor ve NA sonucunu veriyor.
#peki ben bu durumu nasıl düzeltirim.
sum(x, na.rm = TRUE)
#na.rm = na.remove anlamına gelmektedir. yani NA olan değerleri vektörden kaldır anlamına geliyor. Bu True olduğu zaman NA olan değerler vektörden çıkartılır ve fonk. o şekilde çalışır.

#aynı işlemi mean() fonk. yapalım.
mean(x)
#görüldüğü üzere sonuç yine NA çıktı.
mean(x, na.rm = T)

#şimdi aklımıza şu soru geliyor: bizim vektörümüzün eleman sayısı aslında 5, NA yı sildiğimizde na.rm ile, peki ortalamayı bulurken toplayıp 5 elemana mı böldü yoksa 4 elemanamı
#bunu hemen kanıtlayalım
(12+13+14+15) / 4
(12+13+14+15) / 5
#NOT: na.rm = T yaptığımızda ortalamayı hesaplarken de NA eleman olarak sayılmıyor. yani na.rm = T olduğu zaman onu göz ardı ederek tanımlı değerler üzerinden işlemler devam eder.

#bir de standart sapma üzerinde sonuç nasıl oluyor bir bakalım.
sd(x)
#yine sonuç NA hemen bu durumu çözelim
sd(x, na.rm=T)

#bir de median üzerinde deneyelim
median(x)
#yine sonuç NA hemen bu durumu da NA yı göz ardı edelim
median(x, na.rm = T)

#yani genellikle hesaplama yaparken, belirli istatistikleri elde ederken na.rm parametresini belirtmemiz gerekiyor.
#diyelim ki 2000 veri seti üzerinde çalışıyorsunuz ve bunun içinde yalnızca bir tane NA değeri var ve nerede olduğunu bilmiyorsunuz. bunu nasıl tespit edebiliriz.
#bunun içinde bir fonk. var bu fonk. is.na() fonk.
#is.na() fonk. = benim belirttiğim değerde bir NA değeri var mı? bunu soruyor ve bize logic olarak cevap veriyor.
is.na(x)
#görüldüğü üzere her elemana soruyor ve sonuncu eleman TRUE olduğu için o eleman NA değeri olduğunu bize söylüyor.
#peki ben bu NA elemanının indis değerini öğrenmek istersem de geçmiş derslerimizde öğrendiğimiz which() fonk. kullanmamız gerekir.
which(is.na(x))
#bize 5 sonucu veriyor. 5.indis değerine sahip eleman NA dır. diyor.

#farklı bir örnek yapalım daha fazla NA elemanı olsun
y <- c(12,13,14,15,NA,NA,14,1,15,NA)
y
is.na(y)
which(is.na(y))
#5.6. ve 10.indis değerleri NA olduğunu söylüyor.

#peki ben indisleri elde etmek istemiyorum sadece veri seti içinde NA eleman var mı yok mu bunu öğrenmek istiyorum.
#bunun içinde any() fonk. kullanmam gerek.
any(is.na(y))
#görüldüğü üzere logic cevap veriyor ve bu veri seti içinde NA değeri bulunmaktadır diyor

#hemen na değeri olmayan bir vektör oluşturalım
t <- c(13,14,23,445,23,434,3)
any(is.na(t))
#görüldüğü üzere t vektöründe NA değeri var mı diye sorduk ve FALSE cevabı aldık yani yok anlamına gelmektedir.

#peki bunu dinamik programlama da nasıl kullanırım.
#örneğin ben kodları yazdım ve teker teker na elemanlarını kotnrol etmek istemiyorum.
#yani sum işlemi yapacağım na var mı yok mu varsa na.rm=T yazmak istemiyorum.
#otomatik olarak eğer na değeri varsa silerek işlemi devam ettirsin yoksa direkt devam ettirsin istiyorum bunun için dinamik hale getirmek için
#x vektörü üzerinde örnek gösterelim ve ortalamasını alalım.
mean(x, na.rm = any(is.na(x)))
#burada anlam şu x vektörü içinde na.rm parametresi varsa diye sorgu geliştirdik any(is.na(x)) diye bunun sonucu TRUE olursa bu na.rm = TRUE olacak ve NA değerleri silinecek o şekilde ortalama alınacak.
#ama any(is.na(x)) sonucu FALSE çıkarsa na.rm devreye girmeden ortalama işlemi alınacak.
#bu şekilde de dinamikleştirebiliriz.

#başka bir tercih de yapabiliriz. NA değerleri bizim için önemlidir.
#NA değerine sahip elemanlar bizim için 0 anlamına gelsin. yok anlamına gelmesin.
#bir anket yaptık ve o kişi ankete cevap vermemiş ben o kişiyi yok saymak yerine 0 olarak değerlendirmek istiyorum.
#hatırlarsak vektörlerde bir işlem yapıyorduk tekrar atama ile eleman değiştiriyorduk.
#şimdi bunu yapalım.
#1-öncelikle y vektörümde bulunan NA olan değerlerin indislerini öğrenelim.
which(is.na(y))
#2-şimdi ben bu indisleri na diye bir değişkene atayayım
na <- which(is.na(y))
#3-daha sonra bu na değişkenine sahip olan değişkenlere ulaşalım.
y[na]
#4-şimdi bu değerlere atama gerçekleştirelim ve 0 olsun.
y[na] <- 0
#şimdi y vektörümüzü tekrar kontrol edelim bakalım NA değerlerimiz 0 olmuş mu ?
y
#görüldüğü üzere olmuş.

#bu işlemi which fonk. kullanmadan da gerçekleştirebiliriz.
y <- c(12,13,14,15,NA,NA,14,1,15,NA)
#y yi tekrar NA çevirelim
#direk şu şekilde de yapabiliriz.
y[is.na(y)]
#direkt buradan da atama sağlayabiliriz.
y[is.na(y)] <- 0
y

#************************NORMAL DAĞILAN VERİLER***********************************
#normal dağılan veriler anoma testinin özelliklerini sağlayan verilerdir.
#normal dağılan veriler aslında histogram grafiğine bakıldığında sol ve sağ eşit tam orta mü değerinde yoğunlaşma olarak görülmektedir.
#aslında normal dağılımda bir kural var mü değeri tam ortada, mü+standarsapma veya mü-standarsapma ortalamaya 34,13% uzaklığındadır.
#mü+-2standartsapma ise 13.59% uzaklığındadır ortalamaya
#34.19+13.59 = toplamı yüzde 49 veya 50 civarındadır.
#normal dağılımda benim verilerimin frekansları en yüksek mü değerinin olduğu kısımdadır. yani ortalamanın olduğu kısımda. yani benim verilerim normal dağılımda ortalamanın etrafında yoğunlaştığı anlamına gelmektedir.
#veriler ortalamdan uzaklaştıkça sayıları azalıyor, değerleri değil. mesela ortalama 14 standart sapma 13 11 ile 17 arasında 20 sayı var, 24 etradında 2 sayı var mesela.

#R programlama da normal dağılan veri oluşturmak istersek otomatik olarak.
#rnorm() fonk. kullanmamız gerekir.
#hemen örnek gösterelim 100 tane elemanı olan normal dağılan bir vektör oluralım.
rnorm(100)
r <- rnorm(100)
r
#eleman sayısına bir bakalım
length(r)

#şimdi bunun histogram grafiği nasılmış bir bakalım.
hist(r)
#gördüğümüz üzere tam ortada yoğunlaşmış bir grafik görüyoruz. eğri çizersek eğer dağ şekinde bir grafik oluşacak.

#NOT: default olarak rnorm() fonk. çalıştırıldığında ortalama = 0, standart sapma = 1 alınır değerler -1 ile 1 arasında olur.
#biz parametre kullanarak istediğimiz ortalama veya standart sapmaya göre de normal dağılan veriler oluşturabiliriz.
rnorm(30, mean=10, sd=3)
#şimdi ben dedimki 30 tane elemana sahip ve ortalaması 10 olacak standart sapması da 3 olacak şekilde veri seti oluştur dedik rnorm() fonksiyonuna
z <- rnorm(30, mean=10, sd=3)
#şimdi ortalama 10, sd = 3 olduğu için elemanlarımı 7 ile 13 arasında yoğunlukta oluşturulacak ama 17 değeri de olacaktır çünkü rastgele oluşturuyor.
z
#şimdi bunun histogram grafiğine bakalım.
hist(z)
#görüldüğü üzere yine biz üst sınırlardan çizgi çektiğimizda dağ şeklini anımsatıyor. yani mü değerinde yani ortalamanın etrafında yoğunlaştığı gözükmektedir sağ histogram grafiğinde bunun anlamı da bu z vektörü normal dağılıma sahiptir.

#ilerleyen derslerde elimizdeki değişkenlerin normal dağılıp, dağılmadığını kontrol eden fonk. veya istatistk testlerini de göreceğiz.
#bu dersimizde sadece rnorm() fonk. kullanarak nasıl rastgele normal dağılan bir vektör oluşturabiliriz bunu gördük.


#ödev cevapları
#100 adet rastegele normal dağılan vektör oluşturma
normv <- rnorm(100)
normv
#round() fonk. ile bu değerleri en yakınlarına yuvarlama
round(normv)

#oluşturduğumuz veriler üzerinde istatistiksel işlemler
#ortalama
mean(normv)
#standart sapma
sd(normv)
#medyan
median(normv)
#birinci ve üçüncü çeyreklik
quantile(normv, probs = c(0.25, 0.75))

#medyan ve ortalama farkı
median <- median(normv)
mean <- mean(normv)
median-mean
