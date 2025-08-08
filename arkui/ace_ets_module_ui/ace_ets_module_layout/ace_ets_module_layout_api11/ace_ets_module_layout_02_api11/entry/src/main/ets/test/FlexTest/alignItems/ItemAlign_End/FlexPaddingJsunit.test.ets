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

export default function flexPadding_EndJsunit() {
  describe('flexItemAlignEndTest', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_End/ItemAlign_End_FlexPadding',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get ItemAlign_End_FlexPadding state success " + JSON.stringify(pages));
        if (!("ItemAlign_End_FlexPadding" == pages.name)) {
          console.info("get ItemAlign_End_FlexPadding state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push ItemAlign_End_FlexPadding page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ItemAlign_End_FlexPadding page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ItemAlign_End_FlexPadding after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_END_0300
     * @tc.name testFlexItemAlignEndParentSetPadding
     * @tc.desc Parent component set paddding,subcomponent does not exceed the parent component.
     */
    it('testFlexItemAlignEndParentSetPadding',  Level.LEVEL0, async () => {
      console.info('new testFlexItemAlignEndParentSetPadding START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'padding', value: 10
      });
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('ItemAlign_End_flexPadding01');

      let strJson2 = getInspectorByKey('ItemAlign_End_textFlexPadding01');

      let textFlexPadding01: RectValue = CommonFunc.getComponentRect('ItemAlign_End_textFlexPadding01')
      let textFlexPadding02: RectValue = CommonFunc.getComponentRect('ItemAlign_End_textFlexPadding02')
      let textFlexPadding03: RectValue = CommonFunc.getComponentRect('ItemAlign_End_textFlexPadding03')
      let flexPadding01: RectValue = CommonFunc.getComponentRect('ItemAlign_End_flexPadding01')

      expect(Math.floor(Math.abs(textFlexPadding01.bottom - textFlexPadding02.bottom)) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textFlexPadding02.bottom - textFlexPadding03.bottom)) <= 1).assertTrue()
      expect(Math.floor(Math.abs(flexPadding01.bottom - textFlexPadding01.bottom - vp2px(10))) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textFlexPadding01.left - flexPadding01.left - vp2px(10))) <= 1).assertTrue()
      expect(textFlexPadding03.right).assertLess(flexPadding01.right)

      expect(Math.floor(Math.abs(textFlexPadding01.bottom - textFlexPadding01.top - vp2px(50))) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textFlexPadding02.bottom - textFlexPadding02.top - vp2px(100))) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textFlexPadding03.bottom - textFlexPadding03.top - vp2px(150))) <= 1).assertTrue()

      expect(Math.floor(Math.abs(textFlexPadding01.right - textFlexPadding01.left - vp2px(150))) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textFlexPadding02.right - textFlexPadding02.left - vp2px(150))) <= 1).assertTrue()
      expect(Math.floor(Math.abs(textFlexPadding03.right - textFlexPadding03.left - vp2px(150))) <= 1).assertTrue()
      expect(JSON.parse(strJson1).$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(JSON.parse(strJson1).$attrs.constructor.alignItems).assertEqual('ItemAlign.End')
      console.info('new testFlexItemAlignEndParentSetPadding END');

    });


  })
}
