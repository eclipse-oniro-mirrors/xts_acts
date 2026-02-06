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
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 183101;
const driver = Driver.create();

export default function webViewController() {

  describe('WebViewControllerTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewController',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewController state success " + JSON.stringify(pages));
        if (!("webViewController" == pages.name)) {
          console.info("get webViewController state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webViewController page success " + JSON.stringify(result));
          await driver.waitForComponent(ON.id("WebViewControllerButton"), 10000)
        }
      } catch (err) {
        console.error("push webViewController page error: " + err);
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


    /*
    * @tc.number     : SUB_WEB_ONSHOWFILESELECTOR_0100
    * @tc.name       : testOnShowFileSelector001
    * @tc.desc       : test onShowFileSelector
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnShowFileSelector001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testOnShowFileSelector001", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testOnShowFileSelector001", true, 183110, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerButton","testOnShowFileSelector001");
    })

    /*
    * @tc.number     : SUB_WEB_FILESELECTORPARAM_GETTITLE_0100
    * @tc.name       : testFileSelectorParamGetTitle001
    * @tc.desc       : test FileSelectorParam getTitle
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFileSelectorParamGetTitle001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFileSelectorParamGetTitle001", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testFileSelectorParamGetTitle001", 'open file', 183120, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerButton","testFileSelectorParamGetTitle001");
    })

    /*
    * @tc.number     : SUB_WEB_FILESELECTORPARAM_GETMODE_0100
    * @tc.name       : testFileSelectorParamGetMode001
    * @tc.desc       : test FileSelectorParam getMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFileSelectorParamGetMode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFileSelectorParamGetMode001", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testFileSelectorParamGetMode001", 0, 183130, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerButton","testFileSelectorParamGetMode001");
    })

    /*
    * @tc.number     : SUB_WEB_FILESELECTORPARAM_GETACCEPTTYPE_0100
    * @tc.name       : testFileSelectorParamGetAcceptType001
    * @tc.desc       : test FileSelectorParam getAcceptType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFileSelectorParamGetAcceptType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFileSelectorParamGetAcceptType001", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testFileSelectorParamGetAcceptType001", '.json', 183140, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerButton","testFileSelectorParamGetAcceptType001");
    })

    /*
   * @tc.number     : SUB_WEB_FILESELECTORPARAM_ISCAPTURE_0100
   * @tc.name       : testFileSelectorParamIsCapture001
   * @tc.desc       : test FileSelectorParam isCapture
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 1
   */
    it('testFileSelectorParamIsCapture001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFileSelectorParamIsCapture001", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testFileSelectorParamIsCapture001", false, 183150, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerButton","testFileSelectorParamIsCapture001");
    })

    /*
    * @tc.number     : SUB_WEB_FILESELECTORRESULT_HANDLEFILELIST_0100
    * @tc.name       : testFileSelectorResultHandleFileList001
    * @tc.desc       : test FileSelectorResult handleFileList
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFileSelectorResultHandleFileList001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFileSelectorResultHandleFileList001", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testFileSelectorResultHandleFileList001", "\"1.json\"", 183160, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerButton","testFileSelectorResultHandleFileList001");
    })

  })
}
