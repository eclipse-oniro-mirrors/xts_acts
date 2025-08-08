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
import CommonFunc, { RectValue } from '../../../../MainAbility/common/Common';

export default function Grid_Row_GutterOption_String() {
  describe('Grid_Row_GutterOption_String', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_Row_GutterOption_String beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_Row/Grid_Row_GutterOption/Grid_Row_GutterOption_String",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_Row_GutterOption_String state pages:" + JSON.stringify(pages));
        if (!("Grid_Row_GutterOption_String" == pages.name)) {
          console.info("get Grid_Row_GutterOption_String pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_Row_GutterOption_String page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_Row_GutterOption_String page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Grid_Row_GutterOption_String beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Grid_Row_GutterOption_String after each called")
    });

    /**
     * @tc.number SUB_ACE_GRIDROWGUTTEROPTION_STRING_0100
     * @tc.name testGutterLengthString
     * @tc.desc Set the GridRowSizeOption of GridRow to '80px'
     */
    it('SUB_ACE_GridRowGutterOption_STRING_0100', 0, async (done: Function) => {
      console.info('SUB_ACE_GridRowGutterOption_STRING_0100 START');
      globalThis.value.message.notify({
        name: 'length', value: '80px'
      })
      await CommonFunc.sleep(2000)

      let firstGutterOptionStr: RectValue = CommonFunc.getComponentRect('Grid_Row_GutterOption_String0');
      let secondGutterOptionStr: RectValue = CommonFunc.getComponentRect('Grid_Row_GutterOption_String1');
      let thirdGutterOptionStr: RectValue = CommonFunc.getComponentRect('Grid_Row_GutterOption_String2');

      expect(Math.round(secondGutterOptionStr.left - firstGutterOptionStr.right)).assertEqual(Math.round(80));
      expect(Math.round(thirdGutterOptionStr.top - firstGutterOptionStr.bottom)).assertEqual(Math.round(80));

      console.info('SUB_ACE_GridRowGutterOption_STRING_0100 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_GRIDROWGUTTEROPTION_STRING_0200
     * @tc.name testGutterLengthString
     * @tc.desc Set the GridRowSizeOption of GridRow to '30%'
     */
    it('SUB_ACE_GridRowGutterOption_STRING_0200', 0, async (done: Function) => {
      console.info('SUB_ACE_GridRowGutterOption_STRING_0200 START');
      globalThis.value.message.notify({
        name: 'length', value: '30%'
      })
      await CommonFunc.sleep(2000)

      let firstGutterOptionStr: RectValue = CommonFunc.getComponentRect('Grid_Row_GutterOption_String0');
      let secondGutterOptionStr: RectValue = CommonFunc.getComponentRect('Grid_Row_GutterOption_String1');
      let thirdGutterOptionStr: RectValue = CommonFunc.getComponentRect('Grid_Row_GutterOption_String2');

      expect(Math.abs(Math.round(secondGutterOptionStr.left - firstGutterOptionStr.right) - Math.round(0)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(thirdGutterOptionStr.top - firstGutterOptionStr.bottom) - Math.round(0)) <= 1)
        .assertTrue();

      console.info('SUB_ACE_GridRowGutterOption_STRING_0200 END');
      done();
    });
  })
}
