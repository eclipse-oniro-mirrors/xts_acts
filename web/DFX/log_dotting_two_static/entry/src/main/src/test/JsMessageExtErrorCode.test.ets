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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import { accessibility, config } from '@kit.AccessibilityKit';
import inspector from '@ohos.arkui.inspector';
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest';


let testAbilityContext: common.UIAbilityContext;

export default function jsMessageExtErrorCode() {

  describe('jsMessageExtErrorCode', () => {
    beforeAll(async (): Promise<void> => {
        console.log(' App start')
    });
    

    /*
     * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETSTRING_0100
     * @tc.name       : testJsMessageExtGetStringErrorStatic001
     * @tc.desc       : test JsMessageExtGetString error
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testJsMessageExtGetStringErrorStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    async (done: () => void): Promise<void> => {
      await Utils.msSleep(3000);
      Utils.emitEvent('testJsMessageExtGetStringError001', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testJsMessageExtGetStringError001', '17100014', 30400, done);
      await Utils.msSleep(3000);
       inspector.sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
      await Utils.msSleep(6000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETSTRING_0200
    * @tc.name       : testJsMessageExtGetStringErrorStatic002
    * @tc.desc       : test JsMessageExtGetString error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testJsMessageExtGetStringErrorStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtGetStringError002', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtGetStringError002', '17100014', 30401, done);
      await Utils.msSleep(2000);
       inspector.sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETSTRING_0300
    * @tc.name       : testJsMessageExtGetStringErrorStatic003
    * @tc.desc       : test JsMessageExtGetString error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testJsMessageExtGetStringErrorStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtGetStringError003', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtGetStringError003', '17100014', 30402, done);
      await Utils.msSleep(2000);
       inspector.sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETSTRING_0400
    * @tc.name       : testJsMessageExtGetStringErrorStatic004
    * @tc.desc       : test JsMessageExtGetString error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testJsMessageExtGetStringErrorStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtGetStringError004', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtGetStringError004', '17100014', 30403, done);
      await Utils.msSleep(2000);
       inspector.sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETNUMBER_0100
    * @tc.name       : testJsMessageExtGetNumberErrorStatic001
    * @tc.desc       : test JsMessageExtGetString error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testJsMessageExtGetNumberErrorStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtGetNumberError001', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtGetNumberError001', '17100014', 30410, done);
      await Utils.msSleep(2000);
       inspector.sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETNUMBER_0200
    * @tc.name       : testJsMessageExtGetNumberErrorStatic002
    * @tc.desc       : test JsMessageExtGetString error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testJsMessageExtGetNumberErrorStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtGetNumberError002', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtGetNumberError002', '17100014', 30411, done);
      await Utils.msSleep(2000);
       inspector.sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETNUMBER_0300
    * @tc.name       : testJsMessageExtGetNumberErrorStatic003
    * @tc.desc       : test JsMessageExtGetString error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testJsMessageExtGetNumberErrorStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtGetNumberError003', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtGetNumberError003', '17100014', 30412, done);
      await Utils.msSleep(2000);
       inspector.sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETNUMBER_0400
    * @tc.name       : testJsMessageExtGetNumberErrorStatic004
    * @tc.desc       : test JsMessageExtGetString error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testJsMessageExtGetNumberErrorStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtGetNumberError004', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtGetNumberError004', '17100014', 30413, done);
      await Utils.msSleep(2000);
       inspector.sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETBOOLEAN_0100
    * @tc.name       : testJsMessageExtGetBooleanErrorStatic001
    * @tc.desc       : test JsMessageExtGetBoolean error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testJsMessageExtGetBooleanErrorStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtGetBooleanError001', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtGetBooleanError001', '17100014', 30420, done);
      await Utils.msSleep(2000);
       inspector.sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETBOOLEAN_0200
    * @tc.name       : testJsMessageExtGetBooleanErrorStatic002
    * @tc.desc       : test JsMessageExtGetBoolean error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testJsMessageExtGetBooleanErrorStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtGetBooleanError002', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtGetBooleanError002', '17100014', 30421, done);
      await Utils.msSleep(2000);
       inspector.sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETBOOLEAN_0300
    * @tc.name       : testJsMessageExtGetBooleanErrorStatic003
    * @tc.desc       : test JsMessageExtGetBoolean error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testJsMessageExtGetBooleanErrorStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtGetBooleanError003', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtGetBooleanError003', '17100014', 30422, done);
      await Utils.msSleep(2000);
       inspector.sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETBOOLEAN_0400
    * @tc.name       : testJsMessageExtGetBooleanErrorStatic004
    * @tc.desc       : test JsMessageExtGetBoolean error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testJsMessageExtGetBooleanErrorStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtGetBooleanError004', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtGetBooleanError004', '17100014', 30423, done);
      await Utils.msSleep(2000);
       inspector.sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETARRAYBUFFER_0100
    * @tc.name       : testJsMessageExtGetArrayBufferErrorStatic001
    * @tc.desc       : test JsMessageExtGetArrayBuffer error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testJsMessageExtGetArrayBufferErrorStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtGetArrayBufferError001', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtGetArrayBufferError001', '17100014', 30430, done);
      await Utils.msSleep(2000);
       inspector.sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETARRAYBUFFER_0200
    * @tc.name       : testJsMessageExtGetArrayBufferErrorStatic002
    * @tc.desc       : test JsMessageExtGetArrayBuffer error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testJsMessageExtGetArrayBufferErrorStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtGetArrayBufferError002', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtGetArrayBufferError002', '17100014', 30431, done);
      await Utils.msSleep(2000);
       inspector.sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETARRAYBUFFER_0300
    * @tc.name       : testJsMessageExtGetArrayBufferErrorStatic003
    * @tc.desc       : test JsMessageExtGetArrayBuffer error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testJsMessageExtGetArrayBufferErrorStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtGetArrayBufferError003', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtGetArrayBufferError003', '17100014', 30432, done);
      await Utils.msSleep(2000);
       inspector.sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETARRAYBUFFER_0400
    * @tc.name       : testJsMessageExtGetArrayBufferErrorStatic004
    * @tc.desc       : test JsMessageExtGetArrayBuffer error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testJsMessageExtGetArrayBufferErrorStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtGetArrayBufferError004', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtGetArrayBufferError004', '17100014', 30433, done);
      await Utils.msSleep(2000);
       inspector.sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETARRAY_0100
    * @tc.name       : testJsMessageExtGetArrayErrorStatic001
    * @tc.desc       : test JsMessageExtGetArray error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testJsMessageExtGetArrayErrorStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtGetArrayError001', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtGetArrayError001', '17100014', 30440, done);
      await Utils.msSleep(2000);
       inspector.sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETARRAY_0200
    * @tc.name       : testJsMessageExtGetArrayErrorStatic002
    * @tc.desc       : test JsMessageExtGetArray error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testJsMessageExtGetArrayErrorStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtGetArrayError002', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtGetArrayError002', '17100014', 30441, done);
      await Utils.msSleep(2000);
       inspector.sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETARRAY_0300
    * @tc.name       : testJsMessageExtGetArrayErrorStatic003
    * @tc.desc       : test JsMessageExtGetArray error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testJsMessageExtGetArrayErrorStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtGetArrayError003', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtGetArrayError003', '17100014', 30442, done);
      await Utils.msSleep(2000);
       inspector.sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETARRAY_0400
    * @tc.name       : testJsMessageExtGetArrayErrorStatic004
    * @tc.desc       : test JsMessageExtGetArray error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testJsMessageExtGetArrayErrorStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtGetArrayError004', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtGetArrayError004', '17100014', 30443, done);
      await Utils.msSleep(2000);
       inspector.sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETARRAY_0500
    * @tc.name       : SwitchNextPageStatic
    * @tc.desc       : test PAGE_REDIRECT
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(1000);
        inspector.sendEventByKey('JsMessageExtErrorCodeButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })
  })
}
