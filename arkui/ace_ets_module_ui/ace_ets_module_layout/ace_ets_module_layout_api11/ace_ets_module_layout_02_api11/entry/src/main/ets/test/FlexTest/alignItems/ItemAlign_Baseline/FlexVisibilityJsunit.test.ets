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

export default function flexVisibility_BaselineJsunit() {
  describe('flexItemAlignBaselineTest8', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Baseline/ItemAlign_Baseline_FlexVisibility',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get ItemAlign_Baseline_FlexVisibility state success " + JSON.stringify(pages));
        if (!("ItemAlign_Baseline_FlexVisibility" == pages.name)) {
          console.info("get ItemAlign_Baseline_FlexVisibility state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push ItemAlign_Baseline_FlexVisibility page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ItemAlign_Baseline_FlexVisibility page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000);

    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ItemAlign_Baseline_FlexVisibility after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_BASELINE_1100
     * @tc.name testFlexItemAlignBaselineSubSetVisibilityNone
     * @tc.desc The first subcomponent set Visibility.None attribute.
     */
    it('testFlexItemAlignBaselineSubSetVisibilityNone',  Level.LEVEL0, async () => {
      console.info('new testFlexItemAlignBaselineSubSetVisibilityNone START');
      try {
        GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'visibility', value: Visibility.None
        })
        await CommonFunc.sleep(2000);
        let strJson1 = getInspectorByKey('ItemAlign_Baseline_flexVisible');

        let strJson2 = getInspectorByKey('ItemAlign_Baseline_textVisible01');

        expect(JSON.parse(strJson2).$attrs.visibility).assertEqual("Visibility.None");

        let textVisible01: RectValue = CommonFunc.getComponentRect('ItemAlign_Baseline_textVisible01')
        let textVisible02: RectValue = CommonFunc.getComponentRect('ItemAlign_Baseline_textVisible02')
        let textVisible03: RectValue = CommonFunc.getComponentRect('ItemAlign_Baseline_textVisible03')
        let flexVisible: RectValue = CommonFunc.getComponentRect('ItemAlign_Baseline_flexVisible')
        expect(Math.abs(textVisible03.top - flexVisible.top) <= 1).assertTrue()
        expect(Math.abs(textVisible01.left - flexVisible.left) <= 1).assertTrue()
        expect(Math.abs(textVisible01.right - textVisible02.left) <= 1).assertTrue()
        expect(Math.abs(textVisible02.right - textVisible03.left) <= 1).assertTrue()

        expect(Math.abs(textVisible02.bottom - textVisible02.top - vp2px(100)) <= 1).assertTrue()
        expect(Math.abs(textVisible03.bottom - textVisible03.top - vp2px(150)) <= 1).assertTrue()
        expect(Math.abs(textVisible02.right - textVisible02.left - vp2px(150)) <= 1).assertTrue()
        expect(Math.abs(textVisible03.right - textVisible03.left - vp2px(150)) <= 1).assertTrue()
        expect(Math.abs(flexVisible.right - textVisible03.right - vp2px(200)) <= 1).assertTrue()

        expect(Math.abs(textVisible02.top - textVisible03.top - textVisible03.bottom + textVisible02.bottom) <= 1)
          .assertTrue()
        expect(JSON.parse(strJson1).$attrs.visibility).assertEqual("Visibility.Visible");
        expect(JSON.parse(strJson1).$attrs.constructor.direction).assertEqual('FlexDirection.Row')
        expect(JSON.parse(strJson1).$attrs.constructor.alignItems).assertEqual('ItemAlign.Baseline')
      } catch (err) {
        console.error('[testFlexItemAlignBaselineSubSetVisibilityNone] failed');
        expect().assertFail();
      }
      console.info('new testFlexItemAlignBaselineSubSetVisibilityNone END');

    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_BASELINE_1200
     * @tc.name testFlexItemAlignBaselineSubSetVisibilityHidden
     * @tc.desc The first subcomponent set Visibility.Hidden attribute.
     */
    it('testFlexItemAlignBaselineSubSetVisibilityHidden',  Level.LEVEL0, async () => {
      console.info('new testFlexItemAlignBaselineSubSetVisibilityHidden START');
      try {
        GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'visibility', value: Visibility.Hidden
        });
        await CommonFunc.sleep(2000);
        let strJson1 = getInspectorByKey('ItemAlign_Baseline_flexVisible');

        let strJson2 = getInspectorByKey('ItemAlign_Baseline_textVisible01');

        expect(JSON.parse(strJson2).$attrs.visibility).assertEqual("Visibility.Hidden");
        let textVisible01: RectValue = CommonFunc.getComponentRect('ItemAlign_Baseline_textVisible01');
        let textVisible02: RectValue = CommonFunc.getComponentRect('ItemAlign_Baseline_textVisible02');
        let textVisible03: RectValue = CommonFunc.getComponentRect('ItemAlign_Baseline_textVisible03');
        let flexVisible: RectValue = CommonFunc.getComponentRect('ItemAlign_Baseline_flexVisible');
        expect(Math.abs(textVisible03.top - flexVisible.top) <= 1).assertTrue()
        expect(Math.abs(textVisible01.left - flexVisible.left) <= 1).assertTrue()
        expect(Math.abs(textVisible01.right - textVisible02.left) <= 1).assertTrue()
        expect(Math.abs(textVisible02.right - textVisible03.left) <= 1).assertTrue()

        expect(Math.abs(textVisible01.bottom - textVisible01.top - vp2px(50)) <= 1).assertTrue()
        expect(Math.abs(textVisible01.right - textVisible01.left - vp2px(150)) <= 1).assertTrue()
        expect(Math.abs(textVisible02.bottom - textVisible02.top - vp2px(100)) <= 1).assertTrue()
        expect(Math.abs(textVisible02.right - textVisible02.left - vp2px(150)) <= 1).assertTrue()
        expect(Math.abs(textVisible03.bottom - textVisible03.top - vp2px(150)) <= 1).assertTrue()
        expect(Math.abs(textVisible03.right - textVisible03.left - vp2px(150)) <= 1).assertTrue()

        expect(Math.abs(textVisible01.top - textVisible03.top - textVisible03.bottom + textVisible01.bottom) <= 1)
          .assertTrue()
        expect(Math.abs(textVisible02.top - textVisible03.top - textVisible03.bottom + textVisible02.bottom) <= 1)
          .assertTrue()

        expect(JSON.parse(strJson1).$attrs.constructor.direction).assertEqual('FlexDirection.Row')
        expect(JSON.parse(strJson1).$attrs.constructor.alignItems).assertEqual('ItemAlign.Baseline')
        expect(Math.abs(flexVisible.right - textVisible03.right - vp2px(50)) <= 1).assertTrue()
      } catch (err) {
        console.error('[testFlexItemAlignBaselineSubSetVisibilityHidden] failed');
        expect().assertFail();
      }
      console.info('new testFlexItemAlignBaselineSubSetVisibilityHidden END');

    });
  })
}
