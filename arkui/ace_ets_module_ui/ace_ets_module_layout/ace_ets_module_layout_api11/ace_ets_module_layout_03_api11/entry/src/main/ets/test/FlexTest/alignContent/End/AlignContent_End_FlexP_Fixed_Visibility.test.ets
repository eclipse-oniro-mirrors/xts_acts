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
import CommonFunc, { RectValue } from '../../../../MainAbility/common/Common';
import GlobalContext from '../../../../MainAbility/common/GlobalContext';

export default function AlignContent_End_FlexP_Fixed_Visibility() {

  describe('AlignContent_End_FlexP_Fixed_Visibility', () => {
    beforeEach(async () => {
      console.info("AlignContent_End_FlexP_Fixed_Visibility beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/alignContent/End/AlignContent_End_FlexP_Fixed_Visibility',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get AlignContent_End_FlexP_Fixed_Visibility state success " + JSON.stringify(pages));
        if (!("AlignContent_End_FlexP_Fixed_Visibility" == pages.name)) {
          console.info("get AlignContent_End_FlexP_Fixed_Visibility state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push AlignContent_End_FlexP_Fixed_Visibility page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignContent_End_FlexP_Fixed_Visibility page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000)
      console.info("AlignContent_End_FlexP_Fixed_Visibility beforeEach end");

    });

    afterEach(async () => {
      await CommonFunc.sleep(2000)
      console.info("AlignContent_End_FlexP_Fixed_Visibility after each called");
    });


    /**
     * @tc.name   testAlignContentEndFlexfixedVisibilityHidden
     * @tc.number testAlignContentEndFlexfixedVisibilityHidden
     * @tc.desc   testAlignContentEndFlexfixedVisibilityHidden
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAlignContentEndFlexfixedVisibilityHidden',  Level.LEVEL0, async () => {
      console.info('testAlignContentEndFlexfixedVisibilityHidden START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'visibility', value: Visibility.Hidden
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('AlignContent_End_FlexP_Fixed_Visibility_flex001');

      let strJsonText1 = getInspectorByKey('AlignContent_End_FlexP_Fixed_Visibility_1');
      console.info('flex [getInspectorByKey] is:' + JSON.stringify(JSON.parse(strJson)));
      console.info('flex obj.$attrs.constructor is:' + JSON.stringify(JSON.parse(strJson).$attrs.constructor));
      let AlignContentFlexEnd_flex001: RectValue = CommonFunc.getComponentRect('AlignContent_End_FlexP_Fixed_Visibility_flex001');
      let AlignContentFlexEnd_2: RectValue = CommonFunc.getComponentRect('AlignContent_End_FlexP_Fixed_Visibility_2');
      let AlignContentFlexEnd_3: RectValue = CommonFunc.getComponentRect('AlignContent_End_FlexP_Fixed_Visibility_3');
      let AlignContentFlexEnd_4: RectValue = CommonFunc.getComponentRect('AlignContent_End_FlexP_Fixed_Visibility_4');

      console.log('AlignContent_End_FlexP_Fixed_Visibility_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_flex001));
      console.log('AlignContentFlexEnd_2 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_2));
      console.log('AlignContentFlexEnd_3 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_3));
      console.log('AlignContentFlexEnd_4 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_4));

      console.info('testAlignContentEndFlexfixedVisibilityHidden_chazhi1:'+ Math.floor(Math.abs(AlignContentFlexEnd_2.bottom - AlignContentFlexEnd_2.top - vp2px(100))))
      expect(Math.floor(Math.abs(AlignContentFlexEnd_2.bottom - AlignContentFlexEnd_2.top - vp2px(100))) <= 1)
        .assertTrue();
      console.info('testAlignContentEndFlexfixedVisibilityHidden_chazhi2:'+ Math.floor(Math.abs(AlignContentFlexEnd_3.bottom - AlignContentFlexEnd_3.top - vp2px(150))))
      expect(Math.floor(Math.abs(AlignContentFlexEnd_3.bottom - AlignContentFlexEnd_3.top - vp2px(150))) <= 1)
        .assertTrue();
      console.info('testAlignContentEndFlexfixedVisibilityHidden_chazhi3:'+ Math.floor(Math.abs(AlignContentFlexEnd_4.bottom - AlignContentFlexEnd_4.top - vp2px(200))))
      expect(Math.floor(Math.abs(AlignContentFlexEnd_4.bottom - AlignContentFlexEnd_4.top - vp2px(200))) <= 1)
        .assertTrue();
      console.info('testAlignContentEndFlexfixedVisibilityHidden_chazhi4:'+ Math.floor(Math.abs(AlignContentFlexEnd_2.right - AlignContentFlexEnd_2.left - vp2px(150))))
      expect(Math.floor(Math.abs(AlignContentFlexEnd_2.right - AlignContentFlexEnd_2.left - vp2px(150))) <= 1)
        .assertTrue();
      console.info('testAlignContentEndFlexfixedVisibilityHidden_chazhi5:'+ Math.floor(Math.abs(AlignContentFlexEnd_3.right - AlignContentFlexEnd_3.left - vp2px(150))))
      expect(Math.floor(Math.abs(AlignContentFlexEnd_3.right - AlignContentFlexEnd_3.left - vp2px(150))) <= 1)
        .assertTrue();
      console.info('testAlignContentEndFlexfixedVisibilityHidden_chazhi6:'+ Math.floor(Math.abs(AlignContentFlexEnd_4.right - AlignContentFlexEnd_4.left - vp2px(150))))
      expect(Math.floor(Math.abs(AlignContentFlexEnd_4.right - AlignContentFlexEnd_4.left - vp2px(150))) <= 1)
        .assertTrue();

      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(JSON.parse(strJson).$attrs.constructor.alignContent).assertEqual("FlexAlign.End");
      expect(JSON.parse(strJsonText1).$attrs.visibility).assertEqual("Visibility.Hidden");

      console.info('testAlignContentEndFlexfixedVisibilityHidden_chazhi7:'+ Math.floor(Math.abs(AlignContentFlexEnd_flex001.bottom - AlignContentFlexEnd_4.bottom)))
      expect(Math.floor(Math.abs(AlignContentFlexEnd_flex001.bottom - AlignContentFlexEnd_4.bottom)) <= 1)
        .assertTrue();
      console.info('testAlignContentEndFlexfixedVisibilityHidden_chazhi8:'+ Math.floor(Math.abs(AlignContentFlexEnd_3.top - AlignContentFlexEnd_flex001.top - vp2px(50))))
      expect(Math.floor(Math.abs(AlignContentFlexEnd_3.top - AlignContentFlexEnd_flex001.top - vp2px(50))) <= 1)
        .assertTrue();
      console.info('testAlignContentEndFlexfixedVisibilityHidden_chazhi9:'+ Math.floor(Math.abs(AlignContentFlexEnd_4.top - AlignContentFlexEnd_3.bottom)))
      expect(Math.floor(Math.abs(AlignContentFlexEnd_4.top - AlignContentFlexEnd_3.bottom)) <= 1)
        .assertTrue();
      console.info('testAlignContentEndFlexfixedVisibilityHidden_chazhi10:'+ Math.floor(Math.abs(AlignContentFlexEnd_2.left - AlignContentFlexEnd_flex001.left - vp2px(150))))
      expect(Math.floor(Math.abs(AlignContentFlexEnd_2.left - AlignContentFlexEnd_flex001.left - vp2px(150))) <= 1)
        .assertTrue();
      console.info('testAlignContentEndFlexfixedVisibilityHidden_chazhi11:'+ Math.floor(Math.abs(AlignContentFlexEnd_flex001.bottom - AlignContentFlexEnd_4.top - vp2px(200))))
      expect(Math.floor(Math.abs(AlignContentFlexEnd_flex001.bottom - AlignContentFlexEnd_4.top - vp2px(200))) <= 1)
        .assertTrue();

      console.info('testAlignContentEndFlexfixedVisibilityHidden END');
    });

    /**
     * @tc.name   testAlignContentEndFlexfixedVisibilityNone
     * @tc.number testAlignContentEndFlexfixedVisibilityNone
     * @tc.desc   testAlignContentEndFlexfixedVisibilityNone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAlignContentEndFlexfixedVisibilityNone',  Level.LEVEL0, async () => {
      console.info('testAlignContentEndFlexfixedVisibilityNone START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'visibility', value: Visibility.None
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('AlignContent_End_FlexP_Fixed_Visibility_flex001');

      let strJsonText1 = getInspectorByKey('AlignContent_End_FlexP_Fixed_Visibility_1');
      let AlignContentFlexEnd_flex002: RectValue = CommonFunc.getComponentRect('AlignContent_End_FlexP_Fixed_Visibility_flex001');
      let AlignContentFlexEnd_1: RectValue = CommonFunc.getComponentRect('AlignContent_End_FlexP_Fixed_Visibility_1');
      let AlignContentFlexEnd_2: RectValue = CommonFunc.getComponentRect('AlignContent_End_FlexP_Fixed_Visibility_2');
      let AlignContentFlexEnd_3: RectValue = CommonFunc.getComponentRect('AlignContent_End_FlexP_Fixed_Visibility_3');
      let AlignContentFlexEnd_4: RectValue = CommonFunc.getComponentRect('AlignContent_End_FlexP_Fixed_Visibility_4');

      console.log('AlignContent_End_FlexP_Fixed_Visibility_flex001 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_flex002))
      console.log('AlignContentFlexEnd_1 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_1));
      console.log('AlignContentFlexEnd_2 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_2));
      console.log('AlignContentFlexEnd_3 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_3));
      console.log('AlignContentFlexEnd_4 rect_value is:' +
      JSON.stringify(AlignContentFlexEnd_4));

      console.info('testAlignContentEndFlexfixedVisibilityNone_chazhi1:'+ Math.floor(Math.abs(AlignContentFlexEnd_2.bottom - AlignContentFlexEnd_2.top - vp2px(100))))
      expect(Math.floor(Math.abs(AlignContentFlexEnd_2.bottom - AlignContentFlexEnd_2.top - vp2px(100))) <= 1)
        .assertTrue();
      console.info('testAlignContentEndFlexfixedVisibilityNone_chazhi2:'+ Math.floor(Math.abs(AlignContentFlexEnd_3.bottom - AlignContentFlexEnd_3.top - vp2px(150))))
      expect(Math.floor(Math.abs(AlignContentFlexEnd_3.bottom - AlignContentFlexEnd_3.top - vp2px(150))) <= 1)
        .assertTrue();
      console.info('testAlignContentEndFlexfixedVisibilityNone_chazhi3:'+ Math.floor(Math.abs(AlignContentFlexEnd_4.bottom - AlignContentFlexEnd_4.top - vp2px(200))))
      expect(Math.floor(Math.abs(AlignContentFlexEnd_4.bottom - AlignContentFlexEnd_4.top - vp2px(200))) <= 1)
        .assertTrue();
      console.info('testAlignContentEndFlexfixedVisibilityNone_chazhi4:'+ Math.floor(Math.abs(AlignContentFlexEnd_2.right - AlignContentFlexEnd_2.left - vp2px(150))))
      expect(Math.floor(Math.abs(AlignContentFlexEnd_2.right - AlignContentFlexEnd_2.left - vp2px(150))) <= 1)
        .assertTrue();
      console.info('testAlignContentEndFlexfixedVisibilityNone_chazhi5:'+ Math.floor(Math.abs(AlignContentFlexEnd_3.right - AlignContentFlexEnd_3.left - vp2px(150))))
      expect(Math.floor(Math.abs(AlignContentFlexEnd_3.right - AlignContentFlexEnd_3.left - vp2px(150))) <= 1)
        .assertTrue();
      console.info('testAlignContentEndFlexfixedVisibilityNone_chazhi6:'+ Math.floor(Math.abs(AlignContentFlexEnd_4.right - AlignContentFlexEnd_4.left - vp2px(150))))
      expect(Math.floor(Math.abs(AlignContentFlexEnd_4.right - AlignContentFlexEnd_4.left - vp2px(150))) <= 1)
        .assertTrue();
      
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual("FlexDirection.Row");
      expect(JSON.parse(strJson).$attrs.constructor.alignContent).assertEqual("FlexAlign.End");
      expect(JSON.parse(strJsonText1).$attrs.visibility).assertEqual("Visibility.None");

      console.info('testAlignContentEndFlexfixedVisibilityNone_chazhi7:'+ Math.floor(Math.abs(AlignContentFlexEnd_flex002.bottom - AlignContentFlexEnd_4.bottom)))
      expect(Math.floor(Math.abs(AlignContentFlexEnd_flex002.bottom - AlignContentFlexEnd_4.bottom)) <= 1).assertTrue();
      console.info('testAlignContentEndFlexfixedVisibilityNone_chazhi8:'+ Math.floor(Math.abs(AlignContentFlexEnd_2.top - AlignContentFlexEnd_3.top)))
      expect(Math.floor(Math.abs(AlignContentFlexEnd_2.top - AlignContentFlexEnd_3.top)) <= 1).assertTrue();
      console.info('testAlignContentEndFlexfixedVisibilityNone_chazhi9:'+ Math.floor(Math.abs(AlignContentFlexEnd_4.top - AlignContentFlexEnd_3.top)))
      expect(Math.floor(Math.abs(AlignContentFlexEnd_4.top - AlignContentFlexEnd_3.top)) <= 1).assertTrue();
      console.info('testAlignContentEndFlexfixedVisibilityNone_chazhi10:'+ Math.floor(Math.abs(AlignContentFlexEnd_2.left - AlignContentFlexEnd_flex002.left)))
      expect(Math.floor(Math.abs(AlignContentFlexEnd_2.left - AlignContentFlexEnd_flex002.left)) <= 1).assertTrue();

      console.info('testAlignContentEndFlexfixedVisibilityNone END');
    });

  })
}