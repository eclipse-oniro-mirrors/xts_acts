/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

export default function AlignStart_AddVisibility() {
  describe('AlignStart_AddVisibility', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/Start/AlignStart_AddVisibility',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignStart_AddVisibility state success " + JSON.stringify(pages));
        if (!("AlignStart_AddVisibility" == pages.name)) {
          console.info("get AlignStart_AddVisibility state pages.name " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignStart_AddVisibility success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignStart_AddVisibility page error " + JSON.stringify(err));
        expect().assertFail();
      }

    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("AlignStart_AddVisibility after each called");
    });
    /**
     * @tc.name   testFlexAlignStartTextVisibilityNone
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_START_TEST_1000
     * @tc.desc   The subcomponent sets the visibility. None, the child components are hidden in the interface display
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlexAlignStartTextVisibilityNone',  Level.LEVEL0, async () => {
      console.info('[testFlexAlignStartTextVisibilityNone] START');
      try {
        GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'OneVisibility', value: Visibility.None
        });
        await CommonFunc.sleep(3000);
        let strJson = getInspectorByKey('Start_AddVisibility_01');

        let strJson2 = getInspectorByKey('Start_AddVisibility_011');

        expect(JSON.parse(strJson).$type).assertEqual('Flex');
        expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
        expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
        expect(JSON.parse(strJson2).$attrs.visibility).assertEqual("Visibility.None");
        let Start_AddVisibility_012: RectValue = CommonFunc.getComponentRect('Start_AddVisibility_012');
        let Start_AddVisibility_013: RectValue = CommonFunc.getComponentRect('Start_AddVisibility_013');
        let Start_AddVisibility_01: RectValue = CommonFunc.getComponentRect('Start_AddVisibility_01');

        console.info('testFlexAlignStartTextVisibilityNone_chazhi1:' + Math.floor(Math.abs(Start_AddVisibility_012.top - Start_AddVisibility_013.top)));
        console.info('testFlexAlignStartTextVisibilityNone_chazhi2:' + Math.floor(Math.abs(Start_AddVisibility_012.top - Start_AddVisibility_01.top)));
        console.info('testFlexAlignStartTextVisibilityNone_chazhi3:' + Math.floor(Math.abs(Start_AddVisibility_012.left - Start_AddVisibility_01.left)));
        console.info('testFlexAlignStartTextVisibilityNone_chazhi4:' + Math.floor(Math.abs(Start_AddVisibility_012.right - Start_AddVisibility_013.left)));
        console.info('testFlexAlignStartTextVisibilityNone_chazhi5:' + Math.floor(Math.abs((Start_AddVisibility_012.right - Start_AddVisibility_012.left) - vp2px(150))));
        console.info('testFlexAlignStartTextVisibilityNone_chazhi6:' + Math.floor(Math.abs((Start_AddVisibility_013.right - Start_AddVisibility_013.left) - vp2px(150))));
        console.info('testFlexAlignStartTextVisibilityNone_chazhi7:' + Math.floor(Math.abs((Start_AddVisibility_012.bottom - Start_AddVisibility_012.top) - vp2px(100))));
        console.info('testFlexAlignStartTextVisibilityNone_chazhi8:' + Math.floor(Math.abs((Start_AddVisibility_013.bottom - Start_AddVisibility_013.top) - vp2px(150))));
        console.info('testFlexAlignStartTextVisibilityNone_chazhi9:' + Math.floor(Math.abs((Start_AddVisibility_01.right - Start_AddVisibility_013.right) - vp2px(200))));

        expect(Math.floor(Math.abs(Start_AddVisibility_012.top - Start_AddVisibility_013.top)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(Start_AddVisibility_012.top - Start_AddVisibility_01.top)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(Start_AddVisibility_012.left - Start_AddVisibility_01.left)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(Start_AddVisibility_012.right - Start_AddVisibility_013.left)) <= 1).assertTrue();
        expect(Math.floor(Math.abs((Start_AddVisibility_012.right - Start_AddVisibility_012.left) - vp2px(150))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((Start_AddVisibility_013.right - Start_AddVisibility_013.left) - vp2px(150))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((Start_AddVisibility_012.bottom - Start_AddVisibility_012.top) - vp2px(100))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((Start_AddVisibility_013.bottom - Start_AddVisibility_013.top) - vp2px(150))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((Start_AddVisibility_01.right - Start_AddVisibility_013.right) - vp2px(200))) <= 1).assertTrue();

      } catch (err) {
        console.error('[testFlexAlignStartTextVisibilityNone] failed');
        expect().assertFail();
      }
      console.info('[testFlexAlignStartTextVisibilityNone] END');

    });
    /**
     * @tc.name   testFlexAlignStartTextVisibilityHidden
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_START_TEST_1100
     * @tc.desc   When the subcomponent sets visibility.hidden, the interface of the subcomponent does not occupy the
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlexAlignStartTextVisibilityHidden',  Level.LEVEL0, async () => {
      console.info('[testFlexAlignStartTextVisibilityHidden] START');
      try {
        GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'OneVisibility', value: Visibility.Hidden
        });
        await CommonFunc.sleep(3000);
        let strJson = getInspectorByKey('Start_AddVisibility_01');

        let strJson2 = getInspectorByKey('Start_AddVisibility_011');

        expect(JSON.parse(strJson).$type).assertEqual('Flex');
        expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
        expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
        expect(JSON.parse(strJson2).$attrs.visibility).assertEqual("Visibility.Hidden");
        let Start_AddVisibility_011: RectValue = CommonFunc.getComponentRect('Start_AddVisibility_011');
        let Start_AddVisibility_012: RectValue = CommonFunc.getComponentRect('Start_AddVisibility_012');
        let Start_AddVisibility_013: RectValue = CommonFunc.getComponentRect('Start_AddVisibility_013');
        let Start_AddVisibility_01: RectValue = CommonFunc.getComponentRect('Start_AddVisibility_01');

        console.info('testFlexAlignStartTextVisibilityHidden_chazhi1:' + Math.floor(Math.abs(Start_AddVisibility_012.top - Start_AddVisibility_011.top)));
        console.info('testFlexAlignStartTextVisibilityHidden_chazhi1:' + Math.floor(Math.abs(Start_AddVisibility_012.top - Start_AddVisibility_013.top)));
        console.info('testFlexAlignStartTextVisibilityHidden_chazhi1:' + Math.floor(Math.abs(Start_AddVisibility_012.top - Start_AddVisibility_01.top)));
        console.info('testFlexAlignStartTextVisibilityHidden_chazhi1:' + Math.floor(Math.abs(Start_AddVisibility_012.left - Start_AddVisibility_011.right)));
        console.info('testFlexAlignStartTextVisibilityHidden_chazhi1:' + Math.floor(Math.abs(Start_AddVisibility_013.left - Start_AddVisibility_012.right)));
        console.info('testFlexAlignStartTextVisibilityHidden_chazhi1:' + Math.floor(Math.abs(Start_AddVisibility_01.left - Start_AddVisibility_011.left)));
        console.info('testFlexAlignStartTextVisibilityHidden_chazhi1:' + Math.floor(Math.abs((Start_AddVisibility_011.right - Start_AddVisibility_011.left) - vp2px(150))));
        console.info('testFlexAlignStartTextVisibilityHidden_chazhi1:' + Math.floor(Math.abs((Start_AddVisibility_012.right - Start_AddVisibility_012.left) - vp2px(150))));
        console.info('testFlexAlignStartTextVisibilityHidden_chazhi1:' + Math.floor(Math.abs((Start_AddVisibility_013.right - Start_AddVisibility_013.left) - vp2px(150))));
        console.info('testFlexAlignStartTextVisibilityHidden_chazhi1:' + Math.floor(Math.abs((Start_AddVisibility_011.bottom - Start_AddVisibility_011.top) - vp2px(50))));
        console.info('testFlexAlignStartTextVisibilityHidden_chazhi1:' + Math.floor(Math.abs((Start_AddVisibility_012.bottom - Start_AddVisibility_012.top) - vp2px(100))));
        console.info('testFlexAlignStartTextVisibilityHidden_chazhi1:' + Math.floor(Math.abs((Start_AddVisibility_013.bottom - Start_AddVisibility_013.top) - vp2px(150))));
        console.info('testFlexAlignStartTextVisibilityHidden_chazhi1:' + Math.floor(Math.abs((Start_AddVisibility_012.left - Start_AddVisibility_01.left) - vp2px(150))));

        expect(Math.floor(Math.abs(Start_AddVisibility_012.top - Start_AddVisibility_011.top)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(Start_AddVisibility_012.top - Start_AddVisibility_013.top)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(Start_AddVisibility_012.top - Start_AddVisibility_01.top)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(Start_AddVisibility_012.left - Start_AddVisibility_011.right)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(Start_AddVisibility_013.left - Start_AddVisibility_012.right)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(Start_AddVisibility_01.left - Start_AddVisibility_011.left)) <= 1).assertTrue();
        expect(Math.floor(Math.abs((Start_AddVisibility_011.right - Start_AddVisibility_011.left) - vp2px(150))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((Start_AddVisibility_012.right - Start_AddVisibility_012.left) - vp2px(150))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((Start_AddVisibility_013.right - Start_AddVisibility_013.left) - vp2px(150))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((Start_AddVisibility_011.bottom - Start_AddVisibility_011.top) - vp2px(50))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((Start_AddVisibility_012.bottom - Start_AddVisibility_012.top) - vp2px(100))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((Start_AddVisibility_013.bottom - Start_AddVisibility_013.top) - vp2px(150))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((Start_AddVisibility_012.left - Start_AddVisibility_01.left) - vp2px(150))) <= 1).assertTrue();

      } catch (err) {
        console.error('[testFlexAlignStartTextVisibilityHidden] failed');
        expect().assertFail();
      }
      console.info('[testFlexAlignStartTextVisibilityHidden] END');

    });
    /**
     * @tc.name   testFlexAlignStartTextVisibilityVisible
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_START_TEST_1700
     * @tc.desc   The subcomponent sets the visibility. Visible, the subcomponent does not occupy a position in the
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFlexAlignStartTextVisibilityVisible',  Level.LEVEL0, async () => {
      console.info('[testFlexAlignStartTextVisibilityVisible] START');
      try {
        GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'OneVisibility', value: Visibility.Visible
        });
        await CommonFunc.sleep(3000);
        let strJson = getInspectorByKey('Start_AddVisibility_01');

        let strJson2 = getInspectorByKey('Start_AddVisibility_011');

        expect(JSON.parse(strJson).$type).assertEqual('Flex');
        expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
        expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.Start');
        expect(JSON.parse(strJson2).$attrs.visibility).assertEqual("Visibility.Visible");
        let Start_AddVisibility_011: RectValue = CommonFunc.getComponentRect('Start_AddVisibility_011');
        let Start_AddVisibility_012: RectValue = CommonFunc.getComponentRect('Start_AddVisibility_012');
        let Start_AddVisibility_013: RectValue = CommonFunc.getComponentRect('Start_AddVisibility_013');
        let Start_AddVisibility_01: RectValue = CommonFunc.getComponentRect('Start_AddVisibility_01');

        console.info('testFlexAlignStartTextVisibilityVisible_chazhi1:' + Math.floor(Math.abs(Start_AddVisibility_012.top - Start_AddVisibility_011.top)));
        console.info('testFlexAlignStartTextVisibilityVisible_chazhi2:' + Math.floor(Math.abs(Start_AddVisibility_012.top - Start_AddVisibility_013.top)));
        console.info('testFlexAlignStartTextVisibilityVisible_chazhi3:' + Math.floor(Math.abs(Start_AddVisibility_012.top - Start_AddVisibility_01.top)));
        console.info('testFlexAlignStartTextVisibilityVisible_chazhi4:' + Math.floor(Math.abs(Start_AddVisibility_012.left - Start_AddVisibility_011.right)));
        console.info('testFlexAlignStartTextVisibilityVisible_chazhi5:' + Math.floor(Math.abs(Start_AddVisibility_013.left - Start_AddVisibility_012.right)));
        console.info('testFlexAlignStartTextVisibilityVisible_chazhi6:' + Math.floor(Math.abs(Start_AddVisibility_01.left - Start_AddVisibility_011.left)));
        console.info('testFlexAlignStartTextVisibilityVisible_chazhi7:' + Math.floor(Math.abs((Start_AddVisibility_011.right - Start_AddVisibility_011.left) - vp2px(150))));
        console.info('testFlexAlignStartTextVisibilityVisible_chazhi8:' + Math.floor(Math.abs((Start_AddVisibility_012.right - Start_AddVisibility_012.left) - vp2px(150))));
        console.info('testFlexAlignStartTextVisibilityVisible_chazhi9:' + Math.floor(Math.abs((Start_AddVisibility_013.right - Start_AddVisibility_013.left) - vp2px(150))));
        console.info('testFlexAlignStartTextVisibilityVisible_chazhi10:' + Math.floor(Math.abs((Start_AddVisibility_011.bottom - Start_AddVisibility_011.top) - vp2px(50))));
        console.info('testFlexAlignStartTextVisibilityVisible_chazhi11:' + Math.floor(Math.abs((Start_AddVisibility_012.bottom - Start_AddVisibility_012.top) - vp2px(100))));
        console.info('testFlexAlignStartTextVisibilityVisible_chazhi12:' + Math.floor(Math.abs((Start_AddVisibility_013.bottom - Start_AddVisibility_013.top) - vp2px(150))));
        console.info('testFlexAlignStartTextVisibilityVisible_chazhi13:' + Math.floor(Math.abs((Start_AddVisibility_012.left - Start_AddVisibility_01.left) - vp2px(150))));

        expect(Math.floor(Math.abs(Start_AddVisibility_012.top - Start_AddVisibility_011.top)) <= 1).assertTrue()
        expect(Math.floor(Math.abs(Start_AddVisibility_012.top - Start_AddVisibility_013.top)) <= 1).assertTrue()
        expect(Math.floor(Math.abs(Start_AddVisibility_012.top - Start_AddVisibility_01.top)) <= 1).assertTrue()
        expect(Math.floor(Math.abs(Start_AddVisibility_012.left - Start_AddVisibility_011.right)) <= 1).assertTrue()
        expect(Math.floor(Math.abs(Start_AddVisibility_013.left - Start_AddVisibility_012.right)) <= 1).assertTrue()
        expect(Math.floor(Math.abs(Start_AddVisibility_01.left - Start_AddVisibility_011.left)) <= 1).assertTrue()
        expect(Math.floor(Math.abs((Start_AddVisibility_011.right - Start_AddVisibility_011.left) - vp2px(150))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((Start_AddVisibility_012.right - Start_AddVisibility_012.left) - vp2px(150))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((Start_AddVisibility_013.right - Start_AddVisibility_013.left) - vp2px(150))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((Start_AddVisibility_011.bottom - Start_AddVisibility_011.top) - vp2px(50))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((Start_AddVisibility_012.bottom - Start_AddVisibility_012.top) - vp2px(100))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((Start_AddVisibility_013.bottom - Start_AddVisibility_013.top) - vp2px(150))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((Start_AddVisibility_012.left - Start_AddVisibility_01.left) - vp2px(150))) <= 1).assertTrue();

      } catch (err) {
        console.error('[testFlexAlignStartTextVisibilityVisible] failed');
        expect().assertFail();
      }
      console.info('[testFlexAlignStartTextVisibilityVisible] END');

    });
  })
}
