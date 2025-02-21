/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../../MainAbility/utils/MessageManager';


export default function getListItemGroupRect6() {
  describe('getListItemGroupRect6', function () {
    beforeEach(async function (done) {
      console.info("getListItemGroupRect6 beforeEach start");
      let options = {
        uri: 'MainAbility/pages/getItemRect/list/getListItemGroupRect6',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getListItemGroupRect6 state pages: " + JSON.stringify(pages));
        if (!("getListItemGroupRect6" == pages.name)) {
          console.info("get getListItemGroupRect6 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push getListItemGroupRect6 page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getListItemGroupRect6 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      router.back({uri: 'MainAbility/pages/index/index'})
      console.info("BadgeFocus after each called");
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_getListItemGroupRect6_0100
    * @tc.name  : testGetItemRectInGroup
    * @tc.desc  : set index to 0,set index to 3,Delete listItem3
    * @tc.level : Level 2
    */
    it('getListItemGroupRect6_0100', 0, async function (done) {

      console.info('[getListItemGroupRect6_0100] START');
      globalThis.value.message.notify({name:'index', value:0});
      globalThis.value.message.notify({name:'indexInGroup', value:3});
      await CommonFunc.sleep(1000);

      console.log('get Initial value')
      let listItemGroup_3 = CommonFunc.getComponentRect('getListItemGroupRect6_listItemGroup_3');

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('delete')
      await driver.swipe(
      parseInt((listItemGroup_3.right-listItemGroup_3.left)*0.9+listItemGroup_3.left),
      parseInt((listItemGroup_3.bottom-listItemGroup_3.top)*0.5+listItemGroup_3.top),
      parseInt((listItemGroup_3.right-listItemGroup_3.left)*0.1+listItemGroup_3.left),
      parseInt((listItemGroup_3.bottom-listItemGroup_3.top)*0.5+listItemGroup_3.top)
      )
      await CommonFunc.sleep(1000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getListItemGroupRect6_button'));
      await btn.click();
      await CommonFunc.sleep(2000);

      console.log('get text value')
      let text1 = CommonFunc.getComponentRect('getListItemGroupRect6_text1');
      let text2 = CommonFunc.getComponentRect('getListItemGroupRect6_text2');
      let text3 = CommonFunc.getComponentRect('getListItemGroupRect6_text3');
      let text4 = CommonFunc.getComponentRect('getListItemGroupRect6_text4');

      console.log('get text message')
      let strJson1 = getInspectorByKey('getListItemGroupRect6_text1')
      let obj1 = JSON.parse(strJson1)
      let x = Number(obj1.$attrs.content)
      console.log('x' + x)

      let strJson2 = getInspectorByKey('getListItemGroupRect6_text2')
      let obj2 = JSON.parse(strJson2)
      let y = Number(obj2.$attrs.content)
      console.log('y' + y)

      let strJson3 = getInspectorByKey('getListItemGroupRect6_text3')
      let obj3 = JSON.parse(strJson3)
      let width = Number(obj3.$attrs.content)
      console.log('width' + width)

      let strJson4 = getInspectorByKey('getListItemGroupRect6_text4')
      let obj4 = JSON.parse(strJson4)
      let height = Number(obj4.$attrs.content)
      console.log('height' + height)

      console.log('assert position')
      expect(Math.round(x)).assertEqual(Math.round(0));
      expect(Math.round(y)).assertEqual(Math.round(0));

      console.log('assert size')
      expect(Math.round(width)).assertEqual(Math.round(0));
      expect(Math.round(height)).assertEqual(Math.round(0));

      done();
    });



  })
}
