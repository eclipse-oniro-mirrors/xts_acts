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
import CommonFunc from "./../../../../MainAbility/common/Common"
export default function AlignSpaceEvenly_AddAlign() {
  describe('AlignSpaceEvenly_AddAlign', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Flex/justifyContent/SpaceEvenly/AlignSpaceEvenly_AddAlign'
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignSpaceEvenly_AddAlign state success " + JSON.stringify(pages));
        if (!("AlignSpaceEvenly_AddAlign" == pages.name)) {
          console.info("get AlignSpaceEvenly_AddAlign state pages.name " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignSpaceEvenly_AddAlign page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignSpaceEvenly_AddAlign page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("AlignSpaceEvenly_AddAlign after each called")
    });

    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEEVENLY_TEST_0800
     * @tc.name      testFlexAlignSpaceEvenlyAlignBottomEnd
     * @tc.desc      Setting generic properties does not take effect, and owned properties take precedence
     */
    it('testFlexAlignSpaceEvenlyAlignBottomEnd', 0, async function (done) {
      console.info('[testFlexAlignSpaceEvenlyAlignBottomEnd] START');
      globalThis.value.message.notify({name:'DadAlign', value:Alignment.BottomEnd})
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('SpaceEvenly_AddAlign_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceEvenly');
      let SpaceEvenly_AddAlign_011 = CommonFunc.getComponentRect('SpaceEvenly_AddAlign_011');
      let SpaceEvenly_AddAlign_012 = CommonFunc.getComponentRect('SpaceEvenly_AddAlign_012');
      let SpaceEvenly_AddAlign_013 = CommonFunc.getComponentRect('SpaceEvenly_AddAlign_013');
      let SpaceEvenly_AddAlign_01 = CommonFunc.getComponentRect('SpaceEvenly_AddAlign_01');
      expect(Math.abs(SpaceEvenly_AddAlign_011.top - SpaceEvenly_AddAlign_012.top) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddAlign_012.top - SpaceEvenly_AddAlign_013.top) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddAlign_011.top - SpaceEvenly_AddAlign_01.top) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddAlign_012.left - SpaceEvenly_AddAlign_011.right - SpaceEvenly_AddAlign_013.left + SpaceEvenly_AddAlign_012.right) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddAlign_011.left - SpaceEvenly_AddAlign_01.left - SpaceEvenly_AddAlign_01.right + SpaceEvenly_AddAlign_013.right) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddAlign_012.left - SpaceEvenly_AddAlign_011.right - vp2px(12.5)) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddAlign_01.right - SpaceEvenly_AddAlign_013.right - vp2px(12.5)) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddAlign_011.right - SpaceEvenly_AddAlign_011.left - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddAlign_012.right - SpaceEvenly_AddAlign_012.left - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddAlign_013.right - SpaceEvenly_AddAlign_013.left - vp2px(150)) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddAlign_011.bottom - SpaceEvenly_AddAlign_011.top - vp2px(50)) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddAlign_012.bottom - SpaceEvenly_AddAlign_012.top - vp2px(100)) <= 1).assertTrue()
      expect(Math.abs(SpaceEvenly_AddAlign_013.bottom - SpaceEvenly_AddAlign_013.top - vp2px(150)) <= 1).assertTrue()
      console.info('[testFlexAlignSpaceEvenlyAlignBottomEnd] END');
      done()
    });
  })
}
