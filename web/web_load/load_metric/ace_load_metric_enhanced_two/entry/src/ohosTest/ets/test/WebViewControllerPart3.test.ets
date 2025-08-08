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

export default function webViewControllerPart3Test() {

  describe('WebViewControllerPart3', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewControllerPart3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerPart3 state success " + JSON.stringify(pages));
        if (!("WebViewControllerPart3" == pages.name)) {
          console.info("get WebViewControllerPart3 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebViewControllerPart3 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerPart3 page error: " + err);
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
      console.info("WebViewControllerPart3 beforeEach start");
      done();
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_HASIMAGE_0100
    * @tc.name       : testHasImage001
    * @tc.desc       : test hasImage
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testHasImage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testHasImage001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testHasImage001", true, 100049, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_HASIMAGE_0200
    * @tc.name       : testHasImage002
    * @tc.desc       : test hasImage
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testHasImage002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testHasImage002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testHasImage002", false, 100050, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_HASIMAGE_0300
    * @tc.name       : testHasImage003
    * @tc.desc       : test hasImage
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testHasImage003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testHasImage003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testHasImage003", true, 100051, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_HASIMAGE_0400
    * @tc.name       : testHasImage004
    * @tc.desc       : test hasImage
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testHasImage004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testHasImage004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testHasImage004", true, 100052, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_HASIMAGE_0500
    * @tc.name       : testHasImage005
    * @tc.desc       : test hasImage
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testHasImage005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testHasImage005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testHasImage005", false, 100053, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_HASIMAGE_0600
    * @tc.name       : testHasImage006
    * @tc.desc       : test hasImage
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testHasImage006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testHasImage006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testHasImage006", true, 100054, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_GETFAVICON_0100
    * @tc.name       : testGetFavicon001
    * @tc.desc       : test getFavicon
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetFavicon001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetFavicon001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetFavicon001", false, 100057, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_GETFAVICON_0200
    * @tc.name       : testGetFavicon002
    * @tc.desc       : test getFavicon
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetFavicon002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetFavicon002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetFavicon002", '32_32', 100058, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_GETORIGINALURL_0100
    * @tc.name       : testGetOriginalUrl001
    * @tc.desc       : test getOriginalUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetOriginalUrl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetOriginalUrl001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetOriginalUrl001", 'resource://rawfile/secondCopy.html', 100059, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_GETORIGINALURL_0200
    * @tc.name       : testGetOriginalUrl002
    * @tc.desc       : test getOriginalUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetOriginalUrl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetOriginalUrl002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetOriginalUrl002", true, 100060, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_GETURL_0100
    * @tc.name       : testGetUrl001
    * @tc.desc       : test getUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetUrl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetUrl001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetUrl001", 'resource://rawfile/secondCopy.html', 100061, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_GETURL_0200
    * @tc.name       : testGetUrl002
    * @tc.desc       : test getUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetUrl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetUrl002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetUrl002", 'https://www.example.com/', 100062, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })



    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_GETPAGEHEIGHT_0100
    * @tc.name       : testGetPageHeight001
    * @tc.desc       : test getPageHeight
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetPageHeight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetPageHeight001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetPageHeight001", true, 100074, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })


  })
}
