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
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest';
const driver = Driver.create();
let testAbilityContext:common.UIAbilityContext;


export default function webTwoJsunit() {
  describe('webTwoJsunit', (): void => {
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
     * @tc.name   onDownloadFailed
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_FOUR_API_002
     * @tc.desc   ets allow the Web access overview mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('onDownloadFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitonDownloadFailed', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('onDownloadFailed', true, 6, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webcomponenttwo', 10, '');
        await Utils.msSleep(2000);
		    done()
    })
  })
}
