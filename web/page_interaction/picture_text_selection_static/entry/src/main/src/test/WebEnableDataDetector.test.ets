/**
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

import { Driver, ON } from '@ohos.UiTest';
import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';


let testAbilityContext: common.UIAbilityContext;


let emitKey = "";
let tcName = ''
const EVENT_ID_SET_SUITE_KEY = 176101;
const driver = Driver.create();

export default function WebWebEnableDataDetectorTest() {
    describe('WebWebEnableDataDetectorTest', ():void => {

      beforeAll(async ():Promise<void> => {
        console.log('App start')
        await Utils.msSleep(2000)
        console.log('beforeAll end,%s', 'Succeed!')
      });

      beforeEach(async () => {
        await Utils.msSleep(2000);
        console.info('beforeEach start');
      })
    /**
     * @tc.name   testWebEnableDataDetector001
     * @tc.number SUB_WEBENABLEDATADETECTOR_0100
     * @tc.desc   testWebEnableDataDetector001 callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebEnableDataDetector001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitWebEnableDataDetector", 10)
      Utils.registerEvent("testWebEnableDataDetector001", true, 176110, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebEnableDataDetectorButton',10,'');
      await Utils.msSleep(2000);
      done();
    })
  })
}