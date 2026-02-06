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

const EVENT_ID_SET_EMIT_KEY = 116460;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
let emitKey = ""

export default function ActsAceWebViewSdkSchemeHandlerDidFail3() {
  describe('ActsAceWebViewSdkSchemeHandlerDidFail3', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/webViewSdkSchemeHandlerDidFail3',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewSdkSchemeHandlerDidFail3 state success " + JSON.stringify(pages));
        if (!("webViewSdkSchemeHandlerDidFail3" == pages.name)) {
          console.info("get webViewSdkSchemeHandlerDidFail3 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webViewSdkSchemeHandlerDidFail3 state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewSdkSchemeHandlerDidFail3 page error:" + err);
      }
      await driver.waitForComponent(ON.id("webViewSdkSchemeHandlerDidFail3Button"), 10000);
      console.log("waitForComponent webViewSdkSchemeHandlerDidFail3Button");
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
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0295
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative173
     * @tc.desc        : test SdkSchemeHandler didFail code -173
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative173";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative173", 'success', 116470, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFail3Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })


    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0296
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative174
     * @tc.desc        : test SdkSchemeHandler didFail code -174
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative174"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative174", 'success', 116480, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFail3Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0297
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative176
     * @tc.desc        : test SdkSchemeHandler didFail code -176
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative176"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative176", 'success', 116490, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFail3Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0298
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative177
     * @tc.desc        : test SdkSchemeHandler didFail code -177
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative177"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative177", 'success', 116500, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFail3Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0299
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative178
     * @tc.desc        : test SdkSchemeHandler didFail code -178
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative178"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative178", 'success', 116510, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFail3Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0300
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative179
     * @tc.desc        : test SdkSchemeHandler didFail code -179
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative179"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative179", 'success', 116520, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFail3Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0301
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative180
     * @tc.desc        : test SdkSchemeHandler didFail code -180
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative180"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative180", 'success', 116530, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFail3Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0302
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative181
     * @tc.desc        : test SdkSchemeHandler didFail code -181
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative181"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative181", 'success', 116540, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFail3Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0303
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative182
     * @tc.desc        : test SdkSchemeHandler didFail code -182
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative182"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative182", 'success', 116550, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFail3Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0304
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative183
     * @tc.desc        : test SdkSchemeHandler didFail code -183
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative183"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative183", 'success', 116560, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFail3Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0305
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative184
     * @tc.desc        : test SdkSchemeHandler didFail code -184
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative184"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative184", 'success', 116570, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFail3Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0306
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative200
     * @tc.desc        : test SdkSchemeHandler didFail code -200
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative200"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative200", 'success', 116580, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFail3Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0307
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative201
     * @tc.desc        : test SdkSchemeHandler didFail code -201
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative201"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative201", 'success', 116590, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFail3Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0308
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative202
     * @tc.desc        : test SdkSchemeHandler didFail code -202
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative202"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative202", 'success', 116600, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFail3Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0309
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative203
     * @tc.desc        : test SdkSchemeHandler didFail code -203
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative203"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative203", 'success', 116610, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFail3Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0310
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative204
     * @tc.desc        : test SdkSchemeHandler didFail code -204
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative204"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative204", 'success', 116620, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFail3Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0311
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative205
     * @tc.desc        : test SdkSchemeHandler didFail code -205
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative205"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative205", 'success', 116630, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFail3Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0312
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative206
     * @tc.desc        : test SdkSchemeHandler didFail code -206
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative206"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative206", 'success', 116640, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFail3Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0313
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative207
     * @tc.desc        : test SdkSchemeHandler didFail code -207
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative207"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative207", 'success', 116650, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFail3Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0314
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative208
     * @tc.desc        : test SdkSchemeHandler didFail code -208
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative208"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative208", 'success', 116660, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFail3Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0315
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative210
     * @tc.desc        : test SdkSchemeHandler didFail code -210
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative210"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative210", 'success', 116670, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFail3Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0316
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative211
     * @tc.desc        : test SdkSchemeHandler didFail code -211
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative211"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative211", 'success', 116680, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFail3Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0317
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative212
     * @tc.desc        : test SdkSchemeHandler didFail code -212
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative212"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative212", 'success', 116690, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFail3Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0318
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative213
     * @tc.desc        : test SdkSchemeHandler didFail code -213
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative213"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative213", 'success', 116700, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFail3Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0319
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative214
     * @tc.desc        : test SdkSchemeHandler didFail code -214
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative214"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative214", 'success', 116710, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFail3Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0320
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative215
     * @tc.desc        : test SdkSchemeHandler didFail code -215
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative215"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative215", 'success', 116720, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFail3Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0321
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative217
     * @tc.desc        : test SdkSchemeHandler didFail code -217
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative217"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative217", 'success', 116730, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFail3Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0322
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative218
     * @tc.desc        : test SdkSchemeHandler didFail code -218
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative218"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative218", 'success', 116740, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFail3Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0323
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative219
     * @tc.desc        : test SdkSchemeHandler didFail code -219
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative219"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative219", 'success', 116750, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFail3Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })
  })
}
