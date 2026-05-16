/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils.test';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
import { waitForExist} from './WaitTest.test';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 183129;
const driver = Driver.create();

export default function WebViewAISessionTypeSuite() {

  describe('WebViewAISessionTypeTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewAISessionType',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewAISessionType state success " + JSON.stringify(pages));
        if (!("WebViewAISessionType" == pages.name)) {
          console.info("get WebViewAISessionType state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebViewAISessionType page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewAISessionType page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebViewAiSessionOptionsButton"), 10000)
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewController beforeEach start");
      done();
    })


    /**
     * @tc.number     SUB_WEB_SESSION_OPTIONS_0100
     * @tc.name       testWebViewLanguageModel01
     * @tc.desc       aiSessionOptions
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('testWebViewLanguageModel01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebViewLanguageModel01", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testWebViewLanguageModel01",'onCreateAISession', 20250420, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewAiSessionOptionsButton","testWebViewLanguageModel01");
      await Utils.waitForExist(() => isReturn, "testWebViewLanguageModel01" + '_returnCheck', true, 1000);
      done();
    })


    /**
     * @tc.number     SUB_WEB_SESSION_OPTIONS_0200
     * @tc.name       testWebViewLanguageModel02
     * @tc.desc       aiSessionOptions
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('testWebViewLanguageModel02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebViewLanguageModel02", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testWebViewLanguageModel02",'onExecuteAIAction', 20250421, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewAiSessionOptionsButton","testWebViewLanguageModel02");
      await Utils.waitForExist(() => isReturn, "testWebViewLanguageModel02" + '_returnCheck', true, 1000);
      done();
    })


    /**
     * @tc.number     SUB_WEB_SESSION_OPTIONS_0300
     * @tc.name       testWebViewLanguageModel03
     * @tc.desc       aiSessionOptions
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('testWebViewLanguageModel03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebViewLanguageModel03", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testWebViewLanguageModel03",'onDestroyAIAction', 20250422, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewAiSessionOptionsButton","testWebViewLanguageModel03");
      await Utils.waitForExist(() => isReturn, "testWebViewLanguageModel03" + '_returnCheck', true, 1000);
      done();
    })


    /**
     * @tc.number     SUB_WEB_SESSION_OPTIONS_0400
     * @tc.name       testWebViewLanguageDetector04
     * @tc.desc       aiSessionOptions
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('testWebViewLanguageDetector04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebViewLanguageDetector04", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testWebViewLanguageDetector04",'onCreateAISession', 20250423, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewAiSessionOptionsButton","testWebViewLanguageDetector04");
      await Utils.waitForExist(() => isReturn, "testWebViewLanguageDetector04" + '_returnCheck', true, 1000);
      done();
    })



    /**
     * @tc.number     SUB_WEB_SESSION_OPTIONS_0500
     * @tc.name       testWebViewProofreader05
     * @tc.desc       aiSessionOptions
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('testWebViewProofreader05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebViewProofreader05", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testWebViewProofreader05",'onCreateAISession', 20250425, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewAiSessionOptionsButton","testWebViewProofreader05");
      await Utils.waitForExist(() => isReturn, "testWebViewProofreader05" + '_returnCheck', true, 1000);
      done();
    })


    /**
     * @tc.number     SUB_WEB_SESSION_OPTIONS_0600
     * @tc.name       testWebViewProofreader06
     * @tc.desc       aiSessionOptions
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('testWebViewProofreader06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebViewProofreader06", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testWebViewProofreader06",'onDestroyAISession', 20250426, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewAiSessionOptionsButton","testWebViewProofreader06");
      await Utils.waitForExist(() => isReturn, "testWebViewProofreader06" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.number     SUB_WEB_SESSION_OPTIONS_0700
     * @tc.name       testWebViewWriter07
     * @tc.desc       aiSessionOptions
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('testWebViewWriter07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebViewWriter07", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testWebViewWriter07",'onCreateAISession', 20250427, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewAiSessionOptionsButton","testWebViewWriter07");
      await Utils.waitForExist(() => isReturn, "testWebViewWriter07" + '_returnCheck', true, 1000);
      done();
    })
    /**
     * @tc.number     SUB_WEB_SESSION_OPTIONS_0800
     * @tc.name       testWebViewWriter08
     * @tc.desc       aiSessionOptions
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('testWebViewWriter08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebViewWriter08", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testWebViewWriter08",'onDestroyAISession', 20250428, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewAiSessionOptionsButton","testWebViewWriter08");
      await Utils.waitForExist(() => isReturn, "testWebViewWriter08" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.number     SUB_WEB_SESSION_OPTIONS_0900
     * @tc.name       testWebViewWriter09
     * @tc.desc       aiSessionOptions
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('testWebViewWriter09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebViewWriter09", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testWebViewWriter09",'onCreateAISession', 20250429, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewAiSessionOptionsButton","testWebViewWriter09");
      await Utils.waitForExist(() => isReturn, "testWebViewWriter09" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.number     SUB_WEB_SESSION_OPTIONS_1000
     * @tc.name       testWebViewWriter10
     * @tc.desc       aiSessionOptions
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('testWebViewWriter10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebViewWriter10", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testWebViewWriter10",'onDestroyAISession', 20250430, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewAiSessionOptionsButton","testWebViewWriter10");
      await Utils.waitForExist(() => isReturn, "testWebViewWriter10" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.number     SUB_WEB_SESSION_OPTIONS_1100
     * @tc.name       testWebViewTranslator11
     * @tc.desc       aiSessionOptions
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('testWebViewTranslator11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebViewTranslator11", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testWebViewTranslator11",'onExecuteAIAction', 20250431, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewAiSessionOptionsButton","testWebViewTranslator11");
      await Utils.waitForExist(() => isReturn, "testWebViewTranslator11" + '_returnCheck', true, 1000);
      done();
    })


    /**
     * @tc.number     SUB_WEB_SESSION_OPTIONS_1200
     * @tc.name       testWebViewTranslator12
     * @tc.desc       aiSessionOptions
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('testWebViewTranslator12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebViewSummarizer12", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testWebViewTranslator12",'onCreateAISession', 20250432, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewAiSessionOptionsButton","testWebViewTranslator12");
      await Utils.waitForExist(() => isReturn, "testWebViewTranslator12" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.number     SUB_WEB_SESSION_OPTIONS_1300
     * @tc.name       testWebViewTranslator13
     * @tc.desc       aiSessionOptions
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('testWebViewTranslator13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebViewSummarizer13", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testWebViewTranslator13",'onDestroyAISession', 20250433, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewAiSessionOptionsButton","testWebViewTranslator13");
      await Utils.waitForExist(() => isReturn, "testWebViewTranslator13" + '_returnCheck', true, 1000);
      done();
    })

  })
}
