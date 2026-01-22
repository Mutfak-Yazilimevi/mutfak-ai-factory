# Troubleshooting Guide

Common issues and solutions for the AI Software Factory.

## 🚨 Agent Fails to Start

### Problem: Agent cannot find required files

**Symptoms:**
- Agent reports missing input files
- Agent stops execution immediately

**Solutions:**
1. Verify SPRINT_ID folder exists: `/runs/<SPRINT_ID>/`
2. Check required files exist:
   - `/runs/<SPRINT_ID>/sprint.md`
   - `/runs/<SPRINT_ID>/product.md` (for Architect and later)
   - `/runs/<SPRINT_ID>/architecture.md` (for Planner and later)
3. Verify file paths are correct (case-sensitive on some systems)
4. Check `ai/project.scope.md` exists

### Problem: Agent cannot read docs/

**Solutions:**
1. Verify root `/docs/` folder exists (same level as ai-factory/)
2. Verify `ai-factory/docs/` folder exists
3. Check file permissions

---

## 🔄 Task Stuck in IN_PROGRESS

### Problem: Task marked IN_PROGRESS but never completed

**Symptoms:**
- Task STATUS: IN_PROGRESS
- No COMPLETION section
- Agent not working on it

**Solutions:**
1. Check if agent is still running (may have been interrupted)
2. Manually review task file for errors
3. If task is abandoned:
   - Mark STATUS: BLOCKED
   - Add BLOCKED_REASON
   - Create new task or reassign
4. Resume task:
   - Agent can resume IN_PROGRESS tasks
   - Re-run agent with same SPRINT_ID

---

## ⛔ Circular Dependency Detected

### Problem: Planner creates tasks with circular dependencies

**Symptoms:**
- Task A depends on Task B
- Task B depends on Task A
- System cannot proceed

**Solutions:**
1. Lead Dev should detect during Plan Review
2. Mark one task as BLOCKED
3. Notify Planner to fix dependency structure
4. Planner recreates tasks with correct dependencies

---

## 🚫 No READY Tasks Available

### Problem: All tasks are TODO but none are READY

**Symptoms:**
- Developer agent finds no READY tasks
- All tasks have dependencies not yet DONE

**Solutions:**
1. Check dependency chain:
   - Find tasks with no dependencies (should be READY)
   - Verify those tasks are not BLOCKED
2. Check if dependencies are actually DONE:
   - Verify dependent tasks have STATUS: DONE
   - Check COMPLETION section exists
3. Lead Dev should verify Dependency Engine is working
4. Manually check if any task should be READY

---

## ❌ QA Failed

### Problem: QA Agent reports STATUS: FAILED

**Solutions:**
1. Read `/runs/<SPRINT_ID>/qa.md` for blocking issues
2. Create fix tasks (see QA Agent recovery process)
3. Execute fix tasks
4. Re-run QA Agent
5. Repeat until QA STATUS: PASSED

**Do NOT:**
- Skip QA verification
- Mark sprint as complete if QA FAILED
- Ignore blocking issues

---

## 🔄 CHANGES_REQUIRED Workflow

### Problem: Task marked CHANGES_REQUIRED by Lead Dev

**Symptoms:**
- Task STATUS changed from DONE to TODO
- REVIEW section shows STATUS: CHANGES_REQUIRED
- Task needs fixes before approval

**Solutions:**
1. Read task file's REVIEW section for feedback
2. Fix all issues mentioned in review
3. Update task files/outputs as needed
4. Mark task STATUS: DONE again after fixes
5. Lead Dev will review again
6. Repeat until REVIEW STATUS: APPROVED

**Do NOT:**
- Ignore CHANGES_REQUIRED feedback
- Mark task DONE without fixing issues
- Skip Lead Dev review after fixes

---

## 📝 Review Summary File (review.md)

### Problem: review.md file missing or outdated

**Symptoms:**
- `/runs/<SPRINT_ID>/review.md` doesn't exist
- Review summary information not available

**Solutions:**
1. **Note:** review.md is optional - not required
2. Primary review information is in each task file's REVIEW section
3. If you want a summary, ask Lead Dev to create/update review.md:
   ```
   Read ai-factory/ai/agents/lead-dev.md and create/update review.md summary.
   ```

**Format (if created):**
- See `guides/BEST_PRACTICES.md` for review.md format
- Contains high-level review status
- Tracks blockers and CHANGES_REQUIRED tasks

---

## 📁 Wrong File Paths

### Problem: Agent cannot find files with correct paths

**Solutions:**
1. Verify you're in the correct working directory
2. Use absolute paths if relative paths fail
3. Check path separators (Windows: `\`, Unix: `/`)
4. Verify SPRINT_ID matches folder name exactly

---

## 🔀 Multiple Sprints Confusion

### Problem: Working on wrong sprint

**Symptoms:**
- Agent reads wrong sprint files
- Tasks created in wrong sprint folder

**Solutions:**
1. Always specify SPRINT_ID in prompts
2. Verify SPRINT_ID before running agents
3. Check current working directory
4. Use full paths: `/runs/<SPRINT_ID>/...`

---

## 🐛 Agent Produces Wrong Output

### Problem: Agent creates files in wrong location or wrong format

**Solutions:**
1. Verify agent read the correct agent.md file
2. Check agent's OUTPUTS section for allowed files
3. Review agent's rules and constraints
4. If wrong output created:
   - Delete incorrect files
   - Re-run agent with correct context
   - Verify agent read all required inputs

---

## 📝 Task Format Errors

### Problem: Task file doesn't follow format

**Symptoms:**
- Missing required fields (TASK_ID, ROLE, STATUS)
- Wrong STATUS values
- Missing DEPENDENCIES section

**Solutions:**
1. Check `ai/protocols/task_format.md` for correct format
2. Planner should create tasks in correct format
3. If task format is wrong:
   - Lead Dev should fix during Plan Review
   - Or manually fix task file
   - Verify format matches template

---

## 🔍 Dependency Engine Not Working

### Problem: DONE tasks don't make dependent tasks READY

**Solutions:**
1. Lead Dev should manually check dependencies
2. Verify all dependencies are actually DONE
3. Check task DEPENDENCIES section lists correct TASK_IDs
4. Manually update dependent tasks if needed
5. Re-run Lead Dev Execution Review phase

---

## 💡 General Tips

1. **Always check SPRINT_ID:** Verify you're working on the correct sprint
2. **Read agent files first:** Before running agent, read its .md file
3. **Check file existence:** Verify required input files exist before running agent
4. **Follow order:** Don't skip steps in START_SPRINT.md
5. **Check status:** Regularly check sprint status using guides/SPRINT_STATUS.md template

---

## 🗄️ Database Agent Issues

### Problem: Database migration fails

**Symptoms:**
- Migration script has errors
- Database schema not updated
- Migration cannot be reversed

**Solutions:**
1. Check migration script syntax
2. Verify migration is reversible (up and down)
3. Check database connection settings
4. Review migration order (sequential numbering)
5. Test migration on development database first

### Problem: Database schema conflicts

**Solutions:**
1. Check for duplicate table/column names
2. Verify foreign key constraints
3. Review migration dependencies
4. Ensure migrations are sequential

---

## 🧪 Test Dev Agent Issues

### Problem: Tests fail after code changes

**Symptoms:**
- Tests pass initially
- Tests fail after production code changes
- Test coverage decreases

**Solutions:**
1. Update tests when production code changes
2. Verify test dependencies are correct
3. Check test fixtures and mocks
4. Review test isolation (tests should be independent)
5. Re-run Test Dev Agent after production code changes

### Problem: Test coverage too low

**Solutions:**
1. Review which code is not covered
2. Create additional test tasks
3. Focus on critical paths first
4. Don't aim for 100% coverage (focus on meaningful coverage)

---

## 🔒 Security Agent Issues

### Problem: Security audit finds vulnerabilities

**Symptoms:**
- Security Agent reports vulnerabilities
- Security configurations missing
- Security best practices not followed

**Solutions:**
1. Review security audit report
2. Create fix tasks for each vulnerability
3. Prioritize critical security issues
4. Review security configurations
5. Re-run Security Agent after fixes

### Problem: Security secrets exposed

**Solutions:**
1. Immediately remove secrets from code
2. Use environment variables or secret management
3. Review all code for hardcoded secrets
4. Update security configurations
5. Rotate any exposed secrets

---

## 🎨 Designer Agent Issues

### Problem: Design specs not followed by Frontend/React Native

**Symptoms:**
- Frontend/React Native code doesn't match design specs
- Design tokens not used
- Component specs ignored

**Solutions:**
1. Verify Designer Agent tasks are DONE
2. Check Frontend/React Native Agent read design specs (use appropriate technology-specific agent: Angular Developer, React Developer, etc.)
3. Review design specs location (`src/web/design/` or `src/mobile/design/`)
4. Ensure design specs are complete
5. Re-run Designer Agent if specs incomplete

---

## 🔧 Technology-Specific Agent Issues

### Problem: Wrong technology-specific agent used

**Symptoms:**
- Agent creates code in wrong technology
- Code doesn't match project.scope.md configuration
- Wrong framework patterns used

**Solutions:**
1. Verify project.scope.md configuration:
   - Check BACKEND section for active technologies
   - Check FRONTEND section for active frameworks
2. Use correct technology-specific agent:
   - .NET Core → dotnet-core-developer.md
   - Java → java-developer.md
   - Python → python-developer.md
   - Node.js → nodejs-developer.md
   - Angular → angular-developer.md
   - React → react-developer.md
   - Vue → vue-developer.md
3. Verify task ROLE matches agent:
   - DOTNET_CORE_DEVELOPER → dotnet-core-developer.md
   - JAVA_DEVELOPER → java-developer.md
   - ANGULAR_DEVELOPER → angular-developer.md
   - REACT_DEVELOPER → react-developer.md

### Problem: Multiple technology agents conflict

**Symptoms:**
- Multiple backend agents working on same task
- Code conflicts between technologies
- Task dependencies unclear

**Solutions:**
1. Verify task ROLE is technology-specific
2. Ensure tasks are assigned to correct technology agent
3. Check task dependencies don't mix technologies incorrectly
4. Use separate tasks for each technology

---

## 📱 Mobile Agent Issues

### React Native Agent Issues

### Problem: Mobile app doesn't build on iOS or Android

**Symptoms:**
- iOS build fails (Xcode errors, Podfile issues)
- Android build fails (Gradle errors, missing dependencies)
- Native modules not linking correctly

**Solutions:**
1. **iOS:**
   - Check `src/mobile/ios/Podfile` is correct
   - Run `cd src/mobile/ios && pod install`
   - Verify Xcode project settings
   - Check Info.plist permissions
   - Verify minimum iOS version in Podfile
2. **Android:**
   - Check `src/mobile/android/build.gradle` configuration
   - Verify Android SDK version compatibility
   - Check AndroidManifest.xml permissions
   - Verify minimum Android API level
3. **Native Modules:**
   - Ensure native modules are properly linked
   - Check platform-specific code in `src/mobile/ios/` and `src/mobile/android/`
   - Verify native module dependencies in package.json

### Problem: Platform-specific features not working

**Symptoms:**
- Biometric authentication fails on one platform
- Haptic feedback not working
- Platform-specific navigation issues

**Solutions:**
1. Verify native modules are installed: `react-native-biometrics`, `expo-haptics`, etc.
2. Check platform detection: Use `Platform.OS === 'ios'` or `Platform.OS === 'android'`
3. Verify platform-specific code in `src/mobile/ios/` and `src/mobile/android/`
4. Test on both iOS Simulator and Android Emulator
5. Check native module documentation for platform-specific requirements

### Problem: React Native Metro bundler issues

**Symptoms:**
- Metro bundler fails to start
- Module resolution errors
- Cache issues

**Solutions:**
1. Clear Metro cache: `cd src/mobile && npx react-native start --reset-cache`
2. Clear watchman: `watchman watch-del-all`
3. Clear node_modules: `rm -rf node_modules && npm install` (or `yarn install`)
4. Clear iOS build: `cd src/mobile/ios && rm -rf build && pod install`
5. Clear Android build: `cd src/mobile/android && ./gradlew clean`

### Problem: Mobile app crashes on specific platform

**Symptoms:**
- App works on iOS but crashes on Android (or vice versa)
- Platform-specific runtime errors

**Solutions:**
1. Check platform-specific code for errors
2. Verify native module compatibility with both platforms
3. Review error logs from iOS Console or Android Logcat
4. Test on physical devices (not just simulators/emulators)
5. Check platform-specific permissions in Info.plist (iOS) or AndroidManifest.xml (Android)

### Flutter Agent Issues

### Problem: Flutter app doesn't build

**Symptoms:**
- Flutter build fails
- Dart compilation errors
- Platform-specific build issues

**Solutions:**
1. **iOS:**
   - Check `src/mobile/ios/Podfile` is correct
   - Run `cd src/mobile/ios && pod install`
   - Verify Xcode project settings
   - Check Info.plist permissions
2. **Android:**
   - Check `src/mobile/android/build.gradle` configuration
   - Verify Android SDK version compatibility
   - Check AndroidManifest.xml permissions
   - Verify minimum Android API level
3. **Flutter:**
   - Run `flutter pub get` to install dependencies
   - Check `pubspec.yaml` for correct dependencies
   - Verify Flutter SDK version compatibility
   - Clear Flutter build: `flutter clean`

### Problem: Flutter platform channels not working

**Symptoms:**
- Native platform communication fails
- Platform channel errors
- Method calls not reaching native code

**Solutions:**
1. Verify platform channel names match on both sides
2. Check native code implementation (iOS/Android)
3. Verify method channel registration
4. Test platform channels on both platforms
5. Review Flutter platform channel documentation

### iOS Developer Agent Issues

### Problem: iOS native module not linking

**Symptoms:**
- Native module not found
- Linking errors in Xcode
- Pod installation fails

**Solutions:**
1. Check Podfile includes native module
2. Run `cd src/mobile/ios && pod install`
3. Verify native module is in correct location
4. Check Xcode project settings
5. Clean and rebuild: `cd src/mobile/ios && xcodebuild clean`

### Problem: iOS build configuration errors

**Symptoms:**
- Xcode build fails
- Code signing errors
- Provisioning profile issues

**Solutions:**
1. Check Xcode project settings
2. Verify code signing configuration
3. Check provisioning profiles
4. Verify bundle identifier matches
5. Review Info.plist configuration

### Android Developer Agent Issues

### Problem: Android native module not linking

**Symptoms:**
- Native module not found
- Gradle build errors
- Missing dependencies

**Solutions:**
1. Check `build.gradle` includes native module
2. Verify `settings.gradle` includes module
3. Run `cd src/mobile/android && ./gradlew clean`
4. Check AndroidManifest.xml permissions
5. Verify native module is in correct location

### Problem: Android build configuration errors

**Symptoms:**
- Gradle build fails
- SDK version conflicts
- Dependency conflicts

**Solutions:**
1. Check `build.gradle` configuration
2. Verify Android SDK version compatibility
3. Check dependency versions
4. Review `gradle.properties` settings
5. Clean and rebuild: `cd src/mobile/android && ./gradlew clean build`

---

## 🤖 Custom Agent Issues

### Problem: Custom agent not found

**Symptoms:**
- Agent cannot find custom agent tasks
- Task folder doesn't exist
- Agent name mismatch

**Solutions:**
1. Verify CUSTOM_AGENTS section in project.scope.md
2. Check agent name format (UPPERCASE_WITH_UNDERSCORES)
3. Verify task folder exists (lowercase-with-hyphens)
4. Check Product Agent created custom agent folder
5. Verify Planner Agent created custom agent tasks

### Problem: Custom agent tasks not executing

**Solutions:**
1. Check custom agent tasks have correct ROLE
2. Verify dependencies are satisfied
3. Check task STATUS (should be TODO or IN_PROGRESS)
4. Review custom agent template usage
5. Ensure agent name matches project.scope.md

---

## 🔀 Git Integration Issues

### Problem: Agent not following Git conventions

**Symptoms:**
- Branch not created when GIT: ACTIVE
- Commit messages missing TASK_ID
- PR not created when REQUIRE_PR: YES

**Solutions:**
1. Check `project.scope.md` for `GIT: STATUS`
   - If ACTIVE, agent must follow Git rules
   - If NONE, no Git constraints apply
2. Verify agent read `project.scope.md` before starting task
3. Check branch naming format: `<SPRINT_ID>/<TASK_ID>-<description>`
4. Verify commit message includes TASK_ID in first line
5. If REQUIRE_PR: YES, ensure PR is created before marking task DONE

### Problem: Branch already exists

**Symptoms:**
- Agent cannot create branch
- Branch exists for different task

**Solutions:**
1. If task is IN_PROGRESS, checkout existing branch
2. If task is TODO, delete old branch and create new one
3. If branch exists for different task, create branch with unique suffix
4. Check execution log for branch creation history

### Problem: Commit message format incorrect

**Symptoms:**
- Commit message missing TASK_ID
- FILES section missing
- RELATED section missing

**Solutions:**
1. Amend commit message to include TASK_ID
2. Add FILES section listing all changed files
3. Add RELATED section with Sprint and Task references
4. Follow format from `ai/protocols/git_integration.md`

### Problem: PR not created when REQUIRE_PR: YES

**Symptoms:**
- Task marked DONE without PR
- REQUIRE_PR: YES in project.scope.md but no PR

**Solutions:**
1. Verify REQUIRE_PR setting in project.scope.md
2. Create PR manually if task is already DONE
3. Update task COMPLETION section with PR information
4. Re-run agent to create PR if task is still IN_PROGRESS

---

## 🎼 Orchestrator Agent Issues

### Problem: Orchestrator not assigning tasks

**Symptoms:**
- Orchestrator running but no tasks assigned
- READY tasks exist but not being picked up

**Solutions:**
1. Check Orchestrator execution log: `/runs/<SPRINT_ID>/logs/orchestrator-execution.log`
2. Verify READY tasks exist (STATUS: TODO + all dependencies DONE)
3. Check agent availability (agent not already working on another task)
4. Verify Orchestrator is in EXECUTION mode (not PLANNING mode)
5. Check dashboard for current status

### Problem: Orchestrator stuck in loop

**Symptoms:**
- Orchestrator keeps retrying same task
- No progress made

**Solutions:**
1. Check task STATUS (might be stuck IN_PROGRESS)
2. Check agent execution log for errors
3. Verify task dependencies are correct
4. Check for circular dependencies
5. Manually intervene: Mark task as BLOCKED, fix issue, resume Orchestrator

### Problem: Dashboard not updating

**Symptoms:**
- Dashboard.md not created or not updating
- Outdated information

**Solutions:**
1. Verify Orchestrator is running
2. Check Orchestrator execution log for dashboard updates
3. Manually trigger dashboard update:
   ```
   Read ai-factory/ai/agents/orchestrator.md and update dashboard.
   ```
4. Check file permissions (dashboard.md should be writable)

### Problem: Orchestrator stopped unexpectedly

**Symptoms:**
- Orchestrator was running but stopped
- No error message

**Solutions:**
1. Check Orchestrator execution log for last entry
2. Check for complex errors (manual intervention required)
3. Check dashboard for blocked tasks
4. Resume Orchestrator:
   ```
   Read ai-factory/ai/agents/orchestrator.md and resume orchestration.
   ```

---

## 🆘 Still Having Issues?

1. Review agent's FAILURE CONDITIONS section
2. Check protocol files for rules
3. Verify all prerequisites are met
4. Check README.md for system rules
5. Review guides/BEST_PRACTICES.md for common patterns
6. Review guides/BUG_FIX.md for bug handling
7. Check guides/CUSTOM_AGENTS.md for custom agent issues
8. Review `ai/protocols/git_integration.md` for Git rules
9. Review `ai/protocols/hybrid_error_handling.md` for error handling
10. Check `ai/protocols/dashboard.md` for dashboard issues

---

## 🎼 Orchestrator Agent Issues

### Problem: Orchestrator not assigning tasks

**Symptoms:**
- Orchestrator running but no tasks assigned
- READY tasks exist but not being picked up

**Solutions:**
1. Check Orchestrator execution log: `/runs/<SPRINT_ID>/logs/orchestrator-execution.log`
2. Verify READY tasks exist (STATUS: TODO + all dependencies DONE)
3. Check agent availability (agent not already working on another task)
4. Verify Orchestrator is in EXECUTION mode (not PLANNING mode)
5. Check dashboard for current status

### Problem: Orchestrator stuck in loop

**Symptoms:**
- Orchestrator keeps retrying same task
- No progress made

**Solutions:**
1. Check task STATUS (might be stuck IN_PROGRESS)
2. Check agent execution log for errors
3. Verify task dependencies are correct
4. Check for circular dependencies
5. Manually intervene: Mark task as BLOCKED, fix issue, resume Orchestrator

### Problem: Dashboard not updating

**Symptoms:**
- Dashboard.md not created or not updating
- Outdated information

**Solutions:**
1. Verify Orchestrator is running
2. Check Orchestrator execution log for dashboard updates
3. Manually trigger dashboard update:
   ```
   Read ai-factory/ai/agents/orchestrator.md and update dashboard.
   ```
4. Check file permissions (dashboard.md should be writable)

### Problem: Orchestrator stopped unexpectedly

**Symptoms:**
- Orchestrator was running but stopped
- No error message

**Solutions:**
1. Check Orchestrator execution log for last entry
2. Check for complex errors (manual intervention required)
3. Check dashboard for blocked tasks
4. Resume Orchestrator:
   ```
   Read ai-factory/ai/agents/orchestrator.md and resume orchestration.
   ```

---

## 🔄 Vertical Structure Issues

### Problem: Wrong task folder structure

**Symptoms:**
- Tasks created in wrong folder
- Technology-specific agent can't find tasks
- Legacy folders used instead of technology-specific

**Solutions:**
1. Verify project.scope.md configuration:
   - Check BACKEND section for active technologies
   - Check FRONTEND section for active frameworks
2. Verify task folders match configuration:
   - BACKEND.DOTNET_CORE: ACTIVE → tasks/dotnet-core/
   - BACKEND.JAVA: ACTIVE → tasks/java/
   - FRONTEND.ANGULAR: ACTIVE → tasks/angular/
   - FRONTEND.REACT: ACTIVE → tasks/react/
3. Check Planner Agent created correct folders
4. Move tasks to correct folders if needed

### Problem: Legacy agent used instead of technology-specific

**Symptoms:**
- backend.md used instead of dotnet-core-developer.md
- frontend.md used instead of angular-developer.md
- Code doesn't follow technology-specific patterns

**Solutions:**
1. Check project.scope.md:
   - Use technology-specific agents for new projects
   - Legacy agents only for backward compatibility
2. Update agent prompts:
   - Use dotnet-core-developer.md instead of backend.md
   - Use angular-developer.md instead of frontend.md
3. Verify task ROLE matches technology-specific agent

---