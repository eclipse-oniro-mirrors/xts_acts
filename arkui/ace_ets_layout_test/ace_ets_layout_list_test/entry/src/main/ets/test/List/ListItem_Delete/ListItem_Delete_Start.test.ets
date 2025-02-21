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
import { UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection,
  WindowMode, PointerMatrix, UiDirection, MouseButton } from '@ohos.UiTest';
export default function ListItem_Delete_Start() {
  describe('ListItem_Delete_Start', function () {
    beforeEach(async function (done) {
      console.info("ListItem_Delete_Start beforeEach start");
      let options = {
        url: 'MainAbility/pages/List/ListItem_Delete/ListItem_Delete_Start',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ListItem_Delete_Start state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get ListItem_Delete_Start pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ListItem_Delete_Start page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ListItem_Delete_Start page error:" + err);
      }
      console.info("ListItem_Delete_Start beforeEach end");
      done();
    });
    afterEach(async function () {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      console.log('button click')
      let btn = await driver.findComponent(ON.id('ListItem_Delete_Start_button1'));
      await btn.click();
      await CommonFunc.sleep(3000);

      console.info("ListItem_Delete_Start after each called");
    });

    /**
     * @tc.number    SUB_ACE_ListItem_Delete_Start_0200
     * @tc.name      testListItem
     * @tc.desc      Set actionAreaDistance to 100 and slide 120
     */
    it('SUB_ACE_ListItem_Delete_Start_0200', 0, async function (done) {
      console.info('[SUB_ACE_ListItem_Delete_Start_0200] START');
      globalThis.value.message.notify({name:'actionAreaDistance', value:100});
      await CommonFunc.sleep(1000);
      
      let ListItemStart_00 = CommonFunc.getComponentRect('ListItem_Delete_Start_ListItem_00');

      console.log('ListItemStart_00.top: ' + ListItemStart_00.top + ' ListItemStart_00.bottom: ' + ListItemStart_00.bottom 
      + ' ListItemStart_00.right: ' + ListItemStart_00.right + ' ListItemStart_00.left: ' + ListItemStart_00.left )

      let ListItemStartFirstOne = ListItemStart_00.left + (ListItemStart_00.right - ListItemStart_00.left) / 4;
      let ListItemStartFirstTwo = ListItemStart_00.bottom - (ListItemStart_00.bottom - ListItemStart_00.top) / 2;
      let ListItemStartFirstThree = ListItemStart_00.right - (ListItemStart_00.right - ListItemStart_00.left) / 4;
      let ListItemStartFirstFour = ListItemStart_00.bottom - (ListItemStart_00.bottom - ListItemStart_00.top) / 2;

      console.log("ListItemStartFirstOne " + ListItemStartFirstOne + " ListItemStartFirstTwo " + ListItemStartFirstTwo + 
      " ListItemStartFirstThree " + ListItemStartFirstThree + " ListItemStartFirstFour " + ListItemStartFirstFour)

      let driver = await Driver.create();
      await driver.swipe(
        Math.round(ListItemStartFirstOne), Math.round(ListItemStartFirstTwo), Math.round(ListItemStartFirstThree), Math.round(ListItemStartFirstFour)
      );
      await CommonFunc.sleep(2000);

      let text_011 = getInspectorByKey('ListItem_Delete_Start_text_01');
      let textObj1 = JSON.parse(text_011);
      expect(textObj1.$attrs.content).assertEqual('enterEndDeleteArea');

      let text_022 = getInspectorByKey('ListItem_Delete_Start_text_02');
      let textObj2 = JSON.parse(text_022);
      expect(textObj2.$attrs.content).assertEqual('not exitEndDeleteArea');

      let text_033 = getInspectorByKey('ListItem_Delete_Start_text_03');
      let textObj3 = JSON.parse(text_033);
      expect(textObj3.$attrs.content).assertEqual('4');

      console.info('[SUB_ACE_ListItem_Delete_Start_0200] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ListItem_Delete_Start_0300
     * @tc.name      testListItem
     * @tc.desc      Set actionAreaDistance to 100 and slide 80
     */
    it('SUB_ACE_ListItem_Delete_Start_0300', 0, async function (done) {
      console.info('[SUB_ACE_ListItem_Delete_Start_0300] START');
      globalThis.value.message.notify({name:'actionAreaDistance', value:100});
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      console.log('button click')
      let btn = await driver.findComponent(ON.id('ListItem_Delete_Start_button1'));
      await btn.click();
      await CommonFunc.sleep(2000);

      let ListItem_00 = CommonFunc.getComponentRect('ListItem_Delete_Start_ListItem_00');
      let ListItem_01 = CommonFunc.getComponentRect('ListItem_Delete_Start_ListItem_01');
      await driver.swipe(
        Math.round(vp2px(30)), Math.round(vp2px(50)), Math.round(vp2px(110)), Math.round(vp2px(50))
      );
      await CommonFunc.sleep(2000);

      let text_011 = getInspectorByKey('ListItem_Delete_Start_text_01');
      let textObj1 = JSON.parse(text_011);
      expect(textObj1.$attrs.content).assertEqual('not enterEndDeleteArea');

      let text_022 = getInspectorByKey('ListItem_Delete_Start_text_02');
      let textObj2 = JSON.parse(text_022);
      expect(textObj2.$attrs.content).assertEqual('not exitEndDeleteArea');

      let text_033 = getInspectorByKey('ListItem_Delete_Start_text_03');
      let textObj3 = JSON.parse(text_033);
      expect(textObj3.$attrs.content).assertEqual('5');

      console.info('[SUB_ACE_ListItem_Delete_Start_0300] END');
      done();
    });


    /**
     * @tc.number    SUB_ACE_ListItem_Delete_Start_0400
     * @tc.name      testListItem
     * @tc.desc      Set actionAreaDistance to 0 and slide 50
     */
    it('SUB_ACE_ListItem_Delete_Start_0400', 0, async function (done) {
      console.info('[SUB_ACE_ListItem_Delete_Start_0400] START');
      globalThis.value.message.notify({name:'actionAreaDistance', value:0});
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      console.log('button click')
      let btn = await driver.findComponent(ON.id('ListItem_Delete_Start_button1'));
      await btn.click();
      await CommonFunc.sleep(2000);

      let ListItem_00 = CommonFunc.getComponentRect('ListItem_Delete_Start_ListItem_00');
      let ListItem_01 = CommonFunc.getComponentRect('ListItem_Delete_Start_ListItem_01');
      await driver.swipe(
        Math.round(vp2px(50)), Math.round(vp2px(50)), Math.round(vp2px(300)), Math.round(vp2px(50))
      );
      await CommonFunc.sleep(2000);

      let text_011 = getInspectorByKey('ListItem_Delete_Start_text_01');
      let textObj1 = JSON.parse(text_011);
      expect(textObj1.$attrs.content).assertEqual('not enterEndDeleteArea');

      let text_022 = getInspectorByKey('ListItem_Delete_Start_text_02');
      let textObj2 = JSON.parse(text_022);
      expect(textObj2.$attrs.content).assertEqual('not exitEndDeleteArea');

      let text_033 = getInspectorByKey('ListItem_Delete_Start_text_03');
      let textObj3 = JSON.parse(text_033);
      expect(textObj3.$attrs.content).assertEqual('5');

      console.info('[SUB_ACE_ListItem_Delete_Start_0400] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ListItem_Delete_Start_0500
     * @tc.name      testListItem
     * @tc.desc      Set actionAreaDistance to -100 and slide 50
     */
    it('SUB_ACE_ListItem_Delete_Start_0500', 0, async function (done) {
      console.info('[SUB_ACE_ListItem_Delete_Start_0500] START');
      globalThis.value.message.notify({name:'actionAreaDistance', value:-100});
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      console.log('button click')
      let btn = await driver.findComponent(ON.id('ListItem_Delete_Start_button1'));
      await btn.click();
      await CommonFunc.sleep(2000);

      let ListItem_00 = CommonFunc.getComponentRect('ListItem_Delete_Start_ListItem_00');
      let ListItem_01 = CommonFunc.getComponentRect('ListItem_Delete_Start_ListItem_01');

      await driver.swipe(
        Math.round(vp2px(50)), Math.round(vp2px(50)), Math.round(vp2px(300)), Math.round(vp2px(50))
      );
      await CommonFunc.sleep(2000);

      let text_011 = getInspectorByKey('ListItem_Delete_Start_text_01');
      let textObj1 = JSON.parse(text_011);
      expect(textObj1.$attrs.content).assertEqual('not enterEndDeleteArea');

      let text_022 = getInspectorByKey('ListItem_Delete_Start_text_02');
      let textObj2 = JSON.parse(text_022);
      expect(textObj2.$attrs.content).assertEqual('not exitEndDeleteArea');

      let text_033 = getInspectorByKey('ListItem_Delete_Start_text_03');
      let textObj3 = JSON.parse(text_033);
      expect(textObj3.$attrs.content).assertEqual('5');

      console.info('[SUB_ACE_ListItem_Delete_Start_0500] END');
      done();
    });
    // /**
    //  * @tc.number    SUB_ACE_ListItem_Delete_Start_0100
    //  * @tc.name      testListItem
    //  * @tc.desc      Set actionAreaDistance to 100 and slide 100
    //  */
    // it('SUB_ACE_ListItem_Delete_Start_0100', 0, async function (done) {
    //   console.info('[SUB_ACE_ListItem_Delete_Start_0100] START');
    //   globalThis.value.message.notify({name:'actionAreaDistance', value:100});
    //   await CommonFunc.sleep(1000);
    //   let ListItem_00 = CommonFunc.getComponentRect('ListItem_Delete_Start_ListItem_00');
    //   let ListItem_01 = CommonFunc.getComponentRect('ListItem_Delete_Start_ListItem_01');
    //
    //   let driver = await Driver.create();
    //   await driver.swipe(
    //     Math.round(vp2px(50)), Math.round(vp2px(50)), Math.round(vp2px(150)), Math.round(vp2px(50))
    //   );
    //   await CommonFunc.sleep(2000);
    //
    //   let text_011 = getInspectorByKey('ListItem_Delete_Start_text_01');
    //   let textObj1 = JSON.parse(text_011);
    //   expect(textObj1.$attrs.content).assertEqual('enterEndDeleteArea');
    //
    //   let text_022 = getInspectorByKey('ListItem_Delete_Start_text_02');
    //   let textObj2 = JSON.parse(text_022);
    //   expect(textObj2.$attrs.content).assertEqual('not exitEndDeleteArea');
    //
    //   let text_033 = getInspectorByKey('ListItem_Delete_Start_text_03');
    //   let textObj3 = JSON.parse(text_033);
    //   expect(textObj3.$attrs.content).assertEqual('4');
    //
    //   console.info('[SUB_ACE_ListItem_Delete_Start_0100] END');
    //   done();
    // });

  })
}
