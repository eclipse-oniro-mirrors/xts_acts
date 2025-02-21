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
let emitKey = ''

export default function ActsAcewebViewCookieTrackEnhance() {
  describe('ActsAcewebViewCookieTrackEnhance', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'MainAbility/pages/webViewCookieTrackEnhance',
        }
        
        try {
            await Utils.sleep(1000)
            router.clear();
            let pages = router.getState();
            if (!("webViewCookieTrackEnhance" == pages.name)) {
                let result = await router.pushUrl(options);
                await Utils.sleep(1000);
            }
        } catch (err) {
            console.error("push ActsAcewebViewCookieTrackEnhance page error:" + err);
        }
        done()
    });
    
    beforeEach(async (done: Function) => {
        await Utils.sleep(2000);
      done();
    })
    
    afterEach(async (done: Function) => {
        try {
            let backData: emitter.EventData = {
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
     *@tc.number SUB_ACE_WEB_enableIntelligentTrackingPrevention_API_0001
     *@tc.name testWebViewCookieTrackEnableTrue
     *@tc.desc test enableIntelligentTrackingPrevention true
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewCookieTrackEnableTrue', 0, async (done: Function) => {
      let emitKey = "emitWebViewCookieTrackEnableTrue";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testWebViewCookieTrackEnableTrue", true, 3001, done);
      sendEventByKey('webViewCookieTrackTriggerFeiButton', 10, '');
    })
    
    /*
     *@tc.number SUB_ACE_WEB_enableIntelligentTrackingPrevention_API_0002
     *@tc.name testWebViewCookieTrackEnableFalse
     *@tc.desc test enableIntelligentTrackingPrevention false
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewCookieTrackEnableFalse', 0, async (done: Function) => {
      let emitKey = "emitWebViewCookieTrackEnableFalse";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testWebViewCookieTrackEnableFalse", true, 3002, done);
      sendEventByKey('webViewCookieTrackTriggerFeiButton', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_clearIntelligentTrackingPreventionByPassingList_API_0003
     *@tc.name testCookieTrackClearTrackingPrevention
     *@tc.desc test clearIntelligentTrackingPreventionByPassingList
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewCookieTrackEnabled', 0, async (done: Function) => {
      let emitKey = "emitWebViewCookieTrackEnabled";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testWebViewCookieTrackEnabled", true, 3003, done);
      sendEventByKey('webViewCookieTrackTriggerFeiButton', 10, '');
    })

    /*
      *@tc.number SUB_ACE_WEB_addIntelligentTrackingPreventionByPassingList_API_0002
      *@tc.name testCookieTrackClearTrackingPrevention
      *@tc.desc test clearIntelligentTrackingPreventionByPassingList
      *@tc.size MediumTest
      *@tc.type Function
      *@tc.level 1
      */
    it('testNoCookieTrackingPrevention', 0, async (done: Function) => {
      let emitKey = "emitNoCookieTrackingPrevention";
      Utils.emitEvent(emitKey, 10)
      Utils.registerEvent("testNoCookieTrackingPrevention", true, 3008, done);
      sendEventByKey('webViewCookieTrackTriggerFeiButton', 10, '');
    })

  })
}
