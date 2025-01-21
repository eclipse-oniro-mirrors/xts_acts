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
import CommonFunc from '../../../../MainAbility/common/Common';
export default function Gutter_Length_Resource() {
  describe('Gutter_Length_Resource', function () {
    beforeEach(async function (done) {
      console.info("Gutter_Length_Resource beforeEach start");
      let options = {
        url: "MainAbility/pages/Grid/Grid_Row/Grid_Row_Gutter/Grid_Row_Resource",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Gutter_Length_Resource state pages:" + JSON.stringify(pages));
        if (!("Gutter_Length_Resource" == pages.name)) {
          console.info("get Gutter_Length_Resource pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Gutter_Length_Resource page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Gutter_Length_Resource page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Gutter_Length_Resource beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("Gutter_Length_Resource after each called")
    });

    /**
     * @tc.number    SUB_ACE_GRIDROWGUTTERLENGTH_RESOURCE_0100
     * @tc.name      testGutterLengthResource
     * @tc.desc      Set the gutterLength of GridRow to 'app.float.float_1'
     */
    it('SUB_ACE_GridRowGutterLength_RESOURCE_0100', 0, async function (done) {
      console.info('SUB_ACE_GridRowGutterLength_RESOURCE_0100 START');
      await CommonFunc.sleep(2000)

      let LengthResource_1 = CommonFunc.getComponentRect('Length_Resource001');
      let firstLengthResource = CommonFunc.getComponentRect('Length_Resource_0');
      let secondLengthResource = CommonFunc.getComponentRect('Length_Resource_1');
      let thirdLengthResource = CommonFunc.getComponentRect('Length_Resource_2');
      let fourthLengthResource = CommonFunc.getComponentRect('Length_Resource_3');
      let gridRowLengthResourceJson = getInspectorByKey('Length_Resource001');
      let gridRow = JSON.parse(gridRowLengthResourceJson);
      expect(gridRow.$type).assertEqual('GridRow');

      expect(Math.abs(firstLengthResource.top - LengthResource_1.top) <= 1).assertTrue();
      expect(Math.abs(secondLengthResource.top - LengthResource_1.top) <= 1).assertTrue();
      expect(Math.abs(firstLengthResource.left - LengthResource_1.left) <= 1).assertTrue();

      expect(Math.round(secondLengthResource.left - firstLengthResource.right)).assertEqual(Math.round(vp2px(10)));
      expect(Math.round(thirdLengthResource.top - firstLengthResource.bottom)).assertEqual(Math.round(vp2px(10)));

      console.info('SUB_ACE_GridRowGutterLength_RESOURCE_0100 END');
      done();
    });

  })
}
