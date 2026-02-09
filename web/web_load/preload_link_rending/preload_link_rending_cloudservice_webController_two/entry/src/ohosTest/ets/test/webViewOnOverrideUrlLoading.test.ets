/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import { beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 201350;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webViewOnOverrideUrlLoading() {
  describe('ActsAceWebViewOnOverrideUrlLoading', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'testability/pages/webViewOnOverrideUrlLoading',
        }
        
        try {
            router.clear();
            let pages = router.getState();
            console.info("get webViewOnOverrideUrlLoading state success " + JSON.stringify(pages));
            if (!("webViewOnOverrideUrlLoading" == pages.name)) {
                console.info("get webViewOnOverrideUrlLoading state success " + JSON.stringify(pages.name));
                await router.pushUrl(options);
                console.info("push webViewOnOverrideUrlLoading page success");
            }
        } catch (err) {
            console.error("push webViewOnOverrideUrlLoading page error:" + err);
        }
        await driver.waitForComponent(ON.id("webViewOnOverrideUrlLoading"), 10000);
        console.log("waitForComponent webViewOnOverrideUrlLoading");
        done()
    });
    
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      done();
    })

    /**
     * @tc.name   testWebViewwebViewOnOverrideUrlLoadingGroup
     * @tc.number SUB_ACE_SUB_ONOVERRIDEURLLOADING_API_GROUP_0600
     * @tc.desc   test interface of OnOverrideUrlLoading with runjavascript jump
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewwebViewOnOverrideUrlLoadingGroup', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebViewOnOverrideUrlLoading", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerBaseEvent("emitWebViewwebViewOnOverrideUrlLoading", 'true', 201360, () => { isReturn = true }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "webViewOnOverrideUrlLoading");
      if (await Utils.waitForExist(() => isReturn, 'testWebViewwebViewOnOverrideUrlLoadingGroup' + '_returnCheck', true, 1000)) {
        done();
      }
    })
  })
}