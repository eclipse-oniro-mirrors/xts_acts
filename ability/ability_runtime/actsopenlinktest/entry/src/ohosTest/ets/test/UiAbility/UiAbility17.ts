/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import common from '@ohos.app.ability.common';
import { url } from '@kit.ArkTS';
import { rpc } from '@kit.IPCKit';
import { commonEventManager } from '@kit.BasicServicesKit';
import { BusinessError } from '@ohos.base';

export default class UiAbility17 extends UIAbility {
  onCreate(want) {
    console.info('UiAbility17 onCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    let uri = want?.uri
    console.info('UiAbility17 JSON.stringify(want) is', JSON.stringify(want));
    console.info('UiAbility17 JSON.stringify(want) is', JSON.stringify(want.parameters));
    if (want.parameters.appLinkingOnly == true) {
      console.info('====>SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_3100 appLinkingOnly==true');
      commonEventManager.publish('ACTS_TEST_DESTROY', function () {
        console.info('====>SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_3100 publish ACTS_TEST_DESTROY');
      })
    } else if(JSON.stringify(want.parameters)==`{"appLinkingOnly":false,"component.startup.newRules":true,"debugApp":false,"moduleName":' +
        '"entry_test","ohos.aafwk.param.callerAbilityName":"TestAbility","ohos.aafwk.param.callerAppId":"' +
        'ohos.example.myapplication_BJddqdiM3KY3FXFSfvHKJns1AqfVSz/DWwPm7HD7IECVLegY7g3PZbT8Nl7DR16bZevLmeJSnDjlKt' +
        'Azee/GOwk=","ohos.aafwk.param.callerAppIdentifier":"","ohos.aafwk.param.callerBundleName":"ohos.example.myapp' +
        'lication","ohos.aafwk.param.callerPid":23604,"ohos.aafwk.param.callerToken":536980633,"ohos.aafwk.param.call' +
        'erUid":20010043,"ohos.aafwk.param.startAbilityForResult":true,"ohos.aafwk.param.startTime":"1741696793704","oh' +
        'os.anco.param.missionId":237,"ohos.extra.param.key.appCloneIndex":0,"ohos.extra.param.key.callerRequestCod' +
        'e":"382853384765441","ohos.param.callerAppCloneIndex":0,"send_to_erms_targetLinkFeature":"","send_to_erms_tar' +
        'getLinkType":3}`) {
      commonEventManager.publish('ACTS_TEST_DESTROY', function () {
        console.info('====>SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_3100 publish ACTS_TEST_DESTROY');
      })
    }
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    console.info('UiAbility17 onWindowStageCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    globalThis.uiAbilityContext16 = this.context
    windowStage.loadContent('testability/pages/UiAbility12', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    console.info('UiAbility17 onForeground');
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    console.info('UiAbility17 onBackground');
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
