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
import { beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import { Driver, ON } from '@kit.TestKit';
// @ts-nocheck
const driver = Driver.create();
const EVENT_ID_SET_EMIT_KEY = 360000;
let emitKey = ""

export default function webViewNativeMediaPlayerEnableFalse() {
  describe('ActsAceWebViewNativeMediaPlayerEnableFalse', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'testability/pages/webViewNativeMediaPlayerEnableFalse',
        }
        
        try {
            router.clear();
            let pages = router.getState();
            console.info("get webViewNativeMediaPlayerEnableFalse state success " + JSON.stringify(pages));
            if (!("webViewNativeMediaPlayerEnableFalse" == pages.name)) {
                console.info("get webViewNativeMediaPlayerEnableFalse state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                console.info("push webViewNativeMediaPlayerEnableFalse state success " + JSON.stringify(result));
            }
        } catch (err) {
            console.error("push webViewNativeMediaPlayerEnableFalse page error:" + err);
        }
        await driver.waitForComponent(ON.id("webViewNativeMediaPlayerEnableFalse"), 10000);
        console.log("webViewNativeMediaPlayerEnableFalse");
        done()
    });
    
    beforeEach(async (done: Function) => {
        done();
    })
    /**
     * @tc.name   testWebViewNativeMediaPlayerEnableFalse
     * @tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_0100
     * @tc.desc   test NativeMediaPlayerEnableFalse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewNativeMediaPlayerEnableFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
       emitKey = "emitWebViewNativeMediaPlayerEnableFalse"
       Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
       Utils.registerEvent("testWebViewNativeMediaPlayerEnableFalse", true, 360010, done);
       let StartModel = await driver.findComponent(ON.id("webViewNativeMediaPlayerEnableFalse"));
       await StartModel.click();
    })
    /**
     * @tc.name   testWebViewNativeMediaPlayerEnableFalseShouldOverlayFalse
     * @tc.number SUB_ACE_WEB_NATIVEVIDEO_INTERFACE_0200
     * @tc.desc   test NativeMediaPlayerEnableFalseShouldOverlayFalse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewNativeMediaPlayerEnableFalseShouldOverlayFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
       emitKey = "emitWebViewNativeMediaPlayerEnableFalseShouldOverlayFalse";
       Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
       Utils.registerEvent("testWebViewNativeMediaPlayerEnableFalseShouldOverlayFalse", true, 360020, done);
       let StartModel = await driver.findComponent(ON.id("webViewNativeMediaPlayerEnableFalse"));
       await StartModel.click();
    })
  })
}
