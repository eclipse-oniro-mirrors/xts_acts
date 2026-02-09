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
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let emitKey = "";
let tcName = ''
const EVENT_ID_SET_SUITE_KEY = 176001;
const driver = Driver.create();

export default function webControllerHitTest() {

  describe('WebControllerHitTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebControllerHitTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebControllerHitTest state success " + JSON.stringify(pages));
        if (!("WebControllerHitTest" == pages.name)) {
          console.info("get WebControllerHitTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await driver.waitForComponent(ON.id("WebControllerHitTestButton"), 10000);
          console.info("push WebControllerHitTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebControllerHitTest page error: " + err);
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

    /**
     * @tc.name   testGetHitTest001
     * @tc.number SUB_WEB_WEBCONTROLLER_GETHITTEST_0100
     * @tc.desc   test getHitTest return webView.WebHitTestType.EditText
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetHitTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitGetHitTest001';
      tcName = 'testGetHitTest001'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, HitTestType.EditText, 176010, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebControllerHitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testGetHitTest002
     * @tc.number SUB_WEB_WEBCONTROLLER_GETHITTEST_0200
     * @tc.desc   test getHitTest return webView.WebHitTestType.Email
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetHitTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitGetHitTest002';
      tcName = 'testGetHitTest002'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, HitTestType.Email, 176020, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebControllerHitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testGetHitTest003
     * @tc.number SUB_WEB_WEBCONTROLLER_GETHITTEST_0300
     * @tc.desc   test getHitTest return webView.WebHitTestType.HttpAnchor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetHitTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitGetHitTest003';
      tcName = 'testGetHitTest003'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, HitTestType.HttpAnchor, 176030, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebControllerHitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testGetHitTest004
     * @tc.number SUB_WEB_WEBCONTROLLER_GETHITTEST_0400
     * @tc.desc   test getHitTest return webView.WebHitTestType.HttpAnchorImg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetHitTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitGetHitTest004';
      tcName = 'testGetHitTest004'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, HitTestType.HttpAnchorImg, 176040, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebControllerHitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testGetHitTest005
     * @tc.number SUB_WEB_WEBCONTROLLER_GETHITTEST_0500
     * @tc.desc   test getHitTest return webView.WebHitTestType.Img
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetHitTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitGetHitTest005';
      tcName = 'testGetHitTest005'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, HitTestType.Img, 176050, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebControllerHitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testGetHitTest006
     * @tc.number SUB_WEB_WEBCONTROLLER_GETHITTEST_0600
     * @tc.desc   test getHitTest return webView.HitTestType.Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetHitTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitGetHitTest006';
      tcName = 'testGetHitTest006'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, HitTestType.Map, 20251210, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebControllerHitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })


    /**
     * @tc.name   testGetHitTest007
     * @tc.number SUB_WEB_WEBCONTROLLER_GETHITTEST_0700
     * @tc.desc   test getHitTest return webView.WebHitTestType.Phone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetHitTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitGetHitTest007';
      tcName = 'testGetHitTest007'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, HitTestType.Phone, 176070, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebControllerHitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testGetHitTest008
     * @tc.number SUB_WEB_WEBCONTROLLER_GETHITTEST_0800
     * @tc.desc   test getHitTest return webView.WebHitTestType.Unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetHitTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitGetHitTest008';
      tcName = 'testGetHitTest008'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, HitTestType.Unknown, 176080, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebControllerHitTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
  })
}
