/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import { describe, beforeEach, afterEach, it, expect, beforeAll , TestType, Size, Level } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from "@kit.TestKit";

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "emitHasImagePm";
// import router from '@system.router';

const EVENT_ID_SET_SUITE_KEY = 183501;
const driver = Driver.create();

export default function webViewHasImageJsunit() {
  describe('ActsAcewebViewHasImageJsunitTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: "testability/pages/webViewHasImageJsunit"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewHasImage state success " + JSON.stringify(pages));
        if (!("webViewHasImage" == pages.name)) {
          console.info("get webViewHasImage state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push webViewHasImage page success " + JSON.stringify(result));
          await driver.waitForComponent(ON.id("webImagecomponent"), 10000);
        }
      } catch (err) {
        console.error("push webViewHasImage page error: " + err);
      }
      done()
    });
    beforeEach(async  (done: Function) =>{
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })
    /**
     * @tc.name   testHasImagePm
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTHASIMAGE_0100
     * @tc.desc   There are offline images in the H5 page that are loaded using the img tag, and the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasImagePm',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("emitHasImagePm", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testHasImagePm", true, 183510, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webImagecomponent", "testHasImagePm");
      await Utils.waitForExist(() => isReturn, "emitHasImagePm" + '_returnCheck', true, 500);
      done();

    })
    /**
     * @tc.name   testHasImagePmSvg
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTHASIMAGE_0200
     * @tc.desc   There is no image loaded using the img tag in the H5 page, only svg, and the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasImagePmSvg',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("emitHasImagePmSvg", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testHasImageSvg", false, 183520, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webImagecomponent", "testHasImagePmSvg");
      await Utils.waitForExist(() => isReturn, "emitHasImagePmSvg" + '_returnCheck', true, 500);
      done();

    })
    /**
     * @tc.name   testHasImagePmOnline
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTHASIMAGE_0300
     * @tc.desc   The H5 page has an online web page loaded using the img tag, and the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasImagePmOnline',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("emitHasImagePmOnline", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testHasImagePmOnline", false, 183530, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webImagecomponent", "testHasImagePmOnline");
      await Utils.waitForExist(() => isReturn, "emitHasImagePmOnline" + '_returnCheck', true, 500);
      done();
    })
    /**
     * @tc.name   testHasImageCb
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTHASIMAGE_0400
     * @tc.desc   There are offline images in the H5 page that are loaded using the img tag, and the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasImageCb',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("emitHasImageCb", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testHasImageCb", true, 183540, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webImagecomponent", "testHasImagePmOnline");
      await Utils.waitForExist(() => isReturn, "emitHasImageCb" + '_returnCheck', true, 500);
      done();
    })
    /**
     * @tc.name   testHasImageCbSvg
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTHASIMAGE_0500
     * @tc.desc   There is no image loaded using the img tag in the H5 page, only svg, and the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasImageCbSvg',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("emitHasImageCbSvg", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testHasImageCbSvg", false, 183550, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webImagecomponent", "testHasImageCbSvg");
      await Utils.waitForExist(() => isReturn, "emitHasImageCbSvg" + '_returnCheck', true, 500);
      done();
    })
    /**
     * @tc.name   testHasImageCbOnline
     * @tc.number SUB_ACE_BASIC_ETS_API_TESTHASIMAGE_0600
     * @tc.desc   The H5 page has an online web page loaded using the img tag, and the interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasImageCbOnline',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("emitHasImageCbOnline", EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("testHasImageCbOnline", false, 183560, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webImagecomponent", "testHasImageCbSvg");
      await Utils.waitForExist(() => isReturn, "emitHasImageCbOnline" + '_returnCheck', true, 500);
      done();
    })
  })
}
