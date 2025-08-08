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
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
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
            await Utils.sleep(1000)
            router.clear();
            let pages = router.getState();
            console.info("get webViewSetConnectionTimeout state success " + JSON.stringify(pages));
            if (!("webViewSetConnectionTimeout" == pages.name)) {
                console.info("get webViewSetConnectionTimeout state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                await Utils.sleep(1000);
                console.info("push webViewSetConnectionTimeout state success " + JSON.stringify(result));
            }
        } catch (err) {
            console.error("push webViewSetConnectionTimeout page error:" + err);
        }
        done()
    });
    
    beforeEach(async (done: Function) => {
        config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
          console.info(`enable success`);
          }).catch((err: object) => {
          console.error(`failed to enable, ${err}`);
        })
        await Utils.sleep(1000);
        done();
    })


    /*
     *@tc.number SUB_ACE_WEB_SETCONNECTIONTIMEOUT_API_0001
     *@tc.name testWebViewSetConnectionTimeoutZeroSeconds
     *@tc.desc test setConnectionTimeout
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSetConnectionTimeoutZeroSeconds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        emitKey = "emitWebViewSetConnectionTimeoutZeroSeconds"
        Utils.emitEvent(emitKey, 10);
        Utils.registerBaseEvent("testWebViewSetConnectionTimeoutZeroSeconds", 'Error', 8001, done, (backData: events_emitter.EventData, expected: Object) => {
         expect(backData?.data?.ACTION).assertEqual(expected);
        });
        sendEventByKey('webViewSetConnectionTimeoutButton', 10, '');
    })


    /*
     *@tc.number SUB_ACE_WEB_SETCONNECTIONTIMEOUT_API_0002
     *@tc.name testWebViewSetConnectionTimeoutPointFiveSeconds
     *@tc.desc test setConnectionTimeout_point_five
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSetConnectionTimeoutPointFiveSeconds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSetConnectionTimeoutPointFiveSeconds"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewSetConnectionTimeoutPointFiveSeconds", 'Error', 8002, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webViewSetConnectionTimeoutButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SETCONNECTIONTIMEOUT_API_0003
     *@tc.name testWebViewSetConnectionTimeoutNegativeOneSeconds
     *@tc.desc test setConnectionTimeout_negative_one
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSetConnectionTimeoutNegativeOneSeconds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSetConnectionTimeoutNegativeOneSeconds"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewSetConnectionTimeoutNegativeOneSeconds", 'Error', 8003, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webViewSetConnectionTimeoutButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SETCONNECTIONTIMEOUT_API_0004
     *@tc.name testWebViewSetConnectionTimeoutWithA
     *@tc.desc test setConnectionTimeout_with_a
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSetConnectionTimeoutWithA', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSetConnectionTimeoutWithA"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewSetConnectionTimeoutWithA", 'Error', 8004, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webViewSetConnectionTimeoutButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SETCONNECTIONTIMEOUT_API_0005
     *@tc.name testWebViewSetConnectionTimeoutTenSeconds
     *@tc.desc test setConnectionTimeout_ten_seconds
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 1
     */
    it('testWebViewSetConnectionTimeoutTenSeconds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSetConnectionTimeoutTenSeconds"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewSetConnectionTimeoutTenSeconds", 'Time_out', 8005, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webViewSetConnectionTimeoutButton', 10, '');
    })

    /*
    *@tc.number SUB_ACE_WEB_SETCONNECTIONTIMEOUT_API_0006
    *@tc.name testWebViewSetConnectionAboutAppearTimeoutFiveSeconds
    *@tc.desc test setConnectionTimeout_aboutAppear_five_seconds
    *@tc.size MediumTest
    *@tc.type Function
    *@tc.level Level 1
    */
    it('testWebViewSetConnectionAboutAppearTimeoutFiveSeconds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSetConnectionAboutAppearTimeoutFiveSeconds"
      Utils.emitEvent(emitKey, 10);
      Utils.registerBaseEvent("testWebViewSetConnectionAboutAppearTimeoutFiveSeconds", 'Time_out', 24801, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webViewSetConnectionTimeoutButton', 10, '');
    })
  })
}
