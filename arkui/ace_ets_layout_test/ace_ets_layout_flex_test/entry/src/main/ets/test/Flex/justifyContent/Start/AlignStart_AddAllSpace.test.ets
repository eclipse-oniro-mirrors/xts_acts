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
export default function AlignStart_AddAllSpace() {
  describe('AlignStart_AddAllSpace', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Flex/justifyContent/Start/AlignStart_AddAllSpace'
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignStart_AddAllSpace state success " + JSON.stringify(pages));
        if (!("AlignStart_AddAllSpace" == pages.name)) {
          console.info("get AlignStart_AddAllSpace state pages.name " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignStart_AddAllSpace page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignStart_AddAllSpace page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    });
    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("AlignStart_AddAllSpace after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_START_TEST_0600
     * @tc.name      testFlexAlignStartFlexSpaceOverflow
     * @tc.desc      the space of the parent component set to 20
     */
    it('testFlexAlignStartFlexSpaceOverflow', 0, async function (done) {
      console.info('[testFlexAlignStartFlexSpaceOverflow] START');
      globalThis.value.message.notify({ name: 'DadAllSpace', value: 30 });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Start_AddAllSpace_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let Start_AddAllSpace_011 = CommonFunc.getComponentRect('Start_AddAllSpace_011');
      let Start_AddAllSpace_012 = CommonFunc.getComponentRect('Start_AddAllSpace_012');
      let Start_AddAllSpace_013 = CommonFunc.getComponentRect('Start_AddAllSpace_013');
      let Start_AddAllSpace_01 = CommonFunc.getComponentRect('Start_AddAllSpace_01');
      let Start_AddAllSpace_01_Box = CommonFunc.getComponentRect('Start_AddAllSpace_01_Box');
      expect(Math.abs(Start_AddAllSpace_011.top - Start_AddAllSpace_012.top) <= 1).assertTrue();
      expect(Math.abs(Start_AddAllSpace_012.top - Start_AddAllSpace_013.top) <= 1).assertTrue();
      expect(Math.abs(Start_AddAllSpace_012.left - Start_AddAllSpace_011.right) <= 1).assertTrue();
      expect(Math.abs(Start_AddAllSpace_013.left - Start_AddAllSpace_012.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(Start_AddAllSpace_011.top - Start_AddAllSpace_01.top)) - (Math.round(vp2px(30)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Start_AddAllSpace_011.left - Start_AddAllSpace_01.left)) - (Math.round(vp2px(30)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Start_AddAllSpace_01.right - Start_AddAllSpace_013.right)) - (Math.round(vp2px(30)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Start_AddAllSpace_01.top - Start_AddAllSpace_01_Box.top)) - (Math.round(vp2px(10)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Start_AddAllSpace_01.left - Start_AddAllSpace_01_Box.left)) - (Math.round(vp2px(10)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Start_AddAllSpace_011.bottom - Start_AddAllSpace_011.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Start_AddAllSpace_012.bottom - Start_AddAllSpace_012.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Start_AddAllSpace_013.bottom - Start_AddAllSpace_013.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Start_AddAllSpace_011.right - Start_AddAllSpace_011.left)) - (Math.round(vp2px(440 / 3)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Start_AddAllSpace_012.right - Start_AddAllSpace_012.left)) - (Math.round(vp2px(440 / 3)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Start_AddAllSpace_013.right - Start_AddAllSpace_013.left)) - (Math.round(vp2px(440 / 3)))) <= 1).assertTrue();
      console.info('[testFlexAlignStartFlexSpaceOverflow] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_START_TEST_0700
     * @tc.name      testFlexAlignStartFlexSpaceMeet
     * @tc.desc      the space of the parent component set to 20
     */
    it('testFlexAlignStartFlexSpaceMeet', 0, async function (done) {
      console.info('[testFlexAlignStartFlexSpaceMeet] START');
      globalThis.value.message.notify({ name: 'DadAllSpace', value: 20 });
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('Start_AddAllSpace_01');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
      let Start_AddAllSpace_011 = CommonFunc.getComponentRect('Start_AddAllSpace_011');
      let Start_AddAllSpace_012 = CommonFunc.getComponentRect('Start_AddAllSpace_012');
      let Start_AddAllSpace_013 = CommonFunc.getComponentRect('Start_AddAllSpace_013');
      let Start_AddAllSpace_01 = CommonFunc.getComponentRect('Start_AddAllSpace_01');
      let Start_AddAllSpace_01_Box = CommonFunc.getComponentRect('Start_AddAllSpace_01_Box');
      expect(Math.abs(Start_AddAllSpace_011.top - Start_AddAllSpace_012.top) <= 1).assertTrue();
      expect(Math.abs(Start_AddAllSpace_012.top - Start_AddAllSpace_013.top) <= 1).assertTrue();
      expect(Math.abs(Start_AddAllSpace_012.left - Start_AddAllSpace_011.right) <= 1).assertTrue();
      expect(Math.abs(Start_AddAllSpace_013.left - Start_AddAllSpace_012.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(Start_AddAllSpace_011.left - Start_AddAllSpace_01.left)) - (Math.round(vp2px(20)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Start_AddAllSpace_01.right - Start_AddAllSpace_013.right)) - (Math.round(vp2px(30)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Start_AddAllSpace_011.top - Start_AddAllSpace_01.top)) - (Math.round(vp2px(20)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Start_AddAllSpace_01.left - Start_AddAllSpace_01_Box.left)) - (Math.round(vp2px(10)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Start_AddAllSpace_01.top - Start_AddAllSpace_01_Box.top)) - (Math.round(vp2px(10)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Start_AddAllSpace_011.right - Start_AddAllSpace_011.left)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Start_AddAllSpace_012.right - Start_AddAllSpace_012.left)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Start_AddAllSpace_013.right - Start_AddAllSpace_013.left)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Start_AddAllSpace_011.bottom - Start_AddAllSpace_011.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Start_AddAllSpace_012.bottom - Start_AddAllSpace_012.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Start_AddAllSpace_013.bottom - Start_AddAllSpace_013.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      console.info('[testFlexAlignStartFlexSpaceMeet] END');
      done();
    });
  })
}
