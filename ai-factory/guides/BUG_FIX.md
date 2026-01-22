# Bug Fix Guide

Kodlarda bug tespit ettiğinizde izlemeniz gereken adımlar.

---

## 🐛 Bug Tespit Edildiğinde Yapılacaklar

### 1. Bug'ı Dokümante Edin

**Önemli:** Bug'ı detaylı şekilde dokümante edin. Agent'lar dokümantasyona göre çalışır.

**Dokümante edilmesi gerekenler:**
- **Nerede:** Hangi dosya, hangi fonksiyon/satır
- **Ne:** Ne oluyor, ne olması gerekiyor
- **Nasıl:** Adımlar (reproduce)
- **Etki:** Hangi feature/task etkileniyor
- **Öncelik:** Kritik mi, orta mı, düşük mü

**Örnek Bug Dokümantasyonu:**
```
Bug Location: src/api/MyProject.Domain/Entities/User.cs, line 45
Issue: User validation throws exception for null email
Expected: Should return validation error message, not throw exception
Reproduction Steps:
  1. Create User object with null email
  2. Call Validate() method
  3. Exception is thrown instead of validation error
Affected Task: backend-task-001.md
Priority: HIGH
```

---

## 2. Sprint Durumunu Kontrol Edin

### Sprint Henüz Başlamadıysa (Planning Aşamasında)

**Durum:** Product Agent, Architect Agent, veya Planner Agent çalışıyor

**Yapılacaklar:**
1. Product Agent'a bildirin
2. Product Agent `product.md`'yi günceller
3. Planner Agent yeni fix task'ları oluşturur
4. Normal akış devam eder

**Prompt:**
```
I've found a bug: [bug açıklaması]

Bug Details:
- Location: [dosya yolu, fonksiyon adı]
- Issue: [ne oluyor]
- Expected: [ne olması gerekiyor]
- Priority: [CRITICAL | HIGH | MEDIUM | LOW]

Please update product.md and create fix tasks for this bug.
```

---

### Sprint Production Aşamasındaysa

**Durum:** Developer agent'lar task'ları çalıştırıyor

**İki seçenek var:**

#### Seçenek A: Mevcut Sprint'e Ekle (Kritik Bug)

**Ne zaman:** Bug kritik ve sprint'i etkiliyorsa

**Yapılacaklar:**
1. Lead Dev veya Planner Agent'a bildirin
2. Yeni fix task'ları oluşturulur
3. Task'lar mevcut sprint'e eklenir
4. Developer agent'lar fix task'larını çalıştırır

**Lead Dev Agent ile:**
```
Read ai-factory/ai/agents/lead-dev.md and create fix tasks for bug: [bug açıklaması]

Bug Details:
- Location: [dosya yolu, fonksiyon adı]
- Issue: [ne oluyor]
- Expected: [ne olması gerekiyor]
- Priority: [CRITICAL | HIGH | MEDIUM | LOW]
- Affected Task: [task-XXX.md if applicable]
- Sprint ID: [SPRINT_ID]
```

**Planner Agent ile:**
```
Read ai-factory/ai/agents/planner.md and create fix tasks for bug: [bug açıklaması]

Bug Details:
- Location: [dosya yolu, fonksiyon adı]
- Issue: [ne oluyor]
- Expected: [ne olması gerekiyor]
- Priority: [CRITICAL | HIGH | MEDIUM | LOW]
- Affected Task: [task-XXX.md if applicable]
- Sprint ID: [SPRINT_ID]
```

#### Seçenek B: Sonraki Sprint'e Ekle (Kritik Değilse)

**Ne zaman:** Bug kritik değilse ve mevcut sprint'i etkilemiyorsa

**Yapılacaklar:**
1. Feature request olarak kaydedin
2. `runs/features/requests/bug-<NUMBER>.md` oluşturun
3. Product Agent'a bildirin
4. Backlog'a eklenir, sonraki sprint'te ele alınır

**Feature Request Oluşturma:**
1. `runs/features/requests/bug-001.md` dosyası oluştur
2. `ai/features/feature-template.md` template'ini kullan
3. Bug detaylarını doldur
4. STATUS: REQUEST, PRIORITY: [seviye]

**Product Agent'a Bildirme:**
```
I've created a bug fix request: runs/features/requests/bug-001.md
Please review and add it to the backlog.
```

---

## 3. Fix Task'ları Oluşturun

### Fix Task Özellikleri

Fix task'ları normal task'lar gibi oluşturulur, ancak şu özelliklere sahip olmalıdır:

- **ROLE:** İlgili agent (BACKEND, FRONTEND, MOBILE, vb.)
- **DEPENDENCIES:** Gerekirse ilgili task'lara bağımlılık
- **PRIORITY:** Kritik bug'lar için yüksek öncelik
- **DESCRIPTION:** Bug açıklaması ve fix gereksinimleri
- **ACCEPTANCE_CRITERIA:** Bug'ın düzeltildiğini doğrulayan kriterler

**Örnek Fix Task:**
```markdown
TASK_ID: backend-fix-001
TITLE: Fix User validation exception for null email
ROLE: BACKEND
STATUS: TODO
PRIORITY: HIGH

DEPENDENCIES:
- backend-task-001 (if related to original task)

DESCRIPTION:
Fix User validation to return validation error message instead of throwing exception when email is null.

Location: src/api/MyProject.Domain/Entities/User.cs, line 45
Current behavior: Throws exception
Expected behavior: Returns validation error message

ACCEPTANCE_CRITERIA:
- User validation returns error message for null email
- No exception is thrown
- Validation error message is clear and descriptive
- Existing tests pass
- New test added for null email case

OUTPUT:
- src/api/MyProject.Domain/Entities/User.cs (fixed)
- src/api/MyProject.Domain.Tests/Entities/UserTests.cs (new test added)
```

---

## 4. Fix Task'larını Çalıştırın

### Developer Agent Çalıştırma

Fix task'ları oluşturulduktan sonra, ilgili developer agent'ı çalıştırın:

**Backend Bug için (Technology-Specific Agent, e.g., .NET Core Developer):**
```
Read ai-factory/ai/agents/dotnet-core-developer.md and execute.
```

**Legacy Backend Bug için (Backward Compatibility):**
```
Read ai-factory/ai/agents/backend.md and execute.
```

**Frontend Bug için (Technology-Specific Agent, e.g., Angular Developer):**
```
Read ai-factory/ai/agents/angular-developer.md and execute.
```

**Legacy Frontend Bug için (Backward Compatibility):**
```
Read ai-factory/ai/agents/frontend.md and execute.
```

**Note:** Use the appropriate technology-specific agent based on your `project.scope.md` configuration. For legacy projects, you can still use `backend.md` or `frontend.md`.

**Mobile Bug için:**
```
Read ai-factory/ai/agents/mobile.md and execute.
```

**Not:** Agent otomatik olarak READY fix task'larını bulur ve çalıştırır.

---

## 5. Lead Dev Review ve CHANGES_REQUIRED

### Fix Task'ları DONE Olduktan Sonra

1. **Lead Dev Agent otomatik review yapar:**
   - Fix task'ının OUTPUT'larını kontrol eder
   - ACCEPTANCE_CRITERIA'yı doğrular
   - Code quality ve best practices'i kontrol eder

2. **Review Sonucu:**
   - **REVIEW STATUS: APPROVED:** Task onaylandı, QA'ya geçilebilir
   - **REVIEW STATUS: CHANGES_REQUIRED:** Task'ta düzeltmeler gerekli

**CHANGES_REQUIRED durumunda:**
- Task STATUS: DONE'dan TODO'ya değişir
- REVIEW section'da feedback bulunur
- Fix task'ındaki sorunları düzeltin
- Task'ı tekrar DONE yapın
- Lead Dev tekrar review yapar
- REVIEW STATUS: APPROVED olana kadar tekrarlayın

## 6. QA Doğrulaması

### Fix Task'ları APPROVED Olduktan Sonra

1. **QA Agent'ı çalıştırın:**
   ```
   Read ai-factory/ai/agents/qa.md and execute.
   ```

2. **QA Agent fix'i doğrular:**
   - Fix task'ının OUTPUT'larını kontrol eder
   - ACCEPTANCE_CRITERIA'yı doğrular
   - İlgili feature'ın hala çalıştığını kontrol eder
   - Lead Dev review'un tamamlandığını doğrular

3. **QA Sonucu:**
   - **QA PASSED:** Sprint devam eder
   - **QA FAILED:** Tekrar fix gerekir (adım 3'e dön)

**QA FAILED durumunda:**
- `/runs/<SPRINT_ID>/qa.md` dosyasını okuyun
- Blocking issues'ları kontrol edin
- Yeni fix task'ları oluşturun
- Tekrar QA çalıştırın

---

## 7. Özel Durumlar

### Bug Production Kodunda Değilse

**Test, Docs, vb. kodlarda bug varsa:**

- İlgili agent'a bildirin (Test Dev, Docs, vb.)
- Aynı süreç uygulanır
- Fix task'ı ilgili agent'ın ROLE'ü ile oluşturulur

### Bug Birden Fazla Agent'ı Etkiliyorsa

**Örnek:** Backend ve Frontend'i etkileyen bir bug

**Yapılacaklar:**
1. Her agent için ayrı fix task'ı oluşturun
2. Dependency'leri doğru ayarlayın
3. Sırayla çalıştırın (Backend önce, Frontend sonra)

**Örnek:**
```markdown
# Backend Fix Task
TASK_ID: backend-fix-001
ROLE: BACKEND
DEPENDENCIES: []

# Frontend Fix Task
TASK_ID: frontend-fix-001
ROLE: FRONTEND
DEPENDENCIES:
  - backend-fix-001
```

### Bug Kritik ve Acil İse

**Ne zaman:** Bug production'ı durduruyorsa veya kritik güvenlik açığı ise

**Yapılacaklar:**
1. Lead Dev Agent'a acil bildirim yapın
2. Task'lar yüksek öncelikle oluşturulur
3. Mevcut task'lar durdurulabilir (BLOCKED)

**Prompt:**
```
URGENT: Critical bug found that blocks production.

Bug Details:
- Location: [dosya yolu]
- Issue: [ne oluyor]
- Impact: [production blocked, security issue, etc.]
- Priority: CRITICAL

Please create high-priority fix tasks immediately.
```

---

## 8. Bug Tracking (Opsiyonel)

### Bug Request Dosyası Oluşturma

Bug'ı takip etmek için feature request formatında kaydedebilirsiniz:

1. **Dosya oluştur:** `runs/features/requests/bug-<NUMBER>.md`
2. **Template kullan:** `ai/features/feature-template.md`
3. **Doldur:**
   - FEATURE_ID: BUG-001
   - STATUS: FIXED (fix tamamlandıktan sonra)
   - PRIORITY: [seviye]
   - İlgili task'ları referans et

**Örnek Bug Request:**
```markdown
# Feature Request: Fix User validation exception

FEATURE_ID: BUG-001
STATUS: FIXED
PRIORITY: HIGH
CREATED: 2024-01-15
FIXED: 2024-01-15

## SUMMARY
Fix User validation to return error message instead of throwing exception.

## PROBLEM STATEMENT
User validation throws exception for null email, causing application crash.

## PROPOSED SOLUTION
Return validation error message instead of throwing exception.

## RELATED TASKS
- backend-fix-001.md
```

---

## 9. Özet Akış

```
Bug Tespit Edildi
    ↓
Bug Dokümante Edildi
    ↓
Sprint Durumu Kontrol Edildi
    ↓
    ├─ Planning Aşaması → Product Agent'a bildir
    │                      ↓
    │                  Fix task'ları oluşturulur
    │
    └─ Production Aşaması
           ├─ Kritik Bug → Lead Dev/Planner'a bildir
           │                ↓
           │            Fix task'ları oluşturulur
           │                ↓
           │            Developer Agent çalıştırılır
           │                ↓
           │            QA Agent doğrular
           │
           └─ Kritik Değil → Feature request oluştur
                              ↓
                          Backlog'a eklenir
```

---

## 10. Önemli Notlar

### ❌ Yapılmaması Gerekenler

- **Doğrudan kodu düzeltmeyin:** Task sistemi üzerinden ilerleyin
- **Bug'ı dokümante etmeden agent'a bildirmeyin:** Agent'lar dokümantasyona göre çalışır
- **QA doğrulamasını atlamayın:** Fix'in doğru olduğundan emin olun
- **İlgili agent'ı kullanmayın:** Her agent kendi domain'inde çalışır

### ✅ Yapılması Gerekenler

- **Bug'ı detaylı dokümante edin:** Nerede, ne, nasıl, etki
- **Öncelik belirleyin:** Kritik bug'lar önce ele alınır
- **Sprint durumunu kontrol edin:** Planning vs Production
- **Fix task'larını doğru oluşturun:** ROLE, DEPENDENCIES, ACCEPTANCE_CRITERIA
- **QA doğrulamasını yapın:** Fix'in doğru olduğundan emin olun

---

## 11. Hızlı Referans

### Bug Tespit Edildi → Ne Yapmalı?

1. **Bug'ı dokümante et** (nerede, ne, nasıl, etki, öncelik)
2. **Sprint durumunu kontrol et** (planning mi, production mı?)
3. **Fix task'ları oluştur** (Lead Dev veya Planner ile)
4. **Developer agent çalıştır** (ilgili agent'ı çalıştır)
5. **QA doğrula** (QA Agent ile doğrula)

### Kritik Bug → Acil İşlem

```
URGENT: Critical bug found.
Read ai-factory/ai/agents/lead-dev.md and create high-priority fix tasks immediately.

Bug: [açıklama]
Location: [dosya yolu]
Impact: [production blocked, security issue, etc.]
```

### Normal Bug → Normal İşlem

```
I've found a bug: [açıklama]
Please create fix tasks for this bug.

Bug Details:
- Location: [dosya yolu]
- Issue: [ne oluyor]
- Expected: [ne olması gerekiyor]
- Priority: [HIGH | MEDIUM | LOW]
```

---

## 12. İlgili Dokümantasyon

- `guides/AGENT_PROMPTS.md` - Agent prompt'ları
- `guides/TROUBLESHOOTING.md` - Sorun giderme rehberi
- `ai/agents/qa.md` - QA Agent dokümantasyonu
- `ai/agents/lead-dev.md` - Lead Dev Agent dokümantasyonu
- `ai/agents/planner.md` - Planner Agent dokümantasyonu
- `ai/features/README.md` - Feature management rehberi (template dosyalar)

---

**Son Güncelleme:** 2024
