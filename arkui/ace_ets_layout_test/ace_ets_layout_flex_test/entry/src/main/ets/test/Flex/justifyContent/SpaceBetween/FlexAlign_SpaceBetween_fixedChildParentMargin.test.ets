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

export default function flexAlign_SpaceBetween_fixedChildParentMargin() {
  describe('FlexAlign_SpaceBetween_fixedChildParentMargin', function () {
    beforeEach(async function (done) {
      console.info("FlexAlign_SpaceBetween_fixedChildParentMargin beforeEach called");
      let options = {
        uri: 'MainAbility/pages/Flex/justifyContent/SpaceBetween/FlexAlign_SpaceBetween_fixedChildParentMargin',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get FlexAlign_SpaceBetween_fixedChildParentMargin state pages:" + JSON.stringify(pages));
        if (!("FlexAlign_SpaceBetween_fixedChildParentMargin" == pages.name)) {
          console.info("get FlexAlign_SpaceBetween_fixedChildParentMargin pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push FlexAlign_SpaceBetween_fixedChildParentMargin page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexAlign_SpaceBetween_fixedChildParentMargin page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("FlexAlign_SpaceBetween_fixedChildParentMargin afterEach called");
    });

    /**
     * @tc.number    SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEBETWEEN_TEST_0500
     * @tc.name      testAlignSpaceBetweenRowNoWrapMargin
     * @tc.desc      The child component is fixed, and the parent component is bound with margin attributes
     */
    it('testAlignSpaceBetweenRowNoWrapMargin', 0, async function (done) {
      console.info('new testAlignSpaceBetweenRowNoWrapMargin START');
      globalThis.value.message.notify({ name: 'margin', value: 20 })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('FlexAlignSpaceBetween5');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Flex');
      expect(obj.$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(obj.$attrs.constructor.wrap).assertEqual('FlexWrap.NoWrap');
      expect(obj.$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceBetween');
      let locationText1 = CommonFunc.getComponentRect('AlignSpaceBetween13');
      let locationText2 = CommonFunc.getComponentRect('AlignSpaceBetween14');
      let locationText3 = CommonFunc.getComponentRect('AlignSpaceBetween15');
      let locationFlex = CommonFunc.getComponentRect('FlexAlignSpaceBetween5');
      expect(Math.abs((locationText1.top) - (locationText2.top)) <= 1).assertTrue();
      expect(Math.abs((locationText2.top) - (locationText3.top)) <= 1).assertTrue();
      expect(Math.abs((locationText1.top) - (locationFlex.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.bottom - locationText1.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText2.bottom - locationText2.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText3.bottom - locationText3.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationFlex.bottom - locationText3.bottom)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((locationText1.left) - (locationFlex.left)) <= 1).assertTrue();
      expect(Math.abs((locationText3.right) - (locationFlex.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText1.right - locationText1.left)) - (Math.round(locationText2.right - locationText2.left))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText3.right - locationText3.left)) - (Math.round(locationText2.right - locationText2.left))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText2.right - locationText2.left)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(locationText2.left - locationText1.right)) - (Math.round(locationText3.left - locationText2.right))) <= 1).assertTrue();
      expect(Math.abs((Math.round((locationText2.left - locationText1.right) * 10) / 10) - (Math.round(vp2px(25) * 10) / 10)) <= 1).assertTrue();
      console.info('new testAlignSpaceBetweenRowNoWrapMargin END');
      done();
    });
  })
}