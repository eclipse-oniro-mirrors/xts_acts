/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';

const EVENT_ID_SET_SUITE_KEY = 134000;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webResourceResponseGetResponseDataExTest() {
  describe('WebResourceResponseGetResponseDataEx', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebResourceResponseGetResponseDataEx',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebResourceResponseGetResponseDataEx state success " + JSON.stringify(pages));
        if (!("WebResourceResponseGetResponseDataEx" == pages.name)) {
          console.info("get WebResourceResponseGetResponseDataEx state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebResourceResponseGetResponseDataEx state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebResourceResponseGetResponseDataEx page error:" + err);
      }
      await driver.waitForComponent(ON.id("webResourceResponseTestButton"), 10000);
      console.log("waitForComponent webResourceResponseTestButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: BusinessError) => {
        console.error(`failed to enable, ${err}`);
      })
      done();
    })

    /**
     * @tc.name   testGetResponseDataExString001
     * @tc.number SUB_WEB_WEBRESOURCE_RESPONSE_GETRESPONSEDATAEX_STRING_0100
     * @tc.desc   test getResponseDataEx with HTML string return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetResponseDataExString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let emitKey = 'testGetResponseDataExString001';
      let tcName = 'testGetResponseDataExString001';
      let isReturn = false;
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent(tcName, true, 134010, done);
      await Utils.waitAndClickComponent(driver, "webResourceResponseTestButton");
    })

    /**
     * @tc.name   testGetResponseDataExString002
     * @tc.number SUB_WEB_WEBRESOURCE_RESPONSE_GETRESPONSEDATAEX_STRING_0200
     * @tc.desc   test getResponseDataEx with plain string return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetResponseDataExString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let emitKey = 'testGetResponseDataExString002';
      let tcName = 'testGetResponseDataExString002';
      let isReturn = false;
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent(tcName, true, 134020, done);
      await Utils.waitAndClickComponent(driver, "webResourceResponseTestButton");
    })

    /**
     * @tc.name   testGetResponseDataExNumber001
     * @tc.number SUB_WEB_WEBRESOURCE_RESPONSE_GETRESPONSEDATAEX_NUMBER_0100
     * @tc.desc   test getResponseDataEx with file handle return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetResponseDataExNumber001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let emitKey = 'testGetResponseDataExNumber001';
      let tcName = 'testGetResponseDataExNumber001';
      let isReturn = false;
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent(tcName, true, 134030, done);
      await Utils.waitAndClickComponent(driver, "webResourceResponseTestButton");
    })

    /**
     * @tc.name   testGetResponseDataExNumber002
     * @tc.number SUB_WEB_WEBRESOURCE_RESPONSE_GETRESPONSEDATAEX_NUMBER_0200
     * @tc.desc   test getResponseDataEx with zero file handle return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetResponseDataExNumber002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let emitKey = 'testGetResponseDataExNumber002';
      let tcName = 'testGetResponseDataExNumber002';
      let isReturn = false;
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent(tcName, true, 134040, done);
      await Utils.waitAndClickComponent(driver, "webResourceResponseTestButton");
    })

    /**
     * @tc.name   testGetResponseDataExArrayBuffer001
     * @tc.number SUB_WEB_WEBRESOURCE_RESPONSE_GETRESPONSEDATAEX_ARRAYBUFFER_0100
     * @tc.desc   test getResponseDataEx with ArrayBuffer return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetResponseDataExArrayBuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let emitKey = 'testGetResponseDataExArrayBuffer001';
      let tcName = 'testGetResponseDataExArrayBuffer001';
      let isReturn = false;
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent(tcName, true, 134050, done);
      await Utils.waitAndClickComponent(driver, "webResourceResponseTestButton");
    })

    /**
     * @tc.name   testGetResponseDataExResource001
     * @tc.number SUB_WEB_WEBRESOURCE_RESPONSE_GETRESPONSEDATAEX_RESOURCE_0100
     * @tc.desc   test getResponseDataEx with Resource return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetResponseDataExResource001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let emitKey = 'testGetResponseDataExResource001';
      let tcName = 'testGetResponseDataExResource001';
      let isReturn = false;
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent(tcName, true, 134060, done);
      await Utils.waitAndClickComponent(driver, "webResourceResponseTestButton");
    })

    /**
     * @tc.name   testGetResponseDataExUndefined001
     * @tc.number SUB_WEB_WEBRESOURCE_RESPONSE_GETRESPONSEDATAEX_UNDEFINED_0100
     * @tc.desc   test getResponseDataEx with undefined return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetResponseDataExUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let emitKey = 'testGetResponseDataExUndefined001';
      let tcName = 'testGetResponseDataExUndefined001';
      let isReturn = false;
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent(tcName, true, 134070, done);
      await Utils.waitAndClickComponent(driver, "webResourceResponseTestButton");
    })

    /**
     * @tc.name   testGetResponseDataExBoundary001
     * @tc.number SUB_WEB_WEBRESOURCE_RESPONSE_GETRESPONSEDATAEX_BOUNDARY_0100
     * @tc.desc   test getResponseDataEx with empty string boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetResponseDataExBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let emitKey = 'testGetResponseDataExBoundary001';
      let tcName = 'testGetResponseDataExBoundary001';
      let isReturn = false;
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent(tcName, true, 134080, done);
      await Utils.waitAndClickComponent(driver, "webResourceResponseTestButton");
    })

    /**
     * @tc.name   testGetResponseDataExBoundary002
     * @tc.number SUB_WEB_WEBRESOURCE_RESPONSE_GETRESPONSEDATAEX_BOUNDARY_0200
     * @tc.desc   test getResponseDataEx with large number boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetResponseDataExBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let emitKey = 'testGetResponseDataExBoundary002';
      let tcName = 'testGetResponseDataExBoundary002';
      let isReturn = false;
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent(tcName, true, 134090, done);
      await Utils.waitAndClickComponent(driver, "webResourceResponseTestButton");
    })

    /**
     * @tc.name   testGetResponseDataExError001
     * @tc.number SUB_WEB_WEBRESOURCE_RESPONSE_GETRESPONSEDATAEX_ERROR_0100
     * @tc.desc   test getResponseDataEx with invalid state error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetResponseDataExError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let emitKey = 'testGetResponseDataExError001';
      let tcName = 'testGetResponseDataExError001';
      let isReturn = false;
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent(tcName, true, 134100, done);
      await Utils.waitAndClickComponent(driver, "webResourceResponseTestButton");
    })
  })
}