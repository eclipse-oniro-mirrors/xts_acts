/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, MouseButton , WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';


export default function ChipAction2() {
  describe('ChipAction2', () => {
    beforeEach(async (done: Function) => {
      console.info("search_caret beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Chip/ChipAction2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ChipAction2 state pages: " + JSON.stringify(pages));
        if (!("ChipAction2" == pages.name)) {
          console.info("get ChipAction2 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ChipAction2 page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ChipAction2 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /* *
      * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_CHIP_INTERFACE_0940
      * @tc.name  : ChipAction2_001
      * @tc.desc  : set enabled to false and action event test
      * @tc.level : Level 3
      */
    it('ChipAction2_001', 0, async (done:Function)=> {

      console.info('ChipAction2_001 START');
      let ChipActionCol = CommonFunc.getComponentRect('ChipAction2Col');
      await CommonFunc.sleep(200);
      let right = ChipActionCol.right - vp2px(22);
      let top = ChipActionCol.top + vp2px(18);
      await CommonFunc.sleep(200);
      console.info('ChipAction2_001 right：' + right + 'top:' + top);
      let driver = Driver.create();
      await driver.mouseClick({ x: Math.round(right) , y: Math.round(top) }, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(1000);
      console.info('ChipAction2_001 click success');

      let strJson1 = getInspectorByKey('ChipAction2');
      let obj2: ESObject = JSON.parse(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[ChipAction2_001] component obj is: " + JSON.stringify(JSON.parse(strJson1)));
      expect(obj2.$attrs.content).assertEqual('');
      console.info('[ChipAction2_001] END');

      done();
    });


  })
}
