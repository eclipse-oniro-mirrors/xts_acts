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

export default function layoutWeight_flexShrink() {
  describe('layoutWeight_flexShrink', () => {
    beforeEach(async () => {
      console.info("layoutWeight_flexShrink beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Column/layoutWeight/layoutWeight_flexShrink",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get layoutWeight_flexShrink state pages:" + JSON.stringify(pages));
        if (!("layoutWeight_flexShrink" == pages.name)) {
          console.info("get layoutWeight_flexShrink pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push layoutWeight_flexShrink page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push layoutWeight_flexShrink page error " + JSON.stringify(err));
        expect().assertFail();
      }
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("layoutWeight_flexShrink after each called")
    });
    /**
     * @tc.number SUB_ACE_layoutWeight_flexShrink_TEST_0100
     * @tc.name testLayoutWeight
     * @tc.desc colum1, column2, column3 set layoutWeight(3), layoutWeight(2), layoutWeight(1),the layoutWeight property takes precedence over flexShrink,the height ratio of colum1, column2, and column3 is 3:2:1
     */
    it('SUB_ACE_layoutWeight_flexShrink_TEST_0100', 0, async () => {
      console.info('[SUB_ACE_layoutWeight_flexShrink_TEST_0100] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'addLayoutWeight', value: 1
      });
      await CommonFunc.sleep(3000);
      let Column_layoutWeight_011: RectValue = CommonFunc.getComponentRect('Column_layoutWeight_011');
      let Column_layoutWeight_012: RectValue = CommonFunc.getComponentRect('Column_layoutWeight_012');
      let Column_layoutWeight_013: RectValue = CommonFunc.getComponentRect('Column_layoutWeight_013');
      let Column_layoutWeight_01: RectValue = CommonFunc.getComponentRect('Column_layoutWeight_01');
      console.log('assert position')
      expect(Math.abs((Math.round(Column_layoutWeight_011.left - Column_layoutWeight_01.left)) - (Math.round(Column_layoutWeight_01.right - Column_layoutWeight_011.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_012.left - Column_layoutWeight_01.left)) - (Math.round(Column_layoutWeight_01.right - Column_layoutWeight_012.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_013.left - Column_layoutWeight_01.left)) - (Math.round(Column_layoutWeight_01.right - Column_layoutWeight_013.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_012.top - Column_layoutWeight_011.bottom)) - (Math.round(Column_layoutWeight_013.top - Column_layoutWeight_012.bottom))) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs((Math.round(Column_layoutWeight_012.top - Column_layoutWeight_011.bottom)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_013.top - Column_layoutWeight_012.bottom)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      console.log('Column_layoutWeight_012.top - Column_layoutWeight_011.bottom', +(Column_layoutWeight_012.top - Column_layoutWeight_011.bottom))
      console.log('Column_layoutWeight_013.top - Column_layoutWeight_012.bottom', +(Column_layoutWeight_013.top - Column_layoutWeight_012.bottom))
      expect(Math.abs((Column_layoutWeight_01.top) - (Column_layoutWeight_011.top)) <= 1).assertTrue();
      expect(Math.abs((Column_layoutWeight_013.bottom) - (Column_layoutWeight_01.bottom)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs((Math.round(Column_layoutWeight_011.bottom - Column_layoutWeight_011.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.log('Column_layoutWeight_011.bottom - Column_layoutWeight_011.top', +(Column_layoutWeight_011.bottom - Column_layoutWeight_011.top))
      expect(Math.abs((Math.round(Column_layoutWeight_012.bottom - Column_layoutWeight_012.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.log('Column_layoutWeight_012.bottom - Column_layoutWeight_012.top', +(Column_layoutWeight_012.bottom - Column_layoutWeight_012.top))
      expect(Math.abs((Math.round(Column_layoutWeight_013.bottom - Column_layoutWeight_013.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.log('Column_layoutWeight_013.bottom - Column_layoutWeight_013.top', +(Column_layoutWeight_013.bottom - Column_layoutWeight_013.top))
      console.log('assert weight')
      expect(Math.abs((Math.round(Column_layoutWeight_011.right - Column_layoutWeight_011.left)) - (Math.round(vp2px(300)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_012.right - Column_layoutWeight_012.left)) - (Math.round(vp2px(300)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_013.right - Column_layoutWeight_013.left)) - (Math.round(vp2px(300)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_layoutWeight_flexShrink_TEST_0100] END');
    });
    /**
     * @tc.number SUB_ACE_layoutWeight_flexShrink_TEST_0200
     * @tc.name testLayoutWeight
     * @tc.desc colum1, column2, column3 set layoutWeight(3), layoutWeight(2), layoutWeight(1),the layoutWeight property takes precedence over flexShrink,the height ratio of colum1, column2, and column3 is 3:2:1
     */
    it('SUB_ACE_layoutWeight_flexShrink_TEST_0200', 0, async () => {
      console.info('[SUB_ACE_layoutWeight_flexShrink_TEST_0200] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'addLayoutWeight', value: 2
      });
      await CommonFunc.sleep(3000);
      let Column_layoutWeight_011: RectValue = CommonFunc.getComponentRect('Column_layoutWeight_011');
      let Column_layoutWeight_012: RectValue = CommonFunc.getComponentRect('Column_layoutWeight_012');
      let Column_layoutWeight_013: RectValue = CommonFunc.getComponentRect('Column_layoutWeight_013');
      let Column_layoutWeight_01: RectValue = CommonFunc.getComponentRect('Column_layoutWeight_01');
      console.log('assert position')
      expect(Math.abs((Math.round(Column_layoutWeight_011.left - Column_layoutWeight_01.left)) - (Math.round(Column_layoutWeight_01.right - Column_layoutWeight_011.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_012.left - Column_layoutWeight_01.left)) - (Math.round(Column_layoutWeight_01.right - Column_layoutWeight_012.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_013.left - Column_layoutWeight_01.left)) - (Math.round(Column_layoutWeight_01.right - Column_layoutWeight_013.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_012.top - Column_layoutWeight_011.bottom)) - (Math.round(Column_layoutWeight_013.top - Column_layoutWeight_012.bottom))) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs((Math.round(Column_layoutWeight_012.top - Column_layoutWeight_011.bottom)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_013.top - Column_layoutWeight_012.bottom)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      console.log('Column_layoutWeight_012.top - Column_layoutWeight_011.bottom', +(Column_layoutWeight_012.top - Column_layoutWeight_011.bottom))
      console.log('Column_layoutWeight_013.top - Column_layoutWeight_012.bottom', +(Column_layoutWeight_013.top - Column_layoutWeight_012.bottom))
      expect(Math.abs((Column_layoutWeight_01.top) - (Column_layoutWeight_011.top)) <= 1).assertTrue();
      expect(Math.abs((Column_layoutWeight_013.bottom) - (Column_layoutWeight_01.bottom)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs((Math.round(Column_layoutWeight_011.bottom - Column_layoutWeight_011.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.log('Column_layoutWeight_011.bottom - Column_layoutWeight_011.top', +(Column_layoutWeight_011.bottom - Column_layoutWeight_011.top))
      expect(Math.abs((Math.round(Column_layoutWeight_012.bottom - Column_layoutWeight_012.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.log('Column_layoutWeight_012.bottom - Column_layoutWeight_012.top', +(Column_layoutWeight_012.bottom - Column_layoutWeight_012.top))
      expect(Math.abs((Math.round(Column_layoutWeight_013.bottom - Column_layoutWeight_013.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.log('Column_layoutWeight_013.bottom - Column_layoutWeight_013.top', +(Column_layoutWeight_013.bottom - Column_layoutWeight_013.top))
      console.log('assert weight')
      expect(Math.abs((Math.round(Column_layoutWeight_011.right - Column_layoutWeight_011.left)) - (Math.round(vp2px(300)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_012.right - Column_layoutWeight_012.left)) - (Math.round(vp2px(300)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_013.right - Column_layoutWeight_013.left)) - (Math.round(vp2px(300)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_layoutWeight_flexShrink_TEST_0200] END');
    });
    /**
     * @tc.number SUB_ACE_layoutWeight_flexShrink_TEST_0300
     * @tc.name testLayoutWeight
     * @tc.desc colum1, column2, column3 set layoutWeight(3), layoutWeight(2), layoutWeight(1),the layoutWeight property takes precedence over flexShrink,the height ratio of colum1, column2, and column3 is 3:2:1
     */
    it('SUB_ACE_layoutWeight_flexShrink_TEST_0300', 0, async () => {
      console.info('[SUB_ACE_layoutWeight_flexShrink_TEST_0300] START');
      GlobalContext.getContext().getObject<number>('value').message.notify({
        name: 'addLayoutWeight', value: 3
      });
      await CommonFunc.sleep(3000);
      let Column_layoutWeight_011: RectValue = CommonFunc.getComponentRect('Column_layoutWeight_011');
      let Column_layoutWeight_012: RectValue = CommonFunc.getComponentRect('Column_layoutWeight_012');
      let Column_layoutWeight_013: RectValue = CommonFunc.getComponentRect('Column_layoutWeight_013');
      let Column_layoutWeight_01: RectValue = CommonFunc.getComponentRect('Column_layoutWeight_01');
      console.log('assert position')
      expect(Math.abs((Math.round(Column_layoutWeight_011.left - Column_layoutWeight_01.left)) - (Math.round(Column_layoutWeight_01.right - Column_layoutWeight_011.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_012.left - Column_layoutWeight_01.left)) - (Math.round(Column_layoutWeight_01.right - Column_layoutWeight_012.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_013.left - Column_layoutWeight_01.left)) - (Math.round(Column_layoutWeight_01.right - Column_layoutWeight_013.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_012.top - Column_layoutWeight_011.bottom)) - (Math.round(Column_layoutWeight_013.top - Column_layoutWeight_012.bottom))) <= 1)
        .assertTrue();
      console.log('assert space')
      expect(Math.abs((Math.round(Column_layoutWeight_012.top - Column_layoutWeight_011.bottom)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_013.top - Column_layoutWeight_012.bottom)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      console.log('Column_layoutWeight_012.top - Column_layoutWeight_011.bottom', +(Column_layoutWeight_012.top - Column_layoutWeight_011.bottom))
      console.log('Column_layoutWeight_013.top - Column_layoutWeight_012.bottom', +(Column_layoutWeight_013.top - Column_layoutWeight_012.bottom))
      expect(Math.abs((Column_layoutWeight_01.top) - (Column_layoutWeight_011.top)) <= 1).assertTrue();
      expect(Math.abs((Column_layoutWeight_013.bottom) - (Column_layoutWeight_01.bottom)) <= 1).assertTrue();
      console.log('assert height')
      expect(Math.abs((Math.round(Column_layoutWeight_011.bottom - Column_layoutWeight_011.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.log('Column_layoutWeight_011.bottom - Column_layoutWeight_011.top', +(Column_layoutWeight_011.bottom - Column_layoutWeight_011.top))
      expect(Math.abs((Math.round(Column_layoutWeight_012.bottom - Column_layoutWeight_012.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.log('Column_layoutWeight_012.bottom - Column_layoutWeight_012.top', +(Column_layoutWeight_012.bottom - Column_layoutWeight_012.top))
      expect(Math.abs((Math.round(Column_layoutWeight_013.bottom - Column_layoutWeight_013.top)) - (Math.round(vp2px(150)))) <= 1)
        .assertTrue();
      console.log('Column_layoutWeight_013.bottom - Column_layoutWeight_013.top', +(Column_layoutWeight_013.bottom - Column_layoutWeight_013.top))
      console.log('assert weight')
      expect(Math.abs((Math.round(Column_layoutWeight_011.right - Column_layoutWeight_011.left)) - (Math.round(vp2px(300)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_012.right - Column_layoutWeight_012.left)) - (Math.round(vp2px(300)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Column_layoutWeight_013.right - Column_layoutWeight_013.left)) - (Math.round(vp2px(300)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_layoutWeight_flexShrink_TEST_0300] END');
    });
  })
}