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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';

export default function TouchTestStrategy() {
  describe('TouchTestStrategy', () => {
    beforeEach(async (done: Function) => {
      console.info("TouchTestStrategy beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/TouchTestStrategy',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TouchTestStrategy state pages: " + JSON.stringify(pages));
        if (!("TouchTestStrategy" == pages.name)) {
          console.info("get TouchTestStrategy state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push TouchTestStrategy success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TouchTestStrategy page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_TOUCHTEST_TOUCHTESTSTRATEGY_0010
    * @tc.name  : TouchTestStrategy_0100
    * @tc.desc  : Specify the component to do touch test and follow the framework touch test.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('TouchTestStrategy_0100', 0, async (done: Function) => {
      console.info('TouchTestStrategy_0100 START');
      await CommonFunc.sleep(1000);
      let gridTop = CommonFunc.getComponentRect('border_TouchStrategy');
      let top = gridTop.top
      let gridBottom = CommonFunc.getComponentRect('border_TouchStrategy');
      let bottom = gridBottom.bottom
      let driver = await UiDriver.create()
      await driver.swipe(Math.round(globalThis.winLeft + vp2px(100)),Math.round(globalThis.winTop + bottom - vp2px(6)), Math.round(globalThis.winLeft + vp2px(100)), Math.round(globalThis.winTop + top + vp2px(33)));
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('listText_TouchStrategy');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TouchTestStrategy_0100] component obj is: " + JSON.stringify(obj));
      console.info("[TouchTestStrategy_0100] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Test Text is completely invisible');
      console.info('[Touch_0100] END');
      done();
    });

  })
}