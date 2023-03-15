#***************************************DATA FRAME BOYUTLARI**************************************
#bu bölümde biraz daha data frame yani veri tabloları üzerine yoğunlaşacağız
#data frame bir veri setidir. Belirli değişkenleri vardır belirli gözlemleri vardır.
#data frame satırlardan ve sütunlardan oluşur.
#bu dersimizde data frame boyutlarından konuşacağız kaç tane değişken veya kaç tane gözlem değerinden oluşuyor bunları bulacağız.

#hemen bir tane data frame oluşturalım.
#oluştururken dikkat edilmesi gereken nokta her değişkende aynı sayıda eleman olması gerekmektedir.

df <- data.frame('A' = c(12,13,14,15,16),
                 'B' = c(12,17,67,23,45),
                 'C' = c('a','b','c','d','e'))
df
#data frame oluşturduk.
#A B C sütunları bulunmakta ve her sütunda 5 tane gözlem değeri var.
#şu anda veri setimin boyutu küçük olduğu için kaç değişken kaç gözlem olduğu gözükmektedir ancak büyük veri setlerinde bunu belirli fonk. sayesinde yapacağız.

#bir sütun seçip, o sütuna ait kaç gözlem değeri var bulmak için 2 yöntem var
#ilk yöntem
length(df$A)
#ikinci yöntem
nrow(df)
#n row aslında row=satır noktasından hatırlayabiliriz.

#data frame de değişkenlerimin kaç tane olduğunu öğrenmek için 2 yöntem var
#ilk yöntem
length(df) #burada belirli değişkeni seçmedik bundan dolayı yukarıda kullanımından farklı
#ikinci yöntem
ncol(df)

#NOT: kafa karıştırıcı olmaması açısından satır sayısını(gözlem sayısı) bulmak için nrow(), sütun sayısısını(değişken sayısı) bulmak için ncol() fonk. kullanmamız önerilir.
#ncol = number of column, nrow = number of row

#bir de hem sütun hem de satır değerini aynı anda gösteren bir fonk. var
d <- dim(df)
#burada eğer satır sayısına ulaşmak istersem
d[1]
#sütun sayısına ulaşmak istersem
d[2]

#*************************************DATA FRAME SORGU İŞLEMLERİ**************************************
#bu dersimizde vektörlerdeki sorgu işlemlerinden bahsedeceğiz, vektörlerde gördüğümüz sorgu işlemleri ile ilişkili şekilde olacaktır.
#ilk önce dataframe oluşturalım ama bu data frame normal dağılan elemanlardan oluşsun.

df <- data.frame('A' = rnorm(100, mean=10, sd=2),
                 'B' = rnorm(100, mean=34, sd=10),
                 'C' = rnorm(100, mean=45, sd=15))
df
#gördüğümüz gibi oluşmuş durumda
#biz oluşturduğumuz data frame'i daha düzenli şekilde görmek istersek View() fonk. kullanmalıyız
#View() fonk. R'ın oluşturmuş olduğu data tablosundan da bunu inceleyebiliriz.
View(df)

#vektörlerde sorgu işlemleri yaparken neler yapıyorduk > < != tarzında yapıyorduk. Şimdi bu sorguları data frameler üzerinde deneyelim.
#şimdi ben A sütun(değişkeninde) 8 değerinden küçük olan elemanları bulalım.
#ilk önce sorgumuzu yazalım R bize logic şekilde cevap verecek TRUE FALSE şeklinde
df$A < 8
#gördüğümüz üzere TRUE olan elemanlar bizim A değişkenimizde 8 den küçük elemanlar.
#biz bu elemanların indis değerine nasıl ulaşıyorduk ? which() fonk. kullanarak.
which(df$A < 8)
#gördüğümüz üzere aşağıda indis numaralarını belirtti.
#şimdi biz bu indis sorgusunu bir değişkene atayalım.
indx <- which(df$A < 8)
#şimdi biz direkt bu elemanlara ulaşmak istersek;
#data framelerde sorgu [satır, sütun] şeklinde yapılıyordu. aynı matrisde olduğu gibi.
df[indx,]
#bu şekilde bir sorguda yalnızca A sütununu biz 8 den küçük değerler olarak belirledik ve diğer B ve C sütunlar yalnızca bu indisde olan elemanlarını da getirmiş oldu.
#buna biz veri setimizde A'nın 8 den küçük olan alt kümesi diyoruz.
#biz A'yı referans alarak sadece B ve C sütunlarını da görmek isteyebiliriz.
df[indx, c('B', 'C')]
#bir de biz yalnızca A sütununu görmek isteyebiliriz.
df[indx, 'A']
#NOT: eğer tek sütun olarak alırsak data frame vektör şeklinde hareket eder eğer data frame şeklinde hareket etmesini istersek.
as.data.frame(df[indx, 'A'])

#şimdi farklı bir sorgu üzerinden örnekler geliştirelim
#B değişkenimizde(sütun) ortalama ve standart sapma değerlerini bulalım.
#ortalama
ort <- mean(df$B)
#standart sapma
sd <- sd(df$B)

#şimdi ben B değişkenimde yani sütunumda ortalamasından küçük olan değerleri merak ettim bunun için bir sorgu yazalım.
df$B < ort
#veya
df$B < mean(df$B)
#gördüğümüz üzere bize bu sorgu logic cevap veri true false şeklinde
#biz bu true yani bu koşulu sağlayan değerlerin indis numaralarını görmek için which() fonk. kullanıyorduk.
which(df$B < mean(df$B))
#şimdi biz bu indisleri bir değişkene atayalım çünkü elemanlara ulaşmamız için indis değerlerine ihtiyacımız var
indx2 <- which(df$B < mean(df$B))
#şimdi ben bu koşulu sağlayan elemanlara ulaşmak için;
df[indx2, ]
#görüldüğü üzere sadece B sütununda koşul olan kendi ortalamasından küçük değerleri görüyoruz.
#A ve C sütunları yalnızca o sorgudaki koşulu sağlayan indis numaraların ait değerlerini getirdi ama koşul yalnızca B için geçerli.
#ben yine A ve C sütunlarını sadece görmek isteyebilirim B sütununu referans alarak.
df[indx2, c('A','C')]
#veya yine yalnızca B sütununu görmek isterim.
df[indx2, 'B']
#tek sütun aldığımız için data frame olarak değil vektör olarak yani numeric şekilde görülmektedir.
class(df[indx2,'B'])
#biz bunu Yani yalnızca B sütununu data frame olarak görmek istersek
as.data.frame(df[indx2, 'B'])
#şeklinde kullanmalıyız.

#**************SUBSET() FONK VE BİRDEN FAZLA KOŞUL İLE DATA FRAME SORGU İŞLEMLERİ**************************************
#bir önceki dersimizde bir değişken üzerinden sorgu göndererek veri tablosunda belirli indexlerin alt kümelerini elde etmiştik.
#bunu bir değişkeni (sütun) almıştık veri seti içinden ardından değişkene büyüktür küçüktür gibi sorgularını göndererek belirli indeksler bulmuştuk 
#bu indekslerde yer alan veri setinin gözlemlerini(satır) elde etmiştik. Bu sayede verinin bir alt kümesini çıkartmıştık.

#Bu dersimizde de subset kullanarak birden fazla değişken(sütun) üzerinde sorgu nasıl yaparız bunu göreceğiz.
#derse başlamadan önce R ın kendi içinde bulunan datasetlerinden bahsedelim.
#bu datasetlere ulaşmak için data() fonk. çalıştıralım.
data()
#bir çok dataset bulunmakta biz bu dersimizde CO2 datasetini kullanacağız.
#CO2 veri setini de şu şekilde çağırabiliriz.
CO2
#daha güzel gözükmesi açısından
View(CO2)

#şimdi gelelim subset() fonk. kullanmaya
#ilk önce subset() fonk. kuralına bir bakalım nasıl kullanıyoruz.
#KURAL: subset(veri seti, subset = buraya birden fazla koşul, select = istenilen değişken(sütun))

#şimdi CO2 veri setimize 2 tane koşul gönderelim type = quebec olan ve uptake > 30 olan değerleri getirsin.
df1 <- CO2
#şimdi değişken yani sütun isimlerine bir bakalım
names(CO2)
df2 <- subset(CO2, subset = uptake > 30 & Type == 'Quebec' )
#biz burada select parametresini girmedik. Bunu girmediğimiz zaman tüm değişken yani sütun elemanları ile birlikte alt küme oluşacaktır.
df2
#gördüğümüz üzere uptake hepsi 30 dan büyük ve type hepsi quebec olarak karşımıza çıkıyor.
#hemen subset fonk. farkını görelim.
#ilk başta olan co2 datasetinde ki gözlem sayısı ile sonraki subset fonk kullanarak oluşturduğumuz değişkende olan gözlem sayısını kıyaslayalım.
nrow(CO2)
nrow(df2)
#gördüğümüz üzere ilk başta 84 olan gözlem sayısı şimdi 32 olmuş.

#şimdi ise yukarıdaki subset fonk. select parametresini de kullanalım. select parametresi ise tüm değişkenleri alt kümeye dahil etmez yalnızca o parametrede olan değişkenleri dahil eder.
df3 <- subset(CO2, subset = Type=='Quebec' & uptake > 30, select = c(Type, uptake))
df3
#gördüğümüz üzere sadece select parametresine girilen değişkenleri seçerek alt küme oluşturuyor.
#bir de diğer 2 değişkeni alalım.
df4 <- subset(CO2, subset = Type=='Quebec' & uptake > 30, select = c(Plant, Treatment))
df4

#yukarıda subset ile and koşulu uyguladık. Şimdi bir de or koşulu uygulayalım ve farkını anlayalım.
df5 <- subset(CO2, subset = uptake > 30 | Type == 'Quebec')
df5
#şimdi buradaki fark biz and koşulunda type'ı quebec olan ve uptake değeri 30dan büyük değerleri olanları getirmesini istedik.
#burada kullandığımız veya da ise uptake 30 dan büyük olan quebec veya mississippi değerleri ile type'i quebec olanları getirebilirsin anlamı taşır.
nrow(df5)
#görüldüğü üzere and koşulunda 32 gözlem(eleman) değeri varken, or koşulunda 50 tane gözlem değeri bulunamtadır. 

#*****************************SUBSET() FONK İÇ İÇE ÇOKLU SORGULAR**************************************
#subset() fonk. içinde koşulları bir tane veya ikili olarak mı yazılıyor ? hayır, bunun sayısını arttırabiliriz.
#bu dersimizde subset() fonk. da iç içe koşulları nasıl oluşturabiliriz bunu göreceğiz.
#bu dersimizde yine CO2 datasetini kullanacağız.

#ilk önce bir data setimize bakalım
CO2
#daha güzel gözükmesi için
View(CO2)
#ben burada iç içe koşul yazmak istiyorum.
#koşulum şu şekilde olsun ilk koşulum type'ı quebec veya treatment'ı nonchilled olsun ikinci koşulum ise uptake değeri 30 ile 35 arasında olsun.
#şimdi yazalım.
names(CO2)
df1 <- subset(CO2, subset = (Type == 'Quebec' | Treatment == 'nonchilled' ) &
                            (uptake > 30 & uptake < 35))
#şimdi burada şöyle kural var eğer iç içe koşul yazılacaksa parantez ile ayrılması ayrıca iki koşul arasında and, or koşulları gelmesi gerekir.
df1
View(df1)
#incelediğimizde Type noktasında quebec belirledik ama veya olarak da nonchilled olanların hepsi gelsin dedik bundan dolayı type noktasında mississippi görüyoruz.
#ikinci koşulumuz ise uptake değeri 30 ile 35 arasında olmasıydı.
#görüldüğü üzere koşulumuz başarılı şekilde uygulanıp alt kümemiz oluşturulmuştur.

#********************************SATIR VE SÜTUN ORTALAMALARI**************************************
#Bu dersimizde data frame üzerinde satırlar bazında ve sütunlar bazında ortalamaları nasıl elde edebiliriz bunu göreceğiz.
#hemen başlamadan önce bir veri seti seçelim.
#iris veri seti bu derste uygulamamız için güzel bir veri setidir.
data()
iris
View(iris)
#şimdi satırlar bazında ortalama aslında şöyle;
#1.satırımıza baktığımızda numeric değerlerin ortalaması, bir sonraki satıra iniyor oradaki numeric değerlerin ort... diye gidip tüm satırların tek tek ortalamasını alıyor yatay yönde
#sütunlar bazında ortalama ise dikey yönde olan tüm numeric değerlerin ortalamasını alma işlemine denir.
#bunları teker teker hesaplamak oldukça uğraştırıcı saatlerimizi harcamamız gerek;
#ama R içinde halihazırda bir fonk. var hem satır için hem sütun için;
#bu fonksiyonlar: rowMeans() ve colMeans() fonk.

#şimdi ilk başta satırlar bazında ortalamalarını alalım.
#şimdi burada veri setimizde dikkat etmemiz gereken nokta 5.sütun (değişken) numeric değil bir character bundan dolayı rowMeans() fonk. çalıştırdığımız da hata alacağız. İlk önce hatayı görelim
rowMeans(iris)
#görüldüğüz üzere x must be numeric hatası aldık. Yani numeric olması lazım diyor iris veri setinin çünkü içerisinde bir karakter değişkeni var diyor. 
#bunu şu şekilde çözelim 1,2,3,4. sütunlar üzerinden işlemi yaptıralım, dataframelerde seçimi köşeli parantez ile yapıyoruz.
d1 <- rowMeans(iris[1:4])
#biz bir de şunu öğrenmiştik veri setimize yeni sütunlar ekleyebiliyoruz.
iris1 <- iris
#rowMeans()'i yeni bir değişken olarak bu iris1'e eklemek isteyebiliriz.
#iris1['yenideğişkenismi'] atamaya yapmamız gerek.
iris1['birdörtort'] <- d1
iris1

#farklı bir örnek de yapalım bu sefer ilk iki satır ortalamalarını alalım.
d2 <- rowMeans(iris[1:2])
#şimdi bunu da iris1'e yeni bir değişken olarak atayalım.
iris1['birikiort'] <- d2
iris1
#görüldüğü üzere başarılı şekilde ekledik.

#NOT: data.frame'e yeni bir sütun eklemek için veriseti['eklenecekdeğişkenismi'] <- eklenecek değişken şeklinde uygulamamız lazım. Unutma bu değişken yani sütun eklemek için.

#şimdi gelelim sütunlar bazında ortalama almaya.
#sütunlar bazında da dikkat etmem gereken nokta karakter içeren sütunları almayacağız. Bunu da seçim ile gerçekleştirelim.
colMeans(iris[1:4])
#görüldüğü üzere sütun ortalamalarını bize verdi.
#bunu istersem yine ayrı bir satır olarak ekleyebilirim ama dikkat etmem gereken nokta var;
#eğer ben bunu ayrı bir satır olarak ekleyeceksem ayrıyeten diğer karakter olan sütun ve diğer ortalama sütunlarını içeren satırlara da değer vermem gerekiyor.
#yoksa NA olarak ayrılıyor.
#NOT:
#eğer biz gerçek bir veri analizi problemi ile uğraşıyorsam, bu veri setini analiz yapmak için kullanıyorsam sütunlar bazında ortalamayı ayrı bir satır olarak eklememiz kullanışlı olmayacaktır. 
#çünkü bize gerçekci bir sonuç vermez çünkü son satır bütün değerlerin ortalamasından oluşmuş olur.Bu da istatistikte yanlılığa sebep olur.
#colMeans() elde ettiğimzi değerleri ayrıca incelemeyi öneriyorum.
#ama satırlarda ortalama işlemi yapıyorsak bunu yeni bir değişken olarak veri setimize eklemeizde sakınca yoktur çünkü satırlar bazında yani

#dikkat etmemiz gereken noktalar
#ortalamasını alacağımız değişkenlerin(sütunların) numeric olması gerekmektedir.
#eğer numeric değilse bunlardan hata alıyoruz.
#ayrıca geçen derslerimizde de gördüğümüz değerlerimizde not available NA değerleri olabilir. Eğer NA değerleri varsa bunları ya remove edeceksiniz na.rm = T parametresi ile ya da NA içeren satırları komple silmemiz gerekecek.
#yoksa hiç bir sonuç elde edemeyeceğiz.
colMeans(iris, na.rm = T)

#************************
#kendi çalışmam
#ilk önce iris tablosunu yeni bir değikene atayalım iris2 diye ana tablo üzerinde değişiklik yapmamak için.
iris2 <- iris
#şimdi iris2 tablosunda bulunan numeric değeri silelim.
iris2[,5] <- NULL
#şimdi satırlar bazında ortalamasını alalım iris2
#burada sütun seçmeye gerek yok çünkü karakter sütunu kalmadı çıkardık.
satırort <- rowMeans(iris2)
#bir de sütun ortalamalarını alalım
sütunort <- colMeans(iris2)
#şimdi bu satır ortalamasını iris2 yeni değişken olarak atayacağız ama öncelikle çıkarmış olduğumuz satırı geri ekleyelim.
names(iris)
#ilk önce orjinalinden değişken adına ve verilerine bir bakalım.
#şimdi species sütununu bir değişkene atayalım.
eklenecekSutun <- iris[,5]
#şimdi iris2 tablosuna bu sütunu ekleyelim
iris2['Species'] <- eklenecekSutun
iris2
#şimdi ilk başta sildiğimiz sütunu ekledik şimdi ise satır bazın ortalamalarını da yeni sütuna ekleyelim.
iris2['SatırOrt'] <- satırort
iris2
#bunu daha güzel gözükmesi için
View(iris2)

#****************************DATA FRAME ÜZERİNDE GRUPLAR BAZINDA ORTALAMA**************************************
#data frame üzerinde gruplar bazında ortalama, standart sapma, toplamları nasıl olarak hesaplanır bunları göreceğiz.
#şimdi yine veri seti olarak iris veri setini kullanacağız.
View(iris)
#gruplar bazında dediğimiz tam olarak ne oluyor ?
#aslında kategorik değişkenlerimize göre bunu grupladığımız değişkenler oluyor.
#mesela bunu numeric değişkenlere göre de gruplayabiliriz ama biz burada temel olarak species sütununu (değişkenini) temel alalım
#ve species değişkenindeki her bir kategorik değişkeni bir grup olarak alalım yani setos bir grup olsun, versicolor bir grup olsun ve virginica bir grup olsun.
#peki tam olarak gruplar bazındadan kastım ne ?
#örneğin iris veri setinde çeşitli gözlemlerim var buradaki bazı gözlemler setosaya ait, bazı gözlemler versicolor ve bazı gözlemler ise virginica'ya ait.
#biz ne yapacağız bu gruplar bazında işlemlerde
#biz data framei bu gruplara göre parçalara bölüp o değişkende o gözlem de yer alan değerler üzerine hesaplamalar yapacağım
#ilk önce uzun yoldan anlatacağım daha sonra kısa yoldan sonuca ulaşmak için bir fonk. var onu göstereceğim.

#şimdi ben sepal.length değişkeninin ortalamasını almak istiyorum hangi türleri için setosa türleri için.
#ilk önce species değişkeninde hangi eleman indislerinin setosaya ait olacağını bulacağım
#daha sonra o indisteki değerleri seçip ortalamarını alacağım. Aynı şekilde versicolor ve virginica içinde bunları yapacağım.

#ilk önce sorgumuzu yazalım, setosaya ait species değelerini logic olarak cevaplasın.
iris$Species == 'setosa'
#şimdi bu türe ait elemanların indis değerlerini bulalım daha sonra ve değişkene atayalım.
which(iris$Species=='setosa')
#değerleri de bir değişkene atayalım.
setosaIndx <- which(iris$Species=='setosa')
#dilersek indislerinden gözlem değerlerini de görebiliriz.data.frame[satır,sütun] şeklinde erişiyorduk
iris[setosaIndx, c('Sepal.Length', 'Species')]

#şimdi diğer gruplarında indislerini aynı yöntemler ile bir değişkene atayalım.
iris$Species=='versicolor'
#şimdi indis değerlerine ulaşalım
which(iris$Species=='versicolor')
#şimdi bunu değişkene atayalım.
versicolorIndx <- which(iris$Species=='versicolor')
#gözlem değerlerine de erişebiliyoruz.
iris[versicolorIndx, c('Sepal.Length', 'Species')]

#son grubu da yapalım
iris$Species == 'virginica'
which(iris$Species=='virginica')
#değişkene atayalım
virginicaIndx <- which(iris$Species=='virginica')
#gözlem değerlerine de erişebiliyoruz
iris[virginicaIndx, c('Sepal.Length', 'Species')]

#şimdi ise bu indis değerlerinde olan gözlemlerin Sepal.Length değişkenine göre ayrı ayrı hepsinin ortalamasını alalım.
mean(iris[setosaIndx, c('Sepal.Length')])
#şimdi bunu bir değişkene atayalım
setosaOrt <- mean(iris[setosaIndx, c('Sepal.Length')])
#diğerlerini de böyle yapalım
versicolorOrt <- mean(iris[versicolorIndx, c('Sepal.Length')])
virginicaOrt <- mean(iris[virginicaIndx, c('Sepal.Length')])

#şimdi Sepal.Length'e göre ortalamalarına bakalım
setosaOrt
versicolorOrt
virginicaOrt
#NOT: neden bu şekilde yazdık çünkü data frame de seçme kuralı --> data.frame[satır,sütun] burada satır bölümüne ilgili grupların indislerini yazdık ki orada ki indisler yalnızca bir gruba ait.
#burada biz grup grup ayırdık.

#aslında bu uzun yoluydu çok daha kısa bir yolu var bir fonk. kullanarak ilk 4 sütuna göre ortalamalarını gösterebiliriz veya standart sapma veya toplam değerlerini
#bunu aggregate() fonk. ile yapıyoruz.
#KURA: aggregate(veriseti, by = hangi değişkene göre gruplamak istiyoruz, FUN = hangi isatistiki işlem yapmak istiyorsun)
#şimdi yukarıdaki uzun yolu olan işlemin aynısını burada gerçekleştirelim.
aggregate(iris, by=list(iris$Species), FUN = mean)
#bir hata aldık ama hesapladı.
#hatanın nedeni species değişkeni numeric olmaması şimdi bunu düzeltelim.
aggregate(iris[1:4], by=list(iris$Species), FUN = mean)
#bu şekilde ortalamasını almış olduk
#diğer istatistiki hesaplamaları da yapabiliriz.

#standart sapma
aggregate(iris[1:4], by=list(iris$Species), FUN = sd)

#toplam
aggregate(iris[1:4], by=list(iris$Species), FUN = sum)
#burada dikkat edilmesi nokta bu istatistiki hesaplamaları numeric değişkenler üzerinde yapmamız gerek bundan dolayı iris[1:4] alıyoruz. çünkü 5.değişken karakter olduğu için

#Yine bu fonk. da da NA değerlerini hesaba katmamak için na.rm parametresini kullanabiliriz.
aggregate(iris[1:4], by=list(iris$Species), Fun = sum, na.rm=T)

#NOT: gruplandırma parametresi olan by parametresini list ile belirlemek daha doğrudur.

#****************************CSV'den R'a VERİ AKTARMA İŞLEMİ**************************************
#bu dersimizde csv formatından veya excel formatından R içine nasıl veri aktarılı bunu göreceğiz.
#öncelikle veriler her zaman R içinde kayıtlı olarak gelmiyor veya hazır olarak gelmiyor.
#bizim dışarıdan excel formatından veya csv veya herhangi başka bir formattan bunu R içine aktarmamız gerekiyor.
#bu dersimizde de bu aktarma işlemi nasıl gerçekleştiriliyor bunu göreceğiz.
#şimdi örnek olan excel dosyamız olan singapurairbnb excel dosyası üzerinden anlatıma başlayalım.

#elimizde excel dosyası varsa bunu 2 türlü aktarabiliriz
#ya r'ın komutlarını kullanarak ya da r'ın sunduğu opsiyonal yükle butonunu kullanarak
#elimizdeki exceli ya excel ile ya da csv formatına dönüştürüp R'a aktarabiliriz.
#ama en güzel yol exceli csv formatına çevirip yüklemek olacaktır.
#excel de save as yaparak csv formatına dönüştürüp R'a geçiyoruz.

#İki yöntem var demiştik ya import ile ya da kod ile veri aktarımı yapacağız.
#import ile sağ üstte bulunuyor oradan yapabilirz.
#oradan excel formatında aktarmak için from excel kısmından dosyanın bulunduğu noktayı seçip aktarabiliriz.
#bir diğer aktarmak için csv kullanabiliriz. Yine import kısmından from base seçeneği ise csv için uygundur aynı yöntem ile yükleyebiliriz.
#bunu seçtikten sonra dosyamızın özelliklerini açılan pencereden belirleyip import edebiliriz. Bu özellikler virgül mü noktalı virgüllemi ayrılmış veya heading başlıklar olsun mu olmasın mı kısımlarıdır.

#diğer bir yöntem ise kod ile veri aktarımı
#bunun için read.csv() fonk. kullanacağız
#ama burada dikkat etmemiz gereken nokta ilk önce exceli csv formatına çevireceğiz.
#diğer önemli nokta ise bu fonk. içine dosyanın yolunu yazmak.
#tabi bunun kolay yolu da bu da working director belirlemek. Working director aslında R programının nerede çalıştığını bilmiyorum, bilgisayarımın hangi dizininde.
#bunu öğrenmek için getwd() fonk. kullanacağız.
getwd()
#dilersek bunu değiştirebiliriz.
setwd("..")
#.. yerine ekleyerek taşıyabiliriz.

#şimdi çalışma dizinindeki dosyaları görüntüleyebilmek için list.files() fonk. kullanmamız gerek
list.files()
list.files("Desktop")

#csv dosyamızı R'a çekmek için
read.csv('CSV__singapore.csv', header = TRUE, sep = ";", dec = ".") #fonk. kullanmamız gerek
#burada header = sütun başlıkları, sep = , veya ;, dec = ondalıklar neyle ayrılmış
#daha sonra csv'yi kod ile aktardıktan sonra
#bir değişkene atıyoruz bu aktardığımız csv'yi artık o değişkeni çağırdığımızda aktarılan veri setini de çağırmış olacağız.
df <- read.csv('CSV__singapore.csv', header = TRUE, sep = ";", dec = ".") 
#daha güzel gözükmesi için
View(df)

#NOT: eğer dosya R'ın çalışma dizininde değilse görmeyecektir.
#bizim R'ımız muhammettahaadiyaman dizininde çalışmaktadır.
#şimdi ben bunu masaüstü olarak değiştireceğim
getwd()
setwd("/Users/muhammettahaadiyaman/Desktop")
getwd()

#*************************MERGE() FONK. İLE İKİ DATA FRAME'İN BİRLEŞTİRİLMESİ*************************************
#Bu dersimizde merge() fonk. kullanarak 2 tane veri setimizi birleştirme işlemini göreceğiz.
#daha önceki derslerimizde bunları satır ve sütun bazında yapmıştık, yeni satırlar eklemiştik vs.
#bu biraz daha farklı bir işlem hemen anlatalım.
#iki tane tablomuz olduğunu düşünelim bir tanesi demografik bilgiler, diğeri ise işlem bilgileri.
#bu bir banka verisi olarak düşünebiliriz. 
#demografik bilgilerde ID,AGE,INCOME,LOCATION,GENDER
#işlem bilgilerinde ise TRANSACTION_ID,CUSTOMER_ID,CATEGORY,AMOUNT değişkenleri yani sütunları yer alıyor.
#benim buradaki amacım iki tane tabloyu birleştirmek.
#demografik bilgileri işlem bilgileri tablosuna eklemek istiyorum.
#işlem bilgileri tablosundaki her customer idsine göre her harcamaya bu müşterinin nerede oturduğunu cinsiyetinin ne olduğunu ve gelirinin ne olduğunu eklemek istiyorum.
#peki bunu neye göre yapacağım, customer_id'ye göre yapacağım
#dikkat ederseniz işlem bilgileri tablosunda customer_id sütunu var, demografik bilgileri tablosunda ise id sütunu var 
#yani benim yapacağım işlem şu id ile customer id yi eşitleyip merge etmek.

#şimdi işleme geçelim ve yapmaya başlayalım
#ilk önce 2 tane veri setimi excel olarak aktaralım.
#şimdi iki tane veri setimizi import ettik.
#biz neye göre birleştireceğiz customer id ve id ye göre bizim referansımız bu iki tabloda ortak olan değişken yani satırlar bunlar.

#şimdi merge() fonk. geçelim.
#ortak sütun isimleri farkı ise yani demografik id, transactions customer_id 
#KURAL: merge(birinci veri seti, ikinci veri seti, by.x = birinci sütun ismi, by.y = ikinci sütun ismi)
df <- merge(Demografik,Transactions,by.x = 'ID',by.y = 'CUSTOMER_ID')
View(df)
#ayrı ayrı olan customer id ve id değişken yani sütununu tek bir sütun altında id altında birleştirmiş tekrar tekrar yazmamış.

#KURAL:eşleştireceğimiz sütun isimleri aynı ise yani demografik sütununda id ve transactions sütununda id olursa
#merge(ilk veri seti, ikinci veri seti, by='eşleşecek sütun')
#ilk önce bizim Transactions tablosunda bulunan CUSTOMER_ID sütununun ismini ID olarak dönüştürelim.
names(Transactions)
names(Transactions)[2] <- "ID"
names(Transactions)

df2<-merge(Demografik,Transactions,by='ID')
df2
View(df2)

#*************************DATA FRAME BETİMSEL ÖZET BİLGİLERİ*************************************
#Bu dersimizde istatistiksel olarak özet bilgilerin nasıl çıkartıldığından bahsedeceğim
#hatırlarsak geçen bölüm istatistik değerlerini hesaplamayı görmüştük, mean,sd,frekans veya çeyreklik veya diğer istatistiksel değerleri hesağlayabiliyorduk.
#bunları her bir değişken için ayrı ayrı hesaplamamıza gerek yok
#bunun için summary() fonk. kullanabiliriz.
#Summary() fonk. data frame içindeki bütün değişkenleri alır ve bunların betimsel istatistiklerini çıkartır.
#yani bunların descriptive statisticslerini çıkartır diyebiliriz.
#hemen örnek olması amacıyla iris veri seti üzerinden gidelim.

View(iris)
#biz önceden her değişkenin ayrı ayrı descriptive hesaplamalarını yapıyorduk.
#artık summary fonk. kullanarak numeric olanları ayrı karakter olan değişkenleri ise ayrı ayrı descriptive hesaplamalarını gösterecektir.
summary(iris)
#örneğin biz karakter değişkenlerinde frekans değerlerini buluyorduk.
#aslında frekans değerleri bize belirli elemanın kaç kere tekrar ettiğini belirtiyordu
#burada species değişkeninde her elemanın 50 kez tekrar ettiğini belirtmektedir.

#bunu daha güzel şekilde görmek için
View(summary(iris))

#summary() fonk. aslında istatistiksel hesaplamaları yapan özet şeklinde bilgi veren fonk. olduğunu öğrendik.
#sırada bir diğer fonk. olan str() fonk. bir bakalım

#str() fonk. ise bütün değişkenlerimi alıp, değişkenlerimin türlerini kontrol etmektedir.
str(iris)
#görüldüğü üzere species'e kadar tüm değişkenler numeric ama species factor değişkeni olduğunu belirtmektedir.
#species faktör değişkeni. Faktör değişkeninin belirli seviyeleri vardır. İstatistikte bunlara ordinal değişken denilir.
#meslek düzeyi veya eğitim düzeyi ordinal bir değişkendir.  
#str() fonk. bir de bize veri setinin kaç gözlem observation ve kaç değişken variables'dan oluştuğunu da göstermektedir.

#biz 100bin satırlık verilerle çalışırken bazen ilk 10 veya son 10 verilerine bakmak isteyebiliriz.
#bunun için de bir fonk. var bu fonk. ise head() fonk.
head(iris)

#veya ben 10 ile 15 arasında kalan satırlara bakmak istersem eğer
iris[10:15,]
#satır için virgül soluna, sütun için ise virgül sağına değerlerin girilmesi gerekmektedir.

#head() fonk. bir de n parametresi bulunmaktadır. n aslıdna baştan kaç satıra kadar veri alayım anlamındadır.
#örneğin ben baştan ilk 10 veriyi almak istersem
head(iris, n=10)

#baştan olduğu gibi sondan da veriler çekebiliriz. bunu da tail() fonk. ile alabiliriz.
tail(iris)

#eğer sondan 10.veriye ulaşmak istersem
tail(iris, n=10)

#*************************DATA FRAME DEĞİŞKEN İSTATİSTİKLERİ*************************************
#bu dersimizde daha önce vektörler üzerine ayrıntılı olarak gördüğümüz descriptive statistics işlemlerini göreceğiz.
#zaten summary() fonk. görmüştük.
#summary() fonk. bir data frame üzerinde bulunan değişkenlerin özet istatistik bilgilerini bize veriyordu.
#eğer numeric ise mean,max,min,sd,1qrt,3qrt değerlerinin sonuçlarını veriyordu.
#eğer değişken nominal veya ordinal ise yani karakter değerlerinden oluşuyorsa frekans değerini veriyordu
#frekans değerin bir değerin bir değişkende ne kadar tekrar ettiğini belirtiyordu
#değişken üzerinde istatistik incelemeler yapacağız.
#bu dersimizde geçen ders indirdiğimiz airbnb verilerini kullanacağız.

#ilk önce dizindeki dosyaları görelim
list.files()
list.files("Desktop")

#şimdi veri setimi çekelim
df <- read.csv('/Users/muhammettahaadiyaman/Desktop/CSV__singapore.csv', header = TRUE, sep = ";", dec = ".")
View(df)
#şimdi veri setimi çektik.

#şimdi istatistik hesaplamalarına geçelim değişken üzerinde
#hemen numeric değişken olan price değişkenini seçelim

#price değişkeni üzerinde ortalama tutarı hesaplayalım
mean(df$price)
#değişken üzerinde bir hesap yapacağımızda ilk önce veri setini daha sonra $ ile değişkeni seçmeliyiz.
#gördüğümüz üzere bize NA sonucunu verdi.
#aslında bunun anlamı şu bu değişken içinde NA elemanları bulunmaktadır diyor.
#bunu kesinleştirelim.

is.na(df$price)
#bu şekilde true false arasından seçmek gerçekten çok zor bunun yerine bir de index değelerinden seçmeye çalışalım
which(is.na(df$price))
#bu şekilde de NA değerlerinin kaçıcnı sütunda olduğunu görebiliriz.
#veya bu değişken için de NA var mı varsa TRUE yoksa False şeklinde soru da sordurabiliriz bunu da
any(is.na(df$price))
#görüldüğü üzere var diyor.

#O zaman biz na.rm parametresini kullanarak istatistiksel hesaplama yaparken NA olanları hesaplamaya katmamalıyız ki bir sonuca ulaşalım.
#ortalama
mean(df$price, na.rm=T)

#standart sapma
sd(df$price, na.rm=T)

#standart sapma değerimin 340 küsür olduğunu görüyorum. Dikkat ettiyseniz ortalam değerim 168 ama standart sapma değeri ortalamdan bir hayli büyük
#aslında bize burada şunu anlatmak istiyor; bu veri seti içindeki veriler oldukça geniş bir çerçevede yayılıyor, çok büyük değerlerde var çok küçük değerler de var demek istiyor.
#bundan dolayı çok fazla sapma meydana gelmiş.

#medyan bulma
median(df$price, na.rm=T)

#medyan değeri 124, hatırlarsa eğer median < ortalama olduğunda bizim verilerimiz sağa çarpık olduğunu belirtmiştik.
#sağa çarpık verilerimizin daha çok küçük değerlerde yoğunlaştığını gösteriyordu. Yani grafiğin sol tarafında yoğunlaştığını belirtiyordu.
#hemen bunu bir histogram grafiğini çizdirerek gösterebiliriz.

#histogram
hist(df$price)
#görüldüğü üzere 0 ile 10000 fiyat bandı söz konusu ama dikkatli olarak bakıldığında yoğunluk 0 ile 1000 arasında
#şimdi ben bu verimi biraz daha filtrelemek istiyorum.
#bunu da değişkeni filtreden geçirerek bakabiliriz.
hist(df$price[df$price < 1000])
#görüldüğü üzere bu sefer histogramımızda 0 ile 1000 olan değerleri elde ediyorum
#dikkat edersek verilerimiz sağa çarpık bir dağılım göstermektedir.
#çünkü median < ortalama
#bu şekilde daha keşfedici bir analiz yapmış oluyoruz aslında.

#varyans
var(df$price, na.rm = T)
#varyans aslında standart sapmanın karesi olduğu anlamına gelmektedir.

#minimum değer
min(df$price, na.rm = T)

#maksimum değer
max(df$price, na.rm = T)

#geçen dersimizde frekans değerlerini görmüştük
#peki bu veri setinde frekans değerlerini ne için hesaplayabiliriz.
#hangi değişken için hesaplayabiliriz bir bakalım
#örneğin room type değişkeni için frekans değerlerine bir bakalım.
table(df$room_type)
#aşağıda biraz daha karışık bir sonuç geldi.
#şimdi ilk satır eleman
#ikinci satır frekans
#üçüncü satır eleman
#dördüncü saıtr numeric olan frekans
#şimdi boş olan gözlem sayısı 21 kez tekrar etmiş
#110 değeri 1 tane tekrar etmiş
#294 değeri 1 kez tekrar etmiş
#ama benim için burada önemli olan değerler karakter olan ve onların altındaki değerler.
#yani entrie apt. private room shared room
#diğer numeric değerler aykırı anlamsız değerler istersem bunları çıkartabilirim

#şimdi biz çıkartma işlemini 
#data frame[-satır nu,] şeklinde silebiliyorduk

#şimdi burada 110 olan satırı bulalım kaçıncı indeks numarasındaymış.
which(df$room_type == '110')
#964.indis numarasına ait değermiş bunu çıkartalım.
df <- df[-964,]
#şimdi tekrar frekans bakalım
table(df$room_type)
#görüldüğü üzere 110 gitmiş.

#diğer kaldırma yöntemi ise ilk önce class kontrol edelim. eğer türü faktör olsaydı
levels(df$room_type)
#daha sonra boş olanları kaldırmak için
which(df$room_type == "")
#bu indis numaralarını kaldırmak için de
df <- df[-which(df$room_type == ""), ]
#şimdi tekrar frekans numarasına bakalım

table(df$room_type)
#görüldüğü üzere boş olanlar da gitti.

#şimdi çeyrekleri bulmak için de
quantile(df$price)
#aslında bunun yorumlanması şu şekilde 
#bu veri setinde verilerin 75% i 0-200 arasında kalan 25% lik veri ise 200-10000 arasındadır.

#bizim istatistikler hesaplamalar bu şekilde işimize yarıyor.
#analizimize başlamadan önce ilk önce verilerimizi tanımamız gerekiyor.
#verileri tanımamız için de bu tarz istatistikleri kullanmamız gerekiyor.

#*************************DATA FRAME DEĞİŞKEN TÜRLERİ DEĞİŞTİRME*************************************
#Şimdi tekrar airbnb veri setlerini kullanacağız.
getwd()
#verimizi çekelim ama önce dosyada neler var bir bakalım
list.files("/Users/muhammettahaadiyaman/Desktop")

df <- read.csv("/Users/muhammettahaadiyaman/Desktop/CSV__singapore.csv", header = T, sep = ";", dec = ".")
View(df)

#ilk öne bozalım name değişkenini faktöre çevirip yeniden charactere çevirelim.
df$name <- as.factor(df$name)
class(df$name)

#şimdi faktörü charactere çevirelim
df$name <- as.character(df$name)
class(df$name)

#hatalı kullanım
cv <- as.character(df['name'])
cv[1]

#doğru kullanım $ operatörsüz de seçip veri türü değişikliğine örnek
class(df[, c("name")])
as.factor(df[,c("name")])
df[,c("name")] <- as.factor(df[,c("name")])
class(df[, c("name")])

#şimdi bunu charactere çevirelim.
df[, c("name")] <- as.character(df[, c("name")])
class(df[,c("name")])

#Veri türünü değiştirmek için en güzel yol dolar operatörü ile değişken seçimi ya da virgüllü seçim.

#diğer örneğimize bakalım.
#id numeric olması gerek ama biz str ile bir bakalım hangi veri türünde kullanılmış.
str(df)
#veya
class(df$id)
#görüldüğü üzere id character olarak kullanılmış
#veriyi bozmamak adına id'yi hemen farklı değişkene kopyalayalım
id <- df$id
class(id)
id <- as.numeric(id)

#bize uyarı verdi dediki na değerleri içeriyor. bunu bir kontrol edelim.
#şimdi veri setimizde idnin veri türünü numerice çevirelim.
df$id <- as.numeric(df$id)
#şimdi sorulayalım na var mı diye
any(is.na(df$id))

#NOT: Faktör olan veri türünü direkt olarak numeric'e çevirmek yanlıştır.
#ilk önce faktör değişkeni karaktere çevir
#daha sonra karakter olan değişkeni numerice çevir
#eğer direkt çevirme işlemi yaparsan numeric değerler gözükse bile hatalı değerler olduğu gözükmektedir.

#diğer bir örneğimiz ise host_id
#ilk önce bakalım hangi veri türünde
str(df)
#şimdi karakter veri türünde olduğu için bunu numeric veya integer veri türüne dönüştürelim.
df$host_id <- as.integer(df$host_id)
#görüldüğü üzere yine bize bir NA değeri uyarısı veriyor.
#bir bakalım NA değeri var mı
any(is.na(df$host_id))
#görüldüğü üzere var.

#room type'da geçerli olmayan verileri silmek istersem nasıl yapmam gerek.
str(df)
#room type faktör olsaydı ilk önce karakter olarak çevirip daha sonra silme işlemi yapacaktık aksi takdirde sadece levellerin elemanlarını silebilirdik leveller silinmezdi.
table(df$room_type)
#şimdi burada boş olan, 110 olan ve table da gözüken tüm numeric değerlerin indislerini bulup daha sonra bunları satır olarak çıkartmam gerek.
#burada hepsini tek tek yapmak zor bunun için or operatörü ile bulacağız.
which(df$room_type == '' | df$room_type == '110' | df$room_type == '1200' |
        df$room_type == '294' | df$room_type == '299' | df$room_type == '31' |
        df$room_type == '40'| df$room_type == '50' | df$room_type == '60' |
        df$room_type == '74' | df$room_type == '75' | df$room_type == '750')
#şimdi bunu bir değişkene ataylım.

inds <- which(df$room_type == '' | df$room_type == '110' | df$room_type == '1200' |
                df$room_type == '294' | df$room_type == '299' | df$room_type == '31' |
                df$room_type == '40'| df$room_type == '50' | df$room_type == '60' |
                df$room_type == '74' | df$room_type == '75' | df$room_type == '750')

df <- df[-inds, ]
#şimdi room type değişkeninin frekansı tekrar bakalım
table(df$room_type)
#belirsiz veya işe yaramayan aykırı değerleri bu şekilde temizlemiş olduk.

#*************************APPLY FONKSIYON GRUPLARI İLE HESAPLAMALAR************************************
#Bu dersimizde apply() fonk. ne işe yarar bundan bahsedeceğiz.
#hatırlarsak geçen derslerimizde rowMeans() colMeans() fonk. kullanmıştık.
#bunlar satırlar bazında ortalama veya sütunlar bazında ortalama sağlıyordu. 
#Diğer fonk. yapabiliyorduk rowSum() veya colSum() gibi.
#aynı zamanda aggregate() fonk. görmüştük bizim değişkenimizi grupluyordu.
#grupladıkları verilere göre FUN parametresidne belirttiğimiz bizim söyledğimiz işlemleri yerine getiriyordu.

#biz yukarıdaki satır veya sütun bazlı işlemleri apply fonk. ile yapmak daha kullanışlı
#apply() fonk. bir margin değeri veriyoruz.
#margin değeri aslında bizim neye göre hesaplayacağımızı belirttiğimiz yer olarak tanımlayabilriz.
#eğer margin = 1 olursa satır bazında, margin=2 olursa sütun bazında hesaplama olarak belirlenmektedir.
#burada da numeric olan satırları baz almamız gerek. Karakter olan verilerde sum, mean gibi işlemler yapılamıyor tek frekans işlemleri yapılabilir.
#KURAL: apply(değişken belirtme, margin = 1|2, FUN = sum/mean vs.)

#satırlar bazında ilk 4 değişken numeric olduğu için ortalamlarını alalım.
#iris veri setini kullanalım
apply(iris[1:4], MARGIN = 1, FUN = mean)
#gördüğümüz üzere satırlar bazında numeric olan değişkenlerin ortalamasını bize verdi.

#şimdi doğrumu verdi diye bir sağlamasını yapalım.
mean(as.numeric(iris[1 , 1:4]))
#ortalama ilk satır ve ilk dört değişkenin ortalaması 2.55 çıktı yukarıda apply fonk. sonucunda da ilk 2.550 çıktı yani doğru sonuca ulaşmıştır.

#şimdi apply() fonk. kullanarak standart sapma hesaplayalım.
apply(iris[1:4], MARGIN = 1, FUN = sd)

#şimdi satırlar bazında toplama yapalım
apply(iris[1:4], MARGIN = 1, FUN = sum)

#şimdi sütunlar bazında toplama yapalım, sütunlar bazında ise MARGIN=2 olmalıdır.
apply(iris[1:4], MARGIN = 2, FUN = sum)

#sütunlar bazında standart sapma bulalım
apply(iris[1:4], MARGIN = 2, FUN = sd)

#sütunlar bazında maksimum ve minimum değerlerini bulduralım
apply(iris[1:4], MARGIN = 2, FUN = min)
apply(iris[1:4], MARGIN = 2, FUN = max)


#şimdi apply ile birlikte gelen lapply fonk. bulunmaktadır.
#lapply fonk. aslında listelerde çalışmakta ama iris'de de deneyelim.
#KURAL: lapply(veri seti, FUN=fonksiyon)
lapply(iris, FUN = mean)
#görüldüğü üzere lapply() fonk. ile yaptığımızda bize sütun bazında ortalama sonuçlarını listeler halinde belirtti.

#peki apply() fonk. ile lapply() fonk. arasındaki fark nedir ?
#dikkat ederseniz lapply() fonk. margin parametresi kullanmıyorum. 
#lapply() fonk. içine ben herhangi bir dataframe eklersem, lapply data framein her bir değişkeni(sütun) üzerinde işlem yapıyor.
#örneğin sepal.length sütunu, sepal.width değişkenlerini ayrı ayrı şekilde hesaplamış
#lapply() fonk. ile satırlar bazında işlem yapamıyorum.
#lapply() fonk. genellikle listelerde kullanmam gerekiyor.
#buna bir örnek yapalım
l <- list('A' = c(12,32,23,65,76,89),
          'B' = c(32,44,56,8,8,67,2,12,12,36),
          'C' = c(45,23,67,23))
l

#şimdi ben bu listeme bir fonk. uygulamak istiyorum ve bu fonk.da lapply() ile uygulayacağım ki bütün listemin elemnalarını uygulansın.
#her sütunun ortalamasını alalım.
lapply(l, FUN = sum)
#her sütunun standart sapması
lapply(l, FUN = sd)
#her sütundaki maksimum eleman
lapply(l, FUN = max)

#gibi işlemler yapılır.
#NOT: lapply() fonk. listeler üzerinde kullanmamız gerek.
#eğer data frame üzerinde kullanırsak sütunlar bazına göre işlem yapar.
#apply() fonk. kullanırken eğer sayısal bir fonk. kullanıyorsam verilerimin de sayısal olması gerekmektedir.
#eğer değişkende herhangi bir NA değeri varsa onları işleme katmadan yine na.rm parametresi kullanabilirz.
apply(iris[1:4], MARGIN = 2, FUN = min, na.rm=T)

#*************************WİTH() FONK. DATA FRAME İLE KULLANIMI************************************
#şimdi biz data frameler üzerine çalışıyorduk.
#data framelerde belirli değişkenleri seçip bu değişkenler üzerine işlemler yapıyorduk
#ne gibi işlemler yapıyorduk istatistiksel işlemler yapabiliyorduk, değişkenlerin boyutları, frekans değerleri, min max değelerini buluyorduk.
#peki değişken seçerken nasıl yapıyorduk ? $ işareti veya köşeli parantez kullanımı yapıyorduk.
#şimdi bunu df data seti üzerinden örnek verelim
#ilk önce değişken isimlerine bir bakalım.
names(df)

#şimdi ben bu değişkenlerden birini seçmek istersem ne yapıyordum ?
df$id
#bana id değişkeninde yer alan bütün değerleri veriyordu.
df["id"]
#bu şekilde de seçimler yapabiliyorduk.
 
#bu şekilde kullanabiliyorduk fakat biz de çok fazla değişken var ve çok fazla kod yazdık.
#biz bu dolar operatörü ile seçimler yapmak istemiyoruz veya köşeli parantez kullanmak istemiyoruz.
#id yazınca id elemanlarının gelmesini istiyorum
#bunun için ayrıştıma fonk olan attach() fonk. kullanmamız gerekir.
#attach() fonk. görevi bizim data frame içinde yer alan sütunlari veya değişkenleri vektör olarak dışarı çıkartmaya yarayan bir fonk.
#yani hem data frame için de hem de dışında oluyor diyebiliriz.

#şimdi df içinde yer alan değişkenelri dışarı alalım
attach(df)
#önceden df$id şeklinde yazarken şimdi
id
#şeklinde veya
host_id
host_name
#şeklinde yazmamız yeterli yani $ işareti kullanmıyoruz.

#Şimdi bu kullanımın dezavantajı nedir ?
#eğer ben çok fazla kod yazdım ve çok fazla vektör oluşturduysam
#isimler birbiri ile çakışabilir.
#örneğin bir data frame içinde name adında bir değişken var diğer data framelerde de name adında dosya var çakışma durumu yaşanabilir. karışabilir.
#eğer tek bir data frame üzerinde çalışma gerçekleştiriyorsak attach() bize avantaj sağlayacakıtr.

#artık ben $ ile seçmek eski yönteme dönmek istiyorum bunun için de detach() fonk. kullanmam gerek
#hemen uygulayalım.
detach(df)
#şimdi id yazalım gelecek mi
host_id
#hata verdi şimdi eski yöntem ile seçelim
df$host_id
#görüldüğü üzere başarılı şekilde değerleri getirdi.

#şimdi attach() ve detach() noktasında bir kural var kaç tane attach() kullandıysan o kadar detach() yapman gerek.

#şimdi ne demiştik eğer çok fazla veri seti varsa değişken isimleri birbiri ile karışabiliyor.
#diyelim biz attach etmek istiyoruz.
#bunun için de with() fonk. kullanmamız gerek.
#her bir data frame için with fonk. kullanabilriz.

#with fonk. görevi ilk parametresi veri setini alıyor, ikinci paramteresi ise seçilen veri seti ile ne yapmak istiyorsun
#örneğin df$ operatörü kullanmadan hostname'i with ile yazdıralım
with(df, print(host_name))
#görüldüğü üzere yazdırdı. halbuki burada df kullanmadım.
#o zaman with fonk. df içinde yer alan bütün değişkenleri attach eder. dışarı çıkartır ben de bunları kendi isimleri ile kullanabilirim.

#peki ben host_name yanında host_id de bastırmak isityorum bunun için ne yapmam gerek
#eğer bir den fazla değer ile işlem yapılacaksa kıvırcık parantez kullanammız gerek.
with(df, {
    x <- mean(price)
    y <- x-5
    print(y)
})
#ilk önce df fonk. price değişkeninin ortalamsını x e atadık
#daha sonra ortalamdan 5 çıkarıp bunu y ye atadık
#y yi ekrana bastırdık.
#eğer price içinde bazı NA değerleri varsa
with(df, {
  x <- mean(price, na.rm=T)
  y <- x-5
  print(y)
})

#dışarıda price yazdığımızda
price
#hata verecek bu sadece with fonk. içinde çalışır.
