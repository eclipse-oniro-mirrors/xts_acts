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
import { beforeAll, beforeEach, expect, describe, it, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 127;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function ActsAceWebViewSdkSchemeHandlerThree() {
  describe('ActsAceWebViewSdkSchemeHandlerThree', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'testability/pages/webViewSdkSchemeHandlerThree',
        }
        
        try {
            router.clear();
            let pages = router.getState();
            console.info("get webViewSdkSchemeHandlerThree state success " + JSON.stringify(pages));
            if (!("webViewSdkSchemeHandlerThree" == pages.name)) {
                console.info("get webViewSdkSchemeHandlerThree state success " + JSON.stringify(pages.name));
                await router.pushUrl(options);
                console.info("push webViewSdkSchemeHandlerThree state success");
            }
        } catch (err) {
            console.error("push webViewSdkSchemeHandlerThree page error:" + err);
        }
        await driver.waitForComponent(ON.id("webViewSdkSchemeHandlerThreeButton"), 10000);
        console.log("waitForComponent webViewSdkSchemeHandlerThreeButton");
        done()
    });
    
    beforeEach(async (done: Function) => {
        config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
          console.info(`enable success`);
          }).catch((err: object) => {
          console.error(`failed to enable, ${err}`);
        })
        done();
    })

    /**
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_isChunked_true_API_0001
     * @tc.name   testWebViewSdkSchemeHandler_isChunked_true
     * @tc.desc   test SdkSchemeHandler_isChunked_true
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testWebViewSdkSchemeHandler_isChunked_true', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebViewSdkSchemeHandler_isChunked_true", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testWebViewSdkSchemeHandler_isChunked_true", true, 2025102108,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewSdkSchemeHandlerThreeButton', 10, '');
    })

    /**
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_isEof_true_API_0001
     * @tc.name   testWebViewSdkSchemeHandler_isEof_true
     * @tc.desc   test SdkSchemeHandler_isEof_true
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testWebViewSdkSchemeHandler_isEof_true', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebViewSdkSchemeHandler_isEof_true", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testWebViewSdkSchemeHandler_isEof_true", true, 2025102109,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewSdkSchemeHandlerThreeButton', 10, '');
    })
    /**
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_isMainFrame_true_API_0001
     * @tc.name   testWebViewSdkSchemeHandler_isMainFrame_true
     * @tc.desc   test SdkSchemeHandler_isMainFrame_true
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testWebViewSdkSchemeHandler_isMainFrame_true', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebViewSdkSchemeHandler_isMainFrame_true", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testWebViewSdkSchemeHandler_isMainFrame_true", true, 2025102110,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webViewSdkSchemeHandlerThreeButton', 10, '');
    })

  })
}