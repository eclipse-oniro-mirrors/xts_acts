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
import { waitForComponents } from './WaitTest.test';
import { Driver } from '@kit.TestKit';

// @ts-nocheck
let emitKey = "emitOnfullscreenenterinfo"
const driver = Driver.create();

export default function webViewOnFullScreenEnterInfo() {
  describe('ActsAceDevWebViewOnFullScreenEnterInfoTest', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'testability/pages/webViewOnFullScreenEnterVideoInfo',
        }
        
        try {
            router.clear();
            let pages = router.getState();
            console.info("get webViewOnFullScreenEnterInfo state success " + JSON.stringify(pages));
            if (!("webViewOnFullScreenEnterInfo" == pages.name)) {
                console.info("get webViewOnFullScreenEnterInfo state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                console.info("push webViewOnFullScreenEnterInfo state success " + JSON.stringify(result));
            }
        } catch (err) {
            console.error("push webViewOnFullScreenEnterInfo page error:" + err);
        }
        await waitForComponents('webViewOnFullScreenEnterInfo');
        done()
    });
    
    beforeEach(async (done: Function) => {
      console.log("webViewOnFullScreenEnterInfo beforeEach start")
      done();
    })
    
    afterEach(async (done: Function) => {
      console.info("webViewOnFullScreenEnterInfo afterEach start");
      done();
    })


    /**
     * @tc.name   testOnFullScreenEnterVideoInfo
     * @tc.number SUB_ACE_WEB_BASIC_ETS_FullscreenEnterEvent_videoWidth_videoHeight_API_0001
     * @tc.desc   test FullScreenEnterEvent videowidth videoHeight
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOnFullScreenEnterVideoInfo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        sendEventByKey('TestwebViewOnFullScreenEnterInfo', 10, '');
        let emitKey="emitOnfullscreenenterInfo";
        Utils.emitEvent(emitKey,300410)
        Utils.registerBaseEvent("testOnFullScreenEnterVideoInfo", true, 300400, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
       await Utils.waitAndClickComponent(driver,'webViewOnFullScreenEnterInfo');
    })
  })
}
