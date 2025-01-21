
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
export default function flex_AlignContent_SpaceBetween_FlexMarPadTest() {
  describe('Flex_AlignContent_SpaceBetween_FlexMarPadTest', function () {
    beforeEach(async function (done) {
      console.info("flex_AlignContent_SpaceBetween_FlexMarPadTest beforeEach start");
      let options = {
        url: 'MainAbility/pages/Flex/alignContent/SpaceBetween/Flex_AlignContent_SpaceBetween_FlexMarPad',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_AlignContent_SpaceBetween_FlexMarPad state pages:" + JSON.stringify(pages));
        if (!("Flex_AlignContent_SpaceBetween_FlexMarPad" == pages.name)) {
          console.info("get Flex_AlignContent_SpaceBetween_FlexMarPad state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_AlignContent_SpaceBetween_FlexMarPad page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_AlignContent_SpaceBetween_FlexMarPad page error:" + err);
      }
      console.info("flex_AlignContent_SpaceBetween_FlexMarPadTest beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("Flex_AlignContent_SpaceBetween_FlexMarPadTest after each called");
    });
    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_0200
     * @tc.name      testFlexAlignContentSpaceAroundFlexMarPadMeet
     * @tc.desc      The size of the parent component in the cross direction is not enough for the layout
     *               of the child components when the padding and margin of parent component was changed
     */
    it('testFlexAlignContentSpaceAroundFlexMarPadMeet', 0, async function (done) {
      console.info('[testFlexAlignContentSpaceAroundFlexMarPadMeet] START');
      globalThis.value.message.notify({name:'padding', value:50});
      globalThis.value.message.notify({name:'margin', value:20});

      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexMarPad01');
      let secondText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexMarPad02');
      let thirdText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexMarPad03');
      let fourthText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexMarPad04');
      let flexContainer = CommonFunc.getComponentRect('FlexAlign_SpaceBetween_FlexMarPad_Container01');
      let columnContainer = CommonFunc.getComponentRect('Column_Align_SpaceBetween_FlexMarPad_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceBetween_FlexMarPad_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
      expect(flexContainerObj.$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceBetween');

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(Math.round(vp2px(50)));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(Math.round(vp2px(150)));
      expect(Math.round(fourthText.bottom - fourthText.top)).assertEqual(Math.round(vp2px(200)));

      expect(Math.round(flexContainer.top - columnContainer.top)).assertEqual(Math.round(vp2px(20))); //margin =20
      expect(Math.round(firstText.top - flexContainer.top)).assertEqual(Math.round(vp2px(50)));
      expect(Math.round(firstText.left - flexContainer.left)).assertEqual(Math.round(vp2px(50)));
      expect(Math.abs(firstText.left - secondText.left) <= 1).assertTrue();
      expect(Math.abs(secondText.left - thirdText.left) <= 1).assertTrue();
      expect(Math.abs(thirdText.left - fourthText.left) <= 1).assertTrue();

      expect(Math.abs(firstText.bottom - secondText.top) <= 1).assertTrue();
      expect(Math.abs(secondText.bottom - thirdText.top) <= 1).assertTrue();
      expect(Math.abs(thirdText.bottom - fourthText.top) <= 1).assertTrue();
      expect(Math.round(fourthText.bottom - flexContainer.bottom)).assertEqual(Math.round(vp2px(10)));
      console.info('[testFlexAlignContentSpaceAroundFlexMarPadMeet] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_0300
     * @tc.name      testFlexAlignContentSpaceAroundFlexMarPadOverflow
     * @tc.desc      The size of the parent component in the cross direction meets the layout
     *               of the child components when the padding and margin of parent component was changed
     */
    it('testFlexAlignContentSpaceAroundFlexMarPadOverflow', 0, async function (done) {
      console.info('[testFlexAlignContentSpaceAroundFlexMarPadOverflow] START');
      globalThis.value.message.notify({name:'margin', value:30})
      globalThis.value.message.notify({name:'padding', value:10})
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexMarPad01');
      let secondText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexMarPad02');
      let thirdText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexMarPad03');
      let fourthText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexMarPad04');
      let flexContainer = CommonFunc.getComponentRect('FlexAlign_SpaceBetween_FlexMarPad_Container01');
      let columnContainer = CommonFunc.getComponentRect('Column_Align_SpaceBetween_FlexMarPad_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceBetween_FlexMarPad_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
      expect(flexContainerObj.$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceBetween');

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(Math.round(vp2px(50)));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.floor(thirdText.bottom - thirdText.top)).assertEqual(Math.floor(vp2px(150)));
      expect(Math.round(fourthText.bottom - fourthText.top)).assertEqual(Math.round(vp2px(200)));

      expect(Math.round(firstText.top - flexContainer.top)).assertEqual(Math.round(vp2px(10)));
      expect(Math.round(firstText.left - flexContainer.left)).assertEqual(Math.round(vp2px(10))); //padding =10
      expect(Math.round(flexContainer.top - columnContainer.top)).assertEqual(Math.round(vp2px(30))); //margin =30
      expect(Math.abs(firstText.left - secondText.left) <= 1).assertTrue();
      expect(Math.abs(secondText.left - thirdText.left) <= 1).assertTrue();
      expect(Math.abs(thirdText.left - fourthText.left) <= 1).assertTrue();
      expect(Math.round(flexContainer.bottom - fourthText.bottom)).assertEqual(Math.round(vp2px(10)));

      expect(Math.abs(Math.round(secondText.top - firstText.bottom) - Math.round(thirdText.top - secondText.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdText.top - secondText.bottom) - Math.round(fourthText.top - thirdText.bottom)) <= 1).assertTrue();
      console.info('[testFlexAlignContentSpaceAroundFlexMarPadOverflow] END');
      done();
    });
  })
}
