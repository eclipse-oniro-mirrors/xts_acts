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

export default function flexAlignSelf_CenterJsunit() {
  describe('flexItemAlignCenterTest7', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Center/ItemAlign_Center_FlexAlignSelf',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get ItemAlign_Center_FlexAlignSelf state success " + JSON.stringify(pages));
        if (!("ItemAlign_Center_FlexAlignSelf" == pages.name)) {
          console.info("get ItemAlign_Center_FlexAlignSelf state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push ItemAlign_Center_FlexAlignSelf page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ItemAlign_Center_FlexAlignSelf page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);

    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ItemAlign_Center_FlexAlignSelf after each called");
    });

    /**
     * @tc.name   testFlexItemAlignCenterSetAlignSelf
     * @tc.number SUB_ACE_FLEXALIGNITEMS_CENTER_1300
     * @tc.desc   The first subcomponent set ItemAlign.End attribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlexItemAlignCenterSetAlignSelf',  Level.LEVEL0, async () => {
      console.info('new testFlexItemAlignCenterSetAlignSelf START');
      let strJson1 = getInspectorByKey('ItemAlign_Center_flexAlignSelf');

      let strJson2 = getInspectorByKey('ItemAlign_Center_textAlignSelf01');

      let alignSelf01: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_textAlignSelf01');
      let alignSelf02: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_textAlignSelf02');
      let alignSelf03: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_textAlignSelf03');
      let flexAlignSelf01: RectValue = CommonFunc.getComponentRect('ItemAlign_Center_flexAlignSelf');
      expect(Math.abs(alignSelf01.bottom - flexAlignSelf01.bottom) <= 1).assertTrue()
      expect(Math.abs(alignSelf01.bottom - alignSelf01.top - Math.round(vp2px(50))) <= 1).assertTrue()
      expect(Math.abs(alignSelf01.right - alignSelf01.left - Math.round(vp2px(150))) <= 1).assertTrue()
      expect(Math.abs(alignSelf02.bottom - alignSelf02.top - Math.round(vp2px(100))) <= 1).assertTrue()
      expect(Math.abs(alignSelf02.right - alignSelf02.left - Math.round(vp2px(150))) <= 1).assertTrue()
      expect(Math.abs(alignSelf03.bottom - alignSelf03.top - Math.round(vp2px(150))) <= 1).assertTrue()
      expect(Math.abs(alignSelf03.right - alignSelf03.left - Math.round(vp2px(150))) <= 1).assertTrue()
      expect(Math.abs(alignSelf02.top - flexAlignSelf01.top - (flexAlignSelf01.bottom - alignSelf02.bottom)) <= 1)
        .assertTrue()
      expect(Math.abs(alignSelf03.top - flexAlignSelf01.top - (flexAlignSelf01.bottom - alignSelf03.bottom)) <= 1)
        .assertTrue()
      expect(JSON.parse(strJson1).$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(JSON.parse(strJson1).$attrs.constructor.alignItems).assertEqual('ItemAlign.Center')
      expect(JSON.parse(strJson2).$attrs.alignSelf).assertEqual("ItemAlign.End");
      expect(Math.abs(alignSelf03.right - alignSelf03.left - Math.round(vp2px(150))) <= 1).assertTrue()
      expect(Math.abs(alignSelf02.right - alignSelf02.left - Math.round(vp2px(150))) <= 1).assertTrue()
      expect(Math.abs(flexAlignSelf01.right - alignSelf03.right - Math.round(vp2px(50))) <= 1).assertTrue()
      console.info('new testFlexItemAlignCenterSetAlignSelf END');

    });
  })
}
