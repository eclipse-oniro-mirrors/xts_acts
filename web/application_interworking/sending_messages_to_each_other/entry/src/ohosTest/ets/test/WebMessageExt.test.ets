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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level, expect } from '@ohos/hypium';
import webview from '@ohos.web.webview'
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webMessageExt() {

  describe('webMessageExtTestSuite', () => {
    beforeAll(async (done: Function) => {
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
    * @tc.number     : SUB_WEB_WEBMESSAGEEXT_GETTYPE_0100
    * @tc.name       : testWebMessageExGetType001
    * @tc.desc       : test WebMessageExGetType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testWebMessageExGetType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetType001", 170010)
      Utils.registerEvent("testWebMessageExGetType001", 1, 170020, done);
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
    it('testWebMessageExGetType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetType002", 170010)
      Utils.registerEvent("testWebMessageExGetType002", 2, 170030, done);
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
    it('testWebMessageExGetType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetType003", 170010)
      Utils.registerEvent("testWebMessageExGetType003", 3, 170040, done);
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
    it('testWebMessageExGetType004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetType004", 170010)
      Utils.registerEvent("testWebMessageExGetType004", 4, 170050, done);
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
    it('testWebMessageExGetType005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetType005", 170010)
      Utils.registerEvent("testWebMessageExGetType005", 5, 170060, done);
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
    it('testWebMessageExGetType006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExGetType006", 170010)
      Utils.registerEvent("testWebMessageExGetType006", 6, 170070, done);
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
    it('testWebMessageExtWebMessageType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtWebMessageType001", 170010)
      Utils.registerEvent("testWebMessageExtWebMessageType001", 0, 170080, done);
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
    it('testWebMessageExtWebMessageType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtWebMessageType002", 170010)
      Utils.registerEvent("testWebMessageExtWebMessageType002", 1, 170090, done);
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
    it('testWebMessageExtWebMessageType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtWebMessageType003", 170010)
      Utils.registerEvent("testWebMessageExtWebMessageType003", 2, 170100, done);
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
    it('testWebMessageExtWebMessageType004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtWebMessageType004", 170010)
      Utils.registerEvent("testWebMessageExtWebMessageType004", 3, 170110, done);
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
    it('testWebMessageExtWebMessageType005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtWebMessageType005", 170010)
      Utils.registerEvent("testWebMessageExtWebMessageType005", 4, 170120, done);
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
    it('testWebMessageExtWebMessageType006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtWebMessageType006", 170010)
      Utils.registerEvent("testWebMessageExtWebMessageType006", 5, 170130, done);
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
    it('testWebMessageExtWebMessageType007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtWebMessageType007", 170010)
      Utils.registerEvent("testWebMessageExtWebMessageType007", 6, 170140, done);
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
    it('testWebMessageExtGetString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetString001", 170010)
      Utils.registerEvent("testWebMessageExtGetString001", 'hello', 170150, done);
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
    it('testWebMessageExtGetNumber001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetNumber001", 170010)
      Utils.registerEvent("testWebMessageExtGetNumber001", 1, 170160, done);
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
    it('testWebMessageExtGetBoolean001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetBoolean001", 170010)
      Utils.registerEvent("testWebMessageExtGetBoolean001", true, 170170, done);
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
    it('testWebMessageExtGetBoolean002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetBoolean002", 170010)
      Utils.registerEvent("testWebMessageExtGetBoolean002", false, 170180, done);
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
    it('testWebMessageExtGetArrayBuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetArrayBuffer001", 170010)
      Utils.registerEvent("testWebMessageExtGetArrayBuffer001", 'result getArrayBuffer byteLength:8', 170190, done);
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
    it('testWebMessageExtGetArray001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetArray001", 170010)
      Utils.registerEvent("testWebMessageExtGetArray001", 'apple', 170200, done);
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
    it('testWebMessageExtGetError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebMessageExtGetError001", 170010)
      Utils.registerEvent("testWebMessageExtGetError001", 'URIError: URI seq 0222', 170210, done);
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
    it('testWebMessageExtSetString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = "String:helloFromEts"
      Utils.emitEvent("testWebMessageExtSetString001", 170010)
      Utils.registerEvent("testWebMessageExtSetString001", JSON.stringify(result), 170220, done);
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
    it('testWebMessageExtSetNumber001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = "Number:1"
      Utils.emitEvent("testWebMessageExtSetNumber001", 170010)
      Utils.registerEvent("testWebMessageExtSetNumber001", JSON.stringify(result), 170230, done);
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
    it('testWebMessageExtSetBoolean001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = "Boolean:true"
      Utils.emitEvent("testWebMessageExtSetBoolean001", 170010)
      Utils.registerEvent("testWebMessageExtSetBoolean001", JSON.stringify(result), 170240, done);
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
    it('testWebMessageExtSetBoolean002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = "Boolean:false"
      Utils.emitEvent("testWebMessageExtSetBoolean002", 170010)
      Utils.registerEvent("testWebMessageExtSetBoolean002", JSON.stringify(result), 170250, done);
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
    it('testWebMessageExtSetArrayBuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = "ArrayBuffer:8"
      Utils.emitEvent("testWebMessageExtSetArrayBuffer001", 170010)
      Utils.registerEvent("testWebMessageExtSetArrayBuffer001", JSON.stringify(result), 170260, done);
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
    it('testWebMessageExtSetArray001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = "Array len:1, value:apple"
      Utils.emitEvent("testWebMessageExtSetArray001", 170010)
      Utils.registerEvent("testWebMessageExtSetArray001", JSON.stringify(result), 170270, done);
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
    it('testWebMessageExtSetError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = "Error:URIError, msg:URI seq"
      Utils.emitEvent("testWebMessageExtSetError001", 170010)
      Utils.registerEvent("testWebMessageExtSetError001", JSON.stringify(result), 170280, done);
      sendEventByKey('WebMessageExtButton', 10, '');
    })

    /*
     *@tc.number  : SUB_WEB_WEBMESSAGEEXT_GETARRAY_0200
     *@tc.name    : testWebMessageExtGetArrayReturnArrayLengthEqual0
     *@tc.desc    : test WebMessageExt getArray return  length 0
     *@tc.size    : MediumTest
     *@tc.type    : Function
     *@tc.level   : Level 2
     */
    it('testWebMessageExtGetArrayReturnArrayLengthEqual0', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebMessageExtGetArrayReturnArrayLengthEqual0 start')
        try {
            let webMessageExt:webview.WebMessageExt = new webview.WebMessageExt();
            webMessageExt.setType(webview.WebMessageType.ARRAY)
            console.log('[WebMessageExt] setType webview.WebMessageType.Array');
            console.log('[WebMessageExt] getArray length:' + webMessageExt.getArray().length);
            expect(webMessageExt.getArray().length).assertEqual(0)
        } catch(error) {
            console.error('testWebMessageExtGetArrayReturnArrayLengthEqual0 error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebMessageExtGetArrayReturnArrayLengthEqual0 end')
        done()
    })

   /*
     *@tc.number  : SUB_WEB_WEBMESSAGEEXT_GETARRAY_0300
     *@tc.name    : testWebMessageExtGetArrayReturnArrayLengthLarger0
     *@tc.desc    : test WebMessageExt getArray return  length larger 0
     *@tc.size    : MediumTest
     *@tc.type    : Function
     *@tc.level   : Level 2
     */
    it('testWebMessageExtGetArrayReturnArrayLengthLarger0', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebMessageExtGetArrayReturnArrayLengthLarger0 start')
        try {
            let webMessageExt:webview.WebMessageExt = new webview.WebMessageExt();
            webMessageExt.setType(webview.WebMessageType.ARRAY)
            console.log('[WebMessageExt] setType webview.WebMessageType.Array');
            webMessageExt.setArray(['apple', 'banana', 'cherry'])
            console.log('[WebMessageExt] getArray length:' + webMessageExt.getArray().length);
            expect(webMessageExt.getArray().length).assertLarger(0)
        } catch(error) {
            console.error('testWebMessageExtGetArrayReturnArrayLengthLarger0 error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebMessageExtGetArrayReturnArrayLengthLarger0 end')
        done()
    })

  })
}
