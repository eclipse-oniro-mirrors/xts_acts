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

export default function webMessageExt() {

  describe('webMessageExtTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/webMessageExt',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webMessageExt state success " + JSON.stringify(pages));
        if (!("webMessageExt" == pages.name)) {
          console.info("get webMessageExt state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webMessageExt page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webMessageExt page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("webMessageExt beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_GETTYPE_0100
    * @tc.name       : testWebMessageExGetType001
    * @tc.desc       : test WebMessageExGetType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExGetType001', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetType001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExGetType001", 1, 20260, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_GETTYPE_0200
    * @tc.name       : testWebMessageExGetType002
    * @tc.desc       : test WebMessageExGetType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExGetType002', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetType002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExGetType002", 2, 20261, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_GETTYPE_0300
    * @tc.name       : testWebMessageExGetType003
    * @tc.desc       : test WebMessageExGetType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExGetType003', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetType003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExGetType003", 3, 20262, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_GETTYPE_0400
    * @tc.name       : testWebMessageExGetType004
    * @tc.desc       : test WebMessageExGetType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExGetType004', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetType004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExGetType004", 4, 20263, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_GETTYPE_0500
    * @tc.name       : testWebMessageExGetType005
    * @tc.desc       : test WebMessageExGetType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExGetType005', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetType005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExGetType005", 5, 20264, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_GETTYPE_0600
    * @tc.name       : testWebMessageExGetType006
    * @tc.desc       : test WebMessageExGetType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExGetType006', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetType006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExGetType006", 6, 20265, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_WEBMESSAGETYPE_0100
    * @tc.name       : testWebMessageExtWebMessageType001
    * @tc.desc       : test WebMessageType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtWebMessageType001', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtWebMessageType001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtWebMessageType001", 0, 30000, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_WEBMESSAGETYPE_0200
    * @tc.name       : testWebMessageExtWebMessageType002
    * @tc.desc       : test WebMessageType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtWebMessageType002', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtWebMessageType002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtWebMessageType002", 1, 30001, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_WEBMESSAGETYPE_0300
    * @tc.name       : testWebMessageExtWebMessageType003
    * @tc.desc       : test WebMessageType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtWebMessageType003', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtWebMessageType003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtWebMessageType003", 2, 30002, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_WEBMESSAGETYPE_0400
    * @tc.name       : testWebMessageExtWebMessageType004
    * @tc.desc       : test WebMessageType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtWebMessageType004', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtWebMessageType004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtWebMessageType004", 3, 30003, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_WEBMESSAGETYPE_0500
    * @tc.name       : testWebMessageExtWebMessageType005
    * @tc.desc       : test WebMessageType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtWebMessageType005', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtWebMessageType005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtWebMessageType005", 4, 30004, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_WEBMESSAGETYPE_0600
    * @tc.name       : testWebMessageExtWebMessageType006
    * @tc.desc       : test WebMessageType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtWebMessageType006', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtWebMessageType006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtWebMessageType006", 5, 30005, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_WEBMESSAGETYPE_0700
    * @tc.name       : testWebMessageExtWebMessageType007
    * @tc.desc       : test WebMessageType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtWebMessageType007', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtWebMessageType007", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtWebMessageType007", 6, 30006, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_SETTYPE_0100
    * @tc.name       : testWebMessageExtSetType001
    * @tc.desc       : test WebMessageExtSetType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtSetType001', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetType001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtSetType001", '17100014', 36000, done);
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
    it('testWebMessageExtSetType002', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetType002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtSetType002", 1, 36001, done);
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
    it('testWebMessageExtSetType003', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetType003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtSetType003", 2, 36002, done);
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
    it('testWebMessageExtSetType004', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetType004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtSetType004", 3, 36003, done);
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
    it('testWebMessageExtSetType005', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetType005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtSetType005", 4, 36004, done);
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
    it('testWebMessageExtSetType006', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetType006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("`testWebMessageExtSetType006`", 5, 36005, done);
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
    it('testWebMessageExtSetType007', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtSetType007", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtSetType007", 6, 36006, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_GETSTRING_0100
    * @tc.name       : testWebMessageExtGetString001
    * @tc.desc       : test WebMessageExtGetString
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtGetString001', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetString001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtGetString001", 'hello', 100020, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_GETNUMBER_0100
    * @tc.name       : testWebMessageExtGetNumber001
    * @tc.desc       : test WebMessageExtGetNumber
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtGetNumber001', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetNumber001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtGetNumber001", 1, 100021, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_GETBOOLEAN_0100
    * @tc.name       : testWebMessageExtGetBoolean001
    * @tc.desc       : test WebMessageExtGetBoolean
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtGetBoolean001', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetBoolean001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtGetBoolean001", true, 100022, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_GETBOOLEAN_0200
    * @tc.name       : testWebMessageExtGetBoolean002
    * @tc.desc       : test WebMessageExtGetBoolean
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtGetBoolean002', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetBoolean002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtGetBoolean002", false, 100023, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_GETARRAYBUFFER_0100
    * @tc.name       : testWebMessageExtGetArrayBuffer001
    * @tc.desc       : test WebMessageExtGetArrayBuffer
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtGetArrayBuffer001', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetArrayBuffer001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtGetArrayBuffer001", 'result getArrayBuffer byteLength:8', 100024, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_GETARRAY_0100
    * @tc.name       : testWebMessageExtGetArray001
    * @tc.desc       : test WebMessageExtGetArray
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtGetArray001', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetArray001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtGetArray001", 'apple', 100025, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_GETERROR_0100
    * @tc.name       : testWebMessageExtGetError001
    * @tc.desc       : test WebMessageExtGetError
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtGetError001', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtGetError001", 'URIError: URI seq 0222', 100026, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_SETSTRING_0100
    * @tc.name       : testWebMessageExtSetString001
    * @tc.desc       : test WebMessageExtSetString
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtSetString001', 0, async (done: Function) => {
      let result = "String:helloFromEts"
      Utils.emitEvent("testWebMessageExtSetString001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtSetString001", JSON.stringify(result), 100027, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_SETNUMBER_0100
    * @tc.name       : testWebMessageExtSetNumber001
    * @tc.desc       : test WebMessageExtSetNumber
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtSetNumber001', 0, async (done: Function) => {
      let result = "Number:1"
      Utils.emitEvent("testWebMessageExtSetNumber001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtSetNumber001", JSON.stringify(result), 100028, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_SETBOOLEAN_0100
    * @tc.name       : testWebMessageExtSetBoolean001
    * @tc.desc       : test WebMessageExtSetBoolean
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtSetBoolean001', 0, async (done: Function) => {
      let result = "Boolean:true"
      Utils.emitEvent("testWebMessageExtSetBoolean001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtSetBoolean001", JSON.stringify(result), 100029, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_SETBOOLEAN_0200
    * @tc.name       : testWebMessageExtSetBoolean002
    * @tc.desc       : test WebMessageExtSetBoolean
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtSetBoolean002', 0, async (done: Function) => {
      let result = "Boolean:false"
      Utils.emitEvent("testWebMessageExtSetBoolean002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtSetBoolean002", JSON.stringify(result), 100030, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_SETARRAYBUFFER_0100
    * @tc.name       : testWebMessageExtSetArrayBuffer001
    * @tc.desc       : test WebMessageExtSetArrayBuffer
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtSetArrayBuffer001', 0, async (done: Function) => {
      let result = "ArrayBuffer:8"
      Utils.emitEvent("testWebMessageExtSetArrayBuffer001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtSetArrayBuffer001", JSON.stringify(result), 100031, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_SETARRAY_0100
    * @tc.name       : testWebMessageExtSetArray001
    * @tc.desc       : test WebMessageExtSetArray
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtSetArray001', 0, async (done: Function) => {
      let result = "Array len:1, value:apple"
      Utils.emitEvent("testWebMessageExtSetArray001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtSetArray001", JSON.stringify(result), 100032, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_SETERROR_0100
    * @tc.name       : testWebMessageExtSetError001
    * @tc.desc       : test WebMessageExtSetError
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebMessageExtSetError001', 0, async (done: Function) => {
      let result = "Error:URIError, msg:URI seq"
      Utils.emitEvent("testWebMessageExtSetError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtSetError001", JSON.stringify(result), 100033, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

  })
}
