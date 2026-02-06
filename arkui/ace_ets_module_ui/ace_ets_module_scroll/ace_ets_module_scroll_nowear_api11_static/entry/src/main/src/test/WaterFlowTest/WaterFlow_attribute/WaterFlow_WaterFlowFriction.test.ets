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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { UtilsTest, startAbility } from '../../Util.test';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { MessageManager, Message } from '../../../../ets/MainAbility/common/MessageManager';

export default function waterFlow_WaterFlowFrictionTest() {
  describe('waterFlow_WaterFlowFrictionTest', () => {
    beforeAll(() => {
      console.info("waterFlow_WaterFlowFrictionTest beforeEach start");
      await UtilsTest.msSleep(4000);
      await startAbility("com.arkui.ace.scroll.nowear.api11.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("WaterFlowFrictionPage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WaterFlow/WaterFlow_attribute/WaterFlowFrictionPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get WaterFlowFrictionPage state pages:" + JSON.stringify(pages));
        if (!("WaterFlowFrictionPage" == pages.name)) {
          console.info("get WaterFlow_WaterFlow pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push WaterFlowFrictionPage page error:" + err);
      }
      console.info("WaterFlowFrictionPage beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("WaterFlow_WaterFlowFrictionTest after each called");
    });
    
    
/**
     * @tc.number   testWaterFlowFriction_static_0100
     * @tc.name     testWaterFlowFriction_static_0100
     * @tc.desc     testWaterFlowFriction_static_0100
     * @tc.level    Level.LEVEL1
     */
it('testWaterFlowFriction_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> =>{
      console.info('[testWaterFlowFriction_static_0100] START');
      const messageManager = AppStorage.get<MessageManager<number>>('messageManager')
      if (messageManager !== undefined) {
        messageManager?.notify({name:'friction', value:-1} as Message<number>)

      }
      await CommonFunc.sleep(2000);
      let scrollContainerStrJson = inspector.getInspectorByKey('WaterFlow_WaterFlowFriction');
      let scrollContainerObj = JSON.parseJsonElement(scrollContainerStrJson);
      expect(scrollContainerObj.getString('$type')).assertEqual('WaterFlow');
      console.info('[testWaterFlowFriction_static_0100] scrollContainerObj friction: ' + scrollContainerObj.getElement('$attrs').getDouble('friction'));

      let flowDefJson = inspector.getInspectorByKey('waterFlow_friction_default');
      let flowDefObj = JSON.parseJsonElement(flowDefJson);
      console.info('[testWaterFlowFriction_static_0100] flowDefObj friction: ' + flowDefObj.getElement('$attrs').getDouble('friction'));
      expect(scrollContainerObj.getElement('$attrs').getDouble('friction')).assertEqual(flowDefObj.getElement('$attrs').getDouble('friction'));
      console.info('[testWaterFlowFriction_static_0100] END');
      done();
    });

    
    
/**
     * @tc.number   testWaterFlowFriction_static_0200
     * @tc.name     testWaterFlowFriction_static_0200
     * @tc.desc     testWaterFlowFriction_static_0200
     * @tc.level    Level.LEVEL1
     */
it('testWaterFlowFriction_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> =>{
      console.info('[testWaterFlowFriction_static_0200] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({name:'friction', value:10})
      await CommonFunc.sleep(2000);
      let scrollContainerStrJson = inspector.getInspectorByKey('WaterFlow_WaterFlowFriction');
      let scrollContainerObj = JSON.parseJsonElement(scrollContainerStrJson);
      expect(scrollContainerObj.getString('$type')).assertEqual('WaterFlow');
      expect(scrollContainerObj.getElement('$attrs').getDouble('friction')).assertEqual(10);
      console.info('[testWaterFlowFriction_static_0200] END');
      done();
    });
  })


}
