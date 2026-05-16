/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import common from '@ohos.app.ability.common';

class EntryAbility2 extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag EntryAbility2', 'EntryAbility2 onCreate');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag EntryAbility2', 'EntryAbility2 onWindowStageCreate');
    try {
      windowStage.loadContent('pages/Index2', (err: BusinessError<void> | null): void => {
        hilog.info(0x0000, 'testTag EntryAbility2', 'loadContent2 entering');
        if (err?.code) {
          hilog.info(0x0000, 'testTag EntryAbility2', 'loadContent2 error');
          return;
        }
        hilog.info(0x0000, 'testTag EntryAbility2', 'loadContent2 ok');
      });
    } catch (e) {
      hilog.info(0x0000, 'testTag EntryAbility2', 'loadContent2 catch error：-----------' + e.message);
    }
  }

  onDestroy(): Promise<void> | undefined {
    hilog.info(0x0000, 'testTag EntryAbility2', 'EntryAbility2 onDestroy');
    return undefined;
  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag EntryAbility2', 'EntryAbility2 onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(0x0000, 'testTag EntryAbility2', 'EntryAbility2 onForeground');
    let abilityResult: common.AbilityResult = {
      resultCode: 111,
      want: {
        bundleName: 'com.acts.openlinktest,static',
        moduleName: 'entry',
        abilityName: 'EntryAbility2'
      },
    };
    setTimeout(async () => {
      await this.context.terminateSelfWithResult(abilityResult).then(() => {
        hilog.info(0x0000, 'testTag', '%{public}s', 'secondAbility terminateSelf sucess');
      }).catch((err: Error): void => {
        hilog.info(0x0000, 'testTag', '%{public}s', 'secondAbility terminateSelf errCode:' + JSON.stringify(err.code) +
          'errMessage:' + JSON.stringify(err.message));
      })
    }, 500);
  }

  onBackground() {
    hilog.info(0x0000, 'testTag EntryAbility2', 'EntryAbility2 onBackground');
  }

  onWindowStageWillDestroy(windowStage: window.WindowStage) {
    hilog.info(0x0000, 'testTag EntryAbility2', 'EntryAbility2 onWindowStageWillDestroy');
  }
}