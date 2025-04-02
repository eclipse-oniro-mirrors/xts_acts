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

import { beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';

export default function jsMessageExt() {

  describe('JsMessageExtTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/jsMessageExt',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get jsMessageExt state success " + JSON.stringify(pages));
        if (!("jsMessageExt" == pages.name)) {
          console.info("get jsMessageExt state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push jsMessageExt page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push jsMessageExt page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
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
    it('testJsMessageExtGetType001', 0, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetType001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetType001", 1, 30200, done);
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
    it('testJsMessageExtGetType002', 0, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetType002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetType002", 2, 30201, done);
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
    it('testJsMessageExtGetType003', 0, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetType003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetType003", 3, 30202, done);
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
    it('testJsMessageExtGetType004', 0, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetType004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetType004", 4, 30203, done);
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
    it('testJsMessageExtGetType005', 0, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetType005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetType005", 5, 30204, done);
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
    it('testJsMessageExtJsMessageType001', 0, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtJsMessageType001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtJsMessageType001", 0, 30205, done);
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
    it('testJsMessageExtJsMessageType002', 0, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtJsMessageType002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtJsMessageType002", 1, 30206, done);
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
    it('testJsMessageExtJsMessageType003', 0, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtJsMessageType003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtJsMessageType003", 2, 30207, done);
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
    it('testJsMessageExtJsMessageType004', 0, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtJsMessageType004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtJsMessageType004", 3, 30208, done);
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
    it('testJsMessageExtJsMessageType005', 0, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtJsMessageType005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtJsMessageType005", 4, 30209, done);
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
    it('testJsMessageExtJsMessageType006', 0, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtJsMessageType006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtJsMessageType006", 5, 30210, done);
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
    it('testJsMessageExtGetString001', 0, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetString001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetString001", '"hello, world"', 100013, done);
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
    it('testJsMessageExtGetNumber001', 0, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetNumber001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetNumber001", 1, 100014, done);
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
    it('testJsMessageExtGetBoolean001', 0, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetBoolean001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetBoolean001", true, 100015, done);
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
    it('testJsMessageExtGetBoolean002', 0, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetBoolean002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetBoolean002", false, 100016, done);
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
    it('testJsMessageExtGetArrayBuffer001', 0, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetArrayBuffer001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetArrayBuffer001", 'result type:object', 100017, done);
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
    it('testJsMessageExtGetArray001', 0, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetArray001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetArray001", true, 100018, done);
      sendEventByKey('JsMessageExtButton', 10, '');
    })
  })
}
