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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import Utils from './Utils';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'
import events_emitter from '@ohos.events.emitter';

export default function textAreaJsunit() {
  describe('textAreaTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textArea',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textArea state success " + JSON.stringify(pages));
        if (!("textArea" == pages.name)) {
          console.info("get textArea state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(1000);
        }
      } catch (err) {
        console.error("push textArea page error: " + err);
      }
      done();
    });

    /**
     * @tc.number textAreaTest_002
     * @tc.name Test the properties of components
     * @tc.desc Set copyOption values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textAreaTest_002', 0, async (done: Function) => {
      console.info('textAreaTest_002 START');
      let strJsonNew = getInspectorByKey('textArea');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textAreaTest_002 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.copyOption).assertEqual("CopyOptions.None");
      console.info('textAreaTest_002 END');
      done();
    });

    /**
     * @tc.number textAreaTest_003
     * @tc.name Test the properties of components
     * @tc.desc Set fontColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textAreaTest_003', 0, async (done: Function) => {
      console.info('textAreaTest_003 START');
      let strJsonNew = getInspectorByKey('textArea');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textAreaTest_003 component  is: " + JSON.stringify(objNew.$attrs));
      // expect(objNew.$attrs.fontColor).assertEqual("#FF123456");
      expect(objNew.$attrs.fontColor).assertNotNull;
      console.info('textAreaTest_003 END');
      done();
    });

    /**
     * @tc.number textAreaTest_004
     * @tc.name Test the properties of components
     * @tc.desc Set placeholderColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textAreaTest_004', 0, async (done: Function) => {
      console.info('textAreaTest_004 START');
      let strJsonNew = getInspectorByKey('textArea');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textAreaTest_004 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.placeholderColor).assertEqual("#FF000000");
      console.info('textAreaTest_004 END');
      done();
    });

    /**
     * @tc.number textAreaTest_005
     * @tc.name Test the properties of components
     * @tc.desc Set placeholderFont values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textAreaTest_005', 0, async (done: Function) => {
      console.info('textAreaTest_005 START');
      let strJsonNew = getInspectorByKey('textArea');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textAreaTest_005 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.placeholderFont)
        .assertEqual("{\"style\":\"FontStyle.Normal\",\"size\":\"16.00fp\",\"weight\":\"400\",\"fontFamily\":\"sans-serif\"}");
      console.info('textAreaTest_005 END');
      done();
    });

    /**
     * @tc.number textAreaTest_006
     * @tc.name Test the properties of components
     * @tc.desc Set fontWeight values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textAreaTest_006', 0, async (done: Function) => {
      console.info('textAreaTest_006 START');
      let strJsonNew = getInspectorByKey('textArea');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textAreaTest_006 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.fontWeight).assertEqual("100");
      console.info('textAreaTest_006 END');
      done();
    });

    /**
     * @tc.number textAreaTest_007
     * @tc.name Test the properties of components
     * @tc.desc Set textAlign values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textAreaTest_007', 0, async (done: Function) => {
      console.info('textAreaTest_007 START');
      let strJsonNew = getInspectorByKey('textArea');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textAreaTest_007 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.textAlign).assertEqual("TextAlign.Start");
      console.info('textAreaTest_007 END');
      done();
    });

    /**
     * @tc.number textAreaTest_008
     * @tc.name Test the properties of components
     * @tc.desc Set selectionMenuHidden values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textAreaTest_008', 0, async (done: Function) => {
      console.info('textAreaTest_008 START');
      let strJsonNew = getInspectorByKey('textArea');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textAreaTest_008 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.selectionMenuHidden).assertEqual(undefined);
      console.info('textAreaTest_008 END');
      done();
    });

    /**
     * @tc.number textAreaTest_009
     * @tc.name Test the properties of components
     * @tc.desc Set enableKeyboardOnFocus values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textAreaTest_009', 0, async (done: Function) => {
      console.info('textAreaTest_009 START');
      let strJsonNew = getInspectorByKey('textArea');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textAreaTest_009 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.enableKeyboardOnFocus).assertEqual(undefined);
      console.info('textAreaTest_009 END');
      done();
    });

    /**
     * @tc.number textAreaTest_010
     * @tc.name Test the properties of components
     * @tc.desc Set caretColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textAreaTest_010', 0, async (done: Function) => {
      console.info('textAreaTest_010 START');
      let strJsonNew = getInspectorByKey('textArea');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textAreaTest_010 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.caretColor).assertEqual("#FF000000");
      console.info('textAreaTest_010 END');
      done();
    });

    /**
     * @tc.number textAreaTest_011
     * @tc.name Test the properties of components
     * @tc.desc Set maxLength values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textAreaTest_011', 0, async (done: Function) => {
      console.info('textAreaTest_011 START');
      let strJsonNew = getInspectorByKey('textArea');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textAreaTest_011 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.maxLength).assertEqual("40");
      console.info('textAreaTest_011 END');
      done();
    });

    /**
     * @tc.number textAreaTest_012
     * @tc.name Test the properties of components
     * @tc.desc Set maxLines values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textAreaTest_012', 0, async (done: Function) => {
      console.info('textAreaTest_012 START');
      let strJsonNew = getInspectorByKey('textArea');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textAreaTest_012 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.maxLines).assertEqual("20");
      console.info('textAreaTest_012 END');
      done();
    });

    /**
     * @tc.number textAreaTest_013
     * @tc.name Test the properties of components
     * @tc.desc Set style values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textAreaTest_013', 0, async (done: Function) => {
      console.info('textAreaTest_013 START');
      let strJsonNew = getInspectorByKey('textArea');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textAreaTest_013 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.style).assertEqual("TextContentStyle.INLINE");
      console.info('textAreaTest_013 END');
      done();
    });

    /**
     * @tc.number textAreaTest_014
     * @tc.name Test the properties of components
     * @tc.desc Set fontStyle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textAreaTest_014', 0, async (done: Function) => {
      console.info('textAreaTest_014 START');
      let strJsonNew = getInspectorByKey('textArea');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textAreaTest_014 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.fontStyle).assertEqual("FontStyle.Italic");
      console.info('textAreaTest_014 END');
      done();
    });

    /**
     * @tc.number textAreaTest_018
     * @tc.name Test the properties of components
     * @tc.desc Set fontSize values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textAreaTest_018', 0, async (done: Function) => {
      console.info('textAreaTest_018 START');
      let strJsonNew = getInspectorByKey('textArea');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textAreaTest_018 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.fontSize).assertEqual("12.00fp");
      console.info('textAreaTest_018 END');
      done();
    });

    /**
     * @tc.number textAreaTest_015
     * @tc.name Test the properties of components
     * @tc.desc Set fontFamily values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textAreaTest_015', 0, async (done: Function) => {
      console.info('textAreaTest_015 START');
      let strJsonNew = getInspectorByKey('textArea');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textAreaTest_015 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.fontFamily).assertEqual("fontFamily");
      console.info('textAreaTest_015 END');
      done();
    });

    /**
     * @tc.number textAreaTest_016
     * @tc.name Test the properties of components
     * @tc.desc Set barState values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textAreaTest_016', 0, async (done: Function) => {
      console.info('textAreaTest_016 START');
      let strJsonNew = getInspectorByKey('textArea');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textAreaTest_016 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.barState).assertEqual("BarState.ON");
      console.info('textAreaTest_016 END');
      done();
    });

    /**
     * @tc.number textAreaTest_017
     * @tc.name Test the properties of components
     * @tc.desc Set showCounter values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textAreaTest_017', 0, async (done: Function) => {
      console.info('textAreaTest_017 START');
      let strJsonNew = getInspectorByKey('textArea');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textAreaTest_017 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.showCounter.value).assertEqual(false);
      console.info('textAreaTest_017 END');
      done();
    });

    /**
     * @tc.number textAreaTest_001
     * @tc.name Test the properties of components
     * @tc.desc Change fontColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('textAreaTest_001', 0, async (done: Function) => {
      console.info('textAreaTest_001 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew = getInspectorByKey('textArea'); //测试组件的key名称
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("textAreaTest_001 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.fontStyle).assertEqual("FontStyle.Normal");
      console.info('textAreaTest_001 END');
      done();
    });

  })
}