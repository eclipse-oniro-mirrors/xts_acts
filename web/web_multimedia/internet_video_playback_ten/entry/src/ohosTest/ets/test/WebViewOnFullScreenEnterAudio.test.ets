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
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import emitter from '@ohos.events.emitter';
import Utils from './Utils.test';
import router from '@ohos.router';
import { waitForComponents } from './WaitTest.test';
import { Driver } from '@kit.TestKit';

// @ts-nocheck
let emitKey = ''
const driver = Driver.create();

export default function webViewOnFullScreenEnterInfoAudio() {
  describe('ActsAceDevWebViewOnFullScreenEnterInfoTestAudio', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'testability/pages/WebViewOnFullScreenEnterAudio',
        }
        
        try {
            router.clear();
            let pages = router.getState();
            console.info("get webViewOnFullScreenEnterAudio state success " + JSON.stringify(pages));
            if (!("WebViewOnFullScreenEnterAudio" == pages.name)) {
                console.info("get webViewOnFullScreenEnterAudio state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                console.info("push webViewOnFullScreenEnterAudio state success " + JSON.stringify(result));
            }
        } catch (err) {
            console.error("push webViewOnFullScreenEnterAudio page error:" + err);
        }
        await waitForComponents('webViewOnFullScreenEnterInfoAudio');
        done()
    });
    
    beforeEach(async (done: Function) => {
      done();
    })
    
    afterEach(async (done: Function) => {
      console.info(" webViewOnFullScreenEnterAudio afterEach start");
      done();
    })
    

    /**
    * @tc.number       SUB_ACE_BASIC_ETS_FullscreenEnterEventAudio_videoWidth_videoHeight_API_0001
    * @tc.name         testOnFullScreenEnterVideoInfoAudio
    * @tc.desc         test FullScreenEnterEvent videowidth videoHeight
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        Level 0
    */
    it('testOnFullScreenEnterVideoInfoAudio', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let emitKey="emitOnfullscreenenterAudioInfo";
        Utils.emitEvent(emitKey,300420)
        Utils.registerBaseEvent("testOnFullScreenEnterVideoInfoAudio", true, 300430, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
        await Utils.waitAndClickComponent(driver,'webViewOnFullScreenEnterInfoAudio')
    })
  })
}
