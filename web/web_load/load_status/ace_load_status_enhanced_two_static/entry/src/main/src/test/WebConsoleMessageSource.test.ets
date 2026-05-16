/**
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
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext:common.UIAbilityContext;

export default function WebConsoleMessageSource() {
  describe('WebConsoleMessageSource', (): void => {
    beforeAll(async (): Promise<void> => {
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: 'EntryAbility',
        moduleName:'entry',
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
        },
      }, (err : BusinessError | null) : void => {
        if (err != null ) {
          console.log('-----' + err.code)
        }
        console.log('BusinessError  end')
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.actsaceloadstatusenhancedtesttwo.static')
      await Utils.msSleep(5000)
      console.log('beforeAll end,%s', 'Succeed!')
    });
    beforeEach(async () => {
      console.info('web beforeEach start');
    })

    /**
    * @tc.name         testWebConsoleMessageSourceXMLStatic0001
    * @tc.number       SUB_WEB_ConsoleMessageGetSource_XML_0001
    * @tc.desc         test onConsole GetSource XML
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testWebConsoleMessageSourceXMLStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testWebConsoleMessageSourceXML0001', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testWebConsoleMessageSourceXML0001', 0, 160600, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebConsoleMessageSourceTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testWebConsoleMessageSourceJAVASCRIPTStatic0001
    * @tc.number       SUB_WEB_ConsoleMessageGetSource_JAVASCRIPT_0001
    * @tc.desc         test onConsole GetSource JAVASCRIPT
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testWebConsoleMessageSourceJAVASCRIPTStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testWebConsoleMessageSourceJAVASCRIPT0001', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testWebConsoleMessageSourceJAVASCRIPT0001', 1, 160601, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebConsoleMessageSourceTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testWebConsoleMessageSourceNETWORKStatic0001
    * @tc.number       SUB_WEB_ConsoleMessageGetSource_NETWORK_0001
    * @tc.desc         test onConsole GetSource NETWORK
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testWebConsoleMessageSourceNETWORKStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testWebConsoleMessageSourceNETWORK0001', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testWebConsoleMessageSourceNETWORK0001', 2, 160602, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebConsoleMessageSourceTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testWebConsoleMessageSourceCONSOLE_APIStatic0001
    * @tc.number       SUB_WEB_ConsoleMessageGetSource_CONSOLE_API_0001
    * @tc.desc         test onConsole GetSource CONSOLE_API
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testWebConsoleMessageSourceCONSOLE_APIStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testWebConsoleMessageSourceCONSOLE_API0001', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testWebConsoleMessageSourceCONSOLE_API0001', 3, 160603, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebConsoleMessageSourceTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testWebConsoleMessageSourceSTORAGEStatic0001
    * @tc.number       SUB_WEB_ConsoleMessageGetSource_STORAGE_0001
    * @tc.desc         test onConsole GetSource STORAGE
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testWebConsoleMessageSourceSTORAGEStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testWebConsoleMessageSourceSTORAGE0001', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testWebConsoleMessageSourceSTORAGE0001', 4, 160604, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebConsoleMessageSourceTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testWebConsoleMessageSourceRENDERINGStatic0001
    * @tc.number       SUB_WEB_ConsoleMessageGetSource_RENDERING_0001
    * @tc.desc         test onConsole GetSource RENDERING
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testWebConsoleMessageSourceRENDERINGStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testWebConsoleMessageSourceRENDERING0001', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testWebConsoleMessageSourceRENDERING0001', 5, 160605, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebConsoleMessageSourceTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testWebConsoleMessageSourceSECURITYStatic0001
    * @tc.number       SUB_WEB_ConsoleMessageGetSource_SECURITY_0001
    * @tc.desc         test onConsole GetSource SECURITY
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testWebConsoleMessageSourceSECURITYStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testWebConsoleMessageSourceSECURITY0001', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testWebConsoleMessageSourceSECURITY0001', 6, 160606, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebConsoleMessageSourceTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testWebConsoleMessageSourceOTHERStatic0001
    * @tc.number       SUB_WEB_ConsoleMessageGetSource_OTHER_0001
    * @tc.desc         test onConsole GetSource OTHER
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testWebConsoleMessageSourceOTHERStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testWebConsoleMessageSourceOTHER0001', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testWebConsoleMessageSourceOTHER0001', 7, 160607, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebConsoleMessageSourceTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testWebConsoleMessageSourceDEPRECATIONStatic0001
    * @tc.number       SUB_WEB_ConsoleMessageGetSource_DEPRECATION_0001
    * @tc.desc         test onConsole GetSource DEPRECATION
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testWebConsoleMessageSourceDEPRECATIONStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testWebConsoleMessageSourceDEPRECATION0001', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testWebConsoleMessageSourceDEPRECATION0001', 8, 160608, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebConsoleMessageSourceTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testWebConsoleMessageSourceWORKERStatic0001
    * @tc.number       SUB_WEB_ConsoleMessageGetSource_WORKER_0001
    * @tc.desc         test onConsole GetSource WORKER
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testWebConsoleMessageSourceWORKERStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testWebConsoleMessageSourceWORKER0001', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testWebConsoleMessageSourceWORKER0001', 9, 160609, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebConsoleMessageSourceTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testWebConsoleMessageSourceVIOLATIONStatic0001
    * @tc.number       SUB_WEB_ConsoleMessageGetSource_VIOLATION_0001
    * @tc.desc         test onConsole GetSource VIOLATION
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testWebConsoleMessageSourceVIOLATIONStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testWebConsoleMessageSourceVIOLATION0001', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testWebConsoleMessageSourceVIOLATION0001', 10, 160610, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebConsoleMessageSourceTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testWebConsoleMessageSourceINTERVENTIONStatic0001
    * @tc.number       SUB_WEB_ConsoleMessageGetSource_INTERVENTION_0001
    * @tc.desc         test onConsole GetSource INTERVENTION
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testWebConsoleMessageSourceINTERVENTIONStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testWebConsoleMessageSourceINTERVENTION0001', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testWebConsoleMessageSourceINTERVENTION0001', 11, 160611, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebConsoleMessageSourceTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testWebConsoleMessageSourceRECOMMENDATIONStatic0001
    * @tc.number       SUB_WEB_ConsoleMessageGetSource_RECOMMENDATION_0001
    * @tc.desc         test onConsole GetSource RECOMMENDATION
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testWebConsoleMessageSourceRECOMMENDATIONStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testWebConsoleMessageSourceRECOMMENDATION0001', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testWebConsoleMessageSourceRECOMMENDATION0001', 12, 160612, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebConsoleMessageSourceTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })
  })
}
