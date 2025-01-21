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
import CommonFunc from '../../../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../../../MainAbility/common/MessageManager';

export default function flexAlign_SpaceAround_fixedParent() {
  describe('FlexAlign_SpaceAround_fixedParent', function () {
    beforeEach(async function (done) {
      console.info("FlexAlign_SpaceAround_fixedParent beforeEach called");
      let options = {
        uri: 'MainAbility/pages/Flex/justifyContent/SpaceAround/FlexAlign_SpaceAround_fixedParent',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexAlign_SpaceAround_fixedParent state pages:" + JSON.stringify(pages));
        if (!("FlexAlign_SpaceAround_fixedParent" == pages.name)) {
          console.info("get FlexAlign_SpaceAround_fixedParent state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push FlexAlign_SpaceAround_fixedParent page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexAlign_SpaceAround_fixedParent page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("FlexAlign_SpaceAround_fixedParent afterEach called");
    });

    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEAROUND_TEST_0900
     * @tc.name      testAlignSpaceAroundRowNoWrapOffset
     * @tc.desc      Parent component fixed, child component binding offset properties
     */
    it('testAlignSpaceAroundRowNoWrapOffset', 0, async function (done) {
      console.info('new testAlignSpaceAroundRowNoWrapOffset START');
      globalThis.value.message.notify({ name: 'x', value: 15 })
      globalThis.value.message.notify({ name: 'y', value: 30 })
      globalThis.value.message.notify({ name: 'visibility', value: Visibility.Visible })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexAlignSpaceAround9');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceAround');
      let strJson2 = getInspectorByKey('AlignSpaceAround25');
      let obj2 = JSON.parse(strJson2);
      expect(obj2.$attrs.visibility).assertEqual('Visibility.Visible');
      let locationText1 = CommonFunc.getComponentRect('AlignSpaceAround25');
      let locationText2 = CommonFunc.getComponentRect('AlignSpaceAround26');
      let locationText3 = CommonFunc.getComponentRect('AlignSpaceAround27');
      let locationFlex = CommonFunc.getComponentRect('FlexAlignSpaceAround9');
      expect(Math.abs(locationText1.top - locationFlex.top - vp2px(30)) <= 1).assertTrue();
      expect(Math.abs(locationText1.left - locationFlex.left -
        (vp2px(15) + (locationFlex.right - locationText3.right))) <= 1).assertTrue();
      expect(Math.abs(locationText2.top - locationText3.top) <= 1).assertTrue();
      expect(Math.abs(locationText3.top - locationFlex.top) <= 1).assertTrue();
      expect(Math.abs(locationText1.bottom - locationText1.top - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(locationText2.bottom - locationText2.top - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(locationText3.bottom - locationText3.top - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(locationFlex.bottom - locationText3.bottom - vp2px(50)) <= 1).assertTrue();

      expect(Math.abs(locationText1.right - locationText1.left -
        (locationText2.right - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs(locationText3.right - locationText3.left -
        (locationText2.right - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs(locationText2.right - locationText2.left - vp2px(150)) <= 1).assertTrue();
      expect(Math.abs(locationText2.left - locationText1.right + vp2px(15) -
        (locationText3.left - locationText2.right)) <= 1).assertTrue();
      expect(Math.abs(locationText1.left - locationFlex.left - vp2px(15) -
        (locationFlex.right - locationText3.right)) <= 1).assertTrue();
      expect(Math.abs(locationText3.left - locationText2.right -
        2 * (locationFlex.right - locationText3.right)) <= 1).assertTrue();
      console.info('new testAlignSpaceAroundRowNoWrapOffset END');
      done();
    });
  })
}