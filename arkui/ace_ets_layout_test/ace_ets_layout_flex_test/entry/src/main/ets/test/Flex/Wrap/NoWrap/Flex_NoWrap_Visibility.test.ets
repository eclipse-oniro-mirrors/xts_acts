
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
export default function flex_NoWrap_VisibilityTest() {
  describe('Flex_NoWrap_VisibilityTest', function () {
    beforeEach(async function (done) {
      console.info("Flex_NoWrap_VisibilityTest beforeEach start");
      let options = {
        url: 'MainAbility/pages/Flex/Wrap/NoWrap/Flex_NoWrap_Visibility',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Flex_NoWrap_Visibility state pages:" + JSON.stringify(pages));
        if (!("Flex_NoWrap_Visibility" == pages.name)) {
          console.info("get Flex_NoWrap_Visibility state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Flex_NoWrap_Visibility page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Flex_NoWrap_Visibility page error:" + err);
      }
      console.info("Flex_NoWrap_VisibilityTest beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("Flex_NoWrap_Visibility after each called");
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_NOWRAP_2200
     * @tc.name      testWrapNoWrapTextVisibilityNoneOverflow
     * @tc.desc      The size of the parent component in the main axis direction is not enough for the layout
     *               of the child components when one of the child components set "Visibility.NOne"
     */
    it('testWrapNoWrapTextVisibilityNoneOverflow', 0, async function (done) {
      console.info('[testWrapNoWrapTextVisibilityNoneOverflow] START');
      try {
        globalThis.value.message.notify({ name: 'firstTextWidth', value: 250 });
        globalThis.value.message.notify({ name: 'secondTextWidth', value: 350 });
        globalThis.value.message.notify({ name: 'thirdTextWidth', value: 350 });
        globalThis.value.message.notify({ name: 'visibility', value: Visibility.None })
        await CommonFunc.sleep(3000);
        let firstText = CommonFunc.getComponentRect('NoWrap_Text_Visibility1');
        let secondText = CommonFunc.getComponentRect('NoWrap_Text_Visibility2');
        let thirdText = CommonFunc.getComponentRect('NoWrap_Text_Visibility3');
        let flexContainer = CommonFunc.getComponentRect('Flex_NoWrap_Visibility_Container01');
        let flexContainerStrJson = getInspectorByKey('Flex_NoWrap_Visibility_Container01');
        let flexContainerObj = JSON.parse(flexContainerStrJson);
        expect(flexContainerObj.$type).assertEqual('Flex');
        expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');

        expect(Math.abs((secondText.top) - (flexContainer.top)) <= 1).assertTrue();
        expect(Math.abs((secondText.top) - (thirdText.top)) <= 1).assertTrue();

        expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
        expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(vp2px(200)))) <= 1).assertTrue();
        expect(Math.abs((Math.round(secondText.right - secondText.left)) - (Math.round(thirdText.right - thirdText.left))) <= 1).assertTrue();

        expect(Math.abs((Math.round(thirdText.right - thirdText.left)) - (Math.round(vp2px(250)))) <= 1).assertTrue();
        expect(Math.abs((Math.round(thirdText.right - thirdText.left)) - (Math.round(secondText.right - secondText.left))) <= 1).assertTrue();

        expect(Math.abs((secondText.left) - (flexContainer.left)) <= 1).assertTrue();
        expect(Math.abs((thirdText.right) - (flexContainer.right)) <= 1).assertTrue();
        expect(Math.abs((thirdText.bottom) - (flexContainer.bottom)) <= 1).assertTrue();
      } catch (err) {
        console.error('[testWrapNoWrapTextVisibilityNoneOverflow] failed');
        expect().assertFail();
      }
      console.info('[testWrapNoWrapTextVisibilityNoneOverflow] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_NOWRAP_2300
     * @tc.name      testWrapNoWrapTextVisibilityNoneMeet
     * @tc.desc      The size of the parent component in the main axis direction meets the layout
     *               of the child components when one of the child components set "Visibility.NOne"
     */
    it('testWrapNoWrapTextVisibilityNoneMeet', 0, async function (done) {
      console.info('[testWrapNoWrapTextVisibilityNoneMeet] START');
      try {
        globalThis.value.message.notify({
          name: 'firstTextWidth', value: 250
        });
        globalThis.value.message.notify({
          name: 'secondTextWidth', value: 150
        });
        globalThis.value.message.notify({
          name: 'thirdTextWidth', value: 150
        });
        globalThis.value.message.notify({
          name: 'visibility', value: Visibility.None
        })
        await CommonFunc.sleep(3000);
        let firstText = CommonFunc.getComponentRect('NoWrap_Text_Visibility1');
        let secondText = CommonFunc.getComponentRect('NoWrap_Text_Visibility2');
        let thirdText = CommonFunc.getComponentRect('NoWrap_Text_Visibility3');
        let flexContainer = CommonFunc.getComponentRect('Flex_NoWrap_Visibility_Container01');
        let flexContainerStrJson = getInspectorByKey('Flex_NoWrap_Visibility_Container01');
        let flexContainerObj = JSON.parse(flexContainerStrJson);
        expect(flexContainerObj.$type).assertEqual('Flex');
        expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');

        expect(Math.abs(flexContainer.left - secondText.left) <= 1).assertTrue();
        expect(Math.abs(secondText.right - thirdText.left) <= 1).assertTrue();
        expect(Math.abs(secondText.right - thirdText.left) <= 1).assertTrue();
        expect(Math.abs(secondText.top - thirdText.top) <= 1).assertTrue();
        expect(Math.abs(flexContainer.top - thirdText.top) <= 1).assertTrue();

        expect(Math.abs(secondText.bottom - secondText.top - Math.round(vp2px(150))) <= 1).assertTrue();
        expect(Math.abs(thirdText.bottom - thirdText.top - Math.round(vp2px(200))) <= 1).assertTrue();

        expect(Math.abs(secondText.right - secondText.left - Math.round(vp2px(150))) <= 1).assertTrue();
        expect(Math.abs(thirdText.right - thirdText.left - Math.round(vp2px(150))) <= 1).assertTrue();

        expect(Math.abs(flexContainer.right - thirdText.right - Math.round(vp2px(200))) <= 1).assertTrue();
        expect(Math.abs(thirdText.bottom - flexContainer.bottom) <= 1).assertTrue();
      } catch (err) {
        console.error('[testWrapNoWrapTextVisibilityNoneMeet] failed');
        expect().assertFail();
      }
      console.info('[testWrapNoWrapTextVisibilityNoneMeet] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEXWRAP_NOWRAP_2400
     * @tc.name      testWrapNoWrapTextVisibilityHidden
     * @tc.desc      The size of the parent component in the main axis direction meets the layout
     *               of the child components when one of the child components set "Visibility.Hidden"
     */
    it('testWrapNoWrapTextVisibilityHidden', 0, async function (done) {
      console.info('[testWrapNoWrapTextVisibilityHidden] START');
      try {
        globalThis.value.message.notify({ name: 'firstTextWidth', value: 150 });
        globalThis.value.message.notify({ name: 'secondTextWidth', value: 150 });
        globalThis.value.message.notify({ name: 'thirdTextWidth', value: 150 });
        globalThis.value.message.notify({ name: 'visibility', value: Visibility.Hidden })
        await CommonFunc.sleep(3000);
        let firstText = CommonFunc.getComponentRect('NoWrap_Text_Visibility1');
        let secondText = CommonFunc.getComponentRect('NoWrap_Text_Visibility2');
        let thirdText = CommonFunc.getComponentRect('NoWrap_Text_Visibility3');
        let flexContainer = CommonFunc.getComponentRect('Flex_NoWrap_Visibility_Container01');
        let flexContainerStrJson = getInspectorByKey('Flex_NoWrap_Visibility_Container01');
        let flexContainerObj = JSON.parse(flexContainerStrJson);
        expect(flexContainerObj.$type).assertEqual('Flex');
        expect(flexContainerObj.$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');

        expect(Math.abs(secondText.right - thirdText.left) <= 1).assertTrue();
        expect(Math.abs(secondText.top - thirdText.top) <= 1).assertTrue();
        expect(Math.abs(flexContainer.top - thirdText.top) <= 1).assertTrue();

        expect(Math.abs(secondText.bottom - secondText.top - Math.round(vp2px(150))) <= 1).assertTrue();
        expect(Math.abs(thirdText.bottom - thirdText.top - Math.round(vp2px(200))) <= 1).assertTrue();

        expect(Math.abs(secondText.right - secondText.left - Math.round(vp2px(150))) <= 1).assertTrue();
        expect(Math.abs(thirdText.right - thirdText.left - Math.round(vp2px(150))) <= 1).assertTrue();

        expect(Math.abs(thirdText.bottom - flexContainer.bottom) <= 1).assertTrue();
        expect(Math.abs(flexContainer.right - thirdText.right - Math.round(vp2px(50))) <= 1).assertTrue();
        expect(Math.abs(secondText.left - flexContainer.left - Math.round(vp2px(150))) <= 1).assertTrue();
      } catch (err) {
        console.error('[testWrapNoWrapTextVisibilityHidden] failed');
        expect().assertFail();
      }
      console.info('[testWrapNoWrapTextVisibilityHidden] END');
      done();
    });
  })
}
