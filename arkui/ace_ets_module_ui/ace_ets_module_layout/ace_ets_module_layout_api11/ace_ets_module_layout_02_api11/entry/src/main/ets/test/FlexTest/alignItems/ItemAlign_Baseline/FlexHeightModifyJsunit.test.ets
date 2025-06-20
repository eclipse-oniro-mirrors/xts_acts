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
import CommonFunc, { RectValue } from "../../../../MainAbility/common/Common";
import { MessageManager, Callback } from '../../../../MainAbility/common/MessageManager';
import GlobalContext from '../../../../MainAbility/common/GlobalContext';

export default function flexHeightModify_BaselineJsunit() {
  describe('flexItemAlignBaselineTest6', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Baseline/ItemAlign_Baseline_FlexHeightModify',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get ItemAlign_Baseline_FlexHeightModify state success " + JSON.stringify(pages));
        if (!("ItemAlign_Baseline_FlexHeightModify" == pages.name)) {
          console.info("get ItemAlign_Baseline_FlexHeightModify state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push ItemAlign_Baseline_FlexHeightModify page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ItemAlign_Baseline_FlexHeightModify page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ItemAlign_Baseline_FlexHeightModify after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_BASELINE_0800
     * @tc.name testFlexItemAlignBaselineDefaultSize
     * @tc.desc Modify the first subcomponent's height.
     */
    it('testFlexItemAlignBaselineDefaultSize',  Level.LEVEL0, async () => {
      console.info('new testFlexItemAlignBaselineDefaultSize START');
      let strJson1 = getInspectorByKey('ItemAlign_Baseline_flexHeightModify');

      let textHeightModify01: RectValue = CommonFunc.getComponentRect('ItemAlign_Baseline_textHeightModify01');
      let textHeightModify02: RectValue = CommonFunc.getComponentRect('ItemAlign_Baseline_textHeightModify02');
      let textHeightModify03: RectValue = CommonFunc.getComponentRect('ItemAlign_Baseline_textHeightModify03');
      let flexHeightModify: RectValue = CommonFunc.getComponentRect('ItemAlign_Baseline_flexHeightModify');
      expect(Math.abs(textHeightModify01.left - flexHeightModify.left) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.left - textHeightModify01.right) <= 1).assertTrue()
      expect(Math.abs(textHeightModify03.left - textHeightModify02.right) <= 1).assertTrue()

      expect(Math.abs(textHeightModify01.top - textHeightModify03.top - textHeightModify03.bottom + textHeightModify01.bottom) <= 1)
        .assertTrue()
      expect(Math.abs(textHeightModify02.top - textHeightModify03.top - textHeightModify03.bottom + textHeightModify02.bottom) <= 1)
        .assertTrue()

      expect(Math.abs(textHeightModify01.top - flexHeightModify.top - vp2px(50)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify03.top - flexHeightModify.top) <= 1).assertTrue()

      expect(Math.abs(textHeightModify01.bottom - textHeightModify01.top - vp2px(50)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.bottom - textHeightModify02.top - vp2px(100)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify03.bottom - textHeightModify03.top - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify01.right - textHeightModify01.left - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.right - textHeightModify02.left - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify03.right - textHeightModify03.left - vp2px(150)) <= 1).assertTrue()
      expect(JSON.parse(strJson1).$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(JSON.parse(strJson1).$attrs.constructor.alignItems).assertEqual('ItemAlign.Baseline')
      console.info('new testFlexItemAlignBaselineDefaultSize END');

    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_BASELINE_0900
     * @tc.name testFlexItemAlignBaselineHeightModify
     * @tc.desc Modify the first subcomponent's height.
     */
    it('testFlexItemAlignBaselineHeightModify',  Level.LEVEL0, async () => {
      console.info('new testFlexItemAlignBaselineHeightModify START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'height', value: 80
      });
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('ItemAlign_Baseline_flexHeightModify');

      let textHeightModify01: RectValue = CommonFunc.getComponentRect('ItemAlign_Baseline_textHeightModify01');
      let textHeightModify02: RectValue = CommonFunc.getComponentRect('ItemAlign_Baseline_textHeightModify02');
      let textHeightModify03: RectValue = CommonFunc.getComponentRect('ItemAlign_Baseline_textHeightModify03');
      let flexHeightModify: RectValue = CommonFunc.getComponentRect('ItemAlign_Baseline_flexHeightModify');
      expect(Math.abs(textHeightModify01.left - flexHeightModify.left) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.left - textHeightModify01.right) <= 1).assertTrue()
      expect(Math.abs(textHeightModify03.left - textHeightModify02.right) <= 1).assertTrue()

      expect(Math.abs(textHeightModify01.top - textHeightModify03.top - textHeightModify03.bottom + textHeightModify01.bottom) <= 1)
        .assertTrue()
      expect(Math.abs(textHeightModify02.top - textHeightModify03.top - textHeightModify03.bottom + textHeightModify02.bottom) <= 1)
        .assertTrue()

      expect(Math.abs(textHeightModify01.top - flexHeightModify.top - vp2px(35)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify01.bottom - textHeightModify01.top - vp2px(80)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.bottom - textHeightModify02.top - vp2px(100)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify03.bottom - textHeightModify03.top - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify01.right - textHeightModify01.left - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify02.right - textHeightModify02.left - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(textHeightModify03.right - textHeightModify03.left - vp2px(150)) <= 1).assertTrue()
      expect(JSON.parse(strJson1).$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(JSON.parse(strJson1).$attrs.constructor.alignItems).assertEqual('ItemAlign.Baseline')
      console.info('new testFlexItemAlignBaselineHeightModify END');

    });
  })
}
