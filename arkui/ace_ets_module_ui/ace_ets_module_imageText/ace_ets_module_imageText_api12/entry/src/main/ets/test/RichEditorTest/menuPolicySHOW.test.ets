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

export default function menuPolicySHOW() {
  describe('menuPolicySHOW', () => {
    beforeEach(async (done: Function) => {
      console.info("menuPolicySHOW beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/menuPolicySHOW',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get menuPolicySHOW state pages:" + JSON.stringify(pages));
        if (!("menuPolicySHOW" == pages.name)) {
          console.info("get menuPolicySHOW pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push menuPolicySHOW page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push menuPolicySHOW page error:" + err);
      }
      console.info("menuPolicySHOW beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("menuPolicySHOW after each called");
    });
    /**
     * @tc.number    SUB_ACE_menuPolicy_0100
     * @tc.name      testRichEditor
     * @tc.desc      Determine whether the cursor change triggers onSelectionChange
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('menuPolicySHOW_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[menuPolicySHOW_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      let Text = await driver.findComponent(ON.id('menuPolicySHOWText'));
      await Text.click();
      await CommonFunc.sleep(1000);

      let richEditor = await driver.findComponent(ON.id('menuPolicySHOW'));
      await richEditor.longClick();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('menuPolicySHOWValue');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[menuPolicySHOW_0100] component obj is: " + JSON.stringify(obj));
      console.info("[menuPolicySHOW_0100] content: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("menuPolicy SHOW success");

      console.info('[menuPolicySHOW_0100] END');
      done();
    });

  })
}
