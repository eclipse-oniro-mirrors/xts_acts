/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function badgeStyleTest() {
  describe('badgeStyle', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/badge/badgeStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get badgeStyle state pages: ' + JSON.stringify(pages));
        if (!('badgeStyle' == pages.name)) {
          console.info('get badgeStyle state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push badgeStyle success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push badgeStyle page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('badgeStyle after each called');
    });

    /**
     * @tc.name   BadgeStyle_0010
     * @tc.number BadgeStyle_0010
     * @tc.desc   test BadgeStyle api enableAutoAvoidance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BadgeStyle_0010', Level.LEVEL1, async (done: Function) => {
      console.info('[BadgeStyle_0010] START');
      //enableAutoAvoidance = true
      let driver: Driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('Badge1'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('badge');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[BadgeStyle_0010] strJson1:' + obj1.$attrs.style);
      let style1: ESObject = JSON.parse(obj1.$attrs.style);
      console.info('[BadgeStyle_0010] strJson1:' + style1.enableAutoAvoidance);
      expect(style1.enableAutoAvoidance).assertEqual(true);

      //enableAutoAvoidance = false
      let button2 = await driver.findComponent(ON.id('Badge2'));
      await button2.click();
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('badge');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[BadgeStyle_0010] strJson2:' + obj2.$attrs.style);
      let style2: ESObject = JSON.parse(obj2.$attrs.style);
      console.info('[BadgeStyle_0010] strJson2:' + style2.enableAutoAvoidance);
      expect(style2.enableAutoAvoidance).assertEqual(false);

      //enableAutoAvoidance = undefined
      let button3 = await driver.findComponent(ON.id('Badge3'));
      await button3.click();
      await CommonFunc.sleep(1000);
      let strJson3 = getInspectorByKey('badge');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info('[BadgeStyle_0010] strJson3:' + obj3.$attrs.style);
      let style3: ESObject = JSON.parse(obj3.$attrs.style);
      console.info('[BadgeStyle_0010] strJson3:' + style3.enableAutoAvoidance);
      expect(style3.enableAutoAvoidance).assertEqual(false);

      //enableAutoAvoidance = null
      let button4 = await driver.findComponent(ON.id('Badge4'));
      await button4.click();
      await CommonFunc.sleep(1000);
      let strJson4 = getInspectorByKey('badge');
      let obj4: ESObject = JSON.parse(strJson4);
      console.info('[BadgeStyle_0010] strJson4:' + obj4.$attrs.style);
      let style4: ESObject = JSON.parse(obj4.$attrs.style);
      console.info('[BadgeStyle_0010] strJson4:' + style4.enableAutoAvoidance);
      expect(style4.enableAutoAvoidance).assertEqual(false);
      console.info('[BadgeStyle_0010] END')
      done();
    });

    /**
     * @tc.name   BadgeStyle_0020
     * @tc.number BadgeStyle_0020
     * @tc.desc   test BadgeStyle api outerBorderColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BadgeStyle_0020', Level.LEVEL1, async (done: Function) => {
      console.info('[BadgeStyle_0020] START');
      //outerBorderColor = Color.Black
      let driver: Driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('Badge5'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('badge');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[BadgeStyle_0020] strJson1:' + obj1.$attrs.style);
      let style1: ESObject = JSON.parse(obj1.$attrs.style);
      console.info('[BadgeStyle_0020] strJson1:' + style1.outerBorderColor);
      expect(style1.outerBorderColor).assertEqual('#FF000000');

      //outerBorderColor = 0x4DFFFFFF
      let button2 = await driver.findComponent(ON.id('Badge6'));
      await button2.click();
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('badge');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[BadgeStyle_0020] strJson2:' + obj2.$attrs.style);
      let style2: ESObject = JSON.parse(obj2.$attrs.style);
      console.info('[BadgeStyle_0020] strJson2:' + style2.outerBorderColor);
      expect(style2.outerBorderColor).assertEqual('#4DFFFFFF');

      //outerBorderColor = '#FF11A5E0'
      let button3 = await driver.findComponent(ON.id('Badge7'));
      await button3.click();
      await CommonFunc.sleep(1000);
      let strJson3 = getInspectorByKey('badge');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info('[BadgeStyle_0020] strJson3:' + obj3.$attrs.style);
      let style3: ESObject = JSON.parse(obj3.$attrs.style);
      console.info('[BadgeStyle_0020] strJson3:' + style3.outerBorderColor);
      expect(style3.outerBorderColor).assertEqual('#FF11A5E0');

      //outerBorderColor = $r('app.color.RED')
      let button4 = await driver.findComponent(ON.id('Badge8'));
      await button4.click();
      await CommonFunc.sleep(1000);
      let strJson4 = getInspectorByKey('badge');
      let obj4: ESObject = JSON.parse(strJson4);
      console.info('[BadgeStyle_0020] strJson4:' + obj4.$attrs.style);
      let style4: ESObject = JSON.parse(obj4.$attrs.style);
      console.info('[BadgeStyle_0020] strJson4:' + style4.outerBorderColor);
      expect(style4.outerBorderColor).assertEqual('#FFE01111');

      //outerBorderColor = ''
      let button5 = await driver.findComponent(ON.id('Badge9'));
      await button5.click();
      await CommonFunc.sleep(1000);
      let strJson5 = getInspectorByKey('badge');
      let obj5: ESObject = JSON.parse(strJson5);
      console.info('[BadgeStyle_0020] strJson5:' + obj5.$attrs.style);
      let style5: ESObject = JSON.parse(obj5.$attrs.style);
      console.info('[BadgeStyle_0020] strJson5:' + style5.outerBorderColor);
      expect(style5.outerBorderColor).assertEqual('#FFFFFFFF');

      //outerBorderColor = '00000000'
      let button6 = await driver.findComponent(ON.id('Badge10'));
      await button6.click();
      await CommonFunc.sleep(1000);
      let strJson6 = getInspectorByKey('badge');
      let obj6: ESObject = JSON.parse(strJson6);
      console.info('[BadgeStyle_0020] strJson6:' + obj6.$attrs.style);
      let style6: ESObject = JSON.parse(obj6.$attrs.style);
      console.info('[BadgeStyle_0020] strJson6:' + style6.outerBorderColor);
      expect(style6.outerBorderColor).assertEqual('#FFFFFFFF');

      //outerBorderColor = undefined
      let button7 = await driver.findComponent(ON.id('Badge11'));
      await button7.click();
      await CommonFunc.sleep(1000);
      let strJson7 = getInspectorByKey('badge');
      let obj7: ESObject = JSON.parse(strJson7);
      console.info('[BadgeStyle_0020] strJson7:' + obj7.$attrs.style);
      let style7: ESObject = JSON.parse(obj7.$attrs.style);
      console.info('[BadgeStyle_0020] strJson7:' + style7.outerBorderColor);
      expect(style7.outerBorderColor).assertEqual('#FFFFFFFF');

      //outerBorderColor = null
      let button8 = await driver.findComponent(ON.id('Badge12'));
      await button8.click();
      await CommonFunc.sleep(1000);
      let strJson8 = getInspectorByKey('badge');
      let obj8: ESObject = JSON.parse(strJson8);
      console.info('[BadgeStyle_0020] strJson8:' + obj8.$attrs.style);
      let style8: ESObject = JSON.parse(obj8.$attrs.style);
      console.info('[BadgeStyle_0020] strJson8:' + style8.outerBorderColor);
      expect(style8.outerBorderColor).assertEqual('#FFFFFFFF');
      console.info('[BadgeStyle_0020] END')
      done();
    });

    /**
     * @tc.name   BadgeStyle_0030
     * @tc.number BadgeStyle_0030
     * @tc.desc   test BadgeStyle api outerBorderWidth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BadgeStyle_0030', Level.LEVEL1, async (done: Function) => {
      console.info('[BadgeStyle_0030] START');
      //outerBorderWidth = 0vp
      let driver: Driver = Driver.create();
      let button9 = await driver.findComponent(ON.id('Badge13'));
      await button9.click();
      await CommonFunc.sleep(1000);
      let strJson9 = getInspectorByKey('badge');
      let obj9: ESObject = JSON.parse(strJson9);
      console.info('[BadgeStyle_0030] strJson9:' + obj9.$attrs.style);
      let style9: ESObject = JSON.parse(obj9.$attrs.style);
      console.info('[BadgeStyle_0030] strJson9:' + style9.outerBorderWidth);
      expect(style9.outerBorderWidth).assertEqual('0.00vp');

      //outerBorderWidth = $r('app.float.borderWidth')
      let button10 = await driver.findComponent(ON.id('Badge14'));
      await button10.click();
      await CommonFunc.sleep(1000);
      let strJson10 = getInspectorByKey('badge');
      let obj10: ESObject = JSON.parse(strJson10);
      console.info('[BadgeStyle_0030] strJson10:' + obj10.$attrs.style);
      let style10: ESObject = JSON.parse(obj10.$attrs.style);
      console.info('[BadgeStyle_0030] strJson10:' + style10.outerBorderWidth);
      expect(style10.outerBorderWidth).assertEqual('5.00vp');

      //outerBorderWidth = 10fp
      let button11 = await driver.findComponent(ON.id('Badge15'));
      await button11.click();
      await CommonFunc.sleep(1000);
      let strJson11 = getInspectorByKey('badge');
      let obj11: ESObject = JSON.parse(strJson11);
      console.info('[BadgeStyle_0030] strJson11:' + obj11.$attrs.style);
      let style11: ESObject = JSON.parse(obj11.$attrs.style);
      console.info('[BadgeStyle_0030] strJson11:' + style11.outerBorderWidth);
      expect(style11.outerBorderWidth).assertEqual('10.00fp');

      //outerBorderWidth = 2.5vp
      let button12 = await driver.findComponent(ON.id('Badge16'));
      await button12.click();
      await CommonFunc.sleep(1000);
      let strJson12 = getInspectorByKey('badge');
      let obj12: ESObject = JSON.parse(strJson12);
      console.info('[BadgeStyle_0030] strJson12:' + obj12.$attrs.style);
      let style12: ESObject = JSON.parse(obj12.$attrs.style);
      console.info('[BadgeStyle_0030] strJson12:' + style12.outerBorderWidth);
      expect(style12.outerBorderWidth).assertEqual('2.50vp');

      //outerBorderWidth = 20px
      let button13 = await driver.findComponent(ON.id('Badge17'));
      await button13.click();
      await CommonFunc.sleep(1000);
      let strJson13 = getInspectorByKey('badge');
      let obj13: ESObject = JSON.parse(strJson13);
      console.info('[BadgeStyle_0030] strJson13:' + obj13.$attrs.style);
      let style13: ESObject = JSON.parse(obj13.$attrs.style);
      console.info('[BadgeStyle_0030] strJson13:' + style13.outerBorderWidth);
      expect(style13.outerBorderWidth).assertEqual('20.00px');

      //outerBorderWidth = -2vp
      let button14 = await driver.findComponent(ON.id('Badge18'));
      await button14.click();
      await CommonFunc.sleep(1000);
      let strJson14 = getInspectorByKey('badge');
      let obj14: ESObject = JSON.parse(strJson14);
      console.info('[BadgeStyle_0030] strJson14:' + obj14.$attrs.style);
      let style14: ESObject = JSON.parse(obj14.$attrs.style);
      console.info('[BadgeStyle_0030] strJson14:' + style14.outerBorderWidth);
      expect(style14.outerBorderWidth).assertEqual('-2.00vp');

      //outerBorderWidth = 80%
      let button15 = await driver.findComponent(ON.id('Badge19'));
      await button15.click();
      await CommonFunc.sleep(1000);
      let strJson15 = getInspectorByKey('badge');
      let obj15: ESObject = JSON.parse(strJson15);
      console.info('[BadgeStyle_0030] strJson15:' + obj15.$attrs.style);
      let style15: ESObject = JSON.parse(obj15.$attrs.style);
      console.info('[BadgeStyle_0030] strJson15:' + style15.outerBorderWidth);
      expect(style15.outerBorderWidth).assertEqual('80.00%');

      //outerBorderWidth = undefined
      let button16 = await driver.findComponent(ON.id('Badge20'));
      await button16.click();
      await CommonFunc.sleep(1000);
      let strJson16 = getInspectorByKey('badge');
      let obj16: ESObject = JSON.parse(strJson16);
      console.info('[BadgeStyle_0030] strJson16:' + obj16.$attrs.style);
      let style16: ESObject = JSON.parse(obj16.$attrs.style);
      console.info('[BadgeStyle_0030] strJson16:' + style16.outerBorderWidth);
      expect(style16.outerBorderWidth).assertEqual('0.00vp');

      //outerBorderWidth = null
      let button17 = await driver.findComponent(ON.id('Badge21'));
      await button17.click();
      await CommonFunc.sleep(1000);
      let strJson17 = getInspectorByKey('badge');
      let obj17: ESObject = JSON.parse(strJson17);
      console.info('[BadgeStyle_0030] strJson17:' + obj17.$attrs.style);
      let style17: ESObject = JSON.parse(obj17.$attrs.style);
      console.info('[BadgeStyle_0030] strJson17:' + style17.outerBorderWidth);
      expect(style17.outerBorderWidth).assertEqual('0.00vp');
      console.info('[BadgeStyle_0030] END')
      done();
    });
  })
}