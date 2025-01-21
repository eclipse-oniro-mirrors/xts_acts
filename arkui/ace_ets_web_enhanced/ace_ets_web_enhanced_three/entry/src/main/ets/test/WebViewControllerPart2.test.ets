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

import { beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';

export default function webViewControllerPart2() {

  describe('WebViewControllerPart2TestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/webViewControllerPart2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewControllerPart2 state success " + JSON.stringify(pages));
        if (!("webViewControllerPart2" == pages.name)) {
          console.info("get webViewControllerPart2 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webViewControllerPart2 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewControllerPart2 page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("webViewControllerPart2 beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_CLEARHISTORY_0100
    * @tc.name       : testClearHistory001
    * @tc.desc       : test clearHistory
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testClearHistory001', 0, async (done: Function) => {
      Utils.emitEvent("testClearHistory001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testClearHistory001", false, 37000, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_REFRESH_0100
    * @tc.name       : testRefresh001
    * @tc.desc       : test refresh
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRefresh001', 0, async (done: Function) => {
      Utils.emitEvent("testRefresh001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRefresh001", "index", 37001, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
   * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_LOADDATA_0100
   * @tc.name       : testLoadData001
   * @tc.desc       : test loadData
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 1
   */
    it('testLoadData001', 0, async (done: Function) => {
      Utils.emitEvent("testLoadData001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testLoadData001", "LoadData", 37002, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_LOADURL_0100
    * @tc.name       : testLoadUrl001
    * @tc.desc       : test loadUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testLoadUrl001', 0, async (done: Function) => {
      Utils.emitEvent("testLoadUrl001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testLoadUrl001", "OpenAtom OpenHarmony", 37003, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_LOADURL_0200
    * @tc.name       : testLoadUrl002
    * @tc.desc       : test loadUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testLoadUrl002', 0, async (done: Function) => {
      Utils.emitEvent("testLoadUrl002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testLoadUrl002", "second", 37004, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_LOADURL_0300
    * @tc.name       : testLoadUrl003
    * @tc.desc       : test loadUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testLoadUrl003', 0, async (done: Function) => {
      Utils.emitEvent("testLoadUrl003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testLoadUrl003", "second", 77000, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_LOADURL_0400
    * @tc.name       : testLoadUrl004
    * @tc.desc       : test loadUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testLoadUrl004', 0, async (done: Function) => {
      Utils.emitEvent("testLoadUrl004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testLoadUrl004", "second", 77002, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_BACKORFORWARD_0100
    * @tc.name       : testBackOrForward001
    * @tc.desc       : test backOrForward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testBackOrForward001', 0, async (done: Function) => {
      Utils.emitEvent("testBackOrForward001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testBackOrForward001", "second", 37005, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_BACKORFORWARD_0200
    * @tc.name       : testBackOrForward002
    * @tc.desc       : test backOrForward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testBackOrForward002', 0, async (done: Function) => {
      Utils.emitEvent("testBackOrForward002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testBackOrForward002", "index", 37006, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_BACKORFORWARD_0300
    * @tc.name       : testBackOrForward003
    * @tc.desc       : test backOrForward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testBackOrForward003', 0, async (done: Function) => {
      Utils.emitEvent("testBackOrForward003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testBackOrForward003", "index", 37007, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_BACKORFORWARD_0400
    * @tc.name       : testBackOrForward004
    * @tc.desc       : test backOrForward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testBackOrForward004', 0, async (done: Function) => {
      Utils.emitEvent("testBackOrForward004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testBackOrForward004", "index", 37008, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_GETUSERAGENT_0100
    * @tc.name       : testGetUserAgent001
    * @tc.desc       : test getUserAgent
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetUserAgent001', 0, async (done: Function) => {
      Utils.emitEvent("testGetUserAgent001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetUserAgent001", true, 37009, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_GETWEBID_0100
    * @tc.name       : testGetWebId001
    * @tc.desc       : test getWebId
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetWebId001', 0, async (done: Function) => {
      Utils.emitEvent("testGetWebId001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetWebId001", true, 37010, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_GETTITLE_0100
    * @tc.name       : testGetTitle001
    * @tc.desc       : test getTitle
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetTitle001', 0, async (done: Function) => {
      Utils.emitEvent("testGetTitle001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetTitle001", "index", 37011, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SEARCHALLASYNC_0100
    * @tc.name       : testSearchAllAsync001
    * @tc.desc       : test searchAllAsync
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSearchAllAsync001', 0, async (done: Function) => {
      Utils.emitEvent("testSearchAllAsync001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSearchAllAsync001", 2, 37012, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SEARCHNEXT_0100
    * @tc.name       : testSearchNext001
    * @tc.desc       : test searchNext
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSearchNext001', 0, async (done: Function) => {
      Utils.emitEvent("testSearchNext001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSearchNext001", true, 100080, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SEARCHNEXT_0200
    * @tc.name       : testSearchNext002
    * @tc.desc       : test searchNext
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSearchNext002', 0, async (done: Function) => {
      Utils.emitEvent("testSearchNext002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSearchNext002", true, 100081, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_STOREWEBARCHIVE_0100
    * @tc.name       : testStoreWebArchive001
    * @tc.desc       : test storeWebArchive
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testStoreWebArchive001', 0, async (done: Function) => {
      Utils.emitEvent("testStoreWebArchive001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testStoreWebArchive001", "/data/storage/el2/base/index.html.mht", 37013, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_STOREWEBARCHIVE_0200
    * @tc.name       : testStoreWebArchive002
    * @tc.desc       : test storeWebArchive
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testStoreWebArchive002', 0, async (done: Function) => {
      Utils.emitEvent("testStoreWebArchive002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testStoreWebArchive002", "/data/storage/el2/base/second.html.mht", 37014, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_STOREWEBARCHIVE_0300
    * @tc.name       : testStoreWebArchive003
    * @tc.desc       : test storeWebArchive
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testStoreWebArchive003', 0, async (done: Function) => {
      Utils.emitEvent("testStoreWebArchive003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testStoreWebArchive003", "/data/storage/el2/base/index.html.mht", 37015, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_STOREWEBARCHIVE_0400
    * @tc.name       : testStoreWebArchive004
    * @tc.desc       : test storeWebArchive
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testStoreWebArchive004', 0, async (done: Function) => {
      Utils.emitEvent("testStoreWebArchive004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testStoreWebArchive004", "/data/storage/el2/base/index.html.mht", 37016, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_STOP_0100
    * @tc.name       : testStop001
    * @tc.desc       : test Stop
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testStop001', 0, async (done: Function) => {
      Utils.emitEvent("testStop001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testStop001", "index", 37017, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_GETCUSTOMUSERAGENT_0100
    * @tc.name       : testGetCustomUserAgent001
    * @tc.desc       : test getCustomUserAgent
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetCustomUserAgent001', 0, async (done: Function) => {
      Utils.emitEvent("testGetCustomUserAgent001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetCustomUserAgent001", true, 37018, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SETCUSTOMUSERAGENT_0100
    * @tc.name       : testSetCustomUserAgent001
    * @tc.desc       : test setCustomUserAgent
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSetCustomUserAgent001', 0, async (done: Function) => {
      Utils.emitEvent("testSetCustomUserAgent001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testSetCustomUserAgent001", "userAgent", 37019, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_PROTECTEDRESOURCETYPE_0100
    * @tc.name       : testProtectedResourceType001
    * @tc.desc       : test ProtectedResourceType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testProtectedResourceType001', 0, async (done: Function) => {
      Utils.emitEvent("testProtectedResourceType001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testProtectedResourceType001", 'TYPE_SENSOR', 37020, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_NATIVEEMBEDSTATUS_0100
    * @tc.name       : testNativeEmbedStatus001
    * @tc.desc       : test NativeEmbedStatus
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testNativeEmbedStatus001', 0, async (done: Function) => {
      Utils.emitEvent("testNativeEmbedStatus001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNativeEmbedStatus001", 3, 37021, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_NATIVEEMBEDSTATUS_0200
    * @tc.name       : testNativeEmbedStatus002
    * @tc.desc       : test NativeEmbedStatus
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testNativeEmbedStatus002', 0, async (done: Function) => {
      Utils.emitEvent("testNativeEmbedStatus002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testNativeEmbedStatus002", 4, 37022, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SCROLLTYPE_0100
    * @tc.name       : testScrollType001
    * @tc.desc       : test ScrollType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScrollType001', 0, async (done: Function) => {
      Utils.emitEvent("testScrollType001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testScrollType001", 0, 37023, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SCROLLBYWITHRESULT_0100
    * @tc.name       : testscrollByWithResult001
    * @tc.desc       : test ScrollByWithResult
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testscrollByWithResult001', 0, async (done: Function) => {
      Utils.emitEvent("testscrollByWithResult001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testscrollByWithResult001", "error", 37024, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })

  })
}
