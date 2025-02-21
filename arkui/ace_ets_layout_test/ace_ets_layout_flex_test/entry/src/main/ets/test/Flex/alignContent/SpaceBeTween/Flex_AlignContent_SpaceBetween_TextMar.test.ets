
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
export default function flex_AlignContent_SpaceBetween_TextMarTest() {
  describe('Flex_AlignContent_SpaceBetween_TextMarTest', function () {
    beforeEach(async function (done) {
      console.info("Flex_AlignContent_SpaceBetween_TextMarTest beforeEach start");
      let options = {
        url: 'MainAbility/pages/Flex/alignContent/SpaceBetween/Flex_AlignContent_SpaceBetween_TextMar',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_AlignContent_SpaceBetween_TextMar state pages:" + JSON.stringify(pages));
        if (!("Flex_AlignContent_SpaceBetween_TextMar" == pages.name)) {
          console.info("get Flex_AlignContent_SpaceBetween_TextMar state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_AlignContent_SpaceBetween_TextMar page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_AlignContent_SpaceBetween_TextMar page error:" + err);
      }
      console.info("Flex_AlignContent_SpaceBetween_TextMarTest beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("Flex_AlignContent_SpaceBetween_TextMarTest after each called");
    });
    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_0800
     * @tc.name      testFlexAlignContentSpaceAroundTextMarginOverflow
     * @tc.desc      The size of the parent component in the cross direction is not enough for the layout
     *               of the child components when the padding and margin of parent component was changed
     */
    it('testFlexAlignContentSpaceAroundTextMarginOverflow', 0, async function (done) {
      console.info('[testFlexAlignContentSpaceAroundTextMarginOverflow] START');
      globalThis.value.message.notify({name:'margin', value:65})
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextMar01');
      let secondText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextMar02');
      let thirdText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextMar03');
      let fourthText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextMar04');
      let flexContainer = CommonFunc.getComponentRect('FlexAlign_SpaceBetween_TextMar_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceBetween_TextMar_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
      expect(flexContainerObj.$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceBetween');

      expect(Math.abs(firstText.bottom - firstText.top - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(secondText.bottom - secondText.top - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(thirdText.bottom - thirdText.top - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(fourthText.bottom - fourthText.top - vp2px(100)) <= 1).assertTrue();

      expect(Math.abs(Math.round((firstText.top - flexContainer.top)*10)/10 - Math.round(vp2px(65)*10)/10) <= 1).assertTrue(); //margin =65
      expect(Math.abs(Math.round((firstText.left - flexContainer.left)*10)/10 - Math.round(vp2px(65)*10)/10) <= 1).assertTrue(); //margin =65
      expect(Math.abs(flexContainer.left - secondText.left) <= 1).assertTrue();
      expect(Math.abs(secondText.left - thirdText.left) <= 1).assertTrue();
      expect(Math.abs(thirdText.left - fourthText.left) <= 1).assertTrue();

      expect(Math.abs(Math.round((secondText.top - firstText.bottom)*10)/10 - Math.round(vp2px(65)*10)/10)<= 1).assertTrue();
      expect(Math.abs(secondText.bottom - thirdText.top) <= 1).assertTrue();
      expect(Math.abs(thirdText.bottom - fourthText.top) <= 1).assertTrue();
      expect(Math.abs(fourthText.bottom - flexContainer.bottom - vp2px(30)) <= 1).assertTrue();
      console.info('[testFlexAlignContentSpaceAroundTextMarginOverflow] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_0900
     * @tc.name      testFlexAlignContentSpaceAroundTextMarginOverMeet
     * @tc.desc      The size of the parent component in the cross direction meets the layout
     *               of the child components when the padding of parent component was changed
     */
    it('testFlexAlignContentSpaceAroundTextMarginOverMeet', 0, async function (done) {
      console.info('[testFlexAlignContentSpaceAroundTextMarginOverMeet] START');
      globalThis.value.message.notify({name:'margin', value:10})
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextMar01');
      let secondText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextMar02');
      let thirdText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextMar03');
      let fourthText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextMar04');
      let flexContainer = CommonFunc.getComponentRect('FlexAlign_SpaceBetween_TextMar_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceBetween_TextMar_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
      expect(flexContainerObj.$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceBetween');

      expect(Math.round(firstText.bottom - firstText.top)).assertEqual(Math.round(vp2px(50)));
      expect(Math.round(secondText.bottom - secondText.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(thirdText.bottom - thirdText.top)).assertEqual(Math.round(vp2px(50)));
      expect(Math.round(fourthText.bottom - fourthText.top)).assertEqual(Math.round(vp2px(100)));

      expect(Math.round(firstText.left - flexContainer.left)).assertEqual(Math.round(vp2px(10))); //margin =10
      expect(Math.abs(secondText.left - thirdText.left) <= 1).assertTrue();
      expect(Math.abs(thirdText.left - fourthText.left) <= 1).assertTrue();
      expect(Math.abs(fourthText.left - flexContainer.left) <= 1).assertTrue();
      expect(Math.round(firstText.top - flexContainer.top)).assertEqual(Math.round(vp2px(10)));
      expect(Math.abs(flexContainer.bottom - fourthText.bottom) <= 1).assertTrue();

      expect(Math.abs(Math.round(secondText.top - firstText.bottom - vp2px(10)) - Math.round(thirdText.top - secondText.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdText.top - secondText.bottom) - Math.round(fourthText.top - thirdText.bottom)) <= 1).assertTrue();
      console.info('[testFlexAlignContentSpaceAroundTextMarginOverMeet] END');
      done();
    });
  })
}
