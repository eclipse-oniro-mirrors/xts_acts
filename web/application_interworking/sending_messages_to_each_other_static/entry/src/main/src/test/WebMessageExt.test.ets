/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Utils.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';


let testAbilityContext:common.UIAbilityContext;

export default function webMessageExt() {

  describe('webMessageExtTestSuite', ():void => {
    beforeAll(async (): Promise<void> => {
      console.log("App start")
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName:"entry",
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
          console.log("onAbilityCreate end")
        },
      }, (err: BusinessError<void> | null): void => {
        if (err != null ) {
          console.log("-----" + err.code)
        }
        console.log("BusinessError  end")
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.sendingmessagestoeachothertest.static")
      await Utils.msSleep(2000)
      console.log("beforeAll end,%s", "Succeed!")
    });
    
    
    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info("webMessageExt beforeEach start");
    })

    /**
    * @tc.name        testWebMessageExGetTypeStatic001
    * @tc.number      SUB_WEB_WEBMESSAGEEXT_GETTYPE_0100
    * @tc.desc        test WebMessageExGetType
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebMessageExGetTypeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testWebMessageExGetType001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExGetType001", 1, 20260, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testWebMessageExGetTypeStatic002
    * @tc.number      SUB_WEB_WEBMESSAGEEXT_GETTYPE_0200
    * @tc.desc        test WebMessageExGetType
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebMessageExGetTypeStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testWebMessageExGetType002", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExGetType002", 2, 20261, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testWebMessageExGetTypeStatic003
    * @tc.number      SUB_WEB_WEBMESSAGEEXT_GETTYPE_0300
    * @tc.desc        test WebMessageExGetType
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebMessageExGetTypeStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testWebMessageExGetType003", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExGetType003", 3, 20262, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testWebMessageExGetTypeStatic004
    * @tc.number      SUB_WEB_WEBMESSAGEEXT_GETTYPE_0400
    * @tc.desc        test WebMessageExGetType
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebMessageExGetTypeStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testWebMessageExGetType004", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExGetType004", 4, 20263, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testWebMessageExGetTypeStatic005
    * @tc.number      SUB_WEB_WEBMESSAGEEXT_GETTYPE_0500
    * @tc.desc        test WebMessageExGetType
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebMessageExGetTypeStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testWebMessageExGetType005", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExGetType005", 5, 20264, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testWebMessageExGetTypeStatic006
    * @tc.number      SUB_WEB_WEBMESSAGEEXT_GETTYPE_0600
    * @tc.desc        test WebMessageExGetType
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebMessageExGetTypeStatic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testWebMessageExGetType006", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExGetType006", 6, 20265, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testWebMessageExtWebMessageTypeStatic001
    * @tc.number      SUB_WEB_WEBMESSAGEEXT_WEBMESSAGETYPE_0100
    * @tc.desc        test WebMessageType
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebMessageExtWebMessageTypeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testWebMessageExtWebMessageType001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtWebMessageType001", 0, 30000, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testWebMessageExtWebMessageTypeStatic002
    * @tc.number      SUB_WEB_WEBMESSAGEEXT_WEBMESSAGETYPE_0200
    * @tc.desc        test WebMessageType
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebMessageExtWebMessageTypeStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testWebMessageExtWebMessageType002", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtWebMessageType002", 1, 30001, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testWebMessageExtWebMessageTypeStatic003
    * @tc.number      SUB_WEB_WEBMESSAGEEXT_WEBMESSAGETYPE_0300
    * @tc.desc        test WebMessageType
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebMessageExtWebMessageTypeStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testWebMessageExtWebMessageType003", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtWebMessageType003", 2, 30002, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testWebMessageExtWebMessageTypeStatic004
    * @tc.number      SUB_WEB_WEBMESSAGEEXT_WEBMESSAGETYPE_0400
    * @tc.desc        test WebMessageType
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebMessageExtWebMessageTypeStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testWebMessageExtWebMessageType004", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtWebMessageType004", 3, 30003, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testWebMessageExtWebMessageTypeStatic005
    * @tc.number      SUB_WEB_WEBMESSAGEEXT_WEBMESSAGETYPE_0500
    * @tc.desc        test WebMessageType
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebMessageExtWebMessageTypeStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testWebMessageExtWebMessageType005", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtWebMessageType005", 4, 30004, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testWebMessageExtWebMessageTypeStatic006
    * @tc.number      SUB_WEB_WEBMESSAGEEXT_WEBMESSAGETYPE_0600
    * @tc.desc        test WebMessageType
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebMessageExtWebMessageTypeStatic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testWebMessageExtWebMessageType006", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtWebMessageType006", 5, 30005, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testWebMessageExtWebMessageTypeStatic007
    * @tc.number      SUB_WEB_WEBMESSAGEEXT_WEBMESSAGETYPE_0700
    * @tc.desc        test WebMessageType
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebMessageExtWebMessageTypeStatic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testWebMessageExtWebMessageType007", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtWebMessageType007", 6, 30006, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testWebMessageExtGetStringStatic001
    * @tc.number      SUB_WEB_WEBMESSAGEEXT_GETSTRING_0100
    * @tc.desc        test WebMessageExtGetString
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebMessageExtGetStringStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testWebMessageExtGetString001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtGetString001", 'hello', 100020, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name        testWebMessageExtGetStringErrorCodeStatic001
     * @tc.number      SUB_WEB_WEBMESSAGEEXT_GETSTRING_0000
     * @tc.desc        test WebMessageExtGetStringErrorCode 17100014
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testWebMessageExtGetStringErrorCodeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testWebMessageExtGetStringErrorCode001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtGetStringErrorCode001", 17100014, 100003, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testWebMessageExtGetNumberStatic001
    * @tc.number      SUB_WEB_WEBMESSAGEEXT_GETNUMBER_0100
    * @tc.desc        test WebMessageExtGetNumber
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebMessageExtGetNumberStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testWebMessageExtGetNumber001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtGetNumber001", 1, 100021, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name        testWebMessageExtGetNumberErrorCodeStatic001
     * @tc.number      SUB_WEB_WEBMESSAGEEXT_GETNUMBER_0001
     * @tc.desc        test WebMessageExtGetNumber ErrorCode 17100014
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testWebMessageExtGetNumberErrorCodeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testWebMessageExtGetNumberErrorCode001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtGetNumberErrorCode001",17100014 ,100008 , done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testWebMessageExtGetBooleanStatic001
    * @tc.number      SUB_WEB_WEBMESSAGEEXT_GETBOOLEAN_0001
    * @tc.desc        test WebMessageExtGetBoolean
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebMessageExtGetBooleanStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testWebMessageExtGetBoolean001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtGetBoolean001", true, 100022, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testWebMessageExtGetBooleanStatic002
    * @tc.number      SUB_WEB_WEBMESSAGEEXT_GETBOOLEAN_0200
    * @tc.desc        test WebMessageExtGetBoolean
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebMessageExtGetBooleanStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testWebMessageExtGetBoolean002", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtGetBoolean002", false, 100023, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name        testWebMessageExtGetBooleanErrorCodeStatic001
     * @tc.number      SUB_WEB_WEBMESSAGEEXT_GETBOOLEAN_0100
     * @tc.desc        test WebMessageExtGetBoolean ErrorCode 17100014
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testWebMessageExtGetBooleanErrorCodeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testWebMessageExtGetBooleanErrorCode001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtGetBooleanErrorCodeStatic001",17100014 ,110000 , done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testWebMessageExtGetArrayBufferStatic001
    * @tc.number      SUB_WEB_WEBMESSAGEEXT_GETARRAYBUFFER_0100
    * @tc.desc        test WebMessageExtGetArrayBuffer
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebMessageExtGetArrayBufferStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testWebMessageExtGetArrayBuffer001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtGetArrayBuffer001", 'result getArrayBuffer byteLength:8', 100024, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name        testWebMessageExtGetArrayBufferErrorCodeStatic001
     * @tc.number      SUB_WEB_WEBMESSAGEEXT_GETARRAYBUFFER_0101
     * @tc.desc        test WebMessageExtGetArrayBuffer ErrorCode 17100014
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testWebMessageExtGetArrayBufferErrorCodeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testWebMessageExtGetArrayBufferErrorCode001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtGetArrayBufferErrorCode001",17100014 ,110001 , done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testWebMessageExtGetArrayStatic001
    * @tc.number      SUB_WEB_WEBMESSAGEEXT_GETARRAY_0001
    * @tc.desc        test WebMessageExtGetArray
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebMessageExtGetArrayStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testWebMessageExtGetArray001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtGetArray001", 'apple', 100025, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testWebMessageExtGetArrayEmptyStatic001
    * @tc.number      SUB_WEB_WEBMESSAGEEXT_GETARRAY_0100
    * @tc.desc        test WebMessageExtGetArrayEmpty
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebMessageExtGetArrayEmptyStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtGetArrayEmpty001", 17100014, 110004, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name        testWebMessageExtGetArrayErrorCodeStatic001
     * @tc.number      SUB_WEB_WEBMESSAGEEXT_GETARRAY_0002
     * @tc.desc        test WebMessageExtGetArray ErrorCode 17100014
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testWebMessageExtGetArrayErrorCodeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testWebMessageExtGetArrayErrorCode001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtGetArrayErrorCode001",17100014 ,110002 , done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testWebMessageExtGetErrorStatic001
    * @tc.number      SUB_WEB_WEBMESSAGEEXT_GETERROR_0001
    * @tc.desc        test WebMessageExtGetError
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebMessageExtGetErrorStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testWebMessageExtGetError001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtGetError001", 'URIERROR: URI SEQ 0222', 100026, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name        testWebMessageExtGetErrorErrorCodeStatic001
     * @tc.number      SUB_WEB_WEBMESSAGEEXT_GETERROR_0100
     * @tc.desc        test WebMessageExtGetError ErrorCode 17100014
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testWebMessageExtGetErrorErrorCodeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testWebMessageExtGetErrorErrorCode001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtGetErrorErrorCode001",17100014 ,110003 , done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testWebMessageExtSetStringStatic001
    * @tc.number      SUB_WEB_WEBMESSAGEEXT_SETSTRING_0000
    * @tc.desc        test WebMessageExtSetString
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebMessageExtSetStringStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let result = "String:helloFromEts"
      Utils.emitEvent("testWebMessageExtSetString001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtSetString001", JSON.stringify(result), 100027, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testWebMessageExtSetStringErrorCodeStatic001
    * @tc.number      SUB_WEB_WEBMESSAGEEXT_SETSTRING_0001
    * @tc.desc        test WebMessageExtSetString error code 17100014
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebMessageExtSetStringErrorCodeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testWebMessageExtSetStringErrorCode001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtSetStringErrorCode001", 17100014, 100001, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name        testWebMessageExtSetStringEmptyStatic001
     * @tc.number      SUB_WEB_WEBMESSAGEEXT_SETSTRING_0200
     * @tc.desc        test WebMessageExtSetString error code 401
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testWebMessageExtSetStringEmptyStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let result = "String:"
      Utils.emitEvent("testWebMessageExtSetStringEmpty001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtSetStringEmpty001", JSON.stringify(result), 100002, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testWebMessageExtSetNumberStatic001
    * @tc.number      SUB_WEB_WEBMESSAGEEXT_SETNUMBER_0001
    * @tc.desc        test WebMessageExtSetNumber
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebMessageExtSetNumberStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let result = "Number:1"
      Utils.emitEvent("testWebMessageExtSetNumber001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtSetNumber001", JSON.stringify(result), 100028, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name        testWebMessageExtSetNumberErrorCodeStatic001
     * @tc.number      SUB_WEB_WEBMESSAGEEXT_SETNUMBER_0100
     * @tc.desc        test WebMessageExtGetStringErrorCode 17100014
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testWebMessageExtSetNumberErrorCodeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testWebMessageExtSetNumberErrorCode001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtSetNumberErrorCode001", 17100014, 100004, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testWebMessageExtSetBooleanStatic001
    * @tc.number      SUB_WEB_WEBMESSAGEEXT_SETBOOLEAN_0100
    * @tc.desc        test WebMessageExtSetBoolean
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebMessageExtSetBooleanStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let result = "Boolean:true"
      Utils.emitEvent("testWebMessageExtSetBoolean001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtSetBoolean001", JSON.stringify(result), 100029, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })


    /**
    * @tc.name        testWebMessageExtSetBooleanStatic002
    * @tc.number      SUB_WEB_WEBMESSAGEEXT_SETBOOLEAN_0200
    * @tc.desc        test WebMessageExtSetBoolean
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebMessageExtSetBooleanStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let result = "Boolean:false"
      Utils.emitEvent("testWebMessageExtSetBoolean002", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtSetBoolean002", JSON.stringify(result), 100030, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testWebMessageExtSetBooleanErrorCodeStatic001
    * @tc.number      SUB_WEB_WEBMESSAGEEXT_SETBOOLEAN_0001
    * @tc.desc        test WebMessageExtSetBoolean ErrorCode 17100014
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebMessageExtSetBooleanErrorCodeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let result = "Boolean:false"
      Utils.emitEvent("testWebMessageExtSetBooleanErrorCode001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtSetBooleanErrorCode001", 17100014 , 100005, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testWebMessageExtSetArrayBufferStatic001
    * @tc.number      SUB_WEB_WEBMESSAGEEXT_SETARRAYBUFFER_0001
    * @tc.desc        test WebMessageExtSetArrayBuffer
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebMessageExtSetArrayBufferStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let result = "ArrayBuffer:8"
      Utils.emitEvent("testWebMessageExtSetArrayBuffer001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtSetArrayBuffer001", JSON.stringify(result), 100031, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testWebMessageExtSetArrayBufferErrorCodeStatic001
    * @tc.number      SUB_WEB_WEBMESSAGEEXT_SETARRAYBUFFER_0100
    * @tc.desc        test WebMessageExtSetArrayBuffer ErrorCode 17100014
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebMessageExtSetArrayBufferErrorCodeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let result = "ArrayBuffer:8"
      Utils.emitEvent("testWebMessageExtSetArrayBufferErrorCode001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtSetArrayBufferErrorCode001", 17100014, 100006, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testWebMessageExtSetArrayStatic001
    * @tc.number      SUB_WEB_WEBMESSAGEEXT_SETARRAY_0101
    * @tc.desc        test WebMessageExtSetArray
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebMessageExtSetArrayStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let result = "Array len:1, value:apple";
      Utils.emitEvent("testWebMessageExtSetArray001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtSetArray001", JSON.stringify(result), 100032, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testWebMessageExtSetArrayEmptyStatic001
    * @tc.number      SUB_WEB_WEBMESSAGEEXT_SETARRAY_0102
    * @tc.desc        test WebMessageExtSetArrayEmpty
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebMessageExtSetArrayEmptyStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testWebMessageExtSetArrayEmpty001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtSetArrayEmpty001", 401, 100009, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testWebMessageExtSetArrayErrorCodeStatic001
    * @tc.number      SUB_WEB_WEBMESSAGEEXT_SETARRAY_0100
    * @tc.desc        test WebMessageExtSetArray ErrorCode 17100014
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebMessageExtSetArrayErrorCodeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testWebMessageExtSetArrayErrorCode001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtSetArrayErrorCode001", 17100014, 100007, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name        testWebMessageExtSetErrorErrorCodeStatic001
     * @tc.number      SUB_WEB_WEBMESSAGEEXT_SETERROR_0100
     * @tc.desc        test WebMessageExtSetArray ErrorCode 17100014
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testWebMessageExtSetErrorErrorCodeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testWebMessageExtSetErrorErrorCode001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtSetErrorErrorCode001", 17100014, 100008, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testWebMessageExtSetNotSupportStatic001
    * @tc.number      SUB_WEB_WEBMESSAGEEXT_SETSTRING_0100
    * @tc.desc        test WebMessageExtSetString NOT_SUPPORT
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testWebMessageExtSetNotSupportStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testWebMessageExtSetNotSupport001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebMessageExtSetNotSupport001", 17100014, 110008, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name        SwitchNextPageStatic
     * @tc.number      SUB_WEB_WEBMESSAGEEXT_SETARRAY_0200
     * @tc.desc        test WebMessageExtSetArray
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(1000);
        inspector.sendEventByKey('WebMessageExtButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })

  })
}
