/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
import { Driver, ON } from '@ohos.UiTest';
import { accessibility, config } from '@kit.AccessibilityKit';
import { BusinessError } from '@ohos.base';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const driver: Driver = Driver.create();
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function webViewControllerCreateWebPrintDocumentAdapterTest() {

  describe('WebViewControllerCreateWebPrintDocumentAdapter', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewControllerCreateWebPrintDocumentAdapter',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerCreateWebPrintDocumentAdapter state success " + JSON.stringify(pages));
        if (!("WebViewControllerCreateWebPrintDocumentAdapter" == pages.name)) {
          console.info("get WebViewControllerCreateWebPrintDocumentAdapter state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebViewControllerCreateWebPrintDocumentAdapter page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerCreateWebPrintDocumentAdapter page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: BusinessError) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebViewControllerCreateWebPrintDocumentAdapter beforeEach start");
      done();
    })

    /**
     * @tc.name   testCreateWebPrintDocumentAdapter001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CREATEWEBPRINTDOCUMENTADAPTER_0100
     * @tc.desc   test createWebPrintDocumentAdapter with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateWebPrintDocumentAdapter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let emitKey = 'testCreateWebPrintDocumentAdapter001';
        let tcName = 'testCreateWebPrintDocumentAdapter001';
        let isReturn = false;
        Utils.emitEvent(emitKey, 133400);
        Utils.registerEvent(tcName, "empty", 133410, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "WebViewControllerTestButton", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
     * @tc.name   testCreateWebPrintDocumentAdapter002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CREATEWEBPRINTDOCUMENTADAPTER_0200
     * @tc.desc   test createWebPrintDocumentAdapter with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateWebPrintDocumentAdapter002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let emitKey = 'testCreateWebPrintDocumentAdapter002';
        let tcName = 'testCreateWebPrintDocumentAdapter002';
        let isReturn = false;
        Utils.emitEvent(emitKey, 133400);
        Utils.registerEvent(tcName, "null", 133420, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "WebViewControllerTestButton", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

/**
      * @tc.name   testCreateWebPrintDocumentAdapter003
      * @tc.number   SUB_WEB_WEBVIEWCONTROLLER_CREATEWEBPRINTDOCUMENTADAPTER_0300
      * @tc.desc   test createWebPrintDocumentAdapter with undefined
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testCreateWebPrintDocumentAdapter003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let emitKey = 'testCreateWebPrintDocumentAdapter003';
        let tcName = 'testCreateWebPrintDocumentAdapter003';
        let isReturn = false;
        Utils.emitEvent(emitKey, 133400);
        Utils.registerEvent(tcName, "undefined", 133430, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "WebViewControllerTestButton", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
      * @tc.name   testCreateWebPrintDocumentAdapter004
      * @tc.number   SUB_WEB_WEBVIEWCONTROLLER_CREATEWEBPRINTDOCUMENTADAPTER_0400
      * @tc.desc   test createWebPrintDocumentAdapter return value coverage
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testCreateWebPrintDocumentAdapter004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let emitKey = 'testCreateWebPrintDocumentAdapter004';
        let tcName = 'testCreateWebPrintDocumentAdapter004';
        let isReturn = false;
        Utils.emitEvent(emitKey, 133400);
        Utils.registerEvent(tcName, true, 133440, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "WebViewControllerTestButton", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
      * @tc.name   testCreateWebPrintDocumentAdapter005
      * @tc.number   SUB_WEB_WEBVIEWCONTROLLER_CREATEWEBPRINTDOCUMENTADAPTER_0500
      * @tc.desc   test createWebPrintDocumentAdapter with valid string
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testCreateWebPrintDocumentAdapter005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let emitKey = 'testCreateWebPrintDocumentAdapter005';
        let tcName = 'testCreateWebPrintDocumentAdapter005';
        let isReturn = false;
        Utils.emitEvent(emitKey, 133400);
        Utils.registerEvent(tcName, "returnValue", 133450, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "WebViewControllerTestButton", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
      * @tc.name   testCreateWebPrintDocumentAdapter006
      * @tc.number   SUB_WEB_WEBVIEWCONTROLLER_CREATEWEBPRINTDOCUMENTADAPTER_0600
      * @tc.desc   test createWebPrintDocumentAdapter with special characters
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testCreateWebPrintDocumentAdapter006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let emitKey = 'testCreateWebPrintDocumentAdapter006';
        let tcName = 'testCreateWebPrintDocumentAdapter006';
        let isReturn = false;
        Utils.emitEvent(emitKey, 133400);
        Utils.registerEvent(tcName, "returnValue", 133460, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "WebViewControllerTestButton", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
      * @tc.name   testCreateWebPrintDocumentAdapter007
      * @tc.number   SUB_WEB_WEBVIEWCONTROLLER_CREATEWEBPRINTDOCUMENTADAPTER_0700
      * @tc.desc   test createWebPrintDocumentAdapter with long string
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testCreateWebPrintDocumentAdapter007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let emitKey = 'testCreateWebPrintDocumentAdapter007';
        let tcName = 'testCreateWebPrintDocumentAdapter007';
        let isReturn = false;
        Utils.emitEvent(emitKey, 133400);
        Utils.registerEvent(tcName, "returnValue", 133470, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "WebViewControllerTestButton", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

    /**
      * @tc.name   testCreateWebPrintDocumentAdapter008
      * @tc.number   SUB_WEB_WEBVIEWCONTROLLER_CREATEWEBPRINTDOCUMENTADAPTER_0800
      * @tc.desc   test createWebPrintDocumentAdapter error case - 17100001 error
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('testCreateWebPrintDocumentAdapter008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let emitKey = 'testCreateWebPrintDocumentAdapter008';
        let tcName = 'testCreateWebPrintDocumentAdapter008';
        let isReturn = false;
        Utils.emitEvent(emitKey, 133400);
        Utils.registerEvent(tcName, true, 133480, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "WebViewControllerTestButton", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      });

  })
}
