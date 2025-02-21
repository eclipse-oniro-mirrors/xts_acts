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
export default function ListItem_Delete_End_Default() {
  describe('ListItem_Delete_End_Default', function () {
    beforeEach(async function (done) {
      console.info("ListItem_Delete_End_Default beforeEach start");
      let options = {
        url: 'MainAbility/pages/List/ListItem_Delete/ListItem_Delete_End_Default',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ListItem_Delete_End_Default state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get ListItem_Delete_End_Default pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ListItem_Delete_End_Default page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ListItem_Delete_End_Default page error:" + err);
      }
      console.info("ListItem_Delete_End_Default beforeEach end");
      done();
    });
    afterEach(async function () {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      console.log('button click')
      let btn = await driver.findComponent(ON.id('ListItem_Delete_End_Default_button1'));
      await btn.click();
      await CommonFunc.sleep(3000);
    });
    // /**
    //  * @tc.number    SUB_ACE_ListItem_Delete_End_Default_0100
    //  * @tc.name      testListItem
    //  * @tc.desc      Do not set actionAreaDistance and slide 56
    //  */
    // it('SUB_ACE_ListItem_Delete_End_Default_0100', 0, async function (done) {
    //   console.info('[SUB_ACE_ListItem_Delete_End_Default_0100] START');
    //   await CommonFunc.sleep(1000);
    //   let ListItem_00 = CommonFunc.getComponentRect('ListItem_Delete_End_Default_ListItem_00');
    //   let ListItem_01 = CommonFunc.getComponentRect('ListItem_Delete_End_Default_ListItem_01');
    //
    //   let driver = await Driver.create();
    //   await driver.swipe(
    //     (ListItem_00.right - 20),
    //     (ListItem_00.top + 20),
    //     (ListItem_00.right - 76),
    //     (ListItem_00.top + 20)
    //   );
    //   await CommonFunc.sleep(2000);
    //
    //   let text_011 = getInspectorByKey('ListItem_Delete_End_Default_text_01');
    //   let textObj1 = JSON.parse(text_011);
    //   expect(textObj1.$attrs.content).assertEqual('enterEndDeleteArea');
    //
    //   let text_022 = getInspectorByKey('ListItem_Delete_End_Default_text_02');
    //   let textObj2 = JSON.parse(text_022);
    //   expect(textObj2.$attrs.content).assertEqual('not exitEndDeleteArea');
    //
    //   let text_033 = getInspectorByKey('ListItem_Delete_End_Default_text_03');
    //   let textObj3 = JSON.parse(text_033);
    //   expect(textObj3.$attrs.content).assertEqual('4');
    //
    //   console.info('[SUB_ACE_ListItem_Delete_End_Default_0100] END');
    //   done();
    // });
    /**
     * @tc.number    SUB_ACE_ListItem_Delete_End_Default_0200
     * @tc.name      testListItem
     * @tc.desc      Do not set actionAreaDistance and slide 70
     */
    it('SUB_ACE_ListItem_Delete_End_Default_0200', 0, async function (done) {
      console.info('[SUB_ACE_ListItem_Delete_End_Default_0200] START');
      await CommonFunc.sleep(1000);
      console.log('get Initial value')
      let Default_ListItem_00 = CommonFunc.getComponentRect('ListItem_Delete_End_Default_ListItem_00');

      console.log('Default_ListItem_00.top: ' + Default_ListItem_00.top + ' Default_ListItem_00.bottom: ' + Default_ListItem_00.bottom 
      + ' Default_ListItem_00.right: ' + Default_ListItem_00.right + ' Default_ListItem_00.left: ' + Default_ListItem_00.left )

      let DefaultListItemFirstOne = Default_ListItem_00.right - (Default_ListItem_00.right - Default_ListItem_00.left) / 4;
      let DefaultListItemFirstTwo = Default_ListItem_00.bottom - (Default_ListItem_00.bottom - Default_ListItem_00.top) / 2;
      let DefaultListItemFirstThree = Default_ListItem_00.left + (Default_ListItem_00.right - Default_ListItem_00.left) / 4;
      let DefaultListItemFirstFour = Default_ListItem_00.bottom - (Default_ListItem_00.bottom - Default_ListItem_00.top) / 2;

      console.log("DefaultListItemFirstOne " + DefaultListItemFirstOne + " DefaultListItemFirstTwo " + DefaultListItemFirstTwo + 
      " DefaultListItemFirstThree " + DefaultListItemFirstThree + " DefaultListItemFirstFour " + DefaultListItemFirstFour)

      console.log('slide ')
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      await driver.swipe(
        Math.round(DefaultListItemFirstOne), Math.round(DefaultListItemFirstTwo), Math.round(DefaultListItemFirstThree), Math.round(DefaultListItemFirstFour)
      );
      await CommonFunc.sleep(2000);

      let text_011 = getInspectorByKey('ListItem_Delete_End_Default_text_01');
      let textObj1 = JSON.parse(text_011);
      expect(textObj1.$attrs.content).assertEqual('enterEndDeleteArea');

      let text_022 = getInspectorByKey('ListItem_Delete_End_Default_text_02');
      let textObj2 = JSON.parse(text_022);
      expect(textObj2.$attrs.content).assertEqual('not exitEndDeleteArea');

      let text_033 = getInspectorByKey('ListItem_Delete_End_Default_text_03');
      let textObj3 = JSON.parse(text_033);
      expect(textObj3.$attrs.content).assertEqual('4');

      console.info('[SUB_ACE_ListItem_Delete_End_Default_0200] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_ListItem_Delete_End_Default_0300
     * @tc.name      testListItem
     * @tc.desc      Do not set actionAreaDistance and slide 40
     */
    it('SUB_ACE_ListItem_Delete_End_Default_0300', 0, async function (done) {
      console.info('[SUB_ACE_ListItem_Delete_End_Default_0300] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      console.log('button click')
      let btn = await driver.findComponent(ON.id('ListItem_Delete_End_Default_button1'));
      await btn.click();
      await CommonFunc.sleep(2000);

      console.log('get Initial value')
      let ListItem_00 = CommonFunc.getComponentRect('ListItem_Delete_End_Default_ListItem_00');
      let ListItem_01 = CommonFunc.getComponentRect('ListItem_Delete_End_Default_ListItem_01');


      console.log('slide ')
      await driver.swipe(
        Math.round(vp2px(300)), Math.round(vp2px(50)), Math.round(vp2px(250)), Math.round(vp2px(50))
      );
      await CommonFunc.sleep(2000);

      let text_011 = getInspectorByKey('ListItem_Delete_End_Default_text_01');
      let textObj1 = JSON.parse(text_011);
      expect(textObj1.$attrs.content).assertEqual('not enterEndDeleteArea');

      let text_022 = getInspectorByKey('ListItem_Delete_End_Default_text_02');
      let textObj2 = JSON.parse(text_022);
      expect(textObj2.$attrs.content).assertEqual('not exitEndDeleteArea');

      let text_033 = getInspectorByKey('ListItem_Delete_End_Default_text_03');
      let textObj3 = JSON.parse(text_033);
      expect(textObj3.$attrs.content).assertEqual('5');

      console.info('[SUB_ACE_ListItem_Delete_End_Default_0300] END');
      done();
    });


  })
}
