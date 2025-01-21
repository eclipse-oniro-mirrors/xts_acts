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
import CommonFunc from '../../MainAbility/utils/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function onSelectionChange15() {
  describe('onSelectionChange15', function () {
    beforeEach(async function (done) {
      console.info("onSelectionChange15 beforeEach start");
      let options = {
        url: 'MainAbility/pages/onSelectionChange/onSelectionChange15',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onSelectionChange15 state pages:" + JSON.stringify(pages));
        if (!("onSelectionChange15" == pages.name)) {
          console.info("get onSelectionChange15 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push onSelectionChange15 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onSelectionChange15 page error:" + err);
      }
      console.info("onSelectionChange15 beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("onSelectionChange15 after each called");
    });
    /**
     * @tc.number    SUB_ACE_onSelectionChange15_0100
     * @tc.name      testRichEditor
     * @tc.desc      Determine whether the cursor change triggers onSelectionChange
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('onSelectionChange15_0100', 0, async function (done) {
      console.info('[onSelectionChange15_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let richEditor = await driver.findComponent(ON.id('onSelectionChange15_RichEditor'));
      await richEditor.click();
      await CommonFunc.sleep(1000);

      let text0 = getInspectorByKey('onSelectionChange15_text1');
      let Obj0 = JSON.parse(text0);
      expect(Obj0.$attrs.content).assertEqual('1');

      let btn1 = await driver.findComponent(ON.id('onSelectionChange15_btn1'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let text1_1 = getInspectorByKey('onSelectionChange15_text1');
      let Obj1_1 = JSON.parse(text1_1);
      expect(Obj1_1.$attrs.content).assertEqual('2');
      let text2_1 = getInspectorByKey('onSelectionChange15_text2');
      let Obj2_1 = JSON.parse(text2_1);
      expect(Obj2_1.$attrs.content).assertEqual('3');
      let text3_1 = getInspectorByKey('onSelectionChange15_text3');
      let Obj3_1 = JSON.parse(text3_1);
      expect(Obj3_1.$attrs.content).assertEqual('3');


      console.info('[onSelectionChange15_0100] END');
      done();
    });

  })
}
