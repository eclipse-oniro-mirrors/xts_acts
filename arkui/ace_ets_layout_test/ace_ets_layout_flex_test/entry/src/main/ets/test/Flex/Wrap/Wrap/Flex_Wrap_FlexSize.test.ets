
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
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import CommonFunc from '../../../../MainAbility/common/Common';
export default function flex_Wrap_FlexSizeTest() {
  describe('flex_Wrap_FlexSizeTest', function () {
    beforeEach(async function (done) {
      console.info("flex_Wrap_FlexSizeTest beforeEach start");
      let options = {
        url: 'MainAbility/pages/Flex/Wrap/Wrap/Flex_Wrap_FlexSize',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get flex_Wrap_FlexSize state pages:" + JSON.stringify(pages));
        if (!("Flex_Wrap_FlexSize" == pages.name)) {
          console.info("get flex_Wrap_FlexSize state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push flex_Wrap_FlexSize page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push flex_Wrap_FlexSize page error:" + err);
      }
      console.info("flex_Wrap_FlexSizeTest beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("flex_Wrap_FlexSizeTest after each called");
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_WRAP_1100
     * @tc.name      wrap_Wrap_FlexSize
     * @tc.desc      The size of the parent component in the main axis direction
     *               meets the layout of the child components
     */
    it('SUB_ACE_FLEXWRAP_WRAP_1100', 0, async function (done) {
      console.info('[SUB_ACE_FLEXWRAP_WRAP_1100] START');
      globalThis.value.message.notify({ name: 'width', value: 500 })
      globalThis.value.message.notify({ name: 'height', value: 200 })
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('Wrap_flexSize_Text1');
      let secondText = CommonFunc.getComponentRect('Wrap_flexSize_Text2');
      let thirdText = CommonFunc.getComponentRect('Wrap_flexSize_Text3');
      let flexContainer = CommonFunc.getComponentRect('Wrap_FlexSize_Container01');
      let flexContainerStrJson = getInspectorByKey('Wrap_FlexSize_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');

      expect(Math.abs((firstText.right) - (secondText.left)) <= 1).assertTrue();
      expect(Math.abs((secondText.right) - (thirdText.left)) <= 1).assertTrue();
      expect(Math.abs((firstText.top) - (secondText.top)) <= 1).assertTrue();
      expect(Math.abs((secondText.top) - (thirdText.top)) <= 1).assertTrue();
      expect(Math.abs((firstText.top) - (flexContainer.top)) <= 1).assertTrue();
      expect(Math.abs((firstText.left) - (flexContainer.left)) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(secondText.right - secondText.left))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.right - secondText.left)) - (Math.round(thirdText.right - thirdText.left))) <= 1).assertTrue();

      expect(Math.abs((Math.round(flexContainer.right - thirdText.right)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(flexContainer.bottom - thirdText.bottom)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      console.info('[SUB_ACE_FLEXWRAP_WRAP_1100] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_WRAP_1200
     * @tc.name      wrap_Wrap_FlexSize
     * @tc.desc      The size of the parent component in the main axis direction
     *               is not enough for the layout of the child components,and the cross axis meets
     */
    it('SUB_ACE_FLEXWRAP_WRAP_1200', 0, async function (done) {
      console.info('[SUB_ACE_FLEXWRAP_WRAP_1200] START');
      globalThis.value.message.notify({ name: 'width', value: 400 })
      globalThis.value.message.notify({ name: 'height', value: 260 })
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('Wrap_flexSize_Text1');
      let secondText = CommonFunc.getComponentRect('Wrap_flexSize_Text2');
      let thirdText = CommonFunc.getComponentRect('Wrap_flexSize_Text3');
      let flexContainer = CommonFunc.getComponentRect('Wrap_FlexSize_Container01');
      let flexContainerStrJson = getInspectorByKey('Wrap_FlexSize_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');

      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(secondText.right - secondText.left))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.right - secondText.left)) - (Math.round(thirdText.right - thirdText.left))) <= 1).assertTrue();

      expect(Math.abs((firstText.top) - (flexContainer.top)) <= 1).assertTrue();
      expect(Math.abs((firstText.left) - (flexContainer.left)) <= 1).assertTrue();
      expect(Math.abs((firstText.right) - (secondText.left)) <= 1).assertTrue();
      expect(Math.abs((firstText.top) - (secondText.top)) <= 1).assertTrue();
      expect(Math.abs((thirdText.left) - (firstText.left)) <= 1).assertTrue();
      expect(Math.abs((thirdText.top) - (secondText.bottom)) <= 1).assertTrue();

      expect(Math.abs((Math.round(flexContainer.right - secondText.right)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(flexContainer.bottom - thirdText.bottom)) - (Math.round(vp2px(10)))) <= 1).assertTrue();
      console.info('[SUB_ACE_FLEXWRAP_WRAP_1200] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_WRAP_1300
     * @tc.name      wrap_Wrap_FlexSize
     * @tc.desc      The size of the parent component in the main axis direction
     *               is not enough for the layout of the child componentsand,and the cross axis as well
     */
    it('SUB_ACE_FLEXWRAP_WRAP_1300', 0, async function (done) {
      console.info('[SUB_ACE_FLEXWRAP_WRAP_1300] START');
      globalThis.value.message.notify({ name: 'width', value: 350 })
      globalThis.value.message.notify({ name: 'height', value: 150 })
      await CommonFunc.sleep(3000);
      let firstText = CommonFunc.getComponentRect('Wrap_flexSize_Text1');
      let secondText = CommonFunc.getComponentRect('Wrap_flexSize_Text2');
      let thirdText = CommonFunc.getComponentRect('Wrap_flexSize_Text3');
      let flexContainer = CommonFunc.getComponentRect('Wrap_FlexSize_Container01');
      let flexContainerStrJson = getInspectorByKey('Wrap_FlexSize_Container01');
      let flexContainerObj = JSON.parse(flexContainerStrJson);
      expect(flexContainerObj.$type).assertEqual('Flex');
      expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.Wrap');

      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(secondText.right - secondText.left))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.right - secondText.left)) - (Math.round(thirdText.right - thirdText.left))) <= 1).assertTrue();

      expect(Math.abs((firstText.left) - (flexContainer.left)) <= 1).assertTrue();
      expect(Math.abs((firstText.top) - (flexContainer.top)) <= 1).assertTrue();
      expect(Math.abs((firstText.top) - (secondText.top)) <= 1).assertTrue();
      expect(Math.abs((firstText.right) - (secondText.left)) <= 1).assertTrue();
      expect(Math.abs((thirdText.left) - (firstText.left)) <= 1).assertTrue();
      expect(Math.abs((thirdText.top) - (secondText.bottom)) <= 1).assertTrue();

      expect(Math.abs((Math.round(flexContainer.right - secondText.right)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - flexContainer.bottom)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      console.info('[SUB_ACE_FLEXWRAP_WRAP_1300] END');
      done();
    });
  })
}
