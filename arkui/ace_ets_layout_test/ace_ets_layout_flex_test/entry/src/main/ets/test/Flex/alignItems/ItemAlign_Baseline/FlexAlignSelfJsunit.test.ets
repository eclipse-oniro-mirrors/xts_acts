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
import router from '@system.router';
import CommonFunc from "../../../../MainAbility/common/Common";
export default function flexAlignSelf_BaselineJsunit() {
  describe('flexItemAlignBaselineTest7', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Flex/alignItems/ItemAlign_Baseline/FlexAlignSelf',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexSecond state success " + JSON.stringify(pages));
        if (!("FlexSecond" == pages.name)) {
          console.info("get FlexSecond state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push FlexSecond page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexSecond page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("FlexSecond after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNITEMS_BASELINE_1300
     * @tc.name      testFlexItemAlignBaselineSetAlignSelf
     * @tc.desc      The first subcomponent set ItemAlign.End attribute.
     */
    it('testFlexItemAlignBaselineSetAlignSelf', 0, async function (done) {
      console.info('new testFlexItemAlignBaselineSetAlignSelf START');
      let strJson1 = getInspectorByKey('flexAlignSelf');
      let obj1 = JSON.parse(strJson1);
      let strJson2 = getInspectorByKey('textAlignSelf01');
      let obj2 = JSON.parse(strJson2);
      let alignSelf01 = CommonFunc.getComponentRect('textAlignSelf01');
      let alignSelf02 = CommonFunc.getComponentRect('textAlignSelf02');
      let alignSelf03 = CommonFunc.getComponentRect('textAlignSelf03');
      let flexAlignSelf01 = CommonFunc.getComponentRect('flexAlignSelf');
      expect(Math.abs(alignSelf01.bottom - flexAlignSelf01.bottom) <= 1).assertTrue()
      expect(Math.abs(alignSelf03.top - flexAlignSelf01.top) <= 1).assertTrue()
      expect(Math.abs(alignSelf02.top - alignSelf03.top - (alignSelf03.bottom - alignSelf02.bottom)) <= 1).assertTrue()
      expect(Math.abs(Math.round(alignSelf01.bottom - alignSelf01.top) - Math.round(vp2px(50))) <= 1).assertTrue()
      expect(Math.abs(Math.round(alignSelf02.bottom - alignSelf02.top) - Math.round(vp2px(100))) <= 1).assertTrue()
      expect(Math.abs(Math.round(alignSelf03.bottom - alignSelf03.top) - Math.round(vp2px(150))) <= 1).assertTrue()
      expect(Math.abs(Math.round(alignSelf01.right - alignSelf01.left) - Math.round(vp2px(150))) <= 1).assertTrue()
      expect(Math.abs(Math.round(alignSelf02.right - alignSelf02.left) - Math.round(vp2px(150))) <= 1).assertTrue()
      expect(Math.abs(Math.round(alignSelf03.right - alignSelf03.left) - Math.round(vp2px(150))) <= 1).assertTrue()

      expect(obj1.$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(obj1.$attrs.constructor.alignItems).assertEqual('ItemAlign.Baseline')
      expect(obj2.$attrs.alignSelf).assertEqual("ItemAlign.End");
      console.info('new testFlexItemAlignBaselineSetAlignSelf END');
      done();
    });
  })
}
