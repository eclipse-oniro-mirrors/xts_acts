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
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';

export default function onSelectionChange4() {
  describe('onSelectionChange4', () => {
    beforeEach(async (done: Function) => {
      console.info("onSelectionChange4 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/onSelectionChange4',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onSelectionChange4 state pages:" + JSON.stringify(pages));
        if (!("onSelectionChange4" == pages.name)) {
          console.info("get onSelectionChange4 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push onSelectionChange4 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onSelectionChange4 page error:" + err);
      }
      console.info("onSelectionChange4 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("onSelectionChange4 after each called");
    });
    /**
     * @tc.number    SUB_ACE_onSelectionChange4_0100
     * @tc.name      testRichEditor
     * @tc.desc      Determine whether the cursor change triggers onSelectionChange
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('onSelectionChange4_0100', 0, async (done: Function) => {
      console.info('[onSelectionChange4_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(300);

      let richEditor = await driver.findComponent(ON.id('onSelectionChange4_RichEditor'));
      await richEditor.longClick();
      await CommonFunc.sleep(1000);
      let Select  = await driver.findComponent(ON.text('全选'))
      await Select .click()
      await CommonFunc.sleep(1000);
      let text1_1 = getInspectorByKey('onSelectionChange4_text1');
      let Obj1_1: ESObject = JSON.parse(text1_1);
      expect(Obj1_1.$attrs.content).assertEqual('2');
      let text2_1 = getInspectorByKey('onSelectionChange4_text2');
      let Obj2_1: ESObject = JSON.parse(text2_1);
      expect(Obj2_1.$attrs.content).assertEqual('0');
      let text3_1 = getInspectorByKey('onSelectionChange4_text3');
      let Obj3_1: ESObject = JSON.parse(text3_1);
      expect(Obj3_1.$attrs.content).assertEqual('2');

      let copy = await driver.findComponent(ON.text('复制'))
      await copy.click()
      await CommonFunc.sleep(1000);
      let text1_2 = getInspectorByKey('onSelectionChange4_text1');
      let Obj1_2: ESObject = JSON.parse(text1_2);
      expect(Obj1_2.$attrs.content).assertEqual('2');
      let text2_2 = getInspectorByKey('onSelectionChange4_text2');
      let Obj2_2: ESObject = JSON.parse(text2_2);
      expect(Obj2_2.$attrs.content).assertEqual('0');
      let text3_2 = getInspectorByKey('onSelectionChange4_text3');
      let Obj3_2: ESObject = JSON.parse(text3_2);
      expect(Obj3_2.$attrs.content).assertEqual('2');
      await CommonFunc.sleep(2500);

      let richEditor2 = await driver.findComponent(ON.id('onSelectionChange4_RichEditor'));
      
      // doubleClick
      let centerPoint = await richEditor2.getBoundsCenter();
      let point = `${centerPoint.x} ${centerPoint.y}`;
      let cmd = `uinput -T -d ${point} -u ${point} -i 50 -d ${point} -u ${point}`;
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator.executeShellCommand(cmd);
      await CommonFunc.sleep(2000);

      await CommonFunc.sleep(1000);
      let paste = await driver.findComponent(ON.text('粘贴'))
      await paste.click()
      await CommonFunc.sleep(1000);
      let text1_3 = getInspectorByKey('onSelectionChange4_text1');
      let Obj1_3: ESObject = JSON.parse(text1_3);
      expect(Obj1_3.$attrs.content).assertEqual('3');
      let text2_3 = getInspectorByKey('onSelectionChange4_text2');
      let Obj2_3: ESObject = JSON.parse(text2_3);
      expect(Obj2_3.$attrs.content).assertEqual('2');
      let text3_3 = getInspectorByKey('onSelectionChange4_text3');
      let Obj3_3: ESObject = JSON.parse(text3_3);
      expect(Obj3_3.$attrs.content).assertEqual('2');

      console.info('[onSelectionChange4_0100] END');
      done();
    });

  })
}
