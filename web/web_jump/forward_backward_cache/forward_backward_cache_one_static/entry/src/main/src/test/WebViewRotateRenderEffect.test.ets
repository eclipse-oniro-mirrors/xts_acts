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

import { beforeAll, beforeEach, afterEach, describe, it, TestType, Size, Level, expect } from '../../../hypium/index';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import emitter from '@ohos.events.emitter';

let testAbilityContext:common.UIAbilityContext;
let emitKey = ''


export default function WebViewRotateRenderEffect() {
  describe('WebViewRotateRenderEffect', (): void => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
    });
    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('web beforeEach start');
    })

    /**
     * @tc.name   testRotateRenderEffectStatic01
     * @tc.number SUB_WEB_SecurityLevel_202511011
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRotateRenderEffectStatic01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitRotateRenderEffect01', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testRotateRenderEffect01', 1, 202511011, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })


    /**
     * @tc.name   testRotateRenderEffectStatic02
     * @tc.number SUB_WEB_SecurityLevel_0202511021
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRotateRenderEffectStatic02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitRotateRenderEffect02', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testRotateRenderEffect02', 0, 202511021, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   onPageEndStatic
     * @tc.number SUB_WEB_SecurityLevel_0202511094
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onPageEndStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('onPageEnd', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('onPageEnd', 0, 202511094, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   onLoadStartedStatic
     * @tc.number SUB_WEB_SecurityLevel_0202511091
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onLoadStartedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('onLoadStarted', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('onLoadStarted', 1, 202511091, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
    * @tc.name        emitOnSwitchNextPageStatic
    * @tc.number      SUB_WEB_WEBHTTPBODYSTREAM_202511091
    * @tc.desc        change page
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       Level 0
    */
    it('emitOnSwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitonSwitchNextPage', 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done();
      })
  })
}
