/*
 * Copyright (C) 2024 HiHope Open Source Organization.
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
import commonEvent from '@ohos.commonEventManager';
import { AbilityConstant, common } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

let FOREGROUND_EVENT = 'foreground_event';
let tag = '[ACTS_StartAbilityInNewProcess MainAbility1]';

export default class MainAbility2 extends Ability {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, tag, '%{public}s', `want===${JSON.stringify(want)},=launch==${JSON.stringify(launchParam)}`);
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    AppStorage.setOrCreate('pageContent', 'IndexCommonOne');
    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  async onForeground():Promise<void>{
    hilog.info(0x0000, tag, '%{public}s', 'Ability onForeground');
    let resource = $r('app.string.EntryAbility_label1');
    hilog.info(0x0000, tag, '%{public}s', `commonEventData str==${JSON.stringify(resource)}`);
    let resourceManager = this.context.resourceManager;
    let label = await resourceManager.getStringValue(resource);
    hilog.info(0x0000, tag, '%{public}s', `commonEventData label==${JSON.stringify(label)}`);
    let commonEventData: commonEvent.CommonEventPublishData = {
      parameters: {
        returnStr: label,
      }
    };
    hilog.info(0x0000, 'testTag', '%{public}s', `commonEventData==${JSON.stringify(commonEventData)}`);
    commonEvent.publish(FOREGROUND_EVENT, commonEventData, (err) => {
      console.log(`${tag} publish err: ${JSON.stringify(err)}`);
    });
    setTimeout(() => {
      this.terminalSelf();
    }, 1000);
  }

  async terminalSelf(){
    let resultCode = 100;
    let want: Want = {
      bundleName: 'com.acts.appclonedemo',
      abilityName: 'MainAbility2',
    };
    let abilityResult: common.AbilityResult = {
      want,
      resultCode,
    };
    await this.context.terminateSelfWithResult(abilityResult).then((data) => {
      hilog.info(0x0000, tag, '%{public}s', 'EntryAbility terminateSelf sucess' + JSON.stringify(data));
    }).catch((err: BusinessError) => {
      hilog.info(0x0000, tag, '%{public}s', 'EntryAbility terminateSelf errCode:' + JSON.stringify(err.code) +
        'errMessage:' + JSON.stringify(err.message));
    });
  }

  onBackground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}