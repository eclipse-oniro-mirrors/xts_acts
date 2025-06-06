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
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function onSelectionChange8() {
  describe('onSelectionChange8', () => {
    beforeEach(async (done: Function) => {
      console.info("onSelectionChange8 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/onSelectionChange8',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onSelectionChange8 state pages:" + JSON.stringify(pages));
        if (!("onSelectionChange8" == pages.name)) {
          console.info("get onSelectionChange8 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push onSelectionChange8 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onSelectionChange8 page error:" + err);
      }
      console.info("onSelectionChange8 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("onSelectionChange8 after each called");
    });
    /**
     * @tc.number    SUB_ACE_onSelectionChange8_0100
     * @tc.name      testRichEditor
     * @tc.desc      Determine whether the cursor change triggers onSelectionChange
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('onSelectionChange8_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[onSelectionChange8_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let richEditor = await driver.findComponent(ON.id('onSelectionChange8_RichEditor'));
      await richEditor.click();
      await CommonFunc.sleep(1000);

      let text0 = getInspectorByKey('onSelectionChange8_text1');
      let Obj0: ESObject = JSON.parse(text0);
      expect(Obj0.$attrs.content).assertEqual('1');

      let btn1 = await driver.findComponent(ON.id('onSelectionChange8_btn1'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let text1 = getInspectorByKey('onSelectionChange8_text1');
      let Obj1: ESObject = JSON.parse(text1);
      expect(Obj1.$attrs.content).assertEqual('2');
      let text2 = getInspectorByKey('onSelectionChange8_text2');
      let Obj2: ESObject = JSON.parse(text2);
      expect(Obj2.$attrs.content).assertEqual('0');
      let text3 = getInspectorByKey('onSelectionChange8_text3');
      let Obj3: ESObject = JSON.parse(text3);
      expect(Obj3.$attrs.content).assertEqual('10');

      console.info('[onSelectionChange8_0100] END');
      done();
    });

  })
}
