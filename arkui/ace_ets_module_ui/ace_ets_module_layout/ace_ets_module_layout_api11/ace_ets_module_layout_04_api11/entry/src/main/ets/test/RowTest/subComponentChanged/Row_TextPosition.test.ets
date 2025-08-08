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

export default function row_TextPositionTest() {
  describe('Row_TextPositionTest', () => {
    beforeEach(async (done: Function) => {
      console.info("Row_TextPositionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/subComponentChanged/Row_TextPosition',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Row_TextPosition state pages:" + JSON.stringify(pages));
        if (!("Row_TextPosition" == pages.name)) {
          console.info("get Row_TextPosition pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Row_TextPosition page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Row_TextPosition page error:" + err);
      }
      console.info("Row_TextPositionTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Row_TextSizeTest after each called");
    });
    /**
     * @tc.number SUB_ACE_ROW_SUBCOMPONENTCHANGED_1200
     * @tc.name testRowTextPosition
     * @tc.desc The position of first subcomponent changed
     */
    it('testRowTextPosition', 0, async (done: Function) => {
      console.info('[testRowTextPosition] START');
      globalThis.value.message.notify({
        name: 'position', value: {
          x: 10, y: 10
        }
      });
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('Row_TextPosition1');
      let secondText: RectValue = CommonFunc.getComponentRect('Row_TextPosition2');
      let thirdText: RectValue = CommonFunc.getComponentRect('Row_TextPosition3');
      let rowContainer: RectValue = CommonFunc.getComponentRect('Row_TextPosition_Container01');
      let rowContainerStrJson = getInspectorByKey('Row_TextPosition_Container01');

      expect(JSON.parse(rowContainerStrJson).$type).assertEqual('Row');

      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs(Math.round(firstText.right - firstText.left) - Math.round(secondText.right - secondText.left)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(secondText.right - secondText.left) - Math.round(thirdText.right - thirdText.left)) <= 1)
        .assertTrue();


      expect(Math.abs(Math.round(secondText.top - rowContainer.top) - Math.round(rowContainer.bottom - secondText.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(thirdText.top - rowContainer.top) - Math.round(rowContainer.bottom - thirdText.bottom)) <= 1)
        .assertTrue();

      expect(Math.abs(secondText.left - rowContainer.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.left - secondText.right)) - (Math.round(vp2px(10)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.left - rowContainer.left)) - (Math.round(vp2px(10)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(firstText.top - rowContainer.top)) - (Math.round(vp2px(10)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(rowContainer.right - thirdText.right)) - (Math.round(vp2px(140)))) <= 1).assertTrue();
      console.info('[testRowTextPosition] END');
      done();
    });
  })
}
