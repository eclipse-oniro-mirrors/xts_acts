/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
 
import hilog from '@ohos.hilog';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import common from '@ohos.app.ability.common';
import window from '@ohos.window';
import wantConstant from '@ohos.app.ability.wantConstant';

import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import commonEventManager from '@ohos.commonEventManager';

function publishEvent(event: string) {
  let options: commonEventManager.CommonEventPublishData = {};
  commonEventManager.publish(event, options,
    (err: BusinessError) => {
      if (err) {
        console.error('PublishCallBack err = ' + JSON.stringify(err));
      } else {
        console.info('Publish success');
      }
    });
}

async function processTestcase100(context: common.UIAbilityContext) {
  // caller not exists
  let want: Want = {};
  let resultCode = 100;
  let abilityResult: common.AbilityResult = {
    want,
    resultCode
  };

  console.info('start to backToCallerAbilityWithResult');
  let callerRequestCode:string = '0'
  try {
    await context.backToCallerAbilityWithResult(abilityResult, callerRequestCode)
      .then(() => {
        console.info('backToCallerAbilityWithResult succeed');
        publishEvent('BackToCallerAbilityWithResultTest_0100_Failed');
      })
      .catch((err: BusinessError) => {
        console.error(`backToCallerAbilityWithResult failed, code is ${err.code}, message is ${err.message}`);
        if (err.code === 16000074) {
          publishEvent('BackToCallerAbilityWithResultTest_0100_Success');
        } else {
          publishEvent('BackToCallerAbilityWithResultTest_0100_Failed');
        }
      });
  } catch (err) {
    let code = (err as BusinessError).code;
    let message = (err as BusinessError).message;
    console.error(`backToCallerAbilityWithResult failed, code is ${code}, message is ${message}`);
    publishEvent('BackToCallerAbilityWithResultTest_0100_Failed');
  }
}

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    console.info('onCreate');
    let testcase: string = want.parameters?.['testcase'] as string;
    console.info('testcase: ' + testcase);
    AppStorage.setOrCreate<string>('testcase', testcase);
    let callerRequestCode: string = want?.parameters?.[wantConstant.Params.CALLER_REQUEST_CODE] as string;
    AppStorage.setOrCreate<string>('callerRequestCode', callerRequestCode)
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    console.info('onNewWant');
    let testcase: string = want.parameters?.['testcase'] as string;
    console.info('testcase: ' + testcase);
    AppStorage.setOrCreate<string>('testcase', testcase);
    let callerRequestCode: string = want?.parameters?.[wantConstant.Params.CALLER_REQUEST_CODE] as string;
    AppStorage.setOrCreate<string>('callerRequestCode', callerRequestCode)
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    console.info('Ability onForeground');
    let testcase: string = AppStorage.get<string>('testcase') as string;
    console.info('aboutToAppear testcase is ' + testcase);
    if (testcase === 'BackToCallerAbilityWithResultTest_0100') {
      processTestcase100(this.context)
    }
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}