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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 201780;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function webController() {

  describe('WebControllerTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webController',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webController state success " + JSON.stringify(pages));
        if (!("webController" == pages.name)) {
          console.info("get webController state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push webController page success");
        }
      } catch (err) {
        console.error("push webController page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebControllerButton"), 10000);
      console.log("waitForComponent WebControllerButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webController beforeEach start");
      done();
    })



    /*
    * @tc.number     : SUB_WEB_IMAGEACCESS_0100
    * @tc.name       : testImageAccess001
    * @tc.desc       : test imageAccess
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testImageAccess001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testImageAccess001", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testImageAccess001",  '"01"', 201790, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      if (await Utils.waitForExist(() => isReturn, 'testImageAccess001' + '_returnCheck', 1, 1000)) {
        done();
      }
    })

    /*
    * @tc.number     : SUB_WEB_IMAGEACCESS_0200
    * @tc.name       : testImageAccess002
    * @tc.desc       : test imageAccess
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testImageAccess002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testImageAccess002", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testImageAccess002", "\"load complete02\"", 201800, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      if (await Utils.waitForExist(() => isReturn, 'testImageAccess002' + '_returnCheck', 1, 1000)) {
        done();
      }
    })



    /*
    * @tc.number     : SUB_WEB_ONLINEIMAGEACCESS_0100
    * @tc.name       : testOnlineImageAccess001
    * @tc.desc       : test onlineImageAccess
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnlineImageAccess001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testOnlineImageAccess001", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testOnlineImageAccess001", '""', 201810, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      if (await Utils.waitForExist(() => isReturn, 'testOnlineImageAccess001' + '_returnCheck', 1, 1000)) {
        done();
      }
    })

    /*
    * @tc.number     : SUB_WEB_ONLINEIMAGEACCESS_0200
    * @tc.name       : testOnlineImageAccess002
    * @tc.desc       : test onlineImageAccess
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnlineImageAccess002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testOnlineImageAccess002", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testImageAccess002", "\"load image complete\"", 201820, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      if (await Utils.waitForExist(() => isReturn, 'testOnlineImageAccess002' + '_returnCheck', 1, 1000)) {
        done();
      }
    })

    /*
    * @tc.number     : SUB_WEB_FILEACCESS_0100
    * @tc.name       : testFileAccess001
    * @tc.desc       : test fileAccess
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFileAccess001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFileAccess001", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testFileAccess001", "\"second\"", 201830, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      if (await Utils.waitForExist(() => isReturn, 'testFileAccess001' + '_returnCheck', 1, 1000)) {
        done();
      }
    })

    /*
    * @tc.number     : SUB_WEB_FILEACCESS_0200
    * @tc.name       : testFileAccess002
    * @tc.desc       : test fileAccess
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFileAccess002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFileAccess002", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testFileAccess002", "\"second\"", 201840, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      if (await Utils.waitForExist(() => isReturn, 'testFileAccess002' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
  })
}