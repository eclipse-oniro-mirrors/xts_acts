/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, afterEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function jsMessageExtErrorCode() {

  describe('JsMessageExtErrorCodeTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/jsMessageExtErrorCode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get jsMessageExtErrorCode state success " + JSON.stringify(pages));
        if (!("jsMessageExtErrorCode" == pages.name)) {
          console.info("get jsMessageExtErrorCode state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push jsMessageExtErrorCode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push jsMessageExtErrorCode page error: " + err);
      }
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

    afterEach(async (done: Function) => {
      console.info("JsMessageExtErrorCodeTestSuite afterEach start");
      await Utils.sleep(2000);
      console.info("JsMessageExtErrorCodeTestSuite afterEach end");
      done();
    })

    /*
     * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETSTRING_0100
     * @tc.name       : testJsMessageExtGetStringError001
     * @tc.desc       : test JsMessageExtGetString error
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testJsMessageExtGetStringError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetStringError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetStringError001", '17100014', 30400, done);
      sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETSTRING_0200
    * @tc.name       : testJsMessageExtGetStringError002
    * @tc.desc       : test JsMessageExtGetString error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testJsMessageExtGetStringError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetStringError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetStringError002", '17100014', 30401, done);
      sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETSTRING_0300
    * @tc.name       : testJsMessageExtGetStringError003
    * @tc.desc       : test JsMessageExtGetString error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testJsMessageExtGetStringError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetStringError003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetStringError003", '17100014', 30402, done);
      sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETSTRING_0400
    * @tc.name       : testJsMessageExtGetStringError004
    * @tc.desc       : test JsMessageExtGetString error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testJsMessageExtGetStringError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetStringError004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetStringError004", '17100014', 30403, done);
      sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETNUMBER_0100
    * @tc.name       : testJsMessageExtGetNumberError001
    * @tc.desc       : test JsMessageExtGetString error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testJsMessageExtGetNumberError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetNumberError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetNumberError001", '17100014', 30410, done);
      sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETNUMBER_0200
    * @tc.name       : testJsMessageExtGetNumberError002
    * @tc.desc       : test JsMessageExtGetString error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testJsMessageExtGetNumberError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetNumberError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetNumberError002", '17100014', 30411, done);
      sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETNUMBER_0300
    * @tc.name       : testJsMessageExtGetNumberError003
    * @tc.desc       : test JsMessageExtGetString error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testJsMessageExtGetNumberError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetNumberError003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetNumberError003", '17100014', 30412, done);
      sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETNUMBER_0400
    * @tc.name       : testJsMessageExtGetNumberError004
    * @tc.desc       : test JsMessageExtGetString error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testJsMessageExtGetNumberError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetNumberError004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetNumberError004", '17100014', 30413, done);
      sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETBOOLEAN_0100
    * @tc.name       : testJsMessageExtGetBooleanError001
    * @tc.desc       : test JsMessageExtGetBoolean error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testJsMessageExtGetBooleanError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetBooleanError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetBooleanError001", '17100014', 30420, done);
      sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETBOOLEAN_0200
    * @tc.name       : testJsMessageExtGetBooleanError002
    * @tc.desc       : test JsMessageExtGetBoolean error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testJsMessageExtGetBooleanError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetBooleanError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetBooleanError002", '17100014', 30421, done);
      sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETBOOLEAN_0300
    * @tc.name       : testJsMessageExtGetBooleanError003
    * @tc.desc       : test JsMessageExtGetBoolean error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testJsMessageExtGetBooleanError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetBooleanError003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetBooleanError003", '17100014', 30422, done);
      sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETBOOLEAN_0400
    * @tc.name       : testJsMessageExtGetBooleanError004
    * @tc.desc       : test JsMessageExtGetBoolean error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testJsMessageExtGetBooleanError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetBooleanError004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetBooleanError004", '17100014', 30423, done);
      sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETARRAYBUFFER_0100
    * @tc.name       : testJsMessageExtGetArrayBufferError001
    * @tc.desc       : test JsMessageExtGetArrayBuffer error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testJsMessageExtGetArrayBufferError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetArrayBufferError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetArrayBufferError001", '17100014', 30430, done);
      sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETARRAYBUFFER_0200
    * @tc.name       : testJsMessageExtGetArrayBufferError002
    * @tc.desc       : test JsMessageExtGetArrayBuffer error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testJsMessageExtGetArrayBufferError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetArrayBufferError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetArrayBufferError002", '17100014', 30431, done);
      sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETARRAYBUFFER_0300
    * @tc.name       : testJsMessageExtGetArrayBufferError003
    * @tc.desc       : test JsMessageExtGetArrayBuffer error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testJsMessageExtGetArrayBufferError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetArrayBufferError003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetArrayBufferError003", '17100014', 30432, done);
      sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETARRAYBUFFER_0400
    * @tc.name       : testJsMessageExtGetArrayBufferError004
    * @tc.desc       : test JsMessageExtGetArrayBuffer error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testJsMessageExtGetArrayBufferError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetArrayBufferError004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetArrayBufferError004", '17100014', 30433, done);
      sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETARRAY_0100
    * @tc.name       : testJsMessageExtGetArrayError001
    * @tc.desc       : test JsMessageExtGetArray error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testJsMessageExtGetArrayError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetArrayError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetArrayError001", '17100014', 30440, done);
      sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETARRAY_0200
    * @tc.name       : testJsMessageExtGetArrayError002
    * @tc.desc       : test JsMessageExtGetArray error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testJsMessageExtGetArrayError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetArrayError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetArrayError002", '17100014', 30441, done);
      sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETARRAY_0300
    * @tc.name       : testJsMessageExtGetArrayError003
    * @tc.desc       : test JsMessageExtGetArray error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testJsMessageExtGetArrayError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetArrayError003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetArrayError003", '17100014', 30442, done);
      sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETARRAY_0400
    * @tc.name       : testJsMessageExtGetArrayError004
    * @tc.desc       : test JsMessageExtGetArray error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testJsMessageExtGetArrayError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testJsMessageExtGetArrayError004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsMessageExtGetArrayError004", '17100014', 30443, done);
      sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
    })

  })
}
