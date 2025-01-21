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

import { afterEach, beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';

export default function webMessageExtErrorCode() {

  describe('WebMessageExtErrorCodeTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/webMessageExtErrorCode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webMessageExtErrorCode state success " + JSON.stringify(pages));
        if (!("webMessageExtErrorCode" == pages.name)) {
          console.info("get webMessageExtErrorCode state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push webMessageExtErrorCode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webMessageExtErrorCode page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebMessageExtErrorCodeTestSuite afterEach start");
      await Utils.sleep(2000);
      console.info("WebMessageExtErrorCodeTestSuite afterEach end");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETSTRING_0100
    * @tc.name       : testWebMessageExtGetStringError001
    * @tc.desc       : test WebMessageExtGetString error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExtGetStringError001', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetStringError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtGetStringError001", '17100014', 20200, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETSTRING_0200
    * @tc.name       : testWebMessageExtGetStringError002
    * @tc.desc       : test WebMessageExtGetString error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExtGetStringError002', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetStringError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtGetStringError002", '17100014', 20201, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETSTRING_0300
    * @tc.name       : testWebMessageExtGetStringError003
    * @tc.desc       : test WebMessageExtGetString error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExtGetStringError003', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetStringError003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtGetStringError003", '17100014', 20202, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETSTRING_0400
    * @tc.name       : testWebMessageExtGetStringError004
    * @tc.desc       : test WebMessageExtGetString error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExtGetStringError004', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetStringError004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtGetStringError004", '17100014', 20203, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETSTRING_0500
    * @tc.name       : testWebMessageExtGetStringError005
    * @tc.desc       : test WebMessageExtGetString error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExtGetStringError005', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetStringError005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtGetStringError005", '17100014', 20204, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETNUMBER_0100
    * @tc.name       : testWebMessageExtGetNumberError001
    * @tc.desc       : test WebMessageExtGetNumber error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExtGetNumberError001', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetNumberError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtGetNumberError001", '17100014', 20210, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETNUMBER_0200
    * @tc.name       : testWebMessageExtGetNumberError002
    * @tc.desc       : test WebMessageExtGetNumber error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExtGetNumberError002', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetNumberError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtGetNumberError002", '17100014', 20211, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETNUMBER_0300
    * @tc.name       : testWebMessageExtGetNumberError003
    * @tc.desc       : test WebMessageExtGetNumber error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExtGetNumberError003', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetNumberError003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtGetNumberError003", '17100014', 20212, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETNUMBER_0400
    * @tc.name       : testWebMessageExtGetNumberError004
    * @tc.desc       : test WebMessageExtGetNumber error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExtGetNumberError004', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetNumberError004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtGetNumberError004", '17100014', 20213, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETNUMBER_0500
    * @tc.name       : testWebMessageExtGetNumberError005
    * @tc.desc       : test WebMessageExtGetNumber error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExtGetNumberError005', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetNumberError005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtGetNumberError005", '17100014', 20214, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETBOOLEAN_0100
    * @tc.name       : testWebMessageExtGetBooleanError001
    * @tc.desc       : test WebMessageExtGetNumber error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExtGetBooleanError001', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetBooleanError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtGetBooleanError001", '17100014', 20220, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETBOOLEAN_0200
    * @tc.name       : testWebMessageExtGetBooleanError002
    * @tc.desc       : test WebMessageExtGetNumber error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExtGetBooleanError002', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetBooleanError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtGetBooleanError002", '17100014', 20221, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETBOOLEAN_0300
    * @tc.name       : testWebMessageExtGetBooleanError003
    * @tc.desc       : test WebMessageExtGetNumber error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExtGetBooleanError003', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetBooleanError003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtGetBooleanError003", '17100014', 20222, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETBOOLEAN_0400
    * @tc.name       : testWebMessageExtGetBooleanError004
    * @tc.desc       : test WebMessageExtGetNumber error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExtGetBooleanError004', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetBooleanError004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtGetBooleanError004", '17100014', 20223, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETBOOLEAN_0500
    * @tc.name       : testWebMessageExtGetBooleanError005
    * @tc.desc       : test WebMessageExtGetNumber error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExtGetBooleanError005', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetBooleanError005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExtGetBooleanError005", '17100014', 20224, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETARRAYBUFFER_0100
    * @tc.name       : testWebMessageExGetArrayBufferError001
    * @tc.desc       : test WebMessageExGetArrayBuffer error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExGetArrayBufferError001', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetArrayBufferError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExGetArrayBufferError001", '17100014', 20230, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETARRAYBUFFER_0200
    * @tc.name       : testWebMessageExGetArrayBufferError002
    * @tc.desc       : test WebMessageExGetArrayBuffer error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExGetArrayBufferError002', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetArrayBufferError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExGetArrayBufferError002", '17100014', 20231, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETARRAYBUFFER_0300
    * @tc.name       : testWebMessageExGetArrayBufferError003
    * @tc.desc       : test WebMessageExGetArrayBuffer error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExGetArrayBufferError003', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetArrayBufferError003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExGetArrayBufferError003", '17100014', 20232, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETARRAYBUFFER_0400
    * @tc.name       : testWebMessageExGetArrayBufferError004
    * @tc.desc       : test WebMessageExGetArrayBuffer error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExGetArrayBufferError004', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetArrayBufferError004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExGetArrayBufferError004", '17100014', 20233, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETARRAYBUFFER_0500
    * @tc.name       : testWebMessageExGetArrayBufferError005
    * @tc.desc       : test WebMessageExGetArrayBuffer error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExGetArrayBufferError005', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetArrayBufferError005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExGetArrayBufferError005", '17100014', 20234, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETARRAY_0100
    * @tc.name       : testWebMessageExGetArrayError001
    * @tc.desc       : test WebMessageExGetArray error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExGetArrayError001', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetArrayError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExGetArrayError001", '17100014', 20240, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETARRAY_0200
    * @tc.name       : testWebMessageExGetArrayError002
    * @tc.desc       : test WebMessageExGetArray error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExGetArrayError002', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetArrayError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExGetArrayError002", '17100014', 20241, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETARRAY_0300
    * @tc.name       : testWebMessageExGetArrayError003
    * @tc.desc       : test WebMessageExGetArray error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExGetArrayError003', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetArrayError003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExGetArrayError003", '17100014', 20242, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETARRAY_0400
    * @tc.name       : testWebMessageExGetArrayError004
    * @tc.desc       : test WebMessageExGetArray error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExGetArrayError004', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetArrayError004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExGetArrayError004", '17100014', 20243, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETARRAY_0500
    * @tc.name       : testWebMessageExGetArrayError005
    * @tc.desc       : test WebMessageExGetArray error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExGetArrayError005', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetArrayError005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExGetArrayError005", '17100014', 20244, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })


    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETERROR_0100
    * @tc.name       : testWebMessageExGetErrorError001
    * @tc.desc       : test WebMessageExGetArray error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExGetErrorError001', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetErrorError001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExGetErrorError001", '17100014', 20250, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETERROR_0200
    * @tc.name       : testWebMessageExGetErrorError002
    * @tc.desc       : test WebMessageExGetArray error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExGetErrorError002', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetErrorError002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExGetErrorError002", '17100014', 20251, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETERROR_0300
    * @tc.name       : testWebMessageExGetErrorError003
    * @tc.desc       : test WebMessageExGetArray error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExGetErrorError003', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetErrorError003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExGetErrorError003", '17100014', 20252, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETERROR_0400
    * @tc.name       : testWebMessageExGetErrorError004
    * @tc.desc       : test WebMessageExGetArray error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExGetErrorError004', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetErrorError004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExGetErrorError004", '17100014', 20253, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_WEBMESSAGEEXT_GETERROR_0500
    * @tc.name       : testWebMessageExGetErrorError005
    * @tc.desc       : test WebMessageExGetArray error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebMessageExGetErrorError005', 0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetErrorError005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebMessageExGetErrorError005", '17100014', 20254, done);
      sendEventByKey('webMessageExtErrorCodeButton', 10, '');
    })

  })
}
