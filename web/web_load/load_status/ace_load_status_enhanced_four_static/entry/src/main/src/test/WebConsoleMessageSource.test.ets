
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
import { beforeAll, beforeEach, describe, it, TestType, Size, Level, expect } from '../../../hypium/index';

import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError,RecordData } from '@ohos.base';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import emitter from '@ohos.events.emitter';

import { ConsoleMessageSource } from '@ohos.arkui.component';

import Utils from './Util.test';

export default function WebConsoleMessageSource() {
  describe('WebConsoleMessageSource', ():void => {

    beforeAll(async (): Promise<void> => {
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.actsaceloadstatusenhancedfourtest.static')
      await Utils.msSleep(3000)
      console.log('beforeAll end,%s', 'Succeed!')
    });

    beforeEach(async () => {
      console.info('web beforeEach start');
    })


    /**
     * @tc.name   testWebConsoleMessageGetSourceStatic0001
     * @tc.number SUB_WEB_ConsoleMessageGetSource_STATIC_0001
     * @tc.desc   test onConsole GetSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebConsoleMessageGetSourceStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void):Promise<void> => {
      Utils.emitEvent("emitWebConsoleMessageGetSource0001", 119060)
      await Utils.msSleep(3000);
      Utils.registerEvent("testWebConsoleMessageGetSource0001", ConsoleMessageSource.CONSOLE_API, 119100, done);
      expect(ConsoleMessageSource.CONSOLE_API).assertEqual(3);
      inspector.sendEventByKey('WebConsoleMessageGetSourceButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebConsoleMessageSourceXMLStatic0001
     * @tc.number SUB_WEB_ConsoleMessageGetSource_XML_STATIC_0001
     * @tc.desc   test onConsole GetSource XML
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebConsoleMessageSourceXMLStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=>void):Promise<void> => {
      expect(ConsoleMessageSource.XML).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testWebConsoleMessageSourceJAVASCRIPTStatic0001
     * @tc.number SUB_WEB_ConsoleMessageGetSource_JAVASCRIPT_STATIC_0001
     * @tc.desc   test onConsole GetSource JAVASCRIPT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebConsoleMessageSourceJAVASCRIPTStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=>void):Promise<void> => {
      expect(ConsoleMessageSource.JAVASCRIPT).assertEqual(1);
      done()
    })

    /**
     * @tc.name   testWebConsoleMessageSourceNETWORKStatic0001
     * @tc.number SUB_WEB_ConsoleMessageGetSource_NETWORK_STATIC_0001
     * @tc.desc   test onConsole GetSource NETWORK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebConsoleMessageSourceNETWORKStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=>void):Promise<void> => {
      expect(ConsoleMessageSource.NETWORK).assertEqual(2);
      done()
    })

    /**
     * @tc.name   testWebConsoleMessageSourceCONSOLE_APIStatic0001
     * @tc.number SUB_WEB_ConsoleMessageGetSource_CONSOLE_API_STATIC_0001
     * @tc.desc   test onConsole GetSource CONSOLE_API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebConsoleMessageSourceCONSOLE_APIStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=>void):Promise<void> => {
      expect(ConsoleMessageSource.CONSOLE_API).assertEqual(3);
      done()
    })

    /**
     * @tc.name   testWebConsoleMessageSourceSTORAGEStatic0001
     * @tc.number SUB_WEB_ConsoleMessageGetSource_STORAGE_STATIC_0001
     * @tc.desc   test onConsole GetSource STORAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebConsoleMessageSourceSTORAGEStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=>void):Promise<void> => {
      expect(ConsoleMessageSource.STORAGE).assertEqual(4);
      done()
    })

    /**
     * @tc.name   testWebConsoleMessageSourceRENDERINGStatic0001
     * @tc.number SUB_WEB_ConsoleMessageGetSource_RENDERING_STATIC_0001
     * @tc.desc   test onConsole GetSource RENDERING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebConsoleMessageSourceRENDERINGStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=>void):Promise<void> => {
      expect(ConsoleMessageSource.RENDERING).assertEqual(5);
      done()
    })

    /**
     * @tc.name   testWebConsoleMessageSourceSECURITYStatic0001
     * @tc.number SUB_WEB_ConsoleMessageGetSource_SECURITY_STATIC_0001
     * @tc.desc   test onConsole GetSource SECURITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebConsoleMessageSourceSECURITYStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=>void):Promise<void> => {
      expect(ConsoleMessageSource.SECURITY).assertEqual(6);
      done()
    })

    /**
     * @tc.name   testWebConsoleMessageSourceOTHERStatic0001
     * @tc.number SUB_WEB_ConsoleMessageGetSource_OTHER_STATIC_0001
     * @tc.desc   test onConsole GetSource OTHER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebConsoleMessageSourceOTHERStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=>void):Promise<void> => {
      expect(ConsoleMessageSource.OTHER).assertEqual(7);
      done()
    })

    /**
     * @tc.name   testWebConsoleMessageSourceDEPRECATIONStatic0001
     * @tc.number SUB_WEB_ConsoleMessageGetSource_DEPRECATION_STATIC_0001
     * @tc.desc   test onConsole GetSource DEPRECATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebConsoleMessageSourceDEPRECATIONStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=>void):Promise<void> => {
      expect(ConsoleMessageSource.DEPRECATION).assertEqual(8);
      done()
    })

    /**
     * @tc.name   testWebConsoleMessageSourceWORKERStatic0001
     * @tc.number SUB_WEB_ConsoleMessageGetSource_WORKER_STATIC_0001
     * @tc.desc   test onConsole GetSource WORKER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebConsoleMessageSourceWORKERStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=>void):Promise<void> => {
      expect(ConsoleMessageSource.WORKER).assertEqual(9);
      done()
    })

    /**
     * @tc.name   testWebConsoleMessageSourceVIOLATIONStatic0001
     * @tc.number SUB_WEB_ConsoleMessageGetSource_VIOLATION_STATIC_0001
     * @tc.desc   test onConsole GetSource VIOLATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebConsoleMessageSourceVIOLATIONStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=>void):Promise<void> => {
      expect(ConsoleMessageSource.VIOLATION).assertEqual(10);
      done()
    })

    /**
     * @tc.name   testWebConsoleMessageSourceINTERVENTIONStatic0001
     * @tc.number SUB_WEB_ConsoleMessageGetSource_INTERVENTION_STATIC_0001
     * @tc.desc   test onConsole GetSource INTERVENTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebConsoleMessageSourceINTERVENTIONStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=>void):Promise<void> => {
      expect(ConsoleMessageSource.INTERVENTION).assertEqual(11);
      done()
    })

    /**
     * @tc.name   testWebConsoleMessageSourceRECOMMENDATIONStatic0001
     * @tc.number SUB_WEB_ConsoleMessageGetSource_RECOMMENDATION_STATIC_0001
     * @tc.desc   test onConsole GetSource RECOMMENDATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebConsoleMessageSourceRECOMMENDATIONStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=>void):Promise<void> => {
      expect(ConsoleMessageSource.RECOMMENDATION).assertEqual(12);
      done()
    })


  })
}
