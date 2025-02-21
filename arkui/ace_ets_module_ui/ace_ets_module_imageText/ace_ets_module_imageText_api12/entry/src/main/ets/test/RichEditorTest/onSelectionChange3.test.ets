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
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function onSelectionChange3() {
  describe('onSelectionChange3', () => {
    beforeEach(async (done: Function) => {
      console.info("onSelectionChange3 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/onSelectionChange3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onSelectionChange3 state pages:" + JSON.stringify(pages));
        if (!("onSelectionChange3" == pages.name)) {
          console.info("get onSelectionChange3 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push onSelectionChange3 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onSelectionChange3 page error:" + err);
      }
      console.info("onSelectionChange3 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("onSelectionChange3 after each called");
    });
    /**
     * @tc.number    SUB_ACE_onSelectionChange3_0100
     * @tc.name      testRichEditor
     * @tc.desc      Determine whether the cursor change triggers onSelectionChange
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('onSelectionChange3_0100', 0, async (done: Function) => {
      console.info('[onSelectionChange3_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let richEditor = await driver.findComponent(ON.id('onSelectionChange3_RichEditor'));
      await richEditor.longClick();
      await CommonFunc.sleep(1000);
      let text1_1 = getInspectorByKey('onSelectionChange3_text1');
      let Obj1_1: ESObject = JSON.parse(text1_1);
      expect(Obj1_1.$attrs.content).assertEqual('1');

      let copy = await driver.findComponent(ON.text('复制'))
      await copy.click()
      await CommonFunc.sleep(1000);
      let text1_2 = getInspectorByKey('onSelectionChange3_text1');
      let Obj1_2: ESObject = JSON.parse(text1_2);
      expect(Obj1_2.$attrs.content).assertEqual('1');
      await CommonFunc.sleep(2500);

      await richEditor.click();
      await CommonFunc.sleep(1000);
      let paste = await driver.findComponent(ON.text('粘贴'))
      await paste.click()
      await CommonFunc.sleep(1000);
      let text1_3 = getInspectorByKey('onSelectionChange3_text1');
      let Obj1_3: ESObject = JSON.parse(text1_3);
      expect(Obj1_3.$attrs.content).assertEqual('2');

      console.info('[onSelectionChange3_0100] END');
      done();
    });

  })
}
