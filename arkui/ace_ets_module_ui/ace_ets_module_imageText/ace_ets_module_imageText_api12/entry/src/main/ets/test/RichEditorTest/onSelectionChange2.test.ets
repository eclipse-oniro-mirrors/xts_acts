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

export default function onSelectionChange2() {
  describe('onSelectionChange2', () => {
    beforeEach(async (done: Function) => {
      console.info("onSelectionChange2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/onSelectionChange2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onSelectionChange2 state pages:" + JSON.stringify(pages));
        if (!("onSelectionChange2" == pages.name)) {
          console.info("get onSelectionChange2 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push onSelectionChange2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onSelectionChange2 page error:" + err);
      }
      console.info("onSelectionChange2 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("onSelectionChange2 after each called");
    });
    /**
     * @tc.number    SUB_ACE_onSelectionChange2_0100
     * @tc.name      testRichEditor
     * @tc.desc      Determine whether the cursor change triggers onSelectionChange
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('onSelectionChange2_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[onSelectionChange2_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let richEditor = await driver.findComponent(ON.id('onSelectionChange2_RichEditor'));
      await richEditor.click();
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2017);
      await CommonFunc.sleep(1000);
      let text1 = getInspectorByKey('onSelectionChange2_text1');
      let Obj1: ESObject = JSON.parse(text1);
      expect(Obj1.$attrs.content).assertEqual('2');

      let text2 = getInspectorByKey('onSelectionChange2_text2');
      let Obj2: ESObject = JSON.parse(text2);
      let text3 = getInspectorByKey('onSelectionChange2_text3');
      let Obj3: ESObject = JSON.parse(text3);

      expect(Obj2.$attrs.content).assertEqual(Obj3.$attrs.content);
      console.info('[onSelectionChange2_0100] END');
      done();
    });

  })
}
