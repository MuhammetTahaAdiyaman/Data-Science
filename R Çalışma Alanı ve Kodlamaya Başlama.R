
## Kodlamaya Başlama

10001
5

#toplama işareti
5+5

#nesne tanımlama
x = 5
y = 10

5 + 10
#x ve y tanımlandığı için aşağıdaki işlemleri yapabiliriz
x+y
x-y
x/y
x*y

#yeni bir nesne tanımlayalım
z = 20

x-z

#vektörler
c(1,2,3,4,5)

y = c(1,2,3,4,5)

z <- c(1,2,3,4,5,6)

#yalnızca numeric değerler ile değil karakter vektörleri de oluşturabiliriz
t <- c("A","B","C","D")

z
t

#vektör içinde hem numeric hem de karakter verileri tutabilir miyiz ?
d <- c("a","b",1,2,3)
d


#liste tipi veri yapısı

#normalde vektörleri nasıl oluşturuyorduk
a <- c(2,3,4,5)
a

#listelerde vektörler gibi oluşturma açısından bir fark bulunmuyor ancak yapısal fark var
list() #şeklinde oluşturulur

b <- list(2,3,4,5)
b

#numeric
l1 <- list(13,56,47,89)
l1
#karakter
l2 <- list("A", "B")
l2
#hem karakter hem de numeric
l3 <- list("A" , "B" , 2 , 3 , "C")
l3

#liste içine vektör oluşturma

l4 <- list(c(1,2,3,4,5), 'A', 5)
l4

#listelerde bir de şöyle bir özelliğimiz var listelerdeki indis numaraları [[1]].. şeklinde değil karakter verelim


l5 <- list('a' = c(1,2,3,4,5), 'b' = 'A')
l5

#önceden oluşturmuş olduğumuz vektörü direkt liste içinde kullanabiliriz
g <- c(56,67)
l6 <- list('a' = g)
l6

#yukarıdaki mantık vektörler içinde geçerlidir iki vektörü bir vektör içinde birleştirebiliriz
f <- c(12,22)
h <- c(33,66)
fh <- c(f,h)
fh


#data frame
#data frame vektör ve listelerden temel farkı yapısının sütun ve satır şeklinde oluşturulmasıdır.
#data frameler sütunlardan(değişkenlerden) oluşur hemen örnek yapalım

x <- c(1,2,3,4)
y <- c('A' , 'B' , 'C' , 'D')
z <- c(22,33,44,55)

df <- data.frame(x,y,z)
df

#daha temiz şekilde görünmesi için R da kayıtlı tablo yapısı ile gösterebiliriz

View(df)

#data frame'lerde en önemli nokta sütunların eleman sayıları eşit olacak aksi takdirde hata alırız

t <- c(1,2,3,4,5)
m <- c(1,2,3)

df2 <- data.frame(t,m)

#data frameleri önceden tanımlanmış değişkenler ile de oluşturabiliriz fonksiyon içinde de oluşturabiliriz
df3 <- data.frame(c(1,2,3,4,5), c('a','b','c','d','e'), c(100,200,300,400,500))
View(df3)
#bu şekilde oluşturulduğunda sütun isimleri karışık gelecektir. bunun yerine aynı şekilde oluştururken sütun isimlerini de tanımlayalım

df4 <- data.frame('a'=c(1,2,3,4,5), 'b' = c('a','b','c','d','e'), 'c'=c(100,200,300,400,500))
View(df4)

#daha önceden oluşturduğumuz data frame sütunlarının isimlerini de değiştirebiliriz
df5 <- data.frame('Avar' = x, 'Bvar' = y, 'Cvar' = z)
View(df5)

#fonksiyon içinde atama operatörü olarak '=' kullanılmalıdır. '<-' bu değil.



#matrisler
#data frame matrisin bir kopyasıdır
#belirgin farkları bulunmaktadır. Örneğin data framelerde sütun isimleri bulunur ama matrislerde sütun isimleri belli değil indis değerleri ile oluşur.
#matrislerde çeşitli matematiksel işlemler yapılabilir matris çarpımları, çıkarma, bölme ayrıca matrise özel matematik işlemleri öz vektör bulma vs.
#matrix(vektör, satır sayısı, sütun sayısı, sıralama)
x <- c(1,2,3,4)
matrix(x, nrow=2, ncol=2)
#bu sütunlara göre sıralama eğer biz satıra göre sıralamak istersek
#2 sütun 2 satır olmasının sebebi 2*2=4 eleman olması

matrix(x, nrow=2, ncol=2, byrow=TRUE)

#farklı bir matris oluşturalım
y <- c(1,2,3,4,5,6,7,8)
matrix(y, nrow=2, ncol=4)
matrix(y, nrow=4, ncol=2)
#2 sütun 4 satır veya 4 sütun 2 satır olmasının sebebi 4*2 = 8 elemanlı olması

#peki biz vektör elemanlarından fazla şekilde bir kolon sütun sayısı oluşturmak istersek ne olur
matrix(x, nrow=4, ncol=4)
#gördüğümüz üzere elemanları sütunlara göre yani byrow=FALSE şeklinde sıraladığı için tekrarladı.

#peki biz eleman sayısından fazla olacak şekilde sütunlara göre sıralama olacak şekilde matris oluşturmak istersek hata ile karşılaşıp eleman kaymasına neden olacak matrisde
matrix(x, nrow=5, nrow=4)



#************************************VERİ YAPILARINDA ELEMAN SEÇİMİ******************************
#VEKTÖRLERDE ELEMAN SEÇİMİ

x <- c('A' ,'B' , 'C' , 'D')
#1.elemanı seçmek istersem
x[1]

#eleman seçimi için köşeli parantez kullanılır
#R programlamada indis değeri 1 den başlar

y <- c(1,2,3,4,5,6,7,8,9,10)
#eğer seçilecek eleman art arda ise
y[1:3]

y[4:9]
#4 ve 9 dahil olur eğer olmasını istemezsen
y[5:8]

t <- c(11,12,13,29,25,29,30,31,32)
#eğer farklı farklı elemanlar seçmek istersem c() operatörünü kullan

#1.5.9 elemanları seçelim
t[c(1,3,9)]

#indis değeri olmayan bir değer getirmeye çalışalım
t[c(1,6,15)]
#NA demek not available uygun değil anlamında 15.indisine ait bir değer yok anlamındadır. Bir hata değildir.


#VEKTÖRLERDE ELEMAN SİLME/KALDIRMA
x <- c(12,13,14,15,16)

#eleman seçimi
x[1]
x[5]

#ilk ve son elemanları kaldırmak için başına ilk önce kaldırmak istediğimiz indeksi seçeriz "-" işareti koyarız
x[-1]
x[-5]

#görüldüğü üzere bu yalnızca o değeri kaldırıp print yapıyor kalıcı olarak silmiyor
#biz değeri kalıcı olarak silmek için yeniden atama yapmamız gerekir ya kendine ya farklı bir değişkene
x <- x[-1]
x
#bu şekilde ilk elemanı kaldırdık şimdi 5.eleman yani son elemanı kaldıralım
#burada dikkatli olmamız gerek ilk eleman kaldırdığımız için x vektörü artık 5 elemanlı değil 4 elemanlı
#bundan dolayı son eleman olan 16 yı kaldırmak için indis değeri 4 olanı kaldıracağız
x <- x[-4]
x
#gördüğümüz üzere istediğimiz elemanları kalıcı olarak kaldırdık.

#tekrardan x vektörünü eskisi gibi oluşturalım.
x <- c(12,13,14,15,16)

#biz eksik değerli halini farklı bir değişkene de atayabiliriz

y <- x[-1]
y

#x ve y vektörünü aynı anda bastırmak için aralarına ; koyarız. R da boşluk hata verdiriyor
x;y

#peki birden fazla eleman kaldırmak veya silmek istersek o zaman da bir önceki derste öğrendiğimiz birden fazla seçmek için kullandığımız c() operatörünü kullanacağız
x[c(-1,-3,-5)]
#1.3.ve 5.indis değerlerine eşit olanları silmek istediğimizi belirttik.

#farklı bir kullanım yapalım. çıkartılacak indis numaralarını bir değişkene atayalım onun üzerinden işlem yapalım
cikarilacakIndis <- c(2,3,1) #ilk önce çıkarılacak olan indis değerlerini seçip değişkene atıyoruz
x[-cikarilacakIndis] #daha sonra x vektörü içinde 2. 3. ve 1.indis değerlerine karşılık olan değerleri kaldırıyoruz.

#art arda elemanları kaldırmak istersek
#yanlış kullanım
x[-1:3]

#doğru kullanım
x[-c(1:3)]



#VEKTÖRLERDE ELEMAN DEĞERİ DEĞİŞTİRME/GÜNCELLEME

x <- c(10,11,21,32,43,56)

#değiştirmek istediğimiz elemanın indis değerini seçelim
x[2]

#değiştirmek için atama operatörünü kullanacağız
x[2] <- 33

x
#görüldüğü üzere 2.indis değeri olan 11 yerine 33 geldi.

#birden fazla indis değeri olan elemanları değiştirmek için
x[c(1,2)] <- 1

x
#görüldüğü üzere x vektöründeki 1. ve 2.indis değerine sahip olan eleman değeri 1 ile değiştirdik

#birden fazla indis değeri olan elemanları değiştirmek için bir de şu yöntem kullanabiliriz

x[c(1,2)] <- c(42,35)

x
#x'in 1. ve 2.indis değerine sahip elemanları sırasıyla 42 ve 35 ile değiştirdik.

#art arda gelen indis değeri elemanlarını değiştirmek istersek eğer
x[c(1:3)] <- c(11:13)
x
#x'in 1. 2. ve 3.indis değerine sahip olan elemanları 11 12 ve 13 elemanları ile sırasıyla değiştirdik.




#VEKTÖRLERE YENİ ELEMAN EKLEME

x <- c(11,22,33,44)

#eleman seçme
x[1]

#eleman eksiltme veya silme
x[-1]

#eleman ekleme
x[5] <- 55

x
#eleman ekleme de yine diğerleri gibi index numaraları üzerinden gerçekleşmektedir.
#ben bir eleman ekleyeceğim. ekleyeceğim eleman indis numarası kaç ise oraya atama yapılıyor mantığı bu.

#arta arda eleman ekleyelim 5.indisten 10.indise kadar eleman ekleyelim.
x[c(5:10)] <- 3
#x[5:10] <- 3
x

#ben 11.indisi atlayıp 12.indise eleman eklemek istiyorum
x[12] <- 5

x

#görüldüğü üzere 11.indisde NA yazısı çıktı. bunun anlamı not available yani 11.indise ait bir değer yok anlamındadır.

#hemen 11.indise bir değer atayalım
x[11] <- 1

x

#şimdi 13 ve 14.indise de değerler atayalım
x[c(13,14)] <- c(11,12)

x

#bu kodda şu anlamı çıkarmalıyız. vektörüme ayrı bir vektör de ekleyebiliyorum.




#LİSTELERDE ELEMAN SEÇİMİ

list(1,2,3,4)

#listeye ulaşmak istersek eğer tek parantezli şekilde kullanırız

x <- list(11,12,c('A','B','C'))
x

x[1]
#tek parantezli kullandığımız için 1.listeye ulaşmış oluyoruz

#1.listemizin elemanlarına ulaşmak için iç içe parantez kullanmamız gerekmektedir
x[[1]]

class(x[1]) 
class(x[[1]])
#buradan tek parantez ve çift parantez arasındaki class yapısını anlıyoruz farkını yukarıda da bahsettik

#peki bizim 3.listemiz vektör önce 3.listemize ulaşalım
x[3]

#3.listemizin içindeki vektör'e ulaşalım
x[[3]]

#şimdi bu vektörün 2.indisindeki değere ulaşalım
x[[3]][2]

#listelerimizin bir başka özelliği ise isim verebiliyorduk listenin elemanlarına
y <- list('A' = c(1,2,3,4), 'B' = c(11,22,33,44))
y

#listemizin elemanlarının indislerine ise names fonksiyonu ile ulaşabiliyoruz
names(y)

#birinci listemiz olan A listemize ulaşalım
y['A']

#A listemizin eleman değerlerine ulaşmak için
y[['A']]

#biz bir de farklı bir şekilde A listemizin veya B listemizin elemanlarına ulaşabiliyoruz
y$A

y$B


#LİSTELERDE ELEMAN KALDIRMA İŞLEMİ

x <- list(1,2,3,c(11,22,33))

x

#listemizdeki 1.indis değerine erişelim
x[[1]]

#bunu kaldırmak için NULL kullanılır;
x[[-1]] #yanlış kullanım

#listelerde eleman kaldırmak için NULL kullanılır

x[[1]] <- NULL

#peki liste içinde kullanılan vektörlerde eleman kaldırma nasıl yapılır
#kural vektör değerlerine ulaş, vektörde kullanılan kaldırma işlemini uygula

x[[3]] #vektör değerlerine ulaştık

#vektörümüzde 2.eleman olan 22 kaldıralım ama önce değere ulaşalım

x[[3]][2]

#şimdi kaldıralım

x[[3]][-2]

#kalktı gibi gözüküyor. Tekrar x listemizi çağıralım

x

#görüldüğü üzere kalkmamış. Biz bunu vektörler konusunda anlattık. vektörlerde silme işlemini kalıcı hale getirmek için tekrar atama yapmamız gerek. 
#listelerde NULL kullandığımızda tekrar atamaya gerek yok kalıcı olarak kaldırıyor.

x[[3]] <- x[[3]][-2]

#tekrar atama yaptık yeninden listemizi çağıralım

x

#görüldüğü üzere kalıcı olarak sildik

#-----
y <- list(c(1,2,3), 'A' , 'B')

#listemizin ilk elemanı olan vektör değerlerini kaldırmak için

y[[1]] <- NULL

#şeklinde kullanırız.

y

#----
#bir de isimli listeler oluşturuyorduk orada kaldırma işlemi nasıl oluyor onu görelim
x <- list('A' = c(1,2,3), 'B' = 2)

#listemizi çağıralım
x

#listemizin ilk eleman değerine iki türlü erişiyorduk
x[['A']]

#ya da
x$A

#Listemizin ilk eleman değerini silmek için de veya genel olarak listede eleman kaldırmak için NULL kullanılır

x$A <- NULL

x


#----
#bir de listelerde biz tek parantez ile liste elemanlarına erişiyoruz ama değerlerine değil tek parantez ile de kaldırma işlemi yapabiliriz listelerde

x <- list(1,2,3,4)

#2.eleman değerini kaldıralım
x[-2]

#şimdi tekrar listemize bakalım kaldırılmış mı?
x

#kalkmamış. aynı vektörlerdeki kural burada da geçerli eğer tek parantez ile kaldırma işlemi yaparsak tekrar atama yapmamız gerek

x <- x[-2]

x

#görüldüğü üzere kalkmış görüntülenmektedir.




#LİSTE ELEMANLARININ DEĞİŞTİRİLMESİ VEYA GÜNCELLENMESİ 

x <- list('A' , 'B', 'C', 12, 13, c(11,22,33,44))

x

#şimdi listelerde eleman değişimini uygulayalım
x[[2]] <- 'DD'
x

#liste içindeki vektörlerdeki eleman değişimi yapalım 44 değeri 0 olsun

x[[6]][4] <- 0

x




#LİSTELERE ELEMAN EKLEME

x <- list(11,12,13)

#listelerde eleman değiştirme
x[[2]] <- 44

x

#listelere eleman ekleme hem tek hem de çift parantez ile eklenebilir. farkı anlatacağım
x[4] <- 14

x

x[5] <- 15

x

#şimdi 6.indise bir vektör ekleyelim 

x[[6]] <- c(11,12,13)

x

#aynı vektörü tek parantez ile ekleyelim bu sefer 7.indis yani 7.elemana

x[7] <- c(11,12,13)

x

#görüldüğü üzere vektörün yalnızca ilk elemanını ekledi. hatalı şekilde buna dikkat et. hemen doğru şekilde ekleme yaptıralım

x[[7]] <- c(11,12,13,14)

x

#15.değere bir ekleme yaparsam aradaki değerler ne olur

x[[15]] <- 15

x

#görüldüğü üzere NULL değerini aldı. Bunun anlamı bu indislere atanan bir değer olmadığını belirtmektedir.






#MATRİSLERDE ELEMAN SEÇİMİ

#ilk önce matris oluşturalım
m1 <- matrix(c(12,22,34,45,45,56,57,68), nrow=2, ncol = 4, byrow = TRUE)

m1

#[1,] [, 1] == [1,1] -> bunun anlamı 1.satır ve 1.sütun şimdi matrisimizde deneyelim

m1[1,1]

m1[2,4]

#indisde olmayan değeri getirmeye çalışalım
m1[2,5]
#hata ile karşılaşacağız

#matrislerde ben tek değere değilde belirli bir kısma erişmek istersem eğer
m1[c(1,2), c(1,2)]
#m1[satır,sütun] anlamına gelmektedir. yukarıdaki kod ise 1 ve 2.satır ve 1 ve 2.sütunu getir

#art arda olan satırları getirmek istersek eğer
m1[1:2,2:4] #ben burada 1 ve 2.satır, 2,3 ve 4.sütunları getirmesini istedi

#eğer sıralı şekilde matris seçersem : operatörünü kullanmam gerek
#eğer ard arda gelmeyen matris seçmek istersem c() vektör kullanmam gerek
m1[c(1), c(2,3,4)] #satır olarak 1. sütun olarak ise 2,3,4 gelsin yani 22,34,45 değerlerini görmek için




#MATRİSLERDE SATIR VE SÜTUN KALDIRMA, TEKİL VE ÇOĞUL DEĞER GELİŞTİRME

m <- matrix(c(1,2,3,4), nrow = 2, ncol = 2, byrow = TRUE)

m

#2.kolonu kaldırmak için
m[, -2]

#bunu kalıcı hale getirmek için tekrar atama yapmamız gerekir.

m <- m[, -2]

m

#burada 2 tane değer kaldığı için numeric vektör olarak ekrana geldi. 
#eğer bu numeric vektör olarak değilde matris olarak görmek istersek eğer
as.matrix(m)

#yeni bir matris oluşturalım
m1 <- matrix(c(11,22,33,44,55,66,77,88), nrow=4, ncol=2, byrow = TRUE)

m1

#son oluşturmuş olduğum m1 vektöründe 3.satırı kaldıralım ama kalıcı olarak değil çünkü üzerinde çalışmalara devam edeceğim
m1[-3,]

#birden fazla satırı nasıl çıkartırız tabii ki c() fonksiyonunu kullanarak
m1[-c(2,3),]
#2.ve3.satırı çıkartmak istedik.

#art arda yani sıralı şekilde satır veya sütunları nasıl kaldırırız. 2,3 ve 4.satırı kaldıralım
m1[-c(2:4),]
#2.3.ve4.satırı kaldırdığımızda tek bir satır kaldığından dolayı m1 matrisimiz ekrana numeric vektör olarak geldi. biz bunu matris olarak görmek istersek eğer as.matrix() fonksiyonu ile yazmamız gerekmektedir.

#şimdi m1 matrisimizi tekrar çağırdığımızda bir değişme olmadığını görürürüz.
m1

#matrislerde sadece belirli bir eleman çıkartmak mümkün değil çünkü matrisin yapısı bozulur bunun yerine o değere NA ataması yapılır.
#m1 matrisimizin 2.sütun 2.satırdaki değerine NA ataması yapalım

m1[2,2] <- NA

m1

#m1 matrisimizde yer alan 11 ve 33 değerlerimiz yerine NA ataması yapalım
m1[c(1,2), 1] <- NA

m1

#biz matrisimizde değerimize farklı değer ataması da yapabiliriz
m1[1,2] <- 123

m1

#NOT: matrislerde bir değer değiştiriyorsam tekrar atama yapmama gerek yok ancak eğer bir değeri siliyorsam - indis kullanıyorsam bunu kalıcı hale getirmek için tekrar atama yapmamız gerekmektedir.

#değeri değiştirilmiş bir matrisimizi farklı bir değişkene de atayabiliriz.
#buna örnek olarak m1 matrisimizin son satırının kaldırılmış halini m2 değişkenine atayalım

m2 <- m1[-4,]

m2



#MATRİSLERDE SATIR VEYA SÜTUN EKLEME

#matrislerde biz satır ve sütun ekleme işlemini özel fonksiyonlar ile yaparız
#rbind() satır eklemek
#cbind() sütn eklemek için kullandığımız fonksiyonlar
#kural: rbind(ilgili matris, satır elemanları)
#kural: cbind(ilgili matris, sütun elemanları)

#şimdi hemen bir matris oluşturalım
m <- matrix(c(1,2,3,4), nrow = 2, ncol = 2, byrow = TRUE)

m
#özel fonksiyonlarda kural dikkat edilecek nokta elemanlar ilgili matrisin yapısı ile uyumlu olması gerek 2 satır 2 sütunlu matrisde ilk eklenecek eleman sayısı 2 olmalı örneğin.
rbind(m, c(5,6))
#3.satırı ekledik ve 1.sütun değeri 5 2.sütun değeri 6 olsun

cbind(m, c(5,6))
#3.sütunu ekledik ve 1.satır değeri 5 2.sütun değeri 6 olsun sıra önemlidir.

#özel fonksiyonları kalıcı olarak kaydetmek için tekrar atama yapılması gerekmektedir.
m <- rbind(m, c(5,6))

m

#artık m matrisimiz 2 sütun 3 satırdan oluşuyor şimdi 3.sütunu eklediğimizde 3 değer girmemiz gerek ki ilgili matrisin yapısı ile uyumlu olsun.
m <- cbind(m, c(3,5,7))

m

#peki ilgili matrisin yapısı ile uyumlu değilde fazla değer girersek hata ile karşılaşırız yalnızca gerektiği kadarını alır ama sorun çıkabilir bizim dikkatli olmamız gerek uyumlu olması için

cbind(m, c(1,2,3,4,5))
#yanlış kullanım.



#Data frame içerisinden satır ve sütun seçimi
df <- data.frame('A' = c(12,13,14,15,16), 'B' = c('A','B','C','D','E'))
df

#data framelerde de eleman seçimi matrislerdekine benzer
#x[satır, sütun]
df[1,1]

#A harfini seçmek istersek
df[1,2]

#sütun seçimleri de yapabiliriz.
df[,2]

#aynı şekilde satır da seçebiliriz
df[5,]

#yeni bir data frame oluşturalım.
df2 <- data.frame('A' = c(12,13,14,15,16), 'B'=c('A','B','C','D','E'), 'C' = c(45,23,67,89,24))

df2

#ben ikili şekilde seçim yapabilirim
#B ve C sütunlarını seçelim
df2[,c(2,3)]

#şu şekilde de seçimler yapabiliriz farklarını anlatacağım
df2[2]

df2[,2]

#yukarıdaki iki tane seçim var aslında aynı sütunu seçiyorum ancak biri vektör olarak gelmekte (virgül ile seçtiğimiz)
#diğeri de data frame olarak gelmektedir (virgülsüz seçtiğimiz) aşağıda veri tiplerine bakalım
class(df[2])

class(df[,2])

#şimdi virgül([,2]) seçimi ile virgülsüz seçim([2]) arasında fark var. Virgül ile seçtiğimizde R bunun veri tipini factor yani bit nevi vektör olarak algılamaktadır.
#virgülsüz olarak seçtiğimizde ise r bunu data frame olarak algılamaktadır.
#biz veri tipleri seçimine neden bu kadar önem ve dikkat ediyoruz bunun nedeni ileride kendi algoritmamızı ya da kendi fonksiyonlarımızı yazdığımızda bunlar çok önemli konuma gelecektir.
#vektör ile data.frame arasında fark vardır. vektör düz bir seri olarak gelmektedir ancak data frame indisleri ile birlikte geliyor bir tür matris.
#data framelerin matrislerden farkı ise içerisinde karakter bazında veri türleri barındırması ve her bir sütuna isim değerleri verebilmemiz.

#farklı bir seçim tekniği de var vektör veya data frame seçimi olarak.
df[1]
#bu şekilde bir seçim sağlarsak data frame olarak veri tipi sağlanır
#aynı şekilde data frame olarak çekmek istersek
df['A']
#seçimi de yapabiliriz.

df[,1]
#eğer bu şekilde bir seçim yaparsak vektör olarak veri tipi sağlanır
#aynı şekilde vektör olarak çekmek istersek
df[['A']]
#seçimi de yapabliliriz.

#vektör olarak seçim yapmanın daha pratik bir yolu daha var bunu daha önce matrislerde de görmüştük
df2$A
df2$B
df2$C

#ikili seçimleri de isimleri ile yapabilriiz.
df2[, c('A','C')]




#Data frame satır - sütun kaldırma işlemleri
#hemen data frame oluşturalım
df <- data.frame('A' = c(1,2,3,4,5), 'B' = c(4,5,6,7,8))

df

#sütun kaldırma işlemlerinde istisnai durumlar haricinde virgülsüz kaldırma yap
#2.sütun olan B sütununu kaldırma işlemi uygulayalım
df[-2]

#bunu kalıcı hale getirmek için tekrar atama yap
df <- df[-2]

#Not: neden tekrar atama yapıyoruz kalıcı hale getirmek için df[2] 2.sütun olan B sütununu göster anlamında bir seçimdir. Aynı şekilde df[-2] de 2.sütun haricinde olan sütunu göster anlamı taşıyan bir seçimdir. Bunlar bir seçim kaydetmek için bir şey yapmıyoruz bundan dolayı kalıcı hale getirmek için tekrar kendilerine atama yapıyoruz.

#diğer bir kaldırma yöntemi ise aynı listelerde olduğu gibi NULL atama yöntemi bu sefer ilk sütun olan A sütununu kaldıralım
df[1] <- NULL

df
#NULL atamalarında kalıcı hale getirmek için tekrar atama yapmaya gerek yok.

#birden fazla sütun kaldırma işlemi
#bunun için yeni bir data frame tanımlayalım
df2 <- data.frame('A' = c(1,2,3,4,5),
                  'B' = c(4,5,6,7,8),
                  'C' = c(11,22,33,44,55))

df2

#1.sütun olan A sütunu ile 3.sütun olan C sütununu kaldıralım.
df2[-c(1,3)]

#- kullandığımızdan dolayı kalıcı hale getirmek için tekrar atama yapmamız gerek.

#sütun isimleri kullanarak kaldırma işlemlerinde NULL atama yöntemini kullan çünkü karakterlerin - veya + değerleri olamaz.
df2['B'] <- NULL

#çoklu olarak sütun isimlerini kullanarak kaldırma işlemi yapabiliriz yine NULL yöntemini kullanarak
df2[c('A','C')] <- NULL

#çoklu kaldırma işlemlerinde virgül ile kaldırma da dikkat etmemiz gereken bir nokta var eğer virgül ile kaldırdığımızda tek sütun kalacaksa virgülsüz kaldırma uygula ama birden fazla sütun kalacaksa burada virgüllü kaldırma işlemi uygulanabilir.
df2[,-c(2,3)] #bunun sonucu vektör olacak çünkü tek bir sütun kalacak
df2[,-3] #bunun sonucu data frame olacak geriye 2 sütun kalmaktadır.

#data framelerde satır kaldırma işlemleri
df2

#ben df2 data frame ait 1.satırı kaldırmak istiyorum
df2[-1,]

#satır kaldırma işlemlerinde dikkat etmemiz gereken nokta virgül kullanmamız gerekmektedir. Aksi taktirde R bunu sütun kaldırma işlemi olarak algılayacaktır.

#çoklu satır kaldırma işlemleri de uygulayabiliriz.
df2[-c(1,3),]

#Not: bunları kalıcı hale getirmek için tekrar atama yapılması gerekmektedir.



#Data Frame Eleman Değiştirme
#hemen bir data frame oluşturalım
df3 <- data.frame('A' = c(1,2,3,4), 'B'=c(4,5,6,7))
df3

#matrislerde eleman değiştirmeyi indis değerine göre yapıyorduk aynı şekilde burada da aynı yapacağız.
#4.değere ulaşmak için
df3[1,2]
#6.değere ulaşmak için
df3[3,2]

#şimdi ben 4.değere 100 ve 6.değere 200 değeri olsun istiyorum sırayla yapalım.
df3[1,2] <- 100

df3[3,2] <- 200

df3

#birden fazla değer üzerinde de aynı anda değişiklik yapabiliriz.
#örneğin 2 ve 5 sütunları 3000 olsun
df3[2, c(1,2)] <- 3000

df3
#bu yaptığımız satırlarda değişiklik bir de aynı anda sütunlarda değişiklik uygulayalım

#bunun içinde A sütununda 1 ve 3 değeri 175 olsun
df3[c(1,3),1] <- 175
df3

#aynı anda değişikliklerde tek bir değer ataması yaptık farklı farklı değerler de atayabiliriz.
#buna örnek olarak 4 ve 7 değerini sırasıyla 44 ve 77 yapalım
df3[4, c(1,2)] <- c(44,77)

df3







#Data Frame Satır ve Sütun Ekleme
#ilk önce bir data frame oluşturalım.

df4 <- data.frame('A' = c(1,2,3,4),
                  'B' = c('A','B','C','D'),
                  'C' = c(11,22,33,44))

df4

#matrislerde de kullandığımız yöntemler olan rbind() ve cbind() fonk. burada da geçerlidir.

#ilk önce sütun ekleme ile başlayalım cbind() fonksiyonu ile
cbind(df4, 'D'=c(33,44,55,66))
#cbind() ve rbind() fonksiyonlarını kalıcı hale getirmek için tekrar atama yapılması gerekmektedir.

df4 <- cbind(df4,'D'=c(33,44,55,66))

df4

#farklı şekilde de sütun ekleyebiliriz. biz cbind fonk. ile 4.sütunu ekledik 5.sütunu eklemek için
df4[5] <- c(12,13,14,15)
df4

#dolar işareti ile de sütun eklenebilir
df4$Yeni <- c('F','G','H','J')

df4

#köşeli parantez içinde sütun ismi verilerek de sütun eklenebilir
df4['E'] <- c(100,200,300,400)

df4

#yeni satır eklemek istersek eğer rbind fonksiyonu kullanılır. ancak cbind fonk. olduğu gibi c()fonk. kullanılmaz data.frame oluşturulur sebebi aşağıda açıklacağım.
#sırasıyla sütun isimlerine denk gelen değerler atama şeklinde ilerlenecek
rbind(df4,data.frame('A' = c(5),'B'=c('E'),'C'=c(55),'D'=c(77),'V5'=c(16),'Yeni'=c('K'),'E'=c(500)))

#bunu kalıcı hale getirmek için yeniden atılması gerekmektedir.

#biz bir de farklı şekilde de satır ekleme yapabiliriz.

df4[6,] <- c(6,'F',66,88,17,'L',600)

df4[5,] <- c(7,'T',55,77,16,'K',500)
df4

#biz bu şekilde eklemelerde bazen vektör veri tipi kategorik olmakla beraber faktör olabiliyor ve levellere sahip olabiliyor örneğin
#B vektörü A B C D şeklinde kategorilenmiştir biz B vektörüne yeni satır eklerken T ekleyemeyiz çünkü o seviyede olmadığı yönünde hata verecektir.
#bundan dolayı biz en sağlıklı yöntem olarak rbind() fonk. kullanılması gerektiğini düşünürüz.

#rbind fonksiyonunda tek seferde birden fazla eklemelerde yapılabilir
#7.ve8.sütunu ekleyelim
rbind(df4,data.frame('A' = c(5,6),'B'=c('E','F'),'C'=c(55,66),'D'=c(77,88),'V5'=c(16,17),'Yeni'=c('K','L'),'E'=c(500,800)))
#baktığımızda çoklu satır ekledik. kalıcı olması için tekrar atama yapılması gerek.

#direkt olarak rbind içinde değilde farklı bir değişkene atanmış data frame oluşturup onu da rbind fonksiyonuna çağırabiliriz.
#buradaki tek şart aynı sütun isimlerine sahip olunması gerek
eklenecek <- data.frame('A' = c(5,6),'B'=c('E','F'),'C'=c(55,66),'D'=c(77,88),'V5'=c(16,17),'Yeni'=c('K','L'),'E'=c(500,800))
#şimdi 7 ve 8.satırları eklemek için eklenecek değişkeni üzerinde oluşturduğunuz data frame i rbind fonk. çalıştıralım

rbind(df4, eklenecek)
