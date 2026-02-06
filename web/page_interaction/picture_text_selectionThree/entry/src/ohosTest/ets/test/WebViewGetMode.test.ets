/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import Utils from './Utils.test';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
import { waitForExist} from './WaitTest.test';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 183122;
const driver = Driver.create();

export default function WebViewGetMode() {

  describe('WebViewGetModeTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewGetMode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewGetMode state success " + JSON.stringify(pages));
        if (!("WebViewGetMode" == pages.name)) {
          console.info("get WebViewGetMode state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebViewGetMode page success " + JSON.stringify(result));
          await driver.waitForComponent(ON.id("WebViewGetModeButton"), 10000)
        }
      } catch (err) {
        console.error("push WebViewGetMode page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewController beforeEach start");
      done();
    })


    /**
     * @tc.name   testWebViewGetMode01
     * @tc.number SUB_WEB_WEBVIEWGETMODE_0100
     * @tc.desc   test onShowFileSelector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewGetMode01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebViewGetMode01", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testWebViewGetMode01", FileSelectorMode.FileOpenMode, 20251121, done);
      await Utils.waitAndClickComponent(driver, "WebViewGetModeButton","testWebViewGetMode01");
    })

    /**
     * @tc.name   testWebViewGetMode02
     * @tc.number SUB_WEB_WEBVIEWGETMODE_0200
     * @tc.desc   test onShowFileSelector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewGetMode02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebViewGetMode02", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testWebViewGetMode02", FileSelectorMode.FileOpenMultipleMode, 20251122, done);
      await Utils.waitAndClickComponent(driver, "WebViewGetModeButton","testWebViewGetMode02");
    })

    /**
     * @tc.name   testWebViewGetMode03
     * @tc.number SUB_WEB_WEBVIEWGETMODE_0300
     * @tc.desc   test onShowFileSelector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewGetMode03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebViewGetMode03", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testWebViewGetMode03", FileSelectorMode.FileOpenFolderMode, 20251123, done);
      await Utils.waitAndClickComponent(driver, "WebViewGetModeButton","testWebViewGetMode03");
    })



    /**
     * @tc.name   testWebViewGetMode04
     * @tc.number SUB_WEB_WEBVIEWGETMODE_0400
     * @tc.desc   test onShowFileSelector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewGetMode04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebViewGetMode04", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testWebViewGetMode04", FileSelectorMode.FileSaveMode, 20251124, done);
      await Utils.waitAndClickComponent(driver, "WebViewGetModeButton","testWebViewGetMode04");
    })



  })
}
