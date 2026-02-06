/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc, { RectValue } from "../../../../MainAbility/common/Common";
import GlobalContext from '../../../../MainAbility/common/GlobalContext';

export default function AlignSpaceEvenly_AddVisibility() {
  describe('AlignSpaceEvenly_AddVisibility', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/SpaceEvenly/AlignSpaceEvenly_AddVisibility',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignSpaceEvenly_AddVisibility state success " + JSON.stringify(pages));
        if (!("AlignSpaceEvenly_AddVisibility" == pages.name)) {
          console.info("get AlignSpaceEvenly_AddVisibility state pages.name " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignSpaceEvenly_AddVisibility page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignSpaceEvenly_AddVisibility page error " + JSON.stringify(err));
        expect().assertFail();
      }

    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("AlignSpaceEvenly_AddVisibility after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEEVENLY_TEST_1000
     * @tc.name textFlexAlignSpaceEvenlyTextVisibilityNone
     * @tc.desc The subcomponent sets the visibility. None, the child components are hidden in the interface display
     */
    it('textFlexAlignSpaceEvenlyTextVisibilityNone',  Level.LEVEL0, async () => {
      console.info('[textFlexAlignSpaceEvenlyTextVisibilityNone] START');
      try {
        GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'OneVisibility', value: Visibility.None
        });
        await CommonFunc.sleep(3000);
        let strJson = getInspectorByKey('SpaceEvenly_AddVisibility_01');

        let strJson2 = getInspectorByKey('SpaceEvenly_AddVisibility_011');

        expect(JSON.parse(strJson).$type).assertEqual('Flex');
        expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
        expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceEvenly');
        expect(JSON.parse(strJson2).$attrs.visibility).assertEqual("Visibility.None");
        let SpaceEvenly_AddVisibility_012: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_012');
        let SpaceEvenly_AddVisibility_013: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_013');
        let SpaceEvenly_AddVisibility_01: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_01');


        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.top) - Math.round(SpaceEvenly_AddVisibility_013.top)) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.top) - Math.round(SpaceEvenly_AddVisibility_01.top)) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.left - SpaceEvenly_AddVisibility_01.left) - Math.round(vp2px(200 / 3))) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_01.right - SpaceEvenly_AddVisibility_013.right) - Math.round(vp2px(200 / 3))) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_013.left - SpaceEvenly_AddVisibility_012.right) - Math.round(vp2px(200 / 3))) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.right - SpaceEvenly_AddVisibility_012.left) - Math.round(vp2px(150))) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_013.right - SpaceEvenly_AddVisibility_013.left) - Math.round(vp2px(150))) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.bottom - SpaceEvenly_AddVisibility_012.top) - Math.round(vp2px(100))) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_013.bottom - SpaceEvenly_AddVisibility_013.top) - Math.round(vp2px(150))) <= 2)
          .assertTrue();


      } catch (err) {
        console.error('[textFlexAlignSpaceEvenlyTextVisibilityNone] failed' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[textFlexAlignSpaceEvenlyTextVisibilityNone] END');

    });
    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEEVENLY_TEST_1100
     * @tc.name textFlexAlignSpaceEvenlyTextVisibilityHidden
     * @tc.desc When the subcomponent sets visibility.hidden, the interface of the subcomponent does not occupy the
     * position
     */
    it('textFlexAlignSpaceEvenlyTextVisibilityHidden',  Level.LEVEL0, async () => {
      console.info('[textFlexAlignSpaceEvenlyTextVisibilityHidden] START');
      try {
        GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'OneVisibility', value: Visibility.Hidden
        });
        await CommonFunc.sleep(3000);
        let strJson = getInspectorByKey('SpaceEvenly_AddVisibility_01');

        let strJson2 = getInspectorByKey('SpaceEvenly_AddVisibility_011');

        expect(JSON.parse(strJson).$type).assertEqual('Flex');
        expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
        expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceEvenly');
        expect(JSON.parse(strJson2).$attrs.visibility).assertEqual("Visibility.Hidden");
        let SpaceEvenly_AddVisibility_011: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_011');
        let SpaceEvenly_AddVisibility_012: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_012');
        let SpaceEvenly_AddVisibility_013: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_013');
        let SpaceEvenly_AddVisibility_01: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_01');
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.top) - Math.round(SpaceEvenly_AddVisibility_013.top)) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(Math.round(SpaceEvenly_AddVisibility_012.top)) - Math.round(SpaceEvenly_AddVisibility_01.top)) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(Math.round(SpaceEvenly_AddVisibility_012.top)) - Math.round(SpaceEvenly_AddVisibility_011.top)) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round((SpaceEvenly_AddVisibility_011.left - SpaceEvenly_AddVisibility_01.left) * 100) / 100 - Math.round(vp2px(12.5) * 100) / 100) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round((SpaceEvenly_AddVisibility_01.right - SpaceEvenly_AddVisibility_013.right) * 100) / 100 - Math.round(vp2px(12.5) * 100) / 100) <= 2)
          .assertTrue();


        expect(Math.abs(Math.round((SpaceEvenly_AddVisibility_012.left - SpaceEvenly_AddVisibility_011.right) * 100) / 100 - Math.round(vp2px(12.5) * 100) / 100) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round((SpaceEvenly_AddVisibility_013.left - SpaceEvenly_AddVisibility_012.right) * 100) / 100 - Math.round(vp2px(12.5) * 100) / 100) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_011.right - SpaceEvenly_AddVisibility_011.left) - Math.round(vp2px(150))) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.right - SpaceEvenly_AddVisibility_012.left) - Math.round(vp2px(150))) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_013.right - SpaceEvenly_AddVisibility_013.left) - Math.round(vp2px(150))) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_011.bottom - SpaceEvenly_AddVisibility_011.top) - Math.round(vp2px(50))) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.bottom - SpaceEvenly_AddVisibility_012.top) - Math.round(vp2px(100))) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_013.bottom - SpaceEvenly_AddVisibility_013.top) - Math.round(vp2px(150))) <= 2)
          .assertTrue();

      } catch (err) {
        console.error('[textFlexAlignSpaceEvenlyTextVisibilityHidden] failed' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[textFlexAlignSpaceEvenlyTextVisibilityHidden] END');

    });
    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEEVENLY_TEST_1700
     * @tc.name textFlexAlignSpaceEvenlyTextVisibilityVisible
     * @tc.desc The subcomponent sets the visibility. Visible, the subcomponent does not occupy a position in the
     * interface display
     */
    it('textFlexAlignSpaceEvenlyTextVisibilityVisible',  Level.LEVEL0, async () => {
      console.info('[textFlexAlignSpaceEvenlyTextVisibilityVisible] START');
      try {
        GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'OneVisibility', value: Visibility.Visible
        });
        await CommonFunc.sleep(3000);
        let strJson = getInspectorByKey('SpaceEvenly_AddVisibility_01');

        let strJson2 = getInspectorByKey('SpaceEvenly_AddVisibility_011');

        expect(JSON.parse(strJson).$type).assertEqual('Flex');
        expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
        expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.SpaceEvenly');
        expect(JSON.parse(strJson2).$attrs.visibility).assertEqual("Visibility.Visible");
        let SpaceEvenly_AddVisibility_011: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_011');
        let SpaceEvenly_AddVisibility_012: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_012');
        let SpaceEvenly_AddVisibility_013: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_013');
        let SpaceEvenly_AddVisibility_01: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_01');


        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.top) - Math.round(SpaceEvenly_AddVisibility_013.top)) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.top) - Math.round(SpaceEvenly_AddVisibility_01.top)) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.top) - Math.round(SpaceEvenly_AddVisibility_011.top)) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round((SpaceEvenly_AddVisibility_011.left - SpaceEvenly_AddVisibility_01.left) * 100) / 100 - Math.round(vp2px(12.5) * 100) / 100) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round((SpaceEvenly_AddVisibility_01.right - SpaceEvenly_AddVisibility_013.right) * 100) / 100 - Math.round(vp2px(12.5) * 100) / 100) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round((SpaceEvenly_AddVisibility_012.left - SpaceEvenly_AddVisibility_011.right) * 100) / 100 - Math.round(vp2px(12.5) * 100) / 100) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round((SpaceEvenly_AddVisibility_013.left - SpaceEvenly_AddVisibility_012.right) * 100) / 100 - Math.round(vp2px(12.5) * 100) / 100) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_011.right - SpaceEvenly_AddVisibility_011.left) - Math.round(vp2px(150))) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.right - SpaceEvenly_AddVisibility_012.left) - Math.round(vp2px(150))) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_013.right - SpaceEvenly_AddVisibility_013.left) - Math.round(vp2px(150))) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_011.bottom - SpaceEvenly_AddVisibility_011.top) - Math.round(vp2px(50))) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.bottom - SpaceEvenly_AddVisibility_012.top) - Math.round(vp2px(100))) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_013.bottom - SpaceEvenly_AddVisibility_013.top) - Math.round(vp2px(150))) <= 2)
          .assertTrue();

      } catch (err) {
        console.error('[textFlexAlignSpaceEvenlyTextVisibilityVisible] failed' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[textFlexAlignSpaceEvenlyTextVisibilityVisible] END');

    });
  })
}
