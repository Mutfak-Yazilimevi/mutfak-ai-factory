# Quick Start Guide

**Müşteri olarak: 3 adımda sprint başlat**

## 🆕 Yeni Projeye Başlarken

**ÖNEMLİ:** Eğer yeni bir projeye başlıyorsanız, önce eski proje verilerini temizlemeniz gerekir.

**Hızlı Temizlik:**
1. `src/` klasörünü temizle (eski kodları sil veya yedekle)
2. Root `/docs/` klasöründeki eski dokümanları yeni proje dokümanlarıyla değiştir
3. `ai-factory/runs/` klasöründeki eski sprint klasörlerini arşivle veya sil
4. `ai-factory/ai/project.scope.md` dosyasını yeni proje için güncelle (veya Product Agent'a bırak)

**Detaylı Temizlik Rehberi:**
- `ai-factory/ai/protocols/new_project_initialization.md` dosyasına bakın

---

## 🚀 Hızlı Başlangıç (Müşteri Perspektifi)

### Adım 1: Dokümanları Hazırla (1 dakika)

**Sen müşterisin. Sadece şunu yap:**

1. **Root `/docs/` klasörüne analiz dökümanlarını ekle:**
   - **ÖNEMLİ:** Dosya isimleri tamamen serbesttir. İstediğin isimde istediğin kadar dosya ekleyebilirsin.
   - **Örnek dosya isimleri (sadece örnek, zorunlu değil):**
     - Architecture.md (teknik mimari)
     - Database.md (veritabanı şeması)
     - Lojikakis.md (iş mantığı)
     - Requirements.md, Specs.md, BusinessRules.md, vb.
   - **Sistem otomatik olarak:** Root `/docs/` klasöründeki TÜM `.md` dosyalarını okur ve analiz eder.
   - **Dosya ismi kısıtı yok:** Product Agent, klasördeki tüm dosyaları okur, belirli bir dosya ismi beklemez.

**Not:** Bu dosyalar projenin gereksinimlerini ve analizini içerir. Product Agent, root `/docs/` klasöründeki tüm dosyaları otomatik olarak okuyacak ve analiz edecektir.

### Adım 2: Proje Ayarlarını Kontrol Et (Opsiyonel - 1 dakika)

Eğer özel ayarlar istiyorsan:

1. `ai-factory/ai/project.scope.md` dosyasını kontrol et:
   - Stack'leri belirle (API: ACTIVE, FRONTEND: ACTIVE, vb.)
   - **Git entegrasyonu:** `GIT: STATUS: ACTIVE | NONE` ayarını kontrol et
     - ACTIVE: Agent'lar Git kurallarını takip eder (branch, commit, PR)
     - NONE: Git kısıtlaması yok, kod doğrudan yazılır
   - **Planning Mode:** `SPRINT_MANAGEMENT.PLANNING_MODE` ayarını kontrol et
     - **FULL_PROJECT** (Önerilen - Yeni projeler için): Tüm sprintler önceden planlanır
     - **ITERATIVE**: Sprintler birer birer planlanır (mevcut projeler için)
   - Genel kuralları ekle

2. `ai-factory/ai/project.scope.md` dosyasını kontrol et:
   - SPRINT_ID_FORMAT ayarını kontrol et (SEQUENTIAL veya PROJECT_PREFIXED)
   - Sprint hedefini yaz (opsiyonel - Product Agent bunu da oluşturabilir)

**Not:** Yeni projeler için Product Agent, planning mode seçimini otomatik olarak sunar. `project.scope.md`'de ayar yoksa, Product Agent kullanıcıya seçenekleri sunar.

### Adım 3: Süreci Başlat (1 dakika)

**İki seçenek var:**

#### Seçenek A: Orchestrator Agent (Önerilen - Tam Otonom)

**Cursor Chat'te Orchestrator Agent'a şunu söyle:**

```
Read ai-factory/ai/agents/orchestrator.md and execute.

Start orchestration for a new sprint. I've placed my documents in the root /docs/ folder.
```

**Orchestrator Agent otomatik olarak:**
1. Product Agent'ı çalıştırır (sprint initialization + product.md)
2. Architect Agent'ı çalıştırır
3. Planner Agent'ı çalıştırır
4. Lead Dev Agent'ı çalıştırır (Plan Review)
5. Production agent'ları çalıştırır (otomatik task assignment)
6. QA Agent'ı çalıştırır
7. Docs Agent'ı çalıştırır
8. Dashboard'u sürekli günceller
9. Hataları yönetir (otomatik retry veya manuel müdahale)

**Avantajlar:**
- Tam otonom çalışma
- Otomatik task assignment
- Gerçek zamanlı dashboard
- Hata yönetimi
- Manuel agent çalıştırma gerekmez

#### Seçenek B: Manuel Çalıştırma (Geleneksel)

**Cursor Chat'te Product Agent'a şunu söyle:**

```
Read ai-factory/ai/agents/product.md and execute.

I've placed my documents in the root /docs/ folder. Please start the process.
```

**Product Agent otomatik olarak:**
1. **Planning Mode Seçimi (Yeni Projeler için):**
   - Eğer `project.scope.md`'de `PLANNING_MODE` yoksa, kullanıcıya seçenekleri sunar:
     - **FULL_PROJECT**: Tüm sprintler önceden planlanır (önerilen)
     - **ITERATIVE**: Sprintler birer birer planlanır
   - Seçimi `project.scope.md`'ye kaydeder
2. **SPRINT_PLAN.md Oluşturma:**
   - Her zaman `/runs/SPRINT_PLAN.md` dosyasını oluşturur
   - Planning mode'u ve sprint breakdown'ı içerir
3. **FULL_PROJECT Mode (Eğer seçildiyse):**
   - Tüm proje gereksinimlerini analiz eder
   - Tüm sprintleri planlar ve `SPRINT_PLAN.md`'ye ekler
   - Her sprint için workspace oluşturur (`runs/001/`, `runs/002/`, vb.)
   - Her sprint için `product.md` oluşturur
4. **ITERATIVE Mode (Eğer seçildiyse):**
   - Sadece ilk sprint'i (001) planlar
   - `SPRINT_PLAN.md`'ye ekler
   - Sonraki sprintler birer birer planlanır
5. Root `/docs/` klasöründeki tüm dosyaları okuyacak
6. project.scope.md'den SPRINT_ID formatını okuyacak ve yeni SPRINT_ID oluşturacak
7. Sprint klasörünü oluşturacak
8. sprint.md dosyasını oluşturacak (root /docs/ klasöründen bilgileri çıkararak)
9. `product.md` dosyasını oluşturacak
   - **CRITICAL:** First line must be exactly: `SPRINT_ID: <SPRINT_ID>` (without markdown formatting)
   - This allows other agents to read SPRINT_ID from the first line

**Sonra diğer agent'ları sırayla çalıştır (SPRINT_ID belirtmene gerek yok):**

#### 1. Product Agent (Sprint Initialization + Product Requirements)
```
Read ai-factory/ai/agents/product.md and execute.

The agent will:
1. Determine SPRINT_ID from project.scope.md format and existing runs
2. Create /runs/<SPRINT_ID>/ directory structure
3. Create sprint.md file based on root /docs/ folder
4. Create product.md
```

**Note:** SPRINT_ID is automatically determined based on SPRINT_ID_FORMAT in project.scope.md and existing sprint folders.

#### 2. Architect Agent
```
Read ai-factory/ai/agents/architect.md and execute.

The agent will automatically find the sprint folder or read product.md to get SPRINT_ID.
```

#### 3. Planner Agent
```
Read ai-factory/ai/agents/planner.md and execute.

The agent will automatically find the sprint folder or read product.md to get SPRINT_ID.
```

#### 4. Lead Dev Agent (Plan Review)
```
Read ai-factory/ai/agents/lead-dev.md and execute Plan Review phase.

The agent will automatically find the sprint folder or read product.md to get SPRINT_ID.
```

#### 5. Technology-Specific Backend Agent (Production)

**For .NET Core projects:**
```
Read ai-factory/ai/agents/dotnet-core-developer.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```

**For legacy projects (backward compatibility):**
```
Read ai-factory/ai/agents/backend.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```

**Note:** Use the appropriate technology-specific agent based on your `project.scope.md` configuration (e.g., `dotnet-core-developer.md`, `java-developer.md`, `python-developer.md`, etc.).

#### 6. Designer Agent (Production - eğer DESIGNER: ACTIVE ise)
```
Read ai-factory/ai/agents/designer.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```
**Note:** Designer tasks typically complete before Frontend/React Native tasks.

#### 7. Database Agent (Production - eğer DATABASE: ACTIVE ise)
```
Read ai-factory/ai/agents/database.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```
**Note:** Database tasks typically complete before Backend tasks that need database.

#### 8. Technology-Specific Frontend Agent (Production)

**For Angular projects:**
```
Read ai-factory/ai/agents/angular-developer.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```

**For legacy projects (backward compatibility):**
```
Read ai-factory/ai/agents/frontend.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```

**Note:** Use the appropriate technology-specific agent based on your `project.scope.md` configuration (e.g., `angular-developer.md`, `react-developer.md`, `vue-developer.md`, etc.).

#### 9. React Native Agent (Production - eğer REACT_NATIVE: ACTIVE ise)
```
Read ai-factory/ai/agents/react-native.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```

#### 10. Test Dev Agent (Production - eğer TEST_DEV: ACTIVE ise)
```
Read ai-factory/ai/agents/test-dev.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```
**Note:** Test Dev tasks typically complete after production code tasks.

#### 11. Security Agent (Production - eğer SECURITY: ACTIVE ise)
```
Read ai-factory/ai/agents/security.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```
**Note:** Security tasks can run in parallel with other tasks.

#### 12. OPS Agent (Production - eğer OPS: ACTIVE ise)
```
Read ai-factory/ai/agents/ops.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```

#### 13. AI/ML Agent (Production - eğer AI_ML: ACTIVE ise)
```
Read ai-factory/ai/agents/ai-ml.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```

#### 14. Custom Agents (Production - eğer CUSTOM_AGENTS tanımlı ise)
```
Read ai-factory/ai/agents/custom-agent-template.md and execute for custom agent: <AGENT_NAME>.

Replace <AGENT_NAME> with the actual custom agent name from project.scope.md (e.g., IOT, BLOCKCHAIN).
```
**Note:** Custom agents follow the same execution pattern as standard agents.

#### 15. Lead Dev Agent (Execution Review - sürekli)
```
Read ai-factory/ai/agents/lead-dev.md and execute Execution Review phase.

The agent will check DONE tasks and update dependencies automatically.
```

#### 16. QA Agent
```
Read ai-factory/ai/agents/qa.md and execute.

The agent will automatically find the sprint folder and verify all requirements.
```

#### 17. Docs Agent
```
Read ai-factory/ai/agents/docs.md and execute.

The agent will automatically find the sprint folder and generate documentation.
```

## 📋 Örnek Prompt'lar

### Product Agent için:
```
Read ai-factory/ai/agents/product.md and execute.

The agent will:
1. Determine SPRINT_ID from project.scope.md format and existing runs
2. Create sprint folder structure automatically
3. Create sprint.md file based on root /docs/ folder
3. Create product.md
```

### Technology-Specific Backend Agent için (e.g., .NET Core Developer):
```
Read ai-factory/ai/agents/dotnet-core-developer.md and execute.

The agent will automatically find the sprint folder and execute READY tasks.
```

**Note:** Use the appropriate technology-specific agent based on your `project.scope.md` configuration. For legacy projects, you can still use `backend.md`.

### Lead Dev (Dependency Engine) için:
```
Read ai-factory/ai/agents/lead-dev.md and execute Execution Review phase.

The agent will automatically find the sprint folder and update dependencies.
```

## ⚠️ Önemli Notlar

- Her agent'ı sırayla çalıştır (dependency'ler önemli)
- **SPRINT_ID belirtmene gerek yok** - Agent'lar otomatik bulur
- Agent'lar dosyaları otomatik okur, sadece yönlendirme yap
- Bir agent tamamlanmadan diğerine geçme
- Feature backlog varsa Product Agent otomatik okur

## 🔍 Sprint Durumunu Kontrol Et

### SPRINT_PLAN.md Kontrolü

**Tüm proje görünümü için:**
```
Read ai-factory/runs/SPRINT_PLAN.md
```

SPRINT_PLAN.md'de göreceksin:
- Planning mode (FULL_PROJECT veya ITERATIVE)
- Tüm sprintlerin listesi ve durumları
- Sprint bağımlılıkları
- Mevcut aktif sprint (CURRENT_SPRINT)
- Her sprint'in STATUS'u (PLANNED, IN_PROGRESS, COMPLETE)

### Sprint Detay Kontrolü

```
Check ai-factory/runs/<SPRINT_ID>/ directory:
- product.md var mı?
- architecture.md var mı?
- tasks/ klasöründe task'lar var mı?
- qa.md'de STATUS nedir?
```

## 🎯 Feature Yönetimi

Yeni feature, özellik veya düzenleme gerektiğinde:

### 1. Feature Request Oluştur

1. `runs/features/requests/feature-<NUMBER>.md` dosyası oluştur
2. `ai/features/feature-template.md` template'ini kopyala
3. Feature detaylarını doldur:
   - Problem statement
   - Proposed solution
   - User stories
   - Acceptance criteria
   - Technical considerations

### 2. Product Agent'a Bildir

```
Read ai-factory/ai/agents/product.md and execute.

I've created a new feature request: runs/features/requests/feature-001.md
Please review and add it to the backlog or current sprint.
```

### 3. Product Agent İşlemi

Product Agent otomatik olarak:
- Feature'ı review eder
- Priority belirler (HIGH, MEDIUM, LOW)
- Mevcut sprint'e ekler veya backlog'a ekler
- `runs/features/backlog.md` dosyasını günceller

**Detaylar için:** `ai/protocols/feature_management.md`

---

## 🔍 Sprint Durumunu Kontrol Et

### Dashboard Kontrolü (Orchestrator Kullanıyorsan)

```
Read ai-factory/runs/<SPRINT_ID>/dashboard.md
```

Dashboard'da göreceksin:
- Sprint durumu ve progress
- Task status breakdown
- Agent activity
- READY tasks
- Blocked tasks
- Dependencies graph
- Git status (if ACTIVE)
- Recent activity

### Orchestrator ile Kontrol

```
Read ai-factory/ai/agents/orchestrator.md and check dashboard.

Please provide current sprint status and highlight any blockers.
```

### Manuel Kontrol

```
Check ai-factory/runs/<SPRINT_ID>/ directory:
- product.md var mı?
- architecture.md var mı?
- tasks/ klasöründe task'lar var mı?
- qa.md'de STATUS nedir?
- dashboard.md var mı? (if Orchestrator used)
```

### Status Template Kullan

`guides/SPRINT_STATUS.md` template'ini kopyala ve doldur:
- Task completion percentage
- Blocker listesi
- Next steps

### Agent ile Kontrol

```
Check the status of the current sprint.

Please:
1. Count tasks by status (TODO, IN_PROGRESS, DONE, BLOCKED)
2. List any BLOCKED tasks and reasons
3. Check QA status
4. Check documentation status
5. Provide a summary
```

---

## 🆘 Sorun mu var?

`guides/TROUBLESHOOTING.md` dosyasına bak.

**Yaygın sorunlar:**
- Agent dosya bulamıyor → SPRINT_ID klasörünü kontrol et
- Task'lar READY olmuyor → Dependency'leri kontrol et
- QA FAILED → `qa.md` dosyasını oku, fix task'ları oluştur
- Technology-specific agent bulunamıyor → project.scope.md'yi kontrol et
- Git entegrasyonu çalışmıyor → `guides/GIT_INTEGRATION.md` dosyasına bak
- Orchestrator sorunları → `guides/ORCHESTRATOR.md` dosyasına bak

---

## 📚 İlgili Rehberler

- `guides/AGENT_PROMPTS.md` - Tüm agent prompt'ları
- `guides/BEST_PRACTICES.md` - Best practices ve öneriler
- `guides/TROUBLESHOOTING.md` - Sorun giderme rehberi
- `guides/BUG_FIX.md` - Bug fix süreci
- `guides/FEATURE_REQUEST.md` - Feature request süreci
- `guides/CUSTOM_AGENTS.md` - Custom agent kullanımı
- `guides/GIT_INTEGRATION.md` - Git entegrasyonu rehberi
- `guides/ORCHESTRATOR.md` - Orchestrator Agent rehberi
- `guides/SPRINT_STATUS.md` - Sprint durumu template'i