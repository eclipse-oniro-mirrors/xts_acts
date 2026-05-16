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

export default function SetBlanklessLoadingWithParams() {
  describe('SetBlanklessLoadingWithParams', (): void => {
    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });
    beforeEach(async () => {
      console.info('web beforeEach start');
    })

    /**
     * @tc.name   testSetBlanklessLoadingWithParamsStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHPARAMSTEST_0100
     * @tc.desc   test setBlanklessLoadingWithParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetBlanklessLoadingWithParamsStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testSetBlanklessLoadingWithParams001', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testSetBlanklessLoadingWithParams001', 0, 148510, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('setBlanklessLoadingWithParamsTestButton', 10, '');
      await Utils.msSleep(8000);
      done()
    })

    /**
     * @tc.name   testSetBlanklessLoadingWithParamsStatic002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHPARAMSTEST_0200
     * @tc.desc   test setBlanklessLoadingWithParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetBlanklessLoadingWithParamsStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testSetBlanklessLoadingWithParams002', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testSetBlanklessLoadingWithParams002', -2, 148520, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('setBlanklessLoadingWithParamsTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name   testSetBlanklessLoadingWithParamsStatic003
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHPARAMSTEST_0300
     * @tc.desc   test setBlanklessLoadingWithParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetBlanklessLoadingWithParamsStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testSetBlanklessLoadingWithParams003', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testSetBlanklessLoadingWithParams003', -3, 148530, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('setBlanklessLoadingWithParamsTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name   testSetBlanklessLoadingWithParamsStatic004
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHPARAMSTEST_0400
     * @tc.desc   test setBlanklessLoadingWithParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetBlanklessLoadingWithParamsStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testSetBlanklessLoadingWithParams004', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testSetBlanklessLoadingWithParams004', -4, 148540, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('setBlanklessLoadingWithParamsTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name   testSetBlanklessLoadingWithParamsStatic005
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHPARAMSTEST_0500
     * @tc.desc   test setBlanklessLoadingWithParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetBlanklessLoadingWithParamsStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testSetBlanklessLoadingWithParams005', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testSetBlanklessLoadingWithParams005', -5, 148550, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('setBlanklessLoadingWithParamsTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })
    /**
     * @tc.name   SwitchNextPage
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SwitchNextPage_0700
     * @tc.desc   SwitchNextPage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SwitchNextPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("emitonSwitchNextPage", 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('setBlanklessLoadingWithParamsTestButton', 10, '');
        await Utils.msSleep(5000);
        done();
      })
  })
}