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
import CommonFunc, { RectValue } from '../../../../MainAbility/common/Common';
import GlobalContext from '../../../../MainAbility/common/GlobalContext';

export default function flex_AlignContent_SpaceBetween_FlexPadTest() {
  describe('Flex_AlignContent_SpaceBetween_FlexPadTest', () => {
    beforeEach(async () => {
      console.info("Flex_AlignContent_SpaceBetween_FlexPadTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/SpaceBetween/Flex_AlignContent_SpaceBetween_FlexPad',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_AlignContent_SpaceBetween_FlexPad state pages:" + JSON.stringify(pages));
        if (!("Flex_AlignContent_SpaceBetween_FlexPad" == pages.name)) {
          console.info("get Flex_AlignContent_SpaceBetween_FlexPad state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_AlignContent_SpaceBetween_FlexPad page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_AlignContent_SpaceBetween_FlexPad page error:" + err);
      }
      console.info("Flex_AlignContent_SpaceBetween_FlexPadTest beforeEach end");

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Flex_AlignContent_SpaceBetween_FlexPadTest after each called");
    });
    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_0400
     * @tc.name testAlignContentSpaceAroundFlexPadOverflow
     * @tc.desc The size of the parent component in the cross direction is not enough for the layout
     *               of the child components when the padding and margin of parent component was changed
     */
    it('testAlignContentSpaceAroundFlexPadOverflow', 0, async () => {
      console.info('[testAlignContentSpaceAroundFlexPadOverflow] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'padding', value: 50
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad01');
      let secondText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad02');
      let thirdText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad03');
      let fourthText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad04');
      let flexContainer: RectValue = CommonFunc.getComponentRect('FlexAlign_SpaceBetween_FlexPad_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceBetween_FlexPad_Container01');

      expect(JSON.parse(flexContainerStrJson).$type).assertEqual('Flex');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceBetween');

      expect(Math.abs(Math.round(firstText.bottom - firstText.top) - Math.round(vp2px(50))) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondText.bottom - secondText.top) - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdText.bottom - thirdText.top) - Math.round(vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Math.round(fourthText.bottom - fourthText.top) - Math.round(vp2px(200))) <= 1).assertTrue();

      expect(Math.abs(Math.round(firstText.top - flexContainer.top) - Math.round(vp2px(50))) <= 1).assertTrue(); //padding =50
      expect(Math.abs(Math.round(firstText.left - flexContainer.left) - Math.round(vp2px(50))) <= 1).assertTrue(); //padding =50
      expect(Math.abs(Math.round(firstText.left) - Math.round(secondText.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondText.left) - Math.round(thirdText.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdText.left) - Math.round(fourthText.left)) <= 1).assertTrue();

      expect(Math.abs(Math.round(firstText.bottom) - Math.round(secondText.top)) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondText.bottom) - Math.round(thirdText.top)) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdText.bottom) - Math.round(fourthText.top)) <= 1).assertTrue();
      expect(Math.abs(Math.round(fourthText.bottom - flexContainer.bottom) - Math.round(vp2px(10))) <= 1).assertTrue();
      console.info('[testAlignContentSpaceAroundFlexPadOverflow] END');

    });
    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_0500
     * @tc.name testAlignContentSpaceAroundFlexPadMeet
     * @tc.desc The size of the parent component in the cross direction meets the layout
     *               of the child components when the padding of parent component was changed
     */
    it('testAlignContentSpaceAroundFlexPadMeet', 0, async () => {
      console.info('[testAlignContentSpaceAroundFlexPadMeet] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'padding', value: 10
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad01');
      let secondText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad02');
      let thirdText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad03');
      let fourthText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexPad04');
      let flexContainer: RectValue = CommonFunc.getComponentRect('FlexAlign_SpaceBetween_FlexPad_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceBetween_FlexPad_Container01');

      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceBetween');

      expect(Math.abs(Math.round(firstText.bottom - firstText.top) - Math.round(vp2px(50))) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondText.bottom - secondText.top) - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdText.bottom - thirdText.top) - Math.round(vp2px(150))) <= 1).assertTrue();
      expect(Math.abs(Math.round(fourthText.bottom - fourthText.top) - Math.round(vp2px(200))) <= 1).assertTrue();

      expect(Math.abs(Math.round(firstText.left - flexContainer.left) - Math.round(vp2px(10))) <= 1)
        .assertTrue(); //padding =10
      expect(Math.abs(Math.round(firstText.left) - Math.round(secondText.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondText.left) - Math.round(thirdText.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdText.left) - Math.round(fourthText.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(firstText.top - flexContainer.top) - Math.round(vp2px(10))) <= 1).assertTrue();
      expect(Math.abs(Math.round(flexContainer.bottom - fourthText.bottom) - Math.round(vp2px(10))) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondText.top - firstText.bottom) - Math.round(thirdText.top - secondText.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(thirdText.top - secondText.bottom) - Math.round(fourthText.top - thirdText.bottom)) <= 1)
        .assertTrue();

      console.info('[testAlignContentSpaceAroundFlexPadMeet] END');

    });
  })
}
