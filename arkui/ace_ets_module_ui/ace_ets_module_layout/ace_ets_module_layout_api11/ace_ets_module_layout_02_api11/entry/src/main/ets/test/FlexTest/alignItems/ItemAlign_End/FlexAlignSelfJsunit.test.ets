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

export default function flexAlignSelf_EndJsunit() {
  describe('flexItemAlignEndTest7', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_End/ItemAlign_End_FlexAlignSelf',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get ItemAlign_End_FlexAlignSelf state success " + JSON.stringify(pages));
        if (!("ItemAlign_End_FlexAlignSelf" == pages.name)) {
          console.info("get ItemAlign_End_FlexAlignSelf state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push ItemAlign_End_FlexAlignSelf page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ItemAlign_End_FlexAlignSelf page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);

    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ItemAlign_End_FlexAlignSelf after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_END_1300
     * @tc.name testFlexItemAlignEndSetAlignSelf
     * @tc.desc The first subcomponent set AlignSelf attribute.
     */
    it('testFlexItemAlignEndSetAlignSelf',  Level.LEVEL0, async () => {
      console.info('new testFlexItemAlignEndSetAlignSelf START');
      let strJson1 = getInspectorByKey('ItemAlign_End_flexAlignSelf');

      let strJson2 = getInspectorByKey('ItemAlign_End_textAlignSelf01');

      let textAlignSelf01: RectValue = CommonFunc.getComponentRect('ItemAlign_End_textAlignSelf01');
      let textAlignSelf02: RectValue = CommonFunc.getComponentRect('ItemAlign_End_textAlignSelf02');
      let textAlignSelf03: RectValue = CommonFunc.getComponentRect('ItemAlign_End_textAlignSelf03');
      let flexAlignSelf01: RectValue = CommonFunc.getComponentRect('ItemAlign_End_flexAlignSelf');
      expect(Math.abs(textAlignSelf01.left - flexAlignSelf01.left) <= 1).assertTrue()
      expect(Math.abs(textAlignSelf01.right - textAlignSelf02.left) <= 1).assertTrue()
      expect(Math.abs(textAlignSelf02.right - textAlignSelf03.left) <= 1).assertTrue()
      expect(Math.abs(textAlignSelf01.bottom - textAlignSelf02.bottom) <= 1).assertTrue()
      expect(Math.abs(textAlignSelf02.bottom - textAlignSelf03.bottom) <= 1).assertTrue()
      expect(Math.abs(textAlignSelf01.bottom - flexAlignSelf01.bottom) <= 1).assertTrue()

      expect(Math.abs((textAlignSelf01.bottom - textAlignSelf01.top) - vp2px(50)) <= 1).assertTrue()
      expect(Math.abs((textAlignSelf01.right - textAlignSelf01.left) - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs((textAlignSelf02.bottom - textAlignSelf02.top) - vp2px(100)) <= 1).assertTrue()
      expect(Math.abs((textAlignSelf02.right - textAlignSelf02.left) - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs((textAlignSelf03.bottom - textAlignSelf03.top) - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs((textAlignSelf03.right - textAlignSelf03.left) - vp2px(150)) <= 1).assertTrue()

      expect(JSON.parse(strJson1).$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(JSON.parse(strJson1).$attrs.constructor.alignItems).assertEqual('ItemAlign.End')
      expect(JSON.parse(strJson2).$attrs.alignSelf).assertEqual("ItemAlign.End");
      console.info('new testFlexItemAlignEndSetAlignSelf END');

    });
  })
}
