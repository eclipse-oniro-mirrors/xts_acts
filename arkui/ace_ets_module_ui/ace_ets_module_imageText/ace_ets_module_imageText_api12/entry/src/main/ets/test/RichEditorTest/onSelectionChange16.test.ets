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


export default function onSelectionChange16() {
  describe('onSelectionChange16', () => {
    beforeEach(async (done: Function) => {
      console.info("onSelectionChange16 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/onSelectionChange16',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onSelectionChange16 state pages:" + JSON.stringify(pages));
        if (!("onSelectionChange16" == pages.name)) {
          console.info("get onSelectionChange16 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push onSelectionChange16 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onSelectionChange16 page error:" + err);
      }
      console.info("onSelectionChange16 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("onSelectionChange16 after each called");
    });
    /**
     * @tc.name   onSelectionChange16_0100
     * @tc.number SUB_ACE_onSelectionChange16_0100
     * @tc.desc   Determine whether the cursor change triggers onSelectionChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onSelectionChange16_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[onSelectionChange16_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let richEditor = await driver.findComponent(ON.id('onSelectionChange16_RichEditor'));
      await richEditor.click();
      await CommonFunc.sleep(1000);

      let text0 = getInspectorByKey('onSelectionChange16_text1');
      let Obj0: ESObject = JSON.parse(text0);
      expect(Obj0.$attrs.content).assertEqual('1');

      await driver.triggerKey(2055);
      await driver.triggerKey(2055);
      await driver.triggerKey(2055);
      await CommonFunc.sleep(1000);
      let text1_1 = getInspectorByKey('onSelectionChange16_text1');
      let Obj1_1: ESObject = JSON.parse(text1_1);
      expect(Obj1_1.$attrs.content).assertEqual('4');
      let text2_1 = getInspectorByKey('onSelectionChange16_text2');
      let Obj2_1: ESObject = JSON.parse(text2_1);
      expect(Obj2_1.$attrs.content).assertEqual('0');
      let text3_1 = getInspectorByKey('onSelectionChange16_text3');
      let Obj3_1: ESObject = JSON.parse(text3_1);
      expect(Obj3_1.$attrs.content).assertEqual('0');


      console.info('[onSelectionChange16_0100] END');
      done();
    });

  })
}
