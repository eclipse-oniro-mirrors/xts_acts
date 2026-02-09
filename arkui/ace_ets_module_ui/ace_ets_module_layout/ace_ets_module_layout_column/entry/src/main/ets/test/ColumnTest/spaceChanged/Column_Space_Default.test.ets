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
import RectValue from '../../../MainAbility/common/Rect';
import CommonFunc from '../../../MainAbility/common/Common';
import GlobalContext from '../../../MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';

export default function Column_Space_Default() {
  describe('Column_Space_Default', () => {
    beforeEach(async () => {
      console.info("Column_Space_Default beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Column/spaceChanged/Column_Space_Default",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Column_Space_Default state pages:" + JSON.stringify(pages));
        if (!("Column_Space_Default" == pages.name)) {
          console.info("get Column_Space_Default pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Column_Space_Default page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Column_Space_Default page error " + JSON.stringify(err));
        expect().assertFail();
      }
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Column_Space_Default after each called")
    });

    /**
     * @tc.name   SUB_ACE_Column_Space_Default_TEST_0200
     * @tc.number SUB_ACE_Column_Space_Default_TEST_0200
     * @tc.desc   The value of space is set to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_Column_Space_Default_TEST_0200',  Level.LEVEL0, async () => {
      console.info('[SUB_ACE_Column_Space_Default_TEST_0200] START');
      GlobalContext.getContext().getObject<null>('value').message.notify({
        name: 'addSpace1', value: null
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_Default_011: RectValue = CommonFunc.getComponentRect('Column_Space_Default_011');
      let Column_Space_Default_012: RectValue = CommonFunc.getComponentRect('Column_Space_Default_012');
      let Column_Space_Default_013: RectValue = CommonFunc.getComponentRect('Column_Space_Default_013');
      let Column_Space_Default_01: RectValue = CommonFunc.getComponentRect('Column_Space_Default_01');
      console.log('assert position')
      expect(Math.abs(Column_Space_Default_011.left - Column_Space_Default_01.left - (Column_Space_Default_01.right - Column_Space_Default_011.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_Space_Default_012.left - Column_Space_Default_01.left - (Column_Space_Default_01.right - Column_Space_Default_012.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_Space_Default_013.left - Column_Space_Default_01.left - (Column_Space_Default_01.right - Column_Space_Default_013.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_Space_Default_012.top - Column_Space_Default_011.bottom - (Column_Space_Default_013.top - Column_Space_Default_012.bottom)) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs(Column_Space_Default_012.top - Column_Space_Default_011.bottom - vp2px(0)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_013.top - Column_Space_Default_012.bottom - vp2px(0)) <= 1).assertTrue();
      console.log('Column_Space_Default_012.top - Column_Space_Default_011.bottom', +(Column_Space_Default_012.top - Column_Space_Default_011.bottom))
      console.log('Column_Space_Default_013.top - Column_Space_Default_012.bottom', +(Column_Space_Default_013.top - Column_Space_Default_012.bottom))
      expect(Math.abs(Column_Space_Default_01.top - Column_Space_Default_011.top) <= 1).assertTrue();
      expect(Column_Space_Default_013.bottom).assertLess(Column_Space_Default_01.bottom);
      console.log('assert height')
      expect(Math.abs(Column_Space_Default_011.bottom - Column_Space_Default_011.top - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_012.bottom - Column_Space_Default_012.top - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_013.bottom - Column_Space_Default_013.top - vp2px(150)) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.abs(Column_Space_Default_011.right - Column_Space_Default_011.left - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_012.right - Column_Space_Default_012.left - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_013.right - Column_Space_Default_013.left - vp2px(300)) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_Default_TEST_0200] END');
    });
    /**
     * @tc.name   SUB_ACE_Column_Space_Default_TEST_0300
     * @tc.number SUB_ACE_Column_Space_Default_TEST_0300
     * @tc.desc   The value of space is set to -10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_Column_Space_Default_TEST_0300',  Level.LEVEL0, async () => {
      console.info('[SUB_ACE_Column_Space_Default_TEST_0300] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'addSpace1', value: -10
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_Default_011: RectValue = CommonFunc.getComponentRect('Column_Space_Default_011');
      let Column_Space_Default_012: RectValue = CommonFunc.getComponentRect('Column_Space_Default_012');
      let Column_Space_Default_013: RectValue = CommonFunc.getComponentRect('Column_Space_Default_013');
      let Column_Space_Default_01: RectValue = CommonFunc.getComponentRect('Column_Space_Default_01');
      console.log('assert position')
      expect(Math.abs(Column_Space_Default_011.left - Column_Space_Default_01.left - (Column_Space_Default_01.right - Column_Space_Default_011.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_Space_Default_012.left - Column_Space_Default_01.left - (Column_Space_Default_01.right - Column_Space_Default_012.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_Space_Default_013.left - Column_Space_Default_01.left - (Column_Space_Default_01.right - Column_Space_Default_013.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_Space_Default_012.top - Column_Space_Default_011.bottom - (Column_Space_Default_013.top - Column_Space_Default_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_Space_Default_012.top - Column_Space_Default_011.bottom - vp2px(0)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_013.top - Column_Space_Default_012.bottom - vp2px(0)) <= 1).assertTrue();
      console.log('Column_Space_Default_012.top - Column_Space_Default_011.bottom', +(Column_Space_Default_012.top - Column_Space_Default_011.bottom))
      console.log('Column_Space_Default_013.top - Column_Space_Default_012.bottom', +(Column_Space_Default_013.top - Column_Space_Default_012.bottom))
      expect(Math.abs(Column_Space_Default_01.top - Column_Space_Default_011.top) <= 1).assertTrue();
      expect(Column_Space_Default_013.bottom).assertLess(Column_Space_Default_01.bottom);
      console.log('assert height')
      expect(Math.abs(Column_Space_Default_011.bottom - Column_Space_Default_011.top - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_012.bottom - Column_Space_Default_012.top - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_013.bottom - Column_Space_Default_013.top - vp2px(150)) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.abs(Column_Space_Default_011.right - Column_Space_Default_011.left - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_012.right - Column_Space_Default_012.left - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_013.right - Column_Space_Default_013.left - vp2px(300)) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_Default_TEST_0300] END');
    });
    /**
     * @tc.name   SUB_ACE_Column_Space_Default_TEST_0400
     * @tc.number SUB_ACE_Column_Space_Default_TEST_0400
     * @tc.desc   The value of space is set to 'abc'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_Column_Space_Default_TEST_0400',  Level.LEVEL0, async () => {
      console.info('[SUB_ACE_Column_Space_Default_TEST_0400] START');
      GlobalContext.getContext().getObject<string>('value').message.notify({
        name: 'addSpace2', value: 'abc'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_Default_021: RectValue = CommonFunc.getComponentRect('Column_Space_Default_021');
      let Column_Space_Default_022: RectValue = CommonFunc.getComponentRect('Column_Space_Default_022');
      let Column_Space_Default_023: RectValue = CommonFunc.getComponentRect('Column_Space_Default_023');
      let Column_Space_Default_02: RectValue = CommonFunc.getComponentRect('Column_Space_Default_02');
      console.log('assert position')
      expect(Math.abs(Column_Space_Default_021.left - Column_Space_Default_02.left - (Column_Space_Default_02.right - Column_Space_Default_021.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_Space_Default_022.left - Column_Space_Default_02.left - (Column_Space_Default_02.right - Column_Space_Default_022.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_Space_Default_023.left - Column_Space_Default_02.left - (Column_Space_Default_02.right - Column_Space_Default_023.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_Space_Default_022.top - Column_Space_Default_021.bottom - (Column_Space_Default_023.top - Column_Space_Default_022.bottom)) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs(Column_Space_Default_022.top - Column_Space_Default_021.bottom - vp2px(0)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_023.top - Column_Space_Default_022.bottom - vp2px(0)) <= 1).assertTrue();
      console.log('Column_Space_Default_022.top - Column_Space_Default_021.bottom', +(Column_Space_Default_022.top - Column_Space_Default_021.bottom))
      console.log('Column_Space_Default_023.top - Column_Space_Default_022.bottom', +(Column_Space_Default_023.top - Column_Space_Default_022.bottom))
      expect(Math.abs(Column_Space_Default_02.top - Column_Space_Default_021.top) <= 1).assertTrue();
      expect(Column_Space_Default_023.bottom).assertLess(Column_Space_Default_02.bottom);
      console.log('assert height')
      expect(Math.abs(Column_Space_Default_021.bottom - Column_Space_Default_021.top - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_022.bottom - Column_Space_Default_022.top - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_023.bottom - Column_Space_Default_023.top - vp2px(150)) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.abs(Column_Space_Default_021.right - Column_Space_Default_021.left - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_022.right - Column_Space_Default_022.left - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_023.right - Column_Space_Default_023.left - vp2px(300)) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_Default_TEST_0400] END');
    });
    /**
     * @tc.name   SUB_ACE_Column_Space_Default_TEST_0500
     * @tc.number SUB_ACE_Column_Space_Default_TEST_0500
     * @tc.desc   The value of space is set to '80%'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_Column_Space_Default_TEST_0500',  Level.LEVEL0, async () => {
      console.info('[SUB_ACE_Column_Space_Default_TEST_0500] START');
      GlobalContext.getContext().getObject<string>('value').message.notify({
        name: 'addSpace2', value: '80%'
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_Default_021: RectValue = CommonFunc.getComponentRect('Column_Space_Default_021');
      let Column_Space_Default_022: RectValue = CommonFunc.getComponentRect('Column_Space_Default_022');
      let Column_Space_Default_023: RectValue = CommonFunc.getComponentRect('Column_Space_Default_023');
      let Column_Space_Default_02: RectValue = CommonFunc.getComponentRect('Column_Space_Default_02');
      console.log('assert position')
      expect(Math.abs(Column_Space_Default_021.left - Column_Space_Default_02.left - (Column_Space_Default_02.right - Column_Space_Default_021.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_Space_Default_022.left - Column_Space_Default_02.left - (Column_Space_Default_02.right - Column_Space_Default_022.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_Space_Default_023.left - Column_Space_Default_02.left - (Column_Space_Default_02.right - Column_Space_Default_023.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_Space_Default_022.top - Column_Space_Default_021.bottom - (Column_Space_Default_023.top - Column_Space_Default_022.bottom)) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs(Column_Space_Default_022.top - Column_Space_Default_021.bottom - vp2px(0)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_023.top - Column_Space_Default_022.bottom - vp2px(0)) <= 1).assertTrue();
      console.log('Column_Space_Default_022.top - Column_Space_Default_021.bottom', +(Column_Space_Default_022.top - Column_Space_Default_021.bottom))
      console.log('Column_Space_Default_023.top - Column_Space_Default_022.bottom', +(Column_Space_Default_023.top - Column_Space_Default_022.bottom))
      expect(Math.abs(Column_Space_Default_02.top - Column_Space_Default_021.top) <= 1).assertTrue();
      expect(Column_Space_Default_023.bottom).assertLess(Column_Space_Default_02.bottom);
      console.log('assert height')
      expect(Math.abs(Column_Space_Default_021.bottom - Column_Space_Default_021.top - vp2px(50)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_022.bottom - Column_Space_Default_022.top - vp2px(100)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_023.bottom - Column_Space_Default_023.top - vp2px(150)) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.abs(Column_Space_Default_021.right - Column_Space_Default_021.left - (vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_022.right - Column_Space_Default_022.left - (vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_023.right - Column_Space_Default_023.left - (vp2px(300))) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_Default_TEST_0500] END');
    });
    /**
     * @tc.name   SUB_ACE_Column_Space_Default_TEST_0100
     * @tc.number SUB_ACE_Column_Space_Default_TEST_0100
     * @tc.desc   The value of space is set to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_Column_Space_Default_TEST_0100',  Level.LEVEL0, async () => {
      console.info('[SUB_ACE_Column_Space_Default_TEST_0100] START');
      GlobalContext.getContext().getObject<undefined>('value').message.notify({
        name: 'addSpace1', value: undefined
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Column_Space_Default_011: RectValue = CommonFunc.getComponentRect('Column_Space_Default_011');
      let Column_Space_Default_012: RectValue = CommonFunc.getComponentRect('Column_Space_Default_012');
      let Column_Space_Default_013: RectValue = CommonFunc.getComponentRect('Column_Space_Default_013');
      let Column_Space_Default_01: RectValue = CommonFunc.getComponentRect('Column_Space_Default_01');
      console.log('assert position')
      expect(Math.abs(Column_Space_Default_011.left - Column_Space_Default_01.left - (Column_Space_Default_01.right - Column_Space_Default_011.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_Space_Default_012.left - Column_Space_Default_01.left - (Column_Space_Default_01.right - Column_Space_Default_012.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_Space_Default_013.left - Column_Space_Default_01.left - (Column_Space_Default_01.right - Column_Space_Default_013.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Column_Space_Default_012.top - Column_Space_Default_011.bottom - (Column_Space_Default_013.top - Column_Space_Default_012.bottom)) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs(Column_Space_Default_012.top - Column_Space_Default_011.bottom - vp2px(0)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_013.top - Column_Space_Default_012.bottom - vp2px(0)) <= 1).assertTrue();
      console.log('Column_Space_Default_012.top - Column_Space_Default_011.bottom', +(Column_Space_Default_012.top - Column_Space_Default_011.bottom))
      console.log('Column_Space_Default_013.top - Column_Space_Default_012.bottom', +(Column_Space_Default_013.top - Column_Space_Default_012.bottom))
      expect(Math.abs(Column_Space_Default_01.top - Column_Space_Default_011.top) <= 1).assertTrue();
      expect(Column_Space_Default_013.bottom).assertLess(Column_Space_Default_01.bottom);
      console.log('assert height')
      expect(Math.round(Column_Space_Default_011.bottom - Column_Space_Default_011.top - vp2px(50)) <= 1).assertTrue();
      expect(Math.round(Column_Space_Default_012.bottom - Column_Space_Default_012.top - vp2px(100)) <= 1).assertTrue();
      expect(Math.round(Column_Space_Default_013.bottom - Column_Space_Default_013.top - vp2px(150)) <= 1).assertTrue();
      console.log('assert weight')
      expect(Math.abs(Column_Space_Default_011.right - Column_Space_Default_011.left - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_012.right - Column_Space_Default_012.left - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs(Column_Space_Default_013.right - Column_Space_Default_013.left - vp2px(300)) <= 1).assertTrue();
      console.info('[SUB_ACE_Column_Space_Default_TEST_0100] END');
    });
  })
}