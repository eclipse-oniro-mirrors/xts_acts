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
export default function flexPadding_EndJsunit() {
  describe('flexItemAlignEndTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Flex/alignItems/ItemAlign_End/FlexPadding',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexPadding state success " + JSON.stringify(pages));
        if (!("FlexPadding" == pages.name)) {
          console.info("get FlexPadding state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push FlexPadding page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexPadding page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("FlexPadding after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNITEMS_END_0300
     * @tc.name      testFlexItemAlignEndParentSetPadding
     * @tc.desc      Parent component set paddding,subcomponent does not exceed the parent component.
     */
    it('testFlexItemAlignEndParentSetPadding', 0, async function (done) {
      console.info('new testFlexItemAlignEndParentSetPadding START');
      globalThis.value.message.notify({name:'padding', value:10});
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('flexPadding01');
      let obj1 = JSON.parse(strJson1);
      let strJson2 = getInspectorByKey('textFlexPadding01');
      let obj2 = JSON.parse(strJson2);
      let textFlexPadding01 = CommonFunc.getComponentRect('textFlexPadding01')
      let textFlexPadding02 = CommonFunc.getComponentRect('textFlexPadding02')
      let textFlexPadding03 = CommonFunc.getComponentRect('textFlexPadding03')
      let flexPadding01 = CommonFunc.getComponentRect('flexPadding01')

      expect(Math.abs(textFlexPadding01.bottom - textFlexPadding02.bottom) <= 1).assertTrue()
      expect(Math.abs(textFlexPadding02.bottom - textFlexPadding03.bottom) <= 1).assertTrue()
      expect(Math.abs(flexPadding01.bottom - textFlexPadding01.bottom - Math.round(vp2px(10))) <= 1).assertTrue()
      expect(Math.abs(textFlexPadding01.left - flexPadding01.left - Math.round(vp2px(10))) <= 1).assertTrue()
      expect(textFlexPadding03.right).assertLess(flexPadding01.right)

      expect(Math.abs(textFlexPadding01.bottom - textFlexPadding01.top - Math.round(vp2px(50))) <= 1).assertTrue()
      expect(Math.abs(textFlexPadding02.bottom - textFlexPadding02.top - Math.round(vp2px(100))) <= 1).assertTrue()
      expect(Math.abs(textFlexPadding03.bottom - textFlexPadding03.top - Math.round(vp2px(150))) <= 1).assertTrue()

      expect(Math.abs(textFlexPadding01.right - textFlexPadding01.left - Math.round(vp2px(150))) <= 1).assertTrue()
      expect(Math.abs(textFlexPadding02.right - textFlexPadding02.left - Math.round(vp2px(150))) <= 1).assertTrue()
      expect(Math.abs(textFlexPadding03.right - textFlexPadding03.left - Math.round(vp2px(150))) <= 1).assertTrue()
      expect(obj1.$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(obj1.$attrs.constructor.alignItems).assertEqual('ItemAlign.End')
      console.info('new testFlexItemAlignEndParentSetPadding END');
      done();
    });

    
  })
}
