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

const EVENT_ID_SET_EMIT_KEY = 117000;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
let emitKey = ""

export default function ActsAceWebViewSdkSchemeHandlerDidFailWan2() {
  describe('ActsAceWebViewSdkSchemeHandlerDidFailWan2', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/webViewSdkSchemeHandlerDidFailWan2',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewSdkSchemeHandlerDidFailWan2 state success " + JSON.stringify(pages));
        if (!("webViewSdkSchemeHandler" == pages.name)) {
          console.info("get webViewSdkSchemeHandlerDidFailWan2 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webViewSdkSchemeHandlerDidFailWan2 state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewSdkSchemeHandlerDidFailWan2 page error:" + err);
      }
      await driver.waitForComponent(ON.id("webViewSdkSchemeHandlerDidFailWan2Button"), 10000);
      console.log("waitForComponent webViewSdkSchemeHandlerDidFailWan2Button");
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
     * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0426
     * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative701
     * @tc.desc        : test SdkSchemeHandler didFail code -701
     * @tc.size        : MediumTest
     * @tc.type        : Function
     * @tc.level       : Level 0
     */
    it('testWebViewSdkSchemeHandlerDidFailNegative701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative701";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative701", 'success', 117010, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailWan2Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })


    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0427
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative702
    * @tc.desc        : test SdkSchemeHandler didFail code -702
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative702', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative702"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative702", 'success', 117020, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailWan2Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0428
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative703
    * @tc.desc        : test SdkSchemeHandler didFail code -703
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative703', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative703"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative703", 'success', 117030, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailWan2Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })



    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0429
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative704
    * @tc.desc        : test SdkSchemeHandler didFail code -704
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative704', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative704"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative704", 'success', 117040, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailWan2Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0430
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative705
    * @tc.desc        : test SdkSchemeHandler didFail code -705
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative705', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative705"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative705", 'success', 117050, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailWan2Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0431
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative706
    * @tc.desc        : test SdkSchemeHandler didFail code -706
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative706', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative706"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative706", 'success', 117060, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailWan2Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0432
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative707
    * @tc.desc        : test SdkSchemeHandler didFail code -707
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative707', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative707"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative707", 'success', 117070, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailWan2Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0433
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative708
    * @tc.desc        : test SdkSchemeHandler didFail code -708
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative708', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative708"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative708", 'success', 117080, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailWan2Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0434
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative709
    * @tc.desc        : test SdkSchemeHandler didFail code -709
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative709', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative709"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative709", 'success', 117090, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailWan2Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0435
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative710
    * @tc.desc        : test SdkSchemeHandler didFail code -710
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative710"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative710", 'success', 117100, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailWan2Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0436
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative712
    * @tc.desc        : test SdkSchemeHandler didFail code -712
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative712', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative712"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative712", 'success', 117110, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailWan2Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0437
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative713
    * @tc.desc        : test SdkSchemeHandler didFail code -713
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative713', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative713"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative713", 'success', 117120, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailWan2Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0438
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative714
    * @tc.desc        : test SdkSchemeHandler didFail code -714
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative714', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative714"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative714", 'success', 117130, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailWan2Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0439
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative716
    * @tc.desc        : test SdkSchemeHandler didFail code -716
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative716', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative716"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative716", 'success', 117140, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailWan2Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0440
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative800
    * @tc.desc        : test SdkSchemeHandler didFail code -800
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative800"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative800", 'success', 117150, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailWan2Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0441
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative801
    * @tc.desc        : test SdkSchemeHandler didFail code -801
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative801"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative801", 'success', 117160, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailWan2Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0442
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative802
    * @tc.desc        : test SdkSchemeHandler didFail code -802
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative802', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative802"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative802", 'success', 117170, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailWan2Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0443
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative803
    * @tc.desc        : test SdkSchemeHandler didFail code -803
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative803', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative803"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative803", 'success', 117180, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailWan2Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0444
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative804
    * @tc.desc        : test SdkSchemeHandler didFail code -804
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative804', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative804"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative804", 'success', 117190, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailWan2Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0445
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative805
    * @tc.desc        : test SdkSchemeHandler didFail code -805
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative805', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative805"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative805", 'success', 117200, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailWan2Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0446
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative806
    * @tc.desc        : test SdkSchemeHandler didFail code -806
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative806', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative806"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative806", 'success', 117210, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailWan2Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0447
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative808
    * @tc.desc        : test SdkSchemeHandler didFail code -806
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative808', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative808"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative808", 'success', 117220, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailWan2Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0448
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative809
    * @tc.desc        : test SdkSchemeHandler didFail code -809
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative809', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative809"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative809", 'success', 117230, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailWan2Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0449
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative810
    * @tc.desc        : test SdkSchemeHandler didFail code -810
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative810"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative810", 'success', 117240, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailWan2Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0450
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegative811
    * @tc.desc        : test SdkSchemeHandler didFail code -811
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegative811', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegative811"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegative811", 'success', 117250, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailWan2Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0451
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailNegativeNull
    * @tc.desc        : test SdkSchemeHandler didFail code null
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailNegativeNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailNegativeNull"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailNegativeNull", 'success', 117260, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailWan2Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /*
    * @tc.number      : SUB_ACE_WEB_WEBHOST_SDK_0452
    * @tc.name        : testWebViewSdkSchemeHandlerDidFailMore
    * @tc.desc        : test SdkSchemeHandler didFail code 5
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 0
    */
    it('testWebViewSdkSchemeHandlerDidFailMore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewSdkSchemeHandlerDidFailMore"
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewSdkSchemeHandlerDidFailMore", 'success', 117270, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "webViewSdkSchemeHandlerDidFailWan2Button", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })
  })
}