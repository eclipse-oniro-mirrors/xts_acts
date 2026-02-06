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

export default function TextMinLinesTest() {
  describe('TextMinLinesTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextMinLines',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextMinLines state pages: ' + JSON.stringify(pages));
        if (!('TextMinLines' == pages.name)) {
          console.info('get TextMinLines state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push TextMinLines success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TextMinLines page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('TextMinLines after each called');
    });

    /**
     * @tc.name   MinLines_0010
     * @tc.number MinLines_0010
     * @tc.desc   minLines is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MinLines_0010', Level.LEVEL1, async (done: Function) => {
      console.info('[MinLines_0010] START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('Button1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[MinLines_0010] strJson is: ' + strJson);
      console.info('[MinLines_0010] MinLines obj is: ' + JSON.stringify(obj.$attrs.minLines));
      expect(obj.$attrs.minLines).assertEqual('1');
      console.info('[MinLines_0010] END')
      done();
    });

      /**
       * @tc.name   MinLines_0011
       * @tc.number MinLines_0011
       * @tc.desc   minLines is 0
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('MinLines_0011', Level.LEVEL1, async (done: Function) => {
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('Button2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[MinLines_0011] strJson is: ' + strJson);
      console.info('[MinLines_0011] MinLines obj is: ' + JSON.stringify(obj.$attrs.minLines));
      expect(obj.$attrs.minLines).assertEqual('0');
      console.info('[MinLines_0011] END')
      done();
    });

      /**
       * @tc.name   MinLines_0012
       * @tc.number MinLines_0012
       * @tc.desc   minLines is 10
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('MinLines_0012', Level.LEVEL1, async (done: Function) => {
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('Button3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[MinLines_0012] strJson is: ' + strJson);
      console.info('[MinLines_0012] MinLines obj is: ' + JSON.stringify(obj.$attrs.minLines));
      expect(obj.$attrs.minLines).assertEqual('10');
      console.info('[MinLines_0012] END')
      done();
    });

      /**
       * @tc.name   MinLines_0013
       * @tc.number MinLines_0013
       * @tc.desc   minLines is 5.5
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('MinLines_0013', Level.LEVEL2, async (done: Function) => {
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('Button4'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[MinLines_0013] strJson is: ' + strJson);
      console.info('[MinLines_0013] MinLines obj is: ' + JSON.stringify(obj.$attrs.minLines));
      expect(obj.$attrs.minLines).assertEqual('5');
      console.info('[MinLines_0013] END')
      done();
    });

      /**
       * @tc.name   MinLines_0014
       * @tc.number MinLines_0014
       * @tc.desc   minLines is -2
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('MinLines_0014', Level.LEVEL1, async (done: Function) => {
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('Button5'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[MinLines_0014] strJson is: ' + strJson);
      console.info('[MinLines_0014] MinLines obj is: ' + JSON.stringify(obj.$attrs.minLines));
      expect(obj.$attrs.minLines).assertEqual('0');
      console.info('[MinLines_0014] END')
      done();
    });

      /**
       * @tc.name   MinLines_0015
       * @tc.number MinLines_0015
       * @tc.desc   minLines is -0.5
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('MinLines_0015', Level.LEVEL2, async (done: Function) => {
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('Button6'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[MinLines_0015] strJson is: ' + strJson);
      console.info('[MinLines_0015] MinLines obj is: ' + JSON.stringify(obj.$attrs.minLines));
      expect(obj.$attrs.minLines).assertEqual('0');
      console.info('[MinLines_0015] END')
      done();
    });

      /**
       * @tc.name   MinLines_0016
       * @tc.number MinLines_0016
       * @tc.desc   minLines is null
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('MinLines_0016', Level.LEVEL1, async (done: Function) => {
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('Button7'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[MinLines_0016] strJson is: ' + strJson);
      console.info('[MinLines_0016] MinLines obj is: ' + JSON.stringify(obj.$attrs.minLines));
      expect(obj.$attrs.minLines).assertEqual('0');
      console.info('[MinLines_0016] END')
      done();
    });

      /**
       * @tc.name   MinLines_0017
       * @tc.number MinLines_0017
       * @tc.desc   minLines is undefined
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('MinLines_0017', Level.LEVEL1, async (done: Function) => {
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('Button8'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[MinLines_0017] strJson is: ' + strJson);
      console.info('[MinLines_0017] MinLines obj is: ' + JSON.stringify(obj.$attrs.minLines));
      expect(obj.$attrs.minLines).assertEqual('0');
      console.info('[MinLines_0017] END')
      done();
    });
  })
}