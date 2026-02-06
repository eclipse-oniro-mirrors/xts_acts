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
import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 201940;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function ActsAceWebViewSdkSchemeHandlerEnhanced() {
  describe('ActsAceWebViewSdkSchemeHandlerEnhanced', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'testability/pages/webViewSdkSchemeHandlerEnhanced',
        }
        
        try {
            router.clear();
            let pages = router.getState();
            console.info("get webViewSdkSchemeHandlerEnhanced state success " + JSON.stringify(pages));
            if (!("webViewSdkSchemeHandlerEnhanced" == pages.name)) {
                console.info("get webViewSdkSchemeHandlerEnhanced state success " + JSON.stringify(pages.name));
                await router.pushUrl(options);
                console.info("push webViewSdkSchemeHandlerEnhanced state success");
            }
        } catch (err) {
            console.error("push webViewSdkSchemeHandlerEnhanced page error:" + err);
        }
        await driver.waitForComponent(ON.id("webViewSdkSchemeHandlerEnhanced"), 10000);
        console.log("waitForComponent webViewSdkSchemeHandlerEnhanced");
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

    /*
     * @tc.number      : SUB_ACE_WEB_SdkSchemeHandler_isChunked_false_API_0001
     * @tc.name        : testWebViewSdkSchemeHandler_isChunked_false
     * @tc.desc        : test SdkSchemeHandler_isChunked_false
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandler_isChunked_false', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebViewSdkSchemeHandler_isChunked_false", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testWebViewSdkSchemeHandler_isChunked_false",  true, 201950, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerEnhanced");
      if (await Utils.waitForExist(() => isReturn, 'testWebViewSdkSchemeHandler_isChunked_false' + '_returnCheck', 1, 1000)) {
        done();
      }
    })


    /*
     * @tc.number      : SUB_ACE_WEB_SdkSchemeHandler_isEof_false_API_0001
     * @tc.name        : testWebViewSdkSchemeHandler_isEof_false
     * @tc.desc        : test SdkSchemeHandler_isEof_false
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandler_isEof_false', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebViewSdkSchemeHandler_isEof_false", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testWebViewSdkSchemeHandler_isEof_false",  true, 201960, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerEnhanced");
      if (await Utils.waitForExist(() => isReturn, 'testWebViewSdkSchemeHandler_isEof_false' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_isInMemory_false_API_0001
     *@tc.name testWebViewSdkSchemeHandler_SdkSchemeHandler_isInMemory_false
     *@tc.desc test SdkSchemeHandler_isInMemory_false
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    /*
     * @tc.number      : SUB_ACE_WEB_SdkSchemeHandler_isInMemory_false_API_0002
     * @tc.name        : testWebViewSdkSchemeHandler_isInMemory_false
     * @tc.desc        : test SdkSchemeHandler_isInMemory_false
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandler_isInMemory_false', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebViewSdkSchemeHandler_isInMemory_false", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testWebViewSdkSchemeHandler_isInMemory_false",  true, 201970, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerEnhanced");
      if (await Utils.waitForExist(() => isReturn, 'testWebViewSdkSchemeHandler_isInMemory_false' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
    /*
     *@tc.number SUB_ACE_WEB_SdkSchemeHandler_mainFrame_false_API_0001
     *@tc.name testWebViewSdkSchemeHandler_SdkSchemeHandler_isInMemory_false
     *@tc.desc test SdkSchemeHandler_isInMemory_false
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    /*
     * @tc.number      : SUB_ACE_WEB_SdkSchemeHandler_isInMemory_false_API_0003
     * @tc.name        : testWebViewSdkSchemeHandler_isMainFrame_false
     * @tc.desc        : test SdkSchemeHandler_isInMemory_false
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandler_isMainFrame_false', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebViewSdkSchemeHandler_isMainFrame_false", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testWebViewSdkSchemeHandler_isMainFrame_false",  true, 201980, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerEnhanced");
      if (await Utils.waitForExist(() => isReturn, 'testWebViewSdkSchemeHandler_isMainFrame_false' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
  })
}