# Feature Management Templates

Feature ve özellik yönetimi için template dosyalar.

**Not:** Bu dosyalar sistem template'leridir. Proje-specific feature'lar için `runs/features/` klasörünü kullanın.

---

## 📁 Template Dosyalar

- `feature-template.md` - Feature request template
- `backlog-template.md` - Feature backlog template

---

## 📁 Proje-Specific Klasör Yapısı

Yeni projeye başlarken, `runs/features/` klasörü şu yapıda olmalı:

```
runs/features/
├── backlog.md (proje-specific backlog - ai/features/backlog-template.md'den kopyala)
└── requests/ (yeni feature request'leri)
    ├── feature-001.md
    ├── feature-002.md
    └── ...
```

---

## 🎯 Feature Lifecycle

1. **REQUEST** → Müşteri feature request oluşturur
2. **REVIEW** → Product Agent review eder
3. **PLANNED** → Sprint'e eklenir veya backlog'a eklenir
4. **IN_PROGRESS** → Sprint'te aktif
5. **DONE** → Tamamlandı ve dokümante edildi

---

## 📋 Feature Request Oluşturma

Müşteri olarak yeni feature istediğinde:

1. `runs/features/requests/` klasörüne yeni dosya oluştur
2. `ai/features/feature-template.md` dosyasını kopyala
3. Feature detaylarını doldur
4. Product Agent'a bildir

**Örnek:**
```
I've created a new feature request: runs/features/requests/feature-001.md
Please review and add it to the backlog.
```

---

## 📊 Feature Backlog Oluşturma

Yeni projeye başlarken:

1. `runs/features/backlog.md` dosyası oluştur
2. `ai/features/backlog-template.md` dosyasını kopyala
3. Proje-specific backlog olarak kullan

**Not:** Product Agent otomatik olarak backlog'u yönetir.

---

## 🔄 Feature'ı Sprint'e Ekleme

### Mevcut Sprint'e Ekleme:
- Product Agent mevcut sprint'in product.md'sini günceller
- Planner Agent yeni task'lar oluşturur

### Yeni Sprint Oluşturma:
- Feature için yeni sprint başlatılır
- Normal sprint flow takip edilir

---

## 📝 Örnek Kullanım

### 1. Yeni Feature Request

```markdown
# Feature Request: User Authentication

FEATURE_ID: FEATURE-001
STATUS: REQUEST
PRIORITY: HIGH

## PROBLEM STATEMENT
Users need to authenticate to access their accounts.

## PROPOSED SOLUTION
Implement JWT-based authentication system.
```

### 2. Product Agent Review

Product Agent feature'ı review eder ve:
- Backlog'a ekler
- Priority belirler
- Sprint'e ekler veya backlog'da tutar

### 3. Sprint'e Ekleme

Feature sprint'e eklendiğinde:
- STATUS: IN_PROGRESS olur
- SPRINT_ID güncellenir
- Task'lar oluşturulur

---

## 🔗 İlgili Dosyalar

- `ai/protocols/feature_management.md` → Detaylı protokol
- `ai/agents/product.md` → Feature review agent'ı
- `guides/AGENT_PROMPTS.md` → Feature request prompt'ları
- `guides/FEATURE_REQUEST.md` → Feature request rehberi
