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
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function lineHeight() {
  describe('lineHeight', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/lineHeight',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get lineHeight state pages: ' + JSON.stringify(pages));
        if (!('lineHeight' == pages.name)) {
          console.info('get lineHeight state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push lineHeight success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push lineHeight page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('lineHeight after each called');
    });

    /**
     * @tc.name   lineHeightMultiple_0010
     * @tc.number lineHeightMultiple_0010
     * @tc.desc   test lineHeightMultiple is 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('lineHeightMultiple_0010', Level.LEVEL1, async (done: Function) => {
      console.info('[lineHeightMultiple_0010] START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('Multiple5'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textLineHeightMultiple');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[lineHeightMultiple_0010] strJson is: ' + strJson);
      console.info('[lineHeightMultiple_0010] lineHeightMultiple obj is: ' +
      JSON.stringify(obj.$attrs.lineHeightMultiply));
      expect(obj.$attrs.lineHeightMultiply).assertEqual('2.000000');
      console.info('[lineHeightMultiple_0010] END')
      done();
    });

    /**
     * @tc.name   lineHeightMultiple_0020
     * @tc.number lineHeightMultiple_0020
     * @tc.desc   test lineHeightMultiple is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('lineHeightMultiple_0020', Level.LEVEL2, async (done: Function) => {
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('MultipleNull'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textLineHeightMultiple');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[lineHeightMultiple_0020] strJson is: ' + strJson);
      console.info('[lineHeightMultiple_0020] lineHeightMultiple obj is: ' +
      JSON.stringify(obj.$attrs.lineHeightMultiply));
      expect(obj.$attrs.lineHeightMultiply).assertUndefined();
      console.info('[lineHeightMultiple_0020] END')
      done();
    });

    /**
     * @tc.name   lineHeightMultiple_0030
     * @tc.number lineHeightMultiple_0030
     * @tc.desc   test lineHeightMultiple is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('lineHeightMultiple_0030', Level.LEVEL2, async (done: Function) => {
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('MultipleUndefined'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textLineHeightMultiple');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[lineHeightMultiple_0030] strJson is: ' + strJson);
      console.info('[lineHeightMultiple_0030] lineHeightMultiple obj is: ' +
      JSON.stringify(obj.$attrs.lineHeightMultiply));
      expect(obj.$attrs.lineHeightMultiply).assertUndefined();
      console.info('[lineHeightMultiple_0030] END')
      done();
    });

    /**
     * @tc.name   maxLineHeight_0010
     * @tc.number maxLineHeight_0010
     * @tc.desc   test maxLineHeight is value: 2, unit: LengthUnit.PX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('maxLineHeight_0010', Level.LEVEL1, async (done: Function) => {
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('LineHeight30pxUnit'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textLineHeight');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[maxLineHeight_0010] strJson is: ' + strJson);
      console.info('[maxLineHeight_0010] maxLineHeight obj is: ' + JSON.stringify(obj.$attrs.maxLineHeight));
      expect(obj.$attrs.maxLineHeight).assertEqual('2.00px');
      console.info('[maxLineHeight_0010] END')
      done();
    });

    /**
     * @tc.name   maxLineHeight_0020
     * @tc.number maxLineHeight_0020
     * @tc.desc   test maxLineHeight is value: 2, unit: LengthUnit.LPX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('maxLineHeight_0020', Level.LEVEL1, async (done: Function) => {
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('LineHeight30lpxUnit'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textLineHeight');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[maxLineHeight_0020] strJson is: ' + strJson);
      console.info('[maxLineHeight_0020] maxLineHeight obj is: ' + JSON.stringify(obj.$attrs.maxLineHeight));
      expect(obj.$attrs.maxLineHeight).assertEqual('2.00lpx');
      console.info('[maxLineHeight_0020] END')
      done();
    });

    /**
     * @tc.name   maxLineHeight_0030
     * @tc.number maxLineHeight_0030
     * @tc.desc   test maxLineHeight is 2vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('maxLineHeight_0030', Level.LEVEL1, async (done: Function) => {
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('LineHeight20vp'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textLineHeight');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[maxLineHeight_0030] strJson is: ' + strJson);
      console.info('[maxLineHeight_0030] maxLineHeight obj is: ' + JSON.stringify(obj.$attrs.maxLineHeight));
      expect(obj.$attrs.maxLineHeight).assertEqual('2.00vp');
      console.info('[maxLineHeight_0030] END')
      done();
    });

    /**
     * @tc.name   maxLineHeight_0040
     * @tc.number maxLineHeight_0040
     * @tc.desc   test maxLineHeight is 2fp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('maxLineHeight_0040', Level.LEVEL1, async (done: Function) => {
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('LineHeight20fp'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textLineHeight');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[maxLineHeight_0040] strJson is: ' + strJson);
      console.info('[maxLineHeight_0040] maxLineHeight obj is: ' + JSON.stringify(obj.$attrs.maxLineHeight));
      expect(obj.$attrs.maxLineHeight).assertEqual('2.00fp');
      console.info('[maxLineHeight_0040] END')
      done();
    });

    /**
     * @tc.name   maxLineHeight_0050
     * @tc.number maxLineHeight_0050
     * @tc.desc   test maxLineHeight is 2%
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('maxLineHeight_0050', Level.LEVEL1, async (done: Function) => {
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('LineHeight30percent'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textLineHeight');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[maxLineHeight_0050] strJson is: ' + strJson);
      console.info('[maxLineHeight_0050] maxLineHeight obj is: ' + JSON.stringify(obj.$attrs.maxLineHeight));
      expect(obj.$attrs.maxLineHeight).assertEqual('200.00%');
      console.info('[maxLineHeight_0050] END')
      done();
    });

    /**
     * @tc.name   maxLineHeight_0060
     * @tc.number maxLineHeight_0060
     * @tc.desc   test maxLineHeight is resource 2fp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('maxLineHeight_0060', Level.LEVEL1, async (done: Function) => {
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('LineHeightResource50fp'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textLineHeight');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[maxLineHeight_0060] strJson is: ' + strJson);
      console.info('[maxLineHeight_0060] maxLineHeight obj is: ' + JSON.stringify(obj.$attrs.maxLineHeight));
      expect(obj.$attrs.maxLineHeight).assertEqual('2.00fp');
      console.info('[maxLineHeight_0060] END')
      done();
    });

    /**
     * @tc.name   maxLineHeight_0070
     * @tc.number maxLineHeight_0070
     * @tc.desc   test maxLineHeight is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('maxLineHeight_0070', Level.LEVEL2, async (done: Function) => {
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('LineHeightNull'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textLineHeight');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[maxLineHeight_0070] strJson is: ' + strJson);
      console.info('[maxLineHeight_0070] maxLineHeight obj is: ' + JSON.stringify(obj.$attrs.maxLineHeight));
      expect(obj.$attrs.maxLineHeight).assertEqual('0.00fp');
      console.info('[maxLineHeight_0070] END')
      done();
    });

    /**
     * @tc.name   maxLineHeight_0080
     * @tc.number maxLineHeight_0080
     * @tc.desc   test maxLineHeight is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('maxLineHeight_0080', Level.LEVEL2, async (done: Function) => {
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('LineHeightUndefined'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textLineHeight');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[maxLineHeight_0080] strJson is: ' + strJson);
      console.info('[maxLineHeight_0080] maxLineHeight obj is: ' + JSON.stringify(obj.$attrs.maxLineHeight));
      expect(obj.$attrs.maxLineHeight).assertEqual('0.00fp');
      console.info('[maxLineHeight_0080] END')
      done();
    });


    /**
     * @tc.name   minLineHeight_0010
     * @tc.number minLineHeight_0010
     * @tc.desc   test minLineHeight is value: 2, unit: LengthUnit.PX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('minLineHeight_0010', Level.LEVEL1, async (done: Function) => {
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('LineHeight30pxUnit'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textLineHeight');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[minLineHeight_0010] strJson is: ' + strJson);
      console.info('[minLineHeight_0010] minLineHeight obj is: ' + JSON.stringify(obj.$attrs.minLineHeight));
      expect(obj.$attrs.minLineHeight).assertEqual('2.00px');
      console.info('[minLineHeight_0010] END')
      done();
    });

    /**
     * @tc.name   minLineHeight_0020
     * @tc.number minLineHeight_0020
     * @tc.desc   test minLineHeight is value: 2, unit: LengthUnit.LPX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('minLineHeight_0020', Level.LEVEL1, async (done: Function) => {
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('LineHeight30lpxUnit'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textLineHeight');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[minLineHeight_0020] strJson is: ' + strJson);
      console.info('[minLineHeight_0020] minLineHeight obj is: ' + JSON.stringify(obj.$attrs.minLineHeight));
      expect(obj.$attrs.minLineHeight).assertEqual('2.00lpx');
      console.info('[minLineHeight_0020] END')
      done();
    });

    /**
     * @tc.name   minLineHeight_0030
     * @tc.number minLineHeight_0030
     * @tc.desc   test minLineHeight is 2vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('minLineHeight_0030', Level.LEVEL1, async (done: Function) => {
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('LineHeight20vp'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textLineHeight');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[minLineHeight_0030] strJson is: ' + strJson);
      console.info('[minLineHeight_0030] minLineHeight obj is: ' + JSON.stringify(obj.$attrs.minLineHeight));
      expect(obj.$attrs.minLineHeight).assertEqual('2.00vp');
      console.info('[minLineHeight_0030] END')
      done();
    });

    /**
     * @tc.name   minLineHeight_0040
     * @tc.number minLineHeight_0040
     * @tc.desc   test minLineHeight is 2fp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('minLineHeight_0040', Level.LEVEL1, async (done: Function) => {
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('LineHeight20fp'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textLineHeight');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[minLineHeight_0040] strJson is: ' + strJson);
      console.info('[minLineHeight_0040] minLineHeight obj is: ' + JSON.stringify(obj.$attrs.minLineHeight));
      expect(obj.$attrs.minLineHeight).assertEqual('2.00fp');
      console.info('[minLineHeight_0040] END')
      done();
    });

    /**
     * @tc.name   minLineHeight_0050
     * @tc.number minLineHeight_0050
     * @tc.desc   test minLineHeight is 2%
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('minLineHeight_0050', Level.LEVEL1, async (done: Function) => {
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('LineHeight30percent'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textLineHeight');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[minLineHeight_0050] strJson is: ' + strJson);
      console.info('[minLineHeight_0050] minLineHeight obj is: ' + JSON.stringify(obj.$attrs.minLineHeight));
      expect(obj.$attrs.minLineHeight).assertEqual('200.00%');
      console.info('[minLineHeight_0050] END')
      done();
    });

    /**
     * @tc.name   minLineHeight_0060
     * @tc.number minLineHeight_0060
     * @tc.desc   test minLineHeight is resource 2fp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('minLineHeight_0060', Level.LEVEL1, async (done: Function) => {
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('LineHeightResource50fp'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textLineHeight');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[minLineHeight_0060] strJson is: ' + strJson);
      console.info('[minLineHeight_0060] minLineHeight obj is: ' + JSON.stringify(obj.$attrs.minLineHeight));
      expect(obj.$attrs.minLineHeight).assertEqual('2.00fp');
      console.info('[minLineHeight_0060] END')
      done();
    });

    /**
     * @tc.name   minLineHeight_0070
     * @tc.number minLineHeight_0070
     * @tc.desc   test minLineHeight is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('minLineHeight_0070', Level.LEVEL2, async (done: Function) => {
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('LineHeightNull'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textLineHeight');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[minLineHeight_0070] strJson is: ' + strJson);
      console.info('[minLineHeight_0070] minLineHeight obj is: ' + JSON.stringify(obj.$attrs.minLineHeight));
      expect(obj.$attrs.minLineHeight).assertEqual('0.00fp');
      console.info('[minLineHeight_0070] END')
      done();
    });

    /**
     * @tc.name   minLineHeight_0080
     * @tc.number minLineHeight_0080
     * @tc.desc   test minLineHeight is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('minLineHeight_0080', Level.LEVEL2, async (done: Function) => {
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('LineHeightUndefined'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textLineHeight');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[minLineHeight_0080] strJson is: ' + strJson);
      console.info('[minLineHeight_0080] minLineHeight obj is: ' + JSON.stringify(obj.$attrs.minLineHeight));
      expect(obj.$attrs.minLineHeight).assertEqual('0.00fp');
      console.info('[minLineHeight_0080] END')
      done();
    });
  })
}