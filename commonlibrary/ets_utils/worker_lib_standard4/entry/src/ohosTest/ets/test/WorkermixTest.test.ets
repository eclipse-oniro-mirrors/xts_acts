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

import hilog from '@ohos.hilog';
import { describe, it, expect, TestType, Size, Level} from '@ohos/hypium'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base';

let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
const TAG = '[Sample_Subscribe]';
const DOMAIN = 0xF811;
const PUBLISH_BUNDLE_NAME = 'com.example.workermixtest';
const driver: Driver = Driver.create();
const resourceManager = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
let sleep = async (delay: number = 1000): Promise<void> => {
  return new Promise((resolve, _) => {
    setTimeout(async () => {
      resolve();
    }, delay);
  });
};


export default function abilityTest() {
  describe('ActsWorkerMixTest', () => {

    /**
     * @tc.number     : SUB_Runtime_Mix_Create_Delete_threads_001
     * @tc.name       : testWorkerMix100
     * @tc.desc       : test worker total amount limited with error log
     * @tc.size       : SmallTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
      it('testWorkerMix001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        await abilityDelegator.startAbility({
          bundleName: PUBLISH_BUNDLE_NAME,
          abilityName: 'EntryAbility'
        })
        await sleep(200);
        hilog.info(DOMAIN, TAG, '%{public}s', 'test start');
        const descButton = await driver.findComponent(ON.text(await resourceManager.getStringValue($r('app.string.EntryAbility_desc'))));
        await sleep(200);
        await descButton?.click();
        await sleep(200);
        done();
      })
  })
}