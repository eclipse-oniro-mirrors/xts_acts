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
import Utils from '../../src/test/Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import emitter from '@ohos.events.emitter';

let testAbilityContext:common.UIAbilityContext;
let emitKey = ''



export default function OnTitleReceive() {
  describe('OnTitleReceive', (): void => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
    });
    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('web beforeEach start');
    })


    /**
     * @tc.name   emitOnTitleReceiveStatic01
     * @tc.number SUB_WEB_SecurityLevel_202511081
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitOnTitleReceiveStatic01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitOnTitleReceive01', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitOnTitleReceive01', true, 202511081, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   emitOnTitleReceiveStatic02
     * @tc.number SUB_WEB_SecurityLevel_202511081
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitOnTitleReceiveStatic02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitOnTitleReceive02', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitOnTitleReceive02', true, 202511081, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   emitRotateRenderEffectStatic01
     * @tc.number SUB_WEB_SecurityLevel_20251101
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitRotateRenderEffectStatic01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitRotateRenderEffect01', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitRotateRenderEffect01', 'Automotive', 20251101, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })


    /**
     * @tc.name   emitRotateRenderEffectStatic02
     * @tc.number SUB_WEB_SecurityLevel_20251102
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitRotateRenderEffectStatic02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitRotateRenderEffect02', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitRotateRenderEffect02', 'Desktop', 20251102, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })
    /**
     * @tc.name   emitRotateRenderEffectStatic03
     * @tc.number SUB_WEB_SecurityLevel_20251103
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitRotateRenderEffectStatic03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitRotateRenderEffect03', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitRotateRenderEffect03', 'Mobile', 20251103, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })
    /**
     * @tc.name   emitRotateRenderEffectStatic04
     * @tc.number SUB_WEB_SecurityLevel_0004
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitRotateRenderEffectStatic04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitRotateRenderEffect04', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitRotateRenderEffect04', 'EInk', 20251104, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })
    /**
     * @tc.name   emitRotateRenderEffectStatic05
     * @tc.number SUB_WEB_SecurityLevel_20251105
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitRotateRenderEffectStatic05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitRotateRenderEffect05', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitRotateRenderEffect05', 'Tablet', 20251105, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })
    /**
     * @tc.name   emitRotateRenderEffectStatic06
     * @tc.number SUB_WEB_SecurityLevel_20251106
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitRotateRenderEffectStatic06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitRotateRenderEffect06', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitRotateRenderEffect06', 'Watch', 20251106, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })
    /**
     * @tc.name   emitRotateRenderEffectStatic07
     * @tc.number SUB_WEB_SecurityLevel_20251107
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitRotateRenderEffectStatic07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitRotateRenderEffect07', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitRotateRenderEffect07', 'XR', 20251107, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   emitRotateRenderEffectStatic08
     * @tc.number SUB_WEB_SecurityLevel_20251108
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitRotateRenderEffectStatic08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitRotateRenderEffect08', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitRotateRenderEffect08', true, 20251108, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   emitRotateRenderEffectStatic09
     * @tc.number SUB_WEB_SecurityLevel_20251109
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitRotateRenderEffectStatic09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitRotateRenderEffect09', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('emitRotateRenderEffect09', true, 20251109, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   onResourceLoadStatic
     * @tc.number SUB_WEB_SecurityLevel_202511092
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onResourceLoadStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('onResourceLoad', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('onResourceLoad', 1, 202511092, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   onLoadFinishedStatic
     * @tc.number SUB_WEB_SecurityLevel_202511093
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onLoadFinishedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('onLoadFinished', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('onLoadFinished',1, 202511093, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
     * @tc.name   onInterceptRequestStatic
     * @tc.number SUB_WEB_SecurityLevel_202511095
     * @tc.desc   test SecurityLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onInterceptRequestStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('onInterceptRequest', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('onInterceptRequest', 1, 202511095, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('web', 10, '');
        await Utils.msSleep(2000);
        done()
      })

    /**
    * @tc.name        emitonSwitchNextPageStatic
    * @tc.number      SUB_WEB_WEBHTTPBODYSTREAM_200251109
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('emitonSwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
