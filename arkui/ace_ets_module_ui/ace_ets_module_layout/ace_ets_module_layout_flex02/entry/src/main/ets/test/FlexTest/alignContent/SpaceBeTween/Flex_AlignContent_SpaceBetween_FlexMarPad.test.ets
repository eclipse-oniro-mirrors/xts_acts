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

export default function flex_AlignContent_SpaceBetween_FlexMarPadTest() {
  describe('Flex_AlignContent_SpaceBetween_FlexMarPadTest', () => {
    beforeEach(async () => {
      console.info("flex_AlignContent_SpaceBetween_FlexMarPadTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/SpaceBetween/Flex_AlignContent_SpaceBetween_FlexMarPad',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_AlignContent_SpaceBetween_FlexMarPad state pages:" + JSON.stringify(pages));
        if (!("Flex_AlignContent_SpaceBetween_FlexMarPad" == pages.name)) {
          console.info("get Flex_AlignContent_SpaceBetween_FlexMarPad state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_AlignContent_SpaceBetween_FlexMarPad page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_AlignContent_SpaceBetween_FlexMarPad page error:" + err);
      }
      console.info("flex_AlignContent_SpaceBetween_FlexMarPadTest beforeEach end");

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Flex_AlignContent_SpaceBetween_FlexMarPadTest after each called");
    });
    /**
     * @tc.name   testFlexAlignContentSpaceAroundFlexMarPadMeet
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_0200
     * @tc.desc   The size of the parent component in the cross direction is not enough for the layout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlexAlignContentSpaceAroundFlexMarPadMeet',  Level.LEVEL0, async () => {
      console.info('[testFlexAlignContentSpaceAroundFlexMarPadMeet] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'padding', value: 50
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'margin', value: 20
      });

      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexMarPad01');
      let secondText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexMarPad02');
      let thirdText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexMarPad03');
      let fourthText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexMarPad04');
      let flexContainer: RectValue = CommonFunc.getComponentRect('FlexAlign_SpaceBetween_FlexMarPad_Container01');
      let columnContainer: RectValue = CommonFunc.getComponentRect('Column_Align_SpaceBetween_FlexMarPad_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceBetween_FlexMarPad_Container01');

      expect(JSON.parse(flexContainerStrJson).$type).assertEqual('Flex');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceBetween');

	  expect(Math.abs(Math.round(firstText.bottom - firstText.top) - Math.round(vp2px(50))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(secondText.bottom - secondText.top) - Math.round(vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(thirdText.bottom - thirdText.top) - Math.round(vp2px(150))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(fourthText.bottom - fourthText.top) - Math.round(vp2px(200))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(flexContainer.top - columnContainer.top) - Math.round(vp2px(20))) <= 1).assertTrue(); //margin =20
	  expect(Math.abs(Math.round(firstText.top - flexContainer.top) - Math.round(vp2px(50))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(firstText.left - flexContainer.left) - Math.round(vp2px(50))) <= 1).assertTrue();
      expect(Math.abs(firstText.left - secondText.left) <= 1).assertTrue();
      expect(Math.abs(secondText.left - thirdText.left) <= 1).assertTrue();
      expect(Math.abs(thirdText.left - fourthText.left) <= 1).assertTrue();

      expect(Math.abs(firstText.bottom - secondText.top) <= 1).assertTrue();
      expect(Math.abs(secondText.bottom - thirdText.top) <= 1).assertTrue();
      expect(Math.abs(thirdText.bottom - fourthText.top) <= 1).assertTrue();
	  expect(Math.abs(Math.round(fourthText.bottom - flexContainer.bottom) - Math.round(vp2px(10))) <= 1).assertTrue();
      console.info('[testFlexAlignContentSpaceAroundFlexMarPadMeet] END');

    });
    /**
     * @tc.name   testFlexAlignContentSpaceAroundFlexMarPadOverflow
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_0300
     * @tc.desc   The size of the parent component in the cross direction meets the layout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlexAlignContentSpaceAroundFlexMarPadOverflow',  Level.LEVEL0, async () => {
      console.info('[testFlexAlignContentSpaceAroundFlexMarPadOverflow] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'margin', value: 30
      })
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'padding', value: 10
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexMarPad01');
      let secondText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexMarPad02');
      let thirdText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexMarPad03');
      let fourthText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_FlexMarPad04');
      let flexContainer: RectValue = CommonFunc.getComponentRect('FlexAlign_SpaceBetween_FlexMarPad_Container01');
      let columnContainer: RectValue = CommonFunc.getComponentRect('Column_Align_SpaceBetween_FlexMarPad_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceBetween_FlexMarPad_Container01');

      expect(JSON.parse(flexContainerStrJson).$type).assertEqual('Flex');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceBetween');

      console.info('[testFlexAlignContentSpaceAroundFlexMarPadOverflow] 1:' + Math.floor(Math.abs(Math.round(firstText.bottom - firstText.top) - Math.round(vp2px(50)))));
	    expect(Math.floor(Math.abs(Math.round(firstText.bottom - firstText.top) - Math.round(vp2px(50)))) <= 1).assertTrue();

      console.info('[testFlexAlignContentSpaceAroundFlexMarPadOverflow] 2:' + Math.floor(Math.abs(Math.round(secondText.bottom - secondText.top) - Math.round(vp2px(100)))));
	    expect(Math.floor(Math.abs(Math.round(secondText.bottom - secondText.top) - Math.round(vp2px(100)))) <= 1).assertTrue();

      console.info('[testFlexAlignContentSpaceAroundFlexMarPadOverflow] 3:' + Math.floor(Math.abs(Math.round(thirdText.bottom - thirdText.top) - Math.round(vp2px(150)))));
	    expect(Math.floor(Math.abs(Math.round(thirdText.bottom - thirdText.top) - Math.round(vp2px(150)))) <= 1).assertTrue();

      console.info('[testFlexAlignContentSpaceAroundFlexMarPadOverflow] 4:' + Math.floor(Math.abs(Math.round(fourthText.bottom - fourthText.top) - Math.round(vp2px(200)))));
	    expect(Math.floor(Math.abs(Math.round(fourthText.bottom - fourthText.top) - Math.round(vp2px(200)))) <= 1).assertTrue();

      console.info('[testFlexAlignContentSpaceAroundFlexMarPadOverflow] 5:' + Math.floor(Math.abs(Math.round(firstText.top - flexContainer.top) - Math.round(vp2px(10)))));
	    expect(Math.floor(Math.abs(Math.round(firstText.top - flexContainer.top) - Math.round(vp2px(10)))) <= 1).assertTrue();

      console.info('[testFlexAlignContentSpaceAroundFlexMarPadOverflow] 6:' + Math.floor(Math.abs(Math.round(firstText.left - flexContainer.left) - Math.round(vp2px(10)))));
	    expect(Math.floor(Math.abs(Math.round(firstText.left - flexContainer.left) - Math.round(vp2px(10)))) <= 1).assertTrue(); //padding =10

      console.info('[testFlexAlignContentSpaceAroundFlexMarPadOverflow] 7:' + Math.floor(Math.abs(Math.round(flexContainer.top - columnContainer.top) - Math.round(vp2px(30)))));
	    expect(Math.floor(Math.abs(Math.round(flexContainer.top - columnContainer.top) - Math.round(vp2px(30)))) <= 1).assertTrue(); //margin =30

      console.info('[testFlexAlignContentSpaceAroundFlexMarPadOverflow] 8:' + Math.floor(Math.abs(firstText.left - secondText.left)));
      expect(Math.floor(Math.abs(firstText.left - secondText.left)) <= 1).assertTrue();

      console.info('[testFlexAlignContentSpaceAroundFlexMarPadOverflow] 9:' + Math.floor(Math.abs(secondText.left - thirdText.left)));
      expect(Math.floor(Math.abs(secondText.left - thirdText.left)) <= 1).assertTrue();

      console.info('[testFlexAlignContentSpaceAroundFlexMarPadOverflow] 10:' + Math.floor(Math.abs(thirdText.left - fourthText.left)));
      expect(Math.floor(Math.abs(thirdText.left - fourthText.left)) <= 1).assertTrue();

      console.info('[testFlexAlignContentSpaceAroundFlexMarPadOverflow] 11:' + Math.floor(Math.abs(Math.round(flexContainer.bottom - fourthText.bottom) - Math.round(vp2px(10)))));
	    expect(Math.floor(Math.abs(Math.round(flexContainer.bottom - fourthText.bottom) - Math.round(vp2px(10)))) <= 1).assertTrue();

      console.info('[testFlexAlignContentSpaceAroundFlexMarPadOverflow] 12:' + Math.floor(Math.abs(Math.round(secondText.top - firstText.bottom) - Math.round(thirdText.top - secondText.bottom))));
      expect(Math.floor(Math.abs(Math.round(secondText.top - firstText.bottom) - Math.round(thirdText.top - secondText.bottom))) <= 2)
        .assertTrue();

      console.info('[testFlexAlignContentSpaceAroundFlexMarPadOverflow] 13:' + Math.floor(Math.abs(Math.round(thirdText.top - secondText.bottom) - Math.round(fourthText.top - thirdText.bottom))));
      expect(Math.floor(Math.abs(Math.round(thirdText.top - secondText.bottom) - Math.round(fourthText.top - thirdText.bottom))) <= 2)
        .assertTrue();
      console.info('[testFlexAlignContentSpaceAroundFlexMarPadOverflow] END');

    });
  })
}