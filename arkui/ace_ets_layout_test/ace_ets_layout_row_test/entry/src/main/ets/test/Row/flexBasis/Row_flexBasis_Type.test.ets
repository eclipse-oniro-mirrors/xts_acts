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
import CommonFunc, { RectValue } from '../../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';

export default function Row_flexBasis_Type() {
  describe('Row_flexBasis_Type', () => {
    beforeEach(async (done: Function) => {
      console.info("Row_flexBasis_Type beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Row/flexBasis/Row_flexBasis_Type",
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Row_flexBasis_Type state pages:" + JSON.stringify(pages));
        if (!("Row_flexBasis_Type" == pages.name)) {
          console.info("get Row_flexBasis_Type pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Row_flexBasis_Type page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Row_flexBasis_Type page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Row_flexBasis_Type after each called")
    });
    /**
     * @tc.number SUB_ACE_Row_flexBasis_Type_TEST_0100
     * @tc.name testFlexBasis
     * @tc.desc row1 is set to flexBasis(100) , the width of row1 is 100vp
     */
    it('SUB_ACE_Row_flexBasis_Type_TEST_0100', 0, async (done: Function) => {
      console.info('[SUB_ACE_Row_flexBasis_Type_TEST_0100] START');
      globalThis.value.message.notify({
        name: 'addflexBasis1', value: 100
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_flexBasis_Type_011: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_011');
      let Row_flexBasis_Type_012: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_012');
      let Row_flexBasis_Type_013: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_013');
      let Row_flexBasis_Type_01: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_flexBasis_Type_011.top - Row_flexBasis_Type_01.top) - Math.round(Row_flexBasis_Type_01.bottom - Row_flexBasis_Type_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Type_012.top - Row_flexBasis_Type_01.top) - Math.round(Row_flexBasis_Type_01.bottom - Row_flexBasis_Type_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Type_013.top - Row_flexBasis_Type_01.top) - Math.round(Row_flexBasis_Type_01.bottom - Row_flexBasis_Type_013.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_flexBasis_Type_012.left - Row_flexBasis_Type_011.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_013.left - Row_flexBasis_Type_012.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_012.left - Row_flexBasis_Type_011.right', Row_flexBasis_Type_012.left - Row_flexBasis_Type_011.right)
      console.log('Row_flexBasis_Type_013.left - Row_flexBasis_Type_012.right', Row_flexBasis_Type_013.left - Row_flexBasis_Type_012.right)

      console.log('assert height')
      expect(Math.abs((Math.round(Row_flexBasis_Type_011.bottom - Row_flexBasis_Type_011.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_011.bottom - Row_flexBasis_Type_011.top', Row_flexBasis_Type_011.bottom - Row_flexBasis_Type_011.top)
      expect(Math.abs((Math.round(Row_flexBasis_Type_012.bottom - Row_flexBasis_Type_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_012.bottom - Row_flexBasis_Type_012.top', Row_flexBasis_Type_012.bottom - Row_flexBasis_Type_012.top)
      expect(Math.abs((Math.round(Row_flexBasis_Type_013.bottom - Row_flexBasis_Type_013.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_013.bottom - Row_flexBasis_Type_013.top', Row_flexBasis_Type_013.bottom - Row_flexBasis_Type_013.top)
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_flexBasis_Type_011.right - Row_flexBasis_Type_011.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_012.right - Row_flexBasis_Type_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_013.right - Row_flexBasis_Type_013.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_flexBasis_Type_TEST_0100] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_Row_flexBasis_Type_TEST_0200
     * @tc.name testFlexBasis
     * @tc.desc row1 is set to flexBasis(0) , the width of row1 is the original width
     */
    it('SUB_ACE_Row_flexBasis_Type_TEST_0200', 0, async (done: Function) => {
      console.info('[SUB_ACE_Row_flexBasis_Type_TEST_0200] START');
      globalThis.value.message.notify({
        name: 'addflexBasis1', value: 0
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_flexBasis_Type_011: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_011');
      let Row_flexBasis_Type_012: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_012');
      let Row_flexBasis_Type_013: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_013');
      let Row_flexBasis_Type_01: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_flexBasis_Type_011.top - Row_flexBasis_Type_01.top) - Math.round(Row_flexBasis_Type_01.bottom - Row_flexBasis_Type_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Type_012.top - Row_flexBasis_Type_01.top) - Math.round(Row_flexBasis_Type_01.bottom - Row_flexBasis_Type_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Type_013.top - Row_flexBasis_Type_01.top) - Math.round(Row_flexBasis_Type_01.bottom - Row_flexBasis_Type_013.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_flexBasis_Type_012.left - Row_flexBasis_Type_011.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_013.left - Row_flexBasis_Type_012.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_012.left - Row_flexBasis_Type_011.right', Row_flexBasis_Type_012.left - Row_flexBasis_Type_011.right)
      console.log('Row_flexBasis_Type_013.left - Row_flexBasis_Type_012.right', Row_flexBasis_Type_013.left - Row_flexBasis_Type_012.right)

      console.log('assert height')
      expect(Math.abs((Math.round(Row_flexBasis_Type_011.bottom - Row_flexBasis_Type_011.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_011.bottom - Row_flexBasis_Type_011.top', Row_flexBasis_Type_011.bottom - Row_flexBasis_Type_011.top)
      expect(Math.abs((Math.round(Row_flexBasis_Type_012.bottom - Row_flexBasis_Type_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_012.bottom - Row_flexBasis_Type_012.top', Row_flexBasis_Type_012.bottom - Row_flexBasis_Type_012.top)
      expect(Math.abs((Math.round(Row_flexBasis_Type_013.bottom - Row_flexBasis_Type_013.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_013.bottom - Row_flexBasis_Type_013.top', Row_flexBasis_Type_013.bottom - Row_flexBasis_Type_013.top)
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_flexBasis_Type_011.right - Row_flexBasis_Type_011.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_012.right - Row_flexBasis_Type_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_013.right - Row_flexBasis_Type_013.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_flexBasis_Type_TEST_0200] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_flexBasis_Type_TEST_0300
     * @tc.name testFlexBasis
     * @tc.desc row1 is set to flexBasis('auto') , the width of row1 is the original width
     */
    it('SUB_ACE_flexBasis_Type_TEST_0300', 0, async (done: Function) => {
      console.info('[SUB_ACE_flexBasis_Type_TEST_0300] START');
      globalThis.value.message.notify({
        name: 'addflexBasis2', value: 'auto'
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_flexBasis_Type_021: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_021');
      let Row_flexBasis_Type_022: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_022');
      let Row_flexBasis_Type_023: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_023');
      let Row_flexBasis_Type_02: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_02');
      console.log('assert position')
      expect(Math.abs(Math.round(Row_flexBasis_Type_021.top - Row_flexBasis_Type_02.top) - Math.round(Row_flexBasis_Type_02.bottom - Row_flexBasis_Type_021.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Type_022.top - Row_flexBasis_Type_02.top) - Math.round(Row_flexBasis_Type_02.bottom - Row_flexBasis_Type_022.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Type_023.top - Row_flexBasis_Type_02.top) - Math.round(Row_flexBasis_Type_02.bottom - Row_flexBasis_Type_023.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_flexBasis_Type_022.left - Row_flexBasis_Type_021.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_023.left - Row_flexBasis_Type_022.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();


      console.log('assert height')
      expect(Math.abs((Math.round(Row_flexBasis_Type_021.bottom - Row_flexBasis_Type_021.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_021.bottom - Row_flexBasis_Type_021.top', Row_flexBasis_Type_021.bottom - Row_flexBasis_Type_021.top)
      expect(Math.abs((Math.round(Row_flexBasis_Type_022.bottom - Row_flexBasis_Type_022.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_022.bottom - Row_flexBasis_Type_022.top', Row_flexBasis_Type_022.bottom - Row_flexBasis_Type_022.top)
      expect(Math.abs((Math.round(Row_flexBasis_Type_023.bottom - Row_flexBasis_Type_023.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_023.bottom - Row_flexBasis_Type_023.top', Row_flexBasis_Type_023.bottom - Row_flexBasis_Type_023.top)
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_flexBasis_Type_021.right - Row_flexBasis_Type_021.left)) - (Math.round(vp2px(220)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_022.right - Row_flexBasis_Type_022.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_023.right - Row_flexBasis_Type_023.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_flexBasis_Type_TEST_0300] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_flexBasis_Type_TEST_0400
     * @tc.name testFlexBasis
     * @tc.desc row1 is set to flexBasis('200vp') , the width of row1 is 200vp
     */
    it('SUB_ACE_flexBasis_Type_TEST_0400', 0, async (done: Function) => {
      console.info('[SUB_ACE_flexBasis_Type_TEST_0400] START');
      globalThis.value.message.notify({
        name: 'addflexBasis2', value: '200vp'
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_flexBasis_Type_021: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_021');
      let Row_flexBasis_Type_022: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_022');
      let Row_flexBasis_Type_023: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_023');
      let Row_flexBasis_Type_02: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_02');
      console.log('assert position')
      expect(Math.abs(Math.round(Row_flexBasis_Type_021.top - Row_flexBasis_Type_02.top) - Math.round(Row_flexBasis_Type_02.bottom - Row_flexBasis_Type_021.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Type_022.top - Row_flexBasis_Type_02.top) - Math.round(Row_flexBasis_Type_02.bottom - Row_flexBasis_Type_022.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Type_023.top - Row_flexBasis_Type_02.top) - Math.round(Row_flexBasis_Type_02.bottom - Row_flexBasis_Type_023.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_flexBasis_Type_022.left - Row_flexBasis_Type_021.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_023.left - Row_flexBasis_Type_022.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();


      console.log('assert height')
      expect(Math.abs((Math.round(Row_flexBasis_Type_021.bottom - Row_flexBasis_Type_021.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_021.bottom - Row_flexBasis_Type_021.top', Row_flexBasis_Type_021.bottom - Row_flexBasis_Type_021.top)
      expect(Math.abs((Math.round(Row_flexBasis_Type_022.bottom - Row_flexBasis_Type_022.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_022.bottom - Row_flexBasis_Type_022.top', Row_flexBasis_Type_022.bottom - Row_flexBasis_Type_022.top)
      expect(Math.abs((Math.round(Row_flexBasis_Type_023.bottom - Row_flexBasis_Type_023.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_023.bottom - Row_flexBasis_Type_023.top', Row_flexBasis_Type_023.bottom - Row_flexBasis_Type_023.top)
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_flexBasis_Type_021.right - Row_flexBasis_Type_021.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_022.right - Row_flexBasis_Type_022.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_023.right - Row_flexBasis_Type_023.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_flexBasis_Type_TEST_0400] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_flexBasis_Type_TEST_0500
     * @tc.name testFlexBasis
     * @tc.desc row1 is set to flexBasis('200px') , the width of row1 is 200px
     */
    it('SUB_ACE_flexBasis_Type_TEST_0500', 0, async (done: Function) => {
      console.info('[SUB_ACE_flexBasis_Type_TEST_0500] START');
      globalThis.value.message.notify({
        name: 'addflexBasis2', value: '200px'
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_flexBasis_Type_021: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_021');
      let Row_flexBasis_Type_022: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_022');
      let Row_flexBasis_Type_023: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_023');
      let Row_flexBasis_Type_02: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_02');
      console.log('assert position')
      expect(Math.abs(Math.round(Row_flexBasis_Type_021.top - Row_flexBasis_Type_02.top) - Math.round(Row_flexBasis_Type_02.bottom - Row_flexBasis_Type_021.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Type_022.top - Row_flexBasis_Type_02.top) - Math.round(Row_flexBasis_Type_02.bottom - Row_flexBasis_Type_022.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Type_023.top - Row_flexBasis_Type_02.top) - Math.round(Row_flexBasis_Type_02.bottom - Row_flexBasis_Type_023.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_flexBasis_Type_022.left - Row_flexBasis_Type_021.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_023.left - Row_flexBasis_Type_022.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();


      console.log('assert height')
      expect(Math.abs((Math.round(Row_flexBasis_Type_021.bottom - Row_flexBasis_Type_021.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_021.bottom - Row_flexBasis_Type_021.top', Row_flexBasis_Type_021.bottom - Row_flexBasis_Type_021.top)
      expect(Math.abs((Math.round(Row_flexBasis_Type_022.bottom - Row_flexBasis_Type_022.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_022.bottom - Row_flexBasis_Type_022.top', Row_flexBasis_Type_022.bottom - Row_flexBasis_Type_022.top)
      expect(Math.abs((Math.round(Row_flexBasis_Type_023.bottom - Row_flexBasis_Type_023.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_023.bottom - Row_flexBasis_Type_023.top', Row_flexBasis_Type_023.bottom - Row_flexBasis_Type_023.top)
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_flexBasis_Type_021.right - Row_flexBasis_Type_021.left)) - (200)) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_022.right - Row_flexBasis_Type_022.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_023.right - Row_flexBasis_Type_023.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_flexBasis_Type_TEST_0500] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_flexBasis_Type_TEST_0600
     * @tc.name testFlexBasis
     * @tc.desc row1 is set to flexBasis('200fp') , the width of row1 is 200fp
     */
    it('SUB_ACE_flexBasis_Type_TEST_0600', 0, async (done: Function) => {
      console.info('[SUB_ACE_flexBasis_Type_TEST_0600] START');
      globalThis.value.message.notify({
        name: 'addflexBasis2', value: '200fp'
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_flexBasis_Type_021: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_021');
      let Row_flexBasis_Type_022: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_022');
      let Row_flexBasis_Type_023: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_023');
      let Row_flexBasis_Type_02: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_02');
      console.log('assert position')
      expect(Math.abs(Math.round(Row_flexBasis_Type_021.top - Row_flexBasis_Type_02.top) - Math.round(Row_flexBasis_Type_02.bottom - Row_flexBasis_Type_021.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Type_022.top - Row_flexBasis_Type_02.top) - Math.round(Row_flexBasis_Type_02.bottom - Row_flexBasis_Type_022.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Type_023.top - Row_flexBasis_Type_02.top) - Math.round(Row_flexBasis_Type_02.bottom - Row_flexBasis_Type_023.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_flexBasis_Type_022.left - Row_flexBasis_Type_021.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_023.left - Row_flexBasis_Type_022.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();


      console.log('assert height')
      expect(Math.abs((Math.round(Row_flexBasis_Type_021.bottom - Row_flexBasis_Type_021.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_021.bottom - Row_flexBasis_Type_021.top', Row_flexBasis_Type_021.bottom - Row_flexBasis_Type_021.top)
      expect(Math.abs((Math.round(Row_flexBasis_Type_022.bottom - Row_flexBasis_Type_022.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_022.bottom - Row_flexBasis_Type_022.top', Row_flexBasis_Type_022.bottom - Row_flexBasis_Type_022.top)
      expect(Math.abs((Math.round(Row_flexBasis_Type_023.bottom - Row_flexBasis_Type_023.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_023.bottom - Row_flexBasis_Type_023.top', Row_flexBasis_Type_023.bottom - Row_flexBasis_Type_023.top)
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_flexBasis_Type_021.right - Row_flexBasis_Type_021.left)) - (Math.round(fp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_022.right - Row_flexBasis_Type_022.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_023.right - Row_flexBasis_Type_023.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_flexBasis_Type_TEST_0600] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_flexBasis_Type_TEST_0700
     * @tc.name testFlexBasis
     * @tc.desc row1 is set to flexBasis('200lpx') , the width of row1 is 200lpx
     */
    it('SUB_ACE_flexBasis_Type_TEST_0700', 0, async (done: Function) => {
      console.info('[SUB_ACE_flexBasis_Type_TEST_0700] START');
      globalThis.value.message.notify({
        name: 'addflexBasis2', value: '200lpx'
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_flexBasis_Type_021: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_021');
      let Row_flexBasis_Type_022: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_022');
      let Row_flexBasis_Type_023: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_023');
      let Row_flexBasis_Type_02: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Type_02');
      console.log('assert position')
      expect(Math.abs(Math.round(Row_flexBasis_Type_021.top - Row_flexBasis_Type_02.top) - Math.round(Row_flexBasis_Type_02.bottom - Row_flexBasis_Type_021.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Type_022.top - Row_flexBasis_Type_02.top) - Math.round(Row_flexBasis_Type_02.bottom - Row_flexBasis_Type_022.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Type_023.top - Row_flexBasis_Type_02.top) - Math.round(Row_flexBasis_Type_02.bottom - Row_flexBasis_Type_023.bottom)) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_021.top - Row_flexBasis_Type_02.top', Row_flexBasis_Type_021.top - Row_flexBasis_Type_02.top)
      console.log('Row_flexBasis_Type_022.top - Row_flexBasis_Type_02.top', Row_flexBasis_Type_022.top - Row_flexBasis_Type_02.top)
      console.log('Row_flexBasis_Type_023.top - Row_flexBasis_Type_02.top', Row_flexBasis_Type_023.top - Row_flexBasis_Type_02.top)

      console.log('assert space')
      expect(Math.abs((Math.round(Row_flexBasis_Type_022.left - Row_flexBasis_Type_021.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_023.left - Row_flexBasis_Type_022.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();


      console.log('assert height')
      expect(Math.abs((Math.round(Row_flexBasis_Type_021.bottom - Row_flexBasis_Type_021.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_021.bottom - Row_flexBasis_Type_021.top', Row_flexBasis_Type_021.bottom - Row_flexBasis_Type_021.top)
      expect(Math.abs((Math.round(Row_flexBasis_Type_022.bottom - Row_flexBasis_Type_022.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_022.bottom - Row_flexBasis_Type_022.top', Row_flexBasis_Type_022.bottom - Row_flexBasis_Type_022.top)
      expect(Math.abs((Math.round(Row_flexBasis_Type_023.bottom - Row_flexBasis_Type_023.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Type_023.bottom - Row_flexBasis_Type_023.top', Row_flexBasis_Type_023.bottom - Row_flexBasis_Type_023.top)
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_flexBasis_Type_021.right - Row_flexBasis_Type_021.left)) - (Math.round(lpx2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_022.right - Row_flexBasis_Type_022.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Type_023.right - Row_flexBasis_Type_023.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_flexBasis_Type_TEST_0700] END');
      done();
    });
  })
}