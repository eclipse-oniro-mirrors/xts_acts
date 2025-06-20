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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../../../MainAbility/common/Common';
import GlobalContext from '../../../../MainAbility/common/GlobalContext';

export default function flex_AlignContent_SpaceBetween_TextMarTest() {
  describe('Flex_AlignContent_SpaceBetween_TextMarTest', () => {
    beforeEach(async () => {
      console.info("Flex_AlignContent_SpaceBetween_TextMarTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/SpaceBetween/Flex_AlignContent_SpaceBetween_TextMar',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_AlignContent_SpaceBetween_TextMar state pages:" + JSON.stringify(pages));
        if (!("Flex_AlignContent_SpaceBetween_TextMar" == pages.name)) {
          console.info("get Flex_AlignContent_SpaceBetween_TextMar state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_AlignContent_SpaceBetween_TextMar page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_AlignContent_SpaceBetween_TextMar page error:" + err);
      }
      console.info("Flex_AlignContent_SpaceBetween_TextMarTest beforeEach end");

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Flex_AlignContent_SpaceBetween_TextMarTest after each called");
    });
    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_0800
     * @tc.name testFlexAlignContentSpaceAroundTextMarginOverflow
     * @tc.desc The size of the parent component in the cross direction is not enough for the layout
     *               of the child components when the padding and margin of parent component was changed
     */
    it('testFlexAlignContentSpaceAroundTextMarginOverflow',  Level.LEVEL0, async () => {
      console.info('[testFlexAlignContentSpaceAroundTextMarginOverflow] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'margin', value: 65
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextMar01');
      let secondText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextMar02');
      let thirdText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextMar03');
      let fourthText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextMar04');
      let flexContainer: RectValue = CommonFunc.getComponentRect('FlexAlign_SpaceBetween_TextMar_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceBetween_TextMar_Container01');

      expect(JSON.parse(flexContainerStrJson).$type).assertEqual('Flex');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceBetween');

      expect(Math.floor(Math.abs(firstText.bottom - firstText.top - vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.bottom - secondText.top - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.bottom - thirdText.top - vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(fourthText.bottom - fourthText.top - vp2px(100))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.top - flexContainer.top) - vp2px(65))) <= 1)
        .assertTrue(); //margin =65
      expect(Math.floor(Math.abs((firstText.left - flexContainer.left) - vp2px(65))) <= 1)
        .assertTrue(); //margin =65
      expect(Math.floor(Math.abs(flexContainer.left - secondText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.left - thirdText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.left - fourthText.left)) <= 1).assertTrue();

      expect(Math.floor(Math.abs((secondText.top - firstText.bottom) - vp2px(65))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(secondText.bottom - thirdText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.bottom - fourthText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(fourthText.bottom - flexContainer.bottom - vp2px(30))) <= 1).assertTrue();
      console.info('[testFlexAlignContentSpaceAroundTextMarginOverflow] END');

    });
    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_0900
     * @tc.name testFlexAlignContentSpaceAroundTextMarginOverMeet
     * @tc.desc The size of the parent component in the cross direction meets the layout
     *               of the child components when the padding of parent component was changed
     */
    it('testFlexAlignContentSpaceAroundTextMarginOverMeet',  Level.LEVEL0, async () => {
      console.info('[testFlexAlignContentSpaceAroundTextMarginOverMeet] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'margin', value: 10
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextMar01');
      let secondText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextMar02');
      let thirdText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextMar03');
      let fourthText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextMar04');
      let flexContainer: RectValue = CommonFunc.getComponentRect('FlexAlign_SpaceBetween_TextMar_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceBetween_TextMar_Container01');

      expect(JSON.parse(flexContainerStrJson).$type).assertEqual('Flex');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceBetween');

      expect(Math.floor(Math.abs(firstText.bottom - firstText.top - vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.bottom - secondText.top - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.bottom - thirdText.top - vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(fourthText.bottom - fourthText.top - vp2px(100))) <= 1).assertTrue();

      expect(Math.floor(Math.abs(firstText.left - flexContainer.left - vp2px(10))) <= 1).assertTrue(); //margin =10
      expect(Math.floor(Math.abs(secondText.left - thirdText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.left - fourthText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(fourthText.left - flexContainer.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.top - flexContainer.top - vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(flexContainer.bottom - fourthText.bottom)) <= 1).assertTrue();

      expect(Math.floor(Math.abs((secondText.top - firstText.bottom - vp2px(10)) - (thirdText.top - secondText.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((thirdText.top - secondText.bottom) - (fourthText.top - thirdText.bottom))) <= 1)
        .assertTrue();
      console.info('[testFlexAlignContentSpaceAroundTextMarginOverMeet] END');

    });
  })
}
