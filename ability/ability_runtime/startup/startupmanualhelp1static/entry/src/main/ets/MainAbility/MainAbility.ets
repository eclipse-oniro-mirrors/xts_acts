/*
* Copyright (c) 2026 Huawei Device Co., Ltd.
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
'use static';
import UIAbility from '@ohos.app.ability.UIAbility'
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

export default class MainAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    console.log('MainAbility onCreate');
  }

  onDestroy(): Promise<void> | undefined {
    console.log('MainAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    console.log('MainAbility onWindowStageCreate');
    try {
      windowStage.loadContent('MainAbility/pages/index', (err: BusinessError<void> | null): void => {
        if (err?.code) {
          hilog.info(0x0000, 'MainAbility', 'loadContent error');
          return;
        }
        hilog.info(0x0000, 'MainAbility', 'loadContent ok');
      });
    } catch (e) {
      hilog.info(0x0000, 'MainAbility', 'loadContent catch error：' + e.message);
    }
  }

  onWindowStageDestroy(): void {
    console.log('MainAbility onWindowStageDestroy');
  }

  onForeground(): void {
    console.log('MainAbility onForeground');
  }

  onBackground(): void {
    console.log('MainAbility onBackground');
  }
};