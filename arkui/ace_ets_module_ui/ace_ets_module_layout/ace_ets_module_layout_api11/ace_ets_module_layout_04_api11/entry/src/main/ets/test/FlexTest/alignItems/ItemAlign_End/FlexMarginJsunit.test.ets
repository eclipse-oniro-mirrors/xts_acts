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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc, { RectValue } from "../../../../MainAbility/common/Common";
import { MessageManager, Callback } from '../../../../MainAbility/common/MessageManager';

export default function flexMargin_EndJsunit() {
  describe('flexItemAlignEndTest5', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_End/FlexMargin',
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
     * @tc.number SUB_ACE_FLEXALIGNITEMS_END_0500
     * @tc.name testItemAlignEndParentSetMargin
     * @tc.desc Parent component set margin attribute.
     */
    it('testItemAlignEndParentSetMargin', 0, async () => {
      console.info('new testItemAlignEndParentSetMargin START');
      let strJson1 = getInspectorByKey('flexMargin');

      let textFlexMargin01: RectValue = CommonFunc.getComponentRect('textFlexMargin01');
      let textFlexMargin02: RectValue = CommonFunc.getComponentRect('textFlexMargin02');
      let textFlexMargin03: RectValue = CommonFunc.getComponentRect('textFlexMargin03');
      let flexMargin: RectValue = CommonFunc.getComponentRect('flexMargin');
      expect(Math.abs(textFlexMargin01.left - flexMargin.left) <= 1).assertTrue()
      expect(Math.abs(textFlexMargin01.right - textFlexMargin02.left) <= 1).assertTrue()
      expect(Math.abs(textFlexMargin02.right - textFlexMargin03.left) <= 1).assertTrue()

      expect(Math.abs(flexMargin.bottom - textFlexMargin01.bottom) <= 1).assertTrue()
      expect(Math.abs(textFlexMargin01.bottom - textFlexMargin02.bottom) <= 1).assertTrue()
      expect(Math.abs(textFlexMargin02.bottom - textFlexMargin03.bottom) <= 1).assertTrue()

      expect(Math.abs(textFlexMargin01.bottom - textFlexMargin01.top - Math.round(vp2px(50))) <= 1).assertTrue()
      expect(Math.abs(textFlexMargin02.bottom - textFlexMargin02.top - Math.round(vp2px(100))) <= 1).assertTrue()
      expect(Math.abs(textFlexMargin03.bottom - textFlexMargin03.top - Math.round(vp2px(150))) <= 1).assertTrue()
      expect(Math.abs(textFlexMargin01.right - textFlexMargin01.left - Math.round(vp2px(150))) <= 1).assertTrue()
      expect(Math.abs(textFlexMargin02.right - textFlexMargin02.left - Math.round(vp2px(150))) <= 1).assertTrue()
      expect(Math.abs(textFlexMargin03.right - textFlexMargin03.left - Math.round(vp2px(150))) <= 1).assertTrue()
      expect(JSON.parse(strJson1).$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(JSON.parse(strJson1).$attrs.constructor.alignItems).assertEqual('ItemAlign.End')
      console.info('new testItemAlignEndParentSetMargin END');

    });
  })
}
