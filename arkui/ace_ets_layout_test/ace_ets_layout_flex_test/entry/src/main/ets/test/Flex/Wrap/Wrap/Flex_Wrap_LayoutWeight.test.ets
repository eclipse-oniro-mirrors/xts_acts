
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
export default function flex_Wrap_LayoutWeightTest() {
  describe('Flex_Wrap_LayoutWeightTest', function () {
    beforeEach(async function (done) {
      console.info("Flex_Wrap_LayoutWeightTest beforeEach start");
      let options = {
        url: 'MainAbility/pages/Flex/Wrap/Wrap/Flex_Wrap_LayoutWeight',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_Wrap_LayoutWeight state pages:" + JSON.stringify(pages));
        if (!("Flex_Wrap_LayoutWeight" == pages.name)) {
          console.info("get Flex_Wrap_LayoutWeight state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(1000);
          console.info("push Flex_Wrap_LayoutWeight page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_Wrap_LayoutWeight page error:" + err);
      }
      console.info("Flex_Wrap_LayoutWeightTest beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("Flex_Wrap_LayoutWeight after each called");
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_WRAP_1400
     * @tc.name      testWrapWrapTextLayoutWeight
     * @tc.desc      The size of the parent component in the main axis direction meets the layout of
     *               the child components,and LayoutWeight of the child components set different values
     */
    it('testWrapWrapTextLayoutWeight', 0, async function (done) {
      console.info('[testWrapWrapTextLayoutWeight] START');
      globalThis.value.message.notify({name:'firstTextLayoutWeight', value:2})
      globalThis.value.message.notify({name:'secondTextLayoutWeight', value:1})
      globalThis.value.message.notify({name:'thirdTextLayoutWeight', value:1})
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('Wrap_LayoutWeight01');
      let secondText = CommonFunc.getComponentRect('Wrap_LayoutWeight02');
      let thirdText = CommonFunc.getComponentRect('Wrap_LayoutWeight03');
      let flexContainer = CommonFunc.getComponentRect('Flex_Wrap_layoutWeight_Container01');
      let flexContainerStrJson = getInspectorByKey('Flex_Wrap_layoutWeight_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');

      expect(Math.abs(firstText.left - flexContainer.left) <=1).assertTrue()
      expect(Math.abs(firstText.top - flexContainer.top) <=1).assertTrue()
      expect(Math.abs(firstText.right - secondText.left) <=1).assertTrue()
      expect(Math.abs(secondText.right - thirdText.left) <=1).assertTrue()
      expect(Math.abs(firstText.top - secondText.top) <=1).assertTrue()
      expect(Math.abs(secondText.top - thirdText.top) <=1).assertTrue()

      expect(Math.abs(firstText.bottom - firstText.top - vp2px(100)) <=1).assertTrue();
      expect(Math.abs(secondText.bottom - secondText.top - vp2px(150)) <=1).assertTrue();
      expect(Math.abs(thirdText.bottom - thirdText.top - vp2px(200)) <=1).assertTrue();
      expect(Math.abs(firstText.right- firstText.left - vp2px(150)) <=1).assertTrue();
      expect(Math.abs(secondText.right - secondText.left - (thirdText.right - thirdText.left)) <=1).assertTrue();
      expect(Math.abs((firstText.right - firstText.left) - (thirdText.right - thirdText.left)) <=1).assertTrue();

      expect(Math.abs((flexContainer.right - thirdText.right) - vp2px(50)) <=1).assertTrue();
      expect(Math.abs(thirdText.bottom - flexContainer.bottom) <=1).assertTrue();
      console.info('[testWrapWrapTextLayoutWeight] END');
      done();
    });
  })
}
