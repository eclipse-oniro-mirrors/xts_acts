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

export default function flexAlignSelf_StartJsunit() {
  describe('flexItemAlignStartTest7', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignItems/ItemAlign_Start/FlexAlignSelf',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexSecond state success " + JSON.stringify(pages));
        if (!("FlexSecond" == pages.name)) {
          console.info("get FlexSecond state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push FlexSecond page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexSecond page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);

    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("FlexSecond after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEXALIGNITEMS_START_1300
     * @tc.name testFlexItemAlignStartSetAlignSelf
     * @tc.desc The first subcomponent set ItemAlign.End attribute
     */
    it('testFlexItemAlignStartSetAlignSelf', 0, async () => {
      console.info('new testFlexItemAlignStartSetAlignSelf START');
      let strJson1 = getInspectorByKey('flexAlignSelf');

      let strJson2 = getInspectorByKey('textAlignSelf01');

      let textAlignSelf01: RectValue = CommonFunc.getComponentRect('textAlignSelf01');
      let textAlignSelf02: RectValue = CommonFunc.getComponentRect('textAlignSelf02');
      let textAlignSelf03: RectValue = CommonFunc.getComponentRect('textAlignSelf03');
      let flexAlignSelf01: RectValue = CommonFunc.getComponentRect('flexAlignSelf');
      expect(Math.abs(textAlignSelf01.left - flexAlignSelf01.left) <= 1).assertTrue();
      expect(Math.abs(textAlignSelf01.right - textAlignSelf02.left) <= 1).assertTrue();
      expect(Math.abs(textAlignSelf01.top - textAlignSelf02.bottom) <= 1).assertTrue();
      expect(Math.abs(textAlignSelf02.top - textAlignSelf03.top) <= 1).assertTrue();
      expect(Math.abs(textAlignSelf01.bottom - flexAlignSelf01.bottom) <= 1).assertTrue();

      expect(Math.abs((textAlignSelf01.bottom - textAlignSelf01.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs((textAlignSelf01.right - textAlignSelf01.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((textAlignSelf02.bottom - textAlignSelf02.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs((textAlignSelf02.right - textAlignSelf02.left) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((textAlignSelf03.bottom - textAlignSelf03.top) - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs((textAlignSelf03.right - textAlignSelf03.left) - vp2px(150)) <= 1).assertTrue();


      expect(JSON.parse(strJson1).$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(JSON.parse(strJson1).$attrs.constructor.alignItems).assertEqual('ItemAlign.Start')
      expect(JSON.parse(strJson2).$attrs.alignSelf).assertEqual("ItemAlign.End");
      console.info('new testFlexItemAlignStartSetAlignSelf END');

    });
  })
}
