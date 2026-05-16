'use static';
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation,
  ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import Utils from '../../../ets/MainAbility/common/Utils';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function ChipGroupSymbolItemOptionsTest() {
  describe('ChipGroupSymbolItemOptionsTest', () => {
    beforeAll(() => {
      console.info("ChipGroupSymbolItemOptionsTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.advanced.component.nowear.api18.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("ChipGroupSymbolItemOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ChipGroup/ChipGroupSymbolItemOptionsPage",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ChipGroupSymbolItemOptionsTest state pages:" + JSON.stringify(pages));
        if (!("ChipGroupPage" == pages.name)) {
          console.info("get ChipGroupSymbolItemOptionsTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ChipGroupSymbolItemOptionsTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ChipGroupSymbolItemOptionsTest page error:" + err);
      }
      console.info("ChipGroupSymbolItemOptionsTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("ChipGroupSymbolItemOptionsTest after each called");
    });

    
    
    
    /**
     * @tc.number   ChipGroupSymbolItemOptionsTest_static_001
     * @tc.name     ChipGroupSymbolItemOptionsTest_static_001
     * @tc.desc     ChipGroupSymbolItemOptionsTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('ChipGroupSymbolItemOptionsTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ChipGroupSymbolItemOptionsTest_static_001] START');
      await CommonFunc.sleep(1000);

      let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.info("[ChipGroupSymbolItemOptionsTest_static_001] component btn0.attrs.accessibilityDescription is: " + JSON.stringify(btn0.getElement('$attrs').getString('accessibilityDescription')));
      console.info("[ChipGroupSymbolItemOptionsTest_static_001] component btn0.attrs.accessibilityLevel is: " + JSON.stringify(btn0.getElement('$attrs').getString('accessibilityLevel')));
      expect(btn0.getElement('$attrs').getString('accessibilityDescription')).assertEqual('ChipGroupItem_accessibilityDescription');
      expect(btn0.getElement('$attrs').getString('accessibilityLevel')).assertEqual('auto');

      let btn1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[1]
      console.info("[ChipGroupSymbolItemOptionsTest_static_001] component btn1.attrs.accessibilityLevel is: " + JSON.stringify(btn1.getElement('$attrs').getString('accessibilityLevel')));
      expect(btn1.getElement('$attrs').getString('accessibilityLevel')).assertEqual('no-hide-descendants');

      let btn1_image = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.info("[ChipGroupSymbolItemOptionsTest_static_001] component btn1_image.attrs.width is: " + JSON.stringify(btn1_image.getElement('$attrs').getString('width')));
      console.info("[ChipGroupSymbolItemOptionsTest_static_001] component btn1_image.attrs.height is: " + JSON.stringify(btn1_image.getElement('$attrs').getString('height')));
      expect(btn1_image.getElement('$attrs').getString('width')).assertEqual('36.00vp');
      expect(btn1_image.getElement('$attrs').getString('height')).assertEqual('36.00vp');

      // IconItemOptions: accessibilityText accessibilityDescription accessibilityLevel
      let btn3 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.info("[ChipGroupSymbolItemOptionsTest_static_001] component btn3.attrs.accessibilityText is: " + JSON.stringify(btn3.getElement('$attrs').getString('accessibilityText')));
      console.info("[ChipGroupSymbolItemOptionsTest_static_001] component btn3.attrs.accessibilityDescription is: " + JSON.stringify(btn3.getElement('$attrs').getString('accessibilityDescription')));
      console.info("[ChipGroupSymbolItemOptionsTest_static_001] component btn3.attrs.accessibilityLevel is: " + JSON.stringify(btn3.getElement('$attrs').getString('accessibilityLevel')));
      expect(btn3.getElement('$attrs').getString('accessibilityText')).assertEqual('IconGroupSuffix_accessibilityText');
      expect(btn3.getElement('$attrs').getString('accessibilityDescription')).assertEqual('IconGroupSuffix_accessibilityDescription');
      expect(btn3.getElement('$attrs').getString('accessibilityLevel')).assertEqual('yes');

      let btn4 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getArray("$children")[1]
      console.info("[ChipGroupSymbolItemOptionsTest_static_001] component btn4.attrs.accessibilityText is: " + JSON.stringify(btn4.getElement('$attrs').getString('accessibilityText')));
      console.info("[ChipGroupSymbolItemOptionsTest_static_001] component btn4.attrs.accessibilityDescription is: " + JSON.stringify(btn4.getElement('$attrs').getString('accessibilityDescription')));
      console.info("[ChipGroupSymbolItemOptionsTest_static_001] component btn4.attrs.accessibilityLevel is: " + JSON.stringify(btn4.getElement('$attrs').getString('accessibilityLevel')));
      expect(btn4.getElement('$attrs').getString('accessibilityText')).assertEqual('IconGroupSuffix_accessibilityText_2');
      expect(btn4.getElement('$attrs').getString('accessibilityDescription')).assertEqual('IconGroupSuffix_accessibilityDescription_2');
      expect(btn4.getElement('$attrs').getString('accessibilityLevel')).assertEqual('no');

      let btn5 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getArray("$children")[2]
      console.info("[ChipGroupSymbolItemOptionsTest_static_001] component btn5.attrs.accessibilityText is: " + JSON.stringify(btn5.getElement('$attrs').getString('accessibilityText')));
      console.info("[ChipGroupSymbolItemOptionsTest_static_001] component btn5.attrs.accessibilityDescription is: " + JSON.stringify(btn5.getElement('$attrs').getString('accessibilityDescription')));
      console.info("[ChipGroupSymbolItemOptionsTest_static_001] component btn5.attrs.accessibilityLevel is: " + JSON.stringify(btn5.getElement('$attrs').getString('accessibilityLevel')));
      expect(btn5.getElement('$attrs').getString('accessibilityText')).assertEqual('IconGroupSuffix_accessibilityText_3');
      expect(btn5.getElement('$attrs').getString('accessibilityDescription')).assertEqual('IconGroupSuffix_accessibilityDescription_3');
      expect(btn5.getElement('$attrs').getString('accessibilityLevel')).assertEqual('auto');

      let btn6 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getArray("$children")[3]
      console.info("[ChipGroupSymbolItemOptionsTest_static_001] component btn6.attrs.accessibilityText is: " + JSON.stringify(btn6.getElement('$attrs').getString('accessibilityText')));
      console.info("[ChipGroupSymbolItemOptionsTest_static_001] component btn6.attrs.accessibilityDescription is: " + JSON.stringify(btn6.getElement('$attrs').getString('accessibilityDescription')));
      console.info("[ChipGroupSymbolItemOptionsTest_static_001] component btn6.attrs.accessibilityLevel is: " + JSON.stringify(btn6.getElement('$attrs').getString('accessibilityLevel')));
      expect(btn6.getElement('$attrs').getString('accessibilityText')).assertEqual('IconGroupSuffix_accessibilityText_4');
      expect(btn6.getElement('$attrs').getString('accessibilityDescription')).assertEqual('IconGroupSuffix_accessibilityDescription_4');
      expect(btn6.getElement('$attrs').getString('accessibilityLevel')).assertEqual('no-hide-descendants');

      console.info('[ChipGroupSymbolItemOptionsTest_static_001] END');
      done();
    });

  })
}