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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from '../../../../../hypium/index';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import RectValue  from '../../../../ets/MainAbility/common/Rect';
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function grid_GridFrictionTest() {
  describe('grid_GridFrictionTest', () => {
    beforeAll(() => {
      console.info("grid_GridFrictionTest beforeAll start");
           
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("grid_GridFrictionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid_attribute/GridFrictionPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get grid_GridFrictionTest state pages: " + JSON.stringify(pages));
        if (!("GridFrictionPage" == pages.name)) {
          console.info("get grid_GridFrictionTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push grid_GridFrictionTest page error: " + err);
      }
    });

    
    
    

/**
     * @tc.number   testGridFriction_static_01
     * @tc.name     testGridFriction_static_01
     * @tc.desc     testGridFriction_static_01
     * @tc.level    Level.LEVEL0
     */
it('testGridFriction_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridFriction_static_01] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'friction', value: -1
      })
      await CommonFunc.sleep(2000);
      let gridContainerStrJson = inspector.getInspectorByKey('Grid_GridFriction');
      expect(JSON.parseJsonElement(gridContainerStrJson).getString('$type')).assertEqual('Grid');
      console.info('[testGridFriction] gridContainerStrJson friction: ' +
      JSON.parseJsonElement(gridContainerStrJson).getElement('$attrs').getDouble('friction'));
      let gridDefJson = inspector.getInspectorByKey('grid_friction_default');
      console.info('[testGridFriction] gridDefJson friction: ' +
      JSON.parseJsonElement(gridDefJson).getElement('$attrs').getDouble('friction'));
      expect(JSON.parseJsonElement(gridContainerStrJson).getElement('$attrs').getDouble('friction'))
        .assertEqual(JSON.parseJsonElement(gridDefJson).getElement('$attrs').getDouble('friction'));
      console.info('[testGridFriction_static_01] END');
      done();
    });

    
    
    

/**
     * @tc.number   testGridFriction_static_02
     * @tc.name     testGridFriction_static_02
     * @tc.desc     testGridFriction_static_02
     * @tc.level    Level.LEVEL0
     */
it('testGridFriction_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testGridFriction_static_02] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'friction', value: 10
      })
      await CommonFunc.sleep(2000);
      let gridContainerStrJson = inspector.getInspectorByKey('Grid_GridFriction');
     expect(JSON.parseJsonElement(gridContainerStrJson).getString('$type')).assertEqual('Grid');
     expect(JSON.parseJsonElement(gridContainerStrJson).getElement('$attrs').getDouble('friction')).assertEqual(10);
      console.info('[testGridFriction_static_02] END');
      done();
    });
  })


}
