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
import { Driver, ON } from '@kit.TestKit';

const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function WebViewEnumAndFontLibraryTwo() {

  describe('WebViewEnumAndFontLibraryTwoTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewEnumAndFontLibraryTwo',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewEnumAndFontLibraryTwo state success " + JSON.stringify(pages));
        if (!("WebViewEnumAndFontLibraryTwo" == pages.name)) {
          console.info("get WebViewEnumAndFontLibraryTwo state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebViewEnumAndFontLibraryTwo page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewEnumAndFontLibraryTwo page error: " + err);
      }
      await driver.waitForComponent(ON.id("buttonEnumAndFontLibrary"), 10000);
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


    /**
     * @tc.name   testProtectedResourceType001
     * @tc.number SUB_WEB_PROTECTEDRESOURCETYPE_0100
     * @tc.desc   test ProtectedResourceType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testProtectedResourceType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitProtectedResourceType", 160890)
      Utils.registerEvent("testProtectedResourceType001", 'TYPE_VIDEO_CAPTURE,TYPE_AUDIO_CAPTURE', 160900, done);
      await Utils.waitAndClickComponent(driver, "buttonEnumAndFontLibrary");
    })

    /**
     * @tc.name   testPermissionRequestGetOrigin001
     * @tc.number SUB_WEB_PERMISSIONREQUESTGETORIGIN_0100
     * @tc.desc   test PermissionRequestGetOrigin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPermissionRequestGetOrigin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnPermissionRequestGetOrigin", 160890)
      Utils.registerEvent("PermissionRequestGetOrigin", 'resource://rawfile/', 160910, done);
      await Utils.waitAndClickComponent(driver, "buttonEnumAndFontLibrary");
    })

    /**
     * @tc.name   testPermissionRequest001
     * @tc.number SUB_WEB_PERMISSIONREQUEST_0100
     * @tc.desc   test PermissionRequest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPermissionRequest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnPermissionRequest", 160890)
      Utils.registerEvent("testPermissionRequest001", true, 160920, done);
      await Utils.waitAndClickComponent(driver, "buttonEnumAndFontLibrary");
    })
  })
}
