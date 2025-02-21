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
export default function flexBase_StartJsunit() {
  describe('flexItemAlignStartTest3', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Flex/alignItems/ItemAlign_Start/FlexBase',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexBase state success " + JSON.stringify(pages));
        if (!("FlexBase" == pages.name)) {
          console.info("get FlexBase state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push FlexBase page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexBase page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("FlexBase after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNITEMS_START_0100
     * @tc.name      testFlexItemAlignStart
     * @tc.desc      The subcomponent is inside the parent component.
     */
    it('testFlexItemAlignStart', 0, async function (done) {
      console.info('new testFlexItemAlignStart START');
      globalThis.value.message.notify({name:'height', value:200});
      globalThis.value.message.notify({name:'width', value:500});
      await CommonFunc.sleep(3000);
      let strJson1 = getInspectorByKey('flex01');
      let obj1 = JSON.parse(strJson1);
      let textFlex01 = CommonFunc.getComponentRect('textFlex01');
      let textFlex02 = CommonFunc.getComponentRect('textFlex02');
      let textFlex03 = CommonFunc.getComponentRect('textFlex03');
      let flex01 = CommonFunc.getComponentRect('flex01');

      expect(Math.abs(flex01.top - textFlex01.top) <=1).assertTrue();
      expect(Math.abs(textFlex01.top - textFlex02.top) <=1).assertTrue();
      expect(Math.abs(textFlex02.top - textFlex03.top) <=1).assertTrue();

      expect(Math.abs(textFlex01.right - textFlex02.left) <=1).assertTrue();
      expect(Math.abs(textFlex02.right - textFlex03.left) <=1).assertTrue();
      expect(Math.abs((flex01.right - textFlex03.right) - vp2px(50)) <=1).assertTrue();

      expect(Math.abs((textFlex01.bottom - textFlex01.top) - vp2px(50)) <=1).assertTrue();
      expect(Math.abs((textFlex02.bottom - textFlex02.top) - vp2px(100)) <=1).assertTrue();
      expect(Math.abs((textFlex03.bottom - textFlex03.top) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((textFlex01.right - textFlex01.left) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((textFlex02.right - textFlex02.left) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((textFlex03.right - textFlex03.left) - vp2px(150)) <=1).assertTrue();
      console.info('new testFlexItemAlignStart END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNITEMS_START_0200
     * @tc.name      testFlexItemAlignStartExceed
     * @tc.desc      The subcomponent exceeds the parent component.
     */
    it('testFlexItemAlignStartExceed', 0, async function (done) {
      console.info('new testFlexItemAlignStartExceed START');
      globalThis.value.message.notify({name:'width', value:420});
      globalThis.value.message.notify({name:'height', value:140});
      await CommonFunc.sleep(3000);
      let strJson1 = getInspectorByKey('flex01');
      let obj1 = JSON.parse(strJson1);
      let textFlex01 = CommonFunc.getComponentRect('textFlex01');
      let textFlex02 = CommonFunc.getComponentRect('textFlex02');
      let textFlex03 = CommonFunc.getComponentRect('textFlex03');
      let flex01 = CommonFunc.getComponentRect('flex01');
      expect(Math.abs(flex01.top - textFlex01.top) <=1).assertTrue();
      expect(Math.abs(textFlex01.top - textFlex02.top) <=1).assertTrue();
      expect(Math.abs(textFlex02.top - textFlex03.top) <=1).assertTrue();

      expect(Math.abs(textFlex03.right - flex01.right) <=1).assertTrue();
      expect(textFlex03.bottom).assertLarger(flex01.bottom)
      expect(Math.abs((textFlex01.bottom - textFlex01.top) - vp2px(50)) <=1).assertTrue();
      expect(Math.abs((textFlex02.bottom - textFlex02.top) - vp2px(100)) <=1).assertTrue();
      expect(Math.abs((textFlex03.bottom - textFlex03.top) - vp2px(150)) <=1).assertTrue();
      expect(Math.abs((textFlex01.right - textFlex01.left) - vp2px(140)) <=1).assertTrue();
      expect(Math.abs((textFlex02.right - textFlex02.left) - vp2px(140)) <=1).assertTrue();
      expect(Math.abs((textFlex03.right - textFlex03.left) - vp2px(140)) <=1).assertTrue();

      expect(obj1.$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(obj1.$attrs.constructor.alignItems).assertEqual('ItemAlign.Start')
      console.info('new testFlexItemAlignStartExceed END');
      done();
    });
  })
}
