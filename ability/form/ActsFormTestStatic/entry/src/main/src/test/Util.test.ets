/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import CommonEventManager from '@ohos.commonEventManager';


let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const unsubscribeCallback = (tcNumber: string) => {
  console.info(`====>${tcNumber} unsubscribeCallback====>`);
}
let subscriberForm: CommonEventManager.CommonEventSubscriber;

const DOMAIN: number = 0x0000;
const TAG: string = 'testTag Utils';

export default class Utils {
  static async msSleep(count:int) : Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }

  static async executeCmd(cmdTest: string, grepLog: string = 'StsSetAction'): Promise<boolean> {
    let data: abilityDelegatorRegistry.ShellCmdResult = await abilityDelegator.executeShellCommand(cmdTest);
    if (data === null || data === undefined || !data) {
      hilog.info(DOMAIN, TAG, 'cmdTest executeShellCommand failed');
      return false;
    }
    let message: string = data.stdResult;
    hilog.info(DOMAIN, TAG, 'cmdTest result: %{public}s', message);
    if (message.includes(grepLog)) {
      hilog.info(DOMAIN, TAG, 'cmdTest success');
      return true;
    }
    hilog.info(DOMAIN, TAG, 'cmdTest failed');
    return false;
  }

  static startAbility(abilityName: string = 'TestFormAbility',
                      bundleName: string = 'com.example.helloworld',
                      uri?: string): boolean {
    let isSuccessStartAbility: boolean = false;
    try {
      abilityDelegator.startAbility({
        abilityName: abilityName,
        // use unified ability when push.url ready.
        uri: uri,
        bundleName: bundleName,
      }).then(() => {
        hilog.info(DOMAIN, TAG, `start ${abilityName} success.`);
        isSuccessStartAbility = true;
      });
      await Utils.msSleep(500);
    } catch (error: BusinessError) {
      hilog.error(DOMAIN, TAG, `start ${abilityName} fail. message: ${error?.message}`);
      return false;
    }
    if (isSuccessStartAbility) {
      return true;
    }
    hilog.error(DOMAIN, TAG, `start ${abilityName} timeout so failed.`);
    return false;
  }

}