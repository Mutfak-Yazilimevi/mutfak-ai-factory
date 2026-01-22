# Mutfak AI Factory: AI Destekli Yazılım Geliştirme Ekibinizi Otomatikleştirin

## Giriş: Yazılım Geliştirmede Yeni Bir Paradigma

Yazılım geliştirme süreçlerinde en büyük zorluklardan biri, farklı rollerdeki geliştiricilerin koordinasyonu ve görev dağılımıdır. "Kim ne yapacak?", "Ne zaman yapacak?", "Neyi bekleyecek?" gibi sorular, proje yönetiminin en zaman alıcı kısımlarından biridir.

**Mutfak AI Factory**, bu sorunları çözmek için tasarlanmış, AI destekli bir yazılım organizasyon sistemidir. Bu sistem, bir yazılım fikrini, kendi kendine işleyen bir AI yazılım ekibine dönüştürür.

### Sistemin Temel Felsefesi

Mutfak AI Factory, şu temel prensipler üzerine kurulmuştur:

1. **Dosya Tabanlı İletişim**: Agent'lar birbirleriyle doğrudan konuşmaz, dosyalar üzerinden iletişim kurar. Bu sayede tüm süreç şeffaf, izlenebilir ve recoverable olur.

2. **Atomik Task'lar**: Her task, tek bir sorumluluğa sahiptir ve bağımsız olarak test edilebilir. Bu sayede paralel çalışma ve hızlı geliştirme mümkün olur.

3. **Dependency-Driven Execution**: Task'lar explicit dependency'lere sahiptir. Dependency Engine, task'ları otomatik olarak READY yapar ve execution sırasını yönetir.

4. **Teknoloji Odaklılık**: Vertical Agent Structure sayesinde her teknoloji için özel agent'lar vardır. Bu sayede teknoloji-spesifik best practice'ler uygulanır.

5. **Otonom Çalışma**: Orchestrator Agent, tüm süreci otomatik olarak yönetir. Manuel müdahale minimum seviyededir.

6. **Şeffaflık ve İzlenebilirlik**: Tüm süreç dosyalar ve log'lar üzerinden izlenebilir. Her adım kayıt altındadır.

---

## Mutfak AI Factory Nedir?

### Temel Tanım

Mutfak AI Factory, **AI agent'ları kullanarak yazılım geliştirme sürecini otomatikleştiren bir framework'tür**. Sistem, farklı rollerdeki AI agent'ları (Product Manager, Architect, Backend Developer, Frontend Developer, vb.) koordine ederek, bir sprint başlangıcından bitişine kadar tüm süreci yönetir.

### Sistemin Amacı

Sistemin temel amacı şudur: **Bir yazılım fikrini, "kim ne yapacak, ne zaman yapacak, neyi bekleyecek" sorularını sormaya gerek kalmadan, kendi kendine işleyen bir AI yazılım ekibine dönüştürmek.**

### Ne Değildir?

Mutfak AI Factory'nin ne olmadığını anlamak, sistemin gerçek değerini kavramak için kritiktir:

#### ❌ Kod Üretme Aracı Değildir
- Sistem, doğrudan kod üretmez. Agent'lar kod üretir.
- Mutfak AI Factory, agent'ların nasıl çalışacağını, nasıl koordine olacağını tanımlar.

#### ❌ Proje Yönetim Aracı Değildir
- Jira, Trello, Asana gibi proje yönetim araçlarının yerine geçmez.
- Sistem, AI agent'ları için bir organizasyon yapısı sağlar.

#### ❌ CI/CD Pipeline Değildir
- Otomatik deployment veya continuous integration sağlamaz.
- Ancak, OPS agent'ı ile CI/CD süreçlerini yönetebilir.

#### ❌ Kod Editörü Değildir
- Cursor IDE'nin kendisi değildir.
- Cursor IDE içinde çalışan bir organizasyon sistemidir.

#### ❌ Teknoloji Stack'i Değildir
- Belirli bir programlama dili veya framework'e bağlı değildir.
- Herhangi bir teknoloji stack'i ile çalışabilir.

#### ❌ Hazır Çözüm Değildir
- "Tıkla, çalıştır" tarzı bir araç değildir.
- Proje gereksinimlerine göre yapılandırılması gerekir.

---

## Sistem Mimarisi

### 1. Dosya Tabanlı İletişim: Sistemin Temel Felsefesi

Mutfak AI Factory'nin en önemli ve ayırt edici özelliği, **agent'ların birbirleriyle doğrudan konuşmamasıdır**. Tüm iletişim, dosyalar üzerinden gerçekleşir:

```
Agent A → Dosya Yaz → Agent B → Dosya Oku → İşlem Yap → Dosya Yaz → Agent C
```

**Neden Bu Yaklaşım?**

Geleneksel AI sistemlerinde agent'lar birbirleriyle doğrudan iletişim kurar. Bu yaklaşımın sorunları:
- İletişim geçici ve izlenemez
- Hata ayıklama zor
- Paralel çalışma karmaşık
- Versiyon kontrolü yok

Mutfak AI Factory, bu sorunları çözmek için **dosya tabanlı iletişim** modelini benimser. Bu modelin avantajları:

- **Şeffaflık**: Tüm iletişim dosyalarda kayıtlı, her zaman erişilebilir
- **Hata Ayıklama**: Her adım izlenebilir, sorunlar kolayca tespit edilir
- **Paralel Çalışma**: Agent'lar birbirini beklemeden dosyaları okuyup yazabilir
- **Versiyon Kontrolü**: Git ile tüm süreç takip edilebilir, geçmişe dönülebilir
- **Recovery**: Hata durumunda execution log'larından kaldığı yerden devam edilebilir
- **Audit Trail**: Tüm kararlar ve işlemler kayıt altında
- **Asenkron İletişim**: Agent'lar farklı zamanlarda çalışabilir, dosyalar aracılığıyla senkronize olur

### 2. Agent Rolleri ve Vertical Agent Structure

Sistem, **Vertical Agent Structure** kullanarak teknoloji-spesifik agent'ları destekler. Bu yapı sayesinde:

- **Teknoloji Odaklılık**: Her agent sadece kendi teknolojisine odaklanır
- **Paralel Çalışma**: Farklı teknolojiler aynı anda geliştirilebilir
- **Best Practices**: Teknoloji-spesifik best practice'ler uygulanır
- **Esneklik**: Proje ihtiyacına göre teknoloji seçimi yapılabilir

Sistem, farklı rollerdeki AI agent'ları içerir:

#### Planning Agents (Planlama Aşaması)
- **Product Agent**: Sprint başlatma, ürün gereksinimlerini belirleme
- **Architect Agent**: Teknik mimari kararları alma
- **Planner Agent**: Atomik task'ları oluşturma
- **Lead Dev Agent**: Plan review, dependency yönetimi

#### Production Agents (Geliştirme Aşaması)
- **Technology-Specific Backend Agents**: 
  - .NET Core Developer (C# / .NET Core)
  - Java Developer (Java / Spring Boot)
  - Python Developer (Python / Django / FastAPI)
  - Node.js Developer (Node.js / Express)
  - Go Developer (Go / Gin)
  - Rust Developer (Rust / Actix)
  - Legacy Backend Agent (backward compatibility - maps to .NET Core Developer)
- **Technology-Specific Frontend Agents**:
  - Angular Developer (Angular)
  - React Developer (React)
  - Vue Developer (Vue.js)
  - Next.js Developer (Next.js)
  - Svelte Developer (Svelte)
  - Legacy Frontend Agent (backward compatibility - maps to Angular Developer)
- **React Native Agent**: Mobil uygulama geliştirme
- **iOS Developer Agent**: iOS native geliştirme
- **Android Developer Agent**: Android native geliştirme
- **Database Agent**: Veritabanı şeması ve migration'lar
- **Designer Agent**: UI/UX tasarım
- **Test Dev Agent**: Test yazma
- **Security Agent**: Güvenlik kontrolleri
- **OPS Agent**: DevOps ve deployment
- **AI/ML Agent**: AI/ML modelleri ve analitik
- **Custom Agents**: Proje gereksinimlerine göre özel domain agent'ları (IoT, Blockchain, Game Dev, vb.)

#### Quality & Documentation Agents
- **QA Agent**: Acceptance criteria doğrulama
- **Docs Agent**: Dokümantasyon oluşturma

#### Orchestration Agent
- **Orchestrator Agent**: Tüm agent'ları koordine eden merkezi yönetici

### 3. Sprint Yapısı

Her sprint, kendi klasör yapısına sahiptir:

```
runs/
└── <SPRINT_ID>/
    ├── sprint.md              # Sprint hedefleri
    ├── product.md             # Ürün gereksinimleri
    ├── architecture.md        # Teknik mimari
    ├── api/
    │   └── contract.md        # API kontratı
    ├── tasks/
    │   ├── dotnet-core/       # .NET Core tasks (if BACKEND.DOTNET_CORE: ACTIVE)
    │   ├── java/              # Java tasks (if BACKEND.JAVA: ACTIVE)
    │   ├── python/            # Python tasks (if BACKEND.PYTHON: ACTIVE)
    │   ├── nodejs/            # Node.js tasks (if BACKEND.NODEJS: ACTIVE)
    │   ├── angular/           # Angular tasks (if FRONTEND.ANGULAR: ACTIVE)
    │   ├── react/             # React tasks (if FRONTEND.REACT: ACTIVE)
    │   ├── vue/               # Vue.js tasks (if FRONTEND.VUE: ACTIVE)
    │   ├── react-native/      # React Native tasks (if MOBILE.REACT_NATIVE: ACTIVE)
    │   ├── flutter/           # Flutter tasks (if MOBILE.FLUTTER: ACTIVE)
    │   ├── ios-developer/     # iOS native tasks (if IOS_DEVELOPER: ACTIVE)
    │   ├── android-developer/  # Android native tasks (if ANDROID_DEVELOPER: ACTIVE)
    │   ├── database/          # Database tasks (if DATABASE: ACTIVE)
    │   ├── designer/          # Design tasks (if DESIGNER: ACTIVE)
    │   ├── test-dev/          # Test tasks (if TEST_DEV: ACTIVE)
    │   ├── security/          # Security tasks (if SECURITY: ACTIVE)
    │   ├── ops/               # DevOps tasks (if OPS: ACTIVE)
    │   ├── ai-ml/             # AI/ML tasks (if AI_ML: ACTIVE)
    │   └── <custom-agent>/     # Custom agent tasks (if CUSTOM_AGENTS defined)
    ├── review.md              # Code review sonuçları
    ├── qa.md                  # QA sonuçları
    ├── dashboard.md           # Gerçek zamanlı dashboard
    ├── logs/                  # Agent execution logları
    └── docs/                  # Sprint dokümantasyonu
```

### 4. Task Yönetimi

Her task, ayrı bir markdown dosyasıdır:

```markdown
TASK_ID: DOTNET_CORE-001
TITLE: Create User Entity
ROLE: DOTNET_CORE_DEVELOPER
STATUS: TODO | IN_PROGRESS | DONE | BLOCKED

DEPENDENCIES:
- DATABASE-001

DESCRIPTION:
Create User domain entity with email and password fields using C# .NET Core.

OUTPUT:
- src/api/BankApp.Domain/Entities/User.cs

ACCEPTANCE_CRITERIA:
- User entity has Email property
- User entity has PasswordHash property
- Entity inherits from BaseEntity
- Follows .NET Core conventions
```

**Not:** Vertical Structure sayesinde, task'lar teknoloji-spesifik ROLE'lere sahiptir. Örneğin, `.NET Core` için `DOTNET_CORE_DEVELOPER`, `Java` için `JAVA_DEVELOPER`, `React` için `REACT_DEVELOPER` gibi.

### 5. Dependency Engine: Otomatik Bağımlılık Yönetimi

Sistem, task'lar arasındaki bağımlılıkları otomatik olarak yönetir. Bu, Mutfak AI Factory'nin en güçlü özelliklerinden biridir.

#### Task Status'leri ve Geçişler

Her task'ın 4 temel durumu vardır:
- **TODO**: Task henüz başlamadı
- **IN_PROGRESS**: Agent task üzerinde çalışıyor
- **DONE**: Task tamamlandı
- **BLOCKED**: Task bir sorun nedeniyle engellendi

#### READY Condition (Hazır Olma Durumu)

**READY**, bir status değil, bir **condition**'dır. Bir task READY olması için:
1. STATUS: TODO olmalı
2. Tüm dependency'ler STATUS: DONE olmalı
3. Hiçbir dependency BLOCKED, IN_PROGRESS veya TODO olmamalı

#### Dependency Engine Nasıl Çalışır?

1. **Otomatik Geçiş**: Bir task DONE olduğunda, Dependency Engine tüm task'ları tarar
2. **Dependency Kontrolü**: Her TODO task için dependency'leri kontrol eder
3. **READY Yapma**: Tüm dependency'ler DONE ise, task READY olur (ama STATUS hala TODO kalır)
4. **Agent Seçimi**: Agent'lar sadece READY task'ları seçer ve çalıştırır
5. **Status Güncelleme**: Agent task'ı seçtiğinde STATUS: TODO → IN_PROGRESS yapar

#### Circular Dependency Prevention

Sistem, circular dependency'leri otomatik olarak tespit eder:
- Task A → Task B → Task A (circular dependency)
- Bu durumda tüm task'lar BLOCKED olarak işaretlenir
- Lead Dev Agent, Planner Agent'a bildirir ve düzeltme ister

#### Örnek Senaryo

```
DATABASE-001: Create User Table (STATUS: DONE)
  ↓
BACKEND-001: Create User Entity (DEPENDENCIES: DATABASE-001)
  - Dependency DONE → READY
  - Agent seçer → STATUS: IN_PROGRESS
  - Tamamlanır → STATUS: DONE
  ↓
BACKEND-002: Create User Repository (DEPENDENCIES: BACKEND-001)
  - Dependency DONE → READY
  - Agent seçer → STATUS: IN_PROGRESS
```

#### Dependency Engine'in Yöneticisi

- **Lead Dev Agent**: Dependency Engine'i sürekli izler ve yönetir
- **Orchestrator Agent**: Otonom modda Dependency Engine'i otomatik yönetir

---

## Sistem Nasıl Çalışır?

### Senaryo 1: Yeni Bir Sprint Başlatma

#### Adım 1: Dokümanları Hazırlama
Müşteri (siz), proje dokümanlarınızı root `/docs/` klasörüne koyarsınız:
- `Architecture.md` (teknik mimari)
- `Database.md` (veritabanı şeması)
- `Lojikakis.md` (iş mantığı)
- Diğer analiz dokümanları

#### Adım 2: Product Agent'ı Çalıştırma
Product Agent:
1. Root `/docs/` klasöründeki tüm dosyaları okur (öncelikli)
2. `mutfak-ai-factory/docs/` klasöründeki dosyaları okur (varsa)
3. `project.scope.md` dosyasından sprint ID formatını öğrenir:
   - **SEQUENTIAL**: 001, 002, 003, ...
   - **PROJECT_PREFIXED**: {PROJECT_NAME}-001, {PROJECT_NAME}-002, ...
4. Mevcut sprint klasörlerini kontrol eder ve yeni SPRINT_ID oluşturur
5. Yeni sprint klasörünü oluşturur (`/runs/<SPRINT_ID>/`)
6. Sprint klasör yapısını oluşturur (tasks/, logs/, docs/, vb.)
7. `sprint.md` dosyasını oluşturur (root `/docs/` klasöründen bilgileri çıkararak)
8. `product.md` dosyasını oluşturur:
   - **CRITICAL:** İlk satır: `SPRINT_ID: <SPRINT_ID>` (diğer agent'lar bunu okur)
   - User problems, product goals, functional requirements
9. `mutfak-ai-factory/docs/` klasöründeki dosyaları oluşturur/günceller (vision.md, features.md, vb.)
10. Custom agent'ları tespit eder ve `project.scope.md`'ye ekler (eğer gerekirse)

#### Adım 3: Architect Agent'ı Çalıştırma
Architect Agent:
1. `product.md` dosyasını okur
2. Teknik mimari kararları alır
3. `architecture.md` ve `api/contract.md` dosyalarını oluşturur

#### Adım 4: Planner Agent'ı Çalıştırma
Planner Agent:
1. `product.md` ve `architecture.md` dosyalarını okur
2. `project.scope.md` dosyasından aktif teknolojileri okur (Vertical Structure)
3. Atomik task'ları oluşturur
4. Task'ları teknoloji-spesifik klasörlere dağıtır:
   - Backend: `tasks/dotnet-core/`, `tasks/java/`, `tasks/python/`, vb.
   - Frontend: `tasks/angular/`, `tasks/react/`, `tasks/vue/`, vb.
   - Mobile: `tasks/react-native/`, `tasks/flutter/`, vb.
5. Dependency'leri belirler

#### Adım 5: Lead Dev Agent (Plan Review)
Lead Dev Agent:
1. Task yapısını review eder
2. Dependency'leri doğrular
3. Scope sorunlarını tespit eder

#### Adım 6: Production Agents
Teknoloji-spesifik agent'lar (Vertical Structure) ve Custom Agent'lar:
1. Kendi teknoloji klasörlerindeki READY task'ları bulur:
   - Backend: `tasks/dotnet-core/`, `tasks/java/`, `tasks/python/`, vb.
   - Frontend: `tasks/angular/`, `tasks/react/`, `tasks/vue/`, vb.
   - Mobile: `tasks/react-native/`, `tasks/flutter/`, vb.
2. Task'ları execute eder (paralel çalışabilir)
3. Task'ları DONE olarak işaretler
4. COMPLETION bölümünü doldurur

**Not:** Vertical Structure sayesinde farklı teknolojiler paralel olarak geliştirilebilir. Örneğin, .NET Core ve Java backend'ler veya Angular ve React frontend'ler aynı anda çalışabilir. Custom Agent'lar (IoT, Blockchain, Game Dev, vb.) da aynı şekilde çalışır.

#### Adım 7: Code Review ve Dependency Engine
Lead Dev Agent (Execution Review):
1. DONE task'ları review eder
2. Code quality kontrolü yapar
3. **Review Sonuçları:**
   - **APPROVED**: Task onaylandı, bağımlı task'lar READY olur
   - **CHANGES_REQUIRED**: Task'ta değişiklik gerekli, STATUS: DONE → TODO yapılır
4. Dependency Engine'i yönetir:
   - DONE task'ları tespit eder
   - Bağımlı task'ları READY yapar
   - Circular dependency'leri kontrol eder
   - Süreci sürekli izler

#### Adım 8: QA Agent (Quality Assurance)
QA Agent:
1. Tüm task'ların acceptance criteria'larını doğrular
2. Sprint hedeflerini kontrol eder
3. Test sonuçlarını değerlendirir
4. `qa.md` dosyasını oluşturur:
   - STATUS: PASSED veya FAILED
   - Blocker'ları listeler
   - Önerileri sunar
5. Eğer FAILED ise, fix task'ları oluşturulur

#### Adım 9: Docs Agent (Documentation)
Docs Agent:
1. Sprint dokümantasyonunu oluşturur:
   - `docs/overview.md`: Sprint genel bakış
   - `docs/api.md`: API dokümantasyonu (eğer API varsa)
   - `docs/database.md`: Veritabanı dokümantasyonu (eğer database varsa)
   - `docs/frontend.md`: Frontend dokümantasyonu (eğer frontend varsa)
   - `docs/mobile.md`: Mobile dokümantasyonu (eğer mobile varsa)
   - `docs/security.md`: Güvenlik dokümantasyonu (eğer security varsa)
2. `sprint_report.md` dosyasını oluşturur:
   - Sprint özeti
   - Tamamlanan task'lar
   - Metrikler ve istatistikler
   - Sonraki sprint önerileri

### Senaryo 2: Orchestrator Agent ile Tam Otonom Çalışma

Orchestrator Agent, tüm bu süreci otomatik olarak yönetir:

```markdown
Read mutfak-ai-factory/ai/agents/orchestrator.md and execute.
Start orchestration for a new sprint.
```

Orchestrator Agent:
1. **Planning Mode**: Product → Architect → Planner → Lead Dev (Plan Review)
2. **Execution Mode**: 
   - Production agent'ları otomatik olarak çalıştırır
   - READY task'ları tespit eder ve uygun agent'lara atar
   - Paralel çalışmayı yönetir (farklı ROLE'ler aynı anda çalışabilir)
   - Dependency engine'i sürekli izler ve yönetir
   - Code review'ları takip eder
3. **Quality Mode**: QA Agent'ı çalıştırır ve sonuçları değerlendirir
4. **Documentation Mode**: Docs Agent'ı çalıştırır
5. **Sürekli İzleme**:
   - Dashboard'u gerçek zamanlı günceller (`dashboard.md`)
   - Execution log'larını takip eder
   - Hataları tespit eder ve yönetir (otomatik retry veya manuel müdahale)
   - Sprint completion criteria'larını kontrol eder

---

## Sistemin Avantajları

### 1. Şeffaflık
- Tüm süreç dosyalar üzerinden gerçekleştiği için tamamen şeffaftır
- Her adım izlenebilir ve denetlenebilir

### 2. Ölçeklenebilirlik
- Yeni agent'lar kolayca eklenebilir
- **Vertical Agent Structure** sayesinde farklı teknoloji stack'leri paralel olarak desteklenebilir
- Aynı anda birden fazla backend teknolojisi (.NET Core, Java, Python) veya frontend framework'ü (Angular, React, Vue) kullanılabilir
- Paralel çalışma desteklenir

### 3. Tekrar Kullanılabilirlik
- Agent tanımları projeler arası paylaşılabilir
- Protokoller standartlaştırılmıştır
- Best practice'ler dokümante edilmiştir

### 4. Hata Yönetimi ve Recovery
- **Execution Logs**: Her agent, tüm işlemlerini `/runs/<SPRINT_ID>/logs/` klasörüne loglar
- **Hata Tespiti**: Orchestrator Agent ve Lead Dev Agent hataları otomatik tespit eder
- **Recovery Mekanizması**: 
  - Execution log'larından son başarılı adım tespit edilir
  - Task'lar kaldığı yerden devam edebilir
  - IN_PROGRESS task'lar resume edilebilir
- **Retry Mekanizmaları**: 
  - Geçici hatalar için otomatik retry
  - Kalıcı hatalar için BLOCKED işaretleme ve manuel müdahale
- **Error Handling Protokolleri**: `error_recovery.md` protokolüne göre yönetilir

### 5. Git Entegrasyonu
Sistem, opsiyonel olarak Git entegrasyonu sağlar (`GIT: STATUS: ACTIVE`):

- **Branch Yönetimi**: 
  - Her task kendi branch'inde çalışabilir
  - Branch naming: `<SPRINT_ID>/<TASK_ID>-<description>` (format: SPRINT_TASK)
  - Veya sadece `<TASK_ID>-<description>` (format: TASK_ONLY)
- **Commit Mesajları**: 
  - Standart format: `<TASK_ID>: <description>`
  - Conventional format: `feat(<TASK_ID>): <description>`
  - Tüm değişiklikler commit'lenir
- **Pull Request'ler**: 
  - `REQUIRE_PR: YES` ise, her task için PR oluşturulur
  - PR formatı: `[<SPRINT_ID>] <TASK_ID>: <TITLE>`
  - PR description'da task bilgileri otomatik eklenir
- **Task Completion**: COMPLETION bölümünde Git bilgileri (branch, commits, PR) kaydedilir

---

## Custom Agents: Projeye Özel Agent'lar

Mutfak AI Factory'nin en güçlü özelliklerinden biri, proje gereksinimlerine göre **özel domain agent'ları** ekleyebilmesidir.

### Custom Agent Nedir?

Custom Agent'lar, standart agent'ların kapsamadığı özel domain'ler için Product Agent tarafından otomatik olarak tespit edilen ve eklenen özel agent'lardır.

**Custom Agent Örnekleri:**
- **IoT Agent**: IoT cihaz entegrasyonu, embedded systems, sensor data processing
- **Blockchain Agent**: Smart contracts, cryptocurrency, distributed ledger
- **Game Dev Agent**: Game engines, game mechanics, game design
- **Data Engineering Agent**: ETL pipelines, data warehouses
- **Integration Agent**: Third-party API entegrasyonları

### Custom Agent Nasıl Tespit Edilir?

Product Agent, root `/docs/` klasörünü analiz ederken şu domain'leri otomatik olarak tespit eder:

1. **IoT/Embedded**: IoT devices, embedded systems, hardware integration, sensor data
2. **Blockchain**: Smart contracts, cryptocurrency, distributed ledger, wallet integration
3. **Game Development**: Game engines, game mechanics, game physics
4. **Data Engineering**: ETL pipelines, data warehouses, big data processing
5. **Integration**: Third-party API integrations, external service integrations

### Custom Agent Ekleme Süreci

1. **Product Agent Analizi**: Product Agent, root `/docs/` klasörünü okur ve özel domain'leri tespit eder
2. **project.scope.md Güncelleme**: Product Agent, `project.scope.md` dosyasına `CUSTOM_AGENTS` bölümü ekler:

```yaml
CUSTOM_AGENTS:
  IOT: ACTIVE
  BLOCKCHAIN: ACTIVE
  GAME_DEV: ACTIVE
```

3. **Sprint Initialization**: Sprint başlatıldığında, custom agent'lar için task klasörleri oluşturulur:
   - `tasks/iot/` (IoT agent için)
   - `tasks/blockchain/` (Blockchain agent için)
   - `tasks/game-dev/` (Game Dev agent için)

4. **Task Oluşturma**: Planner Agent, custom agent'lar için task'lar oluşturur
5. **Execution**: Custom agent'lar, standart agent'lar gibi task'ları execute eder

### Custom Agent Naming Convention

- **project.scope.md'de**: `UPPERCASE_WITH_UNDERSCORES` formatı (örn: `IOT`, `BLOCKCHAIN`, `GAME_DEV`)
- **Task klasörlerinde**: `lowercase-with-hyphens` formatı (örn: `iot/`, `blockchain/`, `game-dev/`)
- **Task dosyalarında**: `ROLE: UPPERCASE_WITH_UNDERSCORES` (örn: `ROLE: IOT`)

### Custom Agent Kullanım Senaryoları

#### Senaryo 1: IoT Projesi
Bir IoT projesinde, Product Agent otomatik olarak IoT Agent'ı tespit eder:
- IoT cihaz entegrasyonu task'ları `tasks/iot/` klasörüne eklenir
- IoT Agent, MQTT connector'ları, sensor data processing, device management gibi task'ları execute eder

#### Senaryo 2: Blockchain Projesi
Bir blockchain projesinde, Product Agent otomatik olarak Blockchain Agent'ı tespit eder:
- Smart contract task'ları `tasks/blockchain/` klasörüne eklenir
- Blockchain Agent, smart contract development, wallet integration, token management gibi task'ları execute eder

#### Senaryo 3: Game Development Projesi
Bir oyun geliştirme projesinde, Product Agent otomatik olarak Game Dev Agent'ı tespit eder:
- Game engine task'ları `tasks/game-dev/` klasörüne eklenir
- Game Dev Agent, game mechanics, physics engine, rendering gibi task'ları execute eder

### Custom Agent Avantajları

✅ **Esneklik**: Herhangi bir domain için özel agent eklenebilir
✅ **Otomatik Tespit**: Product Agent, domain'leri otomatik olarak tespit eder
✅ **Standart Yapı**: Custom agent'lar, standart agent'lar gibi çalışır
✅ **Template Desteği**: `custom-agent-template.md` ile kolayca yeni agent'lar oluşturulabilir

---

## Kullanım Senaryoları

### Senaryo 1: Startup MVP Geliştirme
Bir startup, hızlı bir şekilde MVP geliştirmek istiyor. Mutfak AI Factory ile:
- Product Agent, müşteri gereksinimlerini analiz eder
- Architect Agent, hızlı ve ölçeklenebilir bir mimari önerir
- Planner Agent, MVP için gerekli task'ları oluşturur
- Production agent'lar, paralel çalışarak hızlı bir şekilde kod üretir

### Senaryo 2: Enterprise Proje Yönetimi
Büyük bir enterprise projesinde:
- Farklı ekipler farklı sprint'lerde çalışabilir
- Her sprint'in kendi klasör yapısı vardır
- Dependency'ler otomatik yönetilir
- QA ve dokümantasyon süreçleri otomatikleştirilmiştir

### Senaryo 2.1: Multi-Stack Enterprise Projesi (Vertical Structure)
Bir enterprise projesinde farklı teknolojiler paralel olarak kullanılabilir:
- **Backend**: .NET Core (User Service) ve Java (Payment Service) paralel geliştirilir
- **Frontend**: Angular (Admin Dashboard) ve React (Customer Portal) aynı anda geliştirilir
- Her teknoloji için ayrı agent çalışır (DOTNET_CORE_DEVELOPER, JAVA_DEVELOPER, ANGULAR_DEVELOPER, REACT_DEVELOPER)
- Vertical Structure sayesinde teknoloji-spesifik best practice'ler uygulanır
- Paralel geliştirme ile hız kazanılır

### Senaryo 3: Open Source Proje Katkısı
Open source bir projeye katkıda bulunurken:
- Feature request'ler `runs/features/requests/` klasörüne eklenir
- Product Agent, feature'ları backlog'a ekler
- Her feature için ayrı sprint'ler oluşturulabilir
- Git entegrasyonu ile PR'lar otomatik oluşturulur

### Senaryo 4: Özel Domain Projesi (Custom Agents)
Özel bir domain projesinde (örneğin IoT, Blockchain, Game Dev):
- Product Agent, root `/docs/` klasörünü analiz eder
- Özel domain'leri otomatik olarak tespit eder (IoT, Blockchain, vb.)
- `project.scope.md` dosyasına custom agent'ları ekler
- Custom agent'lar için task klasörleri oluşturulur
- Custom agent'lar, standart agent'lar gibi task'ları execute eder
- Örnek: IoT projesinde IoT Agent, MQTT connector'ları ve sensor data processing task'larını execute eder

---

## Teknik Detaylar

### Agent Tanımları

Her agent, bir markdown dosyası olarak tanımlanır. Örnek bir agent tanımı:

```markdown
# AI AGENT: DOTNET_CORE_DEVELOPER

## ROLE
You are the .NET Core Developer of this AI-driven software team.

## INPUTS YOU MUST READ
1. /ai/project.scope.md
2. /runs/<SPRINT_ID>/product.md
3. /runs/<SPRINT_ID>/architecture.md
4. /runs/<SPRINT_ID>/tasks/dotnet-core/ (READY tasks)

## OUTPUTS YOU MUST PRODUCE
- Code files in src/api/{Project_Name}.{Stack_Name}/
- Task COMPLETION sections
- Execution logs
- Follow .NET Core best practices and conventions
```

**Not:** Vertical Structure sayesinde, her teknoloji için ayrı agent tanımları vardır. Örneğin:
- `dotnet-core-developer.md` → .NET Core geliştirme
- `java-developer.md` → Java geliştirme
- `angular-developer.md` → Angular geliştirme
- `react-developer.md` → React geliştirme

### Protokoller

Sistem, farklı protokollerle yönetilir:
- `sprint_flow.md`: Sprint akış sırası
- `task_format.md`: Task dosya formatı
- `dependency_rules.md`: Dependency yönetimi kuralları
- `git_integration.md`: Git entegrasyonu kuralları
- `error_recovery.md`: Hata kurtarma protokolleri
- `vertical_agent_structure_proposal.md`: Vertical Agent Structure detayları
- `backward_compatibility.md`: Backward compatibility kuralları (eski format desteği)

### Project Scope

`project.scope.md` dosyası, projenin anayasasıdır:

```yaml
PROJECT:
  NAME: BankApp

STACK:
  API: ACTIVE
  FRONTEND: ACTIVE
  REACT_NATIVE: ACTIVE
  # ...

CUSTOM_AGENTS:
  # Product Agent tarafından otomatik tespit edilir
  # Örnek: IoT, Blockchain, Game Dev projelerinde
  # IOT: ACTIVE
  # BLOCKCHAIN: ACTIVE
  # GAME_DEV: ACTIVE

GIT:
  STATUS: ACTIVE | NONE
  BRANCH_NAMING: SPRINT_TASK | TASK_ONLY
  COMMIT_MESSAGE_FORMAT: STANDARD | CONVENTIONAL

RULES:
  - PCI DSS compliance required
  - Clean Architecture must be followed
  - Two-factor authentication mandatory
  # ...
```

---

## Gerçek Dünya Örneği: Basit Bankacılık Uygulaması

Basit Bankacılık Uygulaması (BankApp), Mutfak AI Factory kullanılarak geliştirilen bir dijital bankacılık platformudur. Proje:

- **Backend**: Java Spring Boot (JAVA_DEVELOPER agent), Clean Architecture
- **Frontend**: React (REACT_DEVELOPER agent) - Web Dashboard
- **Mobile**: React Native (REACT_NATIVE_DEVELOPER agent) - iOS ve Android
- **Database**: PostgreSQL (ACID compliance ile)
- **Security**: PCI DSS uyumlu, 2FA zorunlu
- **Özellikler**: 
  - Hesap yönetimi (bakiye sorgulama, transfer)
  - İşlem geçmişi
  - Güvenli ödeme işlemleri
  - Mobil uygulama ile anlık bildirimler

**Vertical Structure Kullanımı:**
- `project.scope.md` dosyasında `BACKEND.JAVA: ACTIVE` ve `FRONTEND.REACT: ACTIVE` tanımlanmıştır
- Her teknoloji için ayrı agent çalışmıştır (JAVA_DEVELOPER, REACT_DEVELOPER, REACT_NATIVE_DEVELOPER)
- Task'lar teknoloji-spesifik klasörlere dağıtılmıştır (`tasks/java/`, `tasks/react/`, `tasks/react-native/`)
- Teknoloji-spesifik best practice'ler uygulanmıştır

Sistem, 3 sprint'te tamamlanmış ve tüm süreç dosyalar üzerinden yönetilmiştir. Özellikle güvenlik gereksinimleri (PCI DSS, 2FA) Security Agent tarafından otomatik olarak kontrol edilmiş ve tüm işlemler audit log'ları ile kayıt altına alınmıştır.

---

## Sonuç: Geleceğin Yazılım Geliştirme Modeli

Mutfak AI Factory, yazılım geliştirme süreçlerinde yeni bir paradigma sunuyor. Sistem:

✅ **Şeffaf**: Tüm süreç izlenebilir
✅ **Ölçeklenebilir**: Yeni agent'lar ve teknolojiler eklenebilir
✅ **Tekrar Kullanılabilir**: Agent tanımları paylaşılabilir
✅ **Otomatik**: Orchestrator Agent ile tam otonom çalışabilir
✅ **Esnek**: Herhangi bir teknoloji stack'i ile çalışabilir
✅ **Vertical Structure**: Teknoloji-spesifik agent'lar ile paralel geliştirme
✅ **Backward Compatible**: Eski format (`API: ACTIVE`, `FRONTEND: ACTIVE`) hala desteklenir

### Neden Önemli?

Yazılım geliştirme süreçleri, giderek daha karmaşık hale geliyor. Farklı rollerdeki geliştiricilerin koordinasyonu, görev dağılımı ve bağımlılık yönetimi, proje yönetiminin en zor kısımlarından biri. Mutfak AI Factory, bu sorunları çözerek, geliştiricilerin asıl işlerine (kod yazmaya) odaklanmalarını sağlıyor.

### Gelecek Vizyonu

Mutfak AI Factory'nin gelecekteki versiyonları:
- Daha fazla agent tipi desteği
- Cloud-based orchestration
- Real-time collaboration
- AI-powered code review
- Automated testing ve deployment

---

## Kaynaklar ve Dokümantasyon

- **GitHub Repository**: [Proje linki]
- **Quick Start Guide**: `mutfak-ai-factory/guides/QUICK_START.md`
- **Best Practices**: `mutfak-ai-factory/guides/BEST_PRACTICES.md`
- **Agent Prompts**: `mutfak-ai-factory/guides/AGENT_PROMPTS.md`
- **Troubleshooting**: `mutfak-ai-factory/guides/TROUBLESHOOTING.md`

---

## Sık Sorulan Sorular

### S: Mutfak AI Factory, hangi IDE'lerde çalışır?
**C:** Sistem, Cursor IDE için tasarlanmıştır, ancak dosya tabanlı yapısı sayesinde diğer IDE'lerde de kullanılabilir. (Not: Cursor IDE, gerçek bir IDE adıdır ve değiştirilmemiştir)

### S: Agent'lar gerçekten kod yazıyor mu?
**C:** Evet, agent'lar (Backend, Frontend, vb.) gerçekten kod yazıyor. Mutfak AI Factory, agent'ların nasıl çalışacağını tanımlar.

### S: Sistem, hangi programlama dillerini destekliyor?
**C:** Sistem, herhangi bir programlama diline bağlı değildir. Agent tanımları, hangi dilleri destekleyeceğini belirler.

### S: Git entegrasyonu zorunlu mu?
**C:** Hayır, `GIT: STATUS: NONE` ayarı ile Git entegrasyonu devre dışı bırakılabilir.

### S: Orchestrator Agent olmadan çalışabilir miyim?
**C:** Evet, agent'lar manuel olarak da çalıştırılabilir. Orchestrator Agent, tam otonom çalışma için bir seçenektir.

### S: Vertical Agent Structure nedir?
**C:** Vertical Agent Structure, teknoloji-spesifik agent'ları destekleyen bir yapıdır. Örneğin, `.NET Core` için `DOTNET_CORE_DEVELOPER`, `Java` için `JAVA_DEVELOPER`, `React` için `REACT_DEVELOPER` gibi. Bu sayede farklı teknolojiler paralel olarak geliştirilebilir ve her teknoloji için özel best practice'ler uygulanabilir.

### S: Eski format (`API: ACTIVE`, `FRONTEND: ACTIVE`) hala çalışıyor mu?
**C:** Evet, sistem backward compatibility sağlar. Eski format (`API: ACTIVE` → `BACKEND.DOTNET_CORE: ACTIVE`, `FRONTEND: ACTIVE` → `FRONTEND.ANGULAR: ACTIVE`) otomatik olarak yeni formata map edilir. Ancak yeni projeler için Vertical Structure formatı önerilir.

### S: Birden fazla backend teknolojisi aynı anda kullanılabilir mi?
**C:** Evet, Vertical Structure sayesinde aynı anda birden fazla backend teknolojisi kullanılabilir. Örneğin, `.NET Core` (User Service) ve `Java` (Payment Service) paralel olarak geliştirilebilir. Her teknoloji için ayrı agent çalışır.

### S: Task'lar nasıl READY oluyor?
**C:** Bir task READY olması için: (1) STATUS: TODO olmalı, (2) Tüm dependency'ler STATUS: DONE olmalı. Dependency Engine, bir task DONE olduğunda otomatik olarak bağımlı task'ları kontrol eder ve READY yapar. READY bir status değil, bir condition'dır.

### S: Hata durumunda ne oluyor?
**C:** Sistem, execution log'ları sayesinde hata recovery sağlar. Her agent, tüm işlemlerini `/runs/<SPRINT_ID>/logs/` klasörüne loglar. Hata durumunda, execution log'larından son başarılı adım tespit edilir ve task kaldığı yerden devam edebilir. IN_PROGRESS task'lar resume edilebilir.

### S: Sprint ne zaman tamamlanmış sayılıyor?
**C:** Sprint, şu kriterlerin **tümü** karşılandığında COMPLETE olur: (1) Tüm task'lar DONE, (2) QA STATUS: PASSED, (3) Tüm code review'lar APPROVED, (4) Dokümantasyon tamamlandı, (5) Lead Dev review tamamlandı.

### S: Feature request nasıl eklenir?
**C:** `runs/features/requests/feature-<NUMBER>.md` dosyası oluşturulur ve Product Agent'a bildirilir. Product Agent, feature'ı review eder, priority belirler ve backlog'a ekler veya mevcut sprint'e ekler.

### S: Root `/docs/` ve `mutfak-ai-factory/docs/` arasındaki fark nedir?
**C:** Root `/docs/` klasörü müşteri dokümanlarını içerir (Architecture.md, Database.md, vb.) ve **önceliklidir**. `mutfak-ai-factory/docs/` klasörü sistem dokümanlarını içerir (vision.md, features.md, vb.) ve Product Agent tarafından oluşturulur/güncellenir.

---

**Yazar Notu**: Bu makale, Mutfak AI Factory sisteminin genel bir tanıtımıdır. Detaylı teknik dokümantasyon için proje repository'sine bakınız.

---

*Bu makale, Mutfak AI Factory v1.0 baz alınarak yazılmıştır. Sistem sürekli geliştirilmektedir ve yeni özellikler eklenmektedir.*
