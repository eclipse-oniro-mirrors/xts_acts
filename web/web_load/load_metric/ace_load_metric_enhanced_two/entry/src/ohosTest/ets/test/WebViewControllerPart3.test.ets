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
import { Driver, ON } from '@kit.TestKit';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';
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
          console.info("push WebViewControllerPart3 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerPart3 page error: " + err);
      }
      await waitForComponent("WebViewControllerTestButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebViewControllerPart3 beforeEach start");
      done();
    })
    /**
     * @tc.name   testHasImage001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_HASIMAGE_0100
     * @tc.desc   test hasImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasImage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testHasImage001", 14058)
      Utils.registerEvent("testHasImage001", true, 14059, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /**
     * @tc.name   testHasImage002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_HASIMAGE_0200
     * @tc.desc   test hasImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasImage002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testHasImage002", 14058)
      Utils.registerEvent("testHasImage002", false, 14060, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /**
     * @tc.name   testHasImage003
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_HASIMAGE_0300
     * @tc.desc   test hasImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasImage003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testHasImage003", 14058)
      Utils.registerEvent("testHasImage003", true, 14061, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /**
     * @tc.name   testHasImage004
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_HASIMAGE_0400
     * @tc.desc   test hasImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasImage004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testHasImage004", 14058)
      Utils.registerEvent("testHasImage004", true, 14062, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /**
     * @tc.name   testHasImage005
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_HASIMAGE_0500
     * @tc.desc   test hasImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasImage005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testHasImage005", 14058)
      Utils.registerEvent("testHasImage005", false, 14063, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /**
     * @tc.name   testHasImage006
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_HASIMAGE_0600
     * @tc.desc   test hasImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasImage006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testHasImage006", 14058)
      Utils.registerEvent("testHasImage006", true, 14064, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /**
     * @tc.name   testGetFavicon001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_GETFAVICON_0100
     * @tc.desc   test getFavicon
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetFavicon001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetFavicon001", 14058)
      Utils.registerEvent("testGetFavicon001", false, 14065, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /**
     * @tc.name   testGetFavicon002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_GETFAVICON_0200
     * @tc.desc   test getFavicon
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetFavicon002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetFavicon002", 14058)
      Utils.registerEvent("testGetFavicon002", '32_32', 14066, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /**
     * @tc.name   testGetOriginalUrl001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_GETORIGINALURL_0100
     * @tc.desc   test getOriginalUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetOriginalUrl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetOriginalUrl001", 14058)
      Utils.registerEvent("testGetOriginalUrl001", 'resource://rawfile/secondCopy.html', 14067, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /**
     * @tc.name   testGetOriginalUrl002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_GETORIGINALURL_0200
     * @tc.desc   test getOriginalUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetOriginalUrl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetOriginalUrl002", 14058)
      Utils.registerEvent("testGetOriginalUrl002", true, 14067, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /**
     * @tc.name   testGetUrl001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_GETURL_0100
     * @tc.desc   test getUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUrl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetUrl001", 14058)
      Utils.registerEvent("testGetUrl001", 'resource://rawfile/secondCopy.html', 14068, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })

    /**
     * @tc.name   testGetUrl002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_GETURL_0200
     * @tc.desc   test getUrl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUrl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetUrl002", 14058)
      Utils.registerEvent("testGetUrl002", 'https://www.example.com/', 14069, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })



    /**
     * @tc.name   testGetPageHeight001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_GETPAGEHEIGHT_0100
     * @tc.desc   test getPageHeight
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetPageHeight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetPageHeight001", 14058)
      Utils.registerEvent("testGetPageHeight001", true, 14070, done);
      sendEventByKey('WebViewControllerTestButton', 10, '');
    })


  })
}
