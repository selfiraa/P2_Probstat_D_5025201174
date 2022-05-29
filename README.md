# P2_Probstat_D_5025201174

Nama: Selfira Ayu Sheehan  
NRP: 5025201174  
Kelas: Probabilitas dan Statistik D

# Praktikum 2 - Estimasi Parameter, Uji Hipotesis, dan ANOVA

1. Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas 𝐴  
   ![image](https://user-images.githubusercontent.com/80016547/170871467-e6c2c36c-0f1b-43d7-b5bd-614b98870cc7.png)  
Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen dari responden ke-3 ketika belum melakukan aktivitas 𝐴 sebanyak 67, dan setelah melakukan aktivitas 𝐴 sebanyak 70.  
  a. Carilah standar deviasi dari data selisih pasangan pengamatan tabel di atas  

   ```
   x <- c(78,75,67,77,70,72,78,74,77)
   y <- c(100,95,70,90,90,90,89,90,100)
   
   sel <- y - x
   sd(sel, na.rm = FALSE)
   ```
   Hasil:  
   ![image](https://user-images.githubusercontent.com/80016547/170873028-178723c8-7bae-459a-94ab-5ede87657813.png)

   
   b. Carilah nilai t (p-value)  
   
   ```
   t.test(y, x,  paired = TRUE)
   ```  
   Hasil:  
   ![image](https://user-images.githubusercontent.com/80016547/170871750-c97b956e-1c75-46b6-bb10-20cdf4168464.png)  
   
   c. Tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen, sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen, sebelum dan sesudah melakukan aktivitas 𝐴   
   
   ```
   qt(p = 0.025, df = 8, lower.tail = FALSE)
   ```
   Hasil:  
   ![image](https://user-images.githubusercontent.com/80016547/170873372-d1a9dec6-16c7-41b4-8520-259b05df7780.png)  

   
2. Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3900 kilometer  
   a. Apakah Anda setuju dengan klaim tersebut?  
   ```
   library(BSDA)
   zsum.test(mean.x=23500, sigma.x=3900, n.x=100, alternative="greater", mu=20000)
   ```
   Hasil:  
   ![image](https://user-images.githubusercontent.com/80016547/170872033-354a1bd5-efda-4950-856f-2926559accda.png)  
   
   Dapat dilihat bahwa rata-rata (μ) km bernilai 23500, maka klaim disetujui.  
   
   b. Jelaskan maksud dari output yang dihasilkan!  
   ```
   Berdasarkan output yang dihasilkan, dengan keyakinan 95% H0 ditolak/terdapat cukup bukti di mana rata-rata secara signifikan lebih besar dari 20000.
   ```   
   c. Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!  
   ```
   P-value yang dihasilkan sangat kecil sehingga H0 ditolak.
   ```

3. Diketahui perusahaan memiliki seorang data analyst ingin memecahkan permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya didapatkanlah data berikut dari perusahaan saham tersebut.  
  ![image](https://user-images.githubusercontent.com/80016547/170872344-142741d0-f3d3-4e2e-98c0-1266ae4f9998.png)  
Dari data diatas berilah keputusan serta kesimpulan yang didapatkan dari hasil diatas. Asumsikan nilai variancenya sama, apakah ada perbedaan pada rata-ratanya (α= 0.05)? Buatlah:  
   a. H0 dan H1  
   ```
   H0: μ Bali = μ Bandung
   H1: μ Bali ≠ μ Bandung
   ```
   
   b. Hitung Sampel Statistik   

   ```
   library(BSDA)
   tsum.test(mean.x = 3.64, s.x = 1.67, n.x = 19, mean.y = 2.79, s.y = 1.32, n.y = 27, conf.level = 0.95)
   ```
   Hasil:  
   ![image](https://user-images.githubusercontent.com/80016547/170872574-81e95ecf-7583-4a82-8993-102b914b1784.png)  

   
   c. Lakukan Uji Statistik (df =2)  
   ```
   sp2 <- (((27 - 1)*(1.32)^2) + ((19 - 1)*(1.67)^2))/(27 + 19 - 2)
   sp <- sqrt(sp2)
   x2 <- (1/27) + (1/19)
   x <- sqrt(x2)
   t <- (2.79 - 3.64)/(sp*x)
   ```  
   Hasil:  
   ![image](https://user-images.githubusercontent.com/80016547/170872679-3ffe6673-e553-4dbe-ac5a-c145aff89b52.png)  

   d. Nilai Kritikal   
   ```
   qt(p = 0.025, df = 2, lower.tail = FALSE)
   ```
   Hasil:  
   ![image](https://user-images.githubusercontent.com/80016547/170872907-d2d5deca-6da3-4755-8218-0cfe725ca4c9.png)  

   e. Keputusan   
   ```
   Hasil uji terletak di interval nilai kritikal, maka H0 tidak ditolak/sample tidak memiliki cukup bukti yang bertentangan dengan H0.
   ```  
   f. Kesimpulan
   ```
   Berdasarkan hasil pengujian, diyakini 95% bahwa rata-rata saham di Bali dan di Bandung adalah sama.
   ```  
   
4. Seorang Peneliti sedang meneliti spesies dari kucing di ITS . Dalam penelitiannya ia mengumpulkan data tiga spesies kucing yaitu kucing oren, kucing hitam dan kucing putih dengan panjangnya masing-masing. Jika:  
Diketahui dataset https://intip.in/datasetprobstat1
H0: Tidak ada perbedaan panjang antara ketiga spesies atau rata-rata panjangnya sama  
Maka kerjakan atau carilah:  
   a. Buatlah masing masing jenis spesies menjadi 3 subjek "Grup" (grup 1, grup 2, grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians.  
   ```
   df4 <- read.delim("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt")
   library(ggpubr)
   ggboxplot(df4, x = "Group", y = "Length", color = "Group", ylab = "Length", xlab = "Group")
   ```
   Hasil:  
   ![image](https://user-images.githubusercontent.com/80016547/170873605-aae0c544-563e-4249-9c7d-15c2c55997be.png)  

   
   b. Carilah atau periksalah Homogeneity of variances nya; Berapa nilai p yang
didapatkan? Apa hipotesis dan kesimpulan yang dapat diambil?  
   ```
   library(onewaytests)
   bartlett.test(Length ~ Group, data = df4)
   ```
   Hasil:  
   ![image](https://user-images.githubusercontent.com/80016547/170873728-cbf01633-addd-4795-8837-56698646b87f.png)  

   
   c. Untuk uji ANOVA (satu arah), buatlah model linier dengan panjang versus grup dan beri nama model tersebut model 1!  
   ```
   Model1 <- lm(formula = Group ~ Length, data = df4)
   print(Model1)
   ```
   Hasil:  
   ![image](https://user-images.githubusercontent.com/80016547/170873910-44225dc1-031f-448d-8c9e-672c7b1ab2cf.png)  

   d. Dari Hasil Poin C, berapakah nilai-p? Apa yang dapat Anda simpulkan dari H0?
  
   ```
   summary(Model1)$coefficients[2,4]
   ```
   Hasil:  
   ![image](https://user-images.githubusercontent.com/80016547/170874048-fba039e5-df4c-476c-9f89-eb22257b58d0.png)
  
   e. Verifikasilah jawaban model 1 dengan Post-hoc test Tukey HSD, dari nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain?  

   f. Visualisasikan data dengan ggplot2  
   
5. Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan dilakukan sebanyak 27 kali dan didapat data sebagai berikut: Data Hasil Eksperimen. Dengan data tersebut:  
   a. Buatlah plot sederhana untuk visualisasi data  
   ```
   library(readr)
   library(ggplot2)
   library(multcompView)
   library(dplyr)
   GTL <- read_csv("https://drive.google.com/u/0/uc?id=1aLUOdw_LVJq6VQrQEkuQhZ8FW43FemTJ&export=download")
   head(GTL)
   str(GTL)
   qplot(x = Temp, y = Light, geom = "point", data = GTL) + facet_grid(.~Glass, labeller = label_both)
   ```
   Hasil:  
   ![image](https://user-images.githubusercontent.com/80016547/170874349-d3321306-c10a-431e-9e99-0ad206cdccf8.png)  
   ![image](https://user-images.githubusercontent.com/80016547/170874375-cb4ac645-686b-47a6-b839-7bc81dfb1262.png)  

   b. Lakukan uji ANOVA dua arah!  
   ```
   GTL$Glass <- as.factor(GTL$Glass)
   GTL$Temp_Factor <- as.factor(GTL$Temp)
   str(GTL)
   ```
   Hasil:  
   ![image](https://user-images.githubusercontent.com/80016547/170874481-62bd1f30-cd22-41e6-b6ce-44340bc9746e.png)  
   
   c.  Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)  
   
   ```
   data_summary <- group_by(GTL, Glass, Temp) %>% summarise(mean=mean(Light), sd=sd(Light)) %>% arrange(desc(mean))
   print(data_summary)
   ```
   Hasil:  
   ![image](https://user-images.githubusercontent.com/80016547/170874723-c57e3196-cd9d-4010-ae80-fac6dfa11e51.png)  
   
   d. Lakukan uji Tukey    
   ```
   tukey <- TukeyHSD(anova)
   print(tukey)
   ```
   Hasil:  
   ![image](https://user-images.githubusercontent.com/80016547/170874852-d9282ac9-0f93-4e5a-b1ed-36f38dcfd673.png)  
   
   e.  Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey  
   ```
   tukey.cld <- multcompLetters4(anova, tukey)
   print(tukey.cld)
   cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
   data_summary$Tukey <- cld$Letters
   print(data_summary)
   ```
   Hasil:  
   ![image](https://user-images.githubusercontent.com/80016547/170874909-e04bbf41-a9b2-477b-bbaa-84637ed3dcd8.png)
