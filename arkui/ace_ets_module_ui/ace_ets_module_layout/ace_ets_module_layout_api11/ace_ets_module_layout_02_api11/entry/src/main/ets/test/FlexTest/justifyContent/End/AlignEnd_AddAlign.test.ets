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

export default function AlignEnd_AddAlign() {
  describe('AlignEnd_AddAlign', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/End/AlignEnd_AddAlign'
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlignEnd_AddAlign state success " + JSON.stringify(pages));
        if (!("AlignEnd_AddAlign" == pages.name)) {
          console.info("get AlignEnd_AddAlign state pages.name " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AlignEnd_AddAlign page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlignEnd_AddAlign page error " + JSON.stringify(err));
        expect().assertFail();
      }

    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("AlignEnd_AddAlign after each called")
    });

    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_END_TEST_0800
     * @tc.name testFlexAlignEndAlignBottomEnd
     * @tc.desc Setting generic properties does not take effect, and owned properties take precedence
     */
    it('testFlexAlignEndAlignBottomEnd',  Level.LEVEL0, async () => {
      console.info('[testFlexAlignEndAlignBottomEnd] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'DadAlign', value: Alignment.BottomEnd
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('End_AddAlign_01');

      expect(JSON.parse(strJson).$type).assertEqual('Flex');
      expect(JSON.parse(strJson).$attrs.constructor.direction).assertEqual('FlexDirection.Row');
      expect(JSON.parse(strJson).$attrs.constructor.justifyContent).assertEqual('FlexAlign.End');
      let End_AddAlign_011: RectValue = CommonFunc.getComponentRect('End_AddAlign_011');
      let End_AddAlign_012: RectValue = CommonFunc.getComponentRect('End_AddAlign_012');
      let End_AddAlign_013: RectValue = CommonFunc.getComponentRect('End_AddAlign_013');
      let End_AddAlign_01: RectValue = CommonFunc.getComponentRect('End_AddAlign_01');
      expect(Math.abs((End_AddAlign_011.top) - (End_AddAlign_012.top)) <= 1).assertTrue();
      expect(Math.abs((End_AddAlign_012.top) - (End_AddAlign_013.top)) <= 1).assertTrue();
      expect(Math.abs((End_AddAlign_011.top) - (End_AddAlign_01.top)) <= 1).assertTrue();
      expect(Math.abs((End_AddAlign_012.left) - (End_AddAlign_011.right)) <= 1).assertTrue();
      expect(Math.abs((End_AddAlign_013.left) - (End_AddAlign_012.right)) <= 1).assertTrue();
      expect(Math.abs((End_AddAlign_013.right) - (End_AddAlign_01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(End_AddAlign_011.left - End_AddAlign_01.left)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddAlign_011.right - End_AddAlign_011.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddAlign_012.right - End_AddAlign_012.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddAlign_013.right - End_AddAlign_013.left)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddAlign_011.bottom - End_AddAlign_011.top)) - (Math.round(vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddAlign_012.bottom - End_AddAlign_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(End_AddAlign_013.bottom - End_AddAlign_013.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.info('[testFlexAlignEndAlignBottomEnd] END');

    });
  })
}
