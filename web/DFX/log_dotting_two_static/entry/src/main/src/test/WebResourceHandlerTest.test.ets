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
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';


let testAbilityContext:common.UIAbilityContext;

export default function webResourceHandlerTest() {

  describe('webResourceHandlerTest', ():void => {

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
     * @tc.name        testWebNavigationTypeStatic001
     * @tc.number      SUB_WEB_WEBNAVIGATIONTYPE_0100
     * @tc.desc        test webNavigationType MAIN_FRAME_NEW_ENTRY
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testWebNavigationTypeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent('testWebNavigationType001', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testWebNavigationType001', true, 202503212, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webView', 10, '');
      await Utils.msSleep(6000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBNAVIGATIONTYPE_0200
    * @tc.name       : testWebNavigationTypeStatic002
    * @tc.desc       : test webNavigationType MAIN_FRAME_EXISTING_ENTRY
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testWebNavigationTypeStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('testWebNavigationType002', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testWebNavigationType002', true, 202503213, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webView', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /*
    * @tc.number     : SUB_WEB_WEBNAVIGATIONTYPE_0300
    * @tc.name       : testWebNavigationTypeStatic003
    * @tc.desc       : test webNavigationType NAVIGATION_TYPE_NEW_SUBFRAME
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testWebNavigationTypeStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('testWebNavigationType003', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testWebNavigationType003', true, 202503214, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webView', 10, '');
      await Utils.msSleep(6000);
      done()
    })
  })
}
