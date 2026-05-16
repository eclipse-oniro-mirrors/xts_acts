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
     * @tc.name   testAlignContentSpaceAroundFlexPadOverflow
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_0400
     * @tc.desc   The size of the parent component in the cross direction is not enough for the layout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAlignContentSpaceAroundFlexPadOverflow',  Level.LEVEL0, async () => {
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

      expect(Math.floor(Math.abs((firstText.bottom - firstText.top) - vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.bottom - secondText.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.bottom - thirdText.top) - vp2px(150))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((fourthText.bottom - fourthText.top) - vp2px(200))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.top - flexContainer.top) - vp2px(50))) <= 1).assertTrue(); //padding =50
      expect(Math.floor(Math.abs((firstText.left - flexContainer.left) - vp2px(50))) <= 1).assertTrue(); //padding =50
      expect(Math.floor(Math.abs(firstText.left - secondText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.left - thirdText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.left - fourthText.left)) <= 1).assertTrue();

      expect(Math.floor(Math.abs(firstText.bottom - secondText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.bottom - thirdText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.bottom - fourthText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((fourthText.bottom - flexContainer.bottom) - vp2px(10))) <= 1).assertTrue();
      console.info('[testAlignContentSpaceAroundFlexPadOverflow] END');

    });
    /**
     * @tc.name   testAlignContentSpaceAroundFlexPadMeet
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_0500
     * @tc.desc   The size of the parent component in the cross direction meets the layout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAlignContentSpaceAroundFlexPadMeet',  Level.LEVEL0, async () => {
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

      console.info('[testAlignContentSpaceAroundFlexPadMeet] 1:' + Math.floor(Math.abs((firstText.bottom - firstText.top) - vp2px(50))));
      expect(Math.floor(Math.abs((firstText.bottom - firstText.top) - vp2px(50))) <= 1).assertTrue();

      console.info('[testAlignContentSpaceAroundFlexPadMeet] 2:' + Math.floor(Math.abs((secondText.bottom - secondText.top) - vp2px(100))));
      expect(Math.floor(Math.abs((secondText.bottom - secondText.top) - vp2px(100))) <= 1).assertTrue();

      console.info('[testAlignContentSpaceAroundFlexPadMeet] 3:' + Math.floor(Math.abs((thirdText.bottom - thirdText.top) - vp2px(150))));
      expect(Math.floor(Math.abs((thirdText.bottom - thirdText.top) - vp2px(150))) <= 1).assertTrue();

      console.info('[testAlignContentSpaceAroundFlexPadMeet] 4:' + Math.floor(Math.abs((fourthText.bottom - fourthText.top) - vp2px(200))));
      expect(Math.floor(Math.abs((fourthText.bottom - fourthText.top) - vp2px(200))) <= 1).assertTrue();

      console.info('[testAlignContentSpaceAroundFlexPadMeet] 5:' + Math.floor(Math.abs((firstText.left - flexContainer.left) - vp2px(10))));
      expect(Math.floor(Math.abs((firstText.left - flexContainer.left) - vp2px(10))) <= 1).assertTrue(); //padding =10

      console.info('[testAlignContentSpaceAroundFlexPadMeet] 6:' + Math.floor(Math.abs(firstText.left - secondText.left)));
      expect(Math.floor(Math.abs(firstText.left - secondText.left)) <= 1).assertTrue();

      console.info('[testAlignContentSpaceAroundFlexPadMeet] 7:' + Math.floor(Math.abs(secondText.left - thirdText.left)));
      expect(Math.floor(Math.abs(secondText.left - thirdText.left)) <= 1).assertTrue();

      console.info('[testAlignContentSpaceAroundFlexPadMeet] 8:' + Math.floor(Math.abs(thirdText.left - fourthText.left)));
      expect(Math.floor(Math.abs(thirdText.left - fourthText.left)) <= 1).assertTrue();

      console.info('[testAlignContentSpaceAroundFlexPadMeet] 9:' + Math.floor(Math.abs((firstText.top - flexContainer.top) - vp2px(10))));
      expect(Math.floor(Math.abs((firstText.top - flexContainer.top) - vp2px(10))) <= 1).assertTrue();

      console.info('[testAlignContentSpaceAroundFlexPadMeet] 10:' + Math.floor(Math.abs((flexContainer.bottom - fourthText.bottom) - vp2px(10))));
      expect(Math.floor(Math.abs((flexContainer.bottom - fourthText.bottom) - vp2px(10))) <= 1).assertTrue();

      console.info('[testAlignContentSpaceAroundFlexPadMeet] 11:' + Math.floor(Math.abs((secondText.top - firstText.bottom) - (thirdText.top - secondText.bottom))));
      expect(Math.floor(Math.abs((secondText.top - firstText.bottom) - (thirdText.top - secondText.bottom))) <= 2)
        .assertTrue();

      console.info('[testAlignContentSpaceAroundFlexPadMeet] 12:' + Math.floor(Math.abs((thirdText.top - secondText.bottom) - (fourthText.top - thirdText.bottom))));
      expect(Math.floor(Math.abs((thirdText.top - secondText.bottom) - (fourthText.top - thirdText.bottom))) <= 2)
        .assertTrue();

      console.info('[testAlignContentSpaceAroundFlexPadMeet] END');

    });
  })
}