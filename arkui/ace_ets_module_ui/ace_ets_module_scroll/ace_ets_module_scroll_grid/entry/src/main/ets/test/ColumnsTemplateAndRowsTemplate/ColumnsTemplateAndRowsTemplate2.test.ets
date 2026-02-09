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
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';

export default function ColumnsTemplateAndRowsTemplate2() {
  describe('ColumnsTemplateAndRowsTemplate2', () => {
    beforeEach(async (done: Function) => {
      console.info("GridFrictionPage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ColumnsTemplateAndRowsTemplate/ColumnsTemplateAndRowsTemplate2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ColumnsTemplateAndRowsTemplate2 state pages:" + JSON.stringify(pages));
        if (!("ColumnsTemplateAndRowsTemplate2" == pages.name)) {
          console.info("get ColumnsTemplateAndRowsTemplate2 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ColumnsTemplateAndRowsTemplate2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ColumnsTemplateAndRowsTemplate2 page error:" + err);
      }
      console.info("ColumnsTemplateAndRowsTemplate2 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      router.back()
      console.info("ColumnsTemplateAndRowsTemplate2 after each called");
    });

    /**
     * @tc.name   SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate2_0100
     * @tc.number SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate2_0100
     * @tc.desc   GridItem set columnStart to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate2_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate2_0100] START');
      await CommonFunc.sleep(2000);

      console.log('get Initial value')
      let GridItem_01 = CommonFunc.getComponentRect('ColumnsTemplateAndRowsTemplate2_GridItem_01');
      let Grid_1 = CommonFunc.getComponentRect('ColumnsTemplateAndRowsTemplate2_Grid_1');

      console.log('assert position')
      console.log('GridItem_01.left' + GridItem_01.left)
      console.log('Grid_1.left' + Grid_1.left)
      expect(Math.floor(Math.abs(GridItem_01.left - Grid_1.left)) <= 1).assertTrue();

      console.log('GridItem_01.left - Grid_1.left' + (GridItem_01.left - Grid_1.left))
      expect(Math.floor(Math.abs((GridItem_01.left - Grid_1.left) - vp2px(0))) <= 1).assertTrue();
      console.log('GridItem_01.left - Grid_1.left' + (GridItem_01.left - Grid_1.left))
      expect(Math.floor(Math.abs((GridItem_01.top - Grid_1.top) - vp2px(0))) <= 1).assertTrue();

      console.log('assert size')
      console.log('GridItem_01.right - GridItem_01.left' + (GridItem_01.right - GridItem_01.left))
      expect(Math.floor(Math.abs((GridItem_01.right - GridItem_01.left) - vp2px(120))) <= 1).assertTrue(); 
      console.log('GGridItem_01.bottom - GridItem_01.top' + (GridItem_01.bottom - GridItem_01.top))
      expect(Math.floor(Math.abs((GridItem_01.bottom - GridItem_01.top) - vp2px(60))) <= 1).assertTrue();

      console.info('[SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate2_0100] END');
      done();
    });
  })
}
