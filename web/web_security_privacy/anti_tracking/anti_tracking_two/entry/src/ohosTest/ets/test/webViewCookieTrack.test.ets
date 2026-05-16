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
import { afterEach, beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import { waitForComponent } from './WaitTest';
// @ts-nocheck
let emitKey = ""

export default function ActsAcewebViewCookieTrack() {
  describe('ActsAcewebViewCookieTrack', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'testability/pages/webViewCookieTrack',
        }
        try {
            router.clear();
            let pages = router.getState();
            if (!("webViewCookieTrack" == pages.name)) {
                let result = await router.pushUrl(options);
            }
        } catch (err) {
            console.error("push webViewCookieTrack page error:" + err);
        }
      await waitForComponent("webViewCookieTrackTriggerButton");
        done()
    });


    /**
     * @tc.name   testWebViewCookieTrackEnableTrue
     * @tc.number SUB_ACE_WEB_enableIntelligentTrackingPrevention_API_0001
     * @tc.desc   test enableIntelligentTrackingPrevention true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewCookieTrackEnableTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let emitKey = "emitWebViewCookieTrackEnableTrue";
      Utils.emitEvent(emitKey, 160060)
      Utils.registerEvent("testWebViewCookieTrackEnableTrue", true, 160070, done);
      sendEventByKey('webViewCookieTrackTriggerButton', 10, '');
    })


    /**
     * @tc.name   testWebViewCookieTrackEnableFalse
     * @tc.number SUB_ACE_WEB_enableIntelligentTrackingPrevention_API_0002
     * @tc.desc   test enableIntelligentTrackingPrevention false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebViewCookieTrackEnableFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let emitKey = "emitWebViewCookieTrackEnableFalse";
      Utils.emitEvent(emitKey, 160060)
      Utils.registerEvent("testWebViewCookieTrackEnableFalse", true, 160080, done);
      sendEventByKey('webViewCookieTrackTriggerButton', 10, '');
    })


    /**
     * @tc.name   testCookieTrackClearTrackingPrevention
     * @tc.number SUB_ACE_WEB_clearIntelligentTrackingPreventionByPassingList_API_0005
     * @tc.desc   test clearIntelligentTrackingPreventionByPassingList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCookieTrackClearTrackingPrevention', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let emitKey = "emitCookieTrackClearTrackingPrevention";
      Utils.emitEvent(emitKey, 160060)
      Utils.registerEvent("testCookieTrackClearTrackingPrevention", true, 160090, done);
      sendEventByKey('webViewCookieTrackTriggerButton', 10, '');
    })
  })
}
