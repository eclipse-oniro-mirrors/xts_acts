/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import parameterVerificationIsOptionalTest from './parameterVerificationIsOptional.test'
import windowDialogTest from './windowDialog.test'
import displayAndWindowRefactorInterfaceTest from './displayAndWindowRefactorInterface.test'
import interfaceSupportSessionManagerTest from './interfaceSupportSessionManager.test'
import windowCallbackTest from './windowCallback.test'
import windowPromiseTest from './windowPromise.test'
import windowRefactorInterfaceTest from './windowRefactorInterface.test'
import windowRichSceneTest from './windowRichScene.test'
import windowVerificationProblemTest from './windowVerificationProblem.test'
import windowAbnormalScenarioTest from './windowAbnormalScenario.test'
import windowRecoverTest from './windowRecover.test'


export default function testsuite() {
  parameterVerificationIsOptionalTest(globalThis.abilityContext,globalThis.windowStage)
  windowCallbackTest(globalThis.abilityContext,globalThis.windowStage,globalThis.abilityStorage)
  windowPromiseTest(globalThis.abilityContext,globalThis.windowStage,globalThis.abilityStorage)
  windowRefactorInterfaceTest(globalThis.abilityContext,globalThis.windowStage)
  displayAndWindowRefactorInterfaceTest(globalThis.abilityContext,globalThis.windowStage)
  windowRichSceneTest(globalThis.abilityContext,globalThis.windowStage)
  interfaceSupportSessionManagerTest(globalThis.abilityContext,globalThis.windowStage)
  windowVerificationProblemTest(globalThis.abilityContext,globalThis.windowStage)
  windowAbnormalScenarioTest(globalThis.abilityContext,globalThis.windowStage)
  windowRecoverTest(globalThis.abilityContext,globalThis.windowStage)
  windowDialogTest(globalThis.abilityContext,globalThis.windowStage)
}