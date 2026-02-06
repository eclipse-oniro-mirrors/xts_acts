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
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';


export default function springBack() {
  describe('springBack', () => {
    beforeEach(async (done: Function) => {
      console.info("springBack beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/bindSheet/springBack',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get springBack state pages: " + JSON.stringify(pages));
        if (!("springBack" == pages.name)) {
          console.info("get springBack state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push springBack success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push springBack page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0350
    * @tc.name  : springBack_0100
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('springBack_0100', Level.LEVEL0, async (done: Function) => {
      console.info('springBack_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('RegisterSpringback'));
      await button.click();
      await CommonFunc.sleep(1000);

      let bindSheetButton: Component = await driver.findComponent(ON.id('springBackButton'));
      let point = await bindSheetButton.getBoundsCenter();
      console.log("bindSheetButton-X " + point.x + " bindSheetButton-Y " + point.y)
      let x1 = Math.round(point.x)
      let y1 = Math.round(point.y)
      let y2 = Math.round(point.y + vp2px(150))
      let stepLen = Math.round(vp2px(30))
      await driver.fling({x: x1, y: y1},{x: x1, y: y2}, stepLen, 3000);
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('onWillSpringBackWhenDismiss');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[springBack_0100] component obj is: " + JSON.stringify(obj));
      console.info("[springBack_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("springBack success");

      let strJson2 = getInspectorByKey('Dismiss_3');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[springBack_0100] component obj2 is: " + JSON.stringify(obj2));
      console.info("[springBack_0100] title: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual("reason: 3");

      console.info('[springBack_0100] END');
      done();
    });


  })
}