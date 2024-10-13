# ShippingOrder Project

## Projenin Kurulumu

Bu proje, .NET Core ile geliştirilmiş bir API uygulamasıdır ve Entity Framework Core kullanmaktadır. Projeyi çalıştırabilmek için aşağıdaki adımları takip ediniz:

### 1. Gereksinimler

Projeyi çalıştırmadan önce aşağıdaki yazılımların sisteminizde kurulu olduğundan emin olun:

- .NET Core SDK (6.0 veya daha üstü)
- SQL Server
- Visual Studio 2022 veya herhangi bir IDE

### 2. Veritabanı Kurulumu

Projede kullanılan veritabanı script'i `DatabaseScripts/script.sql` dosyasında mevcuttur. Veritabanını oluşturmak için aşağıdaki adımları takip edebilirsiniz:

1. SQL Server Management Studio'yu (SSMS) açın.
2. Yeni bir veritabanı oluşturun.
3. `DatabaseScripts/script.sql` dosyasını çalıştırarak tabloları oluşturun.

### 3. Uygulama Ayarları (appsettings.json)

Projede hassas verileri (veritabanı bağlantı dizesi gibi) saklamak için `appsettings.json` dosyası içeriği boştur. Aşağıdaki örnek yapılandırma ile `appsettings.json` dosyasını düzenleyebilirsiniz:

```json
{
  "ConnectionStrings": {
    "SqlServer": "Data Source=YOUR_SERVER;Initial Catalog=YOUR_DATABASE;Integrated Security=True;Connect Timeout=30;Encrypt=True;Trust Server Certificate=True;Application Intent=ReadWrite;Multi Subnet Failover=False"
  },
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft.AspNetCore": "Warning"
    }
  },
  "AllowedHosts": "*"
}
```

### 4. Veritabanı Güncelleme

Veritabanı işlemlerini yapmak ve migration'ları uygulamak için şu adımları izleyin:

1. **Package Manager Console'u** açın (Visual Studio'da **Tools > NuGet Package Manager > Package Manager Console** menüsünden ulaşabilirsiniz).
2. **Default project** olarak `ShippingOrderProject.Infrastructure` projesini seçin.
3. Aşağıdaki komutu terminale yazın:

   ```bash
   update-database

### 5. Swagger Kullanımı
Projede Swagger entegre edilmiştir, böylece API'yi kolayca test edebilirsiniz. Uygulama çalıştırıldığında Swagger arayüzü otomatik olarak açılacaktır. API'nin tüm endpointlerini test etmek için aşağıdaki adrese tarayıcınızdan ulaşabilirsiniz:
- 🔗 **Swagger URL**: https://localhost:[port]/swagger/index.html

### 6. Hangfire Kullanımı
Projede ayrıca Hangfire ile bir arka plan job sistemi kuruludur. Hangfire Dashboard, arka plan job'larının durumlarını izleyebilmeniz ve yönetebilmeniz için kullanışlı bir arayüz sunar. Uygulama çalıştırıldığında Hangfire Dashboard'a aşağıdaki URL'den erişebilirsiniz:
- 🔗 **Hangfire Dashboard URL**: https://localhost[port]/hangfire

### 7. Proje Görüntüleri
![Imgur](https://i.imgur.com/gdEkvnr.png)
![Imgur](https://i.imgur.com/rZkpD5y.png)
![Imgur](https://i.imgur.com/OtPo0jb.png)
![Imgur](https://i.imgur.com/FjVGPww.png)
