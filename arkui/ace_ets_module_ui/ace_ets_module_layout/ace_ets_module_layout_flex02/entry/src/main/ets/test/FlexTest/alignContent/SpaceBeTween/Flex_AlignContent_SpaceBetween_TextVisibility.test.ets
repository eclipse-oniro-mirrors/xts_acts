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

export default function flex_AlignContent_SpaceBetween_TextVisibilityTest() {
  describe('Flex_AlignContent_SpaceBetween_TextVisibilityTest', () => {
    beforeEach(async () => {
      console.info("Flex_AlignContent_SpaceBetween_TextVisibilityTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/SpaceBetween/Flex_AlignContent_SpaceBetween_TextVisibility',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_AlignContent_SpaceBetween_TextVisibility state pages:" + JSON.stringify(pages));
        if (!("Flex_AlignContent_SpaceBetween_TextVisibility" == pages.name)) {
          console.info("get Flex_AlignContent_SpaceBetween_TextVisibility state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_AlignContent_SpaceBetween_TextVisibility page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_AlignContent_SpaceBetween_TextVisibility page error:" + err);
      }
      console.info("Flex_AlignContent_SpaceBetween_TextVisibilityTest beforeEach end");

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'visibility', value: Visibility.Visible
      });
      console.info("Flex_AlignContent_SpaceBetween_TextVisibilityTest after each called");
    });
    /**
     * @tc.name   testFlexAlignContentSpaceAroundTextVisibilityHidden
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_1300
     * @tc.desc   The size of the parent component in the cross direction meets the layout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlexAlignContentSpaceAroundTextVisibilityHidden',  Level.LEVEL0, async () => {
      console.info('[testFlexAlignContentSpaceAroundTextVisibilityHidden] START');
      try {
        let firstText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextVisibility01');
        let secondText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextVisibility02');
        let distanceBefore = secondText.top - firstText.bottom;
        GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'visibility', value: Visibility.Hidden
        });
        await CommonFunc.sleep(3000);
        secondText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextVisibility02');
        let thirdText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextVisibility03');
        let fourthText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextVisibility04');
        let flexContainer: RectValue = CommonFunc.getComponentRect('FlexAlign_SpaceBetween_TextVisibility_Container01');
        let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceBetween_TextVisibility_Container01');

        expect(JSON.parse(flexContainerStrJson).$type).assertEqual('Flex');
        expect(JSON.parse(flexContainerStrJson).$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
        expect(JSON.parse(flexContainerStrJson).$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceBetween');

        let firstTextStrJson = getInspectorByKey('AlignContent_SpaceBetween_TextVisibility01');
        expect(JSON.parse(firstTextStrJson).$attrs.visibility).assertEqual("Visibility.Hidden");

	    expect(Math.abs(Math.round(secondText.bottom - secondText.top) - Math.round(vp2px(100))) <= 1).assertTrue();
	    expect(Math.abs(Math.round(thirdText.bottom - thirdText.top) - Math.round(vp2px(50))) <= 1).assertTrue();
	    expect(Math.abs(Math.round(fourthText.bottom - fourthText.top) - Math.round(vp2px(100))) <= 1).assertTrue();

        expect(Math.abs(secondText.left - thirdText.left) <= 1).assertTrue();
        expect(Math.abs(thirdText.left - fourthText.left) <= 1).assertTrue();
        expect(Math.abs(fourthText.left - flexContainer.left) <= 1).assertTrue();
	    expect(Math.abs(Math.round(secondText.top - flexContainer.top) - Math.round(distanceBefore + vp2px(50))) <= 1).assertTrue();
        expect(Math.abs(fourthText.bottom - flexContainer.bottom) <= 1).assertTrue();

        expect(Math.abs(Math.round(thirdText.top - secondText.bottom) - Math.round(fourthText.top - thirdText.bottom)) <= 1)
          .assertTrue();
        expect(Math.abs(Math.round(thirdText.top - secondText.bottom) - Math.round(distanceBefore)) <= 1).assertTrue();
      } catch (err) {
        console.error('[testFlexAlignContentSpaceAroundTextVisibilityHidden] failed');
        expect().assertFail();
      }
      console.info('[testFlexAlignContentSpaceAroundTextVisibilityHidden] END');

    });
    /**
     * @tc.name   testFlexAlignContentSpaceAroundTextVisibilityNone
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_SPACEBETWEEN_1400
     * @tc.desc   The size of the parent component in the cross direction meets the layout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlexAlignContentSpaceAroundTextVisibilityNone',  Level.LEVEL0, async () => {
      console.info('[testFlexAlignContentSpaceAroundTextVisibilityNone] START');
      try {
        let firstText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextVisibility01');
        let secondText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextVisibility02');
        let distanceBefore = secondText.top - firstText.bottom;
        GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'visibility', value: Visibility.None
        })
        await CommonFunc.sleep(3000);
        secondText = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextVisibility02');
        let thirdText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextVisibility03');
        let fourthText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceBetween_TextVisibility04');
        let flexContainer: RectValue = CommonFunc.getComponentRect('FlexAlign_SpaceBetween_TextVisibility_Container01');
        let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceBetween_TextVisibility_Container01');
        console.log('firstText rect_value is:' +JSON.stringify(firstText));
        console.log('secondText rect_value is:' +JSON.stringify(secondText));
        console.log('thirdText rect_value is:' +JSON.stringify(thirdText));

        expect(JSON.parse(flexContainerStrJson).$type).assertEqual('Flex');
        expect(JSON.parse(flexContainerStrJson).$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
        expect(JSON.parse(flexContainerStrJson).$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceBetween');

        let firstTextStrJson = getInspectorByKey('AlignContent_SpaceBetween_TextVisibility01');
        expect(JSON.parse(firstTextStrJson).$attrs.visibility).assertEqual("Visibility.None");

        console.info('testFlexAlignContentSpaceAroundTextVisibilityNone_1: ');
	    expect(Math.abs(Math.round(secondText.bottom - secondText.top) - Math.round(vp2px(100))) <= 1).assertTrue();
	    expect(Math.abs(Math.round(thirdText.bottom - thirdText.top) - Math.round(vp2px(50))) <= 1).assertTrue();
	    expect(Math.abs(Math.round(fourthText.bottom - fourthText.top) - Math.round(vp2px(100))) <= 1).assertTrue();

        console.info('testFlexAlignContentSpaceAroundTextVisibilityNone_2: ');
        expect(Math.abs(secondText.left - thirdText.left) <= 1).assertTrue();
        expect(Math.abs(thirdText.left - fourthText.left) <= 1).assertTrue();
        expect(Math.abs(fourthText.left - flexContainer.left) <= 1).assertTrue();

        console.info('testFlexAlignContentSpaceAroundTextVisibilityNone_3: ');
        expect(Math.abs(secondText.top - flexContainer.top) <= 1).assertTrue();
        expect(Math.abs(fourthText.bottom - flexContainer.bottom) <= 1).assertTrue();
        expect(Math.abs(Math.round(thirdText.top - secondText.bottom) - Math.round(fourthText.top - thirdText.bottom)) <= 1)
          .assertTrue();
        expect(Math.round(thirdText.top - secondText.bottom)).assertLarger(Math.round(distanceBefore));
      } catch (err) {
        console.error('[testFlexAlignContentSpaceAroundTextVisibilityNone] failed');
        expect().assertFail();
      }
      console.info('[testFlexAlignContentSpaceAroundTextVisibilityNone] END');

    });
  })
}
