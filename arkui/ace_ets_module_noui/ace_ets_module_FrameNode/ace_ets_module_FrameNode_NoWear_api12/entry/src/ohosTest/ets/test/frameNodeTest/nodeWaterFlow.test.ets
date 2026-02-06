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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';

export default function nodeWaterFlow() {
  describe('nodeWaterFlow', () => {
    beforeEach(async (done: Function) => {
      console.info("nodeWaterFlow beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/frameNode/nodeWaterFlow',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get nodeWaterFlow state pages: " + JSON.stringify(pages));
        if (!("nodeWaterFlow" == pages.name)) {
          console.info("get nodeWaterFlow state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push nodeWaterFlow success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push nodeWaterFlow page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info(" nodeWaterFlow after each called");
    });

    /* *
    * @tc.number: SUB_ACE_TYPENODE_WATERFLOW_0100
    * @tc.name  : nodeWaterFlow_0100
    * @tc.desc  : WaterFlow type FrameNode node
    * @tc.level : Level 1
    * @tc.type :
    * @tc.size :
    */


    it('nodeWaterFlow_0100', Level.LEVEL0, async  (done: Function) => {
      console.info('nodeWaterFlow_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let size = await driver.getDisplaySize();
      if (size.x != 466 && size.y != 466) {
        let button = await driver.findComponent(ON.type('WaterFlow'));
        let type1 = await button.getType();
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('waterFlow_node');
        let obj: ESObject = JSON.parse(strJson);
        console.info("[nodeWaterFlow_0100] component obj is: " + JSON.stringify(obj));
        expect(obj.$type).assertEqual(type1);
        console.info('[nodeWaterFlow_0100] END');
      }
      done();
    });

    /* *
    * @tc.number: SUB_ACE_TYPENODE_FLOWITEM_0200
    * @tc.name  : nodeWaterFlow_0200
    * @tc.desc  : FlowItem type FrameNode node
    * @tc.level : Level 1
    * @tc.type :
    * @tc.size :
    */


    it('nodeWaterFlow_0200', Level.LEVEL0, async  (done: Function) => {
      console.info('nodeWaterFlow_0200 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let size = await driver.getDisplaySize();
      if (size.x != 466 && size.y != 466) {
        let button = await driver.findComponent(ON.type('FlowItem'));
        let type2 = await button.getType();
        await CommonFunc.sleep(1000);
        let strJson = getInspectorByKey('flowItem_node');
        let obj: ESObject = JSON.parse(strJson);
        console.info("[nodeWaterFlow_0200] component obj is: " + JSON.stringify(obj));
        expect(obj.$type).assertEqual(type2);
        console.info('[nodeWaterFlow_0200] END');
      }
      done();
    });

  })
}