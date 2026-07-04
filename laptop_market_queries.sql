Select
laptop_ID, 
laptop_data.Company, 
Company_Regions.Country, 
Product, 
TypeName, 
(Inches/10) As Ekran_Boyutu, 
ScreenResolution, 
Cpu, 
Ram, 
Disk_1, 
Coalesce(Disk_2, 'İkinci Disk Yok') As Disk_2_Durumu, 
Gpu, 
OpSys, 
(Weight/100) As Gercek_Agirlik, 
(Price_euros/100) As Yeni_Fiyat,
Case
    When (Price_euros/100) < 1000 Then 'Giriş Seviyesi'
    When (Price_euros/100) Between 1000 And 2000 Then 'Orta Segment'
    When (Price_euros/100) > 2000 Then 'Premium'
    Else 'Bilinmeyen Durum'
    End As Cihaz_Segmenti
From laptop_data
Join Company_Regions On laptop_data.Company= Company_Regions.Company;



Select 
Company, 
Product, 
(Price_euros/100) As Gercek_Fiyat, 
Ram, 
(Inches/10) As Ekran_Boyutu From laptop_data
Where Company= 'Apple' And Ram= 16
Order By Gercek_Fiyat Desc;
select Company, Count(Company) As Uretim_Sayisi From laptop_data
Group By Company 
Order By Uretim_Sayisi Desc;
