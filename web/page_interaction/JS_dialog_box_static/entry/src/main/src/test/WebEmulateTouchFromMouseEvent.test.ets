/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';

let testAbilityContext: common.UIAbilityContext;

export default function WebKeyboardAvoidMode() {

  describe('WebKeyboardAvoidMode', () => {

    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000)
      console.log("App start")
    });

    beforeEach(async () => {
      await Utils.msSleep(5000);
      console.info('beforeEach start');
    })

    /**
     * @tc.name   testWebEmulateTouchFromMouseEvent001
     * @tc.number SUB_WEB_EMULATETOUCHFROMMOUSE_0100
     * @tc.desc   test EmulateTouchFromMouse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebEmulateTouchFromMouseEvent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitWebEmulateTouchFromMouseEvent001', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testWebEmulateTouchFromMouseEvent001', "emulateTouchFromMouseEvent", 2026323105, done);
      inspector.sendEventByKey('emulateTouchFromMouseEvent', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebKeyboardAvoidMode001
     * @tc.number SUB_WEB_WEBKEYBOARD_AVOIDMODE_0100
     * @tc.desc   test WebKeyboardAvoidMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebKeyboardAvoidMode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitWebKeyboardAvoidMode001', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebKeyboardAvoidMode001', 0, 2026323101, done);
        inspector.sendEventByKey('emulateTouchFromMouseEvent', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testWebKeyboardAvoidMode002
     * @tc.number SUB_WEB_WEBKEYBOARD_AVOIDMODE_0200
     * @tc.desc   test WebKeyboardAvoidMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebKeyboardAvoidMode002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitWebKeyboardAvoidMode002', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebKeyboardAvoidMode002', 1, 2026323102, done);
        inspector.sendEventByKey('emulateTouchFromMouseEvent', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testWebKeyboardAvoidMode003
     * @tc.number SUB_WEB_WEBKEYBOARD_AVOIDMODE_0300
     * @tc.desc   test WebKeyboardAvoidMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebKeyboardAvoidMode003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitWebKeyboardAvoidMode003', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebKeyboardAvoidMode003', 2, 2026323103, done);
        inspector.sendEventByKey('emulateTouchFromMouseEvent', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testWebKeyboardAvoidMode004
     * @tc.number SUB_WEB_WEBKEYBOARD_AVOIDMODE_0400
     * @tc.desc   test WebKeyboardAvoidMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebKeyboardAvoidMode004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitWebKeyboardAvoidMode004', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testWebKeyboardAvoidMode004', 3, 2026323104, done);
        inspector.sendEventByKey('emulateTouchFromMouseEvent', 10, '');
        await Utils.msSleep(2000);
        done();
      })
	  
	/**
     * @tc.name   SwitchNextPageSaveImageStatic
     * @tc.number SUB_WEB_NEXTPAGE_STATIC_0200
     * @tc.desc   switchNextPage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SwitchNextPageSaveImageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('SwitchNextPageSaveImageStatic', 10)
        await Utils.msSleep(1000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(1000);
        let button = await driver.findComponent(ON.id('buttonEnumAndFontLibrary'));
        await Utils.msSleep(1000);
        button?.click();
        await Utils.msSleep(4000)
        done()
      })
  })
}
