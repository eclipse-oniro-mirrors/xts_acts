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

export default function flex_AlignContent_SpaceAround_TextVisibilityTest() {
  describe('Flex_AlignContent_SpaceAround_TextVisibilityTest', () => {
    beforeEach(async () => {
      console.info("Flex_AlignContent_SpaceAround_TextVisibilityTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/SpaceAround/Flex_AlignContent_SpaceAround_TextVisibility',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_AlignContent_SpaceAround_TextVisibility state pages:" + JSON.stringify(pages));
        if (!("Flex_AlignContent_SpaceAround_TextVisibility" == pages.name)) {
          console.info("get Flex_AlignContent_SpaceAround_TextVisibility state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_AlignContent_SpaceAround_TextVisibility page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_AlignContent_SpaceAround_TextVisibility page error:" + err);
      }
      console.info("Flex_AlignContent_SpaceAround_TextVisibilityTest beforeEach end");

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'visibility', value: Visibility.Visible
      });
      console.info("Flex_AlignContent_SpaceAround_TextVisibilityTest after each called");
    });
    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_SPACEAROUND_1300
     * @tc.name testFlexAlignContentSpaceAroundTextVisibilityHidden
     * @tc.desc The size of the parent component in the cross direction meets the layout
     *               of the subcomponents when the visibility of first subcomponent set to Hidden
     */
    it('testFlexAlignContentSpaceAroundTextVisibilityHidden', 0, async () => {
      console.info('[testFlexAlignContentSpaceAroundTextVisibilityHidden] START');
      try {
        let firstText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextVisibility01');
        let secondText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextVisibility02');
        let distanceBefore = secondText.top - firstText.bottom;
        GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'visibility', value: Visibility.Hidden
        });
        await CommonFunc.sleep(3000);
        secondText = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextVisibility02');
        let thirdText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextVisibility03');
        let fourthText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextVisibility04');
        let flexContainer: RectValue = CommonFunc.getComponentRect('FlexAlign_SpaceAround_TextVisibility_Container01');
        let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceAround_TextVisibility_Container01');

        expect(JSON.parse(flexContainerStrJson).$type).assertEqual('Flex');
        expect(JSON.parse(flexContainerStrJson).$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
        expect(JSON.parse(flexContainerStrJson).$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceAround');

        let firstTextStrJson = getInspectorByKey('AlignContent_SpaceAround_TextVisibility01');
        expect(JSON.parse(firstTextStrJson).$attrs.visibility).assertEqual("Visibility.Hidden");


        expect(Math.abs(Math.round(secondText.bottom - secondText.top) - Math.round(vp2px(100))) <= 2).assertTrue();
        expect(Math.abs(Math.round(thirdText.bottom - thirdText.top) - Math.round(vp2px(50))) <= 2).assertTrue();
        expect(Math.abs(Math.round(fourthText.bottom - fourthText.top) - Math.round(vp2px(100))) <= 2).assertTrue();

        expect(Math.abs(Math.round(secondText.left) - Math.round(thirdText.left)) <= 2).assertTrue();
        expect(Math.abs(Math.round(thirdText.left) - Math.round(fourthText.left)) <= 2).assertTrue();

        expect(Math.abs(Math.round(fourthText.left) - Math.round(flexContainer.left)) <= 2).assertTrue();
        expect(Math.abs(Math.round((secondText.top - flexContainer.top) * 100) / 100 - Math.round((distanceBefore * 1.5 + vp2px(50)) * 100) / 100) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round(thirdText.top - secondText.bottom) - Math.round(fourthText.top - thirdText.bottom)) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round((thirdText.top - secondText.bottom) * 10) / 10 - Math.round(distanceBefore * 10) / 10) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round((flexContainer.bottom - fourthText.bottom) * 100) / 100 - Math.round((distanceBefore / 2) * 100) / 100) <= 1)
          .assertTrue();

      } catch (err) {
        console.error('[testFlexAlignContentSpaceAroundTextVisibilityHidden] failed');
        expect().assertFail();
      }
      console.info('[testFlexAlignContentSpaceAroundTextVisibilityHidden] END');

    });
    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_SPACEAROUND_1400
     * @tc.name testFlexAlignContentSpaceAroundTextVisibilityNone
     * @tc.desc The size of the parent component in the cross direction meets the layout
     *               of the subcomponents when the visibility of first subcomponent set to None
     */
    it('testFlexAlignContentSpaceAroundTextVisibilityNone', 0, async () => {
      console.info('[testFlexAlignContentSpaceAroundTextVisibilityNone] START');
      try {
        let firstText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextVisibility01');
        let secondText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextVisibility02');
        let distanceBefore = Math.round(secondText.top - firstText.bottom);
        GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'visibility', value: Visibility.None
        })
        await CommonFunc.sleep(3000);
        secondText = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextVisibility02');
        let thirdText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextVisibility03');
        let fourthText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_TextVisibility04');
        let flexContainer: RectValue = CommonFunc.getComponentRect('FlexAlign_SpaceAround_TextVisibility_Container01');
        let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceAround_TextVisibility_Container01');

        expect(JSON.parse(flexContainerStrJson).$type).assertEqual('Flex');
        expect(JSON.parse(flexContainerStrJson).$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
        expect(JSON.parse(flexContainerStrJson).$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceAround');

        let firstTextStrJson = getInspectorByKey('AlignContent_SpaceAround_TextVisibility01');
        expect(JSON.parse(firstTextStrJson).$attrs.visibility).assertEqual("Visibility.None");

        expect(Math.abs(secondText.bottom - secondText.top) - vp2px(100) <= 1).assertTrue();
        expect(Math.abs(thirdText.bottom - thirdText.top) - vp2px(50) <= 1).assertTrue();
        expect(Math.abs(fourthText.bottom - fourthText.top) - vp2px(100) <= 1).assertTrue();

        expect(Math.abs(Math.round(secondText.left) - Math.round(thirdText.left)) <= 1).assertTrue();
        expect(Math.abs(Math.round(thirdText.left) - Math.round(fourthText.left)) <= 1).assertTrue();
        expect(Math.abs(Math.round(fourthText.left) - Math.round(flexContainer.left)) <= 1).assertTrue();

        expect(Math.abs(thirdText.top - secondText.bottom) - Math.abs(fourthText.top - thirdText.bottom) <= 1)
          .assertTrue();
        expect(Math.abs(thirdText.top - secondText.bottom) >= distanceBefore).assertTrue();

        expect(Math.abs(secondText.top - flexContainer.top) - Math.abs(flexContainer.bottom - fourthText.bottom) <= 1)
          .assertTrue();
        expect(Math.abs(secondText.top - flexContainer.top) - Math.round((thirdText.top - secondText.bottom) / 2) <= 1)
          .assertTrue();
      } catch (err) {
        console.error('[testFlexAlignContentSpaceAroundTextVisibilityNone] failed' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[testFlexAlignContentSpaceAroundTextVisibilityNone] END');

    });
  })
}
