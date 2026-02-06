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
import { waitForComponent } from './WaitTest';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function webMessageExt() {

  describe('webMessageExtTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webMessageExt',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webMessageExt state success " + JSON.stringify(pages));
        if (!("webMessageExt" == pages.name)) {
          console.info("get webMessageExt state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          console.info("push webMessageExt page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webMessageExt page error: " + err);
      }
      await waitForComponent("WebMessageExtButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webMessageExt beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_SETTYPE_0100
    * @tc.name       : testWebMessageExtSetType001
    * @tc.desc       : test WebMessageExtSetType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtSetType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetType001", 119930)
      Utils.registerEvent("testWebMessageExtSetType001", '17100014', 119940, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_SETTYPE_0200
    * @tc.name       : testWebMessageExtSetType002
    * @tc.desc       : test WebMessageExtSetType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtSetType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetType002", 119930)
      Utils.registerEvent("testWebMessageExtSetType002", 1, 119950, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_SETTYPE_0300
    * @tc.name       : testWebMessageExtSetType003
    * @tc.desc       : test WebMessageExtSetType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtSetType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetType003", 119930)
      Utils.registerEvent("testWebMessageExtSetType003", 2, 119960, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_SETTYPE_0400
    * @tc.name       : testWebMessageExtSetType004
    * @tc.desc       : test WebMessageExtSetType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtSetType004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetType004", 119930)
      Utils.registerEvent("testWebMessageExtSetType004", 3, 119970, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_SETTYPE_0500
    * @tc.name       : testWebMessageExtSetType005
    * @tc.desc       : test WebMessageExtSetType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtSetType005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetType005", 119930)
      Utils.registerEvent("testWebMessageExtSetType005", 4, 119980, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_SETTYPE_0600
    * @tc.name       : testWebMessageExtSetType006
    * @tc.desc       : test WebMessageExtSetType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtSetType006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetType006", 119930)
      Utils.registerEvent("`testWebMessageExtSetType006`", 5, 119990, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_SETTYPE_0700
    * @tc.name       : testWebMessageExtSetType007
    * @tc.desc       : test WebMessageExtSetType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtSetType007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetType007", 119930)
      Utils.registerEvent("testWebMessageExtSetType007", 6, 120000, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })
  })
}
