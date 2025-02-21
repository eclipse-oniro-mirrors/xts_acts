
/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../../../MainAbility/common/Common';
export default function flex_AlignContent_SpaceBetween_TextOffsetTest() {
  describe('Flex_AlignContent_SpaceBetween_TextOffsetTest', function () {
    beforeEach(async function (done) {
      console.info("Flex_AlignContent_SpaceBetween_TextOffsetTest beforeEach start");
      let options = {
        url: 'MainAbility/pages/Flex/alignContent/SpaceBetween/Flex_AlignContent_SpaceBetween_TextOffset',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_AlignContent_SpaceBetween_TextOffset state pages:" + JSON.stringify(pages));
        if (!("Flex_AlignContent_SpaceBetween_TextOffset" == pages.name)) {
          console.info("get Flex_AlignContent_SpaceBetween_TextOffset state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_AlignContent_SpaceBetween_TextOffset page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.info("Flex_AlignContent_SpaceBetween_TextOffsetTest beforeEach end");
        console.error("push Flex_AlignContent_SpaceBetween_TextOffset page error:" + err);
      }
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("Flex_AlignContent_SpaceBetween_TextOffsetTest after each called");
    });
    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_1000
     * @tc.name      testFlexAlignContentSpaceAroundTextOffset
     * @tc.desc      the offset of first subcomponent set to {x:10, y:10}
     */
    it('testFlexAlignContentSpaceAroundTextOffset', 0, async function (done) {
      console.info('[testFlexAlignContentSpaceAroundTextOffset] START');
      let firstText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextOffset01');
      let secondText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextOffset02');
      let distanceBefore = secondText.top - firstText.bottom;
      let secondTextTop = secondText.top - firstText.top;
      globalThis.value.message.notify({name:'offset', value:{x:10, y:10}})
      await CommonFunc.sleep(3000);
      firstText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextOffset01');
      secondText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextOffset02');
      let thirdText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextOffset03');
      let fourthText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextOffset04');
      let flexContainer = CommonFunc.getComponentRect('FlexAlign_SpaceBetween_TextOffset_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceBetween_TextOffset_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
      expect(flexContainerObj.$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceBetween');

      expect(Math.abs(Math.round(firstText.bottom - firstText.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondText.bottom - secondText.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdText.bottom - thirdText.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(Math.round(fourthText.bottom - fourthText.top) - vp2px(100)) <= 1).assertTrue();

      expect(Math.abs(firstText.top - flexContainer.top - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs(firstText.left - flexContainer.left - vp2px(10)) <= 1).assertTrue(); //offset =10
      expect(Math.abs(flexContainer.left - secondText.left) <= 1).assertTrue();
      expect(Math.abs(secondText.left - thirdText.left) <= 1).assertTrue();
      expect(Math.abs(thirdText.left - fourthText.left) <= 1).assertTrue();
      expect(Math.abs(fourthText.bottom - flexContainer.bottom) <= 1).assertTrue();

      expect(Math.abs(Math.round(thirdText.top - secondText.bottom) - Math.round(fourthText.top - thirdText.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdText.top - secondText.bottom) - Math.round(distanceBefore)) <= 1).assertTrue();
      console.info('[testFlexAlignContentSpaceAroundTextOffset] END');
      done();
    });
  })
}
