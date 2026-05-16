/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { expect, afterEach, beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../src/test/Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest';

let testAbilityContext:common.UIAbilityContext;
export default function webBlankScreenDetectionMethodJsunit() {
  describe('WebBlankScreenDetectionMethodTest',  () =>{
    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000)
      console.log("App start")
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName:"entry",
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
          console.log("onAbilityCreate end")
        },
      }, (err : BusinessError | null) : void => {
        if (err != null ) {
          console.log("-----" + err.code)
        }
        console.log("BusinessError  end")
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.pageBaseRendering.test.static")
      await Utils.msSleep(2000)
      console.log("beforeAll end,%s", "Succeed!")
    });

    beforeEach(async  () =>{
      await Utils.msSleep(2000);
      console.info("blurMode beforeEach start");
    })

    /**
     * @tc.name   testWebBlankScreenDetectionMethodStatic00
     * @tc.number SUB_WEB_WEBBLANKSCREENDETECTIONMETHOD_0000
     * @tc.desc   test BlankScreenDetectionMethod.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testWebBlankScreenDetectionMethodStatic00',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000)
      Utils.emitEvent("testWebBlankScreenDetectionMethod00", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testWebBlankScreenDetectionMethod00",0,20260310,done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('WebBlankScreenDetectionMethodButton',10,'');
      console.info(`testWebBlankScreenDetectionMethod00 finish`);
      await Utils.msSleep(2000)
      done();
    })

    /**
     * @tc.name   testWebBlankScreenDetectionMethodStatic01
     * @tc.number SUB_WEB_WEBBLANKSCREENDETECTIONMETHOD_0001
     * @tc.desc   test BlankScreenDetectionMethod.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testWebBlankScreenDetectionMethodStatic01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000)
      Utils.emitEvent("testWebBlankScreenDetectionMethod01", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testWebBlankScreenDetectionMethod01",'https://www.example.com/',20260311,done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('WebBlankScreenDetectionMethodButton',10,'');
      console.info(`testWebBlankScreenDetectionMethod01 finish`);
      await Utils.msSleep(2000)
      done();
    })

    /**
     * @tc.name   testWebBlankScreenDetectionMethodStatic02
     * @tc.number SUB_WEB_WEBBLANKSCREENDETECTIONMETHOD_0002
     * @tc.desc   test BlankScreenDetectionMethod.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testWebBlankScreenDetectionMethodStatic02',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000)
      Utils.emitEvent("testWebBlankScreenDetectionMethod02", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testWebBlankScreenDetectionMethod02",true,20260312,done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('WebBlankScreenDetectionMethodButton',10,'');
      console.info(`testWebBlankScreenDetectionMethod02 finish`);
      await Utils.msSleep(2000)
      done();
    })

    /**
     * @tc.name   testWebBlankScreenDetectionMethodStatic03
     * @tc.number SUB_WEB_WEBBLANKSCREENDETECTIONMETHOD_0003
     * @tc.desc   test BlankScreenDetectionMethod.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testWebBlankScreenDetectionMethodStatic03',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000)
      Utils.emitEvent("testWebBlankScreenDetectionMethod03", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testWebBlankScreenDetectionMethod03",0,20260313,done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('WebBlankScreenDetectionMethodButton',10,'');
      console.info(`testWebBlankScreenDetectionMethod03 finish`);
      await Utils.msSleep(2000)
      done();
    })

    /**
     * @tc.name   testWebBlankScreenDetectionMethodStatic04
     * @tc.number SUB_WEB_WEBBLANKSCREENDETECTIONMETHOD_0004
     * @tc.desc   test BlankScreenDetectionMethod.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testWebBlankScreenDetectionMethodStatic04',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000)
      Utils.emitEvent("testWebBlankScreenDetectionMethod04", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testWebBlankScreenDetectionMethod04",'',20260314,done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('WebBlankScreenDetectionMethodButton',10,'');
      console.info(`testWebBlankScreenDetectionMethod04 finish`);
      await Utils.msSleep(2000)
      done();
    })

    /**
     * @tc.name   testWebBlankScreenDetectionMethodStatic05
     * @tc.number SUB_WEB_WEBBLANKSCREENDETECTIONMETHOD_0005
     * @tc.desc   test BlankScreenDetectionMethod.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testWebBlankScreenDetectionMethodStatic05',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000)
      Utils.emitEvent("testWebBlankScreenDetectionMethod05", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testWebBlankScreenDetectionMethod05",'',20260315,done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('WebBlankScreenDetectionMethodButton',10,'');
      console.info(`testWebBlankScreenDetectionMethod05 finish`);
      await Utils.msSleep(2000)
      done();
    })
  })
}
