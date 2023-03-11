#******************************************VERİ TÜRLERİ*****************************************
#Integer(Tam Sayı)
#Numeric(Reel Sayılar)
#Numeric = ondalıklı ve diğer reel sayılar iken, Integer = tam sayılar
#Character(String, Nominal)
#Factor(Ordinal)
#Logical(Mantıksal, T, F)

x <- c(12,12,12,15,43,23)
x
class(x)


y <- c('A','B','C')
y
class(y)

#factor değişkenini artık factor() fonk. ile oluşturmamız gerekiyor.
z <- factor(c('a','b','c'))
z
class(z)
#factor() fonk. dilersek level'de oluşturabiliyoruz. Ancak kendisi otomatik olarak oluşturuyor.

t <- c(T,F,T,T,F)
t
class(t)

#*************************************VERİ TÜRÜ KONTROLLERİ*****************************************
#veri türü kontrollerini 2 yol ile yapabiliriz.
#ilk yol logic mantık yöntemi ile hemen vektörlerimizi oluşturalım.

x <- c(1,2,3,4,5)
y <- c('A','B','C')
z <- factor(c('a','b','c'))
t <- c(T,F,TRUE,FALSE)

#şimdi ilk yolu görelim.
is.numeric(x)
is.integer(x)

is.logical(t)
is.factor(z)
is.character(y)

#şimdi bu yol ingilizcedeki gibi sorgulama ve cevabı bize logic olarak veriyor.
#is.numeric() aslında soruyor bu vektör numeric mi ? eğer numeric ise cevap olarak TRUE değil ise FALSE veriyor.
#biz yukarıda kendi yöntemlerimiz ile vektörleri oluşturduğumuz için hangisi hangi veri türünde biliyoruz ama dışarıdan aldığımız veri setlerinde daha çok bu şekilde sorgulamalar yapıyoruz.
#bu is. yöntemi bir fonksiyon içinde kullanımlarda yapıyor örnek bir önceki ders yapısında işlemiştik na.rm = any(is.na(x)) sağdaki fonk. logic cevabına göre fonksiyon NA olanları silecek veya silmeden devam edecek.

#ikinci yöntem ise baştan beridir kullandığımız yöntem olan class() fonk.
class(x)
class(y)
class(z)
class(t)

#bu yöntemi de genellikle if else şeklinde kullanabilirz if(class(x) == character) gibi kullanımları yapabiliriz.

#*************************************VERİ TÜRÜ DÖNÜŞÜMLERİ*****************************************
#as.numeric() -> numerice dönüştürme fonk.
#as.integer() -> integer'a dönüştürme fonk.
#as.logical() -> logical'a dönüştürme fonk.
#as.character() -> karaktere dönüştürme fonk.
#as.factor() -> factore dönüştürme fonk.

#numeric olan veriyi integer'a dönüştürelim.
x <- c(12,13,14,15,16)
class(x)
#x şu anda numeric hemen bunu integer'a dönüştürelim.
xI <- as.integer(x)
xI
class(xI)

#numeric olan veriyi karaktere çevirelim
x1 <- c(1,2,3,4,5)
class(x1)
x1 <- as.character(x1)
class(x1)
x1
#karaktere dönüşünce tırnak ile yazılıyor.
#Numeric ifadelerin karakter şeklinde gösterimi oluyor ancak karakter olan ifadelerin numeric şekilde gösterimi olmuyor.

#karakter olan veri türünü factor türüne dönüştürme
x2 <- c('A','B','C')
class(x2)
x2 <- as.factor(x2)
x2
class(x2)

#numeric olan veriyi logic'e dönüştürme
x3 <- c(1,0,0,1,1)
class(x3)
x3 <- as.logical(x3)
x3
class(x3)
#logic yalnızca numeric ile dönüşüm sağlıyor bilgisayar dili olduğundan dolayı 1,0 ile ilişkildir.

#*********************************VERİ TÜRÜ DÖNÜŞÜMLERİNDE ÖZEL DURUMLAR*****************************************
#geçen dersimizde ilk logic mantığını öğrendik. Karakteri logical türüne dönüştürdüğümüzde NA sonucunu alırız. Çünkü logic mantık sayısal mantık ile ilişkilidir.
#burada ise faktörler üzerine bir özel durumlardan bahsedeceğiz.

x <- factor(c('A','B','C','D'))
class(x)
x
#çağırdığımızda levelleri ile birlikte geldiğini görüyoruz.
#peki ben factorü numeric'e çevirmek istersem ne tarz bir sonuç ile karşılaşacağım ?
as.numeric(x)
#gördüğümüz üzere A,B,C,D olan factor vektörü numerice dönüşünce 1,2,3,4 oldu.
#Bunun nedeni faktör içinde olan levellerdan gelmektedir. Ne demiştik faktörün belirli seviyeleri vardı.
#bu seviyeler şu şekilde: 1.seviye = A, 2.seviye = B, 3.seviye = C, 4.seviye = D
#bundan dolayı çevirdiğimizde 1,2,3,4 sonucunu alıyorum.

#şimdi faktör içindeki elemanları biraz daha arttıralım.
x1 <- factor(c('A','B','C','D','A','B'))
x1
class(x1)
#şimdi x1 vektörümüzü numerice çevirelim
as.numeric(x1)
#numerice çevirince 1,2,3,4,1,2
#hemen levellara bakalım
x1
#burada gördüğümüz gibi levellar 1.seviye = A, 2.seviye =B, 3.seviye=C, 4.seviye=D
#leveller her zaman unique değerlerdir. elemanlarda 2 tane A olması level da 2 tane A olması anlamına gelmez.

#NOT: faktör içerisine girdiğim karakter değişkeni levellerini hesaplarken alfabetik sıraya göre hesaplar. Alfabetik önceliğe göre der ki A harfi ilk harf ondan dolayı 1. D harfi bu 4lü arasında sonuncu bundan dolayı 4.oldu der.

#peki elemanları A harfinden başlatmasak level değişirmi ?
x2 <- factor(c('D','C','A','B','C','D','A','B'))
x2
#gördüğümüz gibi yine level sıralaması alfabetik sıraya göre kendini ayarladı.
#bunu numeric çevirdiğimizde ise
as.numeric(x2)
#elemanların level sırasına göre numeric değerler geldiğini görmekteyiz.

#peki ben bunları alfabetik sıraya göre değil de kendi level sırasına göre sıralamak istersem levels parametresini kullanmam gerek.
x1 <- factor(c('A','B','C','D','A','B'), levels = c('C','D','B','A'))
#burada dedim ki 1.seviye C, 2.seviye D, 3.seviye B, 4.seviye A olsun dedim
x1
#bunun numeric türü dönüşümüne bakalım. Benim belirlediğim levele göre elemanların numeric sonuçları gelecektir.
as.numeric(x1)

#örneğin benim faktör değişkenim içinde numeric rakamalr var ben bunları numeric olarak nasıl alırım ?
x3 <- factor(c("12","13","16","35","32"))
x3
#levelleri sayı sırasına göre ayarladı.
#şimdi benim istediğim x3 faktörünü numeric yaptığımda direkt oradaki sayılar numeric olsun
#hemen deneyelim.
as.numeric(x3)
#gördüğümüz üzere yine leveller üzerinden bir sonuö getirdi.

#mesela bu gibi durumlarla ben bir dataset import ettim ve dataset içindeki rakamlar tırnak içinde yazılmıştı R bunu faktor olarak algıladı ama bunu bizim numerice çevirmemiz gerek bunun için ne yapmam gerek ?
#ilk önce faktör olan değişkeni karaktere dönüştür.
#daha sonra karaktere dönüştürdüğün veri setini ise numeric'e dönüştürerek levellere göre değil direkt elemanları koruyarak dönüştürebilirsin hadi deneyelim.

#ilk önce karaktere çevirelim.
x3 <- as.character(x3)
x3
class(x3)

#şimdi karakter olan x3 vektörünü numeric olarak dönüştürelim.
x3 <- as.numeric(x3)
x3
class(x3)

#gördüğümüz üzere istediğimize başarılı şekilde ulaşmış olduk.
#direkt olarak numeric çevirseydik leveller üzerinde bir 1,2,3,4 şeklinde sonuç alacaktık.