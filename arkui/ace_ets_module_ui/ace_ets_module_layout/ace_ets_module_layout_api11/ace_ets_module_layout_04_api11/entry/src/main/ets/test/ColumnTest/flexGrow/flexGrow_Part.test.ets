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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import RectValue from '../../../MainAbility/common/Rect';
import CommonFunc from '../../../MainAbility/common/Common';
import GlobalContext from '../../../MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';

export default function flexGrow_Part() {
  describe('flexGrow_Part', () => {
    beforeEach(async () => {
      console.info("flexGrow_Part beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Column/flexGrow/flexGrow_Part",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get flexGrow_Part state pages:" + JSON.stringify(pages));
        if (!("flexGrow_Part" == pages.name)) {
          console.info("get flexGrow_Part pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push flexGrow_Part page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push flexGrow_Part page error " + JSON.stringify(err));
        expect().assertFail();
      }
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("flexGrow_Part after each called")
    });

    /**
     * @tc.number SUB_ACE_flexGrow_Part_TEST_0100
     * @tc.name testFlexGrow
     * @tc.desc colum1 set layoutWeight(1), colum2、colum3 set flexGrow(1)
     */
    it('SUB_ACE_flexGrow_Part_TEST_0100', 0, async () => {
      console.info('[SUB_ACE_flexGrow_Part_TEST_0100] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'addflexGrow2', value: 1
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'addflexGrow3', value: 1
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexGrow_011: RectValue = CommonFunc.getComponentRect('Column_flexGrow_011');
      let Column_flexGrow_012: RectValue = CommonFunc.getComponentRect('Column_flexGrow_012');
      let Column_flexGrow_013: RectValue = CommonFunc.getComponentRect('Column_flexGrow_013');
      let Column_flexGrow_01: RectValue = CommonFunc.getComponentRect('Column_flexGrow_01');
      console.log('assert position')
      expect(Math.abs(Column_flexGrow_011.left - Column_flexGrow_01.left - Math.round(Column_flexGrow_01.right - Column_flexGrow_011.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_flexGrow_012.left - Column_flexGrow_01.left - Math.round(Column_flexGrow_01.right - Column_flexGrow_012.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_flexGrow_013.left - Column_flexGrow_01.left - Math.round(Column_flexGrow_01.right - Column_flexGrow_013.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_flexGrow_012.top - Column_flexGrow_011.bottom - Math.round(Column_flexGrow_013.top - Column_flexGrow_012.bottom)) <= 1)
        .assertTrue()
      console.log('assert space')
      expect(Math.abs(Column_flexGrow_012.top - Column_flexGrow_011.bottom - Math.round(vp2px(10))) <= 1).assertTrue();
      expect(Math.abs(Column_flexGrow_013.top - Column_flexGrow_012.bottom - Math.round(vp2px(10))) <= 1).assertTrue();
      console.log('Column_flexGrow_012.top - Column_flexGrow_011.bottom', +(Column_flexGrow_012.top - Column_flexGrow_011.bottom))
      console.log('Column_flexGrow_013.top - Column_flexGrow_012.bottom', +(Column_flexGrow_013.top - Column_flexGrow_012.bottom))
      expect(Math.abs(Column_flexGrow_01.top - Column_flexGrow_011.top) <= 1).assertTrue();
      expect(Math.abs(Column_flexGrow_013.bottom - Column_flexGrow_01.bottom) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs(Column_flexGrow_011.bottom - Column_flexGrow_011.top - Math.round(vp2px(250))) <= 1).assertTrue();
      console.log('Column_flexGrow_011.bottom - Column_flexGrow_011.top', +(Column_flexGrow_011.bottom - Column_flexGrow_011.top))
      expect(Math.abs(Column_flexGrow_012.bottom - Column_flexGrow_012.top - Math.round(vp2px(100))) <= 1).assertTrue();
      console.log('Column_flexGrow_012.bottom - Column_flexGrow_012.top', +(Column_flexGrow_012.bottom - Column_flexGrow_012.top))
      expect(Math.abs(Column_flexGrow_013.bottom - Column_flexGrow_013.top - Math.round(vp2px(100))) <= 1).assertTrue();
      console.log('Column_flexGrow_013.bottom - Column_flexGrow_013.top', +(Column_flexGrow_013.bottom - Column_flexGrow_013.top))
      console.log('assert weight')
      expect(Math.abs(Column_flexGrow_011.right - Column_flexGrow_011.left - Math.round(vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Column_flexGrow_012.right - Column_flexGrow_012.left - Math.round(vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Column_flexGrow_013.right - Column_flexGrow_013.left - Math.round(vp2px(300))) <= 1).assertTrue();
      console.info('[SUB_ACE_flexGrow_Part_TEST_0100] END');
    });
    /**
     * @tc.number SUB_ACE_flexGrow_Part_TEST_0200
     * @tc.name testFlexGrow
     * @tc.desc colum1 set layoutWeight(1),colum2、colum3 set flexGrow(2)
     */
    it('SUB_ACE_flexGrow_Part_TEST_0200', 0, async () => {
      console.info('[SUB_ACE_flexGrow_Part_TEST_0200] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'addflexGrow2', value: 2
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'addflexGrow3', value: 2
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexGrow_011: RectValue = CommonFunc.getComponentRect('Column_flexGrow_011');
      let Column_flexGrow_012: RectValue = CommonFunc.getComponentRect('Column_flexGrow_012');
      let Column_flexGrow_013: RectValue = CommonFunc.getComponentRect('Column_flexGrow_013');
      let Column_flexGrow_01: RectValue = CommonFunc.getComponentRect('Column_flexGrow_01');
      console.log('assert position')
      expect(Math.abs(Column_flexGrow_011.left - Column_flexGrow_01.left - Math.round(Column_flexGrow_01.right - Column_flexGrow_011.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_flexGrow_012.left - Column_flexGrow_01.left - Math.round(Column_flexGrow_01.right - Column_flexGrow_012.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_flexGrow_013.left - Column_flexGrow_01.left - Math.round(Column_flexGrow_01.right - Column_flexGrow_013.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_flexGrow_012.top - Column_flexGrow_011.bottom - Math.round(Column_flexGrow_013.top - Column_flexGrow_012.bottom)) <= 1)
        .assertTrue()
      console.log('assert space')
      expect(Math.abs(Column_flexGrow_012.top - Column_flexGrow_011.bottom - Math.round(vp2px(10))) <= 1).assertTrue();
      expect(Math.abs(Column_flexGrow_013.top - Column_flexGrow_012.bottom - Math.round(vp2px(10))) <= 1).assertTrue();
      console.log('Column_flexGrow_012.top - Column_flexGrow_011.bottom', +(Column_flexGrow_012.top - Column_flexGrow_011.bottom))
      console.log('Column_flexGrow_013.top - Column_flexGrow_012.bottom', +(Column_flexGrow_013.top - Column_flexGrow_012.bottom))
      expect(Math.abs(Column_flexGrow_01.top - Column_flexGrow_011.top) <= 1).assertTrue();
      expect(Math.abs(Column_flexGrow_013.bottom - Column_flexGrow_01.bottom) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs(Column_flexGrow_011.bottom - Column_flexGrow_011.top - Math.round(vp2px(250))) <= 1).assertTrue();
      console.log('Column_flexGrow_011.bottom - Column_flexGrow_011.top', +(Column_flexGrow_011.bottom - Column_flexGrow_011.top))
      expect(Math.abs(Column_flexGrow_012.bottom - Column_flexGrow_012.top - Math.round(vp2px(100))) <= 1).assertTrue();
      console.log('Column_flexGrow_012.bottom - Column_flexGrow_012.top', +(Column_flexGrow_012.bottom - Column_flexGrow_012.top))
      expect(Math.abs(Column_flexGrow_013.bottom - Column_flexGrow_013.top - Math.round(vp2px(100))) <= 1).assertTrue();
      console.log('Column_flexGrow_013.bottom - Column_flexGrow_013.top', +(Column_flexGrow_013.bottom - Column_flexGrow_013.top))
      console.log('assert weight')
      expect(Math.abs(Column_flexGrow_011.right - Column_flexGrow_011.left - Math.round(vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Column_flexGrow_012.right - Column_flexGrow_012.left - Math.round(vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Column_flexGrow_013.right - Column_flexGrow_013.left - Math.round(vp2px(300))) <= 1).assertTrue();
      console.info('[SUB_ACE_flexGrow_Part_TEST_0200] END');
    });
    /**
     * @tc.number SUB_ACE_flexGrow_Part_TEST_0300
     * @tc.name testFlexGrow
     * @tc.desc colum1 set layoutWeight(1),colum2、colum3 set flexGrow(3)
     */
    it('SUB_ACE_flexGrow_Part_TEST_0300', 0, async () => {
      console.info('[SUB_ACE_flexGrow_Part_TEST_0300] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'addflexGrow2', value: 3
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'addflexGrow3', value: 3
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexGrow_011: RectValue = CommonFunc.getComponentRect('Column_flexGrow_011');
      let Column_flexGrow_012: RectValue = CommonFunc.getComponentRect('Column_flexGrow_012');
      let Column_flexGrow_013: RectValue = CommonFunc.getComponentRect('Column_flexGrow_013');
      let Column_flexGrow_01: RectValue = CommonFunc.getComponentRect('Column_flexGrow_01');
      console.log('assert position')
      expect(Math.abs(Column_flexGrow_011.left - Column_flexGrow_01.left - Math.round(Column_flexGrow_01.right - Column_flexGrow_011.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_flexGrow_012.left - Column_flexGrow_01.left - Math.round(Column_flexGrow_01.right - Column_flexGrow_012.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_flexGrow_013.left - Column_flexGrow_01.left - Math.round(Column_flexGrow_01.right - Column_flexGrow_013.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_flexGrow_012.top - Column_flexGrow_011.bottom - Math.round(Column_flexGrow_013.top - Column_flexGrow_012.bottom)) <= 1)
        .assertTrue()
      console.log('assert space')
      expect(Math.abs(Column_flexGrow_012.top - Column_flexGrow_011.bottom - Math.round(vp2px(10))) <= 1).assertTrue();
      expect(Math.abs(Column_flexGrow_013.top - Column_flexGrow_012.bottom - Math.round(vp2px(10))) <= 1).assertTrue();
      console.log('Column_flexGrow_012.top - Column_flexGrow_011.bottom', +(Column_flexGrow_012.top - Column_flexGrow_011.bottom))
      console.log('Column_flexGrow_013.top - Column_flexGrow_012.bottom', +(Column_flexGrow_013.top - Column_flexGrow_012.bottom))
      expect(Math.abs(Column_flexGrow_01.top - Column_flexGrow_011.top) <= 1).assertTrue();
      expect(Math.abs(Column_flexGrow_013.bottom - Column_flexGrow_01.bottom) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs(Column_flexGrow_011.bottom - Column_flexGrow_011.top - Math.round(vp2px(250))) <= 1).assertTrue();
      console.log('Column_flexGrow_011.bottom - Column_flexGrow_011.top', +(Column_flexGrow_011.bottom - Column_flexGrow_011.top))
      expect(Math.abs(Column_flexGrow_012.bottom - Column_flexGrow_012.top - Math.round(vp2px(100))) <= 1).assertTrue();
      console.log('Column_flexGrow_012.bottom - Column_flexGrow_012.top', +(Column_flexGrow_012.bottom - Column_flexGrow_012.top))
      expect(Math.abs(Column_flexGrow_013.bottom - Column_flexGrow_013.top - Math.round(vp2px(100))) <= 1).assertTrue();
      console.log('Column_flexGrow_013.bottom - Column_flexGrow_013.top', +(Column_flexGrow_013.bottom - Column_flexGrow_013.top))
      console.log('assert weight')
      expect(Math.abs(Column_flexGrow_011.right - Column_flexGrow_011.left - Math.round(vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Column_flexGrow_012.right - Column_flexGrow_012.left - Math.round(vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Column_flexGrow_013.right - Column_flexGrow_013.left - Math.round(vp2px(300))) <= 1).assertTrue();
      console.info('[SUB_ACE_flexGrow_Part_TEST_0300] END');
    });
    /**
     * @tc.number SUB_ACE_flexGrow_Part_TEST_0400
     * @tc.name testFlexGrow
     * @tc.desc colum1 set layoutWeight(1),colum2、colum3 set flexGrow(3)
     */
    it('SUB_ACE_flexGrow_Part_TEST_0400', 0, async () => {
      console.info('[SUB_ACE_flexGrow_Part_TEST_0400] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'addflexGrow1', value: 3
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'addflexGrow2', value: 2
      });
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'addflexGrow3', value: 1
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexGrow_011: RectValue = CommonFunc.getComponentRect('Column_flexGrow_011');
      let Column_flexGrow_012: RectValue = CommonFunc.getComponentRect('Column_flexGrow_012');
      let Column_flexGrow_013: RectValue = CommonFunc.getComponentRect('Column_flexGrow_013');
      let Column_flexGrow_01: RectValue = CommonFunc.getComponentRect('Column_flexGrow_01');
      console.log('assert position')
      expect(Math.abs(Column_flexGrow_011.left - Column_flexGrow_01.left - Math.round(Column_flexGrow_01.right - Column_flexGrow_011.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_flexGrow_012.left - Column_flexGrow_01.left - Math.round(Column_flexGrow_01.right - Column_flexGrow_012.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_flexGrow_013.left - Column_flexGrow_01.left - Math.round(Column_flexGrow_01.right - Column_flexGrow_013.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_flexGrow_012.top - Column_flexGrow_011.bottom - Math.round(Column_flexGrow_013.top - Column_flexGrow_012.bottom)) <= 1)
        .assertTrue()
      console.log('assert space')
      expect(Math.abs(Column_flexGrow_012.top - Column_flexGrow_011.bottom - Math.round(vp2px(10))) <= 1).assertTrue();
      expect(Math.abs(Column_flexGrow_013.top - Column_flexGrow_012.bottom - Math.round(vp2px(10))) <= 1).assertTrue();
      console.log('Column_flexGrow_012.top - Column_flexGrow_011.bottom', +(Column_flexGrow_012.top - Column_flexGrow_011.bottom))
      console.log('Column_flexGrow_013.top - Column_flexGrow_012.bottom', +(Column_flexGrow_013.top - Column_flexGrow_012.bottom))
      expect(Math.abs(Column_flexGrow_01.top - Column_flexGrow_011.top) <= 1).assertTrue();
      expect(Math.abs(Column_flexGrow_013.bottom - Column_flexGrow_01.bottom) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs(Column_flexGrow_011.bottom - Column_flexGrow_011.top - Math.round(vp2px(250))) <= 1).assertTrue();
      console.log('Column_flexGrow_011.bottom - Column_flexGrow_011.top', +(Column_flexGrow_011.bottom - Column_flexGrow_011.top))
      expect(Math.abs(Column_flexGrow_012.bottom - Column_flexGrow_012.top - Math.round(vp2px(100))) <= 1).assertTrue();
      console.log('Column_flexGrow_012.bottom - Column_flexGrow_012.top', +(Column_flexGrow_012.bottom - Column_flexGrow_012.top))
      expect(Math.abs(Column_flexGrow_013.bottom - Column_flexGrow_013.top - Math.round(vp2px(100))) <= 1).assertTrue();
      console.log('Column_flexGrow_013.bottom - Column_flexGrow_013.top', +(Column_flexGrow_013.bottom - Column_flexGrow_013.top))
      console.log('assert weight')
      expect(Math.abs(Column_flexGrow_011.right - Column_flexGrow_011.left - Math.round(vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Column_flexGrow_012.right - Column_flexGrow_012.left - Math.round(vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Column_flexGrow_013.right - Column_flexGrow_013.left - Math.round(vp2px(300))) <= 1).assertTrue();
      console.info('[SUB_ACE_flexGrow_Part_TEST_0400] END');
    });
    /**
     * @tc.number SUB_ACE_flexGrow_Part_TEST_0500
     * @tc.name testFlexGrow
     * @tc.desc colum1、colum2 and colum3 do not set flexGrow
     */
    it('SUB_ACE_flexGrow_Part_TEST_0500', 0, async () => {
      console.info('[SUB_ACE_flexGrow_Part_TEST_0500] START');
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_flexGrow_021: RectValue = CommonFunc.getComponentRect('Column_flexGrow_021');
      let Column_flexGrow_022: RectValue = CommonFunc.getComponentRect('Column_flexGrow_022');
      let Column_flexGrow_023: RectValue = CommonFunc.getComponentRect('Column_flexGrow_023');
      let Column_flexGrow_02: RectValue = CommonFunc.getComponentRect('Column_flexGrow_02');
      console.log('assert position')
      expect(Math.abs(Column_flexGrow_021.left - Column_flexGrow_02.left - Math.round(Column_flexGrow_02.right - Column_flexGrow_021.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_flexGrow_022.left - Column_flexGrow_02.left - Math.round(Column_flexGrow_02.right - Column_flexGrow_022.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_flexGrow_023.left - Column_flexGrow_02.left - Math.round(Column_flexGrow_02.right - Column_flexGrow_023.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_flexGrow_022.top - Column_flexGrow_021.bottom - Math.round(Column_flexGrow_023.top - Column_flexGrow_022.bottom)) <= 1)
        .assertTrue()
      console.log('assert space')
      expect(Math.abs(Column_flexGrow_022.top - Column_flexGrow_021.bottom - Math.round(vp2px(10))) <= 1).assertTrue();
      expect(Math.abs(Column_flexGrow_023.top - Column_flexGrow_022.bottom - Math.round(vp2px(10))) <= 1).assertTrue();
      expect(Math.abs(Column_flexGrow_02.top - Column_flexGrow_021.top) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs(Column_flexGrow_021.bottom - Column_flexGrow_021.top - Math.round(vp2px(100))) <= 1).assertTrue();
      console.log('Column_flexGrow_021.bottom - Column_flexGrow_021.top', +(Column_flexGrow_021.bottom - Column_flexGrow_021.top))
      expect(Math.abs(Column_flexGrow_022.bottom - Column_flexGrow_022.top - Math.round(vp2px(100))) <= 1).assertTrue();
      console.log('Column_flexGrow_022.bottom - Column_flexGrow_022.top', +(Column_flexGrow_022.bottom - Column_flexGrow_022.top))
      expect(Math.abs(Column_flexGrow_023.bottom - Column_flexGrow_023.top - Math.round(vp2px(100))) <= 1).assertTrue();
      console.log('Column_flexGrow_023.bottom - Column_flexGrow_023.top', +(Column_flexGrow_023.bottom - Column_flexGrow_023.top))
      console.log('assert weight')
      expect(Math.abs(Column_flexGrow_021.right - Column_flexGrow_021.left - Math.round(vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Column_flexGrow_022.right - Column_flexGrow_022.left - Math.round(vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Column_flexGrow_023.right - Column_flexGrow_023.left - Math.round(vp2px(300))) <= 1).assertTrue();
      console.info('[SUB_ACE_flexGrow_Part_TEST_0500] END');
    });
  })
}