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

export default function ColumnsTemplateAndRowsTemplateNoSet() {
  describe('ColumnsTemplateAndRowsTemplateNoSet', () => {
    beforeEach(async (done: Function) => {
      console.info("GridFrictionPage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ColumnsTemplateAndRowsTemplate/ColumnsTemplateAndRowsTemplateNoSet',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ColumnsTemplateAndRowsTemplateNoSet state pages:" + JSON.stringify(pages));
        if (!("ColumnsTemplateAndRowsTemplateNoSet" == pages.name)) {
          console.info("get ColumnsTemplateAndRowsTemplateNoSet pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ColumnsTemplateAndRowsTemplateNoSet page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ColumnsTemplateAndRowsTemplateNoSet page error:" + err);
      }
      console.info("ColumnsTemplateAndRowsTemplateNoSet beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      router.back()
      console.info("ColumnsTemplateAndRowsTemplateNoSet after each called");
    });

    /**
     * @tc.name   SUB_ACE_GRID_ColumnsTemplateAndRowsTemplateNoSet_0100
     * @tc.number SUB_ACE_GRID_ColumnsTemplateAndRowsTemplateNoSet_0100
     * @tc.desc   GridItem set columnStart、columnEnd、rowStart、rowEnd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_GRID_ColumnsTemplateAndRowsTemplateNoSet_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_GRID_ColumnsTemplateAndRowsTemplateNoSet_0100] START');
      await CommonFunc.sleep(2000);

      console.log('get Initial value')
      let GridItem_01 = CommonFunc.getComponentRect('ColumnsTemplateAndRowsTemplateNoSet_GridItem_01');
      let Grid_1 = CommonFunc.getComponentRect('ColumnsTemplateAndRowsTemplateNoSet_Grid_1');

      console.log('assert position')
      expect(GridItem_01.left).assertEqual(Grid_1.left);
      console.log('GridItem_01.left' + GridItem_01.left)
      console.log('Grid_1.left' + Grid_1.left)

      expect(Math.round(GridItem_01.left - Grid_1.left)).assertEqual(Math.round(vp2px(0)));
      console.log('GridItem_01.left - Grid_1.left' + (GridItem_01.left - Grid_1.left))
      expect(Math.round(GridItem_01.top - Grid_1.top)).assertEqual(Math.round(vp2px(0)));
      console.log('GridItem_01.left - Grid_1.left' + (GridItem_01.left - Grid_1.left))

      console.log('assert size')
      console.log('SUB_ACE_GRID_ColumnsTemplateAndRowsTemplateNoSet_0100 width: ' + (GridItem_01.right - GridItem_01.left))
      console.log('SUB_ACE_GRID_ColumnsTemplateAndRowsTemplateNoSet_0100 height: ' + (GridItem_01.bottom - GridItem_01.top))
      console.info(`[SUB_ACE_GRID_ColumnsTemplateAndRowsTemplateNoSet_0100] vp2px(100)=${(vp2px(100))}`); 
      expect(Math.floor(Math.abs((GridItem_01.right - GridItem_01.left) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((GridItem_01.bottom - GridItem_01.top) - vp2px(100))) <= 1).assertTrue();

      console.info('[SUB_ACE_GRID_ColumnsTemplateAndRowsTemplateNoSet_0100] END');
      done();
    });
  })
}
