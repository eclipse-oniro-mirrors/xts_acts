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

export default function flexExceed_StretchJsunit() {
  describe('flexItemAlignStretchTest', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Stretch/FlexExceed',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexExceed state success " + JSON.stringify(pages));
        if (!("FlexExceed" == pages.name)) {
          console.info("get FlexExceed state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push FlexExceed page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexExceed page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FlexExceed after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_STRETCH_0600
     * @tc.name testFlexItemAlignStretchSetMarPad
     * @tc.desc Subcomponent inside when parent component set margin and padding.
     */
    it('testFlexItemAlignStretchSetMarPad', 0, async () => {
      console.info('new testFlexItemAlignStretchSetMarPad START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'padding', value: 10
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'margin', value: 10
      });
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('flexExceed01');

      let textExceed01: RectValue = CommonFunc.getComponentRect('textExceed01');
      let textExceed02: RectValue = CommonFunc.getComponentRect('textExceed02');
      let textExceed03: RectValue = CommonFunc.getComponentRect('textExceed03');
      let flexExceed01: RectValue = CommonFunc.getComponentRect('flexExceed01');

      expect(Math.abs(textExceed01.top - textExceed02.top) <= 1).assertTrue()
      expect(Math.abs(textExceed02.top - textExceed03.top) <= 1).assertTrue()
      expect(textExceed01.top).assertLarger(flexExceed01.top)

      expect(Math.abs(textExceed01.bottom - textExceed02.bottom) <= 1).assertTrue()
      expect(Math.abs(textExceed02.bottom - textExceed03.bottom) <= 1).assertTrue()
      expect(textExceed01.bottom).assertLess(flexExceed01.bottom)
      expect(textExceed01.left).assertLarger(flexExceed01.left)
      expect(textExceed03.right).assertLess(flexExceed01.right)
      expect(Math.abs((textExceed01.bottom - textExceed01.top) - vp2px(180)) <= 1).assertTrue()
      expect(Math.abs((textExceed02.bottom - textExceed02.top) - vp2px(180)) <= 1).assertTrue()
      expect(Math.abs((textExceed03.bottom - textExceed03.top) - vp2px(180)) <= 1).assertTrue()
      expect(Math.abs((textExceed01.right - textExceed01.left) - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs((textExceed02.right - textExceed02.left) - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs((textExceed03.right - textExceed03.left) - vp2px(150)) <= 1).assertTrue()
      expect(JSON.parse(strJson1).$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(JSON.parse(strJson1).$attrs.constructor.alignItems).assertEqual('ItemAlign.Stretch')
      console.info('new testFlexItemAlignStretchSetMarPad END');

    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_STRETCH_0700
     * @tc.name testFlexItemAlignStretchSetMarPadExceed
     * @tc.desc Subcomponent outside when parent component set margin and padding.
     */
    it('testFlexItemAlignStretchSetMarPadExceed', 0, async () => {
      console.info('new testFlexItemAlignStretchSetMarPadExceed START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'padding', value: 30
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'margin', value: 30
      });
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('flexExceed01');

      let textExceed01: RectValue = CommonFunc.getComponentRect('textExceed01');
      let textExceed02: RectValue = CommonFunc.getComponentRect('textExceed02');
      let textExceed03: RectValue = CommonFunc.getComponentRect('textExceed03');
      let flexExceed01: RectValue = CommonFunc.getComponentRect('flexExceed01');

      expect(Math.abs(textExceed01.top - textExceed02.top) <= 1).assertTrue()
      expect(Math.abs(textExceed02.top - textExceed03.top) <= 1).assertTrue()
      expect(textExceed01.top).assertLarger(flexExceed01.top)

      expect(Math.abs(textExceed01.bottom - textExceed02.bottom) <= 1).assertTrue()
      expect(Math.abs(textExceed02.bottom - textExceed03.bottom) <= 1).assertTrue()
      expect(textExceed01.bottom).assertLess(flexExceed01.bottom)
      expect(textExceed01.left).assertLarger(flexExceed01.left)
      expect(textExceed03.right).assertLess(flexExceed01.right)
      expect(Math.abs((textExceed01.bottom - textExceed01.top) - vp2px(140)) <= 1).assertTrue()
      expect(Math.abs((textExceed02.bottom - textExceed02.top) - vp2px(140)) <= 1).assertTrue()
      expect(Math.abs((textExceed03.bottom - textExceed03.top) - vp2px(140)) <= 1).assertTrue()
      expect(Math.abs((textExceed01.right - textExceed01.left) - vp2px(440 / 3)) <= 1).assertTrue()
      expect(Math.abs((textExceed02.right - textExceed02.left) - vp2px(440 / 3)) <= 1).assertTrue()
      expect(Math.abs((textExceed03.right - textExceed03.left) - vp2px(440 / 3)) <= 1).assertTrue()
      expect(JSON.parse(strJson1).$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(JSON.parse(strJson1).$attrs.constructor.alignItems).assertEqual('ItemAlign.Stretch')
      console.info('new testFlexItemAlignStretchSetMarPadExceed END');

    });
  })
}
