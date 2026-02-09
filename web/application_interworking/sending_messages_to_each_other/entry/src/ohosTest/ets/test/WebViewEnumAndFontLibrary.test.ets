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
import { waitForComponent } from './WaitTest';
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
      console.log("waitForComponent buttonEnumAndFontLibrary");
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

    // afterEach(async (done: Function) => {
    //   console.info("WebViewControllerDownloadTest afterEach start");
    //   //await Utils.sleep(2000);
    //   console.info("WebViewControllerDownloadTest afterEach end");
    //   done();
    // })

    /**
     * @tc.name   testMessageLevel001
     * @tc.number SUB_WEB_MESSAGELEVEL_0100
     * @tc.desc   test MessageLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMessageLevel001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitMessageLevelDebug", 170400)
      Utils.registerEvent("testMessageLevel001", '1', 170410, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /**
     * @tc.name   testMessageLevel002
     * @tc.number SUB_WEB_MESSAGELEVEL_0200
     * @tc.desc   test MessageLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMessageLevel002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitMessageLevelInfo", 170400)
      Utils.registerEvent("testMessageLevel002", '2', 170420, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /**
     * @tc.name   testMessageLevel003
     * @tc.number SUB_WEB_MESSAGELEVEL_0300
     * @tc.desc   test MessageLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMessageLevel003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitMessageLevelWarn", 170400)
      Utils.registerEvent("testMessageLevel003", '3', 170430, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /**
     * @tc.name   testMessageLevel004
     * @tc.number SUB_WEB_MESSAGELEVEL_0400
     * @tc.desc   test MessageLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMessageLevel004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitMessageLevelError", 170400)
      Utils.registerEvent("testMessageLevel004", '4', 170440, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /**
     * @tc.name   testMessageLevel005
     * @tc.number SUB_WEB_MESSAGELEVEL_0500
     * @tc.desc   test MessageLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMessageLevel005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitMessageLevelLog", 170400)
      Utils.registerEvent("testMessageLevel005", '2', 170450, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })
  })
}
