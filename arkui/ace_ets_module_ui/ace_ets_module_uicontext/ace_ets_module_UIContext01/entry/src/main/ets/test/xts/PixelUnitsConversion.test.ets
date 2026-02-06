/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach,  it, Level, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
export default function PixelUnitsConversionJsunit() {
  describe('PixelUnitsConversionTest', () => {
    beforeEach(async (done: Function) => {
      console.info('text beforeEach start');
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/xts/PixelUnitsConversion',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get PixelUnitsConversion state pages:' + JSON.stringify(pages));
        if (!('PixelUnitsConversion' == pages.name)) {
          console.info('get PixelUnitsConversion state pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push PixelUnitsConversion page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push PixelUnitsConversion page error:' + JSON.stringify(err));
      }
      done()
    });
    afterEach(async  () =>{
      await Utils.sleep(1000);
      console.info('PixelUnitsConversion after each called');
    });
    /**
     * @tc.name   PixelUnitsConversionTest_0100
     * @tc.number PixelUnitsConversionTest_0100
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PixelUnitsConversionTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PixelUnitsConversionTest_0100 START');
      let driver1 = Driver.create();
      let button = await driver1.findComponent(ON.id('px2vp_01'));
      await button.click();
      await Utils.sleep(1000);
      let text = getInspectorByKey('px2vp_text');
      expect(JSON.parse(text).$attrs.content).assertEqual('220');
      console.info('PixelUnitsConversionTest_0100 END');
      done();
    });
    /**
     * @tc.name   PixelUnitsConversionTest_0200
     * @tc.number PixelUnitsConversionTest_0200
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PixelUnitsConversionTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('PixelUnitsConversionTest_0200 START');
      let driver1 = Driver.create();
      let button = await driver1.findComponent(ON.id('vp2px_01'));
      await button.click();
      await Utils.sleep(1000);
      let text = getInspectorByKey('vp2px_text');
      expect(JSON.parse(text).$attrs.content).assertEqual('220');
      console.info('PixelUnitsConversionTest_0200 END');
      done();
    });
    /**
     * @tc.name   PixelUnitsConversionTest_0300
     * @tc.number PixelUnitsConversionTest_0300
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PixelUnitsConversionTest_0300', Level.LEVEL0, async (done: Function) => {
      console.info('PixelUnitsConversionTest_0300 START');
      let driver1 = Driver.create();
      let button = await driver1.findComponent(ON.id('fp2px_01'));
      await button.click();
      await Utils.sleep(1000);
      let text = getInspectorByKey('fp2px_text');
      expect(JSON.parse(text).$attrs.content).assertEqual('220');
      console.info('PixelUnitsConversionTest_0300 END');
      done();
    });
    /**
     * @tc.name   PixelUnitsConversionTest_0400
     * @tc.number PixelUnitsConversionTest_0400
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PixelUnitsConversionTest_0400', Level.LEVEL0, async (done: Function) => {
      console.info('PixelUnitsConversionTest_0400 START');
      let driver1 = Driver.create();
      let button = await driver1.findComponent(ON.id('px2fp_01'));
      await button.click();
      await Utils.sleep(1000);
      let text = getInspectorByKey('px2fp_text');
      expect(JSON.parse(text).$attrs.content).assertEqual('220');
      console.info('PixelUnitsConversionTest_0400 END');
      done();
    });
    /**
     * @tc.name   PixelUnitsConversionTest_0500
     * @tc.number PixelUnitsConversionTest_0500
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PixelUnitsConversionTest_0500', Level.LEVEL0, async (done: Function) => {
      console.info('PixelUnitsConversionTest_0500 START');
      let driver1 = Driver.create();
      let button = await driver1.findComponent(ON.id('lpx2px_01'));
      await button.click();
      await Utils.sleep(1000);
      let text = getInspectorByKey('lpx2px_text');
      expect(JSON.parse(text).$attrs.content).assertEqual('220');
      console.info('PixelUnitsConversionTest_0500 END');
      done();
    });
    /**
     * @tc.name   PixelUnitsConversionTest_0600
     * @tc.number PixelUnitsConversionTest_0600
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PixelUnitsConversionTest_0600', Level.LEVEL0, async (done: Function) => {
      console.info('PixelUnitsConversionTest_0600 START');
      let driver1 = Driver.create();
      let button = await driver1.findComponent(ON.id('px2lpx_01'));
      await button.click();
      await Utils.sleep(1000);
      let text = getInspectorByKey('px2lpx_text');
      expect(JSON.parse(text).$attrs.content).assertEqual('220');
      console.info('PixelUnitsConversionTest_0600 END');
      done();
    });
  })
}