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
import { afterEach, beforeAll, beforeEach, describe, it, expect } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
// @ts-nocheck
let emitKey = ""

export default function ActsAceWebViewAnrCallback() {
  describe('ActsAceWebViewAnrCallback', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'MainAbility/pages/webViewAnrCallback',
        }
        
        try {
            await Utils.sleep(1000)
            router.clear();
            let pages = router.getState();
            console.info("get webViewAnrCallback state success " + JSON.stringify(pages));
            if (!("webViewAnrCallback" == pages.name)) {
                console.info("get webViewAnrCallback state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                await Utils.sleep(1000);
                console.info("push webViewAnrCallback state success " + JSON.stringify(result));
            }
        } catch (err) {
            console.error("push webViewAnrCallback page error:" + err);
        }
        done()
    });
    
    beforeEach(async (done: Function) => {
        await Utils.sleep(1000);
        done();
    })

      afterEach(async (done: Function) => {
        try {
            let backData: events_emitter.EventData = {
                data: {
                    "ACTION": emitKey
                }
            }
            let backEvent : events_emitter.InnerEvent = {
                eventId: 10,
                priority: events_emitter.EventPriority.LOW
            }
            console.info("start send emitKey");
            events_emitter.emit(backEvent, backData);
        } catch (err) {
            console.error("emit emitKey error:" + JSON.stringify(err));
        }
        await Utils.sleep(1000);
      done();
    })

    /*
     *@tc.number SUB_ACE_WEB_OnRenderProcessResponding_API_0001
     *@tc.name testWebViewOnRenderProcessResponding
     *@tc.desc OnRenderProcessResponding
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewOnRenderProcessResponding', 0, async (done: Function) => {
        emitKey = "emitWebViewOnRenderProcessResponding"
        Utils.emitEvent(emitKey, 10);
        Utils.registerBaseEvent("testWebViewOnRenderProcessResponding", true, 1336,
          done, (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        sendEventByKey('webViewAnrCallback', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_NotRespondingReason_NAVIGATION_COMMIT_TIMEOUT_API_0002
     *@tc.name testWebView_NotRespondingReason_NAVIGATION_COMMIT_TIMEOUT
     *@tc.desc NotRespondingReason_NAVIGATION_COMMIT_TIMEOUT
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewNotRespondingReason_NAVIGATION_COMMIT_TIMEOUT', 0, async (done: Function) => {
        emitKey = "emitWebViewNotRespondingReason_NAVIGATION_COMMIT_TIMEOUT"
        Utils.emitEvent(emitKey, 10);
        Utils.registerBaseEvent("testWebViewNotRespondingReason_NAVIGATION_COMMIT_TIMEOUT", true, 1338,
          done, (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        sendEventByKey('webViewAnrCallback', 10, '');
    })
  })
}