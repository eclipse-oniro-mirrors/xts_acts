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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';


export default function SheetTransition() {
  describe('SheetTransition', () => {
    beforeEach(async (done: Function) => {
      console.info("SheetTransition beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/bindSheet/SheetTransition',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SheetTransition state pages: " + JSON.stringify(pages));
        if (!("SheetTransition" == pages.name)) {
          console.info("get SheetTransition state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push SheetTransition success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SheetTransition page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0350
    * @tc.name  : SheetTransition_0100
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('SheetTransition_0100', 0, async (done: Function) => {
      console.info('SheetTransition_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('SheetTransition'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('SheetTypeValue');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[SheetTransition_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[SheetTransition_0100] title: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual("value SheetType:0");

      let size = await driver.getDisplaySize();
      let sizeX = size.x;
      console.info("[SheetTransition_0100] size x is: " + JSON.stringify(sizeX));
      await CommonFunc.sleep(1000);

      let strJson2 = getInspectorByKey('WidthValue');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[SheetTransition_0100] component obj2 is: " + JSON.stringify(obj2));
      console.info("[SheetTransition_0100] title: " + JSON.stringify(obj2.$attrs.content));
      

      expect(obj2.$attrs.content).assertEqual("value Width:" + sizeX);

      console.info('[SheetTransition_0100] END');
      done();
    });


  })
}

