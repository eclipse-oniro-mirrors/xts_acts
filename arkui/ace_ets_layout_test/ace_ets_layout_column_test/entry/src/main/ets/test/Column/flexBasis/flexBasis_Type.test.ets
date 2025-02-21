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

export default function flexBasis_Type() {
  describe('flexBasis_Type', () => {
    beforeEach(async () => {
      console.info("flexBasis_Type beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Column/flexBasis/flexBasis_Type",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get flexBasis_Type state pages:" + JSON.stringify(pages));
        if (!("flexBasis_Type" == pages.name)) {
          console.info("get flexBasis_Type pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push flexBasis_Type page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push flexBasis_Type page error " + JSON.stringify(err));
        expect().assertFail();
      }
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("flexBasis_Type after each called")
    });
    /**
     * @tc.number SUB_ACE_flexBasis_Type_TEST_0100
     * @tc.name testFlexBasis
     * @tc.desc column1 is set to flexBasis(100) , the height of column1 is 100vp
     */
    it('SUB_ACE_flexBasis_Type_TEST_0100', 0, async () => {
      console.info('[SUB_ACE_flexBasis_Type_TEST_0100] START');
      globalThis.value.message.notify({
        name: 'addflexBasis1', value: 100
      });
      await CommonFunc.sleep(3000);
      let Column_flexBasis_011: RectValue = CommonFunc.getComponentRect('Column_flexBasis_011');
      let Column_flexBasis_012: RectValue = CommonFunc.getComponentRect('Column_flexBasis_012');
      let Column_flexBasis_013: RectValue = CommonFunc.getComponentRect('Column_flexBasis_013');
      let Column_flexBasis_01: RectValue = CommonFunc.getComponentRect('Column_flexBasis_01');
      console.log('assert position')
      expect(Math.abs((Column_flexBasis_011.left - Column_flexBasis_01.left) - (Column_flexBasis_01.right - Column_flexBasis_011.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_012.left - Column_flexBasis_01.left) - (Column_flexBasis_01.right - Column_flexBasis_012.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_013.left - Column_flexBasis_01.left) - (Column_flexBasis_01.right - Column_flexBasis_013.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_012.top - Column_flexBasis_011.bottom) - (Column_flexBasis_013.top - Column_flexBasis_012.bottom)) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs((Column_flexBasis_012.top - Column_flexBasis_011.bottom) - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_013.top - Column_flexBasis_012.bottom) - vp2px(10)) <= 1).assertTrue();
      console.log('Column_flexBasis_012.top - Column_flexBasis_011.bottom', +(Column_flexBasis_012.top - Column_flexBasis_011.bottom))
      console.log('Column_flexBasis_013.top - Column_flexBasis_012.bottom', +(Column_flexBasis_013.top - Column_flexBasis_012.bottom))
      expect(Math.abs((Column_flexBasis_01.top - Column_flexBasis_011.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs((Column_flexBasis_011.bottom - Column_flexBasis_011.top) - vp2px(100)) <= 1).assertTrue();
      console.log('Column_flexBasis_011.bottom - Column_flexBasis_011.top', +(Column_flexBasis_011.bottom - Column_flexBasis_011.top))
      expect(Math.abs((Column_flexBasis_012.bottom - Column_flexBasis_012.top) - vp2px(100)) <= 1).assertTrue();
      console.log('Column_flexBasis_012.bottom - Column_flexBasis_012.top', +(Column_flexBasis_012.bottom - Column_flexBasis_012.top))
      expect(Math.abs((Column_flexBasis_013.bottom - Column_flexBasis_013.top) - vp2px(100)) <= 1).assertTrue();
      console.log('Column_flexBasis_013.bottom - Column_flexBasis_013.top', +(Column_flexBasis_013.bottom - Column_flexBasis_013.top))
      console.log('assert weight')
      expect(Math.abs((Column_flexBasis_011.right - Column_flexBasis_011.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_012.right - Column_flexBasis_012.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_013.right - Column_flexBasis_013.left) - vp2px(300)) <= 1).assertTrue();
      console.info('[SUB_ACE_flexBasis_Type_TEST_0100] END');
    });
    /**
     * @tc.number SUB_ACE_flexBasis_Type_TEST_0200
     * @tc.name testFlexBasis
     * @tc.desc column1 is set to flexBasis(0) , the height of column1 is  the original height
     */
    it('SUB_ACE_flexBasis_Type_TEST_0200', 0, async () => {
      console.info('[SUB_ACE_flexBasis_Type_TEST_0200] START');
      globalThis.value.message.notify({
        name: 'addflexBasis1', value: 0
      });
      await CommonFunc.sleep(3000);
      let Column_flexBasis_011: RectValue = CommonFunc.getComponentRect('Column_flexBasis_011');
      let Column_flexBasis_012: RectValue = CommonFunc.getComponentRect('Column_flexBasis_012');
      let Column_flexBasis_013: RectValue = CommonFunc.getComponentRect('Column_flexBasis_013');
      let Column_flexBasis_01: RectValue = CommonFunc.getComponentRect('Column_flexBasis_01');
      console.log('assert position')
      expect(Math.abs((Column_flexBasis_011.left - Column_flexBasis_01.left) - (Column_flexBasis_01.right - Column_flexBasis_011.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_012.left - Column_flexBasis_01.left) - (Column_flexBasis_01.right - Column_flexBasis_012.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_013.left - Column_flexBasis_01.left) - (Column_flexBasis_01.right - Column_flexBasis_013.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_012.top - Column_flexBasis_011.bottom) - (Column_flexBasis_013.top - Column_flexBasis_012.bottom)) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs((Column_flexBasis_012.top - Column_flexBasis_011.bottom) - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_013.top - Column_flexBasis_012.bottom) - vp2px(10)) <= 1).assertTrue();
      console.log('Column_flexBasis_012.top - Column_flexBasis_011.bottom', +(Column_flexBasis_012.top - Column_flexBasis_011.bottom))
      console.log('Column_flexBasis_013.top - Column_flexBasis_012.bottom', +(Column_flexBasis_013.top - Column_flexBasis_012.bottom))
      expect(Math.abs((Column_flexBasis_01.top - Column_flexBasis_011.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs((Column_flexBasis_011.bottom - Column_flexBasis_011.top) - vp2px(200)) <= 1).assertTrue();
      console.log('Column_flexBasis_011.bottom - Column_flexBasis_011.top', +(Column_flexBasis_011.bottom - Column_flexBasis_011.top))
      expect(Math.abs((Column_flexBasis_012.bottom - Column_flexBasis_012.top) - vp2px(100)) <= 1).assertTrue();
      console.log('Column_flexBasis_012.bottom - Column_flexBasis_012.top', +(Column_flexBasis_012.bottom - Column_flexBasis_012.top))
      expect(Math.abs((Column_flexBasis_013.bottom - Column_flexBasis_013.top) - vp2px(100)) <= 1).assertTrue();
      console.log('Column_flexBasis_013.bottom - Column_flexBasis_013.top', +(Column_flexBasis_013.bottom - Column_flexBasis_013.top))
      console.log('assert weight')
      expect(Math.abs((Column_flexBasis_011.right - Column_flexBasis_011.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_012.right - Column_flexBasis_012.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_013.right - Column_flexBasis_013.left) - vp2px(300)) <= 1).assertTrue();
      console.info('[SUB_ACE_flexBasis_Type_TEST_0200] END');
    });

    /**
     * @tc.number SUB_ACE_flexBasis_Type_TEST_0300
     * @tc.name testFlexBasis
     * @tc.desc column1 is set to flexBasis('auto') , the height of column1 is  the original height
     */
    it('SUB_ACE_flexBasis_Type_TEST_0300', 0, async () => {
      console.info('[SUB_ACE_flexBasis_Type_TEST_0300] START');
      globalThis.value.message.notify({
        name: 'addflexBasis2', value: 'auto'
      });
      await CommonFunc.sleep(3000);
      let Column_flexBasis_021: RectValue = CommonFunc.getComponentRect('Column_flexBasis_021');
      let Column_flexBasis_022: RectValue = CommonFunc.getComponentRect('Column_flexBasis_022');
      let Column_flexBasis_023: RectValue = CommonFunc.getComponentRect('Column_flexBasis_023');
      let Column_flexBasis_02: RectValue = CommonFunc.getComponentRect('Column_flexBasis_02');
      console.log('assert position')
      expect(Math.abs((Column_flexBasis_021.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_021.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_022.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_022.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_023.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_023.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_022.top - Column_flexBasis_021.bottom) - (Column_flexBasis_023.top - Column_flexBasis_022.bottom)) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs((Column_flexBasis_022.top - Column_flexBasis_021.bottom) - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_023.top - Column_flexBasis_022.bottom) - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_02.top - Column_flexBasis_021.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs((Column_flexBasis_021.bottom - Column_flexBasis_021.top) - vp2px(220)) <= 1).assertTrue();
      console.log('Column_flexBasis_021.bottom - Column_flexBasis_021.top', +(Column_flexBasis_021.bottom - Column_flexBasis_021.top))
      expect(Math.abs((Column_flexBasis_022.bottom - Column_flexBasis_022.top) - vp2px(100)) <= 1).assertTrue();
      console.log('Column_flexBasis_022.bottom - Column_flexBasis_022.top', +(Column_flexBasis_022.bottom - Column_flexBasis_022.top))
      expect(Math.abs((Column_flexBasis_023.bottom - Column_flexBasis_023.top) - vp2px(100)) <= 1).assertTrue();
      console.log('Column_flexBasis_023.bottom - Column_flexBasis_023.top', +(Column_flexBasis_023.bottom - Column_flexBasis_023.top))
      console.log('assert weight')
      expect(Math.abs((Column_flexBasis_021.right - Column_flexBasis_021.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_022.right - Column_flexBasis_022.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_023.right - Column_flexBasis_023.left) - vp2px(300)) <= 1).assertTrue();
      console.info('[SUB_ACE_flexBasis_Type_TEST_0400] END');
    });
    /**
     * @tc.number SUB_ACE_flexBasis_Type_TEST_0400
     * @tc.name testFlexBasis
     * @tc.desc column1 is set to flexBasis('200vp') , the height of column1 is 200vp
     */
    it('SUB_ACE_flexBasis_Type_TEST_0400', 0, async () => {
      console.info('[SUB_ACE_flexBasis_Type_TEST_0400] START');
      globalThis.value.message.notify({
        name: 'addflexBasis2', value: '200vp'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexBasis_021: RectValue = CommonFunc.getComponentRect('Column_flexBasis_021');
      let Column_flexBasis_022: RectValue = CommonFunc.getComponentRect('Column_flexBasis_022');
      let Column_flexBasis_023: RectValue = CommonFunc.getComponentRect('Column_flexBasis_023');
      let Column_flexBasis_02: RectValue = CommonFunc.getComponentRect('Column_flexBasis_02');
      console.log('assert position')
      expect(Math.abs((Column_flexBasis_021.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_021.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_022.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_022.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_023.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_023.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_022.top - Column_flexBasis_021.bottom) - (Column_flexBasis_023.top - Column_flexBasis_022.bottom)) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs((Column_flexBasis_022.top - Column_flexBasis_021.bottom) - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_023.top - Column_flexBasis_022.bottom) - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_02.top - Column_flexBasis_021.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs((Column_flexBasis_021.bottom - Column_flexBasis_021.top) - vp2px(200)) <= 1).assertTrue();
      console.log('Column_flexBasis_021.bottom - Column_flexBasis_021.top', +(Column_flexBasis_021.bottom - Column_flexBasis_021.top))
      expect(Math.abs((Column_flexBasis_022.bottom - Column_flexBasis_022.top) - vp2px(100)) <= 1).assertTrue();
      console.log('Column_flexBasis_022.bottom - Column_flexBasis_022.top', +(Column_flexBasis_022.bottom - Column_flexBasis_022.top))
      expect(Math.abs((Column_flexBasis_023.bottom - Column_flexBasis_023.top) - vp2px(100)) <= 1).assertTrue();
      console.log('Column_flexBasis_023.bottom - Column_flexBasis_023.top', +(Column_flexBasis_023.bottom - Column_flexBasis_023.top))
      console.log('assert weight')
      expect(Math.abs((Column_flexBasis_021.right - Column_flexBasis_021.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_022.right - Column_flexBasis_022.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_023.right - Column_flexBasis_023.left) - vp2px(300)) <= 1).assertTrue();
      console.info('[SUB_ACE_flexBasis_Type_TEST_0400] END');
    });
    /**
     * @tc.number SUB_ACE_flexBasis_Type_TEST_0500
     * @tc.name testFlexBasis
     * @tc.desc column1 is set to flexBasis('200px') , the height of column1 is 200px
     */
    it('SUB_ACE_flexBasis_Type_TEST_0500', 0, async () => {
      console.info('[SUB_ACE_flexBasis_Type_TEST_0500] START');
      globalThis.value.message.notify({
        name: 'addflexBasis2', value: '200px'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexBasis_021: RectValue = CommonFunc.getComponentRect('Column_flexBasis_021');
      let Column_flexBasis_022: RectValue = CommonFunc.getComponentRect('Column_flexBasis_022');
      let Column_flexBasis_023: RectValue = CommonFunc.getComponentRect('Column_flexBasis_023');
      let Column_flexBasis_02: RectValue = CommonFunc.getComponentRect('Column_flexBasis_02');
      console.log('assert position')
      expect(Math.abs((Column_flexBasis_021.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_021.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_022.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_022.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_023.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_023.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_022.top - Column_flexBasis_021.bottom) - (Column_flexBasis_023.top - Column_flexBasis_022.bottom)) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs((Column_flexBasis_022.top - Column_flexBasis_021.bottom) - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_023.top - Column_flexBasis_022.bottom) - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_02.top - Column_flexBasis_021.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs((Column_flexBasis_021.bottom - Column_flexBasis_021.top) - 200) <= 1).assertTrue();
      console.log('Column_flexBasis_021.bottom - Column_flexBasis_021.top', +(Column_flexBasis_021.bottom - Column_flexBasis_021.top))
      expect(Math.abs((Column_flexBasis_022.bottom - Column_flexBasis_022.top) - vp2px(100)) <= 1).assertTrue();
      console.log('Column_flexBasis_022.bottom - Column_flexBasis_022.top', +(Column_flexBasis_022.bottom - Column_flexBasis_022.top))
      expect(Math.abs((Column_flexBasis_023.bottom - Column_flexBasis_023.top) - vp2px(100)) <= 1).assertTrue();
      console.log('Column_flexBasis_023.bottom - Column_flexBasis_023.top', +(Column_flexBasis_023.bottom - Column_flexBasis_023.top))
      console.log('assert weight')
      expect(Math.abs((Column_flexBasis_021.right - Column_flexBasis_021.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_022.right - Column_flexBasis_022.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_023.right - Column_flexBasis_023.left) - vp2px(300)) <= 1).assertTrue();
      console.info('[SUB_ACE_flexBasis_Type_TEST_0500] END');
    });
    /**
     * @tc.number SUB_ACE_flexBasis_Type_TEST_0600
     * @tc.name testFlexBasis
     * @tc.desc column1 is set to flexBasis('200fp') , the height of column1 is 200fp
     */
    it('SUB_ACE_flexBasis_Type_TEST_0600', 0, async () => {
      console.info('[SUB_ACE_flexBasis_Type_TEST_0600] START');
      globalThis.value.message.notify({
        name: 'addflexBasis2', value: '200fp'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexBasis_021: RectValue = CommonFunc.getComponentRect('Column_flexBasis_021');
      let Column_flexBasis_022: RectValue = CommonFunc.getComponentRect('Column_flexBasis_022');
      let Column_flexBasis_023: RectValue = CommonFunc.getComponentRect('Column_flexBasis_023');
      let Column_flexBasis_02: RectValue = CommonFunc.getComponentRect('Column_flexBasis_02');
      console.log('assert position')
      expect(Math.abs((Column_flexBasis_021.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_021.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_022.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_022.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_023.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_023.right)) <= 1)
        .assertTrue();
      expect(Math.abs((Column_flexBasis_022.top - Column_flexBasis_021.bottom) - (Column_flexBasis_023.top - Column_flexBasis_022.bottom)) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs((Column_flexBasis_022.top - Column_flexBasis_021.bottom) - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_023.top - Column_flexBasis_022.bottom) - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_02.top - Column_flexBasis_021.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs((Column_flexBasis_021.bottom - Column_flexBasis_021.top) - fp2px(200)) <= 1).assertTrue();
      console.log('Column_flexBasis_021.bottom - Column_flexBasis_021.top', +(Column_flexBasis_021.bottom - Column_flexBasis_021.top))
      expect(Math.abs((Column_flexBasis_022.bottom - Column_flexBasis_022.top) - vp2px(100)) <= 1).assertTrue();
      console.log('Column_flexBasis_022.bottom - Column_flexBasis_022.top', +(Column_flexBasis_022.bottom - Column_flexBasis_022.top))
      expect(Math.abs((Column_flexBasis_023.bottom - Column_flexBasis_023.top) - vp2px(100)) <= 1).assertTrue();
      console.log('Column_flexBasis_023.bottom - Column_flexBasis_023.top', +(Column_flexBasis_023.bottom - Column_flexBasis_023.top))
      console.log('assert weight')
      expect(Math.abs((Column_flexBasis_021.right - Column_flexBasis_021.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_022.right - Column_flexBasis_022.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_023.right - Column_flexBasis_023.left) - vp2px(300)) <= 1).assertTrue();
      console.info('[SUB_ACE_flexBasis_Type_TEST_0600] END');
    });
    /**
     * @tc.number SUB_ACE_flexBasis_Type_TEST_0700
     * @tc.name testFlexBasis
     * @tc.desc column1 is set to flexBasis('200lpx') , the height of column1 is 200lpx
     */
    it('SUB_ACE_flexBasis_Type_TEST_0700', 0, async () => {
      console.info('[SUB_ACE_flexBasis_Type_TEST_0700] START');
      globalThis.value.message.notify({
        name: 'addflexBasis2', value: '200lpx'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexBasis_021: RectValue = CommonFunc.getComponentRect('Column_flexBasis_021');
      let Column_flexBasis_022: RectValue = CommonFunc.getComponentRect('Column_flexBasis_022');
      let Column_flexBasis_023: RectValue = CommonFunc.getComponentRect('Column_flexBasis_023');
      let Column_flexBasis_02: RectValue = CommonFunc.getComponentRect('Column_flexBasis_02');
      console.log('assert position')
      expect(Math.abs((Column_flexBasis_021.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_021.right)) <= 1)
        .assertTrue();
      console.log('Column_flexBasis_021.left - Column_flexBasis_02.left', +(Column_flexBasis_021.left - Column_flexBasis_02.left))
      expect(Math.abs((Column_flexBasis_022.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_022.right)) <= 1)
        .assertTrue();
      console.log('Column_flexBasis_022.left - Column_flexBasis_02.left', +(Column_flexBasis_022.left - Column_flexBasis_02.left))
      expect(Math.abs((Column_flexBasis_023.left - Column_flexBasis_02.left) - (Column_flexBasis_02.right - Column_flexBasis_023.right)) <= 1)
        .assertTrue();
      console.log('Column_flexBasis_023.left - Column_flexBasis_02.left', +(Column_flexBasis_023.left - Column_flexBasis_02.left))
      expect(Math.abs((Column_flexBasis_022.top - Column_flexBasis_021.bottom) - (Column_flexBasis_023.top - Column_flexBasis_022.bottom)) <= 1)
        .assertTrue();
      console.log('Column_flexBasis_022.top - Column_flexBasis_021.bottom', +(Column_flexBasis_022.top - Column_flexBasis_021.bottom))

      console.log('assert space')
      expect(Math.abs((Column_flexBasis_022.top - Column_flexBasis_021.bottom) - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_023.top - Column_flexBasis_022.bottom) - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_02.top - Column_flexBasis_021.top)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs((Column_flexBasis_021.bottom - Column_flexBasis_021.top) - lpx2px(200)) <= 1).assertTrue();
      console.log('Column_flexBasis_021.bottom - Column_flexBasis_021.top', +(Column_flexBasis_021.bottom - Column_flexBasis_021.top))
      expect(Math.abs((Column_flexBasis_022.bottom - Column_flexBasis_022.top) - vp2px(100)) <= 1).assertTrue();
      console.log('Column_flexBasis_022.bottom - Column_flexBasis_022.top', +(Column_flexBasis_022.bottom - Column_flexBasis_022.top))
      expect(Math.abs((Column_flexBasis_023.bottom - Column_flexBasis_023.top) - vp2px(100)) <= 1).assertTrue();
      console.log('Column_flexBasis_023.bottom - Column_flexBasis_023.top', +(Column_flexBasis_023.bottom - Column_flexBasis_023.top))
      console.log('assert weight')
      expect(Math.abs((Column_flexBasis_021.right - Column_flexBasis_021.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_022.right - Column_flexBasis_022.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs((Column_flexBasis_023.right - Column_flexBasis_023.left) - vp2px(300)) <= 1).assertTrue();
      console.info('[SUB_ACE_flexBasis_Type_TEST_0700] END');
    });
  })
}