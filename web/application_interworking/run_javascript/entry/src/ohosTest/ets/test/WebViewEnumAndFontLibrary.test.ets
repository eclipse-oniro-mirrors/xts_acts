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
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function WebViewEnumAndFontLibrary() {

  describe('WebViewEnumAndFontLibraryTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewEnumAndFontLibrary',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewEnumAndFontLibrary state success " + JSON.stringify(pages));
        if (!("WebViewEnumAndFontLibrary" == pages.name)) {
          console.info("get WebViewEnumAndFontLibrary state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebViewEnumAndFontLibrary page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewEnumAndFontLibrary page error: " + err);
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
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebViewControllerDownloadTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebViewControllerDownloadTest afterEach end");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_RUNJAVASCRIPT_0100
    * @tc.name       : testRunJavaScript001
    * @tc.desc       : test runJavaScript
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRunJavaScript001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitRunJavaScript", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRunJavaScript001", true, 1241, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_RUNJAVASCRIPT_0200
    * @tc.name       : testRunJavaScript002
    * @tc.desc       : test runJavaScript
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRunJavaScript002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testRunJavaScript002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRunJavaScript002", 'null', 10001, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_RUNJAVASCRIPT_0300
    * @tc.name       : testRunJavaScript003
    * @tc.desc       : test runJavaScript
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRunJavaScript003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testRunJavaScript003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRunJavaScript003", '"This value is from indexJru.html"', 10002, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_RUNJAVASCRIPT_0400
    * @tc.name       : testRunJavaScript004
    * @tc.desc       : test runJavaScript
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRunJavaScript004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testRunJavaScript004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRunJavaScript004", 'null', 10003, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_RUNJAVASCRIPTEXT_0100
    * @tc.name       : testRunJavaScriptExt001
    * @tc.desc       : test runJavaScriptExt
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRunJavaScriptExt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testRunJavaScriptExt001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRunJavaScriptExt001", '"This value is from indexJru.html"', 10004, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_RUNJAVASCRIPTEXT_0200
    * @tc.name       : testRunJavaScriptExt002
    * @tc.desc       : test runJavaScriptExt
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRunJavaScriptExt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testRunJavaScriptExt002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRunJavaScriptExt002", true, 10005, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_RUNJAVASCRIPTEXT_0300
    * @tc.name       : testRunJavaScriptExt003
    * @tc.desc       : test runJavaScriptExt
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRunJavaScriptExt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testRunJavaScriptExt003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRunJavaScriptExt003", '"This value is from indexJru.html"', 10006, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_RUNJAVASCRIPTEXT_0400
    * @tc.name       : testRunJavaScriptExt004
    * @tc.desc       : test runJavaScriptExt
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRunJavaScriptExt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testRunJavaScriptExt004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRunJavaScriptExt004", true, 10007, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })
  })
}
