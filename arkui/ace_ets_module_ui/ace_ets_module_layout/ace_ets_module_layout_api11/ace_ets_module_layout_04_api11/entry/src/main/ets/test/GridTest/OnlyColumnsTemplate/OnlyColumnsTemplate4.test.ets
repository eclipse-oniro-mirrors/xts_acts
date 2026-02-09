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

export default function OnlyColumnsTemplate4() {
  describe('OnlyColumnsTemplate4', () => {
    beforeEach(async (done: Function) => {
      console.info("GridFrictionPage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/OnlyColumnsTemplate/OnlyColumnsTemplate1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get OnlyColumnsTemplate4 state pages:" + JSON.stringify(pages));
        if (!("GridFrictionPage" == pages.name)) {
          console.info("get OnlyColumnsTemplate4 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push OnlyColumnsTemplate4 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OnlyColumnsTemplate4 page error:" + err);
      }
      console.info("OnlyColumnsTemplate4 beforeEach end");
      done();
    });
    afterEach(async () => {
      console.info("OnlyColumnsTemplate4 after each called");
    });

    /**
     * @tc.name   SUB_ACE_GRID_OnlyColumnsTemplate4_0300
     * @tc.number SUB_ACE_GRID_OnlyColumnsTemplate4_0300
     * @tc.desc   GridItem sets columnStart to be greater than the total number of columns
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_GRID_OnlyColumnsTemplate4_0300',  Level.LEVEL0, async (done: Function) => {

      console.info('[SUB_ACE_GRID_OnlyColumnsTemplate4_0300] START');
      await CommonFunc.sleep(2000);
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let button = await driver.findComponent(ON.id('OnlyColumnsTemplate1_button'));
      await button.click();
      await CommonFunc.sleep(2000);
      let GridItem_01: RectValue = CommonFunc.getComponentRect('OnlyColumnsTemplate1_GridItem_01');
      let GridItem_02: RectValue = CommonFunc.getComponentRect('OnlyColumnsTemplate1_GridItem_02');
      await CommonFunc.sleep(2000);
      globalThis.value.message.notify({
        name: 'columnStart1', value: 5
      })
      globalThis.value.message.notify({
        name: 'columnEnd1', value: 1
      })
      globalThis.value.message.notify({
        name: 'columnStart2', value: 5
      })
      globalThis.value.message.notify({
        name: 'columnEnd2', value: 1
      })
      await CommonFunc.sleep(2000);

      console.log('get Initial value')
      let GridItem_011: RectValue = CommonFunc.getComponentRect('OnlyColumnsTemplate1_GridItem_01');
      let GridItem_022: RectValue = CommonFunc.getComponentRect('OnlyColumnsTemplate1_GridItem_02');


      console.log('assert size')
	  expect(Math.abs(Math.round(GridItem_011.right - GridItem_011.left) - Math.round(vp2px(52))) <= 1).assertTrue();
      console.log('GridItem_011.right - GridItem_011.left' + (GridItem_011.right - GridItem_011.left))
	  expect(Math.abs(Math.round(GridItem_011.bottom - GridItem_011.top) - Math.round(vp2px(50))) <= 1).assertTrue();
      console.log('GridItem_011.bottom - GridItem_011.top' + (GridItem_011.bottom - GridItem_011.top))

      console.info('[SUB_ACE_GRID_OnlyColumnsTemplate4_0300] END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_GRID_OnlyColumnsTemplate4_0500
     * @tc.number SUB_ACE_GRID_OnlyColumnsTemplate4_0500
     * @tc.desc   GridItem sets columnStart to a negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_GRID_OnlyColumnsTemplate4_0500',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_GRID_OnlyColumnsTemplate4_0500] START');
      await CommonFunc.sleep(2000);
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let button = await driver.findComponent(ON.id('OnlyColumnsTemplate1_button'));
      await button.click();
      await CommonFunc.sleep(1000);
      let GridItem_01: RectValue = CommonFunc.getComponentRect('OnlyColumnsTemplate1_GridItem_01');
      let GridItem_02: RectValue = CommonFunc.getComponentRect('OnlyColumnsTemplate1_GridItem_02');
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({
        name: 'columnStart1', value: 2
      })
      globalThis.value.message.notify({
        name: 'columnEnd1', value: 1
      })
      globalThis.value.message.notify({
        name: 'columnStart2', value: 2
      })
      globalThis.value.message.notify({
        name: 'columnEnd2', value: 1
      })
      await CommonFunc.sleep(2000);

      console.log('get Initial value')
      let GridItem_011: RectValue = CommonFunc.getComponentRect('OnlyColumnsTemplate1_GridItem_01');
      let GridItem_022: RectValue = CommonFunc.getComponentRect('OnlyColumnsTemplate1_GridItem_02');


      console.log('assert size')
	  expect(Math.abs(Math.round(GridItem_011.right - GridItem_011.left) - Math.round(vp2px(52))) <= 1).assertTrue();
      console.log('GGridItem_01.right - GridItem_01.left' + (GridItem_011.right - GridItem_011.left))
	  expect(Math.abs(Math.round(GridItem_011.bottom - GridItem_011.top) - Math.round(vp2px(50))) <= 1).assertTrue();
      console.log('GGridItem_01.bottom - GridItem_01.top' + (GridItem_011.bottom - GridItem_011.top))

      console.info('[SUB_ACE_GRID_OnlyColumnsTemplate4_0500] END');
      done();
    });
  })
}
