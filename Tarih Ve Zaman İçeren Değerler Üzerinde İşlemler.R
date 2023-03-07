#*************************************TARİH İÇEREN DEĞERLER************************************
#%d - day as a number of (0-31) -1-31
#%a - abbreviated weekday Mon
#%A - unabbreviated weekday Monday
#%m - month  (00-12) 00-12
#%b - abbreviated month Jan
#%B - unabbreviated month January
#%y - 2-digit year 07
#%Y - 4-digit year 2007

#kendimizin girdiği tarih verisi ilk önce character olarak algılanır daha sonra biz onun veri tipini date olarak atarız ve R bunu artık tarih verisi olarak algılar.
#R da bir fonksiyon var bugünün tarihini gösteren
Sys.Date()
#görüldüğü üzere "2023-03-01" ilk önce yıl sonra ay sonra gün şeklinde ele alıyor.
#şimdi bu fonksiyonun veri tipine bir bakalım.

today <- Sys.Date()
today
class(today)
#gördüğümüz üzere sys.date() fonksiyonun veri türü date olarak belirlenmiş.

#şimdi R da tarih yıl ay gün olarak yazılıyordu biz bunu türkiyede kullanılan formata da çevirebiliriz.

format(today, format = "%d/%m/%Y")
#gördüğümüz üzere artık today değişkeni türkiyede kullandığımız tarih formatına çevrilmiş oldu.
#peki çevirdiğimiz bu formatın veri türü date mi kontrol edelim.
g <- format(today, format = "%d/%m/%Y")
class(g)
#görüldüğü üzere character bunuda ileride date formatına dönüşümünü göreceğiz.

#şimdi kendimiz bir tarih oluşturalım.
tarih <- "06/06/2023"
tarih
class(tarih)
#gördüğümüz üzere kendi oluşturmuş olduğumuz tarihimiz character veri türünde oldu. şimdi bizim oluşturmuş olduğumuz bu formatı date veri türüne dönüştürelim.
#as.date() fonksiyonunu kullanacağız içerisine de parametre olarak format gireceğiz bu format istediğimiz şekilde değil değiştirmek istediğimiz tarih hangi formatta yazılmışsa onu gireceğiz.
as.Date(tarih, format = "%d/%m/%Y")
#R bunu aşağıda date formatı olan kendi formatına dönüştürdü yani yıl ay gün şeklinde yaptı.
#bunun kalıcı olması için yeni değişkene atayalım.
yeniTarih <- as.Date(tarih, format = "%d/%m/%Y")
yeniTarih
class(yeniTarih)
#gördüğümüz üzere kendi girdiğimiz tarihi biz as.date fonksiyonu ile character veri türünden date veri türüne dönüştürmüş olduk.

#yukarıda g değişkenimizi de formatını date yapalım.
g
as.Date(g, format = "%d/%m/%Y")
today <- as.Date(g, format = "%d/%m/%Y")
today
class(today)
#bu g değişkenimizi de as.date fonksiyonu ile date veri tipine dönüştürüp, today değişkenimize atadık.

#Peki R da date formatına dönüştürmek ne işimize yarayacak ?
#Bize bir veri tabanı verildi ve bu veri tabanından verileri çekiyoruz. Bu veri tabanının bir sütununda ise şöyle bir şey var;
#bir zaman değeri var. Fakat biz bunu R'a aldığımız zaman R bunu bir zaman değeri olarak algılamıyor. tamamen karakter değişkeni olarak algılıyor.
#bu nedenle biz bu aldığımız değişkeni as.date fonksiyonu ile date formatına dönüştürmemiz gerekiyor ki eğer veri tabanına bir sorgu gönderdiğimiz de örneğin
#şu tarihten sonrası, bu tarihten öncesi gibi veya şu tarih ile şu tarih arasında gibi sorgular gönderdiğimizde doğru çalışsın.

#NOT: as.date fonksiyonu kullanırken format yerine her zaman ilgili nesnenin formatı yazılacak istediğimiz format değil.
#NOT2: Yukarıda ilk satırlarda %ile yazdığımız yazılışlar önemli.

#şimdi formatı farklı belirttiğimizde neler ile karşılaşıyoruz ona bakalım.
tarih2 <- '23-05-2023'
tarih2
class(tarih2)
#görüldüğü üzere character, hemen dönüştürelim.
#ilk önce format vermeden dönüşüm yapalım.
as.Date(tarih2)
#görüldüğü üzere "0023-05-20" şeklinde hatalı bir dönüş yaptı.23 olan günü yıl olarak algıladı.
#şimdi bunu düzeltelim format yerine oluşturduğumuz formatı girerek yapalım.
as.Date(tarih2, format = "%d-%m-%Y")
#gördüğümüz üzere doğru şekilde dönüşümü uyguladı.
#formatı istediğimiz şekilde yazmak isteseydik ne olacaktı ? yani yanlış kullanım sonucunu da gösterelim.
as.Date(tarih2, format = "%A-%m-%Y")
#gördüğümüz üzere hata olarak NA alacaktık.

#********************************TARİH VE ZAMAN İÇEREN DEĞERLER************************************
#bir önceki derste sys.Date() fonksiyonu ile anlık tarihi alıyorduk.
#bu dersimizde de sys.Time() fonksiyonu ile anlık tarih ve zamanı alacağız.
Sys.Date() #tarih
Sys.time() #tarih ve zaman

#şimdi sys.time() fonksiyonunu bir değişkene atayıp türünü inceleyelim.
t1 <- Sys.time()
t1
class(t1)
#şimdi sys.date() fonskiyonun veri türü Date di. Aynı şekilde sys.Time() fonksiyonun veri türü POSIXct veya POSIXt == POSIXlt
#POSIXct = bunu R unix olarak tutuyor.
#POSIXlt = bunu R gün ay yıl olarak tutuyor.
#bu ikisinin farkını dersin ilerleyen kısmında göreceğiz.

#biz karakter olarak girilen tarih verisini Date olarak dönüştürmek için as.Date() fonksiyonunu kullanıyorduk aynı şekilde;
#biz tarih zaman yani datetime türüne dönüştürmek içinde as.POSIXct() veya as.POSIXlt() fonk. kullanmamız gerek.
#şimdi POSIXct ile POSIXlt arasındaki farkı görelim.
#yukarıdakini tekrar POSIXct'ye atayalım.
t1 <- as.POSIXct(t1)
class(t1)
#şimdi unclass() diye bir fonksiyonumuz var class olmadığı hale erişebiliyoruz. işte POSIXct ile POSIXlt arasındaki farkı burada görebiliyoruz.
#yukarıdaki t1 POSIXct olarak dönüştürdük şimdi unclass() yapalım.
unclass(t1)
#gördüğümüz üzere 1677757168 kodu aslında bizim t1 de olan tarih zamanın UNIX olarak çevrilmiş halidir.
#şimdi aynı şekilde bir de POSIXlt'ye çevirip unclass() fonksiyonunu çalıştıralım.
t1l <- as.POSIXlt(t1)
class(t1)
#t1l nesnemizi as.POSIXlt() fonksiyonu ile POSIXlt veri türüne çevirdik şimdi unclass yapalım ve POSIXct den farkını görelim.
unclass(t1l)
#gördüğümüz üzere POSIXlt veri türünü unclass yaptığımızda bir liste çıkardı karşımıza.
#bu listemizin belirli elemanları var. Şimdi bu elemanları inceleyelim.
unclt1 <- unclass(t1l)
unclt1
#POSIXlt unclass halinde listedeki elemanlar: saniye dakika, saat vb. var ama burada dikkat edilmesi gereken 2 nokta var bunlar;
#month(mon) ve year elemanları.
#mon = 2 olarak verilmiş year = 123 olarak verilmiş.
#şimdi biz ayı hesaplamak istersek mon + 1 
#yılı hesaplamak istersek year + 1900 şeklinde yapmamız gerekiyor.
#POSIXlt'nin orijin olarak aldığı noktalar mon = 1, year = 1900 bundan dolayı eklemeleri yapınca 2023 ve 02 sonuçlarına ulaşacağız

#değişkenlerin(elemanların) ismini göstermek için names() fonk. kullanıyorduk. Şimdi bunu unclt1 listemizde de uygulayalım.
names(unclt1)

#şimdi ben bu listemizden dakikaya erişmek istiyorum. Listelerde yaptığım işlemi yapacağım [[]] parantez kullanacağım.
unclt1[["min"]]
unclt1[["sec"]]
unclt1[["mday"]]
unclt1[["year"]] + 1900
unclt1[["mon"]] + 1
#mday = ayın kaçıncı günü
#wday = haftanın kaçıncı günü
#yday = yılın kaçıncı günü
#NOT: biz year bulurken 1900 ile toplamayı ve mon bulurken 1 ile toplamayı unutmuyoruz sebebi ise R orijinden dolayı.

#şimdi ise bizim dışarıdan girdiğimiz formatı R'daki datetime formatına çevirme konusuna gelelim.
t2 <- '12/11/2023 17:30:28'
t2
class(t2)
#bizim girdiğimiz formatı R ilk başta karakter olarak görmektedir. Şimdi bu formatı biz datetime olarak çevirelim bunun için POSIXct veya POSIXlt olarak yapmamız gerek.
#şimdi çevirirken kullanacağımız fonk. içine format paramesini yazmamız gerek. Bir önceki derste biz bir uyarı yapmıştık formatı kafamıza göre değil ilgili dönüşümü sağlayacağımız tarih nasıl yazılmışsa onun formatının aynısı yazılması gerek.
#ilgili tarihimiz gün ay yıl saat dakika saniye şeklinde şimdi formata bu şekilde giriş yapacağız.
t2v <- as.POSIXlt(t2, format = "%d/%m/%Y %H:%M:%S")
t2v
class(t2v)
#gördüğümüz üzere karakter olan verimiz R da datetime veri türüne dönüştürmüş durumdayız.
#UTC formatını da eklemek istersek time zone karşılığına gelen tz parametresini de eklememiz gerek.
t2v <- as.POSIXlt(t2, format = "%d/%m/%Y %H:%M:%S", tz = "UTC")
t2v
#şimdi oluşturmuş olduğumuz bu tarihimizi unclass yapalım ve listeden elemanlarımıza erişelim. Dikkat year +1900 ve mon+1 eklemeyi unutma

t7 <- '13/11/2021 16:30:28'
class(t7)
t7v <- as.POSIXlt(t7, format = "%d/%m/%Y %H:%M:%S")
t7v
class(t7v)
t7vl <- unclass(t7v)

names(t7vl)

t7vl[["min"]]
t7vl[["sec"]]
t7vl[["mday"]]
t7vl[["year"]] + 1900
t7vl[["mon"]] + 1

#NOT: unclass() fonksiyonunu t7v üzerinden çalıştırırsak elemanlar NULL olacak bundan dolayı elemanlara erişemeyecektik. 
#unclass() fonksiyonunu çalıştırırken farklı bir değişkene atama yap.
unclass(t7v) 
t7v[["min"]]
#bu yanlış kullanım hata ile karşılaşacağız
names(t7v) #burada da değerler gelmeyecek çünkü POSIXlt yaptığımız değişkeni unclass yaptık.

#doğru kullanım.
t7vl <- unclass(t7v)
t7vl[["min"]]
names(t7vl)

#***************************İKİ TARİH ARASINDAKİ FARKIN HESAPLANMASI************************************
#şimdi ilk partımızda sadece tarih içeriklerinin farkını ikinci partta ise date time şeklinde fark almayı gösterelim.

d1 <- '12/11/2023'
d2 <- '13/11/2023'

#aralarında fark bir gün ancak biz direkt bu şekilde bir fark alırsak hata alacağız bunların veri yapısı date olması gerekmekte.

d2 - d1
class(d2)

#karakter olduğu için hata alıyoruz hemen as.date fonk. ile veri yapılarını date yapalım.
#as.date fonk. içinde format parametresine istediğimizi değil nasıl bir formatta oluşturduysak o şekilde yazmamız gerek
d1 <- as.Date(d1, format = '%d/%m/%Y')
d2 <- as.Date(d2, format = '%d/%m/%Y')

d1
d2

class(d2)
#şimdi date türünde olduğu için aralarındaki farkı hemen hesaplayalım
d2 - d1
#ekranda direkt bize aralarındaki farkın 1 gün olduğunu belirtmekte. Peki sayısal olarak bu değeri elde edemiyor muyuz? ederiz. Double fonk.
as.double(d2-d1)

#şimdi aralarında gün farkını arttıralım.
d3 <- '12/11/2023'
d4 <- '28/11/2023'

d3 <- as.Date(d3, format = '%d/%m/%Y')
d4 <- as.Date(d4, format = '%d/%m/%Y')
#date veri yapısı yaptıktan sonra hesaplayalım.
d4-d3
as.double(d4-d3)

#şimdi yıl farkı nasıl oluyor onu görelim.
d5 <- '12/01/2023'
d6 <- '12/01/2024'

d5 <- as.Date(d5, format = '%d/%m/%Y')
d6 <- as.Date(d6, format = '%d/%m/%Y')
#date veri yapısı yaptıktan sonra hesaplayalım.
d6-d5
as.double(d6-d5)


#şimdi ikinci part olan date time olan işlemlere geçelim.
#şimdi tarih yanına zaman da ekleyeceğiz.
d7<- '12/11/2023 10:30:00'
d8 <- '12/11/2023 10:45:00'

d7 <- as.POSIXlt(d7, format = '%d/%m/%Y %H:%M:%S')
d8 <- as.POSIXlt(d8, format = '%d/%m/%Y %H:%M:%S')
#datetime türüne değiştireceğiz bunun için as.POSIXlt fonk. kullanacağız. Yaptıktan sonra hesaplayalım.
d8-d7
as.double(d8-d7)
#görüldüğü üzere datetime türünde olduğu için 15 dakikalık fark olduğunu söylüyor.

#şimdi saat farkı oluşturalım.
d9<- '12/11/2023 10:30:00'
d10 <- '12/11/2023 11:45:00'

d9 <- as.POSIXlt(d9, format = '%d/%m/%Y %H:%M:%S')
d10 <- as.POSIXlt(d10, format = '%d/%m/%Y %H:%M:%S')
#datetime türüne değiştireceğiz bunun için as.POSIXlt fonk. kullanacağız. Yaptıktan sonra hesaplayalım.
d10-d9
as.double(d10-d9)
#1.25 aslında şu şekilde hesaplanıyor 1 saat 60dk, 15 dk daha var bu da 60 dknın 1/4 ü olduğu için 1.25 olarak hesaplanmaktadır.

#şimdi gün olarak hesaplayalım datetime da gün farkı nasıl gözükmektedir.
d11<- '12/11/2023 10:30:00'
d12 <- '13/11/2023 10:45:00'

d11 <- as.POSIXlt(d11, format = '%d/%m/%Y %H:%M:%S')
d12 <- as.POSIXlt(d12, format = '%d/%m/%Y %H:%M:%S')
#datetime türüne değiştireceğiz bunun için as.POSIXlt fonk. kullanacağız. Yaptıktan sonra hesaplayalım.
d12-d11
as.double(d12-d11)
#sonuç 1.010417 çıktı aslında noktanın sağ tarafı dakika farkını göstermekte. sol tarafı ise gün farkını
#1 gün 24 saat bunun dakika hesabı 60x24 = 1440 bizim 15 dakikalık farkı dakika olarak yansıması ise 15/1440 = 0.0104166.. bundan dolayı direkt 1.15 diye değil günün dakikaya oranlanması olarak ele alıyor.

#NOT: Dikkat edilmesi gereken nokta time difference hangi miktarda olduğu. Örneğin saniye yazsaydık cevabı saniye türünde verecekti. Dakika farklı olsaydı dakika üzeridnen verecektir.
#ancak yukarıda asıl fark saat üzerinden olduğu için bütün sonucu saat üzerinden genelleyerek ondalıklı bir sonuç veriyor. 

#***************************TARİH VE ZAMAN İÇEREN VEKTÖRLER************************************
#Bu dersimizde ise tarih ve datetime türünde vektörler oluşturacağız. Mantık yine aynı.
#şimdi biz geçen derslerimizde şunlar gördük;
#1.bizim kendi oluşturduğumuz tarih veya datetime türleri ilk olarak karakter veri türünde oluşturulacaktır.
#2.biz eğer tarih veri türüne dönüştürmek istersek as.Date() fonk. kullanmamız gerek.
#3.biz eğer date time veri türüne dönüştürmek istersek as.POSIXct() - unix veya as.POSIXlt() fonk. kullanmamız gerek.
#içine yazılan format parametreleri ise oluşturduğumuz format yapısı ile aynı olmak zorunda. şimdi bir örnek gösterelim ve hemen vektörümüzü oluşturalım.

d1 <- '12/11/2023'
class(d1)
d1 <- as.Date(d1, format = "%d/%m/Y")
class(d1)

d2 <- '12/11/2023 23:15:00'
class(d2)
d2 <- as.POSIXlt(d2, format = "%d/%m/Y %H:%M:%S")
class(d2)

#şimdi vektör oluşturmaya geçelim.
#TARİH içeren vektör. Bir gün artacak şekilde oluşturalım.

d1 <- c('12/10/2023', '13/10/2023', '14/10/2023')
#şimdi bu vektörümüzün yapısına bakalım
class(d1)
#karakter yapısında hemen bunun yapısını date olarak dönüştürelim.
d1 <- as.Date(d1, format = "%d/%m/%Y")
class(d1)
d1
#gördüğümüz üzere d1 vektörümüzün içindeki tarihlerimizin yapısı karakterden date türüne dönüşmüş oldu.

#şimdi biraz daha fazla örnek amacıyla rep fonksiyonun kullanalım ve tekrarlı şekilde yazdırtalım.
d2 <- c('12-10-2023', '13-10-2023', '14-10-2023')
#bunu da - şeklinde oluşturalım.
d2 <- rep(d2, times = 3)
d2
#rep() tekrarlatmak için kullandığımız fonks. times parametresi içindeki 3 elemanı 3 kez tekrarla şeklinde a,b,c,a,b,c,a,b,c şelinde.
#rep() fonk. bir kez daha tekrarlatmak amacıyla kullanalım bu sefer her eleman 5 kez tekrar etsin.
d2 <- rep(d2, each = 5)
d2
#rep() fonk. içinde each parametresi ise her elemanı tekrar etttirmek için kullanırız. a,a,a,a,a,b,b,b,b,b,c,c,c,c,c.. şeklinde
#şimdi bunların yapısına bakalım
class(d2)
#şimdi karakter yapısını hemen date türüne dönüştürelim as.Date() fonk. kullanarak. format nasıl oluşturduysak öyle olması gerek. - kullandık.
d2 <- as.Date(d2, format = "%d-%m-%Y")
d2
class(d2)
#gördüğümüz üzere yapısı date olmuştur.


#şimdi tarih ve zaman içeren bir vektör oluşturalım.
d3 <- c('12-10-2023 12:12:01', '13-10-2023 12:12:01', '14-10-2023 12:12:01')
d3
class(d3)
#bunun yapısına baktığımızda karakter olduğunu görüyoruz. Hemen bunun yapısını datetime türüne dönüştürelim. as.POSIXlt() fonksiyonunu kullanarak.
#format yine oluşturduğumuz yapıda olması gerekmektedir
d3 <- as.POSIXlt(d3, format = "%d-%m-%Y %H:%M:%S", tz="UTC")
d3
class(d3)

#gördüğümüz üzere bu d3 vektörümüzün yapısını datetime olarak dönüştürmüş olduk.

#şimdi biz bu datetime da unclass yapıp listeye erişip oradan saat, dakika gibi değerleri çekebiliyorduk.
#ancak önemli nokta orijin noktalar gün olarak = +1, yıl olarak ise +1900 yapmamız gerek.
d3unc <- unclass(d3)
d3unc

#şimdi tek bir datetime kullanınca burada tek ifadeler çıkıyordu ama 3 tane değerler çıkıyor karşımıza.
#örneğin sec öğesinde 1 1 1 yazılmış bunun mantığı şu 1.değer = 1, 2.değerin sec = 1, 3.değerin sec=1
#veya 1.elemanın hour = 12, 2.elemanın hour = 12, 3.elemanın hour = 12 şeklinde.
#biz bu liseteden seçimler yapabiliyorduk şimdi ben 2.eleman adına seçimler nasıl yapabilirim bunu gösterelim.

d3unc[['sec']][2]

d3unc[['year']][2] + 1900

#3.elemanın gününü seçelim
d3unc[['mday']][3]

#mon bulalım şimdi 1.elemanın
d3unc[['mon']][1] + 1


#***************************ARDIŞIK İLERLEYEN TARİH VEKTÖRÜ OLUŞTURMA************************************
#Bu dersimizde ardışık ilerleyen tarih vektörü oluşturma göreceğiz.
#Biz daha önce ardışık artan vektörü seq() fonk. ile oluşturmuştuk.
#burada da aynı seq() fonk. kullanacağız fakat kullanım olarak biraz farklı olacak.
#hemen numeric değeler üzerinde seq() fonk kullanımı ile başlayalım.

seq(from = 1, to = 100)

seq(from = 1, to = 100, by=2)

#şimdi tarih vektörü oluşturalım. Biz normalde tarih vektörü nasıl oluşturuyorduk ilk önce vektöre değer girip daha sonra as.Date() fonk kullanıp yapısını değiştiriyorduk.
#burada direkt olarak seq() fonk içinde as.Date() fonk. kullanarak ardışık ilerleyen tarih vektörü oluşturacağız.
#şimdi ilk önce TARİH daha sonra da Tarih ve Zaman vektörü üzerinde örnek gösterelim.

#ardışık tarih
seq(from = as.Date("01/01/2023", format="%d/%m/%Y"), 
    to = as.Date("30/01/2023", format="%d/%m/%Y"))
#şimdi biz numeric vektörlerde seq() fonk. by koymadığımızda otomatik olarak birer şekilde artacağını biliyordu.
#ama tarih ile oluşturulan ardışık vektörlerde by belirtilmesi gerel
seq(from = as.Date("01/01/2023", format="%d/%m/%Y"), 
    to = as.Date("30/01/2023", format="%d/%m/%Y"), by=1)
#şimdi görüldüğü üzere by = 1 yazdığımızda günlerin 1er 1er arttığını görüyoruz.
#NOT: as.date() fonk. by parametresini numeric değer girersek date yapısında en küçük değer olan day yani günler üzerinde arttırma etkisi uygular.
seq(from = as.Date("01/01/2023", format="%d/%m/%Y"), 
    to = as.Date("30/01/2023", format="%d/%m/%Y"), by=5)
#beş gün artarak ilerler.
#peki biz hafta şeklinde veya ay, yıl, gün şeklinde arttırmanın yolu farklı şekilde yok mu ? var. hemen gösterelim.

#GÜN
seq(from = as.Date("01/01/2023", format="%d/%m/%Y"), 
    to = as.Date("30/01/2023", format="%d/%m/%Y"), by="day")
#by = "day" yazdığımızda günleri birer birer arttır anlamına gelir.

#HAFTA
seq(from = as.Date("01/01/2023", format="%d/%m/%Y"), 
    to = as.Date("01/06/2023", format="%d/%m/%Y"), by="week")
#by = "week" yazdığımızda hafta hafta şeklinde arttıracak yani 7 gün 7 gün arttırım uygulanacak.

#AY
seq(from = as.Date("01/01/2023", format="%d/%m/%Y"), 
    to = as.Date("30/12/2023", format="%d/%m/%Y"), by="month")
#by = "month" yazdığımızda ayları 1er 1er arttırarak oluşturacak.

#YIL
seq(from = as.Date("01/01/2023", format="%d/%m/%Y"), 
    to = as.Date("01/01/2030", format="%d/%m/%Y"), by="year")
#by = "year" yazdığımızda yılları 1er 1er arttırarak oluşturacak.

#tabi bir de quertar var yılı 4 e bölecek şekilde arttırım uygulayabiliriz. 03, 06, 09, 12 şeklinde
seq(from = as.Date("01/01/2023", format="%d/%m/%Y"), 
    to = as.Date("31/12/2023", format="%d/%m/%Y"), by="quarter")

seq(from = as.Date("01/01/2023", format="%d/%m/%Y"), 
    to = as.Date("01/01/2030", format="%d/%m/%Y"), by="quarter")
#NOT: by="quarter" yalnızca aylar ve yıllar üzerinde çalışmaktadır. Çünkü yılı 4 e bölme mantığı ile hareket etmekte günler üzerinde çalışmamaktadır.


#Zaman ve Tarih içeren değerler üzerinde
seq(from = as.POSIXlt("01/01/2023 12:30:00", format="%d/%m/%Y %H:%M:%S"), 
    to = as.POSIXlt("30/01/2023 12:45:00", format="%d/%m/%Y %H:%M:%S"), by=1)
#biz eğer by parametresine numeric değer girersek zaman ve tarih yapısının en küçük birimi olan saniye arttırımı yapacaktır.

#peki ben dakika olarak arttırmak istersem bunu şu mantıkla yapacağız 1 dakika kaç saniye = 60 o zaman.
seq(from = as.POSIXlt("01/01/2023 12:30:00", format="%d/%m/%Y %H:%M:%S"), 
    to = as.POSIXlt("30/01/2023 12:45:00", format="%d/%m/%Y %H:%M:%S"), by=60)

#peki ben saat olarak birer birer arttırmak istersem saati saniye cinsinden yazalım. 1 saat 60*60 saniye ozaman.
seq(from = as.POSIXlt("01/01/2023 12:30:00", format="%d/%m/%Y %H:%M:%S"), 
    to = as.POSIXlt("30/01/2023 12:45:00", format="%d/%m/%Y %H:%M:%S"), by=60*60)

#peki bizler saniye, dakika, saat, gün, ay, yıl arttırımları numeric olarak değil de farklı şekilde yapabiliyor muyuz ?

#SANİYE 
seq(from = as.POSIXlt("01/01/2023 12:30:00", format="%d/%m/%Y %H:%M:%S"), 
    to = as.POSIXlt("30/01/2023 12:45:00", format="%d/%m/%Y %H:%M:%S"), by="sec")
#by = "sec" yazdığımızda saniye 1er 1er artarak oluşturulacaktır.

#DAKİKA
seq(from = as.POSIXlt("01/01/2023 12:30:00", format="%d/%m/%Y %H:%M:%S"), 
    to = as.POSIXlt("30/01/2023 12:45:00", format="%d/%m/%Y %H:%M:%S"), by="min")
#by = "min" yazdığımızda dakika 1er 1er artarak oluşturulacaktır.

#SAAT
seq(from = as.POSIXlt("01/01/2023 12:30:00", format="%d/%m/%Y %H:%M:%S"), 
    to = as.POSIXlt("30/01/2023 12:45:00", format="%d/%m/%Y %H:%M:%S"), by="hour")
#by = "hour" yazdığımızda saat 1er 1er artarak oluşturulacaktır.

#GÜN
seq(from = as.POSIXlt("01/01/2023 12:30:00", format="%d/%m/%Y %H:%M:%S"), 
    to = as.POSIXlt("30/01/2023 12:45:00", format="%d/%m/%Y %H:%M:%S"), by="day")
#by = "day" yazdığımızda gün 1er 1er artarak oluşturulacaktır.

#AY
seq(from = as.POSIXlt("01/01/2023 12:30:00", format="%d/%m/%Y %H:%M:%S"), 
    to = as.POSIXlt("30/12/2023 12:45:00", format="%d/%m/%Y %H:%M:%S"), by="mon")
#by = "mon" yazdığımızda ay 1er 1er artarak oluşturulacaktır.

#YIL
seq(from = as.POSIXlt("01/01/2023 12:30:00", format="%d/%m/%Y %H:%M:%S"), 
    to = as.POSIXlt("30/01/2030 12:45:00", format="%d/%m/%Y %H:%M:%S"), by="year")
#by = "year" yazdığımızda yıl 1er 1er artarak oluşturulacaktır.

#********TARİH DEĞİŞKENİNDE SORGU, BELİRLİ TARİHTEN SONRA VEYA ÖNCE GELEN DEĞERLER************
#Şimdi hemen bir tarih vektörü oluşturalım.
d <- seq(from = as.Date('2012-01-01'), to = as.Date('2020-01-01'), by = "month")
d
class(d)
#Not: yukarıda oluştururken format belirlemedik nedeni R'ın kendi yapısında bir format ile oluşturduk yani ilk önce yıl-ay-gün şeklinde bir yapı oluşturursak R bunu algılayacağından dolayı default olarak bunun formatını belirtmemize gerek yoktur.
#Not: ama farklı gün/ay/yıl şeklinde yapsaydık yine format yazmamız gerekirdi.
#Şimdi ay ay artan bir vektör oluşturduk.

#şimdi biz vektörlerde sorgulamayı nasıl yapıyorduk.
x <- c(1,2,3,4,6,7,8,9)
x > 2
#bunu yaptığımızda bize bu sorgunun doğru olan yerlerini true olarak gösterecekti.

#biz vektörümüzde hangi değerler 2 den büyük bu değerlerin indislerini öğrenmek istersek.
which(x>2)

#eğer bu sorgumuzdaki değerleri görmek istersek.
x[x > 2]
#veya
x[which(x > 2)]
#değerleri görebiliyorduk.

#şimdi gelelim tarih vektörümüze.
#2012 ile 2020 arasında bir vektör oluşturduk ben 2015 den büyük olan tarihlerin hangileri olduğunu merak ediyorum.
d > '2015-01-01'

#peki 2015 den büyük kaç tane tarih var elimde
sum(d > '2015-01-01')

#peki ben bu 2015 tarihinden büyük değerlerimin indis değelerini öğrenmek istiyorum.
which(d > '2015-01-01')

#peki ben 2015 tarihinden büyük tarih değerlerimi görmek istiyorum.
d[d > '2015-01-01']
#veya
d[which(d > '2015-01-01')]

#peki ben formata uygun olmayacak şekilde de sorgulamak istiyorum yani illa '2015-01-01' değil de '03/07/2015' den büyük değerleri istiyorum bunun için ne yapmam gerek.
d > as.Date('03/07/2015', format = "%d/%m/%Y")
#eğer Rın kendi formatına uygun olmayan sorgular yapmak istersek format belirtmemiz gerek.

#peki ben bu uygun olmayan format sorgulamasındaki vektördeki elemanların indis değelerini merak ediyorum.
which(d > as.Date('03/07/2015', format = "%d/%m/%Y"))

#peki ben bu '03/07/2015' tarihinden büyük olan değerlerimin kaç olduğunu merak ediyorum.
d[d > as.Date('03/07/2015', format = "%d/%m/%Y")]
#veya
d[which(d > as.Date('03/07/2015', format = "%d/%m/%Y"))]
#veya farklı şekilde de bunu yapabiliriz.(indx değişkenine atadık)
indx <- d > as.Date('03/07/2015', format = "%d/%m/%Y")
d[indx]

#Tarih ve Zaman içeren vektörlerde nasıl yapacağız sorgulama işini.
#aynı mantık ile yapacağız ilk önce R formatına uygun dakika şeklinde artan bir vektör oluşturalım.

dt <- seq(from = as.POSIXlt('2012-01-01 12:00:00'), 
          to=as.POSIXlt('2012-01-01 12:45:00'), by="min")
#gördüğümüz üzere formata uygun yazdığımızda format belirtmemize gerek yok. yıl-ay-gün saat-dakika-saniye şeklinde
dt
class(dt)

#şimdi burada sorgulamalara başlayalım.
#'2012-01-01' tarihinde saat 12:30 dan sonra kaç tane tarih değerimiz var buna bir bakalım.
dt > '2012-01-01 12:30:00'
#bu değerlerin indisleri kaçmış ona bakalım.
which(dt > '2012-01-01 12:30:00')
#peki bu değerlermiz nelermiş ona bakalım.
dt[dt > '2012-01-01 12:30:00']
#veya
dt[which(dt > '2012-01-01 12:30:00')]
#değerlerimizi de gördük kaç tane değerimiz varmış.
sum(dt > '2012-01-01 12:30:00')

#formata uygun olmayan şekilde sorgulama yapalım.
#'01/01/2012 12:30:30' dan küçük olan kaç tarihim var bunu öğrenelim
dt < as.POSIXlt('01/01/2012 12:30:30', format = '%d/%m/%Y %H:%M:%S')
#bu değerlerimizin indislerini bakalım vektör içinde
which(dt < as.POSIXlt('01/01/2012 12:30:30', format = '%d/%m/%Y %H:%M:%S'))
#peki bu tarihlerimiz nelermiş bir bakalım.
dt[dt < as.POSIXlt('01/01/2012 12:30:30', format = '%d/%m/%Y %H:%M:%S')]
#veya
dt[which(dt < as.POSIXlt('01/01/2012 12:30:30', format = '%d/%m/%Y %H:%M:%S'))]

#NOT: eğer R'ın formatına uygun şekilde yapılan sorgularda as.Date() kullanılmaz ama formata uygun olmayan sorgular yapmak istersek as.Date fonk. kullanmamız ve format parametresini de belirtmemiz gerekmektedir.

#Formata uygun yalnız bir tarih sorgulayalım.
#'2016-01-01 12:36:00' eşit olanı sorgulayalım.
dt == '2012-01-01 12:36:00'
#elimle sayarak 37.indis olarak gördüm şimdi bunun indisine bakalım daha kısa yoldan
which(dt == '2012-01-01 12:36:00')
#peki bu elemanımız neymiş ona bir bakalım. Yani 37.indis de hangi tarihimiz var.
dt[dt == '2012-01-01 12:36:00']
#veya
dt[which(dt == '2012-01-01 12:36:00')]

#***********************İKİ TARİH ARASINDA KALAN DEĞERLERİN ELDE EDİLMESİ*******************************
#bu dersimizde 'and' ve 'or' kavramlarını R da göreceğiz.
#ilk önce numeric vektör üzerinde bir örnek olarak gösterelim daha sonra tarih vektörleri üzerinde gösterelim.

x <- c(1,2,3,4,5,6,7,8)
x < 5
x > 7

#AND operatörü iki koşul da sağlanması gerekir mantık konusundan 1^1 = 1
x < 5 & x > 3 
x[x < 5 & x > 3]

#OR operatörü bir koşul sağlansa yeterlidir. 1 v 0 = 1
x  > 3 | x < 7 
x[x > 3 | x < 7]
#nedeni 3 ten büyük veya 7 den küçük olanlar zaten vektörün hepsi olmuş oluyor.

#şimdi gelelim bir tarih vektörü oluşturmaya.
d <- seq(from = as.Date('2023-12-01'),
         to = as.Date('2023-12-25'),
         by = 'day')
d
#ben şimdi bir tarih ile bir tarih arasında olanları getir diyeceği ve operatörü kullanarak
d > '2023-12-10' & d < '2023-12-20'
#true false olarak saydım ama indislerini bir görelim kaçıncı indisteki tarihler.
which(d > '2023-12-10' & d < '2023-12-20')
#bir de son olarak elemanlarımızı görelim.
d[d > '2023-12-10' & d < '2023-12-20']
#veya
d[which(d > '2023-12-10' & d < '2023-12-20')]

#şimdi bir de bu işlemi tarih ve zaman üzerinde gerçekleştirelim.
dt <- seq(from = as.POSIXlt('2023-12-01 23:00:00'),
         to = as.POSIXlt('2023-12-25 23:45:00'),
         by = 'min')
dt

#şimdi and ile bir sorgu yazalım.
dt > '2023-12-01 23:05:54' & dt < '2023-12-01 23:30:31'
which(dt > '2023-12-01 23:05:54' & dt < '2023-12-01 23:30:31')
dt[dt > '2023-12-01 23:05:54' & dt < '2023-12-01 23:30:31']
#veya
dt[which(dt > '2023-12-01 23:05:54' & dt < '2023-12-01 23:30:31')]

#***************TARİHLERDEN OLUŞAN VEKTÖRLERDE TARİH FARKLARININ ELDE EDİLMESİ*******************************
#Bu dersimizde iki tarih vektörü arasındaki farkın nasıl hesaplanacağını göreceğiz.
#iki tane tarih vektörü oluşturalım. Burada dikkat etmemiz gereken nokta iki tane tarih vektörümün uzunluklarının eşit olması gerekmektedir.

d1 <- seq(from = as.Date('2023-01-01'),
          to = as.Date('2023-06-01'),
          by = "month")

d2 <- seq(from = as.Date('2023-02-01'),
          to = as.Date('2023-07-01'),
          by = "month")

length(d1)
length(d2)

#ikisinin de veri yapısı date olduğu için direkt çıkarma işlemi yapabiliriz.
class(d1)
class(d2)

d2 - d1
#burada sırasıyla elemanları birbirinden çıkarıyor ve bize date türünde en küçük eleman gün olduğu için gün bazında sonuçları vermektedir.
#yani d2 de olan 1.tarih ile d1 de olan 1.tarihi çıkartıyor daha sonra diğer elemanları da sırasıyla çıkartıyor.

#peki ben bir vektörden benim yazacağım bir tarihi çıkartamaz mıyım ? 
d2 - as.Date('2023-02-01')
#farklı artış olmasının sebebi bir ay içindeki gün sayılarının değişkenlik göstermesidir.

#********************************TARİH VEKTÖRLERİNİN SIRALANMASI*******************************
#normal zamanda numeric vektörlerde biz sıralamayı sort() fonk. ile gerçekleştiriyorduk.
x <- c(1,2,3,4,5)

sort(x, decreasing = TRUE)
#büyükten küçüğe doğru sıralama veya küçükten büyüğe doğru sıralama yapabiliyorduk.

#şimdi hemen bir tarih vektörü oluşturalım.

d <- seq(from = as.Date('2023-12-01'),
         to = as.Date('2023-12-30'),
         by = "day")

d

#şimdi bizim tarih vektörümüzü biraz karıştıralım bunu da sample() fonk. ile karıştırıyorduk.
dr <- sample(d)
dr

#şimdi bizim karışmış olan tarih vektörümüzü sıralayalım.
sort(dr, decreasing = TRUE)
#Büyükten küçüğe doğru sıralanacak. Büyük tarihten küçük tarihe doğru.
#şimdi yukarıdakinin tam tersini yapalım.
sort(dr, decreasing = FALSE)

#**********STRPTIME() FONKSIYONU İLE HEM TARİH HEM DE TARİH ZAMAN DEĞERLERİ OLUŞTURMA*******************************
#biz tarih veya tarih zaman oluştururken as.Date(), as.POSIXlt() ve as.POSIXct() fonks. öğrenmiştik.
#bu dersimizde aynı as.POSIXlt() ve as.POSIXct() gibi davranan yeni bir tarih oluşturma fonk. öğreneceğiz.
#Strptime() fonk. diğer fonk. farkı daha hızlı çalıştığı. bunu az verilerde pek fazla anlayamayabiliyoruz ama büyük veri setlerinde fark ortaya çıkmaktadır.

#strptime fonk. her zaman format parametresini belirtmem gerekiyor.
#şimdi hemen örnek olarak bakalım.

x <- '2023-12-01'
#normalde biz bunu as.DATE(x) yazarak date fonk. kullanarak date veri yapısına dönüştürüyordu format yazmamıza gerek yoktu çünkü R formatında yazıyorduk.
#ancak strptime() fonk. format belirtmemiz gerek aksi halde hata alırız.
x <- strptime(x, format = '%Y-%m-%d')
#şimdi biz yukarıda strptime() fonk. yapı itibari ile as.POSIXct() veya as.POSIXlt() gibi davranır dedik. Şimdi strptime ile oluşturduğumuz tarihin yapısına bakalım.
class(x)
#görüldüğü üzere yapısı POSIXlt ve POSIXct oldu.

#birde türkiye de kullanılan tarih olarak yazalım.
x2 <- '10/03/2023'

x2 <- strptime(x2, format = '%d/%m/%Y')

class(x2)

#format kullanımı da nasıl oluşturulduysa o format türünü yazıyoruz.

#şimdi strptime() fonk ile tarih ve zaman içeren formatı da oluşturalım.
x3 <- '2023-05-12 23:12:00'
x3 <- strptime(x3, format = '%Y-%m-%d %H:%M:%S')
class(x3)
x3

#bir de biz time zone belirleyebilirz.
x3 <- '2023-05-12 23:12:00'
x3 <- strptime(x3, format = '%Y-%m-%d %H:%M:%S', tz = 'UTC')
class(x3)
x3

#time zone yani tz önemi nedir ? time zonelar bize bir yerden veri geleceğinde önemli. time zone sayesinde kendi zmanaımız ile diğerinin zamanı arasındaki farkı bulabiliyoruz. 

#**********CHRON KÜTÜPHANESİNİ KULLANARAK TARİH VE ZAMAN DEĞİŞKENİ OLUŞTURMA*******************************
#chron kütüphanesi R da kayıtlı değil. Bunu dışarıdan install yapmamız gerek.
install.packages('chron')
library(chron)

#chron kendi başına bir modül. biz as.Date() fonksiyonunda %ile format girişlerini sağlıyorduk ancak burada direkt olarak y m d olarak yani yüzde kullanmayarak yapılabilir.
#şimdi hemen örnek yapalım. İlk önce dışarıdan bir tarih girdisi yapalım.
x <- '01/01/2020'
y <- '01/02/2020'

d <- c(x,y)
class(d)
#karakter olan tarihimizi şimdi chron ile date yapısına dönüştürelim.
dt <- chron(dates. = d, format = "d/m/Y")
class(dt)
#peki neden yapısı hem dates hem de times çünkü chron içide hem dates hem de times noktaları var.

#şimdi hem dates hem de times şeklinde bir örnek oluşturalım.
x <- '01/01/2020'
y <- '01/02/2020'
x1 <- '12:00:00'
x2 <- '12:00:00'
d <- c(x,y)
d1 <- c(x1,x2)

dt1 <- chron(dates. = d, times. = d1, format = c(dates.='d/m/Y', times.='h:m:s')) 
dt1
class(dt1)

#içerisinden ilk tarihi seçmek için de 
dt1[1]
#chron da dikkat edilmesi noktası dates ve times ayrı ayrı belirtilebilir. Yalnızca tarihler için çalışıyorsak date belirtilebilir yalnızca zamanlar üzerinde çalışılıyorsa time belirtilebilir.

#**********TARİH VE ZAMAN DEĞİŞKENİNDEN TARİH VE ZAMANIN İKİ DEĞİŞKENE AYRIŞTIRILMASI*******************************
#bazı durumlarda tarih ve zamanı birbirinden ayırmamız gerektiği durumlar olabilir.
#şimdi bunun üzerine çalışmalar gerçekleştireceğiz.
#şimdi bir tarih vektörü oluşturalım ama strptime() fonk. ile oluşturalım. #strptime fonk. format girmek zorunlu onu unutma.
d <- seq(from = strptime('2023-01-01 12:00:00', format = '%Y-%m-%d %H:%M:%S'),
         to = strptime('2023-01-30 12:30:00', format = '%Y-%m-%d %H:%M:%S'),
         by = 'day')
d
#şimdi biz burada bulunan tarihler ile saatleri birbirinden ayırıp bir data frame oluşturmak istiyoruz.
#bunu ayırmak için biz bir yol öğrenmiştik format() fonk.
#aslında format() fonk. belirli yapıda formatların parçalanması veya değiştirilmesi amacıyla kullandığımız bir fonk.
#şimdi ilk başta d vektörü içinde olan formatı ayıralım.
tarih <- format(d, format = '%Y-%m-%d')
tarih
class(tarih)
#şimdi zamanları da zaman değişkenine atayalım
zaman <- format(d, format = '%H:%M:%S')
zaman
class(zaman)
#şimdi tarih ve zaman formatlarından character formatına da dönüşmüş olduğunu görüyoruz.
#şimdi yapıları değiştirmeden önce ilk başta bunları bir data frame olarak toplayalım.
df <- data.frame('Tarih' = tarih, 'Zaman' = zaman)
df
#şimdi bakalım hangi yapıya dönüştüler.
class(df$Tarih)
class(df$Zaman)

#şimdi bu karakter olan zaman ve tarihi date veya time değişkenine çevirmemiz gerek.
#Tarihi çevirirken bir problem yok ama zamanı çevirirken bazen hatalar ile karşılaşıyoruz.
#şimdi ilk önce problemi görelim daha sonra çözüme odaklanalım.
#ilk önce tarihi çevirelim.
as.Date(df$Tarih)
class(as.Date(df$Tarih))
#görüldüğü üzere bir problem yok.
#şimdi zamanı çevirelim. bunu da datetime yapısı olan as.POSIXlt() ile çevirelim.
as.POSIXlt(df$Zaman, format = '%H:%M:%S')
#şimdi hatayı gördük değil mi tarihlerin hepsi anlık tarihe dönüştü halbu ki yukarıdaki tarihlerim farklıydı.
#peki ben zamanı nasıl dönüştüreceğim. Hatırlarsanız bir önceki derste chron() kütüphanesini görmüştük.
#chron kütüphanesi içinde iki tane fonksiyon var dates() ve times() diye. 
#işte biz bu noktada bundan yararlanacağız.
#şimdi data frame içinde olan date ve time karakterlerini chron kütüphanesinde olan dates ve times fonk. kullanarak yapısını değiştireceğiz.
dates(df$Tarih, format='y-m-d')
#şimdi çevirdi ama tarihleri - ile değil / ile yazdı sorun değil bunun nedeni chron kütüphanesi r'a dışarıdan eklenen bir kütüphane olduğu için.
times(df$Zaman, format='h:m:s')

df$Tarih <- dates(df$Tarih, format='y-m-d')
df$Zaman <- times(df$Zaman, format='h:m:s')
class(df$Tarih)
class(df$Zaman)

#gördüğümüz üzere bunları da başarılı şekilde chron kütüphanesinde bulunan dates ve times fonksiyonları ile ayrı ayrı şekilde dönüştürdük.
#şimdi bunu da halledikten sonra. artık işlemler de yapılabilir.
#zamanları birbirinden çıkartabiliriz.
df$Zaman[4] - df$Zaman[2]

#işlem sırası şu şekilde
#1-ilk önce seq() fonk ile strptime fonksiyonu ile format kullanarak biz tarih zaman vektörü oluşturduk 01 den 30'a kadar
#2-daha sonra biz format fonk. kullanarak tarih ve zaman adında değişkenlere biz ayrı ayrı ayrıştırdık.
#3- daha sonra bunlar dönüşüm uygulandığı için yapısı karakter oldu ve bunları değiştirmek istedik date ve datetime a
#4- dönüştürmeden önce bunları bir data frame çatısı altında topladık.
#5-daha sonra yapı dönüştürme işlemine geçtik as.DATE() ve as.POSIXlt() kullanacaktık ancak zamanın dönüşmesinde sorun oluşturduğu için chron kütüphanesinden yararlandık.
#6-chrone kütüphanesi içinde dates() ve times() fonks. yararlanarak karakter olan yapıları sırasıyla date ve datetime olarak dönüştürdük.

#NOT: parçalama sonrası dönüşümlerde chrone kullanılabilir.

#******************************WEEKDAYS() VE MONTHS() FONKSİYONLARI**************************
#biz bu zamana kadar hep numeric tarihler oluşturduk 2020-12-10 gibi ama 2012 eylül 3 gibi tarihlerde oluşturabiliriz.
#weekdays() fonksiyonu haftanın hangi günlerini
#months() fonksiyonu o tarihte hangi yıla denk geldiğini yazdırıyor.
#şimdi bunları görelim.

#rastgele bir tarih giriyorum.
x <- '10/11/2013'
#şimdi karakteri bir date formatına çevirelim.
x <- as.Date(x, format = '%d/%m/%Y')
class(x)

#şimdi bu tarih hangi günmüş bunu öğrenmek için weekdays() fonk. kullanacağız.
weekdays(x)
#görüldüğü üzere sunday cevabını aldık 10-11-2013 = sunday 

#şimdi bu hangi ay bunu öğrenmek için de months() fonk. kullanmamız gerekiyor.
months(x)
#görüldüğü üzere november cevabını verdi yani bu tarih november ayına aitmiş

#bazen bize veriler yukarıda olduğu gibi numeric gelmiyor. Örneğin.
y <- '1 September 2020'
#şimdi biz bunu R'a tanıtmamız gerek. Date yapısına dönüştürelim.
as.Date(y, format = '%d %B %Y')
#%B --> ayı karakter ile yazdığımız anlamına gelmektedir.

#şimdi sistemimizin kullandığı dil şeklinde karakter olarak ayları yazarsak problem yok ama türkçe olarak 1 eylül 2030 yazıp bunu date fonk. çevirdiğimizde NA sonucunu alacağız.
#peki sistemimizin dışında bir dil ile veri geldiğinde ne yapmamız gerekiyor.
#ilk önce sessionınfo() fonk. çalıştıralım.
sessionInfo()
#eğer bunu değiştirmek istersek de
Sys.setlocale('LC_TIME', 'tr_TR.UTF-8')
#şeklidne ingilizceden sistemin dilini türkçeye değiştirebiliriz.
