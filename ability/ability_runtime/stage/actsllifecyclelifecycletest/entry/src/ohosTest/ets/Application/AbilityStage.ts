/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import AbilityStage from "@ohos.app.ability.AbilityStage"
import hilog from '@ohos.hilog';

const TEST_TAG = "TAG_MyAbilityStage"

export default class MyAbilityStage extends AbilityStage {
  onCreate() {
    console.log("[Demo] MyAbilityStage onCreate")
    globalThis.stageOnCreateRun = 1;
    globalThis.stageContext = this.context;

    globalThis.mainAbilityStageListKey = []
    globalThis.willAbilityStageListKey = []
    var abilityName = "";
    let AbilityLifecycleCallback = {
      onAbilityCreate(ability) {
        abilityName = ability.context.abilityInfo.name;
        globalThis.mainAbilityStageListKey.push(abilityName + " onAbilityCreate");
        hilog.info(0x0000, TEST_TAG, `AbilityLifecycleCallback ${abilityName} onAbilityCreate`);
      },
      onWindowStageCreate(ability, windowStage) {
        abilityName = ability.context.abilityInfo.name;
        globalThis.mainAbilityStageListKey.push(abilityName + " onWindowStageCreate");
        hilog.info(0x0000, TEST_TAG, `AbilityLifecycleCallback ${abilityName} onWindowStageCreate`);
      },
      onWindowStageActive(ability, windowStage) {
        abilityName = ability.context.abilityInfo.name;
        hilog.info(0x0000, TEST_TAG, `AbilityLifecycleCallback ${abilityName} onWindowStageActive`);
      },
      onWindowStageInactive(ability, windowStage) {
        abilityName = ability.context.abilityInfo.name;
        hilog.info(0x0000, TEST_TAG, `AbilityLifecycleCallback ${abilityName} onWindowStageInactive`);
      },
      onAbilityForeground(ability) {
        abilityName = ability.context.abilityInfo.name;
        globalThis.mainAbilityStageListKey.push(abilityName + " onAbilityForeground");
        hilog.info(0x0000, TEST_TAG, `AbilityLifecycleCallback ${abilityName} onAbilityForeground`);
      },
      onAbilityBackground(ability) {
        abilityName = ability.context.abilityInfo.name;
        globalThis.mainAbilityStageListKey.push(abilityName + " onAbilityBackground");
        hilog.info(0x0000, TEST_TAG, `AbilityLifecycleCallback ${abilityName} onAbilityBackground`);
      },
      onWindowStageDestroy(ability, windowStage) {
        abilityName = ability.context.abilityInfo.name;
        globalThis.mainAbilityStageListKey.push(abilityName + " onWindowStageDestroy");
        hilog.info(0x0000, TEST_TAG, `AbilityLifecycleCallback ${abilityName} onWindowStageDestroy`);
      },
      onAbilityDestroy(ability) {
        abilityName = ability.context.abilityInfo.name;
        globalThis.mainAbilityStageListKey.push(abilityName + " onAbilityDestroy");
        hilog.info(0x0000, TEST_TAG, `AbilityLifecycleCallback ${abilityName} onAbilityDestroy`);
      },
      onAbilityContinue(ability) {
        abilityName = ability.context.abilityInfo.name;
        globalThis.mainAbilityStageListKey.push(abilityName + " onAbilityContinue");
        hilog.info(0x0000, TEST_TAG, `AbilityLifecycleCallback ${abilityName} onAbilityContinue`);
      },
      onAbilityWillCreate(ability) {
        abilityName = ability.context.abilityInfo.name;
        globalThis.willAbilityStageListKey.push(abilityName + " onAbilityWillCreate");
        hilog.info(0x0000, TEST_TAG, `AbilityLifecycleCallback ${abilityName} onAbilityWillCreate`);
      },
      onWindowStageWillCreate(ability, windowStage) {
        abilityName = ability.context.abilityInfo.name;
        globalThis.willAbilityStageListKey.push(abilityName + " onWindowStageWillCreate");
        hilog.info(0x0000, TEST_TAG, `AbilityLifecycleCallback ${abilityName} onWindowStageWillCreate`);
      },
      onWindowStageWillDestroy(ability, windowStage) {
        abilityName = ability.context.abilityInfo.name;
        globalThis.willAbilityStageListKey.push(abilityName + " onWindowStageWillDestroy");
        hilog.info(0x0000, TEST_TAG, `AbilityLifecycleCallback ${abilityName} onWindowStageWillDestroy`);
      },
      onAbilityWillDestroy(ability) {
        abilityName = ability.context.abilityInfo.name;
        globalThis.willAbilityStageListKey.push(abilityName + " onAbilityWillDestroy");
        hilog.info(0x0000, TEST_TAG, `AbilityLifecycleCallback ${abilityName} onAbilityWillDestroy`);
      },
      onAbilityWillForeground(ability) {
        abilityName = ability.context.abilityInfo.name;
        globalThis.willAbilityStageListKey.push(abilityName + " onAbilityWillForeground");
        hilog.info(0x0000, TEST_TAG, `AbilityLifecycleCallback ${abilityName} onAbilityWillForeground`);
      },
      onAbilityWillBackground(ability) {
        abilityName = ability.context.abilityInfo.name;
        globalThis.willAbilityStageListKey.push(abilityName + " onAbilityWillBackground");
        hilog.info(0x0000, TEST_TAG, `AbilityLifecycleCallback ${abilityName} onAbilityWillBackground`);
      },
      onWillNewWant(ability) {
        abilityName = ability.context.abilityInfo.name;
        globalThis.willAbilityStageListKey.push(abilityName + " onWillNewWant");
        hilog.info(0x0000, TEST_TAG, `AbilityLifecycleCallback ${abilityName} onWillNewWant`);
      },
      onNewWant(ability) {
        abilityName = ability.context.abilityInfo.name;
        globalThis.willAbilityStageListKey.push(abilityName + " onNewWant");
        hilog.info(0x0000, TEST_TAG, `AbilityLifecycleCallback ${abilityName} onNewWant`);
      },
      onAbilityWillContinue(ability) {
        abilityName = ability.context.abilityInfo.name;
        globalThis.willAbilityStageListKey.push(abilityName + " onAbilityWillContinue");
        hilog.info(0x0000, TEST_TAG, `AbilityLifecycleCallback ${abilityName} onAbilityWillContinue`);
      },
      onWindowStageWillRestore(ability, windowStage) {
        abilityName = ability.context.abilityInfo.name;
        globalThis.willAbilityStageListKey.push(abilityName + " onWindowStageWillRestore");
        hilog.info(0x0000, TEST_TAG, `AbilityLifecycleCallback ${abilityName} onWindowStageWillRestore`);
      },
      onWindowStageRestore(ability, windowStage) {
        abilityName = ability.context.abilityInfo.name;
        globalThis.willAbilityStageListKey.push(abilityName + " onWindowStageRestore");
        hilog.info(0x0000, TEST_TAG, `AbilityLifecycleCallback ${abilityName} onWindowStageRestore`);
      },
      onAbilityWillSaveState(ability) {
        abilityName = ability.context.abilityInfo.name;
        globalThis.willAbilityStageListKey.push(abilityName + " onAbilityWillSaveState");
        hilog.info(0x0000, TEST_TAG, `AbilityLifecycleCallback ${abilityName} onAbilityWillSaveState`);
      },
      onAbilitySaveState(ability) {
        abilityName = ability.context.abilityInfo.name;
        globalThis.willAbilityStageListKey.push(abilityName + " onAbilitySaveState");
        hilog.info(0x0000, TEST_TAG, `AbilityLifecycleCallback ${abilityName} onAbilitySaveState`);
      }
    }

    globalThis.ApplicationContextStage = this.context.getApplicationContext();
    var callBackId = globalThis.ApplicationContextStage.registerAbilityLifecycleCallback(AbilityLifecycleCallback);
    globalThis.mainAbilityStageCallBackId = callBackId
    hilog.info(0x0000, TEST_TAG, `callBackId :${callBackId}`);
  }
}