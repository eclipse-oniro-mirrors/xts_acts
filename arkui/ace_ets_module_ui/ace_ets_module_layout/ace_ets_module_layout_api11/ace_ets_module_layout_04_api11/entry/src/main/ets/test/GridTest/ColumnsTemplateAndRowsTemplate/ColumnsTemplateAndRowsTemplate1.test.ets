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

export default function ColumnsTemplateAndRowsTemplate1() {
  describe('ColumnsTemplateAndRowsTemplate1', () => {
    beforeEach(async (done: Function) => {
      console.info("GridFrictionPage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/ColumnsTemplateAndRowsTemplate/ColumnsTemplateAndRowsTemplate1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ColumnsTemplateAndRowsTemplate1 state pages:" + JSON.stringify(pages));
        if (!("ColumnsTemplateAndRowsTemplate1" == pages.name)) {
          console.info("get ColumnsTemplateAndRowsTemplate1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ColumnsTemplateAndRowsTemplate1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ColumnsTemplateAndRowsTemplate1 page error:" + err);
      }
      console.info("ColumnsTemplateAndRowsTemplate1 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      router.back()
      console.info("ColumnsTemplateAndRowsTemplate1 after each called");
    });

    /**
     * @tc.number SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_0100
     * @tc.name testGrid
     * @tc.desc GridItem set columnStart to 0
     */
    it('SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_001] START');
      globalThis.value.message.notify({
        name: 'columnEnd1', value: 2
      })

      await CommonFunc.sleep(2000);

      console.log('get Initial value')
      let GridItem_01: RectValue = CommonFunc.getComponentRect('ColumnsTemplateAndRowsTemplate1_GridItem_01');
      let Grid_1: RectValue = CommonFunc.getComponentRect('ColumnsTemplateAndRowsTemplate1_Grid_1');

      console.log('assert position')
      console.log('GridItem_01.left' + GridItem_01.left)
      console.log('Grid_1.left' + Grid_1.left)
      expect(Math.floor(Math.abs(GridItem_01.left - Grid_1.left)) <= 1).assertTrue();

      console.log('GridItem_01.left - Grid_1.left' + (GridItem_01.left - Grid_1.left))
      expect(Math.floor(Math.abs((GridItem_01.left - Grid_1.left) - vp2px(0))) <= 1).assertTrue();
      console.log('GridItem_01.left - Grid_1.left' + (GridItem_01.left - Grid_1.left))
      expect(Math.floor(Math.abs((GridItem_01.top - Grid_1.top) - vp2px(60))) <= 1).assertTrue();

      console.log('assert size')
      console.log('GridItem_01.right - GridItem_01.left' + (GridItem_01.right - GridItem_01.left))
      expect(Math.floor(Math.abs((GridItem_01.right - GridItem_01.left) - vp2px(180))) <= 1).assertTrue(); 
      console.log('GGridItem_01.bottom - GridItem_01.top' + (GridItem_01.bottom - GridItem_01.top))
      expect(Math.floor(Math.abs((GridItem_01.bottom - GridItem_01.top) - vp2px(60))) <= 1).assertTrue();


      console.info('[SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_0100] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_0200
     * @tc.name testGrid
     * @tc.desc GridItem sets columnStart to be greater than the total number of columns
     */
    it('SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_0200] START');
      globalThis.value.message.notify({
        name: 'columnStart1', value: 2
      })
      await CommonFunc.sleep(2000);

      console.log('get Initial value')
      let GridItem_01: RectValue = CommonFunc.getComponentRect('ColumnsTemplateAndRowsTemplate1_GridItem_01');
      let Grid_1: RectValue = CommonFunc.getComponentRect('ColumnsTemplateAndRowsTemplate1_Grid_1');

      console.log('assert position')

      console.log('assert size')
      console.log('GGridItem_01.right - GridItem_01.left' + (GridItem_01.right - GridItem_01.left))
      expect(Math.floor(Math.abs((GridItem_01.right - GridItem_01.left) - vp2px(60))) <= 1).assertTrue();
      console.log('GGridItem_01.bottom - GridItem_01.top' + (GridItem_01.bottom - GridItem_01.top))
      expect(Math.floor(Math.abs((GridItem_01.bottom - GridItem_01.top) - vp2px(60))) <= 1).assertTrue();

      console.info('[SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_0200] END');
      done();
    });

    // /**
    //  * @tc.number    SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_0300
    //  * @tc.name      testGrid
    //  * @tc.desc      GridItem set columnStart to -2
    //  */
    // it('SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_0300',  Level.LEVEL0, async  (done:Function) => {
    //   console.info('[SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_0300] START');
    //   globalThis.value.message.notify({name:'columnStart1', value:-1})
    //   await CommonFunc.sleep(2000);
    //
    //   console.log('get Initial value')
    //   let GridItem_01:RectValue = CommonFunc.getComponentRect('ColumnsTemplateAndRowsTemplate1_GridItem_01');
    //   let Grid_1:RectValue = CommonFunc.getComponentRect('ColumnsTemplateAndRowsTemplate1_Grid_1');
    //
    //   console.log('assert size')
    // expect(Math.round(GridItem_01.right - GridItem_01.left)).assertEqual(Math.round(vp2px(60)));
    //   console.log('GGridItem_01.right - GridItem_01.left' + (GridItem_01.right - GridItem_01.left))
    //   expect(Math.round(GridItem_01.bottom - GridItem_01.top)).assertEqual(Math.round(vp2px(60)));
    //   console.log('GGridItem_01.bottom - GridItem_01.top' + (GridItem_01.bottom - GridItem_01.top))
    //
    //   console.info('[SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_0300] END');
    //   done();
    // });

    /**
     * @tc.number SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_0400
     * @tc.name testGrid
     * @tc.desc GridItem set columnStart to 5
     */
    it('SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_0400',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_0400] START');
      globalThis.value.message.notify({
        name: 'columnStart1', value: 5
      })
      await CommonFunc.sleep(2000);

      console.log('get Initial value')
      let GridItem_01: RectValue = CommonFunc.getComponentRect('ColumnsTemplateAndRowsTemplate1_GridItem_01');
      let Grid_1: RectValue = CommonFunc.getComponentRect('ColumnsTemplateAndRowsTemplate1_Grid_1');

      console.log('assert position')
      console.log('GridItem_01.left' + GridItem_01.left)
      console.log('Grid_1.left' + Grid_1.left)
      expect(Math.floor(Math.abs(GridItem_01.left - Grid_1.left)) <= 1).assertTrue();

      console.log('GridItem_01.left - Grid_1.left' + (GridItem_01.left - Grid_1.left))
      expect(Math.floor(Math.abs((GridItem_01.left - Grid_1.left) - vp2px(0))) <= 1).assertTrue();
      console.log('GridItem_01.left - Grid_1.left' + (GridItem_01.left - Grid_1.left))
      expect(Math.floor(Math.abs((GridItem_01.top - Grid_1.top) - vp2px(0))) <= 1).assertTrue();

      console.log('assert size')
      console.log('GGridItem_01.right - GridItem_01.left' + (GridItem_01.right - GridItem_01.left))
      expect(Math.floor(Math.abs((GridItem_01.right - GridItem_01.left) - vp2px(60))) <= 1).assertTrue();
      console.log('GGridItem_01.bottom - GridItem_01.top' + (GridItem_01.bottom - GridItem_01.top))
      expect(Math.floor(Math.abs((GridItem_01.bottom - GridItem_01.top) - vp2px(60))) <= 1).assertTrue();

      console.info('[SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_0400] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_0500
     * @tc.name testGrid
     * @tc.desc GridItem set rowStart to 0
     */
    it('SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_0500',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_0500] START');
      globalThis.value.message.notify({
        name: 'rowStart1', value: 0
      })
      await CommonFunc.sleep(2000);

      console.log('get Initial value')
      let GridItem_01: RectValue = CommonFunc.getComponentRect('ColumnsTemplateAndRowsTemplate1_GridItem_01');
      let Grid_1: RectValue = CommonFunc.getComponentRect('ColumnsTemplateAndRowsTemplate1_Grid_1');

      console.log('assert position')
      console.log('GridItem_01.left' + GridItem_01.left)
      console.log('Grid_1.left' + Grid_1.left)
      expect(Math.floor(Math.abs(GridItem_01.left - Grid_1.left)) <= 1).assertTrue();

      console.log('GridItem_01.left - Grid_1.left' + (GridItem_01.left - Grid_1.left))
      expect(Math.floor(Math.abs((GridItem_01.left - Grid_1.left) - vp2px(0))) <= 1).assertTrue();
      console.log('GridItem_01.left - Grid_1.left' + (GridItem_01.left - Grid_1.left))
      expect(Math.floor(Math.abs((GridItem_01.top - Grid_1.top) - vp2px(0))) <= 1).assertTrue();

      console.log('assert size')
      console.log('GGridItem_01.right - GridItem_01.left' + (GridItem_01.right - GridItem_01.left))
      expect(Math.floor(Math.abs((GridItem_01.right - GridItem_01.left) - vp2px(120))) <= 1).assertTrue();
      console.log('GGridItem_01.bottom - GridItem_01.top' + (GridItem_01.bottom - GridItem_01.top))
      expect(Math.floor(Math.abs((GridItem_01.bottom - GridItem_01.top) - vp2px(120))) <= 1).assertTrue();

      console.info('[SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_0500] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_0600
     * @tc.name testGrid
     * @tc.desc GridItem sets rowStart to be greater than the total number of columns
     */
    it('SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_0600',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_0600] START');
      globalThis.value.message.notify({
        name: 'rowStart1', value: 2
      })
      await CommonFunc.sleep(2000);

      console.log('get Initial value')
      let GridItem_01: RectValue = CommonFunc.getComponentRect('ColumnsTemplateAndRowsTemplate1_GridItem_01');
      let Grid_1: RectValue = CommonFunc.getComponentRect('ColumnsTemplateAndRowsTemplate1_Grid_1');

      console.log('assert position')
      console.log('GridItem_01.left' + GridItem_01.left)
      console.log('Grid_1.left' + Grid_1.left)
      expect(Math.floor(Math.abs(GridItem_01.left - Grid_1.left)) <= 1).assertTrue();

      console.log('GridItem_01.left - Grid_1.left' + (GridItem_01.left - Grid_1.left))
      expect(Math.floor(Math.abs((GridItem_01.left - Grid_1.left) - vp2px(0))) <= 1).assertTrue();

      console.log('assert size')
      console.log('GGridItem_01.right - GridItem_01.left' + (GridItem_01.right - GridItem_01.left))
      expect(Math.floor(Math.abs((GridItem_01.right - GridItem_01.left) - vp2px(120))) <= 1).assertTrue();
      console.log('GGridItem_01.bottom - GridItem_01.top' + (GridItem_01.bottom - GridItem_01.top))
      expect(Math.floor(Math.abs((GridItem_01.bottom - GridItem_01.top) - vp2px(60))) <= 1).assertTrue();

      console.info('[SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_0600] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_0700
     * @tc.name testGrid
     * @tc.desc GridItem set rowStart to 5
     */
    it('SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_0700',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_0700] START');
      globalThis.value.message.notify({
        name: 'rowStart1', value: 5
      })
      await CommonFunc.sleep(2000);

      console.log('get Initial value')
      let GridItem_01: RectValue = CommonFunc.getComponentRect('ColumnsTemplateAndRowsTemplate1_GridItem_01');
      let Grid_1: RectValue = CommonFunc.getComponentRect('ColumnsTemplateAndRowsTemplate1_Grid_1');


      console.log('assert size')
      console.log('GGridItem_01.right - GridItem_01.left' + (GridItem_01.right - GridItem_01.left))
      expect(Math.floor(Math.abs((GridItem_01.right - GridItem_01.left) - vp2px(120))) <= 1).assertTrue();
      console.log('GGridItem_01.bottom - GridItem_01.top' + (GridItem_01.bottom - GridItem_01.top))
      expect(Math.floor(Math.abs((GridItem_01.bottom - GridItem_01.top) - vp2px(60))) <= 1).assertTrue();

      console.info('[SUB_ACE_GRID_ColumnsTemplateAndRowsTemplate1_0700] END');
      done();
    });


  })
}
