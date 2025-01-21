
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
export default function flex_AlignContent_SpaceBetween_TextSizeTest() {
  describe('Flex_AlignContent_SpaceBetween_TextSizeTest', function () {
    beforeEach(async function (done) {
      console.info("Flex_AlignContent_SpaceBetween_TextSizeTest beforeEach start");
      let options = {
        url: 'MainAbility/pages/Flex/alignContent/SpaceBetween/Flex_AlignContent_SpaceBetween_TextSize',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_AlignContent_SpaceBetween_TextSize state pages:" + JSON.stringify(pages));
        if (!("Flex_AlignContent_SpaceBetween_TextSize" == pages.name)) {
          console.info("get Flex_AlignContent_SpaceBetween_TextSize state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_AlignContent_SpaceBetween_TextSize page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_AlignContent_SpaceBetween_TextSize page error:" + err);
      }
      console.info("Flex_AlignContent_SpaceBetween_TextSizeTest beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("Flex_AlignContent_SpaceBetween_TextSizeTest after each called");
    });
    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_1100
     * @tc.name      testFlexAlignContentSpaceAroundTextSizeMeet
     * @tc.desc      The size of the parent component in the cross direction meets the layout
     *               of the child components when the height and width of parent component changed
     */
    it('testFlexAlignContentSpaceAroundTextSizeMeet', 0, async function (done) {
      console.info('[testFlexAlignContentSpaceAroundTextSizeMeet] START');
      globalThis.value.message.notify({name:'height', value:70})
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextSize01');
      let secondText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextSize02');
      let thirdText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextSize03');
      let fourthText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextSize04');
      let flexContainer = CommonFunc.getComponentRect('FlexAlign_SpaceBetween_TextSize_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceBetween_TextSize_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
      expect(flexContainerObj.$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceBetween');

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(Math.round(vp2px(70)));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(Math.round(vp2px(50)));
      expect(Math.round(fourthText.bottom - fourthText.top)).assertEqual(Math.round(vp2px(100)));

      expect(Math.abs(firstText.left - secondText.left) <= 1).assertTrue();
      expect(Math.abs(secondText.left - thirdText.left) <= 1).assertTrue();
      expect(Math.abs(thirdText.left - fourthText.left) <= 1).assertTrue();
      expect(Math.abs(fourthText.left - flexContainer.left) <= 1).assertTrue();
      expect(Math.abs(firstText.top - flexContainer.top) <= 1).assertTrue();
      expect(Math.abs(fourthText.bottom - flexContainer.bottom) <= 1).assertTrue();

      expect(Math.abs(Math.round(secondText.top - firstText.bottom) - Math.round(thirdText.top - secondText.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdText.top - secondText.bottom) - Math.round(fourthText.top - thirdText.bottom)) <= 1).assertTrue();
      console.info('[testFlexAlignContentSpaceAroundTextSizeMeet] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_1200
     * @tc.name      testFlexAlignContentSpaceAroundTextSizeOverflow
     * @tc.desc      The size of the parent component in the cross direction is not enough for the layout
     *               of the child components when the height and width of parent component changed
     */
    it('testFlexAlignContentSpaceAroundTextSizeOverflow', 0, async function (done) {
      console.info('[testFlexAlignContentSpaceAroundTextSizeOverflow] START');
      globalThis.value.message.notify({name:'height', value:200})
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextSize01');
      let secondText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextSize02');
      let thirdText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextSize03');
      let fourthText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextSize04');
      let flexContainer = CommonFunc.getComponentRect('FlexAlign_SpaceBetween_TextSize_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceBetween_TextSize_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
      expect(flexContainerObj.$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceBetween');

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(Math.round(vp2px(200)));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(Math.round(vp2px(50)));
      expect(Math.round(fourthText.bottom - fourthText.top)).assertEqual(Math.round(vp2px(100)));

      expect(Math.abs(firstText.bottom - secondText.top) <= 1).assertTrue();
      expect(Math.abs(secondText.bottom - thirdText.top) <= 1).assertTrue();
      expect(Math.abs(thirdText.bottom - fourthText.top) <= 1).assertTrue();

      expect(Math.abs(firstText.left - secondText.left) <= 1).assertTrue();
      expect(Math.abs(secondText.left - thirdText.left) <= 1).assertTrue();
      expect(Math.abs(thirdText.left - fourthText.left) <= 1).assertTrue();
      expect(Math.abs(fourthText.left - flexContainer.left) <= 1).assertTrue();

      expect(Math.abs(firstText.top - flexContainer.top) <= 1).assertTrue();
      expect(Math.round(fourthText.bottom - flexContainer.bottom)).assertEqual(Math.round(vp2px(50)));
      console.info('[testFlexAlignContentSpaceAroundTextSizeOverflow] END');
      done();
    });
  })
}
