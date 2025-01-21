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


export default function getWaterFlowItemRect4() {
  describe('getWaterFlowItemRect4', function () {
    beforeEach(async function (done) {
      console.info("getWaterFlowItemRect4 beforeEach start");
      let options = {
        uri: 'MainAbility/pages/getItemRect/waterFlow/getWaterFlowItemRect4',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getWaterFlowItemRect4 state pages: " + JSON.stringify(pages));
        if (!("getWaterFlowItemRect4" == pages.name)) {
          console.info("get getWaterFlowItemRect4 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push getWaterFlowItemRect4 page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getWaterFlowItemRect4 page error: " + err);
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
    * @tc.number: SUB_ACE_TS_COMPONENT_getWaterFlowItemRect4_0100
    * @tc.name  : onGetItemRect
    * @tc.desc  : set index to 0,set visibility of flowItem0 to Visibility.Visible
    * @tc.level : Level 2
    */
    it('getWaterFlowItemRect4_0100', 0, async function (done) {

      console.info('[getWaterFlowItemRect4_0100] START');
      globalThis.value.message.notify({name:'index', value:0});
      globalThis.value.message.notify({name:'visibility1', value:Visibility.Visible});
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getWaterFlowItemRect4_button'));
      await btn.click();
      await CommonFunc.sleep(2000);

      console.log('get text value')
      let text1 = CommonFunc.getComponentRect('getWaterFlowItemRect4_text1');
      let text2 = CommonFunc.getComponentRect('getWaterFlowItemRect4_text2');
      let text3 = CommonFunc.getComponentRect('getWaterFlowItemRect4_text3');
      let text4 = CommonFunc.getComponentRect('getWaterFlowItemRect4_text4');

      console.log('get text message')
      let strJson1 = getInspectorByKey('getWaterFlowItemRect4_text1')
      let obj1 = JSON.parse(strJson1)
      let x = Number(obj1.$attrs.content)
      console.log('x' + x)

      let strJson2 = getInspectorByKey('getWaterFlowItemRect4_text2')
      let obj2 = JSON.parse(strJson2)
      let y = Number(obj2.$attrs.content)
      console.log('y' + y)

      let strJson3 = getInspectorByKey('getWaterFlowItemRect4_text3')
      let obj3 = JSON.parse(strJson3)
      let width = Number(obj3.$attrs.content)
      console.log('width' + width)

      let strJson4 = getInspectorByKey('getWaterFlowItemRect4_text4')
      let obj4 = JSON.parse(strJson4)
      let height = Number(obj4.$attrs.content)
      console.log('height' + height)

      console.log('assert position')
      expect(Math.round(x)).assertEqual(Math.round(0));
      expect(Math.round(y)).assertEqual(Math.round(0));

      console.log('assert size')
      expect(Math.round(width)).assertEqual(Math.round(170));
      expect(Math.round(height)).assertEqual(Math.round(100));

      done();
    });


    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_getWaterFlowItemRect4_0200
    * @tc.name  : onGetItemRect
    * @tc.desc  : set index to 0,set visibility of flowItem0 to Visibility.Hidden
    * @tc.level : Level 2
    */
    it('getWaterFlowItemRect4_0200', 0, async function (done) {

      console.info('[getWaterFlowItemRect4_0200] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn2 = await driver.findComponent(ON.id('getWaterFlowItemRect4_button2'));
      await btn2.click();
      await CommonFunc.sleep(1000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getWaterFlowItemRect4_button'));
      await btn.click();
      await CommonFunc.sleep(2000);

      console.log('get text value')
      let text1 = CommonFunc.getComponentRect('getWaterFlowItemRect4_text1');
      let text2 = CommonFunc.getComponentRect('getWaterFlowItemRect4_text2');
      let text3 = CommonFunc.getComponentRect('getWaterFlowItemRect4_text3');
      let text4 = CommonFunc.getComponentRect('getWaterFlowItemRect4_text4');

      console.log('get text message')
      let strJson1 = getInspectorByKey('getWaterFlowItemRect4_text1')
      let obj1 = JSON.parse(strJson1)
      let x = Number(obj1.$attrs.content)
      console.log('x' + x)

      let strJson2 = getInspectorByKey('getWaterFlowItemRect4_text2')
      let obj2 = JSON.parse(strJson2)
      let y = Number(obj2.$attrs.content)
      console.log('y' + y)

      let strJson3 = getInspectorByKey('getWaterFlowItemRect4_text3')
      let obj3 = JSON.parse(strJson3)
      let width = Number(obj3.$attrs.content)
      console.log('width' + width)

      let strJson4 = getInspectorByKey('getWaterFlowItemRect4_text4')
      let obj4 = JSON.parse(strJson4)
      let height = Number(obj4.$attrs.content)
      console.log('height' + height)

      console.log('assert position')
      expect(Math.round(x)).assertEqual(Math.round(0));
      expect(Math.round(y)).assertEqual(Math.round(0));

      console.log('assert size')
      expect(Math.round(width)).assertEqual(Math.round(170));
      expect(Math.round(height)).assertEqual(Math.round(100));

      done();
    });



    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_getWaterFlowItemRect4_0300
    * @tc.name  : onGetItemRect
    * @tc.desc  : set index to 0,set visibility of flowItem0 to Visibility.None
    * @tc.level : Level 2
    */
    it('getWaterFlowItemRect4_0300', 0, async function (done) {

      console.info('[getWaterFlowItemRect4_0300] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn3 = await driver.findComponent(ON.id('getWaterFlowItemRect4_button3'));
      await btn3.click();
      await CommonFunc.sleep(1000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getWaterFlowItemRect4_button'));
      await btn.click();
      await CommonFunc.sleep(2000);

      console.log('get text value')
      let text1 = CommonFunc.getComponentRect('getWaterFlowItemRect4_text1');
      let text2 = CommonFunc.getComponentRect('getWaterFlowItemRect4_text2');
      let text3 = CommonFunc.getComponentRect('getWaterFlowItemRect4_text3');
      let text4 = CommonFunc.getComponentRect('getWaterFlowItemRect4_text4');

      console.log('get text message')
      let strJson1 = getInspectorByKey('getWaterFlowItemRect4_text1')
      let obj1 = JSON.parse(strJson1)
      let x = Number(obj1.$attrs.content)
      console.log('x' + x)

      let strJson2 = getInspectorByKey('getWaterFlowItemRect4_text2')
      let obj2 = JSON.parse(strJson2)
      let y = Number(obj2.$attrs.content)
      console.log('y' + y)

      let strJson3 = getInspectorByKey('getWaterFlowItemRect4_text3')
      let obj3 = JSON.parse(strJson3)
      let width = Number(obj3.$attrs.content)
      console.log('width' + width)

      let strJson4 = getInspectorByKey('getWaterFlowItemRect4_text4')
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
