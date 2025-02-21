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
import router from '@system.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';


export default function OnClick1() {
  describe('OnClick1', function () {
    beforeEach(async function (done) {
      console.info("OnClick1 beforeEach start");
      let options = {
        uri: 'MainAbility/pages/Gesture/OnClick1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get OnClick1 state pages: " + JSON.stringify(pages));
        if (!("OnClick1" == pages.name)) {
          console.info("get OnClick1 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push OnClick1 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OnClick1 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0350
    * @tc.name  : OnClick1_0100
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('OnClick1_0100', 0, async function (done) {
      await CommonFunc.sleep(1000);
      console.info('OnClick1_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Click1');
      let obj = JSON.parse(strJson);
      console.info("[OnClick1_0100] component obj is: " + JSON.stringify(obj));
      console.info("[OnClick1_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('RotationGesture angle:90');
      console.info('[OnClick1_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0360
    * @tc.name  : OnClick1_0200
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('OnClick1_0200', 0, async function (done) {
      console.info('OnClick1_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let Column = await driver.findComponent(ON.id('OnClick1'));
      await Column.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Click2');
      let obj = JSON.parse(strJson);
      console.info("[OnClick1_0200] component obj is: " + JSON.stringify(obj));
      console.info("[OnClick1_0200] title: " + JSON.stringify(obj.$attrs.content));
      expect((Number(obj.$attrs.content) - 100) < 10).assertEqual(true);
      console.info('[OnClick1_0200] END');
      done();
    });

  })
}

