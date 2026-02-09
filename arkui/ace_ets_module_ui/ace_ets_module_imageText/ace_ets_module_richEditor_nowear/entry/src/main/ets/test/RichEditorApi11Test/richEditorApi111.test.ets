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
import CommonFunc from "../../MainAbility/common/Common";
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';

export default function richEditorApi111() {
  describe('richEditorApi111', () => {
    beforeEach(async (done: Function) => {
      console.info("richEditorApi111 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi11/richEditorApi111',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get richEditorApi111 state pages:" + JSON.stringify(pages));
        if (!("richEditorApi111" == pages.name)) {
          console.info("get richEditorApi111 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push richEditorApi111 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push richEditorApi111 page error:" + err);
      }
      console.info("richEditorApi111 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("richEditorApi111 after each called");
    });
    /**
     * @tc.name   richEditorApi111_0100
     * @tc.number SUB_ACE_RICHEDITOR_richEditorApi111_0100
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('richEditorApi111_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[richEditorApi111_0100] START');
      await CommonFunc.sleep(2000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let richEditor1 = await driver.findComponent(ON.id('RichEditor1'));
      // doubleClick
      let centerPoint = await richEditor1.getBoundsCenter();
      let point = `${centerPoint.x} ${centerPoint.y}`;
      let cmd = `uinput -T -d ${point} -u ${point} -i 50 -d ${point} -u ${point}`;
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator.executeShellCommand(cmd);
      await CommonFunc.sleep(2000);

      let button1: Component = await driver.findComponent(ON.text('复制'));
      button1.click()
      await CommonFunc.sleep(1000);

      await driver.click(centerPoint.x, centerPoint.y);
      await CommonFunc.sleep(2000);

      let button2: Component = await driver.findComponent(ON.text('粘贴'));
      button2.click()
      await CommonFunc.sleep(1000);

      let text1 = getInspectorByKey('richEditorApi1_text1');
      let Obj1: ESObject = JSON.parse(text1);
      expect(Obj1.$attrs.content).assertEqual('222');

      console.info('[testRichEditor_0100] END');
      done();
    });

  })
}
