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

const EVENT_ID_SET_EMIT_KEY = 116010;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
let emitKey = ""

export default function ActsAceWebViewSdkSchemeHandlerDidFail() {
  describe('ActsAceWebViewSdkSchemeHandlerDidFail', () => {
    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/webViewSdkSchemeHandlerDidFail',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewSdkSchemeHandlerDidFail state success " + JSON.stringify(pages));
        if (!("webViewSdkSchemeHandlerDidFail" == pages.name)) {
          console.info("get webViewSdkSchemeHandlerDidFail state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webViewSdkSchemeHandlerDidFail state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewSdkSchemeHandlerDidFail page error:" + err);
      }
      await driver.waitForComponent(ON.id("webViewSdkSchemeHandlerDidFailButton"), 10000);
      console.log("waitForComponent webViewSdkSchemeHandlerDidFailButton");
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
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative367
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0382
     * @tc.desc   test SdkSchemeHandler didFail code -367
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative367', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative367"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative367", 'success', 116020, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative370
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0383
     * @tc.desc   test SdkSchemeHandler didFail code -370
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative370"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative370", 'success', 116030, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative371
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0384
     * @tc.desc   test SdkSchemeHandler didFail code -371
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative371', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative371"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative371", 'success', 116040, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })


    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative372
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0385
     * @tc.desc   test SdkSchemeHandler didFail code -372
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative372', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative372"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative372", 'success', 116050, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative373
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0386
     * @tc.desc   test SdkSchemeHandler didFail code -373
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative373', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative373"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative373", 'success', 116060, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative374
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0387
     * @tc.desc   test SdkSchemeHandler didFail code -374
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative374', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative374"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative374", 'success', 116070, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative375
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0388
     * @tc.desc   test SdkSchemeHandler didFail code -375
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative375', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative375"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative375", 'success', 116080, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative376
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0389
     * @tc.desc   test SdkSchemeHandler didFail code -376
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative376', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative376"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative376", 'success', 116090, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative377
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0390
     * @tc.desc   test SdkSchemeHandler didFail code -377
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative377', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative377"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative377", 'success', 116100, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative378
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0391
     * @tc.desc   test SdkSchemeHandler didFail code -378
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative378', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative378"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative378", 'success', 116110, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative379
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0392
     * @tc.desc   test SdkSchemeHandler didFail code -379
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative379', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative379"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative379", 'success', 116120, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative380
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0393
     * @tc.desc   test SdkSchemeHandler didFail code -380
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative380"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative380", 'success', 116130, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative381
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0394
     * @tc.desc   test SdkSchemeHandler didFail code -381
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative381', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative381"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative381", 'success', 116140, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative382
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0395
     * @tc.desc   test SdkSchemeHandler didFail code -382
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative382', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative382"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative382", 'success', 116150, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative383
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0396
     * @tc.desc   test SdkSchemeHandler didFail code -383
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative383', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative383"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative383", 'success', 116160, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative384
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0397
     * @tc.desc   test SdkSchemeHandler didFail code -384
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative384', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative384"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative384", 'success', 116170, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative400
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0398
     * @tc.desc   test SdkSchemeHandler didFail code -400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative400"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative400", 'success', 116180, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative401
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0399
     * @tc.desc   test SdkSchemeHandler didFail code -401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative401"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative401", 'success', 116190, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative402
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0400
     * @tc.desc   test SdkSchemeHandler didFail code -402
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative402"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative402", 'success', 116200, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative403
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0401
     * @tc.desc   test SdkSchemeHandler didFail code -403
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative403"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative403", 'success', 116210, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative404
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0402
     * @tc.desc   test SdkSchemeHandler didFail code -404
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative404"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative404", 'success', 116220, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative405
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0403
     * @tc.desc   test SdkSchemeHandler didFail code -405
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative405"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative405", 'success', 116230, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative406
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0404
     * @tc.desc   test SdkSchemeHandler didFail code -406
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative406', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative406"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative406", 'success', 116240, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative407
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0405
     * @tc.desc   test SdkSchemeHandler didFail code -407
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative407', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative407"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative407", 'success', 116250, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative408
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0406
     * @tc.desc   test SdkSchemeHandler didFail code -408
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative408', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative408"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative408", 'success', 116260, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative409
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0407
     * @tc.desc   test SdkSchemeHandler didFail code -409
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative409', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative409"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative409", 'success', 116270, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative410
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0408
     * @tc.desc   test SdkSchemeHandler didFail code -410
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative410"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative410", 'success', 116280, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative411
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0409
     * @tc.desc   test SdkSchemeHandler didFail code -411
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative411', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative411"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative410", 'success', 116290, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative412
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0410
     * @tc.desc   test SdkSchemeHandler didFail code -412
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative412', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative412"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative412", 'success', 116300, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative413
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0411
     * @tc.desc   test SdkSchemeHandler didFail code -413
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative413', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative413"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative413", 'success', 116310, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative501
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0412
     * @tc.desc   test SdkSchemeHandler didFail code -501
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative501"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative501", 'success', 116320, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative502
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0413
     * @tc.desc   test SdkSchemeHandler didFail code -502
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative502', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative502"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative502", 'success', 116330, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative503
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0414
     * @tc.desc   test SdkSchemeHandler didFail code -503
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative503', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative503"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative503", 'success', 116340, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative504
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0415
     * @tc.desc   test SdkSchemeHandler didFail code -504
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative504', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative504"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative504", 'success', 116350, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative505
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0416
     * @tc.desc   test SdkSchemeHandler didFail code -505
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative505', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative505"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative505", 'success', 116360, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative506
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0417
     * @tc.desc   test SdkSchemeHandler didFail code -506
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative506', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative506"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative506", 'success', 116370, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative507
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0418
     * @tc.desc   test SdkSchemeHandler didFail code -507
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative507', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative507"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative507", 'success', 116380, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative601
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0419
     * @tc.desc   test SdkSchemeHandler didFail code -601
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative601"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative601", 'success', 116390, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative602
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0420
     * @tc.desc   test SdkSchemeHandler didFail code -602
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative602', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative602"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative602", 'success', 116400, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative603
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0421
     * @tc.desc   test SdkSchemeHandler didFail code -603
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative603', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative603"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative603", 'success', 116410, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative604
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0422
     * @tc.desc   test SdkSchemeHandler didFail code -604
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative604', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative604"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative604", 'success', 116420, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative605
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0423
     * @tc.desc   test SdkSchemeHandler didFail code -605
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative605', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative605"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative605", 'success', 116430, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative606
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0424
     * @tc.desc   test SdkSchemeHandler didFail code -606
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative606', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative606"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative606", 'success', 116440, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandlerDidFailNegative607
     * @tc.number SUB_ACE_WEB_WEBHOST_SDK_0425
     * @tc.desc   test SdkSchemeHandler didFail code -607
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative607', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative607"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative607", 'success', 116450, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })
  })
}