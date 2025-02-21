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
export default function AlignSpaceEvenly_AddPadding() {
  describe('AlignSpaceEvenly_AddPadding', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Flex/justifyContent/SpaceEvenly/AlignSpaceEvenly_AddPadding',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignSpaceEvenly_AddPadding state success " + JSON.stringify(pages));
        if (!("AlignSpaceEvenly_AddPadding" == pages.name)) {
          console.info("get AlignSpaceEvenly_AddPadding state pages.name " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignSpaceEvenly_AddPadding page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignSpaceEvenly_AddPadding page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("AlignSpaceEvenly_AddPadding after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEEVENLY_TEST_0300
     * @tc.name      testAlignSpaceEvenlyFlexPadMeet
     * @tc.desc      After subtracting the padding from the parent component layout space, the interface
     * display that does not meet the spindle layout of the child component
     */
    it('testAlignSpaceEvenlyFlexPadMeet', 0, async function (done) {
      console.info('[testAlignSpaceEvenlyFlexPadMeet] START');
      globalThis.value.message.notify({ name: 'DadPadding', value: 30 });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('SpaceEvenly_AddPadding_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceEvenly');
      let SpaceEvenly_AddPadding_011 = CommonFunc.getComponentRect('SpaceEvenly_AddPadding_011')
      let SpaceEvenly_AddPadding_012 = CommonFunc.getComponentRect('SpaceEvenly_AddPadding_012')
      let SpaceEvenly_AddPadding_013 = CommonFunc.getComponentRect('SpaceEvenly_AddPadding_013')
      let SpaceEvenly_AddPadding_01 = CommonFunc.getComponentRect('SpaceEvenly_AddPadding_01');
      expect(Math.abs(SpaceEvenly_AddPadding_011.top - SpaceEvenly_AddPadding_012.top) <= 1).assertTrue();
      expect(Math.abs(SpaceEvenly_AddPadding_012.top - SpaceEvenly_AddPadding_013.top) <= 1).assertTrue();
      expect(Math.abs(SpaceEvenly_AddPadding_012.left - SpaceEvenly_AddPadding_011.right) <= 1).assertTrue();
      expect(Math.abs(SpaceEvenly_AddPadding_013.left - SpaceEvenly_AddPadding_012.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddPadding_011.top - SpaceEvenly_AddPadding_01.top)) - (Math.round(vp2px(30)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddPadding_011.bottom - SpaceEvenly_AddPadding_011.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddPadding_012.bottom - SpaceEvenly_AddPadding_012.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddPadding_013.bottom - SpaceEvenly_AddPadding_013.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddPadding_011.right - SpaceEvenly_AddPadding_011.left)) - (Math.round(vp2px(440 / 3)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddPadding_012.right - SpaceEvenly_AddPadding_012.left)) - (Math.round(vp2px(440 / 3)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddPadding_013.right - SpaceEvenly_AddPadding_013.left)) - (Math.round(vp2px(440 / 3)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddPadding_011.left - SpaceEvenly_AddPadding_01.left)) - (Math.round(vp2px(30)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddPadding_01.right - SpaceEvenly_AddPadding_013.right)) - (Math.round(vp2px(30)))) <= 1).assertTrue();
      console.info('[testAlignSpaceEvenlyFlexPadMeet] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEEVENLY_TEST_0400
     * @tc.name      testAlignSpaceEvenlyFlexPadOverflow
     * @tc.desc      After subtracting the padding from the parent component layout space, the interface that
     * satisfies the spindle layout of the child component is displayed
     */
    it('testAlignSpaceEvenlyFlexPadOverflow', 0, async function (done) {
      console.info('[testAlignSpaceEvenlyFlexPadOverflow] START');
      globalThis.value.message.notify({ name: 'DadPadding', value: 20 })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('SpaceEvenly_AddPadding_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceEvenly');
      let SpaceEvenly_AddPadding_011 = CommonFunc.getComponentRect('SpaceEvenly_AddPadding_011');
      let SpaceEvenly_AddPadding_012 = CommonFunc.getComponentRect('SpaceEvenly_AddPadding_012');
      let SpaceEvenly_AddPadding_013 = CommonFunc.getComponentRect('SpaceEvenly_AddPadding_013');
      let SpaceEvenly_AddPadding_01 = CommonFunc.getComponentRect('SpaceEvenly_AddPadding_01');
      expect(Math.abs(Math.round(SpaceEvenly_AddPadding_011.top) - Math.round(SpaceEvenly_AddPadding_012.top)) <= 1).assertTrue();
      expect(Math.abs(Math.round(SpaceEvenly_AddPadding_012.top) - Math.round(SpaceEvenly_AddPadding_013.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddPadding_011.top - SpaceEvenly_AddPadding_01.top)) - (Math.round(vp2px(20)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddPadding_011.right - SpaceEvenly_AddPadding_011.left)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddPadding_012.right - SpaceEvenly_AddPadding_012.left)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddPadding_013.right - SpaceEvenly_AddPadding_013.left)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddPadding_011.bottom - SpaceEvenly_AddPadding_011.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddPadding_012.bottom - SpaceEvenly_AddPadding_012.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddPadding_013.bottom - SpaceEvenly_AddPadding_013.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddPadding_013.left - SpaceEvenly_AddPadding_012.right)) - (Math.round(vp2px(2.5)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddPadding_012.left - SpaceEvenly_AddPadding_011.right)) - (Math.round(vp2px(2.5)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddPadding_011.left - SpaceEvenly_AddPadding_01.left)) - (Math.round(vp2px(22.5)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(SpaceEvenly_AddPadding_01.right - SpaceEvenly_AddPadding_013.right)) - (Math.round(vp2px(22.5)))) <= 1).assertTrue();
      console.info('[testAlignSpaceEvenlyFlexPadOverflow] END');
      done();
    });
  })
}
