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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import bundle from '@ohos.bundle.bundleManager';

export default function spanJsunit() {
  describe('spanTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/span',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get span state success " + JSON.stringify(pages));
        if (!("span" == pages.name)) {
          console.info("get span pages success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push span page error: " + err);
      }
      done();
    });

    /**
     * @tc.number test_span_001
     * @tc.name Test the properties of components
     * @tc.desc Set lineHeight values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('test_span_001', 0, async (done: Function) => {
      console.info('[test_span_001] START');
      let strJson = getInspectorByKey('SpanKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_span_001] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.lineHeight).assertEqual('0.00fp');
      console.info('[test_span_001] END');
      done();
    });

    /**
     * @tc.number test_span_002
     * @tc.name Test the properties of components
     * @tc.desc Set textCase values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('test_span_002', 0, async (done: Function) => {
      console.info('[test_span_002] START');
      let strJson = getInspectorByKey('SpanKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_span_002] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.textCase).assertEqual('TextCase.Normal');
      console.info('[test_span_002] END');
      done();
    });

    /**
     * @tc.number test_span_003
     * @tc.name Test the properties of components
     * @tc.desc Set letterSpacing values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('test_span_003', 0, async (done: Function) => {
      console.info('[test_span_003] START');
      let strJson = getInspectorByKey('SpanKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_span_003] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.letterSpacing).assertEqual('0.00fp');
      console.info('[test_span_003] END');
      done();
    });

    /**
     * @tc.number test_span_004
     * @tc.name Test the properties of components
     * @tc.desc Set decoration values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('test_span_004', 0, async (done: Function) => {
      console.info('[test_span_004] START');
      let strJson = getInspectorByKey('SpanKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_span_004] obj is: " + JSON.stringify(obj.$attrs));
      let mDecoration: ESObject = JSON.parse(obj.$attrs.decoration);
      expect(mDecoration.type).assertEqual('TextDecorationType.LineThrough');
      console.info('[test_span_004] END');
      done();
    });

    /**
     * @tc.number test_span_005
     * @tc.name Test the properties of components
     * @tc.desc Set fontColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('test_span_005', 0, async (done: Function) => {
      console.info('[test_span_005] START');
      let strJson = getInspectorByKey('SpanKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_span_005] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.fontColor).assertEqual('#FF808080');
      console.info('[test_span_005] END');
      done();
    });

    /**
     * @tc.number test_span_006
     * @tc.name Test the properties of components
     * @tc.desc Set font values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('test_span_006', 0, async (done: Function) => {
      console.info('[test_span_006] START');
      let strJson = getInspectorByKey('SpanKey1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_span_006] obj is: " + JSON.stringify(obj.$attrs));
      let mFont: ESObject = JSON.parse(obj.$attrs.font);
      expect(mFont.size).assertEqual('40.00fp');
      console.info('[test_span_006] END');
      done();
    });

    /**
     * @tc.number test_span_007
     * @tc.name Test the properties of components
     * @tc.desc Set fontFamily values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('test_span_007', 0, async (done: Function) => {
      console.info('[test_span_007] START');
      let strJson = getInspectorByKey('SpanKey2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_span_007] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.fontFamily).assertEqual("fontFamily");
      console.info('[test_span_007] END');
      done();
    });

    /**
     * @tc.number test_span_008
     * @tc.name Test the properties of components
     * @tc.desc Set fontWeight values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('test_span_008', 0, async (done: Function) => {
      console.info('[test_span_008] START');
      let strJson = getInspectorByKey('SpanKey2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_span_008] obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Bolder');

      console.info('[test_span_008] END');
      done();
    });

    /**
     * @tc.number test_span_009
     * @tc.name Test the properties of components
     * @tc.desc Set fontStyle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('test_span_009', 0, async (done: Function) => {
      console.info('[test_span_009] START');
      let strJson = getInspectorByKey('SpanKey2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_span_009] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.fontStyle).assertEqual('FontStyle.Normal');
      console.info('[test_span_009] END');
      done();
    });

    /**
     * @tc.number test_span_010
     * @tc.name Test the properties of components
     * @tc.desc Set fontSize values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('test_span_010', 0, async (done: Function) => {
      console.info('[test_span_010] START');
      let strJson = getInspectorByKey('SpanKey2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[test_span_010] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.fontSize).assertEqual('20.00fp');
      console.info('[test_span_010] END');
      done();
    });

    /**
     * @tc.number test_span_011
     * @tc.name Test the properties of components
     * @tc.desc Change textCase values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('test_span_011', 0, async (done: Function) => {
      console.info('test_span_011 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)
      let strJsonNew = getInspectorByKey('SpanKey2');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("test_span_011 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.textCase).assertEqual('TextCase.Normal');
      console.info('test_span_011 END');
      done();
    });
  })
}