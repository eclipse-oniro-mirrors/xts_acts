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

export default function row_TextDisplayPriorityTest() {
  describe('Row_TextDisplayPriorityTest', () => {
    beforeEach(async (done: Function) => {
      console.info("Row_TextDisplayPriorityTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/subComponentChanged/Row_TextDisplayPriority',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Row_TextDisplayPriority state pages:" + JSON.stringify(pages));
        if (!("Row_TextDisplayPriority" == pages.name)) {
          console.info("get Row_TextDisplayPriority pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Row_TextDisplayPriority page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Row_TextDisplayPriority page error:" + err);
      }
      console.info("Row_TextDisplayPriorityTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Row_TextDisplayPriorityTest after each called");
    });
    /**
     * @tc.number SUB_ACE_ROW_SUBCOMPONENTCHANGED_1400
     * @tc.name testRowTextDisplayPriority01
     * @tc.desc The size of the parent component in the main axis direction is not enough for the layout
     *               of the child components when the first subcomponent set dsplay_priority to 1,
     *               the second subcomponent set dsplay_priority to 2,the third subcomponent set dsplay_priority to 3
     */
    it('testRowTextDisplayPriority01', 0, async (done: Function) => {
      console.info('[testRowTextDisplayPriority01] START');
      globalThis.value.message.notify({
        name: 'firstTextDisplayPriority', value: 1
      });
      globalThis.value.message.notify({
        name: 'secondTextDisplayPriority', value: 2
      });
      globalThis.value.message.notify({
        name: 'thirdTextDisplayPriority', value: 3
      });
      await CommonFunc.sleep(3000);
      let thirdText: RectValue = CommonFunc.getComponentRect('Row_TextDisplayPriority3');
      let rowContainer: RectValue = CommonFunc.getComponentRect('Row_TextDisplayPriority_Container01');
      let rowContainerStrJson = getInspectorByKey('Row_TextDisplayPriority_Container01');

      expect(JSON.parse(rowContainerStrJson).$type).assertEqual('Row');

      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.right - thirdText.left)) - (Math.round(vp2px(200)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(thirdText.left - rowContainer.left)) - (vp2px(0))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.top - rowContainer.top)) - (Math.round(rowContainer.bottom - thirdText.bottom))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(rowContainer.right - thirdText.right)) - (Math.round(vp2px(150)))) <= 1).assertTrue();
      console.info('[testRowTextDisplayPriority01] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_ROW_SUBCOMPONENTCHANGED_1500
     * @tc.name testRowTextDisplayPriority02
     * @tc.desc The size of the parent component in the main axis direction is not enough for the layout
     *               of the child components when the first subcomponent set dsplay_priority to 2,
     *               the second subcomponent set dsplay_priority to 1,the third subcomponent set dsplay_priority to 3
     */
    it('testRowTextDisplayPriority02', 0, async (done: Function) => {
      console.info('[testRowTextDisplayPriority02] START');
      globalThis.value.message.notify({
        name: 'firstTextDisplayPriority', value: 2
      });
      globalThis.value.message.notify({
        name: 'secondTextDisplayPriority', value: 1
      });
      globalThis.value.message.notify({
        name: 'thirdTextDisplayPriority', value: 3
      });
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('Row_TextDisplayPriority1');
      let secondText: RectValue = CommonFunc.getComponentRect('Row_TextDisplayPriority2');
      let thirdText: RectValue = CommonFunc.getComponentRect('Row_TextDisplayPriority3');
      let rowContainer: RectValue = CommonFunc.getComponentRect('Row_TextDisplayPriority_Container01');
      let rowContainerStrJson = getInspectorByKey('Row_TextDisplayPriority_Container01');

      expect(JSON.parse(rowContainerStrJson).$type).assertEqual('Row');

      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.right - thirdText.left)) - (Math.round(vp2px(200)))) <= 1).assertTrue();


      expect(Math.abs(Math.round(firstText.top - rowContainer.top) - Math.round(rowContainer.bottom - firstText.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(thirdText.top - rowContainer.top) - Math.round(rowContainer.bottom - thirdText.bottom)) <= 1)
        .assertTrue();

      expect(Math.abs(firstText.left - rowContainer.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.left - firstText.right)) - (Math.round(vp2px(10)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(rowContainer.right - thirdText.right)) - (Math.round(vp2px(40)))) <= 1).assertTrue();
      console.info('[testRowTextDisplayPriority02] END');
      done();
    });
  })
}
