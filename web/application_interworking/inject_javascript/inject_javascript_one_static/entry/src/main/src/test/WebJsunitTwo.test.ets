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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level, expect } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import events_emitter from '@ohos.events.emitter';


let testAbilityContext: common.UIAbilityContext;

let emitKey = "emitRegisterJavaScriptProxy";

export default function webJsunitTwo() {
  describe('webJsunitTwoTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.log("App start")
    });

    /**
     * @tc.name        DeleteJavaScriptRegisterStatic
     * @tc.number      SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_014
     * @tc.desc        test delet specific proxy
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('DeleteJavaScriptRegisterStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        emitKey = "emitDeleteJavaScriptRegister";
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("DeleteJavaScriptRegister", "17100008", 14, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webcomponent', 10, '');
        console.log("click")
        await Utils.msSleep(12000);
        done()
      })

    /*
     * @tc.number     : SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_039
     * @tc.name       : JsMessExtGetStringStatic
     * @tc.desc       : test Save current page
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('JsMessExtGetStringStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = "emitJsMessExtGetString";
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("JsMessExtGetString", "result type:string", 500, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webcomponent', 10, '');
        await Utils.msSleep(12000);
        done()
      })

    /*
      * @tc.number     : SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_040
      * @tc.name       : JsMessExtGetNumStatic
      * @tc.desc       : Save current page
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 3
      */
    it('JsMessExtGetNumStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = "emitJsMessExtGetNum";
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("JsMessExtGetNum", "result type:number", 501, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webcomponent', 10, '');
        await Utils.msSleep(12000);
        done()
      })

    /*
     * @tc.number     : SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_041
     * @tc.name       : JsMessExtGetBooStatic
     * @tc.desc       : Save current page
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('JsMessExtGetBooStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = "emitJsMessExtGetBoo";
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("JsMessExtGetBoo", "result type:boolean", 502, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webcomponent', 10, '');
        await Utils.msSleep(12000);
        done()
      })

    /*
        * @tc.number     : SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_042
        * @tc.name       : JsMessExtGetArrayBufferStatic
        * @tc.desc       : Save current page
        * @tc.size       : MediumTest
        * @tc.type       : Function
        * @tc.level      : Level 3
        */
    it('JsMessExtGetArrayBufferStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = "emitJsMessExtGetArrayBuffer";
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("JsMessExtGetArrayBuffer", "result type:object", 503, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webcomponent', 10, '');
        await Utils.msSleep(12000);
        done()
      })

    /*
        * @tc.number     : SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_043
        * @tc.name       : JsMessExtGetArrayStatic
        * @tc.desc       : Save current page
        * @tc.size       : MediumTest
        * @tc.type       : Function
        * @tc.level      : Level 3
        */
    it('JsMessExtGetArrayStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = "emitJsMessExtGetArray";
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("JsMessExtGetArray", "result type:object0", 504, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webcomponent', 10, '');
        await Utils.msSleep(12000);
        done()
      })

    /*
        * @tc.number     : SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_044
        * @tc.name       : WebMessExtSetStringStatic
        * @tc.desc       : Save current page
        * @tc.size       : MediumTest
        * @tc.type       : Function
        * @tc.level      : Level 3
        */
    it('WebMessExtSetStringStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = "emitWebMessExtSetString";
        let result = "String:helloFromEts";
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("WebMessExtSetString", JSON.stringify(result), 506, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webcomponent', 10, '');
        await Utils.msSleep(12000);
        done()
      })

    /*
        * @tc.number     : SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_046
        * @tc.name       : WebMessExtSetNumberStatic
        * @tc.desc       : Save current page
        * @tc.size       : MediumTest
        * @tc.type       : Function
        * @tc.level      : Level 3
        */
    it('WebMessExtSetNumberStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = "emitWebMessExtSetNumber";
        let result = "Number:1";
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("WebMessExtSetNumber", JSON.stringify(result), 507, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webcomponent', 10, '');
        await Utils.msSleep(12000);
        done()
      })

    /*
        * @tc.number     : SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_047
        * @tc.name       : WebMessExtGetNumberStatic
        * @tc.desc       : Save current page
        * @tc.size       : MediumTest
        * @tc.type       : Function
        * @tc.level      : Level 3
        */
    it('WebMessExtGetNumberStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = "emitWebMessExtGetNumber";
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("WebMessExtGetNumber", "result type:long0", 508, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webcomponent', 10, '');
        await Utils.msSleep(12000);
        done()
      })

    /*
        * @tc.number     : SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_048
        * @tc.name       : WebMessExtSetBooleanStatic
        * @tc.desc       : Save current page
        * @tc.size       : MediumTest
        * @tc.type       : Function
        * @tc.level      : Level 3
        */
    it('WebMessExtSetBooleanStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = "emitWebMessExtSetBoolean";
        let result = "Boolean:true";
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("WebMessExtSetBoolean", JSON.stringify(result), 509, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webcomponent', 10, '');
        await Utils.msSleep(12000);
        done()
      })

    /*
        * @tc.number     : SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_049
        * @tc.name       : WebMessExtGetBooleanStatic
        * @tc.desc       : Save current page
        * @tc.size       : MediumTest
        * @tc.type       : Function
        * @tc.level      : Level 3
        */
    it('WebMessExtGetBooleanStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = "emitWebMessExtGetBoolean";
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("WebMessExtGetBoolean", "result type:boolean", 510, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webcomponent', 10, '');
        await Utils.msSleep(12000);
        done()
      })

    /*
        * @tc.number     : SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_050
        * @tc.name       : WebMessExtSetArrayStatic
        * @tc.desc       : Save current page
        * @tc.size       : MediumTest
        * @tc.type       : Function
        * @tc.level      : Level 3
        */
    it('WebMessExtSetArrayStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = "emitWebMessExtSetArray";
        let result = "Array len:2, value:apple,banana";
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("WebMessExtSetArray", JSON.stringify(result), 511, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webcomponent', 10, '');
        await Utils.msSleep(12000);
        done()
      })


    /*
       * @tc.number     : SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_052
       * @tc.name       : WebMessExtSetArrayBufferStatic
       * @tc.desc       : Save current page
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 3
       */
    it('WebMessExtSetArrayBufferStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = "emitWebMessExtSetArrayBuffer";
        let result = "ArrayBuffer:8";
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("WebMessExtSetArrayBuffer", JSON.stringify(result), 513, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webcomponent', 10, '');
        await Utils.msSleep(12000);
        done()
      })

    /*
        * @tc.number     : SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_053
        * @tc.name       : WebMessExtGetArrayBufferStatic
        * @tc.desc       : Save current page
        * @tc.size       : MediumTest
        * @tc.type       : Function
        * @tc.level      : Level 3
        */
    it('WebMessExtGetArrayBufferStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = "emitWebMessExtGetArrayBuffer";
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("WebMessExtGetArrayBuffer", "result getArrayBuffer byteLength:8", 514, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webcomponent', 10, '');
        await Utils.msSleep(12000);
        done()
      })

    /*
        * @tc.number     : SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_054
        * @tc.name       : WebMessExtSetErrorStatic
        * @tc.desc       : Save current page
        * @tc.size       : MediumTest
        * @tc.type       : Function
        * @tc.level      : Level 3
        */
    it('WebMessExtSetErrorStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = "emitWebMessExtSetError";
        let result = "Error:ReferenceError, msg:Error";
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("WebMessExtSetError", JSON.stringify(result), 515, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webcomponent', 10, '');
        await Utils.msSleep(12000);
        done()
      })

    /*
        * @tc.number     : SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_055
        * @tc.name       : WebMessExtGetErrorStatic
        * @tc.desc       : Save current page
        * @tc.size       : MediumTest
        * @tc.type       : Function
        * @tc.level      : Level 3
        */
    it('WebMessExtGetErrorStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        emitKey = "emitWebMessExtGetError";
        Utils.emitEvent(emitKey, 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("WebMessExtGetError", "result type:string", 516, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webcomponent', 10, '');
        await Utils.msSleep(12000);
        done();
      })

    /*
* @tc.number     : SUB_WEB_JAVASCRIPTONDOCUMENTSTART_0200
* @tc.name       : testJavaScriptOnDocumentStartStatic002
* @tc.desc       : test javaScriptOnDocumentStart
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 3
*/
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(3000);
        inspector.sendEventByKey('WebJavaScriptOnDocumentStartTestButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })
    
  })
}
