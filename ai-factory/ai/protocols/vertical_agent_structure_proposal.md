# Vertical Agent Structure Proposal

## 🎯 Mevcut Durum Analizi

### Şu Anki Yapı:
- **Backend Agent** → Genel backend developer (şu anda C# .NET kullanıyor)
- **Frontend Agent** → Genel frontend developer (şu anda Angular kullanıyor)
- **React Native Agent** → Teknoloji-spesifik ✓
- **iOS Developer** → Teknoloji-spesifik ✓
- **Android Developer** → Teknoloji-spesifik ✓

### Sorun:
- Backend Agent hem .NET, hem Java, hem Python yazabilir mi? → Belirsizlik
- Frontend Agent hem Angular, hem React, hem Vue yazabilir mi? → Belirsizlik
- Teknoloji-specific best practices uygulanamıyor
- Paralel çalışma zor (React ve Angular aynı anda)

---

## 💡 Önerilen Yapı: Vertical Agent Structure

### Backend Agents (Teknoloji-Spesifik):
- **DOTNET_CORE_DEVELOPER** → .NET Core / C# developer
- **JAVA_DEVELOPER** → Java / Spring Boot developer
- **PYTHON_DEVELOPER** → Python / Django / FastAPI developer
- **NODEJS_DEVELOPER** → Node.js / Express / NestJS developer
- **GO_DEVELOPER** → Go / Gin / Echo developer (opsiyonel)
- **RUST_DEVELOPER** → Rust developer (opsiyonel)

### Frontend Agents (Framework-Spesifik):
- **ANGULAR_DEVELOPER** → Angular developer
- **REACT_DEVELOPER** → React developer
- **VUE_DEVELOPER** → Vue.js developer
- **NEXTJS_DEVELOPER** → Next.js developer (opsiyonel)
- **SVELTE_DEVELOPER** → Svelte developer (opsiyonel)

### Mobile Agents (Zaten Spesifik):
- **REACT_NATIVE_DEVELOPER** → React Native developer ✓
- **IOS_DEVELOPER** → iOS native developer ✓
- **ANDROID_DEVELOPER** → Android native developer ✓
- **FLUTTER_DEVELOPER** → Flutter developer (opsiyonel)

---

## ✅ Avantajlar

### 1. Teknoloji Odaklılık
- Her agent sadece kendi teknolojisine odaklanır
- Teknoloji-specific best practices uygulanır
- Daha iyi kod kalitesi

### 2. Paralel Çalışma
- React ve Angular aynı anda geliştirilebilir
- .NET Core ve Java backend'ler paralel çalışabilir
- Daha hızlı geliştirme

### 3. Spesifik Kurallar
- Her agent kendi teknolojisine özel kurallar içerir
- Framework-specific patterns ve conventions
- Teknoloji-specific tooling ve dependencies

### 4. Esneklik
- Proje ihtiyacına göre teknoloji seçimi
- Multi-stack projeler desteklenir
- Teknoloji migration kolaylaşır

### 5. Bakım Kolaylığı
- Her teknoloji için ayrı agent = ayrı bakım
- Teknoloji güncellemeleri izole edilir
- Yeni teknolojiler kolayca eklenir

---

## ⚠️ Dezavantajlar ve Çözümler

### 1. Daha Fazla Agent Dosyası
**Sorun:** 10+ agent dosyası yönetmek zor olabilir
**Çözüm:** 
- Template-based agent creation
- Ortak kurallar base template'te
- Teknoloji-specific kurallar extend edilir

### 2. Karmaşıklık Artışı
**Sorun:** Daha fazla agent = daha fazla yönetim
**Çözüm:**
- Orchestrator Agent zaten var
- Otomatik task assignment
- Dashboard ile görselleştirme

### 3. Project Scope Karmaşıklığı
**Sorun:** Çok fazla stack seçeneği
**Çözüm:**
- Hierarchical structure:
  ```
  BACKEND:
    DOTNET_CORE: ACTIVE
    JAVA: NONE
    PYTHON: NONE
  FRONTEND:
    ANGULAR: ACTIVE
    REACT: NONE
    VUE: NONE
  ```

---

## 🏗️ Önerilen Yapı

### Project Scope Yapısı:

```yaml
STACK:
  # Backend Technologies
  BACKEND:
    DOTNET_CORE: ACTIVE | NONE
    JAVA: ACTIVE | NONE
    PYTHON: ACTIVE | NONE
    NODEJS: ACTIVE | NONE
    GO: ACTIVE | NONE
    RUST: ACTIVE | NONE
  
  # Frontend Frameworks
  FRONTEND:
    ANGULAR: ACTIVE | NONE
    REACT: ACTIVE | NONE
    VUE: ACTIVE | NONE
    NEXTJS: ACTIVE | NONE
    SVELTE: ACTIVE | NONE
  
  # Mobile Frameworks
  MOBILE:
    REACT_NATIVE: ACTIVE | NONE
    FLUTTER: ACTIVE | NONE
  
  # Native Mobile
  IOS_DEVELOPER: ACTIVE | NONE
  ANDROID_DEVELOPER: ACTIVE | NONE
  
  # Other Stacks (unchanged)
  DESIGNER: ACTIVE | NONE
  DATABASE: ACTIVE | NONE
  TEST_DEV: ACTIVE | NONE
  SECURITY: ACTIVE | NONE
  OPS: ACTIVE | NONE
  AI_ML: ACTIVE | NONE
```

### Task Klasör Yapısı:

```
runs/<SPRINT_ID>/tasks/
├── dotnet-core/      (if DOTNET_CORE: ACTIVE)
├── java/             (if JAVA: ACTIVE)
├── python/           (if PYTHON: ACTIVE)
├── nodejs/           (if NODEJS: ACTIVE)
├── angular/          (if ANGULAR: ACTIVE)
├── react/            (if REACT: ACTIVE)
├── vue/              (if VUE: ACTIVE)
├── react-native/     (if REACT_NATIVE: ACTIVE)
├── flutter/          (if FLUTTER: ACTIVE)
├── ios-developer/    (if IOS_DEVELOPER: ACTIVE)
├── android-developer/ (if ANDROID_DEVELOPER: ACTIVE)
└── ...
```

### Agent Dosya Yapısı:

```
ai/agents/
├── backend-base.md           (ortak backend kuralları - template)
├── dotnet-core-developer.md  (extends backend-base)
├── java-developer.md         (extends backend-base)
├── python-developer.md       (extends backend-base)
├── nodejs-developer.md       (extends backend-base)
├── frontend-base.md          (ortak frontend kuralları - template)
├── angular-developer.md      (extends frontend-base)
├── react-developer.md        (extends frontend-base)
├── vue-developer.md          (extends frontend-base)
└── ...
```

---

## 🔄 Migration Stratejisi

### Aşama 1: Base Templates Oluştur
1. `backend-base.md` → Ortak backend kuralları
2. `frontend-base.md` → Ortak frontend kuralları
3. Mevcut `backend.md` ve `frontend.md` base olarak kullanılabilir

### Aşama 2: Teknoloji-Spesifik Agents
1. `.NET Core Developer` → `backend.md`'den türet
2. `Angular Developer` → `frontend.md`'den türet
3. Diğer teknolojiler için yeni agent'lar

### Aşama 3: Project Scope Güncelleme
1. Hierarchical structure ekle
2. Backward compatibility için `API: ACTIVE` → `BACKEND.DOTNET_CORE: ACTIVE` mapping
3. `FRONTEND: ACTIVE` → `FRONTEND.ANGULAR: ACTIVE` mapping

### Aşama 4: Sistem Güncellemeleri
1. Orchestrator Agent güncelle
2. Planner Agent güncelle
3. Task format güncelle
4. Sprint initialization güncelle

---

## 📊 Örnek Senaryolar

### Senaryo 1: Single Stack Proje
```yaml
BACKEND:
  DOTNET_CORE: ACTIVE
  JAVA: NONE
FRONTEND:
  ANGULAR: ACTIVE
  REACT: NONE
```
→ Sadece .NET Core ve Angular agent'ları çalışır

### Senaryo 2: Multi-Stack Proje
```yaml
BACKEND:
  DOTNET_CORE: ACTIVE
  JAVA: ACTIVE
FRONTEND:
  ANGULAR: ACTIVE
  REACT: ACTIVE
```
→ 4 agent paralel çalışır (.NET Core, Java, Angular, React)

### Senaryo 3: Microservices
```yaml
BACKEND:
  DOTNET_CORE: ACTIVE  # User Service
  JAVA: ACTIVE         # Payment Service
  PYTHON: ACTIVE       # ML Service
FRONTEND:
  REACT: ACTIVE        # Admin Dashboard
  VUE: ACTIVE          # Customer Portal
```
→ 5 agent paralel çalışır

---

## 🎯 Önerilen Yaklaşım

### Seçenek 1: Tam Vertical (Önerilen)
- Her teknoloji için ayrı agent
- Maksimum esneklik ve paralellik
- En iyi kod kalitesi
- **Karmaşıklık:** Orta-Yüksek

### Seçenek 2: Hybrid (Geçiş Dönemi)
- Backend ve Frontend base agent'lar kalır
- Teknoloji-specific agent'lar eklenir
- Backward compatibility korunur
- **Karmaşıklık:** Düşük-Orta

### Seçenek 3: Custom Agent Pattern (Mevcut)
- Backend ve Frontend genel kalır
- Teknoloji-specific ihtiyaçlar için Custom Agent
- **Karmaşıklık:** Düşük
- **Esneklik:** Sınırlı

---

## 💭 Sonuç ve Öneri

**Önerim:** Seçenek 1 (Tam Vertical) - Aşamalı geçiş ile

**Neden:**
1. Sistem zaten React Native, iOS, Android için spesifik agent'lar kullanıyor
2. Backend ve Frontend için de aynı yaklaşım tutarlı olur
3. Multi-stack projelerde büyük avantaj sağlar
4. Teknoloji-specific best practices uygulanabilir
5. Paralel çalışma ile hız kazanılır

**Geçiş Planı:**
1. Base templates oluştur (1-2 saat)
2. .NET Core ve Angular agent'ları oluştur (mevcut backend/frontend'den)
3. Project scope'u güncelle (hierarchical structure)
4. Sistem dosyalarını güncelle (orchestrator, planner, vb.)
5. Test et ve dokümante et

**Süre Tahmini:** 4-6 saat

---

## 📝 Notlar

- Bu yapı mevcut custom agent pattern'i ile uyumlu
- Backward compatibility için mapping mekanizması eklenebilir
- Yeni teknolojiler kolayca eklenebilir (template'ten türet)
- Orchestrator Agent zaten multi-agent yönetimi yapıyor
