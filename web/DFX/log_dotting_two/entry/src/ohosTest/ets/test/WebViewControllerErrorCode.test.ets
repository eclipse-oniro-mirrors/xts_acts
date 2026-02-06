/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 115280;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webViewControllerErrorCode() {
  describe('WebViewControllerErrorCodeTestSuite', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewControllerErrorCode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewControllerErrorCode state success " + JSON.stringify(pages));
        if (!("webViewControllerErrorCode" == pages.name)) {
          console.info("get webViewControllerErrorCode state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webViewControllerErrorCode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewControllerErrorCode page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebViewControllerErrorCodeButton"), 10000);
      console.log("WebViewControllerErrorCodeButton webView");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewControllerErrorCode beforeEach start");
      done();
    })

    /**
     * @tc.name   testGetUrlError001
     * @tc.number SUB_WEB_ERRORCODE_GETURL_0100
     * @tc.desc   test getUrl error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetUrlError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testGetUrlError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetUrlError001", '17100001', 115290, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeButton");
    })

    /**
     * @tc.name   testPageUpError001
     * @tc.number SUB_WEB_ERRORCODE_PAGEUP_0100
     * @tc.desc   test pageUp error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPageUpError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testPageUpError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testPageUpError001", '17100001', 115300, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeButton");
    })

    /**
     * @tc.name   testPageUpError002
     * @tc.number SUB_WEB_ERRORCODE_PAGEUP_0200
     * @tc.desc   test pageUp error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPageUpError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testPageUpError002", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testPageUpError002", '17100001', 115310, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeButton");
    })

    /**
     * @tc.name   testPageDownError001
     * @tc.number SUB_WEB_ERRORCODE_PAGEDOWN_0100
     * @tc.desc   test pageDown error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPageDownError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testPageDownError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testPageDownError001", '17100001', 115320, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeButton");
    })

    /**
     * @tc.name   testPageDownError002
     * @tc.number SUB_WEB_ERRORCODE_PAGEDOWN_0200
     * @tc.desc   test pageDown error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPageDownError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testPageDownError002", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testPageDownError002", '17100001', 115330, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeButton");
    })

    /**
     * @tc.name   testGetOriginalUrlError001
     * @tc.number SUB_WEB_ERRORCODE_GETORGNALURL_0100
     * @tc.desc   test getOriginalUrl error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetOriginalUrlError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testGetOriginalUrlError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetOriginalUrlError001", '17100001', 115340, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeButton");
    })

    /**
     * @tc.name   testGetFaviconError001
     * @tc.number SUB_WEB_ERRORCODE_GETFAVICON_0100
     * @tc.desc   test getFavicon error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetFaviconError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testGetFaviconError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetFaviconError001", '17100001', 115350, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeButton");
    })

    /**
     * @tc.name   testSetNetworkAvailableError001
     * @tc.number SUB_WEB_ERRORCODE_SETNETWORKAVILABLE_0100
     * @tc.desc   test setNetworkAvailable error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetNetworkAvailableError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testSetNetworkAvailableError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testSetNetworkAvailableError001", '17100001', 115360, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeButton");
    })

    /**
     * @tc.name   testSetNetworkAvailableError002
     * @tc.number SUB_WEB_ERRORCODE_SETNETWORKAVILABLE_0200
     * @tc.desc   test setNetworkAvailable error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetNetworkAvailableError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testSetNetworkAvailableError002", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testSetNetworkAvailableError002", '17100001', 115370, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeButton");
    })

    /**
     * @tc.name   testHasImageError001
     * @tc.number SUB_WEB_ERRORCODE_HASIMAGE_0100
     * @tc.desc   test hasImage error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHasImageError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testHasImageError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testHasImageError001", '17100001', 115380, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeButton");
    })

    /**
     * @tc.name   testHasImageError002
     * @tc.number SUB_WEB_ERRORCODE_HASIMAGE_0200
     * @tc.desc   test hasImage error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHasImageError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testHasImageError002", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testHasImageError002", '17100001', 115390, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeButton");
    })

    /**
     * @tc.name   testGetBackForwardEntriesError001
     * @tc.number SUB_WEB_ERRORCODE_GETBACKFORWARDENTRIES_0100
     * @tc.desc   test getBackForwardEntries error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetBackForwardEntriesError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testGetBackForwardEntriesError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetBackForwardEntriesError001", '17100001', 115400, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeButton");
    })

    /**
     * @tc.name   testScrollToError001
     * @tc.number SUB_WEB_ERRORCODE_SCROLLTO_0100
     * @tc.desc   test scrollTo error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testScrollToError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testScrollToError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testScrollToError001", '17100001', 115410, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeButton");
    })

    /**
     * @tc.name   testRunJavaScriptError001
     * @tc.number SUB_WEB_ERRORCODE_RUNJAVASCRIPT_0100
     * @tc.desc   test runJavaScript error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRunJavaScriptError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testRunJavaScriptError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testRunJavaScriptError001", '17100001', 115420, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeButton");
    })

    /**
     * @tc.name   testRunJavaScriptError002
     * @tc.number SUB_WEB_ERRORCODE_RUNJAVASCRIPT_0200
     * @tc.desc   test runJavaScript error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRunJavaScriptError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testRunJavaScriptError002", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testRunJavaScriptError002", '17100001', 115430, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeButton");
    })

    /**
     * @tc.name   testRunJavaScriptExtError001
     * @tc.number SUB_WEB_ERRORCODE_RUNJAVASCRIPTEXT_0100
     * @tc.desc   test runJavaScriptExt error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRunJavaScriptExtError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testRunJavaScriptExtError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testRunJavaScriptExtError001", '17100001', 115440, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeButton");
    })

    /**
     * @tc.name   testRunJavaScriptExtError002
     * @tc.number SUB_WEB_ERRORCODE_RUNJAVASCRIPTEXT_0200
     * @tc.desc   test runJavaScriptExt error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRunJavaScriptExtError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testRunJavaScriptExtError002", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testRunJavaScriptExtError002", '17100001', 115450, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeButton");
    })

    /**
     * @tc.name   testStoreWebArchiveError001
     * @tc.number SUB_WEB_ERRORCODE_STOREWEBARCHIVE_0100
     * @tc.desc   test storeWebArchive error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStoreWebArchiveError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testStoreWebArchiveError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testStoreWebArchiveError001", '17100001', 115460, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeButton");
    })

    /**
     * @tc.name   testStoreWebArchiveError002
     * @tc.number SUB_WEB_ERRORCODE_STOREWEBARCHIVE_0200
     * @tc.desc   test storeWebArchive error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStoreWebArchiveError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testStoreWebArchiveError002", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testStoreWebArchiveError002", '17100001', 115470, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeButton");
    })

    /**
     * @tc.name   testStoreWebArchiveError003
     * @tc.number SUB_WEB_ERRORCODE_STOREWEBARCHIVE_0300
     * @tc.desc   test storeWebArchive error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStoreWebArchiveError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testStoreWebArchiveError003", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testStoreWebArchiveError003", '17100003', 115480, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeButton");
    })

    /**
     * @tc.name   testStoreWebArchiveError004
     * @tc.number SUB_WEB_ERRORCODE_STOREWEBARCHIVE_0400
     * @tc.desc   test storeWebArchive error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStoreWebArchiveError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testStoreWebArchiveError004", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testStoreWebArchiveError004", '17100003', 115490, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeButton");
    })

    /**
     * @tc.name   testStoreWebArchiveError005
     * @tc.number SUB_WEB_ERRORCODE_STOREWEBARCHIVE_0500
     * @tc.desc   test storeWebArchive error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStoreWebArchiveError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testStoreWebArchiveError005", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testStoreWebArchiveError005", '17100001', 115500, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeButton");
    })

    /**
     * @tc.name   testStoreWebArchiveError006
     * @tc.number SUB_WEB_ERRORCODE_STOREWEBARCHIVE_0600
     * @tc.desc   test storeWebArchive error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStoreWebArchiveError006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testStoreWebArchiveError006", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testStoreWebArchiveError006", '17100001', 115510, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeButton");
    })

    /**
     * @tc.name   testStoreWebArchiveError007
     * @tc.number SUB_WEB_ERRORCODE_STOREWEBARCHIVE_0700
     * @tc.desc   test storeWebArchive error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStoreWebArchiveError007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testStoreWebArchiveError007", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testStoreWebArchiveError007", '17100003', 115520, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeButton");
    })

    /**
     * @tc.name   testStoreWebArchiveError008
     * @tc.number SUB_WEB_ERRORCODE_STOREWEBARCHIVE_0800
     * @tc.desc   test storeWebArchive error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStoreWebArchiveError008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testStoreWebArchiveError008", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testStoreWebArchiveError008", '17100003', 115530, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeButton");
    })

    /**
     * @tc.name   testRemoveCacheError001
     * @tc.number SUB_WEB_ERRORCODE_REMOVECACHE_0100
     * @tc.desc   test removeCache error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRemoveCacheError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testRemoveCacheError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testRemoveCacheError001", '17100001', 115540, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeButton");
    })
  })
}