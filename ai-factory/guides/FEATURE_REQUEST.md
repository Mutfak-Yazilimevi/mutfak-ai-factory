# Feature Request Guide

Yeni feature, özellik veya düzenleme istediğinizde izlemeniz gereken adımlar.

---

## 🎯 Feature Request Nedir?

Feature Request, projeye yeni bir özellik, iyileştirme veya değişiklik eklemek için kullanılan resmi süreçtir.

**Feature Request kullanım durumları:**
- Yeni özellik ekleme
- Mevcut özelliği iyileştirme
- Yeni entegrasyon ekleme
- UI/UX iyileştirmeleri
- Performance optimizasyonları
- Kritik olmayan bug fix'ler

**Feature Request kullanılmaması gereken durumlar:**
- Kritik bug fix'ler (use `guides/BUG_FIX.md`)
- Acil güvenlik açıkları (use `guides/BUG_FIX.md`)
- Sprint içinde hızlı düzeltmeler

---

## 📋 Feature Request Oluşturma

### Adım 1: Feature Request Dosyası Oluştur

1. **Dosya oluştur:** `runs/features/requests/feature-<NUMBER>.md`
   - `<NUMBER>`: Sıralı numara (001, 002, 003, ...)
   - Örnek: `feature-001.md`, `feature-002.md`

2. **Template kullan:** `ai/features/feature-template.md` dosyasını kopyala

3. **Dosyayı doldur:**
   - FEATURE_ID: FEATURE-001
   - STATUS: REQUEST
   - PRIORITY: HIGH | MEDIUM | LOW
   - Problem statement
   - Proposed solution
   - User stories
   - Acceptance criteria
   - Technical considerations

### Adım 2: Feature Request İçeriği

**Zorunlu Bölümler:**

```markdown
FEATURE_ID: FEATURE-001
STATUS: REQUEST
PRIORITY: HIGH | MEDIUM | LOW
CREATED: <Date>
REQUESTED_BY: <Your Name>

## SUMMARY
<One sentence description>

## PROBLEM STATEMENT
**What problem does this feature solve?**
- Problem 1
- Problem 2

**Who is affected by this problem?**
- User group 1
- User group 2

## PROPOSED SOLUTION
**What should the feature do?**
- Solution point 1
- Solution point 2

**What should NOT be included?**
- Out of scope 1
- Out of scope 2

## USER STORIES
**As a** <user type>
**I want to** <action>
**So that** <benefit>

## ACCEPTANCE CRITERIA
- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Criterion 3

## TECHNICAL CONSIDERATIONS
**Affected Systems:**
- System/Component 1
- System/Component 2

**Dependencies:**
- Dependency 1
- Dependency 2

**Breaking Changes:**
- Yes/No
- Description if yes
```

### Adım 3: Product Agent'a Bildir

**Cursor Chat'te Product Agent'a şunu söyle:**

```
Read ai-factory/ai/agents/product.md and execute.

I've created a new feature request: runs/features/requests/feature-001.md
Please review and add it to the backlog or current sprint.
```

---

## 🔄 Product Agent İşlemi

Product Agent otomatik olarak:

1. **Feature'ı review eder:**
   - Completeness kontrolü
   - Clarity kontrolü
   - Technical feasibility değerlendirmesi

2. **Priority belirler:**
   - **HIGH:** Critical business need, blocks other work
   - **MEDIUM:** Important but not blocking
   - **LOW:** Nice to have, can wait

3. **Sprint kararı verir:**
   - **Mevcut Sprint'e Ekle:** Feature sprint goal'a uyuyorsa ve sprint planning aşamasındaysa
   - **Backlog'a Ekle:** Feature sprint goal'a uymuyorsa veya sprint production aşamasındaysa

4. **Backlog günceller:**
   - `runs/features/backlog.md` dosyasını günceller
   - Feature'ı listeye ekler
   - Priority ve status bilgilerini ekler

---

## 📊 Feature Lifecycle

### 1. REQUEST
- Feature request oluşturuldu
- Product Agent review bekleniyor

### 2. REVIEW
- Product Agent feature'ı review ediyor
- Priority belirleniyor
- Sprint assignment kararı veriliyor

### 3. PLANNED
- Feature backlog'a eklendi
- Veya mevcut sprint'e eklendi
- Task'lar oluşturulacak

### 4. IN_PROGRESS
- Feature sprint'te aktif
- Task'lar çalıştırılıyor
- Development devam ediyor

### 5. DONE
- Feature tamamlandı
- QA PASSED
- Dokümante edildi

### 6. DEFERRED (Opsiyonel)
- Feature ertelendi
- Gelecek sprint'lerde ele alınacak

---

## 🎯 Sprint'e Ekleme Süreci

### Mevcut Sprint'e Ekleme

**Koşullar:**
- Sprint planning aşamasında (Product/Architect/Planner)
- Feature sprint goal'a uyuyor
- Sprint scope'u aşmıyor

**Süreç:**
1. Product Agent `product.md`'yi günceller
2. Architect Agent (gerekirse) architecture'ı günceller
3. Planner Agent yeni task'lar oluşturur
4. Normal sprint flow devam eder

**Prompt:**
```
Read ai-factory/ai/agents/product.md and execute.

I've created a new feature request: runs/features/requests/feature-001.md
Please add it to the current sprint if it fits the sprint goal.
```

### Yeni Sprint Oluşturma

**Koşullar:**
- Feature mevcut sprint'e uymuyor
- Feature büyük ve kapsamlı
- Feature için özel sprint gerekli

**Süreç:**
1. Feature backlog'da kalır
2. Sonraki sprint planlanırken ele alınır
3. Product Agent yeni sprint'te feature'ı ekler

---

## 📝 Örnek Feature Request

```markdown
# Feature Request: User Profile Management

FEATURE_ID: FEATURE-001
STATUS: REQUEST
PRIORITY: HIGH
CREATED: 2024-01-15
REQUESTED_BY: Customer

## SUMMARY
Allow users to view and edit their profile information including name, email, and avatar.

## PROBLEM STATEMENT
**What problem does this feature solve?**
- Users cannot view their profile information
- Users cannot update their profile
- No way to manage user preferences

**Who is affected by this problem?**
- All registered users
- Users who want to update their information

## PROPOSED SOLUTION
**What should the feature do?**
- Display user profile page with current information
- Allow editing name, email, and avatar
- Save changes to database
- Show success/error messages

**What should NOT be included?**
- Password change (separate feature)
- Email verification (separate feature)
- Social media integration (future feature)

## USER STORIES
**As a** registered user
**I want to** view my profile information
**So that** I can see what information is stored about me

**As a** registered user
**I want to** edit my profile information
**So that** I can keep my information up to date

## ACCEPTANCE CRITERIA
- [ ] User can view profile page
- [ ] User can edit name, email, and avatar
- [ ] Changes are saved to database
- [ ] Success message shown after save
- [ ] Error message shown if save fails
- [ ] Validation prevents invalid data

## TECHNICAL CONSIDERATIONS
**Affected Systems:**
- Backend API (user endpoints)
- Frontend (profile page)
- Database (user table)

**Dependencies:**
- User authentication must be implemented
- User entity must exist

**Breaking Changes:**
- No
```

---

## 🔍 Feature Request Takibi

### Backlog Kontrolü

`runs/features/backlog.md` dosyasını kontrol ederek:
- Feature'ların durumunu görebilirsiniz
- Priority'leri görebilirsiniz
- Sprint assignment'ları görebilirsiniz

### Feature Status Güncelleme

Feature request dosyasında STATUS'u güncelleyin:
- REQUEST → Product Agent review bekliyor
- PLANNED → Backlog'a eklendi veya sprint'e eklendi
- IN_PROGRESS → Sprint'te aktif
- DONE → Tamamlandı
- DEFERRED → Ertelendi

---

## ⚠️ Önemli Notlar

### ✅ Yapılması Gerekenler

- **Detaylı açıklama:** Problem ve solution'ı net açıkla
- **User stories:** Kullanıcı perspektifinden düşün
- **Acceptance criteria:** Test edilebilir kriterler belirle
- **Technical considerations:** Teknik etkileri düşün
- **Priority belirle:** Önceliği doğru belirle

### ❌ Yapılmaması Gerekenler

- **Vague açıklamalar:** "Make it better" gibi belirsiz ifadeler
- **Implementation detayları:** Nasıl yapılacağını değil, ne yapılacağını söyle
- **Çok fazla feature:** Bir feature request'te tek bir feature olmalı
- **Sprint içinde değişiklik:** Production aşamasında feature ekleme (kritik değilse)

---

## 🚀 Hızlı Başlangıç

### 1. Feature Request Oluştur
```
1. runs/features/requests/feature-001.md oluştur
2. ai/features/feature-template.md'yi kopyala
3. Feature detaylarını doldur
```

### 2. Product Agent'a Bildir
```
Read ai-factory/ai/agents/product.md and execute.

I've created a new feature request: runs/features/requests/feature-001.md
Please review and add it to the backlog or current sprint.
```

### 3. Takip Et
```
runs/features/backlog.md dosyasını kontrol et
Feature'ın durumunu takip et
```

---

## 📚 İlgili Dokümantasyon

- `ai/features/README.md` - Feature management rehberi (template dosyalar)
- `ai/features/feature-template.md` - Feature request template
- `ai/protocols/feature_management.md` - Feature management protokolü
- `ai/agents/product.md` - Product Agent dokümantasyonu
- `guides/AGENT_PROMPTS.md` - Feature request prompt'ları
- `guides/BUG_FIX.md` - Bug fix rehberi (kritik bug'lar için)

---

**Son Güncelleme:** 2024
