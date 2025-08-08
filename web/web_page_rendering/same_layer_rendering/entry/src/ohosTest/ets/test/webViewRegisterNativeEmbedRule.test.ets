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
// @ts-nocheck
let emitKey = "emitWebViewRegisterNativeEmbedRule"

export default function webViewRegisterNativeEmbedRule() {
  describe('ActsAceRegisterNativeEmbedRule', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'testability/pages/webViewRegisterNativeEmbedRule',
        }
        
        try {
            await Utils.sleep(1000)
            router.clear();
            let pages = router.getState();
            console.info("get webViewRegisterNativeEmbedRule state success " + JSON.stringify(pages));
            if (!("webViewRegisterNativeEmbedRule" == pages.name)) {
                console.info("get webViewRegisterNativeEmbedRule state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                await Utils.sleep(1000);
                console.info("push webViewRegisterNativeEmbedRule page success " + JSON.stringify(result));
            }
        } catch (err) {
            console.error("push webViewRegisterNativeEmbedRule page error:" + err);
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
    * @tc.number     : SUB_ACE_WEB_REGISTERNATIVEEMBEDRULE_API_0500
    * @tc.name       : testWebViewRegisterNativeEmbedRule
    * @tc.desc       : test registerNativeEmbedRule
    * @tc.size_t     : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testWebViewRegisterNativeEmbedRule', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Utils.registerEvent("emitWebViewRegisterNativeEmbedRule", true, 10003, done);
        sendEventByKey('webViewRegisterNativeEmbedRule', 10, '');
    })
  })
}
