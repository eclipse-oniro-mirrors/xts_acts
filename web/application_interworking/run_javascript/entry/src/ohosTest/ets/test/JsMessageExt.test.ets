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
import { waitForComponent } from './WaitTest.test';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function jsMessageExt() {

  describe('JsMessageExtTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/jsMessageExt',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get jsMessageExt state success " + JSON.stringify(pages));
        if (!("jsMessageExt" == pages.name)) {
          console.info("get jsMessageExt state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push jsMessageExt page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push jsMessageExt page error: " + err);
      }
      await waitForComponent("JsMessageExtButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("jsMessageExt beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_JSMESSAGEEXT_GETTYPE_0100
    * @tc.name       : testJsMessageExtGetType001
    * @tc.desc       : test JsMessageExtGetType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testJsMessageExtGetType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetType001", 171010)
      Utils.registerEvent("testJsMessageExtGetType001", 1, 171020, done);
      sendEventByKey('JsMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_JSMESSAGEEXT_GETTYPE_0200
    * @tc.name       : testJsMessageExtGetType002
    * @tc.desc       : test JsMessageExtGetType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testJsMessageExtGetType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetType002", 171010)
      Utils.registerEvent("testJsMessageExtGetType002", 2, 171030, done);
      sendEventByKey('JsMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_JSMESSAGEEXT_GETTYPE_0300
    * @tc.name       : testJsMessageExtGetType003
    * @tc.desc       : test JsMessageExtGetType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testJsMessageExtGetType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetType003", 171010)
      Utils.registerEvent("testJsMessageExtGetType003", 3, 171040, done);
      sendEventByKey('JsMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_JSMESSAGEEXT_GETTYPE_0400
    * @tc.name       : testJsMessageExtGetType004
    * @tc.desc       : test JsMessageExtGetType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testJsMessageExtGetType004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetType004", 171010)
      Utils.registerEvent("testJsMessageExtGetType004", 4, 171050, done);
      sendEventByKey('JsMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_JSMESSAGEEXT_GETTYPE_0500
    * @tc.name       : testJsMessageExtGetType005
    * @tc.desc       : test JsMessageExtGetType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testJsMessageExtGetType005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetType005", 171010)
      Utils.registerEvent("testJsMessageExtGetType005", 5, 171060, done);
      sendEventByKey('JsMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_JSMESSAGEEXT_JSMESSAGETYPE_0100
    * @tc.name       : testJsMessageExtJsMessageType001
    * @tc.desc       : test JsMessageType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testJsMessageExtJsMessageType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtJsMessageType001", 171010)
      Utils.registerEvent("testJsMessageExtJsMessageType001", 0, 171070, done);
      sendEventByKey('JsMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_JSMESSAGEEXT_JSMESSAGETYPE_0200
    * @tc.name       : testJsMessageExtJsMessageType002
    * @tc.desc       : test JsMessageType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testJsMessageExtJsMessageType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtJsMessageType002", 171010)
      Utils.registerEvent("testJsMessageExtJsMessageType002", 1, 171080, done);
      sendEventByKey('JsMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_JSMESSAGEEXT_JSMESSAGETYPE_0300
    * @tc.name       : testJsMessageExtJsMessageType003
    * @tc.desc       : test JsMessageType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testJsMessageExtJsMessageType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtJsMessageType003", 171010)
      Utils.registerEvent("testJsMessageExtJsMessageType003", 2, 171090, done);
      sendEventByKey('JsMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_JSMESSAGEEXT_JSMESSAGETYPE_0400
    * @tc.name       : testJsMessageExtJsMessageType004
    * @tc.desc       : test JsMessageType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testJsMessageExtJsMessageType004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtJsMessageType004", 171010)
      Utils.registerEvent("testJsMessageExtJsMessageType004", 3, 171100, done);
      sendEventByKey('JsMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_JSMESSAGEEXT_JSMESSAGETYPE_0500
    * @tc.name       : testJsMessageExtJsMessageType005
    * @tc.desc       : test JsMessageType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testJsMessageExtJsMessageType005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtJsMessageType005", 171010)
      Utils.registerEvent("testJsMessageExtJsMessageType005", 4, 171110, done);
      sendEventByKey('JsMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_JSMESSAGEEXT_JSMESSAGETYPE_0600
    * @tc.name       : testJsMessageExtJsMessageType006
    * @tc.desc       : test JsMessageType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testJsMessageExtJsMessageType006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtJsMessageType006", 171010)
      Utils.registerEvent("testJsMessageExtJsMessageType006", 5, 171120, done);
      sendEventByKey('JsMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_JSMESSAGEEXT_GETSTRING_0100
    * @tc.name       : testJsMessageExtGetString001
    * @tc.desc       : test JsMessageExtGetString
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testJsMessageExtGetString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetString001", 171010)
      Utils.registerEvent("testJsMessageExtGetString001", '"hello, world"', 171130, done);
      sendEventByKey('JsMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_JSMESSAGEEXT_GETNUMBER_0100
    * @tc.name       : testJsMessageExtGetNumber001
    * @tc.desc       : test JsMessageExtGetNumber
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testJsMessageExtGetNumber001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetNumber001", 171010)
      Utils.registerEvent("testJsMessageExtGetNumber001", 1, 171140, done);
      sendEventByKey('JsMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_JSMESSAGEEXT_GETBOOLEAN_0100
    * @tc.name       : testJsMessageExtGetBoolean001
    * @tc.desc       : test JsMessageExtGetBoolean
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testJsMessageExtGetBoolean001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetBoolean001", 171010)
      Utils.registerEvent("testJsMessageExtGetBoolean001", true, 171150, done);
      sendEventByKey('JsMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_JSMESSAGEEXT_GETBOOLEAN_0200
    * @tc.name       : testJsMessageExtGetBoolean002
    * @tc.desc       : test JsMessageExtGetBoolean
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testJsMessageExtGetBoolean002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetBoolean002", 171010)
      Utils.registerEvent("testJsMessageExtGetBoolean002", false, 171160, done);
      sendEventByKey('JsMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_JSMESSAGEEXT_GETARRAYBUFFER_0100
    * @tc.name       : testJsMessageExtGetArrayBuffer001
    * @tc.desc       : test JsMessageExtGetArrayBuffer
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testJsMessageExtGetArrayBuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetArrayBuffer001", 171010)
      Utils.registerEvent("testJsMessageExtGetArrayBuffer001", 'result type:object', 171170, done);
      sendEventByKey('JsMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_JSMESSAGEEXT_GETARRAY_0100
    * @tc.name       : testJsMessageExtGetArray001
    * @tc.desc       : test JsMessageExtGetArray
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testJsMessageExtGetArray001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetArray001", 171010)
      Utils.registerEvent("testJsMessageExtGetArray001", true, 171180, done);
      sendEventByKey('JsMessageExtButton', 10, '');
    })
  })
}
