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
export default function webOnFirstScreenPaint() {
  describe('WebOnFirstScreenPaintTest',  () =>{
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
     * @tc.name   testWebOnFirstScreenPaintLoadUrlStatic
     * @tc.number SUB_WEB_WEBONFIRSTSCREENPAINT_01001
     * @tc.desc   test OnFirstScreenPaint.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testWebOnFirstScreenPaintLoadUrlStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testWebOnFirstScreenPaintLoadUrl', 10)
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebOnFirstScreenPaintButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebOnFirstScreenPaintStatic001
     * @tc.number SUB_WEB_WEBONFIRSTSCREENPAINT_0100
     * @tc.desc   test OnFirstScreenPaint.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testWebOnFirstScreenPaintStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testWebOnFirstScreenPaint001', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testWebOnFirstScreenPaint001', 'resource://rawfile/4stiaozhuangbaidu.html', 20260311, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebOnFirstScreenPaintButton', 10, '');
      console.info(`testWebOnFirstScreenPaint001 finish`);
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebOnFirstScreenPaintStatic002
     * @tc.number SUB_WEB_WEBONFIRSTSCREENPAINT_0200
     * @tc.desc   test OnFirstScreenPaint.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testWebOnFirstScreenPaintStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testWebOnFirstScreenPaint002', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testWebOnFirstScreenPaint002', true, 20260312, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebOnFirstScreenPaintButton', 10, '');
      console.info(`testWebOnFirstScreenPaint002 finish`);
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebOnFirstScreenPaintStatic003
     * @tc.number SUB_WEB_WEBONFIRSTSCREENPAINT_0300
     * @tc.desc   test OnFirstScreenPaint.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testWebOnFirstScreenPaintStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testWebOnFirstScreenPaint003', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testWebOnFirstScreenPaint003', true, 20260313, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebOnFirstScreenPaintButton', 10, '');
      console.info(`testWebOnFirstScreenPaint003 finish`);
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   emitonSwitchNextPage
     * @tc.number SUB_WEB_WEBONFIRSTSCREENPAINT_0400
     * @tc.desc   PAGE_REDIRECT
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('emitonSwitchNextPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitonSwitchNextPage', 10)
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebOnFirstScreenPaintButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
  })
}
