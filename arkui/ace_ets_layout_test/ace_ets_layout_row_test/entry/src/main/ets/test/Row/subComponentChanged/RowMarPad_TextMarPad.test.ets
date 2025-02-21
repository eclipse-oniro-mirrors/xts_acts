
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
import CommonFunc from '../../../MainAbility/common/Common';

export default function rowMarPad_TextMarPadTest() {
  describe('RowMarPad_TextMarPadTest', function () {
    beforeEach(async function (done) {
      console.info("RowMarPad_TextMarPadTest beforeEach start");
      let options = {
        url: 'MainAbility/pages/Row/subComponentChanged/RowMarPad_TextMarPad',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RowMarPad_TextMarPad state pages:" + JSON.stringify(pages));
        if (!("RowMarPad_TextMarPad" == pages.name)) {
          console.info("get RowMarPad_TextMarPad pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push RowMarPad_TextMarPad page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RowMarPad_TextMarPad page error:" + err);
      }
      console.info("RowMarPad_TextMarPadTest beforeEach end");
      done();
    });
    afterEach(async function () {
      globalThis.value.message.notify({ name: 'rowPadding', value: 0 });
      globalThis.value.message.notify({ name: 'rowMargin', value: 0 });
      globalThis.value.message.notify({ name: 'firstTextMargin', value: 0 });
      globalThis.value.message.notify({ name: 'firstTextPadding', value: 0 });
      await CommonFunc.sleep(1000);
      console.info("RowMarPad_TextMarPadTest after each called");
    });
    /**
     * @tc.number    SUB_ACE_ROW_SUBCOMPONENTCHANGED_0900
     * @tc.name      testRowMarPadTextPad
     * @tc.desc      The parent component set margin to 5,padding to 10,and the first subcomponent set padding to 10
     */
    it('testRowMarPadTextPad', 0, async function (done) {
      console.info('[testRowMarPadTextPad] START');
      let firstText = CommonFunc.getComponentRect('RowMarPad_TextMarPad1');
      let firstTextTop = firstText.top;
      globalThis.value.message.notify({ name: 'rowMargin', value: 5 });
      globalThis.value.message.notify({ name: 'rowPadding', value: 10 });
      globalThis.value.message.notify({ name: 'firstTextPadding', value: 10 });
      await CommonFunc.sleep(3000);
      firstText = CommonFunc.getComponentRect('RowMarPad_TextMarPad1');
      let secondText = CommonFunc.getComponentRect('RowMarPad_TextMarPad2');
      let thirdText = CommonFunc.getComponentRect('RowMarPad_TextMarPad3');
      let rowContainer = CommonFunc.getComponentRect('RowMarPad_TextMarPad_Container01');
      let columnContainer = CommonFunc.getComponentRect('Column_RowMarPad_TextMarPad_Container01');
      let rowContainerStrJson = getInspectorByKey('RowMarPad_TextMarPad_Container01');
      let rowContainerObj = JSON.parse(rowContainerStrJson);
      expect(rowContainerObj.$type).assertEqual('Row');

      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs(Math.round(firstText.right - firstText.left) - Math.round(secondText.right - secondText.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondText.right - secondText.left) - Math.round(thirdText.right - thirdText.left)) <= 1).assertTrue();

      expect(Math.abs(Math.round(firstText.top - rowContainer.top) - Math.round(rowContainer.bottom - firstText.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondText.top - rowContainer.top) - Math.round(rowContainer.bottom - secondText.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdText.top - rowContainer.top) - Math.round(rowContainer.bottom - thirdText.bottom)) <= 1).assertTrue();

      expect(Math.abs((Math.round((rowContainer.top - columnContainer.top) * 10) / 10) - (Math.round(vp2px(5) * 10) / 10)) <= 1).assertTrue();
      expect(Math.abs((Math.round((firstText.top - firstTextTop) * 10) / 10) - (Math.round(vp2px(5) * 10) / 10)) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.left - rowContainer.left)) - (Math.round(vp2px(10)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.left - firstText.right)) - (Math.round(vp2px(10)))) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondText.left - firstText.right) - Math.round(thirdText.left - secondText.right)) <= 1).assertTrue();

      expect(Math.abs((Math.round(rowContainer.right - thirdText.right)) - (Math.round(vp2px(20)))) <= 1).assertTrue();
      console.info('[testRowMarPadTextPad] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_ROW_SUBCOMPONENTCHANGED_1000
     * @tc.name      testRowMarPadTextMar
     * @tc.desc      The parent component set margin to 5,padding to 10,and the first subcomponent set margin to 10
     */
    it('testRowMarPadTextMar', 0, async function (done) {
      console.info('[testRowMarPadTextMar] START');
      let firstText = CommonFunc.getComponentRect('RowMarPad_TextMarPad1');
      let firstTextTop = firstText.top;
      globalThis.value.message.notify({ name: 'rowMargin', value: 5 });
      globalThis.value.message.notify({ name: 'rowPadding', value: 10 });
      globalThis.value.message.notify({ name: 'firstTextMargin', value: 10 });
      await CommonFunc.sleep(3000);
      firstText = CommonFunc.getComponentRect('RowMarPad_TextMarPad1');
      let secondText = CommonFunc.getComponentRect('RowMarPad_TextMarPad2');
      let thirdText = CommonFunc.getComponentRect('RowMarPad_TextMarPad3');
      let rowContainer = CommonFunc.getComponentRect('RowMarPad_TextMarPad_Container01');
      let columnContainer = CommonFunc.getComponentRect('Column_RowMarPad_TextMarPad_Container01');
      let rowContainerStrJson = getInspectorByKey('RowMarPad_TextMarPad_Container01');
      let rowContainerObj = JSON.parse(rowContainerStrJson);
      expect(rowContainerObj.$type).assertEqual('Row');

      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs(Math.round(firstText.right - firstText.left) - Math.round(secondText.right - secondText.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondText.right - secondText.left) - Math.round(thirdText.right - thirdText.left)) <= 1).assertTrue();

      expect(Math.abs(Math.round(firstText.top - rowContainer.top) - Math.round(rowContainer.bottom - firstText.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondText.top - rowContainer.top) - Math.round(rowContainer.bottom - secondText.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdText.top - rowContainer.top) - Math.round(rowContainer.bottom - thirdText.bottom)) <= 1).assertTrue();

      expect(Math.abs((Math.round((rowContainer.top - columnContainer.top) * 10) / 10) - (Math.round(vp2px(5) * 10) / 10)) <= 1).assertTrue();
      expect(Math.abs((Math.round((firstText.top - firstTextTop) * 10) / 10) - (Math.round(vp2px(5) * 10) / 10)) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.left - rowContainer.left)) - (Math.round(vp2px(20)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.left - firstText.right)) - (Math.round(vp2px(20)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.left - secondText.right)) - (Math.round(vp2px(10)))) <= 1).assertTrue();

      expect(Math.abs(rowContainer.right - thirdText.right) <= 1).assertTrue();
      console.info('[testRowMarPadTextMar] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_ROW_SUBCOMPONENTCHANGED_1100
     * @tc.name      testRowMarPadTextMarPad
     * @tc.desc      The parent component set margin to 5，padding to 10,
     *              and the first subcomponent set margin to 10,padding to 10
     */
    it('testRowMarPadTextMarPad', 0, async function (done) {
      console.info('[testRowMarPadTextMarPad] START');
      let firstText = CommonFunc.getComponentRect('RowMarPad_TextMarPad1');
      let firstTextTop = firstText.top;
      globalThis.value.message.notify({ name: 'rowMargin', value: 5 });
      globalThis.value.message.notify({ name: 'rowPadding', value: 10 });
      globalThis.value.message.notify({ name: 'firstTextMargin', value: 10 });
      globalThis.value.message.notify({ name: 'firstTextPadding', value: 10 });
      await CommonFunc.sleep(3000);
      firstText = CommonFunc.getComponentRect('RowMarPad_TextMarPad1');
      let secondText = CommonFunc.getComponentRect('RowMarPad_TextMarPad2');
      let thirdText = CommonFunc.getComponentRect('RowMarPad_TextMarPad3');
      let rowContainer = CommonFunc.getComponentRect('RowMarPad_TextMarPad_Container01');
      let columnContainer = CommonFunc.getComponentRect('Column_RowMarPad_TextMarPad_Container01');
      let rowContainerStrJson = getInspectorByKey('RowMarPad_TextMarPad_Container01');
      let rowContainerObj = JSON.parse(rowContainerStrJson);
      expect(rowContainerObj.$type).assertEqual('Row');

      expect(Math.abs((Math.round(firstText.bottom - firstText.top)) - (Math.round(vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.bottom - secondText.top)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.bottom - thirdText.top)) - (Math.round(vp2px(150)))) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.right - firstText.left)) - (Math.round(vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs(Math.round(firstText.right - firstText.left) - Math.round(secondText.right - secondText.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondText.right - secondText.left) - Math.round(thirdText.right - thirdText.left)) <= 1).assertTrue();

      expect(Math.abs(Math.round(firstText.top - rowContainer.top) - Math.round(rowContainer.bottom - firstText.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(secondText.top - rowContainer.top) - Math.round(rowContainer.bottom - secondText.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdText.top - rowContainer.top) - Math.round(rowContainer.bottom - thirdText.bottom)) <= 1).assertTrue();

      expect(Math.abs((Math.round((rowContainer.top - columnContainer.top) * 10) / 10) - (Math.round(vp2px(5) * 10) / 10)) <= 1).assertTrue();
      expect(Math.abs((Math.round((firstText.top - firstTextTop) * 10) / 10) - (Math.round(vp2px(5) * 10) / 10)) <= 1).assertTrue();

      expect(Math.abs((Math.round(firstText.left - rowContainer.left)) - (Math.round(vp2px(20)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(secondText.left - firstText.right)) - (Math.round(vp2px(20)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(thirdText.left - secondText.right)) - (Math.round(vp2px(10)))) <= 1).assertTrue();

      expect(Math.abs(rowContainer.right - thirdText.right) <= 1).assertTrue();
      console.info('[testRowMarPadTextMarPad] END');
      done();
    });
  })
}
