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
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, MouseButton, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function RelativeChain12() {
  describe('RelativeChain12', () => {
    beforeEach(async (done: Function) => {
      console.info("RelativeChain12 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RelativeChain12 state pages:" + JSON.stringify(pages));
        if (!("RelativeChain12" == pages.name)) {
          console.info("get  RelativeChain12 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/RelativeContainer/RelativeChain12"})
          await CommonFunc.sleep(2000);
          console.info("push RelativeChain12 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RelativeChain12 page error:" + err);
      }
      console.info("RelativeChain12 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RelativeChain12 after each called");
    });

    /**
     * @tc.number    SUB_ACE_UI_RELATIVECONTAINER_COLLABORATION_0620
     * @tc.desc      chainMode test
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */

    it('RelativeChain12_001', 0, async (done: Function) => {
      console.info('[RelativeChain12_001] START');

      await CommonFunc.sleep(2000);
      let rel = CommonFunc.getComponentRect('RelativeChain12');
      let row1 = CommonFunc.getComponentRect('RelativeChainRow12_1');
      let row2 = CommonFunc.getComponentRect('RelativeChainRow12_2');
      let row3 = CommonFunc.getComponentRect('RelativeChainRow12_3');
      let row4 = CommonFunc.getComponentRect('RelativeChainRow12_4');
      let row5 = CommonFunc.getComponentRect('RelativeChainRow12_5');
      await CommonFunc.sleep(2000);

      console.info("[RelativeChain12_001] RelativeContainer is: " + JSON.stringify(rel) + 'row1:' + JSON.stringify(row1) + 'row2:' + JSON.stringify(row2) + 'row3:' + JSON.stringify(row3) + 'row4:' + JSON.stringify(row4) + 'row5:' + JSON.stringify(row5));

      expect(Math.abs(Math.round(row1.left - rel.left) - Math.round(row2.left - row1.right)) <= 1).assertTrue();
      expect(Math.abs(Math.round(row2.left - row1.right) - Math.round(row3.left - row2.right)) <= 1).assertTrue();
      expect(Math.abs(Math.round(row3.left - row2.right) - Math.round(rel.right - row3.right)) <= 1).assertTrue();

      expect(Math.abs(Math.round(row4.top - row2.bottom) - Math.round(row5.top - row4.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(row2.top - rel.top)) <= 1).assertTrue();
      expect(Math.abs(Math.round(row5.bottom - rel.bottom)) <= 1).assertTrue();

      console.info('[RelativeChain12_001] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_RELATIVECONTAINER_COLLABORATION_0630
     * @tc.desc      chainMode test
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */

    it('RelativeChain12_002', 0, async (done: Function) => {
      console.info('[RelativeChain12_002] START');

      await CommonFunc.sleep(1000);
      let rel = CommonFunc.getComponentRect('RelativeChain122');
      let driver: Driver = Driver.create();
      await driver.mouseClick({x: Math.round(rel.left + vp2px(50)), y: Math.round(rel.top + vp2px(80))}, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RelativeChain12Text');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RelativeChain11_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('');

      console.info('[RelativeChain12_002] END');
      done();
    });


  })
}
