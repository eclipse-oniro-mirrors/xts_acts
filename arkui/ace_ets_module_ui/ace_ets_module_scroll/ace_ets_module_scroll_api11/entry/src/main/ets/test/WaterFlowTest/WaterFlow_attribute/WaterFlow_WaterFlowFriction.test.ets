/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../../MainAbility/common/Common';
import { MessageManager,Callback } from '../../../MainAbility/common/MessageManager1';
export default function waterFlow_WaterFlowFrictionTest() {
  describe('waterFlow_WaterFlowFrictionTest', () => {
    beforeEach(async (done: Function) => {
      console.info("WaterFlowFrictionPage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WaterFlow/WaterFlow_attribute/WaterFlowFrictionPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WaterFlowFrictionPage state pages:" + JSON.stringify(pages));
        if (!("WaterFlowFrictionPage" == pages.name)) {
          console.info("get WaterFlow_WaterFlow pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push WaterFlowFrictionPage page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WaterFlowFrictionPage page error:" + err);
      }
      console.info("WaterFlowFrictionPage beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("WaterFlow_WaterFlowFrictionTest after each called");
    });
    /**
     * @tc.number    SUB_ACE_WATERFLOW_WATERFLOWFRICTION_001
     * @tc.name      testWaterFlowFriction
     * @tc.desc      set friction to -1
     */
    it('testWaterFlowFriction_0100', 0, async (done: Function) => {
      console.info('[testWaterFlowFriction_0100] START');
      globalThis.value.message.notify({name:'friction', value:-1})
      await CommonFunc.sleep(2000);
      let scrollContainerStrJson = getInspectorByKey('WaterFlow_WaterFlowFriction');
      let scrollContainerObj: ESObject = JSON.parse(scrollContainerStrJson);
      expect(scrollContainerObj.$type).assertEqual('WaterFlow');
      expect(scrollContainerObj.$attrs.friction).assertEqual(0.7);
      console.info('[testWaterFlowFriction_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_WATERFLOW_WATERFLOWFRICTION_002
     * @tc.name      testWaterFlowFriction
     * @tc.desc      set friction to 10
     */
    it('testWaterFlowFriction_0200', 0, async (done: Function) => {
      console.info('[testWaterFlowFriction_0200] START');
      globalThis.value.message.notify({name:'friction', value:10})
      await CommonFunc.sleep(2000);
      let scrollContainerStrJson = getInspectorByKey('WaterFlow_WaterFlowFriction');
      let scrollContainerObj: ESObject = JSON.parse(scrollContainerStrJson);
      expect(scrollContainerObj.$type).assertEqual('WaterFlow');
      expect(scrollContainerObj.$attrs.friction).assertEqual(10);
      console.info('[testWaterFlowFriction_0200] END');
      done();
    });
  })


}
