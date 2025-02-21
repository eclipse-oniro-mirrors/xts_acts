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
export default function flexOffset_StretchJsunit() {
  describe('flexItemAlignStretchTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Flex/alignItems/ItemAlign_Stretch/FlexOffset',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get flexOffsetTest state success " + JSON.stringify(pages));
        if (!("flexOffsetTest" == pages.name)) {
          console.info("get flexOffsetTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push flexOffsetTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push flexOffsetTest page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("flexOffsetTest after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNITEMS_STRETCH_1000
     * @tc.name      testFlexItemAlignStretchSetOffset
     * @tc.desc      First subcomponent set offset attribute.
     */
    it('testFlexItemAlignStretchSetOffset', 0, async function (done) {
      console.info('new testFlexItemAlignStretchSetOffset START');
      let strJson1 = getInspectorByKey('flexOffset');
      let obj1 = JSON.parse(strJson1);
      let textOffset01 = CommonFunc.getComponentRect('textOffset01');
      let textOffset02 = CommonFunc.getComponentRect('textOffset02');
      let textOffset03 = CommonFunc.getComponentRect('textOffset03');
      let flexOffset = CommonFunc.getComponentRect('flexOffset');
      expect(Math.abs(textOffset02.top - textOffset03.top) <= 1).assertTrue()
      expect(Math.abs(textOffset03.top - flexOffset.top) <= 1).assertTrue()
      expect(Math.abs((textOffset01.left - flexOffset.left) - vp2px(15)) <= 1).assertTrue()
      expect(Math.abs((textOffset01.top - flexOffset.top) - vp2px(30)) <= 1).assertTrue()
      expect(Math.abs(textOffset02.bottom - textOffset03.bottom) <= 1).assertTrue()
      expect(Math.abs((textOffset01.bottom - textOffset01.top) - vp2px(200)) <= 1).assertTrue()
      expect(Math.abs((textOffset02.bottom - textOffset02.top) - vp2px(200)) <= 1).assertTrue()
      expect(Math.abs((textOffset03.bottom - textOffset03.top) - vp2px(200)) <= 1).assertTrue()
      expect(Math.abs((textOffset01.right - textOffset01.left) - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs((textOffset02.right - textOffset02.left) - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs((textOffset03.right - textOffset03.left) - vp2px(150)) <= 1).assertTrue()
      expect(obj1.$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(obj1.$attrs.constructor.alignItems).assertEqual('ItemAlign.Stretch')
      console.info('new testFlexItemAlignStretchSetOffset END');
      done();
    });
  })
}
