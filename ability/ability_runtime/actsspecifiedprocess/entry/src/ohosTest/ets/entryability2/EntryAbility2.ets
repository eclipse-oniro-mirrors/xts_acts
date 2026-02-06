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
 
import { AbilityConstant, UIAbility, application, Want} from '@kit.AbilityKit';
import common from '@ohos.app.ability.common';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import { BusinessError } from '@kit.BasicServicesKit';
import { Constant } from '../Common';
import { commonEventManager } from '@kit.BasicServicesKit';
const DOMAIN = 0x0000;

async function publishEvent(err: BusinessError) {
  let commonEventPublishData: commonEventManager.CommonEventPublishData = {
    code: err.code,
    data: err.message,
  };
  commonEventManager.publish(Constant.event_200, commonEventPublishData, () => {
    console.log('liubea-============>publish START_ABILITY_CALLBACK_998877 success==========>>');
  });
}

const TEST_SUITE_NAME: string = 'StartSpecifiedProcessTest';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onCreate');
    let resultCode: BusinessError = {
      code: 0,
      message: 'success',
      name: 'test'
    };
    if (want.parameters?.isPromote === true) {
      try {
        let headFlag: boolean = true;
        if (want.parameters?.isHead !== true) {
          headFlag = false;
        }
        application.promoteCurrentToCandidateMasterProcess(headFlag)
          .then(() => {
            console.info('promote succeed');
            publishEvent(resultCode);
          })
          .catch((err: BusinessError) => {
            console.error(`promote failed, code is ${err.code}, message is ${err.message}`);
            publishEvent(err);
          });
      } catch (error) {
        let code: number = (error as BusinessError).code;
        let message: string = (error as BusinessError).message;
        console.error(`promoteCurrentToCandidateMasterProcess failed, error.code: ${code}, error.message: ${message}`);
      }
    }

    if (want.parameters?.isDemote === true) {
      console.info(`${TEST_SUITE_NAME}====> begin: demote`)
      try {
        application.demoteCurrentFromCandidateMasterProcess()
          .then(() => {
            console.info(`${TEST_SUITE_NAME}====> err: test8`);
            console.info('demote succeed');
            publishEvent(resultCode);
          })
          .catch((err: BusinessError) => {
            console.error(`demote failed, code is ${err.code}, message is ${err.message}`);
            publishEvent(err);
          });
      } catch (error) {
        let code: number = (error as BusinessError).code;
        let message: string = (error as BusinessError).message;
        console.error(`demoteCurrentFromCandidateMasterProcess failed, error.code: ${code}, error.message: ${message}`);
      }
    }
  }

  onDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onBackground');
  }
}