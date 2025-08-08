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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
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
          await Utils.sleep(2000);
          console.info("push webViewControllerErrorCode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewControllerErrorCode page error: " + err);
      }
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

    afterEach(async (done: Function) => {
      console.info("WebViewControllerErrorCodeTestSuite afterEach start");
      await Utils.sleep(2000);
      console.info("WebViewControllerErrorCodeTestSuite afterEach end");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_RUNJAVASCRIPT_0100
    * @tc.name       : testRunJavaScriptError001
    * @tc.desc       : test runJavaScript error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testRunJavaScriptError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testRunJavaScriptError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRunJavaScriptError001", '17100001', 20305, done);
      sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_RUNJAVASCRIPT_0200
    * @tc.name       : testRunJavaScriptError002
    * @tc.desc       : test runJavaScript error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testRunJavaScriptError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testRunJavaScriptError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRunJavaScriptError002", '17100001', 20306, done);
      sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
    })

    /*
   * @tc.number     : SUB_WEB_ERRORCODE_GETURL_0100
   * @tc.name       : testGetUrlError001
   * @tc.desc       : test getUrl error
   * @tc.size       : MEDIUM
   * @tc.type       : Function
   * @tc.level      : Level 2
   */
    it('testGetUrlError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testGetUrlError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetUrlError001", '17100001', 20260, done);
      sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_PAGEUP_0100
    * @tc.name       : testPageUpError001
    * @tc.desc       : test pageUp error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testPageUpError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testPageUpError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testPageUpError001", '17100001', 20265, done);
      sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_PAGEUP_0200
    * @tc.name       : testPageUpError002
    * @tc.desc       : test pageUp error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testPageUpError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testPageUpError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testPageUpError002", '17100001', 20266, done);
      sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_PAGEDOWN_0100
    * @tc.name       : testPageDownError001
    * @tc.desc       : test pageDown error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testPageDownError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testPageDownError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testPageDownError001", '17100001', 20270, done);
      sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_PAGEDOWN_0200
    * @tc.name       : testPageDownError002
    * @tc.desc       : test pageDown error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testPageDownError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testPageDownError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testPageDownError002", '17100001', 20271, done);
      sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETORGNALURL_0100
    * @tc.name       : testGetOriginalUrlError001
    * @tc.desc       : test getOriginalUrl error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetOriginalUrlError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testGetOriginalUrlError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetOriginalUrlError001", '17100001', 20275, done);
      sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETFAVICON_0100
    * @tc.name       : testGetFaviconError001
    * @tc.desc       : test getFavicon error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetFaviconError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testGetFaviconError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetFaviconError001", '17100001', 20280, done);
      sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_SETNETWORKAVILABLE_0100
    * @tc.name       : testSetNetworkAvailableError001
    * @tc.desc       : test setNetworkAvailable error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testSetNetworkAvailableError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testSetNetworkAvailableError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSetNetworkAvailableError001", '17100001', 20285, done);
      sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_SETNETWORKAVILABLE_0200
    * @tc.name       : testSetNetworkAvailableError002
    * @tc.desc       : test setNetworkAvailable error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testSetNetworkAvailableError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testSetNetworkAvailableError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSetNetworkAvailableError002", '17100001', 20286, done);
      sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_HASIMAGE_0100
    * @tc.name       : testHasImageError001
    * @tc.desc       : test hasImage error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testHasImageError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testHasImageError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testHasImageError001", '17100001', 20290, done);
      sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_HASIMAGE_0200
    * @tc.name       : testHasImageError002
    * @tc.desc       : test hasImage error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testHasImageError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testHasImageError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testHasImageError002", '17100001', 20291, done);
      sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_GETBACKFORWARDENTRIES_0100
    * @tc.name       : testGetBackForwardEntriesError001
    * @tc.desc       : test getBackForwardEntries error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testGetBackForwardEntriesError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testGetBackForwardEntriesError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetBackForwardEntriesError001", '17100001', 20295, done);
      sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_SCROLLTO_0100
    * @tc.name       : testScrollToError001
    * @tc.desc       : test scrollTo error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testScrollToError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testScrollToError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testScrollToError001", '17100001', 20300, done);
      sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_RUNJAVASCRIPTEXT_0100
    * @tc.name       : testRunJavaScriptExtError001
    * @tc.desc       : test runJavaScriptExt error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testRunJavaScriptExtError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testRunJavaScriptExtError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRunJavaScriptExtError001", '17100001', 20310, done);
      sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_RUNJAVASCRIPTEXT_0200
    * @tc.name       : testRunJavaScriptExtError002
    * @tc.desc       : test runJavaScriptExt error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testRunJavaScriptExtError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testRunJavaScriptExtError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRunJavaScriptExtError002", '17100001', 20311, done);
      sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_STOREWEBARCHIVE_0100
    * @tc.name       : testStoreWebArchiveError001
    * @tc.desc       : test storeWebArchive error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testStoreWebArchiveError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testStoreWebArchiveError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testStoreWebArchiveError001", '17100001', 20350, done);
      sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_STOREWEBARCHIVE_0200
    * @tc.name       : testStoreWebArchiveError002
    * @tc.desc       : test storeWebArchive error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testStoreWebArchiveError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testStoreWebArchiveError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testStoreWebArchiveError002", '17100001', 20351, done);
      sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_STOREWEBARCHIVE_0300
    * @tc.name       : testStoreWebArchiveError003
    * @tc.desc       : test storeWebArchive error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testStoreWebArchiveError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testStoreWebArchiveError003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testStoreWebArchiveError003", '17100003', 20352, done);
      sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_STOREWEBARCHIVE_0400
    * @tc.name       : testStoreWebArchiveError004
    * @tc.desc       : test storeWebArchive error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testStoreWebArchiveError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testStoreWebArchiveError004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testStoreWebArchiveError004", '17100003', 20353, done);
      sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_STOREWEBARCHIVE_0500
    * @tc.name       : testStoreWebArchiveError005
    * @tc.desc       : test storeWebArchive error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testStoreWebArchiveError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testStoreWebArchiveError005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testStoreWebArchiveError005", '17100001', 20354, done);
      sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_STOREWEBARCHIVE_0600
    * @tc.name       : testStoreWebArchiveError006
    * @tc.desc       : test storeWebArchive error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testStoreWebArchiveError006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testStoreWebArchiveError006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testStoreWebArchiveError006", '17100001', 20355, done);
      sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_STOREWEBARCHIVE_0700
    * @tc.name       : testStoreWebArchiveError007
    * @tc.desc       : test storeWebArchive error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testStoreWebArchiveError007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testStoreWebArchiveError007", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testStoreWebArchiveError007", '17100003', 20356, done);
      sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_STOREWEBARCHIVE_0800
    * @tc.name       : testStoreWebArchiveError008
    * @tc.desc       : test storeWebArchive error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testStoreWebArchiveError008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testStoreWebArchiveError008", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testStoreWebArchiveError008", '17100003', 20357, done);
      sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_REMOVECACHE_0100
    * @tc.name       : testRemoveCacheError001
    * @tc.desc       : test removeCache error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testRemoveCacheError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testRemoveCacheError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRemoveCacheError001", '17100001', 20358, done);
      sendEventByKey('WebViewControllerErrorCodeButton', 10, '');
    })

  })
}
