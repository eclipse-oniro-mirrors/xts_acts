/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

const driver = Driver.create();
export default function WebViewEnumAndSetWebController() {

    describe('WebViewEnumAndSetWebControllerTest', () => {
      beforeAll(async (): Promise<void> => {
        console.info('app start');
      });
      beforeEach(async () => {
        await Utils.msSleep(2000);
        console.info('web beforeEach start');
      })


    /**
     * @tc.name   testCacheModeStatic002
     * @tc.number SUB_WEB_CACHEMODE_0200
     * @tc.desc   test cacheMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCacheModeStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(3000);
      Utils.emitEvent("emitCacheModeOnly", 141711)
      Utils.registerEvent("testCacheMode002", "cacheError", 141740, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('buttonEnumAndSetWebController', 10, '');
      await Utils.msSleep(3000);
      done();
    })
    /**
     * @tc.name   testCacheModeStatic001
     * @tc.number SUB_WEB_CACHEMODE_0100
     * @tc.desc   test CacheMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCacheModeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("emitCacheModeDefault", 141711)
      Utils.registerEvent("testCacheMode001", 'null', 141750, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('buttonEnumAndSetWebController', 10, '');
      await Utils.msSleep(3000);
      done();
    })

    /**
     * @tc.name   testCacheModeStatic003
     * @tc.number SUB_WEB_CACHEMODE_0300
     * @tc.desc   test CacheMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCacheModeStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(3000);
      Utils.emitEvent("emitCacheModeOnline", 141711)
      Utils.registerEvent("testCacheMode003", true, 141760, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('buttonEnumAndSetWebController', 10, '');
      await Utils.msSleep(3000);
      done();
    })

    /**
     * @tc.name   testCacheModeStatic004
     * @tc.number SUB_WEB_CACHEMODE_0400
     * @tc.desc   test CacheMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCacheModeStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitCacheModeNone", 141711)
      Utils.registerEvent("testCacheMode004", "Example Domain", 141770, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('buttonEnumAndSetWebController', 10, '');
      await Utils.msSleep(3000);
      done();
    })
      /**
      * @tc.name         SwitchNextPageStatic
      * @tc.number       SUB_WEB_ONHTTPERRORRECEIVE_05001
      * @tc.desc         test SwitchNextPageStatic
      * @tc.size         MediumTest
      * @tc.type         Function
      * @tc.level        LEVEL0
      */
      it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
        async (done: () => void): Promise<void> => {
          await Utils.msSleep(2000);
          Utils.emitEvent('SwitchNextPageStatic', 141711)
          await Utils.msSleep(2000);
          inspector.sendEventByKey('buttonEnumAndSetWebController', 10, '');
          await Utils.msSleep(3000);
          done()
        })
  })
}
