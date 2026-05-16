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


import { beforeAll, beforeEach, describe, it, Level, Size, TestType, afterEach } from '../../../hypium/index';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest';

let testAbilityContext: common.UIAbilityContext;

export default function WebAttributeTest() {

  describe('WebAttributeTest', () => {

    beforeAll(async (): Promise<void> => {
      console.log("App start")
      await Utils.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("web beforeEach start");
    })

    afterEach(async () => {
      console.info("WebAttributeTest afterEach start");
    })

    /**
     * @tc.name   testInitialScaleStatic001
     * @tc.number SUB_WEB_INITIALSCALE_0100
     * @tc.desc   test initialScale from 100 to 120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testInitialScaleStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(1500);
        Utils.emitEvent("emitInitialScale001", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testInitialScale001", 'oldScale=100,newScale=300', 70001, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebAttributeTestButton', 10, '');
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webView', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testInitialScaleStatic002
     * @tc.number SUB_WEB_INITIALSCALE_0200
     * @tc.desc   test initialScale from 100 to 80
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testInitialScaleStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent("emitInitialScale002", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testInitialScale002", 'oldScale=300,newScale=100', 70003, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebAttributeTestButton', 10, '');
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webView', 10, '');
        await Utils.msSleep(2000);
        done();
      })
  })
}
