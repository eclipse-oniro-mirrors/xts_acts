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

const EVENT_ID_SET_SUITE_KEY = 183112;
const driver = Driver.create();

export default function WebViewContextMenuMediaType() {

  describe('WebViewContextMenuMediaTypeTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewContextMenuMediaType',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewContextMenuMediaType state success " + JSON.stringify(pages));
        if (!("WebViewContextMenuMediaType" == pages.name)) {
          console.info("get WebViewContextMenuMediaType state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000)
          console.info("push WebViewContextMenuMediaType page success " + JSON.stringify(result));
          await driver.waitForComponent(ON.id("WebViewgContextMenuMediaTypeButton"), 10000)
        }
      } catch (err) {
        console.error("push WebViewContextMenuMediaType page error: " + err);
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
     * @tc.name   testContextMenuMediaTypeVideo
     * @tc.number SUB_WEB_GETCONTEXTMENUMEDIATYPE_0100
     * @tc.desc   test getContextMenuMediaType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testContextMenuMediaTypeVideo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitContextMenuMediaTypeVideo", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testContextMenuMediaTypeVideo",  ContextMenuDataMediaType.VIDEO, 20251103,  () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewgContextMenuMediaTypeButton", "testContextMenuMediaTypeVideo");
      await Utils.waitForExist(() => isReturn, "emitContextMenuMediaTypeVideo" + '_returnCheck', true, 500);
      done();
    })


    /**
     * @tc.name   testContextMenuMediaTypeText
     * @tc.number testContextMenuMediaTypeText
     * @tc.desc   testContextMenuMediaTypeText
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testContextMenuMediaTypeText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitContextMenuMediaTypeText", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testContextMenuMediaTypeText",  ContextMenuDataMediaType.NONE, 20251104,  () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewgContextMenuMediaTypeButton", "testContextMenuMediaTypeText");
      await Utils.waitForExist(() => isReturn, "emitContextMenuMediaTypeText" + '_returnCheck', true, 500);
      done();
    })


    /**
     * @tc.name   testContextMenuMediaTypeImage
     * @tc.number testContextMenuMediaTypeImage
     * @tc.desc   testContextMenuMediaTypeImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testContextMenuMediaTypeImage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitContextMenuMediaTypeImage", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testContextMenuMediaTypeImage",  ContextMenuDataMediaType.IMAGE, 20251105,  () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewgContextMenuMediaTypeButton", "testContextMenuMediaTypeImage");
      await Utils.waitForExist(() => isReturn, "emitContextMenuMediaTypeImage" + '_returnCheck', true, 500);
      done();
    })


    /**
     * @tc.name   testContextMenuMediaTypeAudio
     * @tc.number testContextMenuMediaTypeAudio
     * @tc.desc   testContextMenuMediaTypeAudio
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testContextMenuMediaTypeAudio', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitContextMenuMediaTypeAudio", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testContextMenuMediaTypeAudio",  ContextMenuDataMediaType.AUDIO, 20251106,  () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewgContextMenuMediaTypeButton", "testContextMenuMediaTypeAudio");
      await Utils.waitForExist(() => isReturn, "emitContextMenuMediaTypeAudio" + '_returnCheck', true, 500);
      done();
    })


    /**
     * @tc.name   testContextMenuMediaTypeCanvas
     * @tc.number testContextMenuMediaTypeCanvas
     * @tc.desc   testContextMenuMediaTypeCanvas
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testContextMenuMediaTypeCanvas', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitContextMenuMediaTypeCanvas", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testContextMenuMediaTypeCanvas",  ContextMenuDataMediaType.CANVAS , 20251107,  () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebViewgContextMenuMediaTypeButton", "testContextMenuMediaTypeCanvas");
      await Utils.waitForExist(() => isReturn, "emitContextMenuMediaTypeCanvas" + '_returnCheck', true, 500);
      done();
    })
  })
}
