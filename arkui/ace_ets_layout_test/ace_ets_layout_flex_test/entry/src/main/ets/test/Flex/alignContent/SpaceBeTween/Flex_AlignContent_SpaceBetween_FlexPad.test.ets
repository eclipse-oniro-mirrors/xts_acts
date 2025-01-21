
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
export default function flex_AlignContent_SpaceBetween_FlexPadTest() {
  describe('Flex_AlignContent_SpaceBetween_FlexPadTest', function () {
    beforeEach(async function (done) {
      console.info("Flex_AlignContent_SpaceBetween_FlexPadTest beforeEach start");
      let options = {
        url: 'MainAbility/pages/Flex/alignContent/SpaceBetween/Flex_AlignContent_SpaceBetween_FlexPad',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_AlignContent_SpaceBetween_FlexPad state pages:" + JSON.stringify(pages));
        if (!("Flex_AlignContent_SpaceBetween_FlexPad" == pages.name)) {
          console.info("get Flex_AlignContent_SpaceBetween_FlexPad state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_AlignContent_SpaceBetween_FlexPad page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_AlignContent_SpaceBetween_FlexPad page error:" + err);
      }
      console.info("Flex_AlignContent_SpaceBetween_FlexPadTest beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("Flex_AlignContent_SpaceBetween_FlexPadTest after each called");
    });
    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_0400
     * @tc.name      testAlignContentSpaceAroundFlexPadOverflow
     * @tc.desc      The size of the parent component in the cross direction is not enough for the layout
     *               of the child components when the padding and margin of parent component was changed
     */
    it('testAlignContentSpaceAroundFlexPadOverflow', 0, async function (done) {
      console.info('[testAlignContentSpaceAroundFlexPadOverflow] START');
      globalThis.value.message.notify({name:'padding', value:50})
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad01');
      let secondText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad02');
      let thirdText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad03');
      let fourthText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad04');
      let flexContainer = CommonFunc.getComponentRect('FlexAlign_SpaceBetween_FlexPad_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceBetween_FlexPad_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
      expect(flexContainerObj.$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceBetween');

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(Math.round(vp2px(50)));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(Math.round(vp2px(150)));
      expect(Math.round(fourthText.bottom - fourthText.top)).assertEqual(Math.round(vp2px(200)));

      expect(Math.round(firstText.top - flexContainer.top)).assertEqual(Math.round(vp2px(50))); //padding =50
      expect(Math.round(firstText.left - flexContainer.left)).assertEqual(Math.round(vp2px(50))); //padding =50
      expect(firstText.left).assertEqual(secondText.left);
      expect(secondText.left).assertEqual(thirdText.left);
      expect(thirdText.left).assertEqual(fourthText.left);

      expect(firstText.bottom).assertEqual(secondText.top);
      expect(secondText.bottom).assertEqual(thirdText.top);
      expect(thirdText.bottom).assertEqual(fourthText.top);
      expect(Math.round(fourthText.bottom - flexContainer.bottom)).assertEqual(Math.round(vp2px(10)));
      console.info('[testAlignContentSpaceAroundFlexPadOverflow] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_0500
     * @tc.name      testAlignContentSpaceAroundFlexPadMeet
     * @tc.desc      The size of the parent component in the cross direction meets the layout
     *               of the child components when the padding of parent component was changed
     */
    it('testAlignContentSpaceAroundFlexPadMeet', 0, async function (done) {
      console.info('[testAlignContentSpaceAroundFlexPadMeet] START');
      globalThis.value.message.notify({name:'padding', value:10})
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad01');
      let secondText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad02');
      let thirdText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad03');
      let fourthText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad04');
      let flexContainer = CommonFunc.getComponentRect('FlexAlign_SpaceBetween_FlexPad_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceBetween_FlexPad_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
      expect(flexContainerObj.$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceBetween');

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(Math.round(vp2px(50)));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.abs(Math.round(thirdText.bottom - thirdText.top) - Math.round(vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Math.round(fourthText.bottom - fourthText.top) - Math.round(vp2px(200))) <= 1).assertTrue();
      
      expect(Math.abs(Math.round(firstText.left - flexContainer.left) - Math.round(vp2px(10))) <= 1).assertTrue();//padding =10
      expect(Math.abs(Math.round(firstText.left) - Math.round(secondText.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondText.left) - Math.round(thirdText.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdText.left) - Math.round(fourthText.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(firstText.top - flexContainer.top) - Math.round(vp2px(10))) <= 1).assertTrue();
      expect(Math.abs(Math.round(flexContainer.bottom - fourthText.bottom) - Math.round(vp2px(10))) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondText.top - firstText.bottom) - Math.round(thirdText.top - secondText.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdText.top - secondText.bottom) - Math.round(fourthText.top - thirdText.bottom)) <= 1).assertTrue();
      
      console.info('[testAlignContentSpaceAroundFlexPadMeet] END');
      done();
    });
  })
}
