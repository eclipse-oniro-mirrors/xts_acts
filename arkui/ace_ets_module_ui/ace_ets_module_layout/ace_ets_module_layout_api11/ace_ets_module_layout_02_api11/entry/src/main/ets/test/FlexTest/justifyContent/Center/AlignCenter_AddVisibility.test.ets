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

export default function AlignCenter_AddVisibility() {
  describe('AlignCenter_AddVisibility', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/Center/AlignCenter_AddVisibility',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignCenter_AddVisibility state success " + JSON.stringify(pages));
        if (!("AlignCenter_AddVisibility" == pages.name)) {
          console.info("get AlignCenter_AddVisibility state pages.name " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignCenter_AddVisibility page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignCenter_AddVisibility page error " + JSON.stringify(err));
        expect().assertFail();
      }

    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("AlignCenter_AddVisibility after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_CENTER_TEST_1000
     * @tc.name testFlexAlignCenterVisibilityNone
     * @tc.desc The subcomponent sets the visibility. None, the child components are hidden in the interface display
     */
    it('testFlexAlignCenterVisibilityNone',  Level.LEVEL0, async () => {
      console.info('[testFlexAlignCenterVisibilityNone] START');
      try {
        GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'OneVisibility', value: Visibility.None
        });
        await CommonFunc.sleep(3000);
        let strJson = getInspectorByKey('Center_AddVisibility_01');

        let strJson2 = getInspectorByKey('Center_AddVisibility_011');

        expect(JSON.parse(strJson).$type).assertEqual('Flex');
        expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
        expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.Center');
        expect(JSON.parse(strJson2).$attrs.visibility).assertEqual("Visibility.None");
        let Center_AddVisibility_012: RectValue = CommonFunc.getComponentRect('Center_AddVisibility_012');
        let Center_AddVisibility_013: RectValue = CommonFunc.getComponentRect('Center_AddVisibility_013');
        let Center_AddVisibility_01: RectValue = CommonFunc.getComponentRect('Center_AddVisibility_01');
        expect(Math.abs(Center_AddVisibility_012.top - Center_AddVisibility_013.top) <= 1).assertTrue()
        expect(Math.abs(Center_AddVisibility_012.top - Center_AddVisibility_01.top) <= 1).assertTrue()
        expect(Math.abs(Center_AddVisibility_012.right - Center_AddVisibility_013.left) <= 1).assertTrue()
        expect(Math.abs((Center_AddVisibility_012.left - Center_AddVisibility_01.left) - vp2px(100)) <= 1).assertTrue();
        expect(Math.abs((Center_AddVisibility_01.right - Center_AddVisibility_013.right) - vp2px(100)) <= 1)
          .assertTrue();
        expect(Math.abs((Center_AddVisibility_012.right - Center_AddVisibility_012.left) - vp2px(150)) <= 1)
          .assertTrue();
        expect(Math.abs((Center_AddVisibility_013.right - Center_AddVisibility_013.left) - vp2px(150)) <= 1)
          .assertTrue();
        expect(Math.abs((Center_AddVisibility_012.bottom - Center_AddVisibility_012.top) - vp2px(100)) <= 1)
          .assertTrue();
        expect(Math.abs((Center_AddVisibility_013.bottom - Center_AddVisibility_013.top) - vp2px(150)) <= 1)
          .assertTrue();
      } catch (err) {
        console.error('[testFlexAlignCenterVisibilityNone] failed');
        expect().assertFail();
      }
      console.info('[testFlexAlignCenterVisibilityNone] END');

    });
    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_CENTER_TEST_1100
     * @tc.name testFlexAlignCenterVisibilityHidden
     * @tc.desc When the subcomponent sets visibility.hidden, the interface of the subcomponent does not occupy the
     * position
     */
    it('testFlexAlignCenterVisibilityHidden',  Level.LEVEL0, async () => {
      console.info('[testFlexAlignCenterVisibilityHidden] START');
      try {
        GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'OneVisibility', value: Visibility.Hidden
        });
        await CommonFunc.sleep(3000);
        let strJson = getInspectorByKey('Center_AddVisibility_01');

        let strJson2 = getInspectorByKey('Center_AddVisibility_011');

        expect(JSON.parse(strJson).$type).assertEqual('Flex');
        expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
        expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.Center');
        expect(JSON.parse(strJson2).$attrs.visibility).assertEqual("Visibility.Hidden");
        let Center_AddVisibility_011: RectValue = CommonFunc.getComponentRect('Center_AddVisibility_011');
        let Center_AddVisibility_012: RectValue = CommonFunc.getComponentRect('Center_AddVisibility_012');
        let Center_AddVisibility_013: RectValue = CommonFunc.getComponentRect('Center_AddVisibility_013');
        let Center_AddVisibility_01: RectValue = CommonFunc.getComponentRect('Center_AddVisibility_01');
        expect(Math.abs(Center_AddVisibility_012.top - Center_AddVisibility_013.top) <= 1).assertTrue()
        expect(Math.abs(Center_AddVisibility_012.top - Center_AddVisibility_011.top) <= 1).assertTrue()
        expect(Math.abs(Center_AddVisibility_012.top - Center_AddVisibility_01.top) <= 1).assertTrue()
        expect(Math.abs(Center_AddVisibility_011.right - Center_AddVisibility_012.left) <= 1).assertTrue()
        expect(Math.abs(Center_AddVisibility_012.right - Center_AddVisibility_013.left) <= 1).assertTrue()
        expect(Math.abs((Center_AddVisibility_011.left - Center_AddVisibility_01.left) - vp2px(25)) <= 1).assertTrue();
        expect(Math.abs((Center_AddVisibility_01.right - Center_AddVisibility_013.right) - vp2px(25)) <= 1)
          .assertTrue();
        expect(Math.abs((Center_AddVisibility_011.right - Center_AddVisibility_011.left) - vp2px(150)) <= 1)
          .assertTrue();
        expect(Math.abs((Center_AddVisibility_012.right - Center_AddVisibility_012.left) - vp2px(150)) <= 1)
          .assertTrue();
        expect(Math.abs((Center_AddVisibility_013.right - Center_AddVisibility_013.left) - vp2px(150)) <= 1)
          .assertTrue();
        expect(Math.abs((Center_AddVisibility_011.bottom - Center_AddVisibility_011.top) - vp2px(50)) <= 1)
          .assertTrue();
        expect(Math.abs((Center_AddVisibility_012.bottom - Center_AddVisibility_012.top) - vp2px(100)) <= 1)
          .assertTrue();
        expect(Math.abs((Center_AddVisibility_013.bottom - Center_AddVisibility_013.top) - vp2px(150)) <= 1)
          .assertTrue();
      } catch (err) {
        console.error('[testFlexAlignCenterVisibilityHidden] failed');
        expect().assertFail();
      }
      console.info('[testFlexAlignCenterVisibilityHidden] END');

    });
    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_CENTER_TEST_1700
     * @tc.name testFlexAlignCenterVisibilityVisible
     * @tc.desc The subcomponent sets the visibility. Visible, the subcomponent does not occupy a position in the
     * interface display
     */
    it('testFlexAlignCenterVisibilityVisible',  Level.LEVEL0, async () => {
      console.info('[testFlexAlignCenterVisibilityVisible] START');
      try {
        GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'OneVisibility', value: Visibility.Visible
        });
        await CommonFunc.sleep(3000);
        let strJson = getInspectorByKey('Center_AddVisibility_01');

        let strJson2 = getInspectorByKey('Center_AddVisibility_011');

        expect(JSON.parse(strJson).$type).assertEqual('Flex');
        expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
        expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.Center');
        expect(JSON.parse(strJson2).$attrs.visibility).assertEqual("Visibility.Visible");
        let Center_AddVisibility_011: RectValue = CommonFunc.getComponentRect('Center_AddVisibility_011');
        let Center_AddVisibility_012: RectValue = CommonFunc.getComponentRect('Center_AddVisibility_012');
        let Center_AddVisibility_013: RectValue = CommonFunc.getComponentRect('Center_AddVisibility_013');
        let Center_AddVisibility_01: RectValue = CommonFunc.getComponentRect('Center_AddVisibility_01');
        expect(Math.abs(Center_AddVisibility_012.top - Center_AddVisibility_013.top) <= 1).assertTrue()
        expect(Math.abs(Center_AddVisibility_012.top - Center_AddVisibility_011.top) <= 1).assertTrue()
        expect(Math.abs(Center_AddVisibility_012.top - Center_AddVisibility_01.top) <= 1).assertTrue()
        expect(Math.abs(Center_AddVisibility_011.right - Center_AddVisibility_012.left) <= 1).assertTrue()
        expect(Math.abs(Center_AddVisibility_012.right - Center_AddVisibility_013.left) <= 1).assertTrue()
        expect(Math.abs((Center_AddVisibility_011.left - Center_AddVisibility_01.left) - vp2px(25)) <= 1).assertTrue();
        expect(Math.abs((Center_AddVisibility_01.right - Center_AddVisibility_013.right) - vp2px(25)) <= 1)
          .assertTrue();
        expect(Math.abs((Center_AddVisibility_011.right - Center_AddVisibility_011.left) - vp2px(150)) <= 1)
          .assertTrue();
        expect(Math.abs((Center_AddVisibility_012.right - Center_AddVisibility_012.left) - vp2px(150)) <= 1)
          .assertTrue();
        expect(Math.abs((Center_AddVisibility_013.right - Center_AddVisibility_013.left) - vp2px(150)) <= 1)
          .assertTrue();
        expect(Math.abs((Center_AddVisibility_011.bottom - Center_AddVisibility_011.top) - vp2px(50)) <= 1)
          .assertTrue();
        expect(Math.abs((Center_AddVisibility_012.bottom - Center_AddVisibility_012.top) - vp2px(100)) <= 1)
          .assertTrue();
        expect(Math.abs((Center_AddVisibility_013.bottom - Center_AddVisibility_013.top) - vp2px(150)) <= 1)
          .assertTrue();
      } catch (err) {
        console.error('[testFlexAlignCenterVisibilityVisible] failed');
        expect().assertFail();
      }
      console.info('[testFlexAlignCenterVisibilityVisible] END');

    });
  })
}
