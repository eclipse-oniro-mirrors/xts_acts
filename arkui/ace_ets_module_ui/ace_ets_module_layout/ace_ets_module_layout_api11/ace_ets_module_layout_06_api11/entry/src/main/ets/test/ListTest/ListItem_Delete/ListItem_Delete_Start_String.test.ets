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
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  UiDirection,
  MouseButton
} from '@ohos.UiTest';

export default function ListItem_Delete_Start_String() {
  describe('ListItem_Delete_Start_String', () => {
    beforeEach(async (done: Function) => {
      console.info("ListItem_Delete_Start_String beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/ListItem_Delete/ListItem_Delete_Start_String',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ListItem_Delete_Start_String state pages:" + JSON.stringify(pages));
        if (!("ListItem_Delete_Start_String" == pages.name)) {
          console.info("get ListItem_Delete_Start_String pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ListItem_Delete_Start_String page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ListItem_Delete_Start_String page error:" + err);
      }
      console.info("ListItem_Delete_Start_String beforeEach end");
      done();
    });
    afterEach(async () => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      console.log('button click')
      let btn = await driver.findComponent(ON.id('ListItem_Delete_Start_String_button1'));
      await btn.click();
      await CommonFunc.sleep(3000);
      console.info("ListItem_Delete_Start_String after each called");
    });
    /**
     * @tc.name   SUB_ACE_ListItem_Delete_Start_String_0100
     * @tc.number SUB_ACE_ListItem_Delete_Start_String_0100
     * @tc.desc   Set actionAreaDistance to 'abc' and slide 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_ListItem_Delete_Start_String_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_ListItem_Delete_Start_String_0100] START');
      await CommonFunc.sleep(1000);
      let ListItem_00: RectValue = CommonFunc.getComponentRect('ListItem_Delete_Start_String_ListItem_00');
      let ListItem_01: RectValue = CommonFunc.getComponentRect('ListItem_Delete_Start_String_ListItem_01');
      let right: number = ListItem_00.right;
      let left: number = ListItem_00.left;
      let top: number = ListItem_00.top;
      let bottom: number = ListItem_00.bottom;
      let width = right - left;
      let height = bottom -top;
      console.info("SUB_ACE_ListItem_Delete_Start_String_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);

      let driver = Driver.create();
      await driver.swipe(
        Math.round(globalThis.winLeft + left + vp2px(60)), Math.round(globalThis.winTop + top + height/2), Math.round(globalThis.winLeft + right - vp2px(10)), Math.round(globalThis.winTop  + top + height/2)
      );
      await CommonFunc.sleep(2000);

      let text_011 = getInspectorByKey('ListItem_Delete_Start_String_text_01');

      expect(JSON.parse(text_011).$attrs.content).assertEqual('not enterEndDeleteArea');

      let text_022 = getInspectorByKey('ListItem_Delete_Start_String_text_02');

      expect(JSON.parse(text_022).$attrs.content).assertEqual('not exitEndDeleteArea');

      let text_033 = getInspectorByKey('ListItem_Delete_Start_String_text_03');

      expect(JSON.parse(text_033).$attrs.content).assertEqual('5');

      console.info('[SUB_ACE_ListItem_Delete_Start_String_0100] END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_ListItem_Delete_Start_String_0200
     * @tc.number SUB_ACE_ListItem_Delete_Start_String_0200
     * @tc.desc   Set actionAreaDistance to ''10%'' and slide 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_ListItem_Delete_Start_String_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_ListItem_Delete_Start_String_0200] START');
      globalThis.value.message.notify({
        name: 'actionAreaDistance', value: '10%'
      });
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      console.log('button click')
      let btn = await driver.findComponent(ON.id('ListItem_Delete_Start_String_button1'));
      await btn.click();
      await CommonFunc.sleep(2000);

      let ListItem_00: RectValue = CommonFunc.getComponentRect('ListItem_Delete_Start_String_ListItem_00');
      let ListItem_01: RectValue = CommonFunc.getComponentRect('ListItem_Delete_Start_String_ListItem_01');
      let right: number = ListItem_00.right;
      let left: number = ListItem_00.left;
      let top: number = ListItem_00.top;
      let bottom: number = ListItem_00.bottom;
      let width = right - left;
      let height = bottom -top;
      console.info("SUB_ACE_ListItem_Delete_Start_String_0200 value is" + left + " --" + right + "--" + top + "--" + bottom);

      await driver.swipe(
        Math.round(globalThis.winLeft + left + vp2px(60)), Math.round(globalThis.winTop + top + height/2), Math.round(globalThis.winLeft + left + vp2px(120)), Math.round(globalThis.winTop  + top + height/2)
      );
      await CommonFunc.sleep(2000);

      let text_011 = getInspectorByKey('ListItem_Delete_Start_String_text_01');

      expect(JSON.parse(text_011).$attrs.content).assertEqual('not enterEndDeleteArea');

      let text_022 = getInspectorByKey('ListItem_Delete_Start_String_text_02');

      expect(JSON.parse(text_022).$attrs.content).assertEqual('not exitEndDeleteArea');

      let text_033 = getInspectorByKey('ListItem_Delete_Start_String_text_03');

      expect(JSON.parse(text_033).$attrs.content).assertEqual('5');

      console.info('[SUB_ACE_ListItem_Delete_Start_String_0200] END');
      done();
    });


  })
}
