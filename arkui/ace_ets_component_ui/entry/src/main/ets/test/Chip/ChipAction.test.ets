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
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, MouseButton , WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';


export default function ChipAction() {
  describe('ChipAction', function () {
    beforeEach(async function (done) {
      console.info("search_caret beforeEach start");
      let options = {
        uri: 'MainAbility/pages/Chip/ChipAction',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ChipAction state pages: " + JSON.stringify(pages));
        if (!("ChipAction" == pages.name)) {
          console.info("get ChipAction state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ChipAction page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ChipAction page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /* *
      * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_CHIP_INTERFACE_0940
      * @tc.name  : ChipAction_001
      * @tc.desc  : action event test
      * @tc.level : Level 3
      */
    it('ChipAction_001', 0, async (done:Function)=> {

      console.info('ChipAction_001 START');
      let ChipActionCol = CommonFunc.getComponentRect('ChipActionCol');
      await CommonFunc.sleep(200);
      let right = ChipActionCol.right - vp2px(22);
      let top = ChipActionCol.top + vp2px(18);
      await CommonFunc.sleep(200);
      console.info('ChipAction_001 right：' + right + 'top:' + top);
      let driver = Driver.create();
      await driver.mouseClick({ x: Math.round(right) , y: Math.round(top) }, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(1000);
      console.info('ChipAction_001 click success');

      let strJson1 = getInspectorByKey('ChipAction');
      let obj2 = JSON.parse(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[ChipAction_001] component obj is: " + JSON.stringify(JSON.parse(strJson1)));
      expect(obj2.$attrs.content).assertEqual('action');
      console.info('[ChipAction_001] END');

      done();
    });


  })
}
