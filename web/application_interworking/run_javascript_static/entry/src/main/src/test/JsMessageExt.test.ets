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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Utils.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';


let testAbilityContext:common.UIAbilityContext;

export default function jsMessageExt() {

  describe('JsMessageExtTestSuite', ():void => {

    beforeAll(async ():Promise<void> => {
      console.log('App start')
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: 'EntryAbility',
        moduleName:'entry',
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
          console.log('onAbilityCreate end')
        },
      }, (err: BusinessError<void> | null): void => {
        if (err != null ) {
          console.log('-----' + err.code)
        }
        console.log('BusinessError  end')
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.runjavascripttest.static')
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('jsMessageExt beforeEach start');
    })

    /**
     * @tc.name   testJsMessageExtGetTypeStatic001
     * @tc.number SUB_WEB_JSMESSAGEEXT_GETTYPE_0100
     * @tc.desc   test JsMessageExtGetType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testJsMessageExtGetTypeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtGetType001', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtGetType001', 1, 30200, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('JsMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name   testJsMessageExtGetTypeStatic002
     * @tc.number SUB_WEB_JSMESSAGEEXT_GETTYPE_0200
     * @tc.desc   test JsMessageExtGetType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testJsMessageExtGetTypeStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtGetType002', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtGetType002', 2, 30201, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('JsMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name   testJsMessageExtGetTypeStatic003
     * @tc.number SUB_WEB_JSMESSAGEEXT_GETTYPE_0300
     * @tc.desc   test JsMessageExtGetType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testJsMessageExtGetTypeStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtGetType003', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtGetType003', 3, 30202, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('JsMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name   testJsMessageExtGetTypeStatic004
     * @tc.number SUB_WEB_JSMESSAGEEXT_GETTYPE_0400
     * @tc.desc   test JsMessageExtGetType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testJsMessageExtGetTypeStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtGetType004', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtGetType004', 4, 30203, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('JsMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name   testJsMessageExtGetTypeStatic005
     * @tc.number SUB_WEB_JSMESSAGEEXT_GETTYPE_0500
     * @tc.desc   test JsMessageExtGetType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testJsMessageExtGetTypeStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtGetType005', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtGetType005', 5, 30204, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('JsMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name   testJsMessageExtJsMessageTypeStatic001
     * @tc.number SUB_WEB_JSMESSAGEEXT_JSMESSAGETYPE_0100
     * @tc.desc   test JsMessageType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testJsMessageExtJsMessageTypeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtJsMessageType001', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtJsMessageType001', 0, 30205, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('JsMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name   testJsMessageExtJsMessageTypeStatic002
     * @tc.number SUB_WEB_JSMESSAGEEXT_JSMESSAGETYPE_0200
     * @tc.desc   test JsMessageType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testJsMessageExtJsMessageTypeStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtJsMessageType002', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtJsMessageType002', 1, 30206, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('JsMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name   testJsMessageExtJsMessageTypeStatic003
     * @tc.number SUB_WEB_JSMESSAGEEXT_JSMESSAGETYPE_0300
     * @tc.desc   test JsMessageType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testJsMessageExtJsMessageTypeStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtJsMessageType003', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtJsMessageType003', 2, 30207, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('JsMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name   testJsMessageExtJsMessageTypeStatic004
     * @tc.number SUB_WEB_JSMESSAGEEXT_JSMESSAGETYPE_0400
     * @tc.desc   test JsMessageType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testJsMessageExtJsMessageTypeStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtJsMessageType004', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtJsMessageType004', 3, 30208, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('JsMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name   testJsMessageExtJsMessageTypeStatic005
     * @tc.number SUB_WEB_JSMESSAGEEXT_JSMESSAGETYPE_0500
     * @tc.desc   test JsMessageType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testJsMessageExtJsMessageTypeStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtJsMessageType005', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtJsMessageType005', 4, 30209, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('JsMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name   testJsMessageExtJsMessageTypeStatic006
     * @tc.number SUB_WEB_JSMESSAGEEXT_JSMESSAGETYPE_0600
     * @tc.desc   test JsMessageType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testJsMessageExtJsMessageTypeStatic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtJsMessageType006', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtJsMessageType006', 5, 30210, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('JsMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name   testJsMessageExtGetStringStatic001
     * @tc.number SUB_WEB_JSMESSAGEEXT_GETSTRING_0100
     * @tc.desc   test JsMessageExtGetString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testJsMessageExtGetStringStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtGetString001', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtGetString001', '"hello, world"', 100013, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('JsMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name   testJsMessageExtGetNumberStatic001
     * @tc.number SUB_WEB_JSMESSAGEEXT_GETNUMBER_0100
     * @tc.desc   test JsMessageExtGetNumber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testJsMessageExtGetNumberStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtGetNumber001', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtGetNumber001', 5e-324, 100014, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('JsMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })



    /**
     * @tc.name   testJsMessageExtGetBooleanStatic002
     * @tc.number SUB_WEB_JSMESSAGEEXT_GETBOOLEAN_0200
     * @tc.desc   test JsMessageExtGetBoolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testJsMessageExtGetBooleanStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtGetBoolean002', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtGetBoolean002', false, 100016, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('JsMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name   testJsMessageExtGetArrayBufferStatic001
     * @tc.number SUB_WEB_JSMESSAGEEXT_GETARRAYBUFFER_0100
     * @tc.desc   test JsMessageExtGetArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testJsMessageExtGetArrayBufferStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtGetArrayBuffer001', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtGetArrayBuffer001', 'result type:object', 100017, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('JsMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name   testJsMessageExtGetArrayStatic001
     * @tc.number SUB_WEB_JSMESSAGEEXT_GETARRAY_0100
     * @tc.desc   test JsMessageExtGetArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testJsMessageExtGetArrayStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('testJsMessageExtGetArray001', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testJsMessageExtGetArray001', true, 100018, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('JsMessageExtButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name   SwitchNextPageStatic
     * @tc.number SUB_WEB_JSMESSAGEEXT_GETARRAY_0200
     * @tc.desc   test JsMessageExtGetArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(1000);
        inspector.sendEventByKey('JsMessageExtButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })

  })
}
