/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import UIAbility from '@ohos.app.ability.UIAbility';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import { BusinessError, RecordData } from '@ohos.base';
import hilog from '@ohos.hilog';
import common from '@ohos.app.ability.common';
import dialogRequest from '@ohos.app.ability.dialogRequest';
import CommonEventManager from '@ohos.commonEventManager';
import { AppStorage } from '@ohos.arkui.stateManagement';

async function publishEvent() {
  let commonEventPublishData: CommonEventManager.CommonEventPublishData = {
    parameters: {
      'instanceCount': 1,
    } as Record<string, RecordData>
  };
  CommonEventManager.publish('ACTS_REQUEST_DIALOG_EVENT1', commonEventPublishData, () => {
    console.log('============>publish event success.==========>>')
  });
}

const TEST_SUITE_NAME: string = 'ActsRequestDialogStaticTest';

class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onCreate');
    AppStorage.setOrCreate<boolean>("requestDialogSuccess", true);
    try {
      let requestInfo: dialogRequest.RequestInfo = dialogRequest.getRequestInfo(want) as dialogRequest.RequestInfo;
      let windowRect: dialogRequest.WindowRect = requestInfo?.windowRect as dialogRequest.WindowRect;
      if (requestInfo) {
        AppStorage.setOrCreate<boolean>("validRequestInfo", true);
        AppStorage.setOrCreate<int>("windowRectLeft", windowRect.left);
        AppStorage.setOrCreate<int>("windowRectTop", windowRect.top);
        AppStorage.setOrCreate<int>("windowRectWidth", windowRect.width);
        AppStorage.setOrCreate<int>("windowRectHeight", windowRect.height);
        console.log("EntryAbility1 requestInfo is valid");
      } else {
        console.log("EntryAbility1 requestInfo is invalid");
      }

      let requestCallback = dialogRequest.getRequestCallback(want);
      if (requestCallback) {
        console.log("EntryAbility1 requestCallback is valid");
        AppStorage.setOrCreate<boolean>("validRequestCallback", true);
        let resultCode: dialogRequest.RequestResult = {
          result: dialogRequest.ResultCode.RESULT_CANCEL,
          want:{
            bundleName: 'com.acts.example.requestdialog.static',
            abilityName: 'EntryAbility1'
          } as Want
        };
        let resultCode2: dialogRequest.RequestResult = {
          result: dialogRequest.ResultCode.RESULT_OK,
        };
        console.log(`resultCjode1 is ${JSON.stringify(resultCode2)}`);
        requestCallback.setRequestResult(resultCode);
      } else {
        console.log("EntryAbility1 requestCallback is invalid");
      }
      publishEvent();
    } catch (error) {
      console.log("EntryAbility1 testRequest fail");
    }

    console.log("AbilityMultiInstanceAppA abilityWant = " + JSON.stringify(want));
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onWindowStageCreate');
    windowStage.loadContent('pages/Index', (err: BusinessError<void> | null): void => {
        hilog.info(0x0000, 'testTag EntryAbility', 'loadContent entering');
        if (err?.code) {
          hilog.info(0x0000, 'testTag EntryAbility', 'loadContent error');
          return;
        }
        hilog.info(0x0000, 'testTag EntryAbility', 'loadContent ok');
      });
    AppStorage.setOrCreate<common.UIAbilityContext>("abilityContext", this.context);
  }

  onDestroy(): Promise<void> | undefined {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'TestAbility onDestroy');
    return undefined;
  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'TestAbility onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'TestAbility onForeground');
  }

  onBackground() {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'TestAbility onBackground');
  }
}