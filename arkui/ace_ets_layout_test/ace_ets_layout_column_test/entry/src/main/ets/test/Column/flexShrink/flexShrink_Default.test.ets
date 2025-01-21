/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import RectValue from '../../../MainAbility/common/Rect';
import CommonFunc from '../../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';

export default function flexShrink_Default() {
  describe('flexShrink_Default', () => {
    beforeEach(async () => {
      console.info("flexShrink_Default beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Column/flexShrink/flexShrink_Default",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get flexShrink_Default state pages:" + JSON.stringify(pages));
        if (!("flexShrink_Default" == pages.name)) {
          console.info("get flexShrink_Default pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push flexShrink_Default page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push flexShrink_Default page error " + JSON.stringify(err));
        expect().assertFail();
      }
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("flexShrink_Default after each called")
    });

    /**
     * @tc.number SUB_ACE_flexShrink_Default_TEST_0100
     * @tc.name testflexShrink
     * @tc.desc column1、column2、column3 set flexShrink(null)
     */
    it('SUB_ACE_flexShrink_Default_TEST_0100', 0, async () => {
      console.info('[SUB_ACE_flexShrink_Default_TEST_0100] START');
      globalThis.value.message.notify({
        name: 'addflexShrink', value: null
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexShrink_011: RectValue = CommonFunc.getComponentRect('Column_flexShrink_011');
      let Column_flexShrink_012: RectValue = CommonFunc.getComponentRect('Column_flexShrink_012');
      let Column_flexShrink_013: RectValue = CommonFunc.getComponentRect('Column_flexShrink_013');
      let Column_flexShrink_01: RectValue = CommonFunc.getComponentRect('Column_flexShrink_01');
      console.log('assert position')
      expect(Math.round(Column_flexShrink_011.left - Column_flexShrink_01.left))
        .assertEqual(Math.round(Column_flexShrink_01.right - Column_flexShrink_011.right));
      expect(Math.round(Column_flexShrink_012.left - Column_flexShrink_01.left))
        .assertEqual(Math.round(Column_flexShrink_01.right - Column_flexShrink_012.right));
      expect(Math.round(Column_flexShrink_013.left - Column_flexShrink_01.left))
        .assertEqual(Math.round(Column_flexShrink_01.right - Column_flexShrink_013.right));
      expect(Math.round(Column_flexShrink_012.top - Column_flexShrink_011.bottom))
        .assertEqual(Math.round(Column_flexShrink_013.top - Column_flexShrink_012.bottom))
      console.log('assert space')
      expect(Math.round(Column_flexShrink_012.top - Column_flexShrink_011.bottom)).assertEqual(Math.round(vp2px(10)));
      expect(Math.round(Column_flexShrink_013.top - Column_flexShrink_012.bottom)).assertEqual(Math.round(vp2px(10)));
      console.log('Column_flexShrink_012.top - Column_flexShrink_011.bottom', +(Column_flexShrink_012.top - Column_flexShrink_011.bottom))
      console.log('Column_flexShrink_013.top - Column_flexShrink_012.bottom', +(Column_flexShrink_013.top - Column_flexShrink_012.bottom))
      expect(Column_flexShrink_01.top).assertEqual(Column_flexShrink_011.top);
      expect(Column_flexShrink_013.bottom).assertLess(Column_flexShrink_01.bottom);
      console.log('assert height')
      expect(Math.round(Column_flexShrink_011.bottom - Column_flexShrink_011.top)).assertEqual(Math.round(vp2px(200)));
      console.log('Column_flexShrink_011.bottom - Column_flexShrink_011.top', +(Column_flexShrink_011.bottom - Column_flexShrink_011.top))
      expect(Math.round(Column_flexShrink_012.bottom - Column_flexShrink_012.top)).assertEqual(Math.round(vp2px(100)));
      console.log('Column_flexShrink_012.bottom - Column_flexShrink_012.top', +(Column_flexShrink_012.bottom - Column_flexShrink_012.top))
      expect(Math.round(Column_flexShrink_013.bottom - Column_flexShrink_013.top)).assertEqual(Math.round(vp2px(100)));
      console.log('Column_flexShrink_013.bottom - Column_flexShrink_013.top', +(Column_flexShrink_013.bottom - Column_flexShrink_013.top))
      console.log('assert weight')
      expect(Math.round(Column_flexShrink_011.right - Column_flexShrink_011.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(Column_flexShrink_012.right - Column_flexShrink_012.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(Column_flexShrink_013.right - Column_flexShrink_013.left)).assertEqual(Math.round(vp2px(300)));
      console.info('[SUB_ACE_flexShrink_Default_TEST_0100] END');
    });
    /**
     * @tc.number SUB_ACE_flexShrink_Default_TEST_0200
     * @tc.name testflexShrink
     * @tc.desc column1、column2、column3 set flexShrink(undefined)
     */
    it('SUB_ACE_flexShrink_Default_TEST_0200', 0, async () => {
      console.info('[SUB_ACE_flexShrink_Default_TEST_0200] START');
      globalThis.value.message.notify({
        name: 'addflexShrink', value: undefined
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexShrink_011: RectValue = CommonFunc.getComponentRect('Column_flexShrink_011');
      let Column_flexShrink_012: RectValue = CommonFunc.getComponentRect('Column_flexShrink_012');
      let Column_flexShrink_013: RectValue = CommonFunc.getComponentRect('Column_flexShrink_013');
      let Column_flexShrink_01: RectValue = CommonFunc.getComponentRect('Column_flexShrink_01');
      console.log('assert position')
      expect(Math.round(Column_flexShrink_011.left - Column_flexShrink_01.left))
        .assertEqual(Math.round(Column_flexShrink_01.right - Column_flexShrink_011.right));
      expect(Math.round(Column_flexShrink_012.left - Column_flexShrink_01.left))
        .assertEqual(Math.round(Column_flexShrink_01.right - Column_flexShrink_012.right));
      expect(Math.round(Column_flexShrink_013.left - Column_flexShrink_01.left))
        .assertEqual(Math.round(Column_flexShrink_01.right - Column_flexShrink_013.right));
      expect(Math.round(Column_flexShrink_012.top - Column_flexShrink_011.bottom))
        .assertEqual(Math.round(Column_flexShrink_013.top - Column_flexShrink_012.bottom))
      console.log('assert space')
      expect(Math.round(Column_flexShrink_012.top - Column_flexShrink_011.bottom)).assertEqual(Math.round(vp2px(10)));
      expect(Math.round(Column_flexShrink_013.top - Column_flexShrink_012.bottom)).assertEqual(Math.round(vp2px(10)));
      console.log('Column_flexShrink_012.top - Column_flexShrink_011.bottom', +(Column_flexShrink_012.top - Column_flexShrink_011.bottom))
      console.log('Column_flexShrink_013.top - Column_flexShrink_012.bottom', +(Column_flexShrink_013.top - Column_flexShrink_012.bottom))
      expect(Column_flexShrink_01.top).assertEqual(Column_flexShrink_011.top);
      expect(Column_flexShrink_013.bottom).assertLess(Column_flexShrink_01.bottom);
      console.log('assert height')
      expect(Math.round(Column_flexShrink_011.bottom - Column_flexShrink_011.top)).assertEqual(Math.round(vp2px(200)));
      console.log('Column_flexShrink_011.bottom - Column_flexShrink_011.top', +(Column_flexShrink_011.bottom - Column_flexShrink_011.top))
      expect(Math.round(Column_flexShrink_012.bottom - Column_flexShrink_012.top)).assertEqual(Math.round(vp2px(100)));
      console.log('Column_flexShrink_012.bottom - Column_flexShrink_012.top', +(Column_flexShrink_012.bottom - Column_flexShrink_012.top))
      expect(Math.round(Column_flexShrink_013.bottom - Column_flexShrink_013.top)).assertEqual(Math.round(vp2px(100)));
      console.log('Column_flexShrink_013.bottom - Column_flexShrink_013.top', +(Column_flexShrink_013.bottom - Column_flexShrink_013.top))
      console.log('assert weight')
      expect(Math.round(Column_flexShrink_011.right - Column_flexShrink_011.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(Column_flexShrink_012.right - Column_flexShrink_012.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(Column_flexShrink_013.right - Column_flexShrink_013.left)).assertEqual(Math.round(vp2px(300)));
      console.info('[SUB_ACE_flexShrink_Default_TEST_0200] END');
    });
    /**
     * @tc.number SUB_ACE_flexShrink_Default_TEST_0300
     * @tc.name testflexShrink
     * @tc.desc column1、column2、column3 set flexShrink(undefined)
     */
    it('SUB_ACE_flexShrink_Default_TEST_0300', 0, async () => {
      console.info('[SUB_ACE_flexShrink_Default_TEST_0300] START');
      globalThis.value.message.notify({
        name: 'addflexShrink', value: -5
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexShrink_011: RectValue = CommonFunc.getComponentRect('Column_flexShrink_011');
      let Column_flexShrink_012: RectValue = CommonFunc.getComponentRect('Column_flexShrink_012');
      let Column_flexShrink_013: RectValue = CommonFunc.getComponentRect('Column_flexShrink_013');
      let Column_flexShrink_01: RectValue = CommonFunc.getComponentRect('Column_flexShrink_01');
      console.log('assert position')
      expect(Math.round(Column_flexShrink_011.left - Column_flexShrink_01.left))
        .assertEqual(Math.round(Column_flexShrink_01.right - Column_flexShrink_011.right));
      expect(Math.round(Column_flexShrink_012.left - Column_flexShrink_01.left))
        .assertEqual(Math.round(Column_flexShrink_01.right - Column_flexShrink_012.right));
      expect(Math.round(Column_flexShrink_013.left - Column_flexShrink_01.left))
        .assertEqual(Math.round(Column_flexShrink_01.right - Column_flexShrink_013.right));
      expect(Math.round(Column_flexShrink_012.top - Column_flexShrink_011.bottom))
        .assertEqual(Math.round(Column_flexShrink_013.top - Column_flexShrink_012.bottom))
      console.log('assert space')
      expect(Math.round(Column_flexShrink_012.top - Column_flexShrink_011.bottom)).assertEqual(Math.round(vp2px(10)));
      expect(Math.round(Column_flexShrink_013.top - Column_flexShrink_012.bottom)).assertEqual(Math.round(vp2px(10)));
      console.log('Column_flexShrink_012.top - Column_flexShrink_011.bottom', +(Column_flexShrink_012.top - Column_flexShrink_011.bottom))
      console.log('Column_flexShrink_013.top - Column_flexShrink_012.bottom', +(Column_flexShrink_013.top - Column_flexShrink_012.bottom))
      expect(Column_flexShrink_01.top).assertEqual(Column_flexShrink_011.top);
      expect(Column_flexShrink_013.bottom).assertLess(Column_flexShrink_01.bottom);
      console.log('assert height')
      expect(Math.round(Column_flexShrink_011.bottom - Column_flexShrink_011.top)).assertEqual(Math.round(vp2px(200)));
      console.log('Column_flexShrink_011.bottom - Column_flexShrink_011.top', +(Column_flexShrink_011.bottom - Column_flexShrink_011.top))
      expect(Math.round(Column_flexShrink_012.bottom - Column_flexShrink_012.top)).assertEqual(Math.round(vp2px(100)));
      console.log('Column_flexShrink_012.bottom - Column_flexShrink_012.top', +(Column_flexShrink_012.bottom - Column_flexShrink_012.top))
      expect(Math.round(Column_flexShrink_013.bottom - Column_flexShrink_013.top)).assertEqual(Math.round(vp2px(100)));
      console.log('Column_flexShrink_013.bottom - Column_flexShrink_013.top', +(Column_flexShrink_013.bottom - Column_flexShrink_013.top))
      console.log('assert weight')
      expect(Math.round(Column_flexShrink_011.right - Column_flexShrink_011.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(Column_flexShrink_012.right - Column_flexShrink_012.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(Column_flexShrink_013.right - Column_flexShrink_013.left)).assertEqual(Math.round(vp2px(300)));
      console.info('[SUB_ACE_flexShrink_Default_TEST_0300] END');
    });
    /**
     * @tc.number SUB_ACE_flexShrink_Default_TEST_0400
     * @tc.name testflexShrink
     * @tc.desc column1、column2 and column3 do not set flexShrink
     */
    it('SUB_ACE_flexShrink_Default_TEST_0400', 0, async () => {
      console.info('[SUB_ACE_flexShrink_Default_TEST_0400] START');
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexShrink_021: RectValue = CommonFunc.getComponentRect('Column_flexShrink_021');
      let Column_flexShrink_022: RectValue = CommonFunc.getComponentRect('Column_flexShrink_022');
      let Column_flexShrink_023: RectValue = CommonFunc.getComponentRect('Column_flexShrink_023');
      let Column_flexShrink_02: RectValue = CommonFunc.getComponentRect('Column_flexShrink_02');
      console.log('assert position')
      expect(Math.round(Column_flexShrink_021.left - Column_flexShrink_02.left))
        .assertEqual(Math.round(Column_flexShrink_02.right - Column_flexShrink_021.right));
      expect(Math.round(Column_flexShrink_022.left - Column_flexShrink_02.left))
        .assertEqual(Math.round(Column_flexShrink_02.right - Column_flexShrink_022.right));
      expect(Math.round(Column_flexShrink_023.left - Column_flexShrink_02.left))
        .assertEqual(Math.round(Column_flexShrink_02.right - Column_flexShrink_023.right));
      expect(Math.round(Column_flexShrink_022.top - Column_flexShrink_021.bottom))
        .assertEqual(Math.round(Column_flexShrink_023.top - Column_flexShrink_022.bottom))
      console.log('assert space')
      expect(Math.round(Column_flexShrink_022.top - Column_flexShrink_021.bottom)).assertEqual(Math.round(vp2px(10)));
      expect(Math.round(Column_flexShrink_023.top - Column_flexShrink_022.bottom)).assertEqual(Math.round(vp2px(10)));
      expect(Column_flexShrink_02.top).assertEqual(Column_flexShrink_021.top);
      expect(Column_flexShrink_023.bottom).assertLess(Column_flexShrink_02.bottom);
      console.log('assert height')
      expect(Math.round(Column_flexShrink_021.bottom - Column_flexShrink_021.top)).assertEqual(Math.round(vp2px(200)));
      console.log('Column_flexShrink_021.bottom - Column_flexShrink_021.top', +(Column_flexShrink_021.bottom - Column_flexShrink_021.top))
      expect(Math.round(Column_flexShrink_022.bottom - Column_flexShrink_022.top)).assertEqual(Math.round(vp2px(100)));
      console.log('Column_flexShrink_022.bottom - Column_flexShrink_022.top', +(Column_flexShrink_022.bottom - Column_flexShrink_022.top))
      expect(Math.round(Column_flexShrink_023.bottom - Column_flexShrink_023.top)).assertEqual(Math.round(vp2px(100)));
      console.log('Column_flexShrink_023.bottom - Column_flexShrink_023.top', +(Column_flexShrink_023.bottom - Column_flexShrink_023.top))
      console.log('assert weight')
      expect(Math.round(Column_flexShrink_021.right - Column_flexShrink_021.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(Column_flexShrink_022.right - Column_flexShrink_022.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(Column_flexShrink_023.right - Column_flexShrink_023.left)).assertEqual(Math.round(vp2px(300)));
      console.info('[SUB_ACE_flexShrink_Default_TEST_0400] END');
    });

  })
}