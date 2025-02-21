/*
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc, { RectValue } from "../../../../MainAbility/common/Common";
import { MessageManager, Callback } from '../../../../MainAbility/common/MessageManager';
import GlobalContext from '../../../../MainAbility/common/GlobalContext';

export default function flexTextMargin_BaselineJsunit() {
  describe('flexItemAlignBaselineTest4', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Baseline/FlexTextMargin',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexTextMargin state success " + JSON.stringify(pages));
        if (!("FlexTextMargin" == pages.name)) {
          console.info("get FlexTextMargin state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push FlexTextMargin page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexTextMargin page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FlexTextMargin after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_BASELINE_1400
     * @tc.name testFlexItemAlignBaselineSubSetMargin
     * @tc.desc Subcomponents set margin within the scope of the parent component.
     */
    it('testFlexItemAlignBaselineSubSetMargin', 0, async () => {
      console.info('new testFlexItemAlignBaselineSubSetMargin START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'margin', value: 10
      });
      await CommonFunc.sleep(2000);
      let marginValue = 10;
      let strJson1 = getInspectorByKey('flexTextMargin01');

      let textMargin01: RectValue = CommonFunc.getComponentRect('textMargin01');
      let textMargin02: RectValue = CommonFunc.getComponentRect('textMargin02');
      let textMargin03: RectValue = CommonFunc.getComponentRect('textMargin03');
      let flexTextMargin01: RectValue = CommonFunc.getComponentRect('flexTextMargin01');
      expect(Math.abs(Math.round(textMargin01.left - flexTextMargin01.left) - Math.round(vp2px(10))) <= 1).assertTrue();
      expect(Math.abs(Math.round(textMargin02.left - textMargin01.right) - Math.round(vp2px(10))) <= 1).assertTrue();
      expect(Math.abs(textMargin03.left - textMargin02.right) <= 1).assertTrue();
      expect(Math.abs(Math.round(flexTextMargin01.right - textMargin03.right) - Math.round(vp2px(30))) <= 1)
        .assertTrue()

      expect(Math.abs(textMargin03.top - flexTextMargin01.top) <= 1).assertTrue();
      expect(Math.abs(textMargin01.top - textMargin03.top - vp2px(marginValue) - (textMargin03.bottom - textMargin01.bottom + vp2px(marginValue))) <= 1)
        .assertTrue();
      expect(Math.abs(textMargin02.top - textMargin03.top - (textMargin03.bottom - textMargin02.bottom)) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(textMargin01.bottom - textMargin01.top) - Math.round(vp2px(50))) <= 1).assertTrue()
      expect(Math.abs(Math.round(textMargin02.bottom - textMargin02.top) - Math.round(vp2px(100))) <= 1).assertTrue()
      expect(Math.abs(Math.round(textMargin03.bottom - textMargin03.top) - Math.round(vp2px(150))) <= 1).assertTrue()
      expect(Math.abs(Math.round(textMargin01.right - textMargin01.left) - Math.round(vp2px(150))) <= 1).assertTrue()
      expect(Math.abs(Math.round(textMargin02.right - textMargin02.left) - Math.round(vp2px(150))) <= 1).assertTrue()
      expect(Math.abs(Math.round(textMargin03.right - textMargin03.left) - Math.round(vp2px(150))) <= 1).assertTrue()
      expect(JSON.parse(strJson1).$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(JSON.parse(strJson1).$attrs.constructor.alignItems).assertEqual('ItemAlign.Baseline')
      console.info('new testFlexItemAlignBaselineSubSetMargin END');

    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_BASELINE_1500
     * @tc.name testFlexItemAlignBaselineSubSetMarginExceed
     * @tc.desc Subcomponents set margin outside the scope of the parent component.
     */
    it('testFlexItemAlignBaselineSubSetMarginExceed', 0, async () => {
      console.info('new testFlexItemAlignBaselineSubSetMarginExceed START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'margin', value: 30
      });
      await CommonFunc.sleep(2000);
      let marginValue = 30;
      let strJson1 = getInspectorByKey('flexTextMargin01');

      let textMargin01: RectValue = CommonFunc.getComponentRect('textMargin01');
      let textMargin02: RectValue = CommonFunc.getComponentRect('textMargin02');
      let textMargin03: RectValue = CommonFunc.getComponentRect('textMargin03');
      let flexTextMargin01: RectValue = CommonFunc.getComponentRect('flexTextMargin01');
      expect(Math.abs(Math.round(textMargin01.left - flexTextMargin01.left) - Math.round(vp2px(30))) <= 1).assertTrue();
      expect(Math.abs(Math.round(textMargin02.left - textMargin01.right) - Math.round(vp2px(30))) <= 1).assertTrue();
      expect(Math.abs(textMargin03.left - textMargin02.right) <= 1).assertTrue();
      expect(Math.abs(textMargin03.right - flexTextMargin01.right) <= 1).assertTrue();

      expect(Math.abs(textMargin03.top - flexTextMargin01.top) <= 1).assertTrue();
      expect(Math.abs(textMargin01.top - textMargin03.top - vp2px(marginValue) - (textMargin03.bottom - textMargin01.bottom + vp2px(marginValue))) <= 1)
        .assertTrue();
      expect(Math.abs(textMargin02.top - textMargin03.top - (textMargin03.bottom - textMargin02.bottom)) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(textMargin01.bottom - textMargin01.top) - Math.round(vp2px(50))) <= 1).assertTrue()
      expect(Math.abs(Math.round(textMargin02.bottom - textMargin02.top) - Math.round(vp2px(100))) <= 1).assertTrue()
      expect(Math.abs(Math.round(textMargin03.bottom - textMargin03.top) - Math.round(vp2px(150))) <= 1).assertTrue()
      expect(Math.abs(Math.round(textMargin01.right - textMargin01.left) - Math.round(vp2px(440 / 3))) <= 1)
        .assertTrue()
      expect(Math.abs(Math.round(textMargin02.right - textMargin02.left) - Math.round(vp2px(440 / 3))) <= 1)
        .assertTrue()
      expect(Math.abs(Math.round(textMargin03.right - textMargin03.left) - Math.round(vp2px(440 / 3))) <= 1)
        .assertTrue()
      expect(JSON.parse(strJson1).$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(JSON.parse(strJson1).$attrs.constructor.alignItems).assertEqual('ItemAlign.Baseline')
      console.info('new testFlexItemAlignBaselineSubSetMarginExceed END');

    });
  })
}
