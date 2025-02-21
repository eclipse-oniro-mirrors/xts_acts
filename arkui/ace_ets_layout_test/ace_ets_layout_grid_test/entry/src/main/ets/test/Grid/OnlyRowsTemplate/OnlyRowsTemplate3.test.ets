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

export default function OnlyRowsTemplate3() {
  describe('OnlyRowsTemplate3', () => {
    beforeEach(async (done: Function) => {
      console.info("GridFrictionPage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/OnlyRowsTemplate/OnlyRowsTemplate1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get OnlyRowsTemplate3 state pages:" + JSON.stringify(pages));
        if (!("GridFrictionPage" == pages.name)) {
          console.info("get OnlyRowsTemplate3 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push OnlyRowsTemplate3 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OnlyRowsTemplate3 page error:" + err);
      }
      console.info("OnlyRowsTemplate3 beforeEach end");
      done();
    });
    afterEach(async () => {
      console.info("OnlyRowsTemplate3 after each called");
    });


    /**
     * @tc.number SUB_ACE_GRID_OnlyRowsTemplate3_0300
     * @tc.name testGrid
     * @tc.desc GridItem sets rowStart to be greater than the total number of row
     */
    it('SUB_ACE_GRID_OnlyRowsTemplate3_0300', 0, async (done: Function) => {
      console.info('[SUB_ACE_GRID_OnlyRowsTemplate3_0300] START');
      globalThis.value.message.notify({
        name: 'rowStart1', value: 5
      })
      globalThis.value.message.notify({
        name: 'rowEnd1', value: 1
      })
      globalThis.value.message.notify({
        name: 'rowStart2', value: 5
      })
      globalThis.value.message.notify({
        name: 'rowEnd2', value: 1
      })
      await CommonFunc.sleep(2000);

      console.log('get Initial value')
      let GridItem_011: RectValue = CommonFunc.getComponentRect('OnlyRowsTemplate1_GridItem_01');

      console.log('assert size')
      expect(Math.round(GridItem_011.right - GridItem_011.left)).assertEqual(Math.round(vp2px(100)));
      console.log('GGridItem_01.right - GridItem_01.left' + (GridItem_011.right - GridItem_011.left))
      expect(Math.round(GridItem_011.bottom - GridItem_011.top)).assertEqual(Math.round(vp2px(72)));
      console.log('GGridItem_01.bottom - GridItem_01.top' + (GridItem_011.bottom - GridItem_011.top))

      await CommonFunc.sleep(2000);
      let driver = Driver.create();
      await CommonFunc.sleep(300);
      let button = await driver.findComponent(ON.id('OnlyRowsTemplate1_button'));
      await button.click();
      await CommonFunc.sleep(1000);
      let GridItem_01: RectValue = CommonFunc.getComponentRect('OnlyRowsTemplate1_GridItem_01');
      await CommonFunc.sleep(1000);
      console.info('[SUB_ACE_GRID_OnlyRowsTemplate3_0300] END');
      done();
    });


  })
}
