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

import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import appManager from '@ohos.app.ability.appManager';
import commonEventManager from '@ohos.commonEventManager';

const TEST_SUITE_NAME: string = 'cloneUIAbilityStarted';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    AppStorage.setOrCreate<Want>("recvWant", want);
    let appCloneIndex = this.context.getApplicationContext().getCurrentAppCloneIndex();
    hilog.info(0x0000, 'testTag', '%{public}s', '${JSON.stringify(appCloneIndex)} Ability onCreate');
    let parameters: commonEventManager.CommonEventPublishData = {
      parameters: {
        "appCloneIndex": appCloneIndex,
      }
    }
    if (appCloneIndex == 0) {
      if (want.parameters.testCase == 100) {
        commonEventManager.publish('start_appClone_0100', parameters, (err, data) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${TEST_SUITE_NAME}-${JSON.stringify(parameters)} publish success`);
        })
        this.context.terminateSelf();
      }
      if (want.parameters.testCase == 600) {
        commonEventManager.publish('start_appClone_0600', parameters, (err, data) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${TEST_SUITE_NAME}-${JSON.stringify(parameters)} publish success`);
        })
        this.context.terminateSelf();
      }
    }
  
    if (appCloneIndex == 1) {
      if (want.parameters.testCase == 200) {
        commonEventManager.publish('start_appClone_0200', parameters, (err, data) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${TEST_SUITE_NAME}-${JSON.stringify(parameters)} start_appClone_0200 publish success`);
        })
        this.context.terminateSelf();
      }
      if (want.parameters.testCase == 700) {
        commonEventManager.publish('start_appClone_0700', parameters, (err, data) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${TEST_SUITE_NAME}-${JSON.stringify(parameters)} start_appClone_0700 publish success`);
        })
        this.context.terminateSelf();
      }
      if (want.parameters.testCase == 1300) {
        commonEventManager.publish('start_appClone_1300', parameters, (err, data) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${TEST_SUITE_NAME}-${JSON.stringify(parameters)} start_appClone_1300 publish success`);
        })
        this.context.terminateSelf();
      }
      if (want.parameters.testCase == 1500) {
        commonEventManager.publish('start_appClone_1500', parameters, (err, data) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${TEST_SUITE_NAME}-${JSON.stringify(parameters)} start_appClone_1500 publish success`);
        })
        this.context.terminateSelf();
      }
      if (want.parameters.testCase == 1700) {
        commonEventManager.publish('start_appClone_1700', parameters, (err, data) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${TEST_SUITE_NAME}-${JSON.stringify(parameters)} start_appClone_1700 publish success`);
        })
        this.context.terminateSelf();
      }
      if (want.parameters.testCase == 1900) {
        commonEventManager.publish('start_appClone_1900', parameters, (err, data) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${TEST_SUITE_NAME}-${JSON.stringify(parameters)} start_appClone_1900 publish success`);
        })
        this.context.terminateSelf();
      }

      if (want.parameters.testCase == 5100) {
        this.context.getApplicationContext().getRunningProcessInformation().then((infos: Array<appManager.ProcessInformation>) => {
          hilog.error(0x0000, 'testTag', 'infos: %{public}s', JSON.stringify(infos));
          for (const item of infos) {
            if (item.processName == 'com.ohos.appclonehap11' && item.appCloneIndex == appCloneIndex) {
              commonEventManager.publish('process_information_0100', parameters, (err, data) => {
                hilog.info(0x0000, 'testTag', '%{public}s', `${TEST_SUITE_NAME}-${JSON.stringify(parameters)} process_information_0100 publish success`);
              })
              this.context.terminateSelf();
            }
          }
        })
      }
    }
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    })
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    let appCloneIndex = this.context.getApplicationContext().getCurrentAppCloneIndex();
    hilog.info(0x0000, 'testTag', '%{public}s', '${JSON.stringify(appCloneIndex)} Ability onBackground');
    let parameters: commonEventManager.CommonEventPublishData = {
      parameters: {
        "appCloneIndex": appCloneIndex,
      }
    }
    if (AppStorage.get<Want>("recvWant").parameters.testCase == 900) {
      commonEventManager.publish('start_appClone_0900', parameters, (err, data) => {
        hilog.info(0x0000, 'testTag', '%{public}s', `${TEST_SUITE_NAME}-${JSON.stringify(parameters)} start_appClone_0900 publish success`);
      })
      this.context.terminateSelf();
    }
    if (AppStorage.get<Want>("recvWant").parameters.testCase == 1100) {
      commonEventManager.publish('start_appClone_1100', parameters, (err, data) => {
        hilog.info(0x0000, 'testTag', '%{public}s', `${TEST_SUITE_NAME}-${JSON.stringify(parameters)} start_appClone_1100 publish success`);
      })
      this.context.terminateSelf();
    }
  }
}
