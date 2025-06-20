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
import { describe, it, expect, beforeEach, beforeAll } from '@ohos/hypium'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base';
import emitter from '@ohos.events.emitter';

const TAG = 'AddFormMenuItem';
const DOMAIN = 0xF811;
const PUBLISH_BUNDLE_NAME = 'com.example.menuprovider';
const cmd = 'hilog -x | grep AddFormMenuItemSuccessAndFormId';
const ERR_DEVICE_NOT_SUPPORTED = 801;
const driver: Driver = Driver.create();
const resourceManager = AbilityDelegatorRegistry?.getAbilityDelegator()?.getAppContext()?.resourceManager;
let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
let sleep = async (delay: number = 1000): Promise<void> => {
  return new Promise((resolve, _) => {
    setTimeout(async () => {
      resolve();
    }, delay);
  });
};

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(async () => {
      await sleep(1000);
    })

    beforeEach(async () => {
      await abilityDelegator.executeShellCommand("hilog -r");
      await sleep(500);
      await abilityDelegator.startAbility({
        bundleName: PUBLISH_BUNDLE_NAME,
        abilityName: 'TestFormAbility'
      })
      await sleep(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test start');
    })

    /**
     * @tc.number: SUB_AA_ADD_FORM_MENU_ITEM_0100
     * @tc.name: testAddFormMenuItem0100
     * @tc.desc: add form component to desktop, judge the FormId is not null. Zh-CN OS only;
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 3
     */
    it('testAddFormMenuItem0100', 0, async (done: Function) => {
      console.log("testAddFormMenuItem0100 start");
      emitter.on({
        eventId: ERR_DEVICE_NOT_SUPPORTED 
      }, () => {
        console.log(`testAddFormMenuItem0100 emitter callback`);
        done();
      });
      const descButton = await driver.findComponent(ON.text(await resourceManager.getStringValue($r('app.string.TestFormAbility_desc'))));
      await sleep(200);
      await descButton?.click();
      await sleep(200);
      const labelButton =  await driver.findComponent(ON.text(await resourceManager.getStringValue($r('app.string.TestFormAbility_label'))));
      await sleep(200);
      await labelButton?.click();
      await sleep(1000);
      const labelButton2 = await driver.findComponent(ON.id("SwiperLayout_AddToDesktopButton"));
      await labelButton2?.click();
      await sleep(1000);
      await abilityDelegator.executeShellCommand(cmd)
        .then((data) => {
          hilog.info(DOMAIN, TAG, JSON.stringify(data));
          let firstFilter = JSON.stringify(data.stdResult).split("JSAPP: AddFormMenuItemSuccessAndFormId", 2)
          let secondFilter = JSON.stringify(firstFilter[1]).split("\FormID  ");
          let myFormId: string = secondFilter[0];
          expect(myFormId.length > 0).assertTrue();
          done();
        })
        .catch((error: BusinessError) => {
          console.log("Test failed : " + JSON.stringify(error));
          expect().assertFail();
          done();
        });
      emitter.off(ERR_DEVICE_NOT_SUPPORTED );
    })
  })
}