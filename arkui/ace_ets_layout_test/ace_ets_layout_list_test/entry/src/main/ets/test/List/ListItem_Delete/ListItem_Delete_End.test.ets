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

export default function ListItem_Delete_End() {
  describe('ListItem_Delete_End', () => {
    beforeEach(async (done: Function) => {
      console.info("ListItem_Delete_End beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/ListItem_Delete/ListItem_Delete_End',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ListItem_Delete_End state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get ListItem_Delete_End pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ListItem_Delete_End page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ListItem_Delete_End page error:" + err);
      }
      console.info("ListItem_Delete_End beforeEach end");
      done();
    });
    afterEach(async () => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      console.log('button click')
      let btn = await driver.findComponent(ON.id('ListItem_Delete_End_button1'));
      await btn.click();
      await CommonFunc.sleep(3000);
    });

    /**
     * @tc.number SUB_ACE_ListItem_Delete_End_0200
     * @tc.name testListItem
     * @tc.desc Set actionAreaDistance to 100 and slide 200
     */
    it('SUB_ACE_ListItem_Delete_End_0200', 0, async (done: Function) => {
      console.info('[SUB_ACE_ListItem_Delete_End_0200] START');
      globalThis.value.message.notify({
        name: 'actionAreaDistance', value: 100
      });
      await CommonFunc.sleep(1000);
      console.log('get Initial value')
      let ListItem_00: RectValue = CommonFunc.getComponentRect('ListItem_Delete_End_ListItem_00');

      console.log('slide ')
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      await driver.swipe(
        Math.round(globalThis.winLeft + vp2px(300)), Math.round(globalThis.winTop + vp2px(50)), Math.round(globalThis.winLeft + vp2px(50)), Math.round(globalThis.winTop + vp2px(50))
      );
      await CommonFunc.sleep(2000);

      let text_011 = getInspectorByKey('ListItem_Delete_End_text_01');

      expect(JSON.parse(text_011).$attrs.content).assertEqual('enterEndDeleteArea');

      let text_022 = getInspectorByKey('ListItem_Delete_End_text_02');

      expect(JSON.parse(text_022).$attrs.content).assertEqual('not exitEndDeleteArea');

      let text_033 = getInspectorByKey('ListItem_Delete_End_text_03');

      expect(JSON.parse(text_033).$attrs.content).assertEqual('4');

      console.log('get Initial ListItem_01 and List_1 value')
      let ListItem_01: RectValue = CommonFunc.getComponentRect('ListItem_Delete_End_ListItem_01');
      let List_1: RectValue = CommonFunc.getComponentRect('ListItem_Delete_End_List_1');

      console.log('assert position ')
      expect(ListItem_01.top).assertEqual(List_1.top);
      console.log('ListItem_01.top ' + ListItem_01.top)
      console.log('List_1.top ' + List_1.top)


      console.info('[SUB_ACE_ListItem_Delete_End_0200] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_ListItem_Delete_End_0300
     * @tc.name testListItem
     * @tc.desc Set actionAreaDistance to 100 and slide 80
     */
    it('SUB_ACE_ListItem_Delete_End_0300', 0, async (done: Function) => {
      console.info('[SUB_ACE_ListItem_Delete_End_0300] START');
      globalThis.value.message.notify({
        name: 'actionAreaDistance', value: 100
      });
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      console.log('button click')
      let btn = await driver.findComponent(ON.id('ListItem_Delete_End_button1'));
      await btn.click();
      await CommonFunc.sleep(2000);

      let ListItem_00: RectValue = CommonFunc.getComponentRect('ListItem_Delete_End_ListItem_00');
      let ListItem_01: RectValue = CommonFunc.getComponentRect('ListItem_Delete_End_ListItem_01');


      console.log('slide ')
      await driver.swipe(
        Math.round(globalThis.winLeft + vp2px(300)), Math.round(globalThis.winTop + vp2px(50)), Math.round(globalThis.winLeft + vp2px(220)), Math.round(globalThis.winTop + vp2px(50))
      );
      await CommonFunc.sleep(2000);

      let text_011 = getInspectorByKey('ListItem_Delete_End_text_01');

      expect(JSON.parse(text_011).$attrs.content).assertEqual('not enterEndDeleteArea');

      let text_022 = getInspectorByKey('ListItem_Delete_End_text_02');

      expect(JSON.parse(text_022).$attrs.content).assertEqual('not exitEndDeleteArea');

      let text_033 = getInspectorByKey('ListItem_Delete_End_text_03');

      expect(JSON.parse(text_033).$attrs.content).assertEqual('5');

      console.info('[SUB_ACE_ListItem_Delete_End_0300] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_ListItem_Delete_End_0400
     * @tc.name testListItem
     * @tc.desc Set actionAreaDistance to 0 and slide 50
     */
    it('SUB_ACE_ListItem_Delete_End_0400', 0, async (done: Function) => {
      console.info('[SUB_ACE_ListItem_Delete_End_0400] START');
      globalThis.value.message.notify({
        name: 'actionAreaDistance', value: 0
      });
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('ListItem_Delete_End_button1'));
      await btn.click();
      await CommonFunc.sleep(2000);

      let ListItem_00: RectValue = CommonFunc.getComponentRect('ListItem_Delete_End_ListItem_00');
      let ListItem_01: RectValue = CommonFunc.getComponentRect('ListItem_Delete_End_ListItem_01');


      console.log('slide ')

      await driver.swipe(
        Math.round(globalThis.winLeft + vp2px(300)), Math.round(globalThis.winTop + vp2px(50)), Math.round(globalThis.winLeft + vp2px(50)), Math.round(globalThis.winTop + vp2px(50))
      );
      await CommonFunc.sleep(2000);

      let text_011 = getInspectorByKey('ListItem_Delete_End_text_01');

      expect(JSON.parse(text_011).$attrs.content).assertEqual('not enterEndDeleteArea');

      let text_022 = getInspectorByKey('ListItem_Delete_End_text_02');

      expect(JSON.parse(text_022).$attrs.content).assertEqual('not exitEndDeleteArea');

      let text_033 = getInspectorByKey('ListItem_Delete_End_text_03');

      expect(JSON.parse(text_033).$attrs.content).assertEqual('5');

      console.info('[SUB_ACE_ListItem_Delete_End_0400] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_ListItem_Delete_End_0500
     * @tc.name testListItem
     * @tc.desc Set actionAreaDistance to -100 and slide 50
     */
    it('SUB_ACE_ListItem_Delete_End_0500', 0, async (done: Function) => {
      console.info('[SUB_ACE_ListItem_Delete_End_0500] START');
      globalThis.value.message.notify({
        name: 'actionAreaDistance', value: -100
      });
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('ListItem_Delete_End_button1'));
      await btn.click();
      await CommonFunc.sleep(2000);


      let ListItem_00: RectValue = CommonFunc.getComponentRect('ListItem_Delete_End_ListItem_00');
      let ListItem_01: RectValue = CommonFunc.getComponentRect('ListItem_Delete_End_ListItem_01');

      console.log('slide ')

      await driver.swipe(
        Math.round(globalThis.winLeft + vp2px(300)), Math.round(globalThis.winTop + vp2px(50)), Math.round(globalThis.winLeft + vp2px(50)), Math.round(globalThis.winTop + vp2px(50))
      );
      await CommonFunc.sleep(2000);

      let text_011 = getInspectorByKey('ListItem_Delete_End_text_01');

      expect(JSON.parse(text_011).$attrs.content).assertEqual('not enterEndDeleteArea');

      let text_022 = getInspectorByKey('ListItem_Delete_End_text_02');

      expect(JSON.parse(text_022).$attrs.content).assertEqual('not exitEndDeleteArea');

      let text_033 = getInspectorByKey('ListItem_Delete_End_text_03');

      expect(JSON.parse(text_033).$attrs.content).assertEqual('5');

      console.info('[SUB_ACE_ListItem_Delete_End_0500] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_ListItem_Delete_End_0600
     * @tc.name testListItem
     * @tc.desc Set actionAreaDistance to 400 and slide 50
     */
    it('SUB_ACE_ListItem_Delete_End_0600', 0, async (done: Function) => {
      console.info('[SUB_ACE_ListItem_Delete_End_0600] START');
      globalThis.value.message.notify({
        name: 'actionAreaDistance', value: 400
      });
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('ListItem_Delete_End_button1'));
      await btn.click();
      await CommonFunc.sleep(2000);


      let ListItem_00: RectValue = CommonFunc.getComponentRect('ListItem_Delete_End_ListItem_00');
      let ListItem_01: RectValue = CommonFunc.getComponentRect('ListItem_Delete_End_ListItem_01');

      console.log('slide ')
      await driver.swipe(
        Math.round(globalThis.winLeft + vp2px(300)), Math.round(globalThis.winTop + vp2px(50)), Math.round(globalThis.winLeft + vp2px(10)), Math.round(globalThis.winTop + vp2px(50))
      );
      await CommonFunc.sleep(2000);

      let text_011 = getInspectorByKey('ListItem_Delete_End_text_01');

      expect(JSON.parse(text_011).$attrs.content).assertEqual('not enterEndDeleteArea');

      let text_022 = getInspectorByKey('ListItem_Delete_End_text_02');

      expect(JSON.parse(text_022).$attrs.content).assertEqual('not exitEndDeleteArea');

      let text_033 = getInspectorByKey('ListItem_Delete_End_text_03');

      expect(JSON.parse(text_033).$attrs.content).assertEqual('5');

      console.info('[SUB_ACE_ListItem_Delete_End_0600] END');
      done();
    });

    // /**
    //  * @tc.number    SUB_ACE_ListItem_Delete_End_0100
    //  * @tc.name      testListItem
    //  * @tc.desc      Set actionAreaDistance to 100 and slide 100
    //  */
    // it('SUB_ACE_ListItem_Delete_End_0100', 0, async  (done: Function)=> {
    //   console.info('[SUB_ACE_ListItem_Delete_End_0100] START');
    //   globalThis.value.message.notify({name:'actionAreaDistance', value:100});
    //   await CommonFunc.sleep(1000);
    //   console.log('get Initial value')
    //   let ListItem_00:RectValue = CommonFunc.getComponentRect('ListItem_Delete_End_ListItem_00');
    //   let ListItem_01:RectValue = CommonFunc.getComponentRect('ListItem_Delete_End_ListItem_01');
    //
    //
    //   console.log('slide ')
    //   let driver = Driver.create();
    //   await CommonFunc.sleep(500);
    //
    //   await driver.swipe(
    //     // Math.round(ListItem_01.right - vp2px(20)),
    //     // Math.round(ListItem_01.top + vp2px(20)),
    //     // Math.round(ListItem_01.right - vp2px(120)),
    //     // Math.round(ListItem_01.top + vp2px(20))
    //     Math.round(vp2px(300)), Math.round(vp2px(50)), Math.round(vp2px(200)), Math.round(vp2px(50))
    //
    //   );
    //   await CommonFunc.sleep(2000);
    //
    //   console.log('get text_01 ')
    //   let text_011 = getInspectorByKey('ListItem_Delete_End_text_01');
    //
    //   expect(JSON.parse(text_011).$attrs.content).assertEqual('enterEndDeleteArea');
    //
    //   console.log('get text_02 ')
    //   let text_022 = getInspectorByKey('ListItem_Delete_End_text_02');
    //
    //   expect(JSON.parse(text_022).$attrs.content).assertEqual('not exitEndDeleteArea');
    //
    //   console.log('get text_03 ')
    //   let text_033 = getInspectorByKey('ListItem_Delete_End_text_03');
    //
    //   expect(JSON.parse(text_033).$attrs.content).assertEqual('4');
    //
    //   console.info('[SUB_ACE_ListItem_Delete_End_0100] END');
    //   done();
    // });

  })
}
