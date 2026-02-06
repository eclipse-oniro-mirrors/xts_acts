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
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
export default function checkboxTest() {
  describe('checkboxTest', () => {
    beforeEach(async (done: Function) => {
      console.info("checkboxTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/twoWayBind/checkbox',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get checkboxTest state pages: " + JSON.stringify(pages));
        if (!("checkbox" == pages.name)) {
          console.info("get checkboxTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push checkboxTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push checkboxTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    SUB_ACE_STATUSMANAGER_$$CAPABILITY_0030
     * @tc.name      checkboxTest_0100
     * @tc.desc      api
     * @tc.level:    Level 1
     * @tc.type :    FUNC
     * @tc.size :    MEDIUM
     */
    it('checkboxTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('checkboxTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('twoCheckboxText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[bindSheetTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('checkboxselect1: true');

      strJson = getInspectorByKey('twoCheckboxText1');
      obj = JSON.parse(strJson);
      console.info("[bindSheetTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('checkboxselect2: false');

      let checkbox = await driver.findComponent(ON.id('twoCheckbox1'));
      await checkbox.click();
      await CommonFunc.sleep(1000);

      checkbox = await driver.findComponent(ON.id('twoCheckbox2'));
      await checkbox.click();
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('twoCheckboxText');
      obj = JSON.parse(strJson);
      console.info("[bindSheetTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('checkboxselect1: false');

      strJson = getInspectorByKey('twoCheckboxText1');
      obj = JSON.parse(strJson);
      console.info("[bindSheetTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('checkboxselect2: true');

      console.info('[checkboxTest_0100] END');
      done();
    });
  })
}

