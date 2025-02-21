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

export default function flexOffset_CenterJsunit() {
  describe('flexItemAlignCenterTest1', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Center/FlexOffset',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get flexOffsetTest state success " + JSON.stringify(pages));
        if (!("flexOffsetTest" == pages.name)) {
          console.info("get flexOffsetTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push flexOffsetTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push flexOffsetTest page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("flexOffsetTest after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_CENTER_1000
     * @tc.name testFlexItemAlignCenterSetOffset
     * @tc.desc First subcomponent set offset attribute.
     */
    it('testFlexItemAlignCenterSetOffset', 0, async () => {
      console.info('new testFlexItemAlignCenterSetOffset START');
      let strJson1 = getInspectorByKey('flexOffset');

      let textOffset01: RectValue = CommonFunc.getComponentRect('textOffset01');
      let textOffset02: RectValue = CommonFunc.getComponentRect('textOffset02');
      let textOffset03: RectValue = CommonFunc.getComponentRect('textOffset03');
      let flexOffset: RectValue = CommonFunc.getComponentRect('flexOffset');
      expect(Math.abs(((textOffset01.right - textOffset02.left) * 10) / 10 - Math.round(vp2px(15) * 10) / 10) <= 1)
        .assertTrue()
      expect(Math.abs(((textOffset01.top - flexOffset.top) * 10) / 10 - Math.round(vp2px(105) * 10) / 10) <= 1)
        .assertTrue()
      expect(Math.abs(((textOffset01.left - flexOffset.left) * 10) / 10 - Math.round(vp2px(15) * 10) / 10) <= 1)
        .assertTrue()
      expect(Math.abs(((flexOffset.bottom - textOffset01.bottom) * 10) / 10 - Math.round(vp2px(45) * 10) / 10) <= 1)
        .assertTrue()
      expect(Math.abs(textOffset02.top - flexOffset.top - (flexOffset.bottom - textOffset02.bottom)) <= 1).assertTrue()
      expect(Math.abs(textOffset03.top - flexOffset.top - (flexOffset.bottom - textOffset03.bottom)) <= 1).assertTrue()
      expect(Math.abs(textOffset01.bottom - textOffset01.top - Math.round(vp2px(50))) <= 1).assertTrue()
      expect(Math.abs(textOffset02.bottom - textOffset02.top - Math.round(vp2px(100))) <= 1).assertTrue()
      expect(Math.abs(textOffset03.bottom - textOffset03.top - Math.round(vp2px(150))) <= 1).assertTrue()
      expect(Math.abs(textOffset01.right - textOffset01.left - Math.round(vp2px(150))) <= 1).assertTrue()
      expect(Math.abs(textOffset02.right - textOffset02.left - Math.round(vp2px(150))) <= 1).assertTrue()
      expect(Math.abs(textOffset03.right - textOffset03.left - Math.round(vp2px(150))) <= 1).assertTrue()
      expect(JSON.parse(strJson1).$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(JSON.parse(strJson1).$attrs.constructor.alignItems).assertEqual('ItemAlign.Center')
      console.info('new testFlexItemAlignCenterSetOffset END');

    });
  })
}
