
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
export default function flex_AlignContent_SpaceAround_FlexMarTest() {
  describe('Flex_AlignContent_SpaceAround_FlexMarTest', function () {
    beforeEach(async function (done) {
      console.info("Flex_AlignContent_SpaceAround_FlexMarTest beforeEach start");
      let options = {
        url: 'MainAbility/pages/Flex/alignContent/SpaceAround/Flex_AlignContent_SpaceAround_FlexMar',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_AlignContent_SpaceAround_FlexMar state pages:" + JSON.stringify(pages));
        if (!("Flex_AlignContent_SpaceAround_FlexMar" == pages.name)) {
          console.info("get Flex_AlignContent_SpaceAround_FlexMar state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_AlignContent_SpaceAround_FlexMar page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_AlignContent_SpaceAround_FlexMar page error:" + err);
      }
      console.info("Flex_AlignContent_SpaceAround_FlexMarTest beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("Flex_AlignContent_SpaceAround_FlexMarTest after each called");
    });
    /**
     * @tc.number    SUB_ACE_FLEXALIGNCONTENT_SPACEAROUND_0100
     * @tc.name      testFlexAlignContentSpaceAroundFlexMargin
     * @tc.desc      The size of the parent component in the cross direction meets the layout
     *               of the child components when the margin of parent component set to 10
     */
    it('testFlexAlignContentSpaceAroundFlexMargin', 0, async function (done) {
      console.info('[testFlexAlignContentSpaceAroundFlexMargin] START');
      globalThis.value.message.notify({name:'margin', value:10})
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('AlignContent_SpaceAround_FlexMar01');
      let secondText = CommonFunc.getComponentRect('AlignContent_SpaceAround_FlexMar02');
      let thirdText = CommonFunc.getComponentRect('AlignContent_SpaceAround_FlexMar03');
      let fourthText = CommonFunc.getComponentRect('AlignContent_SpaceAround_FlexMar04');
      let flexContainer = CommonFunc.getComponentRect('FlexAlign_SpaceAround_FlexMar_Container01');
      let columnContainer = CommonFunc.getComponentRect('Column_Align_SpaceAround_FlexMar_Container01');
      let flexContainerStrJson = getInspectorByKey('FlexAlign_SpaceAround_FlexMar_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');
      expect(flexContainerObj.$attrs.constructor.alignContent).assertEqual('FlexAlign.SpaceAround');

      expect(Math.abs(firstText.bottom - firstText.top) - vp2px(50) <= 1).assertTrue();
      expect(Math.abs(secondText.bottom - secondText.top) - vp2px(100) <= 1).assertTrue();
      expect(Math.abs(thirdText.bottom - thirdText.top) - vp2px(50) <= 1).assertTrue();
      expect(Math.abs(fourthText.bottom - fourthText.top) - vp2px(100) <= 1).assertTrue();

      expect(Math.abs(flexContainer.top - columnContainer.top) - vp2px(10) <= 1).assertTrue();
      expect(Math.abs(firstText.left - secondText.left) <= 1).assertTrue();
      expect(Math.abs(secondText.left - thirdText.left) <= 1).assertTrue();
      expect(Math.abs(thirdText.left - fourthText.left) <= 1).assertTrue();
      expect(Math.abs(fourthText.left - flexContainer.left) <= 1).assertTrue();

      expect(Math.abs(Math.round(secondText.top - firstText.bottom)) - Math.abs(Math.round(thirdText.top - secondText.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdText.top - secondText.bottom)) - Math.abs(Math.round(fourthText.top - thirdText.bottom)) <= 1).assertTrue();

      expect(Math.abs(Math.round(firstText.top - flexContainer.top)) - Math.abs(Math.round(flexContainer.bottom - fourthText.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(firstText.top - flexContainer.top)) - Math.abs(Math.round((secondText.top - firstText.bottom) / 2)) <= 1).assertTrue();      
      console.info('[testFlexAlignContentSpaceAroundFlexMargin] END');
      done();
    });
  })
}
