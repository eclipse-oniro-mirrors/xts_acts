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

export default function Grid_Row_GutterOption_Default() {
  describe('Grid_Row_GutterOption_Default', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_Row_GutterOption_Default beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_Row/Grid_Row_GutterOption/Grid_Row_GutterOption_Default",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_Row_GutterOption_Default state pages:" + JSON.stringify(pages));
        if (!("Grid_Row_GutterOption_Default" == pages.name)) {
          console.info("get Grid_Row_GutterOption_Default pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_Row_GutterOption_Default page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_Row_GutterOption_Default page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Grid_Row_GutterOption_Default beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Grid_Row_GutterOption_Default after each called")
    });

    /**
     * @tc.number SUB_ACE_GRIDROWGUTTEROPTION_DEFAULT_0100
     * @tc.name testGutterOption
     * @tc.desc Set the GridRowSizeOption of GridRow to {x: 0 ,y: 0}
     */
    it('SUB_ACE_GridRowGutterOption_Default_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_GridRowGutterOption_Default_0100 START');
      await CommonFunc.sleep(2000)

      let GutterOption_1: RectValue = CommonFunc.getComponentRect('GutterOptionChange_001');
      let firstGutterOption: RectValue = CommonFunc.getComponentRect('GutterOptionChange_0');
      let secondGutterOption: RectValue = CommonFunc.getComponentRect('GutterOptionChange_1');
      let thirdGutterOption: RectValue = CommonFunc.getComponentRect('GutterOptionChange_2');
      let gridRowGutterOptionJson = getInspectorByKey('GutterOptionChange_001');
      expect(JSON.parse(gridRowGutterOptionJson).$type).assertEqual('GridRow');

      expect(Math.abs(firstGutterOption.top - GutterOption_1.top) <= 1).assertTrue();
      expect(Math.abs(firstGutterOption.left - GutterOption_1.left) <= 1).assertTrue();

      expect(Math.abs(secondGutterOption.left - firstGutterOption.right - vp2px(0)) <= 1).assertTrue();
      expect(Math.abs(thirdGutterOption.top - firstGutterOption.bottom - vp2px(0)) <= 1).assertTrue();


      console.info('SUB_ACE_GridRowGutterOption_Default_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_GRIDROWGUTTEROPTION_DEFAULT_0200
     * @tc.name testGutterOptionNoSetXY
     * @tc.desc Set the GridRowSizeOption of GridRow to {x: 10 ,y: 0}
     */
    it('SUB_ACE_GridRowGutterOption_Default_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_GridRowGutterOption_Default_0200 START');
      globalThis.value.message.notify({
        name: 'optionX', value: 10
      })
      await CommonFunc.sleep(2000)

      let GutterOption_1: RectValue = CommonFunc.getComponentRect('GutterOptionChange_001');
      let firstGutterOption: RectValue = CommonFunc.getComponentRect('GutterOptionChange_0');
      let secondGutterOption: RectValue = CommonFunc.getComponentRect('GutterOptionChange_1');
      let thirdGutterOption: RectValue = CommonFunc.getComponentRect('GutterOptionChange_2');
      let gridRowGutterOptionJson = getInspectorByKey('GutterOptionChange_001');
      expect(JSON.parse(gridRowGutterOptionJson).$type).assertEqual('GridRow');

      expect(Math.abs(firstGutterOption.top - GutterOption_1.top) <= 1).assertTrue();
      expect(Math.abs(firstGutterOption.left - GutterOption_1.left) <= 1).assertTrue();

      expect(Math.abs(secondGutterOption.left - firstGutterOption.right - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs(thirdGutterOption.top - firstGutterOption.bottom - vp2px(0)) <= 1).assertTrue();


      console.info('SUB_ACE_GridRowGutterOption_Default_0200 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_GRIDROWGUTTEROPTION_DEFAULT_0300
     * @tc.name testGutterOptionNoSetXY
     * @tc.desc Set the GridRowSizeOption of GridRow to {x: 0 ,y: 10}
     */
    it('SUB_ACE_GridRowGutterOption_Default_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_GridRowGutterOption_Default_0300 START');
      globalThis.value.message.notify({
        name: 'optionX', value: 0
      })
      globalThis.value.message.notify({
        name: 'optionY', value: 10
      })
      await CommonFunc.sleep(2000)

      let GutterOption_1: RectValue = CommonFunc.getComponentRect('GutterOptionChange_001');
      let firstGutterOption: RectValue = CommonFunc.getComponentRect('GutterOptionChange_0');
      let secondGutterOption: RectValue = CommonFunc.getComponentRect('GutterOptionChange_1');
      let thirdGutterOption: RectValue = CommonFunc.getComponentRect('GutterOptionChange_2');
      let gridRowGutterOptionJson = getInspectorByKey('GutterOptionChange_001');
      expect(JSON.parse(gridRowGutterOptionJson).$type).assertEqual('GridRow');

      expect(Math.abs(firstGutterOption.top - GutterOption_1.top) <= 1).assertTrue();
      expect(Math.abs(firstGutterOption.left - GutterOption_1.left) <= 1).assertTrue();

      expect(Math.abs(Math.abs(secondGutterOption.left - firstGutterOption.right) - Math.abs(vp2px(0))) <= 1).assertTrue();
      expect(Math.abs(Math.abs(thirdGutterOption.top - firstGutterOption.bottom) - Math.abs(vp2px(10))) <= 1).assertTrue();


      console.info('SUB_ACE_GridRowGutterOption_Default_0300 END');
      done();
    });


  })
}
