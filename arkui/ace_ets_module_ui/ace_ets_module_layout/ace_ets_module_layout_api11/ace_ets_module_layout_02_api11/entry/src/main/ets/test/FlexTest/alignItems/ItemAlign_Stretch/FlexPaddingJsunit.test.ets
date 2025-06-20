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

export default function flexPadding_StretchJsunit() {
  describe('flexPadding_StretchJsunit', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Stretch/ItemAlign_Stretch_FlexPadding',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get ItemAlign_Stretch_FlexPadding state success " + JSON.stringify(pages));
        if (!("ItemAlign_Stretch_FlexPadding" == pages.name)) {
          console.info("get ItemAlign_Stretch_FlexPadding state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push ItemAlign_Stretch_FlexPadding page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ItemAlign_Stretch_FlexPadding page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ItemAlign_Stretch_FlexPadding after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_STRETCH_0300
     * @tc.name testFlexItemAlignStretchParentSetPadding
     * @tc.desc Parent component set paddding,subcomponent does not exceed the parent component.
     */
    it('testFlexItemAlignStretchParentSetPadding',  Level.LEVEL0, async () => {
      console.info('new testFlexItemAlignStretchParentSetPadding START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'padding', value: 10
      });
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('ItemAlign_Stretch_flexPadding01');

      let textFlexPadding01: RectValue = CommonFunc.getComponentRect('ItemAlign_Stretch_textFlexPadding01');
      let textFlexPadding02: RectValue = CommonFunc.getComponentRect('ItemAlign_Stretch_textFlexPadding02');
      let textFlexPadding03: RectValue = CommonFunc.getComponentRect('ItemAlign_Stretch_textFlexPadding03');
      let flexPadding01: RectValue = CommonFunc.getComponentRect('ItemAlign_Stretch_flexPadding01');

      expect(Math.floor(Math.abs(textFlexPadding01.top - textFlexPadding02.top)) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textFlexPadding02.top - textFlexPadding03.top)) <= 1).assertTrue()
      expect(Math.floor(Math.abs((textFlexPadding01.top - flexPadding01.top) - vp2px(10))) <= 1).assertTrue()

      expect(Math.floor(Math.abs(textFlexPadding01.bottom - textFlexPadding02.bottom)) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textFlexPadding02.bottom - textFlexPadding03.bottom)) <= 1).assertTrue()
      expect(flexPadding01.bottom).assertLarger(textFlexPadding01.bottom)
      expect(flexPadding01.right).assertLarger(textFlexPadding03.right)
      expect(Math.floor(Math.abs((textFlexPadding01.left - flexPadding01.left) - vp2px(10))) <= 1).assertTrue()

      expect(Math.floor(Math.abs((textFlexPadding01.bottom - textFlexPadding01.top) - vp2px(180))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((textFlexPadding02.bottom - textFlexPadding02.top) - vp2px(180))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((textFlexPadding03.bottom - textFlexPadding03.top) - vp2px(180))) <= 1).assertTrue()

      expect(Math.floor(Math.abs((textFlexPadding01.right - textFlexPadding01.left) - vp2px(150))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((textFlexPadding02.right - textFlexPadding02.left) - vp2px(150))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((textFlexPadding03.right - textFlexPadding03.left) - vp2px(150))) <= 1).assertTrue()
      expect(JSON.parse(strJson1).$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(JSON.parse(strJson1).$attrs.constructor.alignItems).assertEqual('ItemAlign.Stretch')
      console.info('new testFlexItemAlignStretchParentSetPadding END');

    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_STRETCH_0400
     * @tc.name testFlexItemAlignStretchParentSetPaddingExceed
     * @tc.desc Parent component set paddding,subcomponent exceedS the parent component.
     */
    it('testFlexItemAlignStretchParentSetPaddingExceed',  Level.LEVEL0, async () => {
      console.info('new testFlexItemAlignStretchParentSetPaddingExceed START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'padding', value: 30
      });
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('ItemAlign_Stretch_flexPadding01');

      let textFlexPadding01: RectValue = CommonFunc.getComponentRect('ItemAlign_Stretch_textFlexPadding01');
      let textFlexPadding02: RectValue = CommonFunc.getComponentRect('ItemAlign_Stretch_textFlexPadding02');
      let textFlexPadding03: RectValue = CommonFunc.getComponentRect('ItemAlign_Stretch_textFlexPadding03');
      let flexPadding01: RectValue = CommonFunc.getComponentRect('ItemAlign_Stretch_flexPadding01');

      expect(Math.floor(Math.abs(textFlexPadding01.top - textFlexPadding02.top)) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textFlexPadding02.top - textFlexPadding03.top)) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textFlexPadding01.top - flexPadding01.top) - vp2px(30)) <= 1).assertTrue()

      expect(Math.floor(Math.abs(textFlexPadding01.bottom - textFlexPadding02.bottom)) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textFlexPadding02.bottom - textFlexPadding03.bottom)) <= 1).assertTrue()
      expect(Math.floor(Math.abs((flexPadding01.bottom - textFlexPadding01.bottom) - vp2px(30))) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textFlexPadding01.left - flexPadding01.left) - vp2px(30)) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textFlexPadding03.right - flexPadding01.right) - vp2px(30)) <= 1).assertTrue()

      expect(Math.floor(Math.abs((textFlexPadding01.bottom - textFlexPadding01.top) - vp2px(140))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((textFlexPadding02.bottom - textFlexPadding02.top) - vp2px(140))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((textFlexPadding03.bottom - textFlexPadding03.top) - vp2px(140))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((textFlexPadding01.right - textFlexPadding01.left) - vp2px(440 / 3))) <= 1)
        .assertTrue()
      expect(Math.floor(Math.abs((textFlexPadding02.right - textFlexPadding02.left) - vp2px(440 / 3))) <= 1)
        .assertTrue()
      expect(Math.floor(Math.abs((textFlexPadding03.right - textFlexPadding03.left) - vp2px(440 / 3))) <= 1)
        .assertTrue()
      expect(JSON.parse(strJson1).$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(JSON.parse(strJson1).$attrs.constructor.alignItems).assertEqual('ItemAlign.Stretch')
      console.info('new testFlexItemAlignStretchParentSetPaddingExceed END');

    });
  })
}
