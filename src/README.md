# 💻 Kaynak Kodlar Klasörü (Root `/src/`)

Bu klasör, projenizin **tüm kaynak kodlarını** içerir. AI agent'lar (Backend Developer, Frontend Developer, Mobile Developer, vb.) sprint execution sırasında bu klasöre kod yazarlar.

---

## 🎯 Bu Klasörün Amacı

Bu klasör, projenizin **production-ready kaynak kodlarını** içerir:

- ✅ **Backend kodları** (API, servisler, business logic)
- ✅ **Frontend kodları** (Web arayüzü, component'ler, sayfalar)
- ✅ **Mobile kodları** (React Native, iOS, Android)
- ✅ **Test kodları** (Unit testler, integration testler)
- ✅ **Infrastructure kodları** (Docker, Kubernetes, CI/CD)
- ✅ **Design dosyaları** (Design tokens, component specs)

**ÖNEMLİ:** Bu klasör, `ai-factory/` klasöründen **ayrıdır**. Tüm kaynak kodlar root dizindeki `/src/` klasörüne yazılır.

---

## 📁 Klasör Yapısı

### Backend Kodları (`src/api/`)

Backend kodları Clean Architecture prensiplerine göre organize edilir:

```
src/api/
├── {Project_Name}.sln                    # .NET Solution dosyası (eğer .NET kullanılıyorsa)
├── {Project_Name}.Domain/                 # Domain Layer (Entities, Value Objects, Domain Events)
│   ├── Entities/
│   ├── ValueObjects/
│   ├── DomainEvents/
│   └── {Project_Name}.Domain.csproj
├── {Project_Name}.Application/            # Application Layer (Use Cases, DTOs, Interfaces)
│   ├── Features/
│   ├── DTOs/
│   ├── Interfaces/
│   └── {Project_Name}.Application.csproj
├── {Project_Name}.Infrastructure/         # Infrastructure Layer (External services, Email, etc.)
│   ├── Services/
│   ├── Security/
│   └── {Project_Name}.Infrastructure.csproj
├── {Project_Name}.Persistence/             # Persistence Layer (EF Core, Repositories, Migrations)
│   ├── Repositories/
│   ├── Migrations/
│   └── {Project_Name}.Persistence.csproj
└── {Project_Name}.API/                    # API Layer (Controllers, Minimal APIs, Middleware)
    ├── Controllers/
    ├── Middleware/
    └── {Project_Name}.API.csproj
```

**Örnek:**
- `src/api/BankApp.Domain/Entities/User.cs`
- `src/api/BankApp.Application/Features/Users/CreateUser.cs`
- `src/api/BankApp.API/Controllers/UsersController.cs`

### Frontend Kodları (`src/web/`)

Web arayüzü kodları framework'e göre organize edilir:

```
src/web/
├── components/                            # React/Angular/Vue component'leri
├── pages/                                 # Sayfalar (veya views/)
├── services/                              # API servisleri
├── utils/                                 # Yardımcı fonksiyonlar
├── styles/                                # CSS/SCSS dosyaları
├── assets/                                # Statik dosyalar (resimler, fontlar)
├── __tests__/                             # Test dosyaları
└── design/                                 # Design tokens ve component specs
```

**Framework-Specific Yapılar:**

**React:**
- `src/web/components/Login.tsx`
- `src/web/pages/HomePage.tsx`
- `src/web/services/api.ts`

**Angular:**
- `src/web/src/app/components/login/login.component.ts`
- `src/web/src/app/services/api.service.ts`

**Vue:**
- `src/web/components/Login.vue`
- `src/web/pages/HomePage.vue`

### Mobile Kodları (`src/mobile/`)

Mobile kodları platform'a göre organize edilir:

```
src/mobile/
├── screens/                               # React Native ekranları (cross-platform)
├── components/                            # React Native component'leri (cross-platform)
├── services/                              # API servisleri
├── navigation/                            # Navigation yapılandırması
├── __tests__/                             # Test dosyaları
├── ios/                                   # iOS-specific kodlar
│   └── {ProjectName}/
│       ├── Modules/
│       └── Info.plist
└── android/                               # Android-specific kodlar
    └── app/src/main/
        ├── java/com/{projectname}/
        └── AndroidManifest.xml
```

**Örnek:**
- `src/mobile/screens/LoginScreen.tsx` (React Native)
- `src/mobile/ios/BankApp/Modules/BiometricModule.swift` (iOS native)
- `src/mobile/android/app/src/main/java/com/bankapp/modules/BiometricModule.kt` (Android native)

### Test Kodları

Test kodları ilgili klasörlerin içinde veya ayrı test klasörlerinde:

```
src/api/
└── {Project_Name}.Domain.Tests/           # Domain layer testleri
    └── Entities/UserTests.cs

src/web/
└── __tests__/                              # Frontend testleri
    └── components/Login.test.tsx

src/mobile/
└── __tests__/                              # Mobile testleri
    └── screens/LoginScreen.test.tsx
```

### Infrastructure Kodları

DevOps ve infrastructure kodları:

```
src/api/
└── {Project_Name}.Infrastructure/
    ├── docker-compose.yml
    ├── Dockerfile
    ├── .github/workflows/                 # GitHub Actions
    ├── .gitlab-ci.yml                     # GitLab CI
    └── deploy/                            # Deployment scripts
```

### Design Dosyaları

Design specifications ve tokens:

```
src/web/design/                            # Web design specs
├── tokens/
│   ├── colors.json
│   └── typography.json
└── components/
    └── Button.spec.md

src/mobile/design/                         # Mobile design specs
├── tokens/
└── components/
```

---

## 🔧 AI Agent'lar ve Kod Yazma

### Hangi Agent Ne Yazar?

| Agent | Yazdığı Kodlar | Klasör |
|-------|---------------|--------|
| **Backend Developer** | API, servisler, business logic | `src/api/` |
| **Frontend Developer** | Web component'leri, sayfalar | `src/web/` |
| **React Native Developer** | Cross-platform mobile kodlar | `src/mobile/` |
| **iOS Developer** | iOS native kodlar | `src/mobile/ios/` |
| **Android Developer** | Android native kodlar | `src/mobile/android/` |
| **Database Agent** | Migrations, seed scripts | `src/api/{Project}.Persistence/` |
| **Test Dev Agent** | Test kodları | `src/api/{Project}.Tests/`, `src/web/__tests__/` |
| **OPS Agent** | Docker, Kubernetes, CI/CD | `src/api/{Project}.Infrastructure/` |
| **Security Agent** | Security middleware, services | `src/api/{Project}.Infrastructure/Security/` |
| **Designer Agent** | Design tokens, component specs | `src/web/design/`, `src/mobile/design/` |

### Kod Yazma Süreci

1. **Sprint Başlatıldığında:**
   - Product Agent, gereksinimleri analiz eder
   - Architect Agent, mimariyi tanımlar
   - Planner Agent, task'ları oluşturur

2. **Task Execution:**
   - Developer agent'lar, task'ları execute eder
   - Kodlar bu klasöre yazılır
   - Her task, belirli bir dosya veya dosya grubu oluşturur

3. **Code Review:**
   - Lead Dev Agent, kodları review eder
   - Gerekirse değişiklikler istenir

4. **Testing:**
   - Test Dev Agent, test kodları yazar
   - QA Agent, testleri çalıştırır

5. **Documentation:**
   - Docs Agent, kod dokümantasyonu oluşturur

---

## 📋 Önemli Notlar

### ✅ Yapılması Gerekenler

1. **Kod Yapısına Uyun:**
   - Agent'lar belirli bir klasör yapısına göre kod yazar
   - Bu yapıyı değiştirmeyin

2. **Clean Architecture:**
   - Backend kodları Clean Architecture prensiplerine göre organize edilir
   - Layer'lar arası dependency kurallarına uyun

3. **Framework Standartları:**
   - Her framework için standart yapı kullanılır
   - Framework-specific best practice'ler uygulanır

### ❌ Yapılmaması Gerekenler

1. **Manuel Kod Değişikliği:**
   - Agent'ların yazdığı kodları manuel olarak değiştirmeyin
   - Değişiklik gerekiyorsa, task oluşturun veya review'da belirtin

2. **Klasör Yapısını Değiştirme:**
   - Agent'lar belirli bir klasör yapısı bekler
   - Bu yapıyı değiştirmeyin

3. **Doğrudan Kod Yazma:**
   - Kodları doğrudan buraya yazmayın
   - Task oluşturun ve agent'lara bırakın

---

## 🚀 Yeni Projeye Başlarken

### Temizlik

Yeni bir projeye başlarken, bu klasörü temizlemeniz gerekir:

1. **Eski Kodları Kaldırın:**
   - `src/api/` klasöründeki eski backend kodlarını silin
   - `src/web/` klasöründeki eski frontend kodlarını silin
   - `src/mobile/` klasöründeki eski mobile kodlarını silin

2. **Yedekleme (Opsiyonel):**
   - Eski projeyi yedeklemek istiyorsanız:
     - `backup-<old-project-name>-<date>/` klasörü oluşturun
     - `src/` klasörünü buraya taşıyın

3. **Yeni Proje:**
   - Agent'lar yeni proje için klasör yapısını otomatik oluşturur
   - Sadece temiz bir `src/` klasörü bırakın

**Detaylı rehber:** `ai-factory/ai/protocols/new_project_initialization.md`

---

## 📚 İlgili Dokümanlar

- **Hızlı Başlangıç:** `ai-factory/guides/QUICK_START.md`
- **Yeni Proje Başlatma:** `ai-factory/ai/protocols/new_project_initialization.md`
- **Task Format:** `ai-factory/ai/protocols/task_format.md`
- **Backend Developer:** `ai-factory/ai/agents/backend.md`
- **Frontend Developer:** `ai-factory/ai/agents/frontend.md`

---

## ❓ Sık Sorulan Sorular

### Q: Kodları manuel olarak yazabilir miyim?
**A:** Önerilmez. Agent'lar task'lara göre kod yazar. Manuel değişiklikler task'ların tamamlanmasını engelleyebilir.

### Q: Klasör yapısını değiştirebilir miyim?
**A:** Hayır. Agent'lar belirli bir klasör yapısı bekler. Yapıyı değiştirmek agent'ların çalışmasını engelleyebilir.

### Q: Test kodları nereye yazılır?
**A:** Test kodları ilgili klasörlerin içinde (`__tests__/` veya `.Tests/`) veya ayrı test klasörlerinde.

### Q: Design dosyaları nereye konur?
**A:** Design tokens ve component specs `src/web/design/` veya `src/mobile/design/` klasörlerine konur.

### Q: Eski projeyi nasıl yedeklerim?
**A:** `backup-<old-project-name>-<date>/` klasörü oluşturup `src/` klasörünü oraya taşıyın.

---

## 🎯 Özet

**Bu klasör, projenizin kaynak kodlarının evidir.** AI agent'lar, sprint execution sırasında bu klasöre kod yazarlar. 

**Unutmayın:**
- ✅ Agent'lar otomatik olarak kod yazar
- ✅ Belirli bir klasör yapısı kullanılır
- ✅ Clean Architecture prensiplerine uyulur
- ✅ Yeni projeye başlarken temizleyin
- ❌ Manuel kod değişikliği yapmayın
- ❌ Klasör yapısını değiştirmeyin

**Agent'lar hazır olduğunda, kodlar buraya yazılacak! 🚀**
