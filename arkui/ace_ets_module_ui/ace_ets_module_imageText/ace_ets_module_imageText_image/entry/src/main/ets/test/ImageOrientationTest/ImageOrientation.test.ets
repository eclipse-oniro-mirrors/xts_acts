/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { Component, Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'


export default function ImageOrientationTest() {
  describe('ImageOrientationTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ImageOrientationTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageOrientation/ImageOrientation',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ImageOrientationTest state pages:' + JSON.stringify(pages));
        if (!('ImageOrientation' === pages.name)) {
          console.info('get ImageOrientationTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2500);
          console.info('push ImageOrientationTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ImageOrientationTest page error:' + err);
      }
      console.info('ImageOrientationTest beforeEach end');
      done();
    });

    /**
     * @tc.name   ImageOrientationTest_0100
     * @tc.number ImageOrientationTest_0100
     * @tc.desc   To test the orientation AUTO 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageOrientationTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('ImageOrientationTest_0100 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      // get the image component and test attribute
      let button: Component = await driver.findComponent(ON.id('AutoID'));
      await CommonFunc.sleep(1000);
      await button.click()
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('imageOrientation');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImageOrientationTest_0100 ImageRotateOrientation.AUTO component obj is: ' + obj.$attrs.orientation);
      expect(obj.$attrs.orientation).assertEqual('0');
      done();
    });

    /**
     * @tc.name   ImageOrientationTest_0200
     * @tc.number ImageOrientationTest_0200
     * @tc.desc   To test the orientation UP 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageOrientationTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('ImageOrientationTest_0200 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      // get the image component and test attribute
      let button: Component = await driver.findComponent(ON.id('UpID'));
      await CommonFunc.sleep(1000);
      await button.click()
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('imageOrientation');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImageOrientationTest_0200 ImageRotateOrientation.UP component obj is: ' + obj.$attrs.orientation);
      expect(obj.$attrs.orientation).assertEqual('1');
      done();
    });

    /**
     * @tc.name   ImageOrientationTest_0300
     * @tc.number ImageOrientationTest_0300
     * @tc.desc   To test the orientation DOWN 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageOrientationTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('ImageOrientationTest_0300 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      // get the image component and test attribute
      let button: Component = await driver.findComponent(ON.id('DownID'));
      await CommonFunc.sleep(1000);
      await button.click()
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('imageOrientation');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImageOrientationTest_0300 ImageRotateOrientation.DOWN component obj is: ' + obj.$attrs.orientation);
      expect(obj.$attrs.orientation).assertEqual('3');
      done();
    });

    /**
     * @tc.name   ImageOrientationTest_0400
     * @tc.number ImageOrientationTest_0400
     * @tc.desc   To test the orientation RIGHT 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageOrientationTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('ImageOrientationTest_0400 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      // get the image component and test attribute
      let button: Component = await driver.findComponent(ON.id('RightID'));
      await CommonFunc.sleep(1000);
      await button.click()
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('imageOrientation');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImageOrientationTest_0400 ImageRotateOrientation.RIGHT component obj is: ' + obj.$attrs.orientation);
      expect(obj.$attrs.orientation).assertEqual('2');
      done();
    });

    /**
     * @tc.name   ImageOrientationTest_0500
     * @tc.number ImageOrientationTest_0500
     * @tc.desc   To test the orientation LEFT 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageOrientationTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('ImageOrientationTest_0500 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      // get the image component and test attribute
      let button: Component = await driver.findComponent(ON.id('LeftID'));
      await CommonFunc.sleep(1000);
      await button.click()
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('imageOrientation');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImageOrientationTest_0500 ImageRotateOrientation.LEFT component obj is: ' + obj.$attrs.orientation);
      expect(obj.$attrs.orientation).assertEqual('4');
      done();
    });

    /**
     * @tc.name   ImageOrientationTest_0600
     * @tc.number ImageOrientationTest_0600
     * @tc.desc   To test the orientation NULL 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageOrientationTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('ImageOrientationTest_0600 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      // get the image component and test attribute
      let button: Component = await driver.findComponent(ON.id('nullID'));
      await CommonFunc.sleep(1000);
      await button.click()
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('imageOrientation');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImageOrientationTest_0600 null component obj is: ' + obj.$attrs.orientation);
      expect(obj.$attrs.orientation).assertEqual('0');
      done();
    });

    /**
     * @tc.name   ImageOrientationTest_0700
     * @tc.number ImageOrientationTest_0700
     * @tc.desc   To test the orientation UNDEFINED 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageOrientationTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('ImageOrientationTest_0700 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      // get the image component and test attribute
      let button: Component = await driver.findComponent(ON.id('undefinedID'));
      await CommonFunc.sleep(1000);
      await button.click()
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('imageOrientation');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImageOrientationTest_0700 undefined component obj is: ' + obj.$attrs.orientation);
      expect(obj.$attrs.orientation).assertEqual('0');
      done();
    });

    /**
     * @tc.name   ImageOrientationTest_0800
     * @tc.number ImageOrientationTest_0800
     * @tc.desc   To test the orientation LEFT_MIRRORED 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageOrientationTest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('ImageOrientationTest_0800 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      // get the image component and test attribute
      let button: Component = await driver.findComponent(ON.id('LEFT_MIRRORED_ID'));
      await CommonFunc.sleep(1000);
      await button.click()
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('imageOrientation');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImageOrientationTest_0800 ImageRotateOrientation.LEFT_MIRRORED component obj is: ' + obj.$attrs.orientation);
      expect(obj.$attrs.orientation).assertEqual('8');
      done();
    });

    /**
     * @tc.name   ImageOrientationTest_0900
     * @tc.number ImageOrientationTest_0900
     * @tc.desc   To test the orientation RIGHT_MIRRORED 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageOrientationTest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('ImageOrientationTest_0900 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      // get the image component and test attribute
      let button: Component = await driver.findComponent(ON.id('RIGHT_MIRRORED_ID'));
      await CommonFunc.sleep(1000);
      await button.click()
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('imageOrientation');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImageOrientationTest_0900 ImageRotateOrientation.RIGHT_MIRRORED component obj is: ' + obj.$attrs.orientation);
      expect(obj.$attrs.orientation).assertEqual('6');
      done();
    });

    /**
     * @tc.name   ImageOrientationTest_1000
     * @tc.number ImageOrientationTest_1000
     * @tc.desc   To test the orientation UP_MIRRORED 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageOrientationTest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('ImageOrientationTest_1000 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      // get the image component and test attribute
      let button: Component = await driver.findComponent(ON.id('UP_MIRRORED_ID'));
      await CommonFunc.sleep(1000);
      await button.click()
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('imageOrientation');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImageOrientationTest_1000 ImageRotateOrientation.UP_MIRRORED component obj is: ' + obj.$attrs.orientation);
      expect(obj.$attrs.orientation).assertEqual('5');
      done();
    });

    /**
     * @tc.name   ImageOrientationTest_1100
     * @tc.number ImageOrientationTest_1100
     * @tc.desc   To test the orientation DOWN_MIRRORED 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageOrientationTest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('ImageOrientationTest_1100 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      // get the image component and test attribute
      let button: Component = await driver.findComponent(ON.id('DOWN_MIRRORED_ID'));
      await CommonFunc.sleep(1000);
      await button.click()
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('imageOrientation');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImageOrientationTest_1100 ImageRotateOrientation.DOWN_MIRRORED component obj is: ' + obj.$attrs.orientation);
      expect(obj.$attrs.orientation).assertEqual('7');
      done();
    });
  })
}