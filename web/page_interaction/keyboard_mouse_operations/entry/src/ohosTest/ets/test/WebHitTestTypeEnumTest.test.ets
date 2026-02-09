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

const EVENT_ID_SET_SUITE_KEY = 175001;
const driver = Driver.create();

export default function webHitTestTypeEnumTest() {

  describe('WebHitTestTypeEnumTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebHitTestTypeEnumTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebHitTestTypeEnumTest state success " + JSON.stringify(pages));
        if (!("WebHitTestTypeEnumTest" == pages.name)) {
          console.info("get WebHitTestTypeEnumTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebHitTestTypeEnumTest page success " + JSON.stringify(result));
          await driver.waitForComponent(ON.id("WebHitTestTypeEnumTestButton"), 10000);
        }
      } catch (err) {
        console.error("push WebHitTestTypeEnumTest page error: " + err);
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
     * @tc.name   testWebHitTestTypeEnum001
     * @tc.number SUB_WEB_WEBHITTESTTYPE_ENUM_0100
     * @tc.desc   test the value of WebHitTestType.EditText is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebHitTestTypeEnum001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebHitTestTypeEnum001", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testWebHitTestTypeEnum001", 0, 175010, done);
      Utils.waitAndClickComponent(driver, "WebHitTestTypeEnumTestButton");
    })

    /**
     * @tc.name   testWebHitTestTypeEnum002
     * @tc.number SUB_WEB_WEBHITTESTTYPE_ENUM_0200
     * @tc.desc   test the value of WebHitTestType.Email is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebHitTestTypeEnum002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebHitTestTypeEnum002", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testWebHitTestTypeEnum002", 1, 175020, done);
      Utils.waitAndClickComponent(driver, "WebHitTestTypeEnumTestButton");
    })

    /**
     * @tc.name   testWebHitTestTypeEnum003
     * @tc.number SUB_WEB_WEBHITTESTTYPE_ENUM_0300
     * @tc.desc   test the value of WebHitTestType.HttpAnchor is 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebHitTestTypeEnum003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebHitTestTypeEnum003", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testWebHitTestTypeEnum003", 2, 175030, done);
      Utils.waitAndClickComponent(driver, "WebHitTestTypeEnumTestButton");
    })

    /**
     * @tc.name   testWebHitTestTypeEnum004
     * @tc.number SUB_WEB_WEBHITTESTTYPE_ENUM_0400
     * @tc.desc   test the value of WebHitTestType.HttpAnchorImg is 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebHitTestTypeEnum004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebHitTestTypeEnum004", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testWebHitTestTypeEnum004", 3, 175040, done);
      Utils.waitAndClickComponent(driver, "WebHitTestTypeEnumTestButton");
    })

    /**
     * @tc.name   testWebHitTestTypeEnum005
     * @tc.number SUB_WEB_WEBHITTESTTYPE_ENUM_0500
     * @tc.desc   test the value of WebHitTestType.Img is 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebHitTestTypeEnum005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebHitTestTypeEnum005", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testWebHitTestTypeEnum005", 4, 175050, done);
      Utils.waitAndClickComponent(driver, "WebHitTestTypeEnumTestButton");
    })

    /**
     * @tc.name   testWebHitTestTypeEnum006
     * @tc.number SUB_WEB_WEBHITTESTTYPE_ENUM_0600
     * @tc.desc   test the value of WebHitTestType.Map is 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebHitTestTypeEnum006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebHitTestTypeEnum006", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testWebHitTestTypeEnum006", 5, 175060, done);
      Utils.waitAndClickComponent(driver, "WebHitTestTypeEnumTestButton");
    })

    /**
     * @tc.name   testWebHitTestTypeEnum007
     * @tc.number SUB_WEB_WEBHITTESTTYPE_ENUM_0700
     * @tc.desc   test the value of WebHitTestType.Phone is 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebHitTestTypeEnum007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebHitTestTypeEnum007", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testWebHitTestTypeEnum007", 6, 175070, done);
      Utils.waitAndClickComponent(driver, "WebHitTestTypeEnumTestButton");
    })

    /**
     * @tc.name   testWebHitTestTypeEnum008
     * @tc.number SUB_WEB_WEBHITTESTTYPE_ENUM_0800
     * @tc.desc   test the value of WebHitTestType.Unknown is 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebHitTestTypeEnum008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebHitTestTypeEnum008", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testWebHitTestTypeEnum008", 7, 175080, done);
      Utils.waitAndClickComponent(driver, "WebHitTestTypeEnumTestButton");
    })
  })
}
