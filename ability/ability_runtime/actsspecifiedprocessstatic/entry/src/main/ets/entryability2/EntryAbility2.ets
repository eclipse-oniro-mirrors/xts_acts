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
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import application from '@ohos.app.ability.application';
import CommonEventManager from '@ohos.commonEventManager';

const DOMAIN = 0x0000;

async function publishEvent(err: BusinessError) {
  let commonEventPublishData: CommonEventManager.CommonEventPublishData = {
    code: err.code,
    data: err.message,
  };
  CommonEventManager.publish('START_ABILITY_CALLBACK_100', commonEventPublishData, () => {
    console.log('liubea-============>publish START_ABILITY_CALLBACK_998877 success==========>>');
  });
}

const TEST_SUITE_NAME: string = 'StartSpecifiedProcessStaticTest';

class EntryAbility2 extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag EntryAbility2', 'EntryAbility2 onCreate');
    let resultCode: BusinessError = {
      code: 0,
      message: 'success',
      name: 'test'
    };
    if (want.parameters?.['isPromote'] === true) {
      try {
        let headFlag: boolean = true;
        if (want.parameters?.['isHead'] !== true) {
          headFlag = false;
        }
        application.promoteCurrentToCandidateMasterProcess(headFlag)
          .then(() => {
            console.info('promote succeed');
            publishEvent(resultCode);
          })
          .catch((err: Error): void => {
            console.error(`promote failed, code is ${err.code}, message is ${err.message}`);
            publishEvent(err as BusinessError<void>);
          });
      } catch (error) {
        let code: number = (error as BusinessError).code;
        let message: string = (error as BusinessError).message;
        console.error(`promoteCurrentToCandidateMasterProcess failed, error.code: ${code}, error.message: ${message}`);
      }
    }

    if (want.parameters?.['isDemote'] === true) {
      console.info(`${TEST_SUITE_NAME}====> begin: demote`)
      try {
        application.demoteCurrentFromCandidateMasterProcess()
          .then(() => {
            console.info(`${TEST_SUITE_NAME}====> err: test8`);
            console.info('demote succeed');
            publishEvent(resultCode);
          })
          .catch((err: Error): void => {
            console.error(`demote failed, code is ${err.code}, message is ${err.message}`);
            publishEvent(err as BusinessError<void>);
          });
      } catch (error) {
        let code: number = (error as BusinessError).code;
        let message: string = (error as BusinessError).message;
        console.error(`demoteCurrentFromCandidateMasterProcess failed, error.code: ${code}, error.message: ${message}`);
      }
    }
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag EntryAbility2', 'EntryAbility2 onWindowStageCreate');
    windowStage.loadContent('pages/Index', (err: BusinessError<void> | null): void => {
        hilog.info(0x0000, 'testTag EntryAbility2', 'loadContent entering');
        if (err?.code) {
          hilog.info(0x0000, 'testTag EntryAbility2', 'loadContent error');
          return;
        }
        hilog.info(0x0000, 'testTag EntryAbility2', 'loadContent ok');
      });
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
  }

  onBackground() {
    hilog.info(0x0000, 'testTag EntryAbility2', 'EntryAbility2 onBackground');
  }
}