/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import UIAbility from '@ohos.app.ability.UIAbility';
import window from '@ohos.window';

export default class EntryAbility extends UIAbility {
  onCreate(want, launchParam) {
    console.info('SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_Test: ' + 'EntryAbility onCreate');
    globalThis.UIAbilityContext1 = this.context;
    globalThis.page = 'pages/Index';
    if (globalThis.testcase !== undefined) {
      globalThis.page = 'pages/UIExtensionPage';
    }
    console.info('SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_Test: page = ' + globalThis.page);
  }

  onNewWant(want, launchParam) {
    console.info('SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_Test: ' + 'EntryAbility onNewWant');
    globalThis.UIAbilityContext1 = this.context;
    globalThis.page = 'pages/Index';
    if (globalThis.testcase !== undefined) {
      globalThis.page = 'pages/UIExtensionPage';
    }
    if (globalThis.testcase === 'SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_0601') {
      globalThis.page = 'pages/UIExtensionPage1';
    }
  }

  onDestroy() {
    console.info('SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_Test: ' + 'EntryAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    console.info('SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_Test: ' + 'EntryAbility onWindowStageCreate');

    windowStage.loadContent(globalThis.page, (err, data) => {
      if (err.code) {
        console.error(`SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_Test: Failed to load the content. Cause ${JSON.stringify(err)}`);
        return;
      }
      console.info(`SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_Test: Succeeded in loading the content. Data: ${JSON.stringify(data)}`);
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    console.log('SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_Test: ' + 'EntryAbility onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    console.log('SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_Test: ' + 'EntryAbility onForeground');
  }

  onBackground() {
    // Ability has back to background
    console.log('SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_Test: ' + 'EntryAbility onBackground');
  }
}
