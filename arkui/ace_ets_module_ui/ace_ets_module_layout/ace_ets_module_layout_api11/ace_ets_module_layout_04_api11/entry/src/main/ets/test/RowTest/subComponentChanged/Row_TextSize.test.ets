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

export default function row_TextSizeTest() {
  describe('Row_TextSizeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("Row_TextSizeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/subComponentChanged/Row_TextSize',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Row_TextSize state pages:" + JSON.stringify(pages));
        if (!("Row_TextSize" == pages.name)) {
          console.info("get Row_TextSize pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Row_TextSize page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Row_TextSize page error:" + err);
      }
      console.info("Row_TextSizeTest beforeEach end");
      done();
    });
    afterEach(async () => {
      globalThis.value.message.notify({
        name: 'width', value: 100
      });
      globalThis.value.message.notify({
        name: 'height', value: 50
      });
      await CommonFunc.sleep(1000);
      console.info("Row_TextSizeTest after each called");
    });
    /**
     * @tc.number SUB_ACE_ROW_SUBCOMPONENTCHANGED_0100
     * @tc.name testRowTextSizeHeight
     * @tc.desc The height of the first subcomponent changed
     */
    it('testRowTextSizeHeight', 0, async (done: Function) => {
      console.info('[testRowTextSizeHeight] START');
      let secondText: RectValue = CommonFunc.getComponentRect('Row_TextSize2');
      let secondTextTop: number = secondText.top;
      let secondTextLeft: number = secondText.left;
      globalThis.value.message.notify({
        name: 'height', value: 130
      });
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('Row_TextSize1');
      secondText = CommonFunc.getComponentRect('Row_TextSize2');
      let thirdText: RectValue = CommonFunc.getComponentRect('Row_TextSize3');
      let rowContainer: RectValue = CommonFunc.getComponentRect('Row_TextSize_Container01');
      let rowContainerStrJson = getInspectorByKey('Row_TextSize_Container01');

      expect(JSON.parse(rowContainerStrJson).$type).assertEqual('Row');

      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(vp2px(130)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs(Math.round(firstText.right - firstText.left) - Math.round(secondText.right - secondText.left)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(secondText.right - secondText.left) - Math.round(thirdText.right - thirdText.left)) <= 1)
        .assertTrue();

      expect(Math.abs(firstText.left - rowContainer.left) <= 1).assertTrue();
      expect(Math.abs(Math.round(firstText.top - rowContainer.top) - Math.round(rowContainer.bottom - firstText.bottom)) <= 1)
        .assertTrue();

      expect(Math.abs(secondText.top - secondTextTop) <= 1).assertTrue();
      expect(Math.abs(secondText.left - secondTextLeft) <= 1).assertTrue();

      expect(Math.abs((Math.round(secondText.left - firstText.right)) - (Math.round(vp2px(10)))) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondText.left - firstText.right) - Math.round(thirdText.left - secondText.right)) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(rowContainer.right - thirdText.right)) - (Math.round(vp2px(30)))) <= 1).assertTrue();
      console.info('[testRowTextSizeHeight] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_ROW_SUBCOMPONENTCHANGED_0200
     * @tc.name testRowTextSizeWidth
     * @tc.desc The width of the first subcomponent changed
     */
    it('testRowTextSizeWidth', 0, async (done: Function) => {
      console.info('[testRowTextSizeWidth] START');
      let secondText: RectValue = CommonFunc.getComponentRect('Row_TextSize2');
      let secondTextTop: number = secondText.top;
      let secondTextLeft: number = secondText.left;
      globalThis.value.message.notify({
        name: 'width', value: 130
      });
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('Row_TextSize1');
      secondText = CommonFunc.getComponentRect('Row_TextSize2');
      let thirdText: RectValue = CommonFunc.getComponentRect('Row_TextSize3');
      let rowContainer: RectValue = CommonFunc.getComponentRect('Row_TextSize_Container01');
      let rowContainerStrJson = getInspectorByKey('Row_TextSize_Container01');

      expect(JSON.parse(rowContainerStrJson).$type).assertEqual('Row');

      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(vp2px(130)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.right - secondText.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.right - secondText.left)) - (Math.round(thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.abs((firstText.left) - (rowContainer.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(firstText.top - rowContainer.top)) - (Math.round(rowContainer.bottom - firstText.bottom))) <= 1)
        .assertTrue();

      expect(Math.abs((secondText.top) - (secondTextTop)) <= 1).assertTrue();
      expect(Math.abs((secondText.left) - (secondTextLeft + vp2px(30))) <= 1).assertTrue();

      expect(Math.abs((Math.round(secondText.left - firstText.right)) - (Math.round(vp2px(10)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.left - firstText.right)) - (Math.round(thirdText.left - secondText.right))) <= 1)
        .assertTrue();

      expect(Math.abs((rowContainer.right) - (thirdText.right)) <= 1).assertTrue();
      console.info('[testRowTextSizeWidth] END');
      done();
    });
  })
}
