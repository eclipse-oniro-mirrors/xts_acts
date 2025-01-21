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

export default function webViewOnViewportFitChange() {
  describe('ActsAceWebViewOnViewportFitChange', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'MainAbility/pages/webViewOnViewportFitChange',
        }
        
        try {
            await Utils.sleep(1000)
            router.clear();
            let pages = router.getState();
            console.info("get webViewOnViewportFitChange state success " + JSON.stringify(pages));
            if (!("webViewOnViewportFitChange" == pages.name)) {
                console.info("get webViewOnViewportFitChange state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                await Utils.sleep(1000);
                console.info("push webViewOnViewportFitChange state success " + JSON.stringify(result));
            }
        } catch (err) {
            console.error("push webViewOnViewportFitChange page error:" + err);
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
     *@tc.number SUB_ACE_WEB_OnViewportFitChange_API_0001
     *@tc.name testWebViewOnViewportFitChange
     *@tc.desc test OnViewportFitChange
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewOnViewportFitChange', 0, async (done: Function) => {
        emitKey = "emitWebViewOnViewportFitChange"
        Utils.emitEvent(emitKey, 10);
        Utils.registerEvent("testWebViewOnViewportFitChange", true, 1340, done);
        sendEventByKey('webViewOnViewportFitChange', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_ViewportFit_COVER_API_0002
     *@tc.name testWebView_ViewportFit_COVER
     *@tc.desc ViewportFit_COVER
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebView_ViewportFit_COVER', 0, async (done: Function) => {
        emitKey = "emitWebView_ViewportFit_COVER"
        Utils.emitEvent(emitKey, 10);
        Utils.registerEvent("testWebView_ViewportFit_COVER", true, 1341, done);
        sendEventByKey('webViewOnViewportFitChange', 10, '');
    })
  })
}
