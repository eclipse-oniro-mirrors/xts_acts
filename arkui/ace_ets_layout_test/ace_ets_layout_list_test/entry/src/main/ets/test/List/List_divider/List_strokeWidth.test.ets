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
export default function List_strokeWidth() {
  describe('List_strokeWidth', function () {
    beforeEach(async function (done) {
      console.info("List_strokeWidth beforeEach start");
      let options = {
        url: 'MainAbility/pages/List/List_divider/List_strokeWidth',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get List_strokeWidth state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get List_strokeWidth pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push List_strokeWidth page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push List_strokeWidth page error:" + err);
      }
      console.info("List_strokeWidth beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      router.clear()
      console.info("List_strokeWidth after each called");
    });


    /**
     * @tc.number    SUB_ACE_List_strokeWidth_0100
     * @tc.name      testListItem
     * @tc.desc      Set strokeWidth to 10
     */
    it('SUB_ACE_List_strokeWidth_0100', 0, async function (done) {
      console.info('[SUB_ACE_List_strokeWidth_0100] START');
      await CommonFunc.sleep(1000);
      console.log('get Initial value')
      let ListItem_01 = CommonFunc.getComponentRect('List_strokeWidth_listItem_01');
      let ListItem_02 = CommonFunc.getComponentRect('List_strokeWidth_listItem_02');
      let List_01 = CommonFunc.getComponentRect('List_strokeWidth_list_01');

      console.log('get divider width')
      expect(Math.round(ListItem_02.top - ListItem_01.bottom)).assertEqual(Math.round(vp2px(10)));
      console.info('[SUB_ACE_List_strokeWidth_0100] END');
      done();
    });



  })
}
