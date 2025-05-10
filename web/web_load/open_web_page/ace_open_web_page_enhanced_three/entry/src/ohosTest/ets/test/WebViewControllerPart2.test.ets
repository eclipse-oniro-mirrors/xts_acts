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
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function webViewControllerPart2() {

  describe('WebViewControllerPart2TestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewControllerPart2',
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
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("webViewControllerPart2 beforeEach start");
      done();
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_GETTITLE_0100
    * @tc.name       : testGetTitle001
    * @tc.desc       : test getTitle
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetTitle001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetTitle001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetTitle001", "index", 37011, done);
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
    it('testStop001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testStop001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testStop001", "index", 37017, done);
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
    it('testRefresh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
    it('testLoadData001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
    it('testLoadUrl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
    it('testLoadUrl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
    it('testLoadUrl003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
    it('testLoadUrl004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testLoadUrl004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testLoadUrl004", "second", 77002, done);
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
    it('testGetUserAgent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
    it('testGetWebId001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetWebId001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetWebId001", true, 37010, done);
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
    it('testGetCustomUserAgent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
    it('testSetCustomUserAgent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
    it('testProtectedResourceType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testProtectedResourceType001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testProtectedResourceType001", 'TYPE_SENSOR', 37020, done);
      sendEventByKey('WebViewControllerPart2Button', 10, '');
    })


  })
}
