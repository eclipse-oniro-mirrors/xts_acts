/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import commonEventManager from '@ohos.commonEventManager';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const DELEGATOR: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
 
let liveFormSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
    events: ['LiveFormExtensionAbility_Create'],
};
 
let liveFormSubscriber: commonEventManager.CommonEventSubscriber;
 
let finishFormEvent: string = "FMS_FormTestFinish_commonEvent";
 
function sleep(time: number): Promise<void> {
    return new Promise((resolve) => setTimeout(resolve, time));
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(() => {
    })

    beforeEach(async () => {
      liveFormSubscriber = await commonEventManager.createSubscriber(liveFormSubscribeInfo);
      await sleep(1000);
    })

    afterEach(() => {
      commonEventManager.unsubscribe(liveFormSubscriber);
    })

    afterAll(() => {
    })

    /**
     * @tc.name   SUB_ABILITY_FORM_LIVE_FORM_EXTENSION_TEST_0100
     * @tc.number SUB_ABILITY_FORM_LIVE_FORM_EXTENSION_TEST_0100
     * @tc.desc   Test LiveFormExtensionAbility is created and publishes event successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_LIVE_FORM_EXTENSION_TEST_0100', Level.LEVEL0, async (done: Function) => {
      console.log(`SUB_ABILITY_FORM_LIVE_FORM_EXTENSION_TEST_0100 start`);
      let liveFormCallBack = (_:BusinessError, data: commonEventManager.CommonEventPublishData) => {
        console.info("====>SUB_ABILITY_FORM_LIVE_FORM_EXTENSION_TEST_0100 data:====>" + JSON.stringify(data));
        expect(data.code).assertEqual(0);
        
        commonEventManager.publish(finishFormEvent, data, async (err) => {
          console.info('SUB_ABILITY_FORM_LIVE_FORM_EXTENSION_TEST_0100 publish' + JSON.stringify(err));
          await sleep(2000);
          done();
        });
      }

      commonEventManager.subscribe(liveFormSubscriber, liveFormCallBack);
      console.log(`SUB_ABILITY_FORM_LIVE_FORM_EXTENSION_TEST_0100 startAbility start`);
      await DELEGATOR.startAbility({
        bundleName: "com.example.formsystemhost",
        abilityName: "EntryAbility",
        parameters: {
            "formId" : "0",
            "name" : "widget",
            "bundle" : "com.example.getformsinfotest",
            "ability" : "EntryFormAbility",
            "moduleName" : "entry",
            "updateFormSize" : true,
            "isTestFormId": true,
            "testFormId": "0",
            "newDimension" : 3,
            "isLiveForm" : true,
        }
      }).then(() => {
        console.log(`SUB_ABILITY_FORM_LIVE_FORM_EXTENSION_TEST_0100 startAbilityhost end`);
      }).catch((err: BusinessError) => {
        console.log(`SUB_ABILITY_FORM_LIVE_FORM_EXTENSION_TEST_0100 startAbilityhost error: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      });
      console.log(`SUB_ABILITY_FORM_LIVE_FORM_EXTENSION_TEST_0100 startAbility end`);
    })
  })
}