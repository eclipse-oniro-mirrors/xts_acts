/**
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
import { afterEach, beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON } from '@kit.TestKit';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
let emitKey = ""

export default function ActsAceWebViewSetConnectionTimeout() {
  describe('ActsAceWebViewSetConnectionTimeout', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'testability/pages/webViewSetConnectionTimeout',
        }
        
        try {
            router.clear();
            let pages = router.getState();
            console.info("get webViewSetConnectionTimeout state success " + JSON.stringify(pages));
            if (!("webViewSetConnectionTimeout" == pages.name)) {
                console.info("get webViewSetConnectionTimeout state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                console.info("push webViewSetConnectionTimeout state success " + JSON.stringify(result));
            }
        } catch (err) {
            console.error("push webViewSetConnectionTimeout page error:" + err);
        }
         await waitForComponent('webViewSetConnectionTimeoutButton');
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
     * @tc.name   testWebViewSetConnectionTimeoutZeroSeconds
     * @tc.number SUB_ACE_WEB_SETCONNECTIONTIMEOUT_API_0001
     * @tc.desc   test setConnectionTimeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSetConnectionTimeoutZeroSeconds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        emitKey = "emitWebViewSetConnectionTimeoutZeroSeconds"
        Utils.emitEvent(emitKey, 14077);
        Utils.registerBaseEvent("testWebViewSetConnectionTimeoutZeroSeconds", 'Error', 14078, done, (backData: events_emitter.EventData, expected: Object) => {
         expect(backData?.data?.ACTION).assertEqual(expected);
        });
        sendEventByKey('webViewSetConnectionTimeoutButton', 10, '');
    })


    /**
     * @tc.name   testWebViewSetConnectionTimeoutPointFiveSeconds
     * @tc.number SUB_ACE_WEB_SETCONNECTIONTIMEOUT_API_0002
     * @tc.desc   test setConnectionTimeout_point_five
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSetConnectionTimeoutPointFiveSeconds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSetConnectionTimeoutPointFiveSeconds"
      Utils.emitEvent(emitKey, 14077);
      Utils.registerBaseEvent("testWebViewSetConnectionTimeoutPointFiveSeconds", 'Error', 14079, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webViewSetConnectionTimeoutButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSetConnectionTimeoutNegativeOneSeconds
     * @tc.number SUB_ACE_WEB_SETCONNECTIONTIMEOUT_API_0003
     * @tc.desc   test setConnectionTimeout_negative_one
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSetConnectionTimeoutNegativeOneSeconds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSetConnectionTimeoutNegativeOneSeconds"
      Utils.emitEvent(emitKey, 14077);
      Utils.registerBaseEvent("testWebViewSetConnectionTimeoutNegativeOneSeconds", 'Error', 14080, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webViewSetConnectionTimeoutButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSetConnectionTimeoutWithA
     * @tc.number SUB_ACE_WEB_SETCONNECTIONTIMEOUT_API_0004
     * @tc.desc   test setConnectionTimeout_with_a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSetConnectionTimeoutWithA', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSetConnectionTimeoutWithA"
      Utils.emitEvent(emitKey, 14077);
      Utils.registerBaseEvent("testWebViewSetConnectionTimeoutWithA", 'Error', 14081, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webViewSetConnectionTimeoutButton', 10, '');
    })

    /**
     * @tc.name   testWebViewSetConnectionTimeoutTenSeconds
     * @tc.number SUB_ACE_WEB_SETCONNECTIONTIMEOUT_API_0005
     * @tc.desc   test setConnectionTimeout_ten_seconds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSetConnectionTimeoutTenSeconds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSetConnectionTimeoutTenSeconds"
      Utils.emitEvent(emitKey, 14077);
      Utils.registerBaseEvent("testWebViewSetConnectionTimeoutTenSeconds", 'Time_out', 14082, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webViewSetConnectionTimeoutButton', 10, '');
    })
  })
}
