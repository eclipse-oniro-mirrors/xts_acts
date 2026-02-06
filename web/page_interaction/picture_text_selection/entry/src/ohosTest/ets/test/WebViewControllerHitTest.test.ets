/*
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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import webView from '@ohos.web.webview';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let emitKey = "";
let tcName = ''
const EVENT_ID_SET_SUITE_KEY = 176301;
const driver = Driver.create();

export default function webViewControllerHitTest() {

  describe('WebViewControllerHitTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewControllerHitTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerHitTest state success " + JSON.stringify(pages));
        if (!("WebViewControllerHitTest" == pages.name)) {
          console.info("get WebViewControllerHitTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await driver.waitForComponent(ON.id("WebViewControllerHitTestButton"), 10000);
          console.info("push WebViewControllerHitTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerHitTest page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTESTVALUE_0100
    * @tc.name        : testGetHitTestValue001
    * @tc.desc        : test HitTestValue.type is webView.WebHitTestType.EditText
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTestValue001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitGetHitTestValue001';
      tcName = 'testGetHitTestValue001'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, webView.WebHitTestType.EditText, 176310, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewControllerHitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTESTVALUE_0200
    * @tc.name        : testGetHitTestValue002
    * @tc.desc        : test HitTestValue.type is webView.WebHitTestType.Email
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTestValue002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitGetHitTestValue002';
      tcName = 'testGetHitTestValue002'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, webView.WebHitTestType.Email, 176320, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewControllerHitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTESTVALUE_0300
    * @tc.name        : testGetHitTestValue003
    * @tc.desc        : test HitTestValue.type is webView.WebHitTestType.HttpAnchor
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTestValue003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitGetHitTestValue003';
      tcName = 'testGetHitTestValue003'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, webView.WebHitTestType.HttpAnchor, 176330, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewControllerHitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTESTVALUE_0400
    * @tc.name        : testGetHitTestValue004
    * @tc.desc        : test HitTestValue.type is webView.WebHitTestType.HttpAnchorImg
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTestValue004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitGetHitTestValue004';
      tcName = 'testGetHitTestValue004'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, webView.WebHitTestType.HttpAnchorImg, 176340, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewControllerHitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTESTVALUE_0500
    * @tc.name        : testGetHitTestValue005
    * @tc.desc        : test HitTestValue.type is webView.WebHitTestType.Img
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTestValue005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitGetHitTestValue005';
      tcName = 'testGetHitTestValue005'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, webView.WebHitTestType.Img, 176350, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewControllerHitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTESTVALUE_0700
    * @tc.name        : testGetHitTestValue007
    * @tc.desc        : test HitTestValue.type is webView.WebHitTestType.Phone
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTestValue007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitGetHitTestValue007';
      tcName = 'testGetHitTestValue007'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, webView.WebHitTestType.Phone, 176370, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewControllerHitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTESTVALUE_0800
    * @tc.name        : testGetHitTestValue008
    * @tc.desc        : test HitTestValue.type is webView.WebHitTestType.Unknown
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTestValue008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitGetHitTestValue008';
      tcName = 'testGetHitTestValue008'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, webView.WebHitTestType.Unknown, 176380, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewControllerHitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTESTVALUE_0900
    * @tc.name        : testGetHitTestValue009
    * @tc.desc        : test HitTestValue.value is url of Email
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTestValue009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitGetHitTestValue009';
      tcName = 'testGetHitTestValue009'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, '123@123.com', 176390, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewControllerHitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTESTVALUE_1000
    * @tc.name        : testGetHitTestValue010
    * @tc.desc        : test HitTestValue.value is url of HttpAnchor
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTestValue010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitGetHitTestValue010';
      tcName = 'testGetHitTestValue010'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'https://openharmony.cn/', 176400, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewControllerHitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTESTVALUE_1100
    * @tc.name        : testGetHitTestValue011
    * @tc.desc        : test HitTestValue.value is url of HttpAnchorImg
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTestValue011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitGetHitTestValue011';
      tcName = 'testGetHitTestValue011'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'resource://rawfile/icon.png', 176410, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewControllerHitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTESTVALUE_1200
    * @tc.name        : testGetHitTestValue012
    * @tc.desc        : test HitTestValue.value is url of Img
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTestValue012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitGetHitTestValue012';
      tcName = 'testGetHitTestValue012'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'resource://rawfile/icon.png', 176420, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewControllerHitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTESTVALUE_1300
    * @tc.name        : testGetHitTestValue013
    * @tc.desc        : test HitTestValue.value is url of phone
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTestValue013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitGetHitTestValue013';
      tcName = 'testGetHitTestValue013'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, '123456789', 176430, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewControllerHitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTEST_0100
    * @tc.name        : testGetHitTest001
    * @tc.desc        : test getHitTest return webView.WebHitTestType.EditText
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitGetHitTest001';
      tcName = 'testGetHitTest001'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, webView.WebHitTestType.EditText, 176440, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewControllerHitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTEST_0200
    * @tc.name        : testGetHitTest002
    * @tc.desc        : test getHitTest return webView.WebHitTestType.Email
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitGetHitTest002';
      tcName = 'testGetHitTest002'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, webView.WebHitTestType.Email, 176450, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewControllerHitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTEST_0300
    * @tc.name        : testGetHitTest003
    * @tc.desc        : test getHitTest return webView.WebHitTestType.HttpAnchor
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitGetHitTest003';
      tcName = 'testGetHitTest003'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, webView.WebHitTestType.HttpAnchor, 176460, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewControllerHitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTEST_0400
    * @tc.name        : testGetHitTest004
    * @tc.desc        : test getHitTest return webView.WebHitTestType.HttpAnchorImg
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitGetHitTest004';
      tcName = 'testGetHitTest004'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, webView.WebHitTestType.HttpAnchorImg, 176470, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewControllerHitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTEST_0500
    * @tc.name        : testGetHitTest005
    * @tc.desc        : test getHitTest return webView.WebHitTestType.Img
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitGetHitTest005';
      tcName = 'testGetHitTest005'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, webView.WebHitTestType.Img, 176480, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewControllerHitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTEST_0700
    * @tc.name        : testGetHitTest007
    * @tc.desc        : test getHitTest return webView.WebHitTestType.Phone
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitGetHitTest007';
      tcName = 'testGetHitTest007'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, webView.WebHitTestType.Phone, 176500, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewControllerHitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTEST_0800
    * @tc.name        : testGetHitTest008
    * @tc.desc        : test getHitTest return webView.WebHitTestType.Unknown
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitGetHitTest008';
      tcName = 'testGetHitTest008'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, webView.WebHitTestType.Unknown, 176510, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewControllerHitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
  })
}
