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

export default function row_TextFlexShrinkTest() {
  describe('Row_TextFlexShrinkTest', () => {
    beforeEach(async (done: Function) => {
      console.info("row_TextFlexShrinkTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/subComponentChanged/Row_TextFlexShrink',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Row_TextFlexShrink state pages:" + JSON.stringify(pages));
        if (!("Row_TextFlexShrink" == pages.name)) {
          console.info("get Row_TextFlexShrink pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Row_TextFlexShrink page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Row_TextFlexShrink page error:" + err);
      }
      console.info("Row_TextFlexShrink beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Row_TextFlexShrinkTest after each called");
    });
    /**
     * @tc.number SUB_ACE_ROW_SUBCOMPONENTCHANGED_1700
     * @tc.name testRowTextFlexShrink
     * @tc.desc The flexshink of the child components set to 1
     */
    it('testRowTextFlexShrink',  Level.LEVEL0, async (done: Function) => {
      console.info('[testRowTextFlexShrink] START');
      globalThis.value.message.notify({
        name: 'secondTextFlexShrink', value: 1
      });
      globalThis.value.message.notify({
        name: 'thirdTextFlexShrink', value: 1
      });
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('Row_TextFlexShrink1');
      let secondText: RectValue = CommonFunc.getComponentRect('Row_TextFlexShrink2');
      let thirdText: RectValue = CommonFunc.getComponentRect('Row_TextFlexShrink3');
      let rowContainer: RectValue = CommonFunc.getComponentRect('Row_TextFlexShrink_Container01');
      let rowContainerStrJson = getInspectorByKey('Row_TextFlexShrink_Container01');

      expect(JSON.parse(rowContainerStrJson).$type).assertEqual('Row');

      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.right - secondText.left)) - (Math.round(vp2px(90)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.right - thirdText.left)) - (Math.round(vp2px(90)))) <= 1).assertTrue();

      expect(Math.abs(Math.round(firstText.top - rowContainer.top) - Math.round(rowContainer.bottom - firstText.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(secondText.top - rowContainer.top) - Math.round(rowContainer.bottom - secondText.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(thirdText.top - rowContainer.top) - Math.round(rowContainer.bottom - thirdText.bottom)) <= 1)
        .assertTrue();

      expect(Math.abs(firstText.left - rowContainer.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.left - firstText.right)) - (Math.round(vp2px(10)))) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondText.left - firstText.right) - Math.round(thirdText.left - secondText.right)) <= 1)
        .assertTrue();

      expect(Math.abs(rowContainer.right - thirdText.right) <= 1).assertTrue();
      console.info('[testRowTextFlexShrink] END');
      done();
    });
  })
}
