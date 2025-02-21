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
export default function List_divider_number() {
  describe('List_divider_number', function () {
    beforeEach(async function (done) {
      console.info("List_divider_number beforeEach start");
      let options = {
        url: 'MainAbility/pages/List/List_divider/List_divider_number',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get List_divider_number state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get List_divider_number pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push List_divider_number page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push List_divider_number page error:" + err);
      }
      console.info("List_divider_number beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      router.back()
      console.info("List_divider_number after each called");
    });


    /**
     * @tc.number    SUB_ACE_List_divider_number_0100
     * @tc.name      testListItem
     * @tc.desc      Set strokeWidth to 0
     */
    it('SUB_ACE_List_divider_number_0100', 0, async function (done) {
      console.info('[SUB_ACE_List_divider_number_0100] START');
      globalThis.value.message.notify({name:'strokeWidth', value:0});
      await CommonFunc.sleep(1000);
      console.log('get Initial value')
      let ListItem_01 = CommonFunc.getComponentRect('List_divider_number_listItem_01');
      let ListItem_02 = CommonFunc.getComponentRect('List_divider_number_listItem_02');
      let List_01 = CommonFunc.getComponentRect('List_divider_number_list_01');

      console.log('get divider width')
      expect(Math.round(ListItem_02.top - ListItem_01.bottom)).assertEqual(Math.round(vp2px(0)));

      console.info('[SUB_ACE_List_divider_number_0100] END');
      done();
    });


    /**
     * @tc.number    SUB_ACE_List_divider_number_0200
     * @tc.name      testListItem
     * @tc.desc      Set strokeWidth to -5
     */
    it('SUB_ACE_List_divider_number_0200', 0, async function (done) {
      console.info('[SUB_ACE_List_divider_number_0200] START');
      globalThis.value.message.notify({name:'strokeWidth', value:-5});
      await CommonFunc.sleep(1000);
      console.log('get Initial value')
      let ListItem_01 = CommonFunc.getComponentRect('List_divider_number_listItem_01');
      let ListItem_02 = CommonFunc.getComponentRect('List_divider_number_listItem_02');
      let List_01 = CommonFunc.getComponentRect('List_divider_number_list_01');

      console.log('get divider width')
      expect(Math.round(ListItem_02.top - ListItem_01.bottom)).assertEqual(Math.round(vp2px(0)));

      console.info('[SUB_ACE_List_divider_number_0200] END');
      done();
    });


    /**
     * @tc.number    SUB_ACE_List_divider_number_0300
     * @tc.name      testListItem
     * @tc.desc      Set strokeWidth to 20
     */
    it('SUB_ACE_List_divider_number_0300', 0, async function (done) {
      console.info('[SUB_ACE_List_divider_number_0300] START');
      globalThis.value.message.notify({name:'strokeWidth', value:20});
      await CommonFunc.sleep(1000);
      console.log('get Initial value')
      let ListItem_01 = CommonFunc.getComponentRect('List_divider_number_listItem_01');
      let ListItem_02 = CommonFunc.getComponentRect('List_divider_number_listItem_02');
      let List_01 = CommonFunc.getComponentRect('List_divider_number_list_01');

      console.log('get divider width')
      expect(Math.round(ListItem_02.top - ListItem_01.bottom)).assertEqual(Math.round(vp2px(20)));

      console.info('[SUB_ACE_List_divider_number_0300] END');
      done();
    });


    /**
     * @tc.number    SUB_ACE_List_divider_number_0400
     * @tc.name      testListItem
     * @tc.desc      Set strokeWidth to 20,set space to 10
     */
    it('SUB_ACE_List_divider_number_0400', 0, async function (done) {
      console.info('[SUB_ACE_List_divider_number_0400] START');
      globalThis.value.message.notify({name:'strokeWidth', value:20});
      globalThis.value.message.notify({name:'space', value:10});
      await CommonFunc.sleep(1000);
      console.log('get Initial value')
      let ListItem_01 = CommonFunc.getComponentRect('List_divider_number_listItem_01');
      let ListItem_02 = CommonFunc.getComponentRect('List_divider_number_listItem_02');
      let List_01 = CommonFunc.getComponentRect('List_divider_number_list_01');

      console.log('get divider width')
      expect(Math.round(ListItem_02.top - ListItem_01.bottom)).assertEqual(Math.round(vp2px(20)));

      console.info('[SUB_ACE_List_divider_number_0400] END');
      done();
    });


  })
}
