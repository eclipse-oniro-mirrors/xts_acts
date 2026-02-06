'use static';
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { startAbility, UtilsTest } from '../Util.test'

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function GridNodeTest() {
  describe('GridNodeTest', () => {
    beforeAll(() => {
      console.info("GridNodeTest beforeEach start");

      
      await UtilsTest.startAbility("com.arkui.ace.scroll14.static", "EntryAbility");
      
    });
    beforeEach(async (): Promise<void> => {
      console.info('gridNodeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/gridNode',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info('get gridNode state pages: ' + JSON.stringify(pages));
        if (!('gridNode' == pages.name)) {
          console.info('get gridNode pages.name: ' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push gridNode page error: ' + err);
      }

      await CommonFunc.sleep(1000)
      console.info('gridNode beforeEach end');
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('gridNode after each called');
    })


    
    /**
     * @tc.number   gridNode0100_static_01
     * @tc.name     gridNode0100_static_01
     * @tc.desc     gridNode0100_static_01
     * @tc.level    Level.LEVEL0
     */
it('gridNode0100_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {

      let tagName = 'gridNode0100_static_01';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = inspector.getInspectorByKey('key_ grid_001');
      console.info('[' + tagName + '] Search is: ' +
      JSON.parseJsonElement(strJsonNew).getString('$type'));
      expect(JSON.parseJsonElement(strJsonNew).getString('$type')).assertEqual('Grid');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

  })
}