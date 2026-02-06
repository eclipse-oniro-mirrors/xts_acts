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
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import commonEvent from '@ohos.commonEventManager';
import UIExtensionAbility from '@ohos.app.ability.UIExtensionAbility';

const TAG: string = 'UIExtAbility';

export default class UIExtAbility3 extends UIExtensionAbility {
  onCreate(launchParam: AbilityConstant.LaunchParam) {
    console.info(TAG, `s3UIExtAbility onCreate _0100——0013` + JSON.stringify(launchParam));

    let commonEventData = {
      code: 0,
      parameters: {
        launchReason: launchParam.launchReason,
        lastExitReason: launchParam.lastExitReason,
        lastExitMessage: launchParam.lastExitMessage,
        launchUTCTime: launchParam.launchUTCTime,
        launchUptime: launchParam.launchUptime,
      }
    };
    commonEvent.publish('0100', commonEventData, (err) => {
      console.info('====> [s3UIExtensionForResultAsCallerCalledAbility 0100——0017] [0100] publish：%{public}s',
        JSON.stringify(err));

      this.context.terminateSelf().catch((err) => {
        console.info('====> [s3UIExtensionForResultAsCallerCalledAbility] [0100——0018] terminateSelf：%{public}s',
          JSON.stringify(err));
      });
    });
  }

  onForeground() {
    console.info(TAG, `UIExtAbility onForeground`)
  }

  onBackground() {
    console.info(TAG, `UIExtAbility onBackground`)
  }

  onDestroy() {
    console.info(TAG, `UIExtAbility onDestroy`)
  }

  onSessionCreate(want, session) {
    console.info(TAG, `UIExtAbility onSessionCreate, want: ${JSON.stringify(want)}`)
  }

  onSessionDestroy(session) {
    console.info(TAG, `UIExtAbility onSessionDestroy`)
  }
};