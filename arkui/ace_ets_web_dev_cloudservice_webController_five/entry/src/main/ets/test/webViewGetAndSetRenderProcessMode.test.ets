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

export default function ActsAceWebViewGetAndSetRenderProcessMode() {
  describe('ActsAceWebViewGetAndSetRenderProcessMode', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'MainAbility/pages/webViewGetAndSetRenderProcessMode',
        }
        
        try {
            await Utils.sleep(1000)
            router.clear();
            let pages = router.getState();
            console.info("get webViewGetAndSetRenderProcessMode state success " + JSON.stringify(pages));
            if (!("webViewGetAndSetRenderProcessMode" == pages.name)) {
                console.info("get webViewGetAndSetRenderProcessMode state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                await Utils.sleep(1000);
                console.info("push webViewGetAndSetRenderProcessMode state success " + JSON.stringify(result));
            }
        } catch (err) {
            console.error("push webViewGetAndSetRenderProcessMode page error:" + err);
        }
        done()
    });
    
    beforeEach(async (done: Function) => {
        await Utils.sleep(1000);
        done();
    })


    /*
     *@tc.number SUB_ACE_WEB_GETAndSetRENDERPROCESSMODE_API_0001
     *@tc.name testWebViewGetAndSetRenderProcessMode
     *@tc.desc test getRenderProcessMode
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewGetAndSetRenderProcessMode01', 0, async (done: Function) => {
        emitKey = "emitWebViewGetAndSetRenderProcessMode01"
        Utils.emitEvent(emitKey, 10);
        Utils.registerEvent("testWebViewGetAndSetRenderProcessMode01", 'success', 8006, done);
        sendEventByKey('webViewGetAndSetRenderProcessModeButton', 10, '');
    })
    /*
     *@tc.number SUB_ACE_WEB_GETAndSetRENDERPROCESSMODE_API_0002
     *@tc.name testWebViewGetAndSetRenderProcessMode
     *@tc.desc test setRenderProcessMode
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testWebViewGetAndSetRenderProcessMode02', 0, async (done: Function) => {
      emitKey = "emitWebViewGetAndSetRenderProcessMode02"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testWebViewGetAndSetRenderProcessMode02", 'success', 8007, done);
      sendEventByKey('webViewGetAndSetRenderProcessModeButton', 10, '');
    })

  })
}
