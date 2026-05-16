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

export default function SetBlanklessLoadingWithKey() {
  describe('SetBlanklessLoadingWithKey', (): void => {
    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000);
      console.log('beforeAll end,%s', 'Succeed!')
    });
    beforeEach(async () => {
      console.info('web beforeEach start');
    })

    /**
     * @tc.name   testSetBlanklessLoadingWithKeyStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHKEYTEST_0100
     * @tc.desc   test setBlanklessLoadingWithKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetBlanklessLoadingWithKeyStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testSetBlanklessLoadingWithKey001', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testSetBlanklessLoadingWithKey001', 0, 148510, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('setBlanklessLoadingWithKeyTestButton', 10, '');
      await Utils.msSleep(8000);
      done()
    })

    /**
     * @tc.name   testSetBlanklessLoadingWithKeyStatic002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHKEYTEST_0200
     * @tc.desc   test setBlanklessLoadingWithKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetBlanklessLoadingWithKeyStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testSetBlanklessLoadingWithKey002', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testSetBlanklessLoadingWithKey002', -2, 148520, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('setBlanklessLoadingWithKeyTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name   testSetBlanklessLoadingWithKeyStatic003
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHKEYTEST_0300
     * @tc.desc   test setBlanklessLoadingWithKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetBlanklessLoadingWithKeyStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testSetBlanklessLoadingWithKey003', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testSetBlanklessLoadingWithKey003', -3, 148530, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('setBlanklessLoadingWithKeyTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name   testSetBlanklessLoadingWithKeyStatic004
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHKEYTEST_0400
     * @tc.desc   test setBlanklessLoadingWithKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetBlanklessLoadingWithKeyStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testSetBlanklessLoadingWithKey004', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testSetBlanklessLoadingWithKey004', -4, 148540, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('setBlanklessLoadingWithKeyTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @tc.name   testSetBlanklessLoadingWithKeyStatic005
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETBLANKLESSLOADINGWITHKEYTEST_0500
     * @tc.desc   test setBlanklessLoadingWithKey
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetBlanklessLoadingWithKeyStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('testSetBlanklessLoadingWithKey005', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('testSetBlanklessLoadingWithKey005', -5, 148550, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('setBlanklessLoadingWithKeyTestButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

  })
}