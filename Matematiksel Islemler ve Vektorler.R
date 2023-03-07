#**************************** TEMEL MATEMATİKSEL İŞLEMLER ************************

x <- 5

y <- 15

#dört islem
x+y
y-x
y*x
y/x

#karesini ve küpünü alma
x**2
x**3

#sayının karekökünü almak
i <- 25
sqrt(i)

#R programlama dili negatif ve pozitif sayıya duyarlıdır
s <- -6
s*3
s**2
s**3

#R da ondalıklı sayılar nokta ile gösterilir.
3.16


#**************************** VEKTÖRLERDE MATEMATİKSEL İŞLEMLER ************************

#ilk önce bir vektör oluşturalım

x <- c(12,54,67,43,35)

x+5 #vektörde bulunan her elemana beş ekleyecek.

x-5 #vektörde bulunan her elemandan beş çıkaracak

x*5 #vektörde bulunan her eleman beş ile çarpılacak

x/5 #vektörde bulunan her eleman beş'e bölünecek

#yapılan işlemler kalıcı değil kalıcı olması için kendine tekrardan atama yapılması gerek
x <- x*5

#aynı şekilde iki vektör arasında da matematiksel işlemler yapabiliriz.
z <- x+5
z

#z vektörünü x 'in elemanlarının beş arttırılmış hali ile oluşturduk şimdi z ve x vektörlerini toplayalım

x+z
#buradaki kural x de olan 1.eleman ile z de bulunan 1.eleman toplanır. İki vektörde bulunan aynı indisler birbiri ile toplanır.

x*z
#iki vektörü birbiri ile çarpılabilir, çıkartılabilir, bölünebilir.

#bu zamana kadar iki vektör elemanları eşit sayıdaydı peki iki vektör elemanları eşit olmadığında nasıl olacak.
t <- c(1,5,6,9) #4 elemanlı
n <- c(4,6) #2 elemanlı

t+n
#buradaki kural şu yine aynı indis olanlar toplanır. az olan vektörde çok olan vektöre göre 2 sayı aynı şekilde yan yana yazılır yani;
#t vektörü 4 elemanlı n vektörü 2 elemanlı o zaman n vektörü (4,6,4,6) olur ve işlem bu şekilde aynı indisler toplamı şeklinde sonuca ulaşılır.

#**************************** VEKTÖR UZUNLUĞUNUN ELDE EDİLMESİ ************************

#biz konuyu öğrenmek için eleman sayısı küçük vektörler ile çalışıyoruz ama gerçek hayat verilerinde bazen vektörlerin eleman sayıları sayamayacağımız kadar büyük olmaktadır.
#bundan dolayı R da eleman sayılarını öğrenmek için bir fonksiyon bulunmaktadır. bu fonksiyon length() fonksiyonudur.

j <- c(1,2,3,4,5,6,0)

length(j)

ı <- c('a','c','f','j','k','l')

length(ı)

o <- c('A','B','C','D',
       'A','B','C','D',
       'A','B','C','D',
       'A','B','C','D',
       'A','B','C','D',
       'A','B','C','D',
       'A','B','C','D',
       'A','B','C','D',
       'A','B','C','D',
       'A','B','C','D')
length(o)

#ben o vektöründeki son elemana ulaşmak için yani 'D' harfine ulaşmak için şöyle yapmam gerek.
o[40]

#peki ben bu işlemi dinamik hale getirsem nasıl olur?
o[length(o)]
#r da kodlar sırası ile çalışır. ilk önce köşeli parantez içini okudu oradan 40 sonucuna erişti daha sonra o[40] olarak işlemi sonuçlandırdı.
#bu işlemi şu şekilde de yapabiliriz.
len <- length(o)
o[len]

#peki ben son değilde sondan 2. eleman olan B harfine erişmek için ne yapmam gerek.
o[len-2]

#**************************** VEKTÖRLERİN MİNİMUM VE MAKSİMUM DEĞERLERİ ************************
#vektörlerde minimum ve maksimum değerleri bulmak için min() ve max() fonksiyonlarını kullanırız.
#buradaki önemli olan ayrıntı vektörümüzün numeric olmasıdır. Harflerin sayısal karşılığı olmadığı için bu fonksiyonlar çalışmayacaktır.
#min ve max fonksiyonları negatif değerlere de duyarlıdır.

x <- c(1,5,10,23,74,34,5,78,87)

#minimum değer
min(x)

#maksimum değer
max(x)

y <- c(-5,-19,0,5,10,20,40,30,60)

#minimum değer
min(y)

#maksimum değer
max(y)

z <- c(-5,-2,-1)

#minimum değer
min(z)

#maksimum değer
max(z)

#sayısal işlemlerde de bu fonksiyonları kullanabiliriz
min(x) + min(y)

#işlem önceliği matematikte öncelikle parantez içi yapılır
(min(y) + min(y)) / min(y)

min(y) + min(y) / min(y)

#**************************** VEKTÖR ELEMANININ INDEXININ BULUNMASI ************************
#burada vektörlerde belirli bir değerin hangi indis'de olduğunu öğreneceğiz.
#bu çok önemli bir nokta büyük datasetlerinde çalışırken bir vektörün içindeki veya bir data frame içindeki elemanların hangi konumlarda olduğunu buluyoruz.
#bir data frame'de çalışırken elemanın hangi gözlemde olduğunu öğrenmiş olacağız.

x <- c(12,34,56,45,78,54)

#elemanın indis değerini bulurken == kullanırız. Bu eşit mi sorusunu tüm elemanlara sorar
x == 5
#x vektörü içindeki her elemana beşe eşit mi diye soruyor ve bize false şeklinde logical bir sonuç döndürüyor.

x == 78
#x vektörü içinde her elemana 78 eşit mi diye soruyor ve 5.eleman eşit olduğu için TRUE değerini döndürdü.
#ancak bu yöntem de biz yine elimizle sayıp TRUE değerini hangi indis numarasına eşit olduğunu buluyoruz daha pratik bir yöntem yok mu, direkt olarak biz indis değerini veren ? var which() fonk.

which(x == 5)
#bu fonk. sonucunda integer(0) sonucu verdi. Bunun anlamı x vektörü içinde 5 değerine ait indis değeri yok

which(x==78)
#görüldüğü üzere direkt olarak bize 78 sayısının indis değerini 5 olarak verdi. Yukarıda da TRUE 5.indisde verildi.

#NOT: which() fonk. true ve false değerlerine bakarak true değerlerini çekerek bana onun hangi indis olduğunun sonucunu verir.

y <- c(5,34,23,5,6)

which(y==5)
#y vektörü içinde 5 değeri 1. ve 4.indis değerlerinde olduğunu söylemektedir.

#peki ben bu değerlere ulaşmak istersem 1.ve 4. indis değerlerinde hangi değerler olduğunu görmek istersem 3 yöntem var

bes <- which(y==5)
y[bes]

#bu şekilde bize 1. ve 4. indis değerlerinde 5 5 değerleri olduğunu söylemektedir.

#ikinci yöntem
y[which(y==5)]
#bu da aynı mantık ile çalışmaktadır.

#üçüncü yöntem
y[y==5]
#bunun mantığı ise y==5 dediğimizde logical bir sonuc alıyoruz true veya false şeklinde. bu noktada ben bu şekilde parantez içinde kullandığımda sadece true değerlerini alarak bize sonuc olarak getirmektedir.

#**************************** VEKTÖRLERDE BÜYÜKTÜR KÜÇÜKTÜR SORGULARI ************************
#geçen ders işlediğimiz konunun devamı niteliğinde.
#bu dersimizde büyüktür, küçüktür veya eşit değildiri vektörler içerisinde kullanacağız.

x <- c(23,34,45,65,23,54,12)

x == 23
#23'e eşit olan vektör içindeki elemanların sonuçlarını mantıksal ifade ile getirecektir TRUE olarak.

x > 23
#bu ise x vektörü içinde 23 den büyük olan elemanları mantıksal ifade ile sonuç olarak getirecektir.
#burada 23 almadı çünkü büyük eşit değil şimdi onu yapalım.
x >= 23
#23 eşit ve büyük olan elemanları true olarak getirecektir.
x < 23
#aynı mantık ile x vektörü içinde 23 den küçük olanları true olarak getirecektir.

x <= 23
#23 eşit olan ve küçük olan x vektörü içindeki elemanları true olarak getirecektir.

x != 23
#23'e eşit olmayan elemanları true olarak getirecektir.

#peki biz bu elemanların kaç olduğunu görmek istersek 3 tane yolu vardı which() kullanarak veya kullanmayarak. Kullanmadan yapalım.
x[x < 23]
x[x > 23]
x[x != 23]
x[x <= 23]
x[x >= 23]
x[x == 23]

#bunlar kaydedilmiyor bunu kaydetmek için bir değişkene atamamız gerekmekte örneğin
buyuk <- x[x > 23]
buyuk

#********** VEKTÖRLERDE BÜYÜK KÜÇÜK EŞİT OLAN ELEMANLARIN İNDEXLERİNİN BULUNMASI************************
#biz vektörlerde indis bulmayı aslında fonksiyon olan which() fonksiyonu ile gerçekleştiriyorduk.

x <- c(23,34,35,37,12,1,90,145,32,14,16)

#şimdi ben x vektörü içinde 60dan büyük değerlerin indislerini öğrenmek için
which(x > 60)
#bunun sonucu 7 ve 8 bunun anlamı şu 7. ve 8.elemanlar x vektörü içinde 60'dan büyük olan elemanlardır.

which(x <= 45)
#bunun anlamı ise x vektörü içinde 45 eşit veya küçük olan elemanların indis numaraları. 1.2...elemanlar 45 den küçük veya eşitmiş.

#peki ben bu indislerde hangi sayılar olduğunu öğrenmek istersem 3 tane yol vardı.
f <- which(x < 60)
f
x[f]

#ikinci yöntem ise
x[which(x < 60)]

#üçüncü yöntem ise
x[x < 60]

#************ KARAKTER TÜRÜNDE VERİLERDEN OLUŞAN VEKTÖRLERDE BÜYÜKTÜR KÜÇÜKTÜR İŞLEMLERİ************************
#geçen derslerimizde numeric veri tiplerinden oluşan vektörler üzerinden eşittir büyüktür küçüktür sorgulamaları yapmıştık.
#bu dersimizde karakter veri tiplerinden oluşan vektörler üzerinde bunları yapacağızç

#karakter türünde büyüklük veya küçüklük alfabetik sıralamasına göre işleyecektir.
#abcde...z şeklinde burada a en küçük z en büyüktür.

'A' == 'A'
'B' == 'A'

#NOT: Karakter türünde sıralamalarda büyüktür küçüktür harf duyarlılığı mevcuttur yani b eşit değil B dir.
'Bb' == 'BB'

'B' != 'B'
'B' != 'A'

#küçüktür büyüktür sıralamaları
'B' < 'A'
'B' > 'A'

'B' >= 'A'
4 >= 3
#Burada büyüklüğü baz alıyor eşitliği değil aynı şey numeric ifadelerde de bu şekilde çalışır

'B' <= 'B'

#Kelimelerde ise şu şekilde;
'Ad' < 'Ar'
#ilk harf aynı şimdi ikinci harfler kıyaslanıyor d sıralama olarak r den küçük olduğundan dolayı TRUE döndürecektir.

#Not: harf sıralamalarında harflerin küçük hali önce büyük hali daha sonra gelmektedir. abcde....zABCD....Z şeklinde.
'Bd' < 'BD'
'BD' < 'Bd'

'd' < 'D'
'D' < 'd'

#Vektörlerde bu durum nasıl işliyor ona bakalım.
x <- c('A', 'B', 'C', 'D', 'A', 'F', 'Y')

x > 'X'
#bunun anlamı şudur. x vektörü içinde 'X' karakterinden daha sonra gelen yani büyük olan ifadeleri true olarak döndür. Yalnızca 7.eleman TRUE
#peki bunlar hangi elemanlar bunu öğrenmek için
x[x < 'X']
x[x > 'X']
x[x > 'D']
x[x >= 'D']

#peki ben direkt elemana değilde elemanların vektör içinde kaçıncı indisde olduğunu öğrenmek istersem eğer which() fonksiyonunu kullanmam gerekirdi.
which(x > 'D')
#x vektörü içinde D harfinden büyük yani sonra gelen elemanlar 6. ve 7.indisde olan elemanlardır.

which(x == 'A')
#x vektörü içinde A harfine eşit olan elemanlar 1. ve 5. indise sahip elemanlardır.

#peki ben 1.ve 5.indisde hangi elemanlar olduğunu görmek istersem
x[which(x == 'A')]
x[which(x > 'D')]

#kelime üzerinde sıralamlar
'Sergen' < 'Ahmet'
#ilk harf de sorun çıktı S A harfinden daha sonra geldiği için büyük olacak.

'Sergen' < 'Serkan'
#ilk 3 harf eşit 4.harf kıyaslandı ve g daha önce olduğu için küçük olduğu için TRUE dönecektir.

#büyük küçük sıralamasında farklı harfler işin içinde olduğunda küçük önce büyük sonra kuralı bozuluyor
'SeRgen' < 'Serkan'
'serkan' < 'seRgen'

#ama şu şekilde yazılırsa
'Sergen' < 'SeRgen'
'SeRgen' < 'Sergen'

#r R den daha önce geldiği için küçük olacaktır o zaman true ama diğeri false.

#************************ ARDIŞIK DEĞERLERDEN OLUŞAN VEKTÖR OLUŞTURMA************************
#ilk başlarda biz bir şey öğrenmiştik 
1:20
#bu işlemin sonucu 1den 20 ye kadar sayıyı ekrana ardışık şekilde bastırıyordu.
#bunun işlemi bir de r da oluşturulmuş olan seq() fonksiyonu ile deneyelim
seq(10)
#bu şekilde de 1den 10 kadar sayıları ekrana bastırabiliyoruz
#seq() fonksiyonu sequence den gelmektedir.

seq(1,10)
#aynı şekilde başlangıç ve bitiş değerlerini belirtip de seq() fonksiyonunu kullanabiliriz.

#peki biz vektörlerde ardışık değerleri nasıl oluşturuyoruz ? işte seq() fonksiyonu ile.
x <- seq(-4,10)
x

#seq() fonksiyonun bir de şu şekilde kullanımı mevcut
y <- seq(from = 0, to=22)
y

#şimdi biz R'da data frame konusunda bir satır sildiğimizde index sayısı ile beraber siliniyordu. örneğin 2.satırı sildiğimizde 134 şeklinde sıralanıyor peki ben bunu düzeltmek istersem 123 şeklinde nasıl yapmam gerek ?
#bunun için bir örnek yapalım. 
df <- data.frame('A' = c(1,2,3,4,5), 'B' = c(34,35,35,34,12))
df
#sonucunda gördüğümüz üzere en sol tarafta satır numaraları yer almakta örneğin ben 2.satırı silelim ve satır sırası nasıl olacak görelim.
df <- df[-2,]
df
#gördüğümüz üzere 2.satırı çıkarttığımızda 1-3-4-5 şeklinde sıralandı 1-2-3-4 şeklinde değil.
#ben bunu düzeltmek istersem nasıl yaparım şimdi bunu seq() fonksiyonu ile birleştirerek anlatalım.

#şimdi bir değişkenin veya bir vektörün uzunluğunu nasıl elde ediyorduk ? length() fonksiyonu ile.
uz <- length(df$A)
uz

#data framelerde satır isimlerini bulmamıza yarayan bir fonksiyonumuz var hemen bunu da kullanalım.
row.names(df)
#gördüğümüz üzere sildiğimiz 2. satırı burada göremiyoruz.
#ben bu satır sayılarımızın 1345 değil de 1234 şeklinde ilerlemesini istiyorum.
#işte biz row.names değişkenine seq() fonksiyonunu kullanarak 1,4 arasında ardışık vektör atamasını gerçekleştirelim.

row.names(df) <- seq(from = 1,to = uz)
row.names(df)

df
#df'i tekrar çağırdığımızda gördüğümüz üzere 1,2,3,4 şeklinde istediğimiz şekilde satır sayı sıralamasını gerçekleştirdik.

#************************ BELİRLİ BİR DEĞER İLE ARTAN ARDIŞIK VEKTÖRLER OLUŞTURMA************************
#geçen dersimizde seq() fonksiyonunun kullanımını görmüştük.
seq(10)
seq(1,10)
seq(from = 1, to = 10)

#bu dersimiz de ise artış miktarını kendimiz ayarlayabileceğiz by parametresini kullanarak seq() fonk. içinde.
seq(from = 1, to= 20, by=3)
#1'den 20 ye kadar 3'er 3'er artan dizi istedim.

z <- seq(from=1, to=10, by=0.05)
length(z)
z[181]

#biz seq() fonksiyonunda bir aralıkta kaç tane sayı olması gerektiğini R programlama diline öğretebiliyoruz. mesela 1 ile 10 arasında 30 tane sayı olsun artışı otomatik hesaplasın.
#bunu da length.out parametresini kullanarak yapıyoruz.
c <- seq(from = 1, to=10, length.out=30)
length(c)
#görüldüğü üzere 1 ile 10 arasında 30 tane sayı almasını istemiştik.

#NOT: length.out kullanacaksak by parametresini kullanma. by parametresini kullanacaksak length.out parametresini kullanma.

#************************ VEKTÖR DEĞERLERİNİN RASTEGELE OLARAK SIRALANMASI ************************
#geçen derslerimizde ardışık vektörleri ve düzenli şekilde artış olan vektörlerin oluşturmayı gördük.
#bu dersimizde belirli aralıkta oluşturduğumuz vektörü karmaşık olarak sıralamayı göreceğiz.
#bunu da r da fonksiyon olan sample() fonksiyonu ile yapacağız.

x <- seq(from = 100, to = 300, by = 10)
#100 ile 300 arasında 10'ar artacak şekilde bir vektör oluşturduk.
x
#görüldüğü üzere sıralı şekilde artış sağladık hadi 100 ile 300 arasında rastgele artış yapmasını sağlayalım.
sample(x)

sample(x)

#NOT: her sample kullanımı birbirinden farklı şekilde sıralamalar getirir.

sample(x, replace = TRUE)
#replace parametresi ise aynı sayıdan tekrar kullanmasını sağlar rastegele sıralamalarda.

#peki ben bu sample() fonk. ile oluşturduğum diziyi nasıl kaydederim. Tabii ki farklı değişkene atayarak.
y <- sample(x)
y

#sample() ne işe yarayacak ? ileride yapay zeka algoritmaları yaparken train ve test bölümleri olacak bunlar için karılmış verilere ihtiyaçlarımız olacak yani rastgele seçim için.

#************************ VEKTÖRLERDEN RASTEGELE ÖRNEK SEÇİMİ - SET.SEED() FONKSİYONU ************************
#ilerleyen derslerde bu sample fonksiyonunu çokca kullanacağız özellikle makine öğrenmesi tarafında.
#bir tane vektör oluşturalım.

x <- seq(from = 10, to = 200, length.out = 50)
length(x)

#ben bu 50 tane elemandan bir örnek alacağım ve bunu nasıl yapacağım rastgele yapacağım.
sample(x)
#bu vektörün eleman sayısı kadar eleman alıp karıştırıyor.
#ben bir tane rastgele eleman almak istersem eğer. size parametresini kullanmam gerekir.
sample(x, size = 1)

sample(x, size = 1)

#bu değerler x'in içinden bir tane eleman rastgele olarak ekrana geliyor.

#tekrar tekrar çalıştırdığımızda hep x elemanları içinden farklı sonuçlar gelecek ama ben bunu bir sabit noktaya oturtmak istiyorum.
#yani sample fonksiyonunu çalıştırdığımda hep aynı sonuca ulaşmak istiyorum yani x vektörü içinden 50 eleman içinden hep aynı eleman gelsin istiyorum.
#r kod yazdık bir sürü kullandığımız sample kapatıp açınca değişecek ve sonuçlara etki edecek biz bunu sabitlemek istiyoruz.
#biz bu sabitleme yapmak için set.seed() fonksiyonunu kullanıyoruz. Hemen örnek olarak gösterelim.
#set.seed() --> rastegeleliği sabitlemek için kullanılır.
#ben rastgeleliği 165 ile sabitlemek istiyorum.
set.seed(165)
sample(x, size=1)
set.seed(165)
sample(x, size=1)
#gördğüğümüz üzere ilk önce set.seed() fonk. çalıştırıp daha sonra sample çalıştırınca sonuç hep aynı gelmekte.
#KURAL: sabit değerler almak için önce set.seed() fonksiyonunu çalıştır daha sonra sample() fonksiyonunu çalıştır.
#tamamen rastgelelik istersek set.seed() kullanmayız.

sample(x, size=20)
#burada diyorum ki x vektöründen rastgele 20 tane eleman seç ve getir.
#50 tane elemanı olan vektörden rastgele 60 tane eleman seçim yapmak istersek ne olur?
sample(x, size = 60)
#hata ile karşılaşırız çünkü elimizde 50 tane var. Ama bunun bir çözümü var eğer tekrarlı şekilde elemanlar olursa 60 tane eleman seçimi yapılabilir.
sample(x, size = 60, replace = TRUE)
#gördüğümüz üzere 50 elemanlı vektörden rastegele 60 tane elemanı seçebildik. ama tekrarlı olacak şekilde.

#set.seed() bir tane eleman seçerken de kullanabilirim, birden fazla eleman seçerken de kullanabilirim.

#************************ TEKRAR EDEN DEĞERLERDEN OLUŞAN SERİLER OLUŞTURMA ************************
#biz geçen derslerimizde hep artış şeklinde vektörler oluşturduk seq() fonksiyonu ile ama tekrar eden seriler veya vektör oluşturmadık.
#bunu oluşturmak için rep() fonksiyonunu kullanacağız. repeat'dan gelmektedir.

rep(4)
#bir tane 4 oluşturur ama virgül yazıp sağına kaç tane oluşturmak istediğimizi belirtmemiz gerek.

rep(4, 14)
#14 tane 4 değerini oluşturmasını istedik.

#biz bir vektöründe elemanlarının tekrarlı oluşturmak isteyebiliriz.
x <- c(34,65,74,32)
rep(x , 2)
#bunun anlamı şu 34,65,74,32 den sonra tekrardan yanına aynısında yap. yani 2 defa kalıp şeklinde üret.

#ama ben her elemanın tekraren 2 defa yazılmasını istersem 34,34,65,65 gibi bunun içinde rep() fonksiyonunda each parametresini kullanmam gerek.
rep(x, each=2)

v <- rep(x, each=5)
length(v)

sample(v)
#ard arda tekrar şekilde değilde karışık şekilde gelmesini sağladık. bunu kaydetmek içinde farklı bir değişkene atıyorduk.

t <- sample(v)

#************************ VEKTÖRLERİN KÜÇÜKTEN BÜYÜĞE VEYA BÜYÜKTEN KÜÇÜĞE SIRALANIŞI ************************
#ÖZET OLMASI AMACIYLA
#seq() fonksiyonu ile bir değerden belli değere kadar belli bir artış ile vektör oluşturuyorudk
#rep() fonksiyonu ile belirli değeri istediğimiz sayıda tekrar ettirebiliyorduk.
#sample() fonksiyonu ile oluşturmuş olduğumuz vektörü karışık hale getirebiliyorduk.
#bu dersimizde de bir fonksiyondan bahsedeceğiz sort() fonks.
#sort() fonksiyonu vektörlerimizi büyükten küçüğe veya küçükten büyüğe sıralamıza yardımcı oluyor.

#hemen bir vektör oluşturalım manuel olarak
x <- c(34,23,54,65,12,3,4,7)

sort(x)
#direkt bu şekilde kullandığımızda default olarak küçükten büyüğe doğru sıraladı.

#eğer büyükten küçüğe doğru sıralamak istersek decreasing parametresini kullanmamız lazım
sort(x, decreasing = TRUE)

#numeric değerlerimizde sıralama bu şekilde ama karakter değerlerimizde sıralama nasıl olacak ? 
y <- c('Ahmet' , 'Osman' , 'Berk', 'Mehmet')

y

sort(y)
#baş harflerine dikkat edelim. A harfi ilk geldiği için alfabetik sıraya göre artan olacak şekilde sıraladı. A......Z küçükten büyüğe sıra olarak.

sort(y, decreasing = TRUE)
#bu sefer tam tersi şeklinde sıralama görüyoruz.

#ayrıca sıralamalarda istisnai durumlarda var vektörümüzde NA değeri varsa o zaman ne yapacağız ? 
na <- c(12,34,12,4,5,45,22,67,34,NA,NA)

na

sort(na)
#yine aynı şekilde küçükten büyüğe sıralamasını yapıyor ancak NA değerlerini hesaba katmıyor.
#NA ları keşif için tek vektör üzerinde çalışmalarda dahil etmeyebiliriz. ama ileride de kullanacağımız data framlerde önemli olan satır sayılarının aynı olmasıydı burada NA olan değerleri katmazsak iki data frame eşit olmayacak ve bize hatalar sunacaktır.
#NA ları sıralamaya katmak için de bir parametre kullanacağız. na.last

sort(na, decreasing = T, na.last = NA)
#na.last dediğimizde eğer NA dersek NA olan elemanlar sıralamaya dahil edilmez

sort(na, decreasing = T, na.last = T)
#na.last parametresini true yaptığımızda görüldüğü üzere sıralamaya dahil olacaklardır.
#büyükten küçüğe sıralayıp son değerleri NA olarak sıralaycaktır.

#ama ben NA değerlerimi son da değilde başta görmek istersem de
sort(na, decreasing = T, na.last = F)
#yine büyükten küçüğe sıralama yapacak ama NA değerleri başta yerini alacaktır.
#na.last anlamı na değerlerini sona koyayım mı demek True dersek evet FALSE dersek başa koy, NA dersek katma anlamı çıkar.

#Şimdi NA lar işin içine girince tüm indisleri kaybettik örneğin katmadığımızda 1-67 2-45 ama NA gelince işler karıştı. Bunun içinde bir parametremiz var.

sort(na, decreasing = T, na.last = T, index.return = T)
#burada x değerleri ix de index numaralarını göstermekte. 12 1.indis değeri diyor gerçekten de vektörü oluştururken 12 yi ilk başa yazmışız.

sıralama <- sort(na, decreasing = T, na.last = T, index.return = T)

class(sıralama)
#bunun bir liste olduğunu görüyoruz şimdi bir seçim yapalım.

sıralama[['x']]
sıralama[['ix']]






a <- seq(from = 20, to = 300, length.out = 200)

length(a)

sample <- sample(a, size = 50)
sample

length(sample)


which(sample > 100)
yuzdenbuyuk <- sample[which(sample > 100)]
son <- sort(yuzdenbuyuk, index.return=T)

son
