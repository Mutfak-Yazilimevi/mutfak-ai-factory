# 📁 Dokümanlar Klasörü (Root `/docs/`)

Bu klasör, projenizin analiz, gereksinim ve tasarım dokümanlarını içerir. **Product Agent**, sprint başlatıldığında bu klasördeki tüm dokümanları otomatik olarak okur ve analiz eder.

---

## 🎯 Bu Klasöre Ne Koymalısınız?

### ✅ Koymanız Gerekenler

Bu klasöre **projenizin analiz, tasarım ve gereksinim dokümanlarını** koyun:

#### 1. **Analiz Dokümanları**
- İş analizi notları
- Kullanıcı ihtiyaç analizi
- Pazar araştırması
- Rekabet analizi
- SWOT analizi
- Kullanıcı hikayeleri (user stories)
- Kullanım senaryoları (use cases)

#### 2. **Gereksinim Dokümanları**
- Fonksiyonel gereksinimler
- Fonksiyonel olmayan gereksinimler (performans, güvenlik, ölçeklenebilirlik)
- İş kuralları (business rules)
- Kısıtlar ve sınırlamalar
- Öncelikler ve MVP kapsamı

#### 3. **Tasarım ve Mimari Dokümanları**
- Teknik mimari tasarımı
- Sistem mimarisi diyagramları (açıklamaları)
- Veritabanı şema tasarımı
- API tasarım notları
- Entegrasyon gereksinimleri
- Teknoloji seçimleri ve gerekçeleri

#### 4. **İş Mantığı Dokümanları**
- İş akışları (workflows)
- İş kuralları detayları
- Hesaplama mantıkları
- Validasyon kuralları
- İş süreçleri

#### 5. **Draft ve Notlar**
- İlk taslak fikirler
- Brainstorming notları
- Toplantı notları
- Gelecek özellik fikirleri
- Teknik notlar ve kararlar
- Soru işaretleri ve belirsizlikler

#### 6. **Referans Dokümanları**
- Mevcut sistem dokümantasyonu (eğer migration varsa)
- Üçüncü parti API dokümantasyonu (özet)
- Tasarım referansları
- Örnek uygulamalar ve ilham kaynakları

---

## 📝 Dosya İsimlendirme

### ⚠️ ÖNEMLİ: Dosya İsimleri Tamamen Serbesttir!

**Product Agent, bu klasördeki TÜM `.md` dosyalarını otomatik olarak okur.** Belirli bir dosya ismi beklemez. İstediğiniz isimde, istediğiniz kadar dosya ekleyebilirsiniz.

### ✅ Önerilen Dosya İsimleri (Sadece Örnekler)

Dosya isimlendirmesi tamamen size kalmış, ancak şu örnekler faydalı olabilir:

```
📄 Architecture.md          → Teknik mimari tasarımı
📄 Database.md              → Veritabanı şema tasarımı
📄 BusinessRules.md        → İş kuralları
📄 Requirements.md          → Fonksiyonel gereksinimler
📄 UserStories.md           → Kullanıcı hikayeleri
📄 API-Design.md            → API tasarım notları
📄 Workflows.md             → İş akışları
📄 Analysis.md              → İş analizi
📄 Draft-Notes.md           → İlk taslak notlar
📄 Meeting-Notes.md         → Toplantı notları
📄 Ideas.md                 → Fikirler ve notlar
📄 Constraints.md           → Kısıtlar ve sınırlamalar
📄 Integration.md           → Entegrasyon gereksinimleri
```

**Unutmayın:** Bu isimler sadece örneklerdir. İstediğiniz ismi kullanabilirsiniz!

---

## 🔍 Product Agent Nasıl Kullanır?

### Otomatik Okuma Süreci

1. **Sprint Başlatıldığında:**
   - Product Agent, bu klasördeki **TÜM `.md` dosyalarını** otomatik olarak okur
   - Dosya isimlerine bakmaz, içerikleri analiz eder
   - Her dosyadan gereksinimleri, kuralları ve tasarım kararlarını çıkarır

2. **Analiz ve Çıkarım:**
   - İş kurallarını tespit eder
   - Teknik gereksinimleri belirler
   - Mimari kararları anlar
   - Fonksiyonel gereksinimleri çıkarır
   - Kısıtları ve sınırlamaları tespit eder

3. **Çıktı Üretimi:**
   - `project.scope.md` dosyasını günceller (stack, teknolojiler, kurallar)
   - Sprint dokümanlarını oluşturur (`sprint.md`, `product.md`)
   - Sistem dokümanlarını günceller (`ai-factory/docs/` klasöründe)

### Öncelik Sırası

Product Agent şu sırayla dokümanları okur:

1. **Root `/docs/` klasörü** (bu klasör) - **ÖNCELİKLİ**
2. `ai-factory/docs/` klasörü (sistem dokümanları)

**Müşteri dokümanları (bu klasör) her zaman önceliklidir!**

---

## 💡 İpuçları ve En İyi Uygulamalar

### ✅ Yapılması Gerekenler

1. **Detaylı Olun:**
   - Ne kadar detaylı yazarsanız, Product Agent o kadar iyi anlar
   - Belirsizlikleri ve soru işaretlerini de not edin
   - Örnekler ve senaryolar ekleyin

2. **Yapılandırılmış Yazın:**
   - Markdown formatını kullanın (başlıklar, listeler, tablolar)
   - Net başlıklar kullanın
   - Önemli bilgileri vurgulayın

3. **Güncel Tutun:**
   - Dokümanları güncel tutun
   - Eski veya geçersiz bilgileri kaldırın
   - Değişiklikleri not edin

4. **Draft Notlarını Ekleyin:**
   - İlk taslak fikirlerinizi ekleyin
   - Henüz netleşmemiş konuları belirtin
   - Gelecek özellik fikirlerini not edin

### ❌ Yapılmaması Gerekenler

1. **Kod Örnekleri Eklemeyin:**
   - Bu klasör gereksinim ve tasarım için, kod için değil
   - Kod örnekleri gerekiyorsa, sadece mantığı açıklayın

2. **Çok Fazla Teknik Detay:**
   - Mimari kararları açıklayın ama implementasyon detaylarını değil
   - "Nasıl" yerine "ne" ve "neden" odaklı olun

3. **Gereksiz Dosyalar:**
   - Eski veya geçersiz dokümanları kaldırın
   - Test dosyaları veya geçici notları temizleyin

---

## 📋 Doküman Şablonları

### Analiz Dokümanı Şablonu

```markdown
# [Proje/Özellik] Analizi

## Problem
[Çözülmesi gereken problemi açıklayın]

## Hedef Kitle
[Kimler kullanacak?]

## Çözüm Önerisi
[Genel çözüm yaklaşımı]

## Başarı Kriterleri
[Nasıl başarılı sayılacak?]

## Kısıtlar
[Zaman, bütçe, teknik kısıtlar]
```

### Gereksinim Dokümanı Şablonu

```markdown
# [Özellik] Gereksinimleri

## Fonksiyonel Gereksinimler
- [Gereksinim 1]
- [Gereksinim 2]

## Fonksiyonel Olmayan Gereksinimler
- Performans: [Gereksinim]
- Güvenlik: [Gereksinim]
- Ölçeklenebilirlik: [Gereksinim]

## İş Kuralları
- [Kural 1]
- [Kural 2]

## Kullanıcı Senaryoları
1. [Senaryo 1]
2. [Senaryo 2]
```

### Mimari Dokümanı Şablonu

```markdown
# Teknik Mimari

## Genel Mimari
[Yüksek seviye mimari açıklaması]

## Teknoloji Seçimleri
- Backend: [Teknoloji] - [Gerekçe]
- Frontend: [Teknoloji] - [Gerekçe]
- Database: [Teknoloji] - [Gerekçe]

## Mimari Kararlar
- [Karar 1] - [Gerekçe]
- [Karar 2] - [Gerekçe]

## Entegrasyonlar
- [Entegrasyon 1]
- [Entegrasyon 2]
```

---

## 🚀 Hızlı Başlangıç

### Yeni Projeye Başlarken

1. **Bu klasöre analiz dokümanlarınızı ekleyin:**
   - İş analizi
   - Gereksinimler
   - İlk tasarım notları

2. **Draft notlarınızı ekleyin:**
   - Henüz netleşmemiş fikirler
   - Soru işaretleri
   - Gelecek özellik fikirleri

3. **Product Agent'ı çalıştırın:**
   - Product Agent otomatik olarak tüm dosyaları okuyacak
   - Analiz edecek ve sprint dokümanlarını oluşturacak

### Mevcut Projeye Eklemeler Yaparken

1. **Yeni özellik dokümanlarını ekleyin**
2. **Mevcut dokümanları güncelleyin**
3. **Draft notlarınızı paylaşın**

---

## 📚 İlgili Dokümanlar

- **Hızlı Başlangıç:** `ai-factory/guides/QUICK_START.md`
- **Yeni Proje Başlatma:** `ai-factory/ai/protocols/new_project_initialization.md`
- **Product Agent:** `ai-factory/ai/agents/product.md`

---

## ❓ Sık Sorulan Sorular

### Q: Kaç dosya ekleyebilirim?
**A:** İstediğiniz kadar. Product Agent tüm `.md` dosyalarını okur.

### Q: Dosya isimleri önemli mi?
**A:** Hayır. İstediğiniz ismi kullanabilirsiniz. Product Agent içeriği analiz eder.

### Q: Draft notlar ekleyebilir miyim?
**A:** Evet! Henüz netleşmemiş fikirler, soru işaretleri ve gelecek özellik fikirlerini ekleyebilirsiniz.

### Q: Eski dokümanları ne yapmalıyım?
**A:** Geçersiz veya eski dokümanları kaldırın. Product Agent güncel bilgileri kullanır.

### Q: Kod örnekleri ekleyebilir miyim?
**A:** Gerekirse mantığı açıklayın ama implementasyon detaylarını değil. Bu klasör gereksinim ve tasarım için.

---

## 🎯 Özet

**Bu klasör, projenizin beynidir.** Tüm analiz, gereksinim, tasarım ve draft notlarınızı buraya koyun. Product Agent, bu dokümanları okuyarak projenizi anlayacak ve sprint dokümanlarını oluşturacaktır.

**Unutmayın:**
- ✅ Dosya isimleri serbest
- ✅ İstediğiniz kadar dosya ekleyebilirsiniz
- ✅ Draft notlarınızı da ekleyin
- ✅ Detaylı yazın, Product Agent daha iyi anlar
- ✅ Güncel tutun

**Hazır olduğunuzda, Product Agent'ı çalıştırın ve sihrin başlamasını izleyin! ✨**
