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
        url: 'MainAbility/pages/WebViewEnumAndFontLibrary',
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
    * @tc.number     : SUB_WEB_DEFAULTFONTSIZE_0100
    * @tc.name       : testDefaultFontSize001
    * @tc.desc       : test defaultFontSize
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testDefaultFontSize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitDefaultFontSize", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDefaultFontSize001", '"13px"', 1202, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_DEFAULTFONTSIZE_0200
    * @tc.name       : testDefaultFontSize002
    * @tc.desc       : test defaultFontSize
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testDefaultFontSize002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitDefaultFontSizeMax", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDefaultFontSize002", '"72px"', 1203, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_DEFAULTFONTSIZE_0300
    * @tc.name       : testDefaultFontSize003
    * @tc.desc       : test defaultFontSize
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testDefaultFontSize003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitDefaultFontSizeMin", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDefaultFontSize003", '"13px"', 1204, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_MINFONTSIZE_0100
    * @tc.name       : testMinFontSize001
    * @tc.desc       : test minFontSize
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testMinFontSize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitMinFontSize", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testMinFontSize001", 18, 1205, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })
  })
}
