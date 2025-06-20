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

export default function rowPad_TextMarPadTest() {
  describe('rowPad_TextMarPadTest', () => {
    beforeEach(async (done: Function) => {
      console.info("rowPad_TextMarPadTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/subComponentChanged/RowPad_TextMarPad',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RowPad_TextMarPad state pages:" + JSON.stringify(pages));
        if (!("RowPad_TextMarPad" == pages.name)) {
          console.info("get RowPad_TextMarPad pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RowPad_TextMarPad page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RowPad_TextMarPad page error:" + err);
      }
      console.info("rowPad_TextMarPadTest beforeEach end");
      done();
    });
    afterEach(async () => {
      globalThis.value.message.notify({
        name: 'rowPadding', value: 0
      });
      globalThis.value.message.notify({
        name: 'firstTextMargin', value: 0
      });
      globalThis.value.message.notify({
        name: 'firstTextPadding', value: 0
      });
      await CommonFunc.sleep(1000);
      console.info("rowPad_TextMarPadTest after each called");
    });
    /**
     * @tc.number SUB_ACE_ROW_SUBCOMPONENTCHANGED_0300
     * @tc.name testRowPadTextPad
     * @tc.desc The parent component set padding to 10,and the first subcomponent set padding to 20
     */
    it('testRowPadTextPad',  Level.LEVEL0, async (done: Function) => {
      console.info('[testRowPadTextPad] START');
      globalThis.value.message.notify({
        name: 'rowPadding', value: 10
      });
      globalThis.value.message.notify({
        name: 'firstTextPadding', value: 20
      });
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('RowPad_TextMarPad1');
      let secondText: RectValue = CommonFunc.getComponentRect('RowPad_TextMarPad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('RowPad_TextMarPad3');
      let rowContainer: RectValue = CommonFunc.getComponentRect('RowPad_TextMarPad_Container01');
      let rowContainerStrJson = getInspectorByKey('RowPad_TextMarPad_Container01');

      expect(JSON.parse(rowContainerStrJson).$type).assertEqual('Row');

      expect(Math.floor(Math.abs((firstText.bottom - firstText.top) - vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.bottom - secondText.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.bottom - thirdText.top) - vp2px(150))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.right - firstText.left) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.right - firstText.left) - (secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((secondText.right - secondText.left) - (thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((firstText.top - rowContainer.top) - (rowContainer.bottom - firstText.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((secondText.top - rowContainer.top) - (rowContainer.bottom - secondText.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((thirdText.top - rowContainer.top) - (rowContainer.bottom - thirdText.bottom))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((firstText.left - rowContainer.left) - vp2px(10))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((secondText.left - firstText.right) - vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.left - firstText.right) - (thirdText.left - secondText.right))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((rowContainer.right - thirdText.right) - vp2px(20))) <= 1).assertTrue();
      console.info('[testRowPadTextPad] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_ROW_SUBCOMPONENTCHANGED_0400
     * @tc.name testRowPadTextMar
     * @tc.desc The parent component set padding to 10,and the first subcomponent set margin to 10
     */
    it('testRowPadTextMar',  Level.LEVEL0, async (done: Function) => {
      console.info('[testRowPadTextMar] START');
      globalThis.value.message.notify({
        name: 'rowPadding', value: 10
      });
      globalThis.value.message.notify({
        name: 'firstTextMargin', value: 10
      });
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('RowPad_TextMarPad1');
      let secondText: RectValue = CommonFunc.getComponentRect('RowPad_TextMarPad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('RowPad_TextMarPad3');
      let rowContainer: RectValue = CommonFunc.getComponentRect('RowPad_TextMarPad_Container01');
      let rowContainerStrJson = getInspectorByKey('RowPad_TextMarPad_Container01');

      expect(JSON.parse(rowContainerStrJson).$type).assertEqual('Row');

      expect(Math.floor(Math.abs((firstText.bottom - firstText.top) - vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.bottom - secondText.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.bottom - thirdText.top) - vp2px(150))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.right - firstText.left) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.right - firstText.left) - (secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((secondText.right - secondText.left) - (thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((firstText.top - rowContainer.top) - (rowContainer.bottom - firstText.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((secondText.top - rowContainer.top) - (rowContainer.bottom - secondText.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((thirdText.top - rowContainer.top) - (rowContainer.bottom - thirdText.bottom))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((firstText.left - rowContainer.left) - vp2px(20))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((secondText.left - firstText.right) - vp2px(20))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.left - secondText.right) - vp2px(10))) <= 1).assertTrue();

      expect(Math.floor(Math.abs(rowContainer.right - thirdText.right)) <= 2).assertTrue();
      console.info('[testRowPadTextMar] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_ROW_SUBCOMPONENTCHANGED_0500
     * @tc.name testRowPadTextMarPad
     * @tc.desc The parent component set padding to 10,and the first subcomponent set margin to 10
     *              ,set padding to 20
     */
    it('testRowPadTextMarPad',  Level.LEVEL0, async (done: Function) => {
      console.info('[testRowPadTextMarPad] START');
      globalThis.value.message.notify({
        name: 'rowPadding', value: 10
      });
      globalThis.value.message.notify({
        name: 'firstTextMargin', value: 10
      });
      globalThis.value.message.notify({
        name: 'firstTextPadding', value: 20
      });
      await CommonFunc.sleep(3000);
      let firstText: RectValue = CommonFunc.getComponentRect('RowPad_TextMarPad1');
      let secondText: RectValue = CommonFunc.getComponentRect('RowPad_TextMarPad2');
      let thirdText: RectValue = CommonFunc.getComponentRect('RowPad_TextMarPad3');
      let rowContainer: RectValue = CommonFunc.getComponentRect('RowPad_TextMarPad_Container01');
      let rowContainerStrJson = getInspectorByKey('RowPad_TextMarPad_Container01');

      expect(JSON.parse(rowContainerStrJson).$type).assertEqual('Row');

      expect(Math.floor(Math.abs((firstText.bottom - firstText.top) - vp2px(50))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((secondText.bottom - secondText.top) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.bottom - thirdText.top) - vp2px(150))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((firstText.right - firstText.left) - vp2px(100))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((firstText.right - firstText.left) - (secondText.right - secondText.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((secondText.right - secondText.left) - (thirdText.right - thirdText.left))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((firstText.top - rowContainer.top) - (rowContainer.bottom - firstText.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((secondText.top - rowContainer.top) - (rowContainer.bottom - secondText.bottom))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((thirdText.top - rowContainer.top) - (rowContainer.bottom - thirdText.bottom))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((firstText.left - rowContainer.left) - vp2px(20))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((secondText.left - firstText.right) - vp2px(20))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdText.left - secondText.right) - vp2px(10))) <= 1).assertTrue();

      expect(Math.floor(Math.abs(rowContainer.right - thirdText.right)) <= 2).assertTrue();
      console.info('[testRowPadTextMarPad] END');
      done();
    });
  })
}
