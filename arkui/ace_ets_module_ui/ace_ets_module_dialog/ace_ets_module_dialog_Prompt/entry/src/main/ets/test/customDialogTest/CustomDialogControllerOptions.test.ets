/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON, Component } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';
import CommonFunc from "../../MainAbility/common/Common"

export default function CustomDialogControllerOptionsTest() {
  describe('CustomDialogControllerOptionsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("CustomDialogControllerOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/customDialog/CustomDialogControllerOptions2',
      }
      router.clear();
      let pages = router.getState();
      console.info("get CustomDialogControllerOptionsTest state pages: " + JSON.stringify(pages));
      if (!("CustomDialogControllerOptions" == pages.name)) {
        console.info("get CustomDialogControllerOptionsTest state pages.name: " + JSON.stringify(pages.name));
        let result = await router.push(options);
        await Utils.sleep(2000);
        console.info("push CustomDialogControllerOptionsTest success: " + JSON.stringify(result));
      }
      done();
    });

    /**
     * @tc.number    CustomDialogControllerOptionsTest_0100
     * @tc.name      CustomDialogControllerOptionsTest_0100
     * @tc.desc      createCustomDialogToWindow
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('CustomDialogControllerOptionsTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('CustomDialogControllerOptionsTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('focusClick'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[CustomDialogControllerOptionsTest_0100] obj2 is: " + JSON.stringify(obj2));

      console.info("[CustomDialogControllerOptionsTest_0100] obj2.$children[1].$children[0] focusable is: " + JSON.stringify(obj2.$children[1].$children[0].$attrs));
      console.info("[CustomDialogControllerOptionsTest_0100] obj2.$children[1].$children[0] focusable is: " + JSON.stringify(obj2.$children[1].$children[0].$attrs?.focusable));

      expect(obj2.$children[1].$children[0].$attrs?.focusable).assertTrue();
      let btn2: Component = await driver.findComponent(ON.id('close'));
      await btn2.click();
      console.info('CustomDialogControllerOptionsTest_0100 END');
      done();

    });
  })
}