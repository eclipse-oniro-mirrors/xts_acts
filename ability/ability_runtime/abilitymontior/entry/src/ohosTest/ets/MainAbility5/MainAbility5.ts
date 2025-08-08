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
import Ability from '@ohos.app.ability.UIAbility';
import commonEvent from '@ohos.commonEvent';

let EVENT_TIME = 500;

function publishCallBack(): void {
  console.debug('====>MainAbility5 Publish CallBack ====>');
}

export default class MainAbility5 extends Ability {
  onCreate(want, launchParam) {
    console.log('[Demo] MainAbility5 onCreate');
    globalThis.abilityWant = want;
    globalThis.abilityContext = this.context;
    setTimeout(() => {
      globalThis.abilityContext.terminateSelf().then(() => {
        console.log('====>MainAbility5 in terminateSelf====>');
      });
    }, EVENT_TIME);
  }

  onDestroy(): void {
    console.log('[Demo] MainAbility5 onDestroy');
    globalThis.abilityContext = undefined;
  }

  onWindowStageCreate(windowStage) {
    // Main window is created, set main page for this ability
    console.log('[Demo] MainAbility5 onWindowStageCreate');

    windowStage.setUIContent(this.context, 'pages/Index5', null);
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    console.log('[Demo] MainAbility5 onWindowStageDestroy');
    setTimeout(() => {
      commonEvent.publish('MainAbility5_onWindowStageDestroy', publishCallBack);
    }, EVENT_TIME);
  }

  onForeground(): void {
    // Ability has brought to foreground
    console.log('[Demo] MainAbility5 onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    console.log('[Demo] MainAbility5 onBackground');
  }
};
