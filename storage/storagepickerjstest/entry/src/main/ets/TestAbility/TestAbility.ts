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
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import abilityAccessCtrl, { PermissionRequestResult, Permissions } from '@ohos.abilityAccessCtrl'
import { BusinessError } from '@ohos.base';
import window from '@ohos.window';
import globalContext from '../test/GlobalContext';

export default class TestAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    console.log('TestAbility onCreate')
  }

  onDestroy() {
    console.log('TestAbility onDestroy')
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    console.log('TestAbility onWindowStageCreate')
    windowStage.loadContent("TestAbility/pages/index", (err, data) => {
      if (err.code) {
        console.error('Failed to load the content. Cause:' + JSON.stringify(err));
        return;
      }
      console.info('Succeeded in loading the content. Data: ' + JSON.stringify(data))
    });

    let permissions: Array<Permissions> = ['ohos.permission.START_ABILITIES_FROM_BACKGROUND']

    let atManager = abilityAccessCtrl.createAtManager()
    atManager.requestPermissionsFromUser(this.context, permissions, (err: BusinessError, data: PermissionRequestResult) => {
    })

    globalContext.getContext().setAbility(this.context);
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
