/*
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import router from '@system.router';
import CommonFunc from "../../../../MainAbility/common/Common";
import { MessageManager,Callback } from '../../../../MainAbility/common/MessageManager';
export default function flexVisibility_StartJsunit() {
  describe('flexItemAlignStartTest8', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Flex/alignItems/ItemAlign_Start/FlexVisibility',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexVisibility state success " + JSON.stringify(pages));
        if (!("FlexVisibility" == pages.name)) {
          console.info("get FlexVisibility state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push FlexVisibility page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexVisibility page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("FlexVisibility after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNITEMS_START_1100
     * @tc.name      testFlexItemAlignStartSubSetVisibilityNone
     * @tc.desc      aceFlexAlignItemTest
     */
    it('testFlexItemAlignStartSubSetVisibilityNone', 0, async function (done) {
      console.info('new testFlexItemAlignStartSubSetVisibilityNone START');
      try {
          globalThis.value.message.notify({name:'visibility', value:Visibility.None});
          await CommonFunc.sleep(2000);
          let strJson1 = getInspectorByKey('flexVisible');
          let obj1 = JSON.parse(strJson1);
          let strJson2 = getInspectorByKey('textVisible01');
          let obj2 = JSON.parse(strJson2);
          expect(obj2.$attrs.visibility).assertEqual("Visibility.None");
          let textVisible01 = CommonFunc.getComponentRect('textVisible01');
          let textVisible02 = CommonFunc.getComponentRect('textVisible02');
          let textVisible03 = CommonFunc.getComponentRect('textVisible03');
          let flexVisible = CommonFunc.getComponentRect('flexVisible');

          expect(Math.abs(textVisible01.left - textVisible01.right) <=1).assertTrue();
          expect(Math.abs(textVisible01.right - flexVisible.left) <=1).assertTrue();
          expect(Math.abs(textVisible02.top - textVisible03.top) <=1).assertTrue();
          expect(Math.abs(textVisible03.top - flexVisible.top) <=1).assertTrue();
          expect(Math.abs(Math.round(textVisible02.bottom - textVisible02.top) - Math.round(vp2px(100))) <= 1).assertTrue();
          expect(Math.abs(Math.round(textVisible03.bottom - textVisible03.top) - Math.round(vp2px(150))) <= 1).assertTrue();
          expect(Math.abs(Math.round(textVisible02.right - textVisible02.left) - Math.round(vp2px(150))) <= 1).assertTrue();
          expect(Math.abs(Math.round(textVisible03.right - textVisible03.left) - Math.round(vp2px(150))) <= 1).assertTrue();
          expect(obj1.$attrs.visibility).assertEqual("Visibility.Visible");
          expect(obj1.$attrs.constructor.direction).assertEqual('FlexDirection.Row')
          expect(obj1.$attrs.constructor.alignItems).assertEqual('ItemAlign.Start')
       } catch (err) {
          console.error('[testFlexItemAlignBaselineSubSetVisibilityNone] failed');
          expect().assertFail();
      }
      console.info('new testFlexItemAlignStartSubSetVisibilityNone END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNITEMS_START_1200
     * @tc.name      testFlexItemAlignStartSubSetVisibilityHidden
     * @tc.desc      aceFlexAlignItemTest
     */
    it('testFlexItemAlignStartSubSetVisibilityHidden', 0, async function (done) {
      console.info('new testFlexItemAlignStartSubSetVisibilityHidden START');
      try {
          globalThis.value.message.notify({name:'visibility', value:Visibility.Hidden});
          await CommonFunc.sleep(2000);
          let strJson1 = getInspectorByKey('flexVisible');
          let obj1 = JSON.parse(strJson1);
          let strJson2 = getInspectorByKey('textVisible01');
          let obj2 = JSON.parse(strJson2);
          expect(obj2.$attrs.visibility).assertEqual("Visibility.Hidden");
          let textVisible01 = CommonFunc.getComponentRect('textVisible01');
          let textVisible02 = CommonFunc.getComponentRect('textVisible02');
          let textVisible03 = CommonFunc.getComponentRect('textVisible03');
          let flexVisible = CommonFunc.getComponentRect('flexVisible');
          expect(Math.abs(textVisible01.left - flexVisible.left) <=1).assertTrue();
          expect(Math.abs(textVisible01.right - textVisible02.left) <=1).assertTrue();
          expect(Math.abs(textVisible02.top - textVisible03.top) <=1).assertTrue();
          expect(Math.abs(textVisible03.top - flexVisible.top) <=1).assertTrue();

          expect(Math.abs(Math.round(textVisible01.bottom - textVisible01.top) - Math.round(vp2px(50))) <= 1).assertTrue();
          expect(Math.abs(Math.round(textVisible02.bottom - textVisible02.top) - Math.round(vp2px(100))) <= 1).assertTrue();
          expect(Math.abs(Math.round(textVisible03.bottom - textVisible03.top) - Math.round(vp2px(150))) <= 1).assertTrue();
          expect(Math.abs(Math.round(textVisible01.right - textVisible01.left) - Math.round(vp2px(150))) <= 1).assertTrue();
          expect(Math.abs(Math.round(textVisible02.right - textVisible02.left) - Math.round(vp2px(150))) <= 1).assertTrue();
          expect(Math.abs(Math.round(textVisible03.right - textVisible03.left) - Math.round(vp2px(150))) <= 1).assertTrue();
          expect(obj1.$attrs.constructor.direction).assertEqual('FlexDirection.Row')
          expect(obj1.$attrs.constructor.alignItems).assertEqual('ItemAlign.Start')
       } catch (err) {
          console.error('[testFlexItemAlignBaselineSubSetVisibilityHidden] failed');
          expect().assertFail();
      }
      console.info('new testFlexItemAlignStartSubSetVisibilityHidden END');
      done();
    });
  })
}
