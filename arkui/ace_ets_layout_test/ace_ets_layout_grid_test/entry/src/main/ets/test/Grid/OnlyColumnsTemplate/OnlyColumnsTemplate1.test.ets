/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import { Driver, ON } from '@ohos.UiTest';

export default function OnlyColumnsTemplate1() {
  describe('OnlyColumnsTemplate1', () => {
    beforeEach(async (done: Function) => {
      console.info("GridFrictionPage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/OnlyColumnsTemplate/OnlyColumnsTemplate1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get OnlyColumnsTemplate1 state pages:" + JSON.stringify(pages));
        if (!("GridFrictionPage" == pages.name)) {
          console.info("get OnlyColumnsTemplate1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push OnlyColumnsTemplate1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OnlyColumnsTemplate1 page error:" + err);
      }
      console.info("OnlyColumnsTemplate1 beforeEach end");
      done();
    });
    afterEach(async () => {
      console.info("OnlyColumnsTemplate1 after each called");
    });


    /**
     * @tc.number SUB_ACE_GRID_OnlyColumnsTemplate1_0100
     * @tc.name testGrid
     * @tc.desc GridItem1 and GridItem2 have the same columnStart and columnEnd settings
     */
    it('SUB_ACE_GRID_OnlyColumnsTemplate1_0100', 0, async (done: Function) => {
      console.info('[SUB_ACE_GRID_OnlyColumnsTemplate1_0100] START');
      await CommonFunc.sleep(2000);

      console.log('get Initial value')
      let GridItem_01: RectValue = CommonFunc.getComponentRect('OnlyColumnsTemplate1_GridItem_01');
      let GridItem_02: RectValue = CommonFunc.getComponentRect('OnlyColumnsTemplate1_GridItem_02');

      console.log('assert position')
      expect(GridItem_01.left).assertEqual(GridItem_02.left);
      console.log('GridItem_01.left' + GridItem_01.left)
      console.log('GridItem_02.left' + GridItem_02.left)

      console.log('assert space')
      expect(Math.abs(Math.round(GridItem_02.top - GridItem_01.bottom) -
        Math.round(vp2px(10))) <= 1).assertTrue();
      console.log('GridItem_02.top - GridItem_01.bottom' + (GridItem_02.top - GridItem_01.bottom))

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let button = await driver.findComponent(ON.id('OnlyColumnsTemplate1_button'));
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('[SUB_ACE_GRID_OnlyColumnsTemplate1_0100] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_GRID_OnlyColumnsTemplate1_0200
     * @tc.name testGrid
     * @tc.desc GridItem set columnStart to 0
     */
    it('SUB_ACE_GRID_OnlyColumnsTemplate1_0200', 0, async (done: Function) => {
      console.info('[SUB_ACE_GRID_OnlyColumnsTemplate1_0200] START');
      globalThis.value.message.notify({
        name: 'columnStart1', value: 0
      })
      globalThis.value.message.notify({
        name: 'columnEnd1', value: 1
      })
      globalThis.value.message.notify({
        name: 'columnStart2', value: 2
      })
      globalThis.value.message.notify({
        name: 'columnEnd2', value: 3
      })
      await CommonFunc.sleep(2000);

      console.log('get Initial value')
      let GridItem_01: RectValue = CommonFunc.getComponentRect('OnlyColumnsTemplate1_GridItem_01');
      let GridItem_02: RectValue = CommonFunc.getComponentRect('OnlyColumnsTemplate1_GridItem_02');


      console.log('assert size')
      expect(Math.abs(Math.round(GridItem_01.right - GridItem_01.left) - Math.round(vp2px(114))) <= 1).assertTrue();
      console.log('GGridItem_01.right - GridItem_01.left' + (GridItem_01.right - GridItem_01.left))
      expect(Math.abs(Math.round(GridItem_01.bottom - GridItem_01.top) - Math.round(vp2px(50))) <= 1).assertTrue();
      console.log('GGridItem_01.bottom - GridItem_01.top' + (GridItem_01.bottom - GridItem_01.top))

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let button = await driver.findComponent(ON.id('OnlyColumnsTemplate1_button'));
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('[SUB_ACE_GRID_OnlyColumnsTemplate1_0200] END');
      done();
    });


  })
}
