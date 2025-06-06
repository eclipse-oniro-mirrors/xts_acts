/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import Want from '@ohos.app.ability.Want'
import AbilityConstant from '@ohos.app.ability.AbilityConstant'

export default class TestAbility extends Ability {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    console.log('TestAbility onCreate')
  }

  onDestroy() {
    console.log('TestAbility onDestroy')
  }

  onWindowStageCreate(windowStage: Window.WindowStage) {
    console.log('TestAbility onWindowStageCreate')
    windowStage.loadContent("TestAbility/pages/index", (err, data) => {
      if (err.code) {
        console.error('Failed to load the content. Cause:' + JSON.stringify(err));
        return;
      }
      console.info('Succeeded in loading the content. Data: ' + JSON.stringify(data))
    });

    globalThis.abilityContext = this.context;
    let windowClass = null;
    windowStage.getMainWindow((err, data) => {
      if (err.code) {
        console.error('Failed to obtain the main window. Cause: ' + JSON.stringify(err));
        return;
      }
      windowClass = data;
      globalThis.uiContext = windowClass.getUIContext();
    });

  }

  onWindowStageDestroy() {
    console.log('TestAbility onWindowStageDestroy')
  }

  onForeground() {
    console.log('TestAbility onForeground')
  }

  onBackground() {
    console.log('TestAbility onBackground')
  }
};