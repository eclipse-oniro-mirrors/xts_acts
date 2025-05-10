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

export default function Gutter_Length_Default() {
  describe('Gutter_Length_Default', () => {
    beforeEach(async (done: Function) => {
      console.info("Gutter_Length_Default beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_Row/Grid_Row_Gutter/Grid_Row_Default",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Gutter_Length_Default state pages:" + JSON.stringify(pages));
        if (!("Gutter_Length_Default" == pages.name)) {
          console.info("get Gutter_Length_Default pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Gutter_Length_Default page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Gutter_Length_Default page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Gutter_Length_Default beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Gutter_Length_Default after each called")
    });

    /**
     * @tc.number SUB_ACE_GRIDROWGUTTERLENGTH_DEFAULT_0100
     * @tc.name testGutterLengthDefault
     * @tc.desc Set the gutterLength of GridRow to 0
     */
    it('SUB_ACE_GridRowGutterLength_Default_0100', 0, async (done: Function) => {
      console.info('SUB_ACE_GridRowGutterLength_Default_0100 START');
      await CommonFunc.sleep(2000)

      let LengthNoSet_1: RectValue = CommonFunc.getComponentRect('Length_NoChange001');
      let firstLengthNoSet: RectValue = CommonFunc.getComponentRect('Length_NoChange_0');
      let secondLengthNoSet: RectValue = CommonFunc.getComponentRect('Length_NoChange_1');
      let gridRowGutterLengthStrJson = getInspectorByKey('Length_NoChange001');
      let gridRowGutter: ESObject = JSON.parse(gridRowGutterLengthStrJson);
      expect(gridRowGutter.$type).assertEqual('GridRow');

      expect(firstLengthNoSet.top).assertEqual(LengthNoSet_1.top);
      expect(firstLengthNoSet.left).assertEqual(LengthNoSet_1.left);

      expect(Math.round(secondLengthNoSet.top - firstLengthNoSet.bottom)).assertEqual(Math.round(vp2px(0)));

      console.info('SUB_ACE_GridRowGutterLength_Default_0100 END');
      done();
    });

  })
}
