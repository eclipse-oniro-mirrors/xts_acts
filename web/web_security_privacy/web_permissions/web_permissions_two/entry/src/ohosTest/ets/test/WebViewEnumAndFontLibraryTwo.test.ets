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
          await Utils.sleep(2000);
          console.info("push WebViewEnumAndFontLibraryTwo page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewEnumAndFontLibraryTwo page error: " + err);
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
    * @tc.number     : SUB_WEB_PROTECTEDRESOURCETYPE_0100
    * @tc.name       : testProtectedResourceType001
    * @tc.desc       : test ProtectedResourceType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testProtectedResourceType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitProtectedResourceType", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testProtectedResourceType001", 'TYPE_VIDEO_CAPTURE,TYPE_AUDIO_CAPTURE', 1101, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_PERMISSIONREQUESTGETORIGIN_0100
    * @tc.name       : testPermissionRequestGetOrigin001
    * @tc.desc       : test PermissionRequestGetOrigin
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPermissionRequestGetOrigin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnPermissionRequestGetOrigin", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("PermissionRequestGetOrigin", 'resource://rawfile/', 1102, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_PERMISSIONREQUEST_0100
    * @tc.name       : testPermissionRequest001
    * @tc.desc       : test PermissionRequest
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testPermissionRequest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnPermissionRequest", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testPermissionRequest001", true, 1103, done);
      sendEventByKey('buttonEnumAndFontLibrary', 10, '');
    })
  })
}
