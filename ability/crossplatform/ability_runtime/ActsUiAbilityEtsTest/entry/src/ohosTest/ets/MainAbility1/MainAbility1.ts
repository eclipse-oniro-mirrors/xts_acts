/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import Ability from '@ohos.app.ability.UIAbility'

let abilityName = null;

function recordLife(ownList, abilityName, lifeName) {
  ownList.push(abilityName + ' ' + lifeName);
}

export default class MainAbility1 extends Ability {
  onNewWant(want, launchParam) {
    console.log("[Demo] MainAbility1 onNewWant")
    globalThis.onNewWantStr = abilityName + ' ' + 'onNewWant';
  }

  onCreate(want, launchParam) {
    console.log("[Demo] MainAbility1 onCreate")
    globalThis.launchParam1 = launchParam;
    abilityName = want.abilityName
    globalThis.list1 = [];
    recordLife(globalThis.list1, abilityName, 'onCreate');
  }

  onDestroy() {
    console.log("[Demo] MainAbility1 onDestroy")
    recordLife(globalThis.list1, abilityName, 'onDestroy');
  }

  onWindowStageCreate(windowStage) {
    // Main window is created, set main page for this ability
    console.log("[Demo] MainAbility1 onWindowStageCreate")
    globalThis.ability1context = this.context;
    recordLife(globalThis.list1, abilityName, 'onWindowStageCreate');

    windowStage.loadContent('TestAbility/pages/Index1', (err, data) => {
      if (err.code) {
        console.log('MainAbility1 loadContent error');
        return;
      }
      console.log('MainAbility1 loadContent success');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    console.log("[Demo] MainAbility1 onWindowStageDestroy")
    recordLife(globalThis.list1, abilityName, 'onWindowStageDestroy');
  }

  onForeground() {
    console.log("[Demo] MainAbility1 onForeground")
    recordLife(globalThis.list1, abilityName, 'onForeground');
  }

  onBackground() {
    // Ability has back to background
    console.log("[Demo] MainAbility1 onBackground")
    recordLife(globalThis.list1, abilityName, 'onBackground');
  }
};
