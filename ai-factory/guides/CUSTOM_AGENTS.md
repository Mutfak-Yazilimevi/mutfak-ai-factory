# Custom Agents Guide

Projeye özel agent'ların nasıl kullanılacağı rehberi.

---

## 🤖 Custom Agent Nedir?

Custom Agent, projeye özel domain'ler için Product Agent tarafından otomatik olarak tespit edilen ve eklenen özel agent'lardır.

**Custom Agent örnekleri:**
- **IoT Agent:** IoT cihaz entegrasyonu, embedded systems
- **Blockchain Agent:** Smart contracts, cryptocurrency, distributed ledger
- **Game Dev Agent:** Game engines, game mechanics, game design
- **Data Engineering Agent:** ETL pipelines, data warehouses (AI_ML kapsamı dışında)
- **Integration Agent:** Third-party integrations (OPS kapsamı dışında)

**Custom Agent ne zaman eklenir?**
- Domain özel bilgi gerektiriyorsa
- Domain için birden fazla task gerekiyorsa
- Domain'in kendine özgü pattern'leri varsa

---

## 🔍 Custom Agent Tespiti

### Product Agent Otomatik Tespit

Product Agent, root `/docs/` klasörünü analiz ederken şunları arar:

**IoT/Embedded:**
- IoT devices, embedded systems, hardware integration
- Sensor data, device communication
- Firmware, hardware protocols

**Blockchain:**
- Blockchain, smart contracts, cryptocurrency
- Distributed ledger, consensus algorithms
- Wallet integration, token management

**Game Development:**
- Game engines (Unity, Unreal, etc.)
- Game mechanics, game design
- Game physics, rendering

**Data Engineering:**
- ETL pipelines, data warehouses
- Big data processing (beyond AI_ML scope)
- Data integration, data transformation

**Integration:**
- Third-party API integrations
- System integrations (beyond OPS scope)
- External service integrations

### Custom Agent Ekleme

Product Agent otomatik olarak:
1. Root `/docs/` klasörünü analiz eder
2. Özel domain'leri tespit eder
3. `project.scope.md`'ye CUSTOM_AGENTS bölümü ekler
4. Sprint initialization'da custom agent klasörü oluşturur

**Örnek project.scope.md:**
```yaml
CUSTOM_AGENTS:
  IOT: ACTIVE
  BLOCKCHAIN: ACTIVE
  GAME_DEV: ACTIVE
```

---

## 📁 Custom Agent Yapısı

### Naming Convention

**project.scope.md'de:**
- Format: UPPERCASE_WITH_UNDERSCORES
- Örnek: `IOT`, `BLOCKCHAIN`, `GAME_DEV`, `DATA_ENG`

**Task klasörlerinde:**
- Format: lowercase-with-hyphens
- Örnek: `iot/`, `blockchain/`, `game-dev/`, `data-eng/`

**Task dosyalarında:**
- ROLE: UPPERCASE_WITH_UNDERSCORES
- Örnek: `ROLE: IOT`, `ROLE: BLOCKCHAIN`

### Klasör Yapısı

```
runs/<SPRINT_ID>/
  └── tasks/
      ├── dotnet-core/ (or other backend technology folders)
      ├── angular/ (or other frontend framework folders)
      ├── react-native/
      ├── designer/
      ├── database/
      ├── test-dev/
      ├── security/
      ├── ops/
      ├── ai-ml/
      ├── backend/ (legacy - for backward compatibility)
      ├── frontend/ (legacy - for backward compatibility)
      └── iot/              # Custom agent (lowercase-with-hyphens)
          ├── task-001.md
          └── task-002.md
```

---

## 🚀 Custom Agent Kullanımı

### 1. Custom Agent'ı Kontrol Et

**project.scope.md'yi kontrol et:**
```
Read ai-factory/ai/project.scope.md

Check CUSTOM_AGENTS section to see if any custom agents are defined.
```

**Örnek çıktı:**
```yaml
CUSTOM_AGENTS:
  IOT: ACTIVE
  BLOCKCHAIN: ACTIVE
```

### 2. Custom Agent Task'larını Kontrol Et

**Task klasörünü kontrol et:**
```
Check runs/<SPRINT_ID>/tasks/iot/ directory
Verify custom agent tasks exist
```

### 3. Custom Agent'ı Çalıştır

**Temel kullanım:**
```
Read ai-factory/ai/agents/custom-agent-template.md and execute for custom agent: IOT.
```

**SPRINT_ID belirtilerek:**
```
Read ai-factory/ai/agents/custom-agent-template.md and execute for custom agent: IOT and SPRINT_ID: 001.
```

**Not:** Agent name'i project.scope.md'deki format ile belirtin (UPPERCASE_WITH_UNDERSCORES).

---

## 📋 Custom Agent Task Oluşturma

### Planner Agent ile

Planner Agent otomatik olarak:
1. CUSTOM_AGENTS bölümünü okur
2. Custom agent'lar için task'lar oluşturur
3. Task'ları doğru klasöre yerleştirir

**Task formatı:**
```markdown
TASK_ID: IOT-001
TITLE: Implement IoT device connection
ROLE: IOT
STATUS: TODO

DEPENDENCIES:
- backend-001 (if needs backend support)

DESCRIPTION:
Implement connection to IoT device using MQTT protocol.

OUTPUT:
- src/api/MyProject.IoT/Connectors/MqttConnector.cs
- src/api/MyProject.IoT/Models/DeviceMessage.cs

ACCEPTANCE_CRITERIA:
- Device connection established
- MQTT messages received
- Device data parsed correctly
```

### Manuel Task Oluşturma

Eğer Planner Agent custom agent task'ları oluşturmadıysa:

1. **Task dosyası oluştur:** `runs/<SPRINT_ID>/tasks/iot/task-001.md`
2. **Template kullan:** `ai/protocols/task_format.md`
3. **ROLE belirt:** `ROLE: IOT` (UPPERCASE_WITH_UNDERSCORES)
4. **Planner Agent'a bildir:** Planner Agent task'ı review eder

---

## 🔗 Custom Agent Dependencies

### Standard Agent'lara Bağımlılık

Custom agent task'ları standard agent task'larına bağımlı olabilir:

**Örnek:**
```markdown
TASK_ID: IOT-001
ROLE: IOT
DEPENDENCIES:
  - backend-001  # Backend API must exist
  - database-001 # Database schema must exist
```

### Custom Agent'lar Arası Bağımlılık

Custom agent task'ları diğer custom agent task'larına bağımlı olabilir:

**Örnek:**
```markdown
TASK_ID: blockchain-002
ROLE: BLOCKCHAIN
DEPENDENCIES:
  - blockchain-001 # Previous blockchain task
  - iot-001        # IoT integration needed
```

---

## 🎯 Custom Agent Örnekleri

### IoT Agent Örneği

**project.scope.md:**
```yaml
CUSTOM_AGENTS:
  IOT: ACTIVE
```

**Task örneği:**
```markdown
TASK_ID: IOT-001
ROLE: IOT
DESCRIPTION: Implement MQTT connector for IoT devices
OUTPUT: src/api/MyProject.IoT/Connectors/MqttConnector.cs
```

**Çalıştırma:**
```
Read ai-factory/ai/agents/custom-agent-template.md and execute for custom agent: IOT.
```

### Blockchain Agent Örneği

**project.scope.md:**
```yaml
CUSTOM_AGENTS:
  BLOCKCHAIN: ACTIVE
```

**Task örneği:**
```markdown
TASK_ID: BLOCKCHAIN-001
ROLE: BLOCKCHAIN
DESCRIPTION: Implement smart contract interface
OUTPUT: src/api/MyProject.Blockchain/Contracts/PaymentContract.cs
```

**Çalıştırma:**
```
Read ai-factory/ai/agents/custom-agent-template.md and execute for custom agent: BLOCKCHAIN.
```

### Game Dev Agent Örneği

**project.scope.md:**
```yaml
CUSTOM_AGENTS:
  GAME_DEV: ACTIVE
```

**Task örneği:**
```markdown
TASK_ID: GAME_DEV-001
ROLE: GAME_DEV
DESCRIPTION: Implement game physics engine integration
OUTPUT: src/api/MyProject.GameDev/Physics/PhysicsEngine.cs
```

**Çalıştırma:**
```
Read ai-factory/ai/agents/custom-agent-template.md and execute for custom agent: GAME_DEV.
```

---

## ⚠️ Önemli Notlar

### ✅ Yapılması Gerekenler

- **Agent name format:** UPPERCASE_WITH_UNDERSCORES kullan (IOT, BLOCKCHAIN)
- **Task ROLE format:** UPPERCASE_WITH_UNDERSCORES kullan (ROLE: IOT)
- **Klasör format:** lowercase-with-hyphens kullan (iot/, blockchain/)
- **Dependencies:** Custom agent task'ları standard agent task'larına bağımlı olabilir

### ❌ Yapılmaması Gerekenler

- **Agent name format hatası:** `iot` yerine `IOT` kullan
- **Task ROLE format hatası:** `Role: iot` yerine `ROLE: IOT` kullan
- **Klasör format hatası:** `IOT/` yerine `iot/` kullan
- **Custom agent template'i değiştirme:** Template'i değiştirme, sadece kullan

---

## 🔍 Custom Agent Sorun Giderme

### Problem: Custom agent bulunamıyor

**Çözüm:**
1. `project.scope.md`'de CUSTOM_AGENTS bölümünü kontrol et
2. Agent name format'ını kontrol et (UPPERCASE_WITH_UNDERSCORES)
3. Task klasörünün var olduğunu kontrol et (lowercase-with-hyphens)
4. Product Agent'ın sprint initialization yaptığını kontrol et

### Problem: Custom agent task'ları oluşturulmuyor

**Çözüm:**
1. Planner Agent'ın CUSTOM_AGENTS bölümünü okuduğunu kontrol et
2. Planner Agent'ı tekrar çalıştır
3. Manuel olarak task oluştur ve Planner Agent'a bildir

### Problem: Custom agent çalışmıyor

**Çözüm:**
1. Custom agent template'i doğru kullandığını kontrol et
2. Agent name'i doğru belirttiğini kontrol et
3. Task klasörünün doğru olduğunu kontrol et
4. Task'ların READY olduğunu kontrol et

---

## 📚 İlgili Dokümantasyon

- `ai/agents/custom-agent-template.md` - Custom agent template
- `ai/agents/product.md` - Product Agent (custom agent tespiti)
- `ai/agents/planner.md` - Planner Agent (custom agent task oluşturma)
- `ai/project.scope.md` - CUSTOM_AGENTS bölümü
- `ai/protocols/task_format.md` - Task format (custom agent ROLE)
- `guides/AGENT_PROMPTS.md` - Custom agent prompt'ları
- `guides/TROUBLESHOOTING.md` - Custom agent sorun giderme

---

## 🚀 Hızlı Başlangıç

### 1. Custom Agent Kontrolü
```
Read ai-factory/ai/project.scope.md
Check CUSTOM_AGENTS section
```

### 2. Custom Agent Çalıştırma
```
Read ai-factory/ai/agents/custom-agent-template.md and execute for custom agent: <AGENT_NAME>.
```

### 3. Custom Agent Task Kontrolü
```
Check runs/<SPRINT_ID>/tasks/<agent-name>/ directory
Verify tasks exist and are READY
```

---

**Son Güncelleme:** 2024
