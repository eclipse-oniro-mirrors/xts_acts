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
export default function flexExceed_BaselineJsunit() {
  describe('flexItemAlignBaselineTest2', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Flex/alignItems/ItemAlign_Baseline/FlexExceed',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexExceed state success " + JSON.stringify(pages));
        if (!("FlexExceed" == pages.name)) {
          console.info("get FlexExceed state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push FlexExceed page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexExceed page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("FlexExceed after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNITEMS_BASELINE_0600
     * @tc.name      testFlexItemAlignBaselineSetMarPad
     * @tc.desc      Subcomponent inside when parent component set margin and padding.
     */
    it('testFlexItemAlignBaselineSetMarPad', 0, async function (done) {
      console.info('new testFlexItemAlignBaselineSetMarPad START');
      globalThis.value.message.notify({name:'padding', value:10});
      globalThis.value.message.notify({name:'margin', value:10});
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('flexExceed01');
      let obj1 = JSON.parse(strJson1);
      let textExceed01 = CommonFunc.getComponentRect('textExceed01');
      let textExceed02 = CommonFunc.getComponentRect('textExceed02');
      let textExceed03 = CommonFunc.getComponentRect('textExceed03');
      let flexExceed01 = CommonFunc.getComponentRect('flexExceed01');
      expect(Math.abs(textExceed01.left - flexExceed01.left - vp2px(10)) <= 1).assertTrue()
      expect(Math.abs(textExceed01.right - textExceed02.left) <= 1).assertTrue()
      expect(Math.abs(textExceed02.right - textExceed03.left) <= 1).assertTrue()
      expect(Math.abs(flexExceed01.right - textExceed03.right - vp2px(40)) <= 1).assertTrue()

      expect(Math.abs(textExceed01.top - flexExceed01.top - vp2px(60)) <= 1).assertTrue()
      expect(Math.abs(textExceed03.top - flexExceed01.top - vp2px(10)) <= 1).assertTrue()
      expect(Math.abs(textExceed01.top - textExceed03.top - textExceed03.bottom + textExceed01.bottom) <= 1).assertTrue()
      expect(Math.abs(textExceed02.top - textExceed03.top - textExceed03.bottom + textExceed02.bottom) <= 1).assertTrue()

      expect(Math.abs(textExceed01.bottom - textExceed01.top - vp2px(50)) <= 1).assertTrue()
      expect(Math.abs(textExceed02.bottom - textExceed02.top - vp2px(100)) <= 1).assertTrue()
      expect(Math.abs(textExceed03.bottom - textExceed03.top - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(textExceed01.right - textExceed01.left - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(textExceed02.right - textExceed02.left - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(textExceed03.right - textExceed03.left - vp2px(150)) <= 1).assertTrue()
      expect(obj1.$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(obj1.$attrs.constructor.alignItems).assertEqual('ItemAlign.Baseline')
      console.info('new testFlexItemAlignBaselineSetMarPad END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNITEMS_BASELINE_0700
     * @tc.name      testFlexItemAlignBaselineSetMarPadExceed
     * @tc.desc      Subcomponent outside when parent component set margin and padding.
     */
    it('testFlexItemAlignBaselineSetMarPadExceed', 0, async function (done) {
      console.info('new testFlexItemAlignBaselineSetMarPadExceed START');
      globalThis.value.message.notify({name:'padding', value:30});
      globalThis.value.message.notify({name:'margin', value:30});
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('flexExceed01');
      let obj1 = JSON.parse(strJson1);
      let textExceed01 = CommonFunc.getComponentRect('textExceed01');
      let textExceed02 = CommonFunc.getComponentRect('textExceed02');
      let textExceed03 = CommonFunc.getComponentRect('textExceed03');
      let flexExceed01 = CommonFunc.getComponentRect('flexExceed01');
      expect(Math.abs(textExceed01.left - flexExceed01.left - vp2px(30)) <= 1).assertTrue()
      expect(Math.abs(textExceed01.right - textExceed02.left) <= 1).assertTrue()
      expect(Math.abs(textExceed02.right - textExceed03.left) <= 1).assertTrue()
      expect(Math.abs(flexExceed01.right - textExceed03.right - vp2px(30)) <= 1).assertTrue()

      expect(Math.abs(textExceed01.top - flexExceed01.top - vp2px(80)) <= 1).assertTrue()
      expect(Math.abs(textExceed03.top - flexExceed01.top - vp2px(30)) <= 1).assertTrue()
      expect(Math.abs(textExceed01.top - textExceed03.top - textExceed03.bottom + textExceed01.bottom) <= 1).assertTrue()
      expect(Math.abs(textExceed02.top - textExceed03.top - textExceed03.bottom+ textExceed02.bottom) <= 1).assertTrue()

      expect(Math.abs(textExceed01.bottom - textExceed01.top - vp2px(50)) <= 1).assertTrue()
      expect(Math.abs(textExceed02.bottom - textExceed02.top - vp2px(100)) <= 1).assertTrue()
      expect(Math.abs(textExceed03.bottom - textExceed03.top - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(textExceed01.right - textExceed01.left - vp2px(440/3)) <= 1).assertTrue()
      expect(Math.abs(textExceed02.right - textExceed02.left - vp2px(440/3)) <= 1).assertTrue()
      expect(Math.abs(textExceed03.right - textExceed03.left - vp2px(440/3)) <= 1).assertTrue()
      expect(obj1.$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(obj1.$attrs.constructor.alignItems).assertEqual('ItemAlign.Baseline')
      console.info('new testFlexItemAlignBaselineSetMarPadExceed END');
      done();
    });
  })
}
