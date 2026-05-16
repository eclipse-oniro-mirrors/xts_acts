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
export default function Grid_Row_GutterOption_Number() {
  describe('Grid_Row_GutterOption_Number',  ()=> {
    beforeEach(async  (done: Function)=> {
      console.info("GutterOption_Length_Number beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_Row/Grid_Row_GutterOption/Grid_Row_GutterOption_Number",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_Row_GutterOption_Number state pages:" + JSON.stringify(pages));
        if (!("Grid_Row_GutterOption_Number" == pages.name)) {
          console.info("get Grid_Row_GutterOption_Number pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_Row_GutterOption_Number page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_Row_GutterOption_Number page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Grid_Row_GutterOption_Number beforeEach end");
      done();
    });
    afterEach(async ()=> {
      await CommonFunc.sleep(2000);
      console.info("Grid_Row_GutterOption_Number after each called")
    });

    /**
     * @tc.name   SUB_ACE_GridRowGutterOption_NUMBER_0100
     * @tc.number SUB_ACE_GRIDROWGUTTEROPTION_NUMBER_0100
     * @tc.desc   Set the GridRowSizeOption of GridRow to {x: -20 ,y: 10}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_GridRowGutterOption_NUMBER_0100',  Level.LEVEL0, async  (done: Function)=> {
      console.info('SUB_ACE_GridRowGutterOption_NUMBER_0100 START');
      globalThis.value.message.notify({ name:'length', value:-20 })
      await CommonFunc.sleep(2000)

      let LengthNumber_1:RectValue = CommonFunc.getComponentRect('Length_Number001');
      let firstLengthNumber:RectValue = CommonFunc.getComponentRect('Length_NumberChange_0');
      let secondLengthNumber:RectValue = CommonFunc.getComponentRect('Length_NumberChange_1');
      let thirdLengthNumber:RectValue = CommonFunc.getComponentRect('Length_NumberChange_2');
      let gridRowGutterLengthNumJson = getInspectorByKey('Length_Number001');
      let gridRowGutter: ESObject = JSON.parse(gridRowGutterLengthNumJson);
      expect(gridRowGutter.$type).assertEqual('GridRow');


      expect(Math.abs(Math.round(secondLengthNumber.left - firstLengthNumber.right) - Math.round(vp2px(-20))) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdLengthNumber.top - firstLengthNumber.bottom) - Math.round(vp2px(10))) <= 1).assertTrue();

      console.info('SUB_ACE_GridRowGutterOption_NUMBER_0100 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_GridRowGutterOption_NUMBER_0200
     * @tc.number SUB_ACE_GRIDROWGUTTEROPTION_NUMBER_0200
     * @tc.desc   Set the GridRowSizeOption of GridRow to {x: 0 ,y: 10}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_GridRowGutterOption_NUMBER_0200',  Level.LEVEL0, async  (done: Function)=> {
      console.info('SUB_ACE_GridRowGutterOption_NUMBER_0200 START');
      globalThis.value.message.notify({ name:'length', value:0 })
      await CommonFunc.sleep(2000)

      let LengthNumber_1:RectValue = CommonFunc.getComponentRect('Length_Number001');
      let firstLengthNumber:RectValue = CommonFunc.getComponentRect('Length_NumberChange_0');
      let secondLengthNumber:RectValue = CommonFunc.getComponentRect('Length_NumberChange_1');
      let thirdLengthNumber:RectValue = CommonFunc.getComponentRect('Length_NumberChange_2');
      let gridRowGutterLengthNumJson = getInspectorByKey('Length_Number001');
      let gridRowGutter: ESObject = JSON.parse(gridRowGutterLengthNumJson);
      expect(gridRowGutter.$type).assertEqual('GridRow');

      expect(Math.abs(Math.round(secondLengthNumber.left - firstLengthNumber.right) - Math.round(vp2px(0))) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdLengthNumber.top - firstLengthNumber.bottom) - Math.round(vp2px(10))) <= 1).assertTrue();

      console.info('SUB_ACE_GridRowGutterOption_NUMBER_0200 END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_GridRowGutterOption_NUMBER_0300
     * @tc.number SUB_ACE_GRIDROWGUTTEROPTION_NUMBER_0300
     * @tc.desc   Set the GridRowSizeOption of GridRow to {x: 10 ,y: 10}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_GridRowGutterOption_NUMBER_0300',  Level.LEVEL0, async  (done: Function)=> {
      console.info('SUB_ACE_GridRowGutterOption_NUMBER_0300 START');
      globalThis.value.message.notify({ name:'length', value:10 })
      await CommonFunc.sleep(2000)

      let LengthNumber_1:RectValue = CommonFunc.getComponentRect('Length_Number001');
      let firstLengthNumber:RectValue = CommonFunc.getComponentRect('Length_NumberChange_0');
      let secondLengthNumber:RectValue = CommonFunc.getComponentRect('Length_NumberChange_1');
      let thirdLengthNumber:RectValue = CommonFunc.getComponentRect('Length_NumberChange_2');
      let gridRowGutterLengthNumJson = getInspectorByKey('Length_Number001');
      let gridRowGutter: ESObject = JSON.parse(gridRowGutterLengthNumJson);
      expect(gridRowGutter.$type).assertEqual('GridRow');


      expect(Math.abs(Math.round(secondLengthNumber.left - firstLengthNumber.right) - Math.round(vp2px(10))) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdLengthNumber.top - firstLengthNumber.bottom) - Math.round(vp2px(10))) <= 1).assertTrue();

      console.info('SUB_ACE_GridRowGutterOption_NUMBER_0300 END');
      done();
    });
  })
}
