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

export default function flex_AlignContent_SpaceAround_FlexSizeTest() {
  describe('Flex_AlignContent_SpaceAround_FlexSizeTest', () => {
    beforeEach(async () => {
      console.info("Flex_AlignContent_SpaceAround_FlexSizeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/SpaceAround/Flex_AlignContent_SpaceAround_FlexSize',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_AlignContent_SpaceAround_FlexSize state pages:" + JSON.stringify(pages));
        if (!("Flex_AlignContent_SpaceAround_FlexSize" == pages.name)) {
          console.info("get Flex_AlignContent_SpaceAround_FlexSize state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_AlignContent_SpaceAround_FlexSize page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_AlignContent_SpaceAround_FlexSize page error:" + err);
      }
      console.info("Flex_AlignContent_SpaceAround_FlexSizeTest beforeEach end");

    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Flex_AlignContent_SpaceAround_FlexSizeTest after each called");
    });
    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_SPACEAROUND_0600
     * @tc.name testFlexAlignContentSpaceAroundFlexSizeMeet
     * @tc.desc The size of the parent component in the cross direction meets the layout
     *               of the child components when the height and width of parent component changed
     */
    it('testFlexAlignContentSpaceAroundFlexSizeMeet',  Level.LEVEL0, async () => {
      console.info('[testFlexAlignContentSpaceAroundFlexSizeMeet] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'width', value: 200
      })
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'height', value: 400
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_FlexSize01');
      let secondText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_FlexSize02');
      let thirdText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_FlexSize03');
      let fourthText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_FlexSize04');
      let flexContainer: RectValue = CommonFunc.getComponentRect('FlexAlign_SpaceAround_FlexSize_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceAround_FlexSize_Container01');

      expect(JSON.parse(flexContainerStrJson).$type).assertEqual('Flex');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceAround');

      expect(Math.floor(Math.abs(firstText.bottom - firstText.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.bottom - secondText.top) - vp2px(100)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.bottom - thirdText.top) - vp2px(50)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(fourthText.bottom - fourthText.top) - vp2px(100)) <= 1).assertTrue();

      expect(Math.floor(Math.abs(firstText.left - secondText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.left - thirdText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.left - fourthText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(fourthText.left - flexContainer.left)) <= 1).assertTrue();

      expect(Math.floor(Math.abs(Math.round(secondText.top - firstText.bottom) - Math.round(thirdText.top - secondText.bottom))) <= 2)
        .assertTrue();
      expect(Math.floor(Math.abs(Math.round(thirdText.top - secondText.bottom) - Math.round(fourthText.top - thirdText.bottom))) <= 2)
        .assertTrue();
      expect(Math.floor(Math.abs(Math.round(firstText.top - flexContainer.top) - Math.round(flexContainer.bottom - fourthText.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(Math.round(firstText.top - flexContainer.top) - Math.round((secondText.top - firstText.bottom) / 2))) <= 1)
        .assertTrue();
      console.info('[testFlexAlignContentSpaceAroundFlexSizeMeet] END');

    });
    /**
     * @tc.number SUB_ACE_FLEXALIGNCONTENT_SPACEAROUND_0700
     * @tc.name testFlexAlignContentSpaceAroundFlexSizeOverflow
     * @tc.desc The size of the parent component in the cross direction is not enough for the layout
     *               of the child components when the height and width of parent component changed
     */
    it('testFlexAlignContentSpaceAroundFlexSizeOverflow',  Level.LEVEL0, async () => {
      console.info('[testFlexAlignContentSpaceAroundFlexSizeOverflow] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'width', value: 200
      })
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'height', value: 250
      })
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_FlexSize01');
      let secondText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_FlexSize02');
      let thirdText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_FlexSize03');
      let fourthText: RectValue = CommonFunc.getComponentRect('AlignContent_SpaceAround_FlexSize04');
      let flexContainer: RectValue = CommonFunc.getComponentRect('FlexAlign_SpaceAround_FlexSize_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceAround_FlexSize_Container01');

      expect(JSON.parse(flexContainerStrJson).$type).assertEqual('Flex');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
      expect(JSON.parse(flexContainerStrJson).$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceAround');

      expect(Math.floor(Math.abs(firstText.bottom - firstText.top - vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.bottom - secondText.top - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.bottom - thirdText.top - vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(fourthText.bottom - fourthText.top - vp2px(100))) <= 1).assertTrue();

      expect(Math.floor(Math.abs(firstText.bottom - secondText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.bottom - thirdText.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.bottom - fourthText.top)) <= 1).assertTrue();

      expect(Math.floor(Math.abs(firstText.left - secondText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(secondText.left - thirdText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(thirdText.left - fourthText.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(fourthText.left - flexContainer.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(firstText.top - flexContainer.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(fourthText.bottom - flexContainer.bottom - vp2px(50))) <= 1).assertTrue();
      console.info('[testFlexAlignContentSpaceAroundFlexSizeOverflow] END');

    });
  })
}
