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
import { waitForComponent } from './WaitTest.test';
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
          console.info("push WebViewEnumAndFontLibrary page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewEnumAndFontLibrary page error: " + err);
      }
      await waitForComponent("buttonEnumAndFontLibrary");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
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
      Utils.emitEvent("emitRunJavaScript", 171340)
      Utils.registerEvent("testRunJavaScript001", true, 171350, done);
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
      Utils.emitEvent("testRunJavaScript002", 171340)
      Utils.registerEvent("testRunJavaScript002", 'null', 171360, done);
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
      Utils.emitEvent("testRunJavaScript003", 171340)
      Utils.registerEvent("testRunJavaScript003", '"This value is from indexJru.html"', 171370, done);
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
      Utils.emitEvent("testRunJavaScript004", 171340)
      Utils.registerEvent("testRunJavaScript004", 'null', 171380, done);
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
      Utils.emitEvent("testRunJavaScriptExt001", 171340)
      Utils.registerEvent("testRunJavaScriptExt001", '"This value is from indexJru.html"', 171390, done);
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
      Utils.emitEvent("testRunJavaScriptExt002", 171340)
      Utils.registerEvent("testRunJavaScriptExt002", true, 171400, done);
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
      Utils.emitEvent("testRunJavaScriptExt003", 171340)
      Utils.registerEvent("testRunJavaScriptExt003", '"This value is from indexJru.html"', 171410, done);
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
      Utils.emitEvent("testRunJavaScriptExt004", 171340)
      Utils.registerEvent("testRunJavaScriptExt004", true, 171420, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })
  })
}
