/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import windowPromiseTest from './windowPromise.test'
import windowCallbackTest from './windowCallback.test'
import windowRefactorInterfaceTest from './windowRefactorInterface.test'
import displayAndWindowRefactorInterfaceTest from './displayAndWindowRefactorInterface.test'
import parameterVerificationIsOptional from './parameterVerificationIsOptional.test'
import windowRichScene from './windowRichScene.test'
import interfaceSupportSessionManagerTest from './interfaceSupportSessionManager.test'
import windowVerificationProblem from './windowVerificationProblem.test'
import windowAbnormalScenario from './windowAbnormalScenario.test'
import windowRecoverTest from './windowRecover.test'
import windowDialogTest from './windowDialog.test'

export default function testsuite() {
  parameterVerificationIsOptional(globalThis.abilityContext,globalThis.windowStage,globalThis.abilityStorage)
  windowCallbackTest(globalThis.abilityContext,globalThis.windowStage,globalThis.abilityStorage)
  windowPromiseTest(globalThis.abilityContext,globalThis.windowStage,globalThis.abilityStorage)
  windowRefactorInterfaceTest(globalThis.abilityContext,globalThis.windowStage,globalThis.abilityStorage)
  displayAndWindowRefactorInterfaceTest(globalThis.abilityContext,globalThis.windowStage,globalThis.abilityStorage)
  windowRichScene(globalThis.abilityContext,globalThis.windowStage,globalThis.abilityStorage)
  interfaceSupportSessionManagerTest(globalThis.abilityContext,globalThis.windowStage,globalThis.abilityStorage)
  windowVerificationProblem(globalThis.abilityContext,globalThis.windowStage,globalThis.abilityStorage)
  windowAbnormalScenario(globalThis.abilityContext,globalThis.windowStage,globalThis.abilityStorage)
  windowRecoverTest(globalThis.abilityContext,globalThis.windowStage,globalThis.abilityStorage)
  windowDialogTest(globalThis.abilityContext,globalThis.windowStage,globalThis.abilityStorage)
}