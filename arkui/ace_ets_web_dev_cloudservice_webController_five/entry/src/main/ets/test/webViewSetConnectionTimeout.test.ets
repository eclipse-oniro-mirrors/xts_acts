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
import { afterEach, beforeAll, beforeEach, describe, it, expect } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
// @ts-nocheck
let emitKey = ""

export default function ActsAceWebViewSetConnectionTimeout() {
  describe('ActsAceWebViewSetConnectionTimeout', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'MainAbility/pages/webViewSetConnectionTimeout',
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
        await Utils.sleep(1000);
        done();
    })


    /*
     *@tc.number SUB_ACE_WEB_SETCONNECTIONTIMEOUT_API_0001
     *@tc.name testWebViewSetConnectionTimeout_zero_seconds
     *@tc.desc test setConnectionTimeout
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSetConnectionTimeoutZeroSeconds', 0, async (done: Function) => {
        emitKey = "emitWebViewSetConnectionTimeoutZeroSeconds"
        Utils.emitEvent(emitKey, 10);
        Utils.registerEvent("testWebViewSetConnectionTimeoutZeroSeconds", 'Error', 8001, done);
        sendEventByKey('webViewSetConnectionTimeoutButton', 10, '');
    })


    /*
     *@tc.number SUB_ACE_WEB_SETCONNECTIONTIMEOUT_API_0002
     *@tc.name testWebViewSetConnectionTimeout
     *@tc.desc test setConnectionTimeout_point_five
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSetConnectionTimeoutPointFiveSeconds', 0, async (done: Function) => {
      emitKey = "emitWebViewSetConnectionTimeoutPointFiveSeconds"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSetConnectionTimeoutPointFiveSeconds", 'Error', 8002, done);
      sendEventByKey('webViewSetConnectionTimeoutButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SETCONNECTIONTIMEOUT_API_0003
     *@tc.name testWebViewSetConnectionTimeout
     *@tc.desc test setConnectionTimeout_negative_one
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSetConnectionTimeoutNegativeOneSeconds', 0, async (done: Function) => {
      emitKey = "emitWebViewSetConnectionTimeoutNegativeOneSeconds"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSetConnectionTimeoutNegativeOneSeconds", 'Error', 8003, done);
      sendEventByKey('webViewSetConnectionTimeoutButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SETCONNECTIONTIMEOUT_API_0004
     *@tc.name testWebViewSetConnectionTimeout
     *@tc.desc test setConnectionTimeout_with_a
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSetConnectionTimeoutWithA', 0, async (done: Function) => {
      emitKey = "emitWebViewSetConnectionTimeoutWithA"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSetConnectionTimeoutWithA", 'Error', 8004, done);
      sendEventByKey('webViewSetConnectionTimeoutButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_SETCONNECTIONTIMEOUT_API_0005
     *@tc.name testWebViewSetConnectionTimeout
     *@tc.desc test setConnectionTimeout_ten_seconds
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewSetConnectionTimeoutTenSeconds', 0, async (done: Function) => {
      emitKey = "emitWebViewSetConnectionTimeoutTenSeconds"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewSetConnectionTimeoutTenSeconds", 'Time_out', 8005, done);
      sendEventByKey('webViewSetConnectionTimeoutButton', 10, '');
    })
  })
}
