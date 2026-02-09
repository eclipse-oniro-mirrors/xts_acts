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

import AbilityStage from '@ohos.app.ability.AbilityStage';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';
import application from '@ohos.app.ability.application';
import CommonEventManager from '@ohos.commonEventManager';

const DOMAIN = 0x0000;
export enum Constant {
  event_000 = 'START_ABILITY_CALLBACK_000',
  event_100 = 'START_ABILITY_CALLBACK_100',
  event_200 = 'START_ABILITY_CALLBACK_200',
  event_300 = 'START_ABILITY_CALLBACK_300',
  event_400 = 'START_ABILITY_CALLBACK_400',
  event_500 = 'START_ABILITY_CALLBACK_500',
  event_600 = 'START_ABILITY_CALLBACK_600',
  event_700 = 'START_ABILITY_CALLBACK_700',
}

async function publishEvent(err: BusinessError) {
  let commonEventPublishData: CommonEventManager.CommonEventPublishData = {
    code: err.code,
    data: err.message,
  };
  CommonEventManager.publish(Constant.event_400, commonEventPublishData, () => {
    console.log('<<============>publish START_ABILITY_CALLBACK_998877 success==========>>');
  });
}

export default class MyAbilityStage extends AbilityStage {
  onCreate(): void {
    console.log('MyAbilityStage.onCreate is called');
  }
  async onNewProcessRequestAsync(want: Want): Promise<string> {
    console.log('MyAbilityStage.onNewProcessRequest is called');
    let resultCode: BusinessError = {
      code: 0,
      message: 'success',
      name: 'test'
    };
    if (want.parameters?.['isOnNewProcessRequest'] === true) {
      try {
        await application.exitMasterProcessRole()
          .then(() => {
            console.info('exit succeed');
            publishEvent(resultCode);
          })
          .catch((err: Error): void => {
            console.error(`demote failed, code is ${err.code}, message is ${err.message}`);
            publishEvent(err as BusinessError<void>);
          });
      } catch (error) {
        let code: number = (error as BusinessError).code;
        let message: string = (error as BusinessError).message;
        console.error(`exitMasterProcessRole failed, error.code: ${code}, error.message: ${message}`);
      }
    }
    return 'test';
  }
}