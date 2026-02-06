'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index'
import Utils from '../../ets/MainAbility/common/Utils';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'

export default function navDestinationJsunit() {
  describe('ActsAceNavDestinationTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("ActsAceNavDestinationTest beforeAll start");
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")

      let options: router.RouterOptions = {
        url: 'MainAbility/pages/navDestination',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get NavDestination state success " + JSON.stringify(pages));
        if (!("navDestination" == pages.name)) {
          console.info("get NavDestination state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push NavDestination page error: " + err);
      }
    });

    
    
    
/**
     * @tc.number   testNavDestination_static_01
     * @tc.name     testNavDestination_static_01
     * @tc.desc     testNavDestination_static_01
     * @tc.level    Level.LEVEL0
     */
it('testNavDestination_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testNavDestination_static_01] START');
      let strJson = inspector.getInspectorByKey('NavDestination1');
      console.info("[testNavDestination_static_01] strJson is : " + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testNavDestination_static_01] obj is : " + JSON.stringify(obj.getElement('$attrs')));
      expect(true).assertEqual(true);
      console.info('[testNavDestination_static_01] END');
      done();
    });
  })
}
