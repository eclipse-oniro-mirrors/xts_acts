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
import CommonFunc, { RectValue } from '../../../../MainAbility/common/Common';

export default function Grid_Row_Columns_Option() {
  describe('Grid_Row_Columns_Option', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_Row_Columns_Option beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_Row/Grid_Row_Columns/Grid_Row_Columns_Option",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_Row_Columns_Option state pages:" + JSON.stringify(pages));
        if (!("Grid_Row_Columns_Option" == pages.name)) {
          console.info("get Grid_Row_Columns_Option pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_Row_Columns_Option page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_Row_Columns_Option page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Grid_Row_Columns_Option beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Grid_Row_Columns_Option after each called")
    });

    /**
     * @tc.number SUB_ACE_GRIDROWCOLUMNS_Option_0100
     * @tc.name testGutterColumns
     * @tc.desc Set the Columns of GridRow to '30px'
     */
    it('SUB_ACE_GridRowColumns_Option_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_GridRowColumns_Option_0100 START');
      globalThis.value.message.notify({
        name: 'option', value: '30'
      })
      await CommonFunc.sleep(2000)

      let firstColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option0');
      let secondColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option1');
      let gridRowColumnsJson = getInspectorByKey('GridRow_Columns_Option001');
      expect(JSON.parse(gridRowColumnsJson).$type).assertEqual('GridRow');

      expect(Math.abs(Math.round(secondColumns.top - firstColumns.bottom) - Math.round(vp2px(5))) <= 1).assertTrue();

      console.info('SUB_ACE_GridRowColumns_Option_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_GRIDROWCOLUMNS_Option_0200
     * @tc.name testGutterColumns
     * @tc.desc Set the Columns of GridRow to '70px'
     */
    it('SUB_ACE_GridRowColumns_Option_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_GridRowColumns_Option_0200 START');
      globalThis.value.message.notify({
        name: 'option', value: '70'
      })
      await CommonFunc.sleep(2000)

      let Columns_1: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option001');
      let firstColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option0');
      let secondColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option1');
      let thirdColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option2');
      let fourthColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option3');
      let gridRowColumnsJson = getInspectorByKey('GridRow_Columns_Option001');
      expect(JSON.parse(gridRowColumnsJson).$type).assertEqual('GridRow');


      expect(Math.abs(Math.round(secondColumns.left - firstColumns.right) - Math.round(vp2px(5))) <= 1).assertTrue();
      expect(Math.abs(Math.round(fourthColumns.left - thirdColumns.right) - Math.round(vp2px(5))) <= 1).assertTrue();

      console.info('SUB_ACE_GridRowColumns_Option_0200 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_GRIDROWCOLUMNS_Option_0300
     * @tc.name testGutterColumns
     * @tc.desc Set the Columns of GridRow to '120px'
     */
    it('SUB_ACE_GridRowColumns_Option_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_GridRowColumns_Option_0300 START');
      globalThis.value.message.notify({
        name: 'option', value: '120'
      })
      await CommonFunc.sleep(2000)

      let Columns_1: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option001');
      let firstColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option0');
      let secondColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option1');
      let thirdColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option2');
      let fourthColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option3');
      let fifthColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option4');
      let gridRowColumnsJson = getInspectorByKey('GridRow_Columns_Option001');
      expect(JSON.parse(gridRowColumnsJson).$type).assertEqual('GridRow');

      expect(Math.abs(Math.round(secondColumns.left - firstColumns.right) -
      Math.round(thirdColumns.left - secondColumns.right)) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondColumns.left - firstColumns.right) - Math.round(vp2px(5))) <= 1).assertTrue();

      console.info('SUB_ACE_GridRowColumns_Option_0300 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_GRIDROWCOLUMNS_Option_0400
     * @tc.name testGutterColumns
     * @tc.desc Set the Columns of GridRow to '170px'
     */
    it('SUB_ACE_GridRowColumns_Option_0400',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_GridRowColumns_Option_0400 START');
      globalThis.value.message.notify({
        name: 'option', value: '170'
      })
      await CommonFunc.sleep(2000)

      let Columns_1: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option001');
      let firstColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option0');
      let secondColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option1');
      let thirdColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option2');
      let fourthColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option3');
      let fifthColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option4');

      let gridRowColumnsJson = getInspectorByKey('GridRow_Columns_Option001');
      expect(JSON.parse(gridRowColumnsJson).$type).assertEqual('GridRow');

      expect(Math.abs(Math.round(secondColumns.left - firstColumns.right) - Math.round(thirdColumns.left - secondColumns.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(thirdColumns.left - secondColumns.right) - Math.round(fourthColumns.left - thirdColumns.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.floor(secondColumns.left - firstColumns.right) - Math.floor(vp2px(5))) <= 1).assertTrue();

      console.info('SUB_ACE_GridRowColumns_Option_0400 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_GRIDROWCOLUMNS_Option_0500
     * @tc.name testGutterColumns
     * @tc.desc Set the Columns of GridRow to '220px'
     */
    it('SUB_ACE_GridRowColumns_Option_0500',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_GridRowColumns_Option_0500 START');
      globalThis.value.message.notify({
        name: 'option', value: '220'
      })
      await CommonFunc.sleep(2000)

      let Columns_1: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option001');
      let firstColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option0');
      let secondColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option1');
      let thirdColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option2');
      let fourthColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option3');
      let fifthColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option4');
      let gridRowColumnsJson = getInspectorByKey('GridRow_Columns_Option001');
      expect(JSON.parse(gridRowColumnsJson).$type).assertEqual('GridRow');

      expect(Math.abs(Math.round(secondColumns.left - firstColumns.right) - Math.round(thirdColumns.left - secondColumns.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(thirdColumns.left - secondColumns.right) - Math.round(fourthColumns.left - thirdColumns.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(fourthColumns.left - thirdColumns.right) - Math.round(fifthColumns.left - fourthColumns.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.floor(secondColumns.left - firstColumns.right) - Math.floor(vp2px(5))) <= 1).assertTrue();

      console.info('SUB_ACE_GridRowColumns_Option_0500 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_GRIDROWCOLUMNS_Option_0600
     * @tc.name testGutterColumns
     * @tc.desc Set the Columns of GridRow to '320px'
     */
    it('SUB_ACE_GridRowColumns_Option_0600',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_GridRowColumns_Option_0600 START');
      globalThis.value.message.notify({
        name: 'option', value: '320'
      })
      await CommonFunc.sleep(2000)

      let Columns_1: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option001');
      let firstColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option0');
      let secondColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option1');
      let thirdColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option2');
      let fourthColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option3');
      let fifthColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option4');
      let sixthColumns: RectValue = CommonFunc.getComponentRect('GridRow_Columns_Option5');
      let gridRowColumnsJson = getInspectorByKey('GridRow_Columns_Option001');
      expect(JSON.parse(gridRowColumnsJson).$type).assertEqual('GridRow');


      expect(Math.abs(Math.round(secondColumns.left - firstColumns.right) - Math.round(thirdColumns.left - secondColumns.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(thirdColumns.left - secondColumns.right) - Math.round(fourthColumns.left - thirdColumns.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(fourthColumns.left - thirdColumns.right) - Math.round(fifthColumns.left - fourthColumns.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(fifthColumns.left - fourthColumns.right) - Math.round(sixthColumns.left - fifthColumns.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.floor(secondColumns.left - firstColumns.right) - Math.floor(vp2px(5))) <= 1).assertTrue();

      console.info('SUB_ACE_GridRowColumns_Option_0600 END');
      done();
    });


  })
}
