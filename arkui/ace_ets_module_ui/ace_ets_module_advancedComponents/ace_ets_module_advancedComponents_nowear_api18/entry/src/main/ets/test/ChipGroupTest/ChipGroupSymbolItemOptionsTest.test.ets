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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation,
  ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function ChipGroupSymbolItemOptionsTest() {
  describe('ChipGroupSymbolItemOptionsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ChipGroupSymbolItemOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ChipGroup/ChipGroupSymbolItemOptionsPage",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("ChipGroupPage" == pages.name)) {
          console.info("get ChipGroupSymbolItemOptionsTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ChipGroupSymbolItemOptionsTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ChipGroupSymbolItemOptionsTest page error:" + err);
      }
      console.info("ChipGroupSymbolItemOptionsTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ChipGroupSymbolItemOptionsTest after each called");
    });

    /**
     * @tc.number    ChipGroupSymbolItemOptionsTest_001
     * @tc.name      ChipGroupSymbolItemOptionsTest_001
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('ChipGroupSymbolItemOptionsTest_001', Level.LEVEL0, async (done: Function) => {
      console.info('[ChipGroupSymbolItemOptionsTest_001] START');
      await CommonFunc.sleep(1000);

      let btn0: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
      console.info("[ChipGroupSymbolItemOptionsTest_001] component btn0.attrs.accessibilityDescription is: " + JSON.stringify(btn0.$attrs.accessibilityDescription));
      console.info("[ChipGroupSymbolItemOptionsTest_001] component btn0.attrs.accessibilityLevel is: " + JSON.stringify(btn0.$attrs.accessibilityLevel));
      expect(btn0.$attrs.accessibilityDescription).assertEqual('ChipGroupItem_accessibilityDescription');
      expect(btn0.$attrs.accessibilityLevel).assertEqual('auto');

      let btn1: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[1]
      console.info("[ChipGroupSymbolItemOptionsTest_001] component btn1.attrs.accessibilityLevel is: " + JSON.stringify(btn1.$attrs.accessibilityLevel));
      expect(btn1.$attrs.accessibilityLevel).assertEqual('no-hide-descendants');

      let btn1_image: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[1]
        .$children[0]
        .$children[0]
      console.info("[ChipGroupSymbolItemOptionsTest_001] component btn1_image.attrs.width is: " + JSON.stringify(btn1_image.$attrs.width));
      console.info("[ChipGroupSymbolItemOptionsTest_001] component btn1_image.attrs.height is: " + JSON.stringify(btn1_image.$attrs.height));
      expect(btn1_image.$attrs.width).assertEqual('36.00vp');
      expect(btn1_image.$attrs.height).assertEqual('36.00vp');

      // IconItemOptions: accessibilityText accessibilityDescription accessibilityLevel
      let btn3: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[1]
        .$children[0]
        .$children[0]
      console.info("[ChipGroupSymbolItemOptionsTest_001] component btn3.attrs.accessibilityText is: " + JSON.stringify(btn3.$attrs.accessibilityText));
      console.info("[ChipGroupSymbolItemOptionsTest_001] component btn3.attrs.accessibilityDescription is: " + JSON.stringify(btn3.$attrs.accessibilityDescription));
      console.info("[ChipGroupSymbolItemOptionsTest_001] component btn3.attrs.accessibilityLevel is: " + JSON.stringify(btn3.$attrs.accessibilityLevel));
      expect(btn3.$attrs.accessibilityText).assertEqual('IconGroupSuffix_accessibilityText');
      expect(btn3.$attrs.accessibilityDescription).assertEqual('IconGroupSuffix_accessibilityDescription');
      expect(btn3.$attrs.accessibilityLevel).assertEqual('yes');

      let btn4: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[1]
        .$children[0]
        .$children[1]
      console.info("[ChipGroupSymbolItemOptionsTest_001] component btn4.attrs.accessibilityText is: " + JSON.stringify(btn4.$attrs.accessibilityText));
      console.info("[ChipGroupSymbolItemOptionsTest_001] component btn4.attrs.accessibilityDescription is: " + JSON.stringify(btn4.$attrs.accessibilityDescription));
      console.info("[ChipGroupSymbolItemOptionsTest_001] component btn4.attrs.accessibilityLevel is: " + JSON.stringify(btn4.$attrs.accessibilityLevel));
      expect(btn4.$attrs.accessibilityText).assertEqual('IconGroupSuffix_accessibilityText_2');
      expect(btn4.$attrs.accessibilityDescription).assertEqual('IconGroupSuffix_accessibilityDescription_2');
      expect(btn4.$attrs.accessibilityLevel).assertEqual('no');

      let btn5: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[1]
        .$children[0]
        .$children[2]
      console.info("[ChipGroupSymbolItemOptionsTest_001] component btn5.attrs.accessibilityText is: " + JSON.stringify(btn5.$attrs.accessibilityText));
      console.info("[ChipGroupSymbolItemOptionsTest_001] component btn5.attrs.accessibilityDescription is: " + JSON.stringify(btn5.$attrs.accessibilityDescription));
      console.info("[ChipGroupSymbolItemOptionsTest_001] component btn5.attrs.accessibilityLevel is: " + JSON.stringify(btn5.$attrs.accessibilityLevel));
      expect(btn5.$attrs.accessibilityText).assertEqual('IconGroupSuffix_accessibilityText_3');
      expect(btn5.$attrs.accessibilityDescription).assertEqual('IconGroupSuffix_accessibilityDescription_3');
      expect(btn5.$attrs.accessibilityLevel).assertEqual('auto');

      let btn6: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[1]
        .$children[0]
        .$children[3]
      console.info("[ChipGroupSymbolItemOptionsTest_001] component btn6.attrs.accessibilityText is: " + JSON.stringify(btn6.$attrs.accessibilityText));
      console.info("[ChipGroupSymbolItemOptionsTest_001] component btn6.attrs.accessibilityDescription is: " + JSON.stringify(btn6.$attrs.accessibilityDescription));
      console.info("[ChipGroupSymbolItemOptionsTest_001] component btn6.attrs.accessibilityLevel is: " + JSON.stringify(btn6.$attrs.accessibilityLevel));
      expect(btn6.$attrs.accessibilityText).assertEqual('IconGroupSuffix_accessibilityText_4');
      expect(btn6.$attrs.accessibilityDescription).assertEqual('IconGroupSuffix_accessibilityDescription_4');
      expect(btn6.$attrs.accessibilityLevel).assertEqual('no-hide-descendants');

      console.info('[ChipGroupSymbolItemOptionsTest_001] END');
      done();
    });

  })
}