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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';
import { Driver, ON } from '@ohos.UiTest';

export default function OnlyRowsTemplate1() {
  describe('OnlyRowsTemplate1', () => {
    beforeEach(async (done: Function) => {
      console.info("GridFrictionPage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/OnlyRowsTemplate/OnlyRowsTemplate1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get OnlyRowsTemplate1 state pages:" + JSON.stringify(pages));
        if (!("GridFrictionPage" == pages.name)) {
          console.info("get OnlyRowsTemplate1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push OnlyRowsTemplate1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OnlyRowsTemplate1 page error:" + err);
      }
      console.info("OnlyRowsTemplate1 beforeEach end");
      done();
    });
    afterEach(async () => {
      console.info("OnlyRowsTemplate1 after each called");
    });


    /**
     * @tc.name   SUB_ACE_GRID_OnlyRowsTemplate1_0100
     * @tc.number SUB_ACE_GRID_OnlyRowsTemplate1_0100
     * @tc.desc   GridItem1 and GridItem2 have the same rowStart and rowEnd settings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_GRID_OnlyRowsTemplate1_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_GRID_OnlyRowsTemplate1_0100] START');
      await CommonFunc.sleep(2000);

      console.log('get Initial value')
      let GridItem_01: RectValue = CommonFunc.getComponentRect('OnlyRowsTemplate1_GridItem_01');
      let GridItem_02: RectValue = CommonFunc.getComponentRect('OnlyRowsTemplate1_GridItem_02');

      console.log('assert position')
      expect(Math.abs(GridItem_01.top - GridItem_02.top) <= 1).assertTrue();
      console.log('GridItem_01.top' + GridItem_01.top)
      console.log('GridItem_02.top' + GridItem_02.top)

      console.log('assert space')
      expect(Math.abs(GridItem_02.left - GridItem_01.right - vp2px(10)) <= 1).assertTrue();
      console.log('GridItem_02.left - GridItem_01.right' + (GridItem_02.left - GridItem_01.right))

      console.log('assert size')
      expect(Math.abs(GridItem_01.right - GridItem_01.left - vp2px(100)) <= 1).assertTrue();
      console.log('GGridItem_01.right - GridItem_01.left' + (GridItem_01.right - GridItem_01.left))
      expect(Math.abs(GridItem_01.bottom - GridItem_01.top - vp2px(154)) <= 1).assertTrue();
      console.log('GGridItem_01.bottom - GridItem_01.top' + (GridItem_01.bottom - GridItem_01.top))

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let button = await driver.findComponent(ON.id('OnlyRowsTemplate1_button'));
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('[SUB_ACE_GRID_OnlyRowsTemplate1_0100] END');
      done();
    });
    /**
     * @tc.name   SUB_ACE_GRID_OnlyRowsTemplate1_0200
     * @tc.number SUB_ACE_GRID_OnlyRowsTemplate1_0200
     * @tc.desc   GridItem set rowStart to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_GRID_OnlyRowsTemplate1_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_GRID_OnlyRowsTemplate1_0200] START');
      globalThis.value.message.notify({
        name: 'rowStart1', value: 0
      })
      globalThis.value.message.notify({
        name: 'rowEnd1', value: 1
      })
      globalThis.value.message.notify({
        name: 'rowStart2', value: 2
      })
      globalThis.value.message.notify({
        name: 'rowEnd2', value: 3
      })
      await CommonFunc.sleep(2000);

      console.log('get Initial value')
      let GridItem_01: RectValue = CommonFunc.getComponentRect('OnlyRowsTemplate1_GridItem_01');

      console.log('assert size')
      expect(Math.abs(GridItem_01.right - GridItem_01.left - vp2px(100)) <= 1).assertTrue();
      console.log('GGridItem_01.right - GridItem_01.left' + (GridItem_01.right - GridItem_01.left))
      expect(Math.abs(GridItem_01.bottom - GridItem_01.top - vp2px(154)) <= 1).assertTrue();
      console.log('GGridItem_01.bottom - GridItem_01.top' + (GridItem_01.bottom - GridItem_01.top))

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let button = await driver.findComponent(ON.id('OnlyRowsTemplate1_button'));
      await button.click();
      await CommonFunc.sleep(1000);
      console.info('[SUB_ACE_GRID_OnlyRowsTemplate1_0200] END');
      done();
    });


  })
}
