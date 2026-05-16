/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { Level, Size, TestType, beforeAll, beforeEach, describe, it ,afterEach} from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter';
import hilog from '@ohos.hilog';
import { Driver, ON } from '@ohos.UiTest';

let testAbilityContext:common.UIAbilityContext;
export default function webOnFirstMeaningfulPaint() {
  describe('WebOnFirstMeaningfulPaintTest',  () =>{
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
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.basicrenderingtest.static")
      await Utils.msSleep(2000)
      console.log("beforeAll end,%s", "Succeed!")
    });

    beforeEach(async  () =>{
      await Utils.msSleep(2000);
      console.info("blurMode beforeEach start");
    })

    /**
     * @tc.name   testWebOnFirstMeaningfulPaintLoadUrlStatic
     * @tc.number SUB_WEB_WEBONFIRSTMEANINGFULPAINT_0000
     * @tc.desc   test OnFirstMeaningfulPaint.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testWebOnFirstMeaningfulPaintLoadUrlStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testWebOnFirstMeaningfulPaintLoadUrl', 10)
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebOnFirstMeaningfulPaintButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebOnFirstMeaningfulPaintStatic001
     * @tc.number SUB_WEB_WEBONFIRSTMEANINGFULPAINT_0100
     * @tc.desc   test OnFirstMeaningfulPaint.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testWebOnFirstMeaningfulPaintStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testWebOnFirstMeaningfulPaint001', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testWebOnFirstMeaningfulPaint001', true, 20260320, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebOnFirstMeaningfulPaintButton', 10, '');
      console.info(`testWebOnFirstMeaningfulPaint001 finish`);
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebOnFirstMeaningfulPaintStatic002
     * @tc.number SUB_WEB_WEBONFIRSTMEANINGFULPAINT_0200
     * @tc.desc   test OnFirstMeaningfulPaint.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testWebOnFirstMeaningfulPaintStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testWebOnFirstMeaningfulPaint002', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testWebOnFirstMeaningfulPaint002', true, 20260321, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebOnFirstMeaningfulPaintButton', 10, '');
      console.info(`testWebOnFirstMeaningfulPaint002 finish`);
      await Utils.msSleep(2000);
      done();
    })
  })
}
