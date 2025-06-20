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
export default function checkboxGroupTest() {
  describe('checkboxGroupTest', () => {
    beforeEach(async (done: Function) => {
      console.info("checkboxGroupTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/twoWayBind/checkboxGroup',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get checkboxGroupTest state pages: " + JSON.stringify(pages));
        if (!("checkboxGroup" == pages.name)) {
          console.info("get checkboxGroupTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push checkboxGroupTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push checkboxGroupTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    SUB_ACE_STATUSMANAGER_$$CAPABILITY_0020
     * @tc.name      checkboxGroupTest_0100
     * @tc.desc      api
     * @tc.level:    Level 1
     * @tc.type :    FUNC
     * @tc.size :    MEDIUM
     */
    it('checkboxGroupTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('checkboxGroupTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let checkbox = await driver.findComponent(ON.id('checkboxGroup2'));
      await checkbox.click();
      await CommonFunc.sleep(1000);

      checkbox = await driver.findComponent(ON.id('checkboxGroup3'));
      await checkbox.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('checkboxGroupText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[checkboxGroupTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('checkgroupselectAll: true');

      console.info('[checkboxGroupTest_0100] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_STATUSMANAGER_$$CAPABILITY_0020
     * @tc.name      checkboxGroupTest_0200
     * @tc.desc      api
     * @tc.level:    Level 1
     * @tc.type :    FUNC
     * @tc.size :    MEDIUM
     */
    it('checkboxGroupTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('checkboxGroupTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let checkbox = await driver.findComponent(ON.id('checkboxGroup1'));
      await checkbox.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('checkboxGroupText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[checkboxGroupTest_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('checkgroupselectAll: false');

      console.info('[checkboxGroupTest_0200] END');
      done();
    });
  })
}

