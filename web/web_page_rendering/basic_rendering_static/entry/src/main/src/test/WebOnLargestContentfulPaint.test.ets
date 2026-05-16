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
export default function webOnLargestContentfulPaint() {
  describe('WebOnLargestContentfulPaintTest',  () =>{
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
     * @tc.name   testWebOnLargestContentfulPaintLoadUrlStatic
     * @tc.number SUB_WEB_WEBONLARGESTCONTENTFULPAINT_0000
     * @tc.desc   test OnLargestContentfulPaint.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testWebOnLargestContentfulPaintLoadUrlStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testWebOnLargestContentfulPaintLoadUrl', 10)
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebOnLargestContentfulPaintButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebOnLargestContentfulPaintStatic001
     * @tc.number SUB_WEB_WEBONLARGESTCONTENTFULPAINT_0100
     * @tc.desc   test OnLargestContentfulPaint.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testWebOnLargestContentfulPaintStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      inspector.sendEventByKey('loadUrlButton', 10, '');
      await Utils.msSleep(2000);
      Utils.emitEvent('testWebOnLargestContentfulPaint001', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testWebOnLargestContentfulPaint001', true, 20260314, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebOnLargestContentfulPaintButton', 10, '');
      console.info(`testWebOnLargestContentfulPaint001 finish`);
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebOnLargestContentfulPaintStatic002
     * @tc.number SUB_WEB_WEBONLARGESTCONTENTFULPAINT_0200
     * @tc.desc   test OnLargestContentfulPaint.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testWebOnLargestContentfulPaintStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testWebOnLargestContentfulPaint002', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testWebOnLargestContentfulPaint002', true, 20260315, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebOnLargestContentfulPaintButton', 10, '');
      console.info(`testWebOnLargestContentfulPaint002 finish`);
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebOnLargestContentfulPaintStatic003
     * @tc.number SUB_WEB_WEBONLARGESTCONTENTFULPAINT_0300
     * @tc.desc   test OnLargestContentfulPaint.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testWebOnLargestContentfulPaintStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testWebOnLargestContentfulPaint003', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testWebOnLargestContentfulPaint003', true, 20260316, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebOnLargestContentfulPaintButton', 10, '');
      console.info(`testWebOnLargestContentfulPaint003 finish`);
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebOnLargestContentfulPaintStatic004
     * @tc.number SUB_WEB_WEBONLARGESTCONTENTFULPAINT_0400
     * @tc.desc   test OnLargestContentfulPaint.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testWebOnLargestContentfulPaintStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testWebOnLargestContentfulPaint004', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testWebOnLargestContentfulPaint004', true, 20260317, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebOnLargestContentfulPaintButton', 10, '');
      console.info(`testWebOnLargestContentfulPaint004 finish`);
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebOnLargestContentfulPaintStatic005
     * @tc.number SUB_WEB_WEBONLARGESTCONTENTFULPAINT_0500
     * @tc.desc   test OnLargestContentfulPaint.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testWebOnLargestContentfulPaintStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testWebOnLargestContentfulPaint005', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testWebOnLargestContentfulPaint005', true, 20260318, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebOnLargestContentfulPaintButton', 10, '');
      console.info(`testWebOnLargestContentfulPaint005 finish`);
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebOnLargestContentfulPaintStatic006
     * @tc.number SUB_WEB_WEBONLARGESTCONTENTFULPAINT_0600
     * @tc.desc   test OnLargestContentfulPaint.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testWebOnLargestContentfulPaintStatic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testWebOnLargestContentfulPaint006', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testWebOnLargestContentfulPaint006', true, 20260319, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebOnLargestContentfulPaintButton', 10, '');
      console.info(`testWebOnLargestContentfulPaint006 finish`);
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   emitonSwitchNextPage
     * @tc.number SUB_WEB_WEBONLARGESTCONTENTFULPAINT_0700
     * @tc.desc   PAGE_REDIRECT
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('emitonSwitchNextPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitonSwitchNextPage', 10)
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebOnLargestContentfulPaintButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
  })
}
