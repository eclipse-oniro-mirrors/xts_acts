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

export default function flexMargin_StretchJsunit() {
  describe('flexItemAlignStretchTest', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Stretch/FlexMargin',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexMargin state success " + JSON.stringify(pages));
        if (!("FlexMargin" == pages.name)) {
          console.info("get FlexMargin state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push FlexMargin page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexMargin page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FlexMargin after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_STRETCH_0500
     * @tc.name testItemAlignStretchParentSetMargin
     * @tc.desc Parent component set margin attribute.
     */
    it('testItemAlignStretchParentSetMargin', 0, async () => {
      console.info('new testItemAlignStretchParentSetMargin START');
      let strJson1 = getInspectorByKey('flexMargin');

      let textFlexMargin01: RectValue = CommonFunc.getComponentRect('textFlexMargin01');
      let textFlexMargin02: RectValue = CommonFunc.getComponentRect('textFlexMargin02');
      let textFlexMargin03: RectValue = CommonFunc.getComponentRect('textFlexMargin03');
      let flexMargin: RectValue = CommonFunc.getComponentRect('flexMargin');

      expect(Math.abs(textFlexMargin01.top - textFlexMargin02.top) <= 1).assertTrue()
      expect(Math.abs(textFlexMargin02.top - textFlexMargin03.top) <= 1).assertTrue()
      expect(Math.abs(textFlexMargin03.top - flexMargin.top) <= 1).assertTrue()

      expect(Math.abs(textFlexMargin01.bottom - textFlexMargin02.bottom) <= 1).assertTrue()
      expect(Math.abs(textFlexMargin02.bottom - textFlexMargin03.bottom) <= 1).assertTrue()
      expect(Math.abs(textFlexMargin03.bottom - flexMargin.bottom) <= 1).assertTrue()
      expect(Math.abs(textFlexMargin01.left - flexMargin.left) <= 1).assertTrue()
      expect(Math.abs(textFlexMargin02.left - textFlexMargin01.right) <= 1).assertTrue()
      expect(Math.abs(textFlexMargin03.left - textFlexMargin02.right) <= 1).assertTrue()
      expect(Math.abs((flexMargin.right - textFlexMargin03.right) - vp2px(50)) <= 1).assertTrue()

      expect(Math.abs((textFlexMargin01.bottom - textFlexMargin01.top) - vp2px(200)) <= 1).assertTrue()
      expect(Math.abs((textFlexMargin02.bottom - textFlexMargin02.top) - vp2px(200)) <= 1).assertTrue()
      expect(Math.abs((textFlexMargin03.bottom - textFlexMargin03.top) - vp2px(200)) <= 1).assertTrue()
      expect(Math.abs((textFlexMargin01.right - textFlexMargin01.left) - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs((textFlexMargin02.right - textFlexMargin02.left) - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs((textFlexMargin03.right - textFlexMargin03.left) - vp2px(150)) <= 1).assertTrue()
      expect(JSON.parse(strJson1).$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(JSON.parse(strJson1).$attrs.constructor.alignItems).assertEqual('ItemAlign.Stretch')
      console.info('new testItemAlignStretchParentSetMargin END');

    });
  })
}
