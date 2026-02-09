/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import commonEvent from '@ohos.commonEventManager';

let EVENT_TIME = 500;
class MainAbility3 extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag MainAbility3', 'EntryAbility onCreate');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag MainAbility3', 'EntryAbility onWindowStageCreate');
    try {
      windowStage.loadContent('pages/Index3', (err: BusinessError<void> | null): void => {
        hilog.info(0x0000, 'testTag MainAbility3', 'loadContent entering');
        if (err?.code) {
          hilog.info(0x0000, 'testTag MainAbility3', 'loadContent error');
          return;
        }
        hilog.info(0x0000, 'testTag MainAbility3', 'loadContent ok');
      });
    } catch (e) {
      hilog.info(0x0000, 'testTag MainAbility3', 'loadContent catch error：-----------' + e.message);
    }
    setTimeout(() => {
      this.context.terminateSelf().then(() => {
        console.log("====>MainAbility3 in terminateSelf====>");
      })
    }, 2000)
  }

  onDestroy(): Promise<void> | undefined {
    hilog.info(0x0000, 'testTag MainAbility3', 'EntryAbility onDestroy');
    return undefined;
  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag MainAbility3', 'EntryAbility onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(0x0000, 'testTag MainAbility3', 'EntryAbility onForeground');
    setTimeout(() => {
      commonEvent.publish("MainAbility3_foreground", ()=>{
        console.debug("====>Publish CallBack ====>");
      });
    }, EVENT_TIME);
  }

  onBackground() {
    hilog.info(0x0000, 'testTag  EntryAbility', 'EntryAbility onBackground');
  }
}
