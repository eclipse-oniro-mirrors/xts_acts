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

export default function searchJsunit() {
  describe('searchTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/search',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get search state success " + JSON.stringify(pages));
        if (!("search" == pages.name)) {
          console.info("get search state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(1000);
        }
      } catch (err) {
        console.error("push search page error: " + err);
      }
      done();
    });

    /**
     * @tc.number searchTest_002
     * @tc.name Test the properties of components
     * @tc.desc Set copyOption values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('searchTest_002', 0, async (done: Function) => {
      console.info('searchTest_002 START');
      let strJsonNew = getInspectorByKey('search');
      let objNew = JSON.parse(strJsonNew);
      console.info("searchTest_002 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.copyOption).assertEqual("CopyOptions.None");
      console.info('searchTest_002 END');
      done();
    });

    /**
     * @tc.number searchTest_003
     * @tc.name Test the properties of components
     * @tc.desc Set fontColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('searchTest_003', 0, async (done: Function) => {
      console.info('searchTest_003 START');
      let strJsonNew = getInspectorByKey('search');
      let objNew = JSON.parse(strJsonNew);
      console.info("searchTest_003 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.fontColor).assertEqual("#FF4169E1");
      console.info('searchTest_003 END');
      done();
    });

    /**
     * @tc.number searchTest_004
     * @tc.name Test the properties of components
     * @tc.desc Set placeholderColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('searchTest_004', 0, async (done: Function) => {
      console.info('searchTest_004 START');
      let strJsonNew = getInspectorByKey('search');
      let objNew = JSON.parse(strJsonNew);
      console.info("searchTest_004 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.placeholderColor).assertEqual("#FF4169E1");
      console.info('searchTest_004 END');
      done();
    });

    /**
     * @tc.number searchTest_005
     * @tc.name Test the properties of components
     * @tc.desc Set placeholderFont values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('searchTest_005', 0, async (done: Function) => {
      console.info('searchTest_005 START');
      let strJsonNew = getInspectorByKey('search');
      let objNew = JSON.parse(strJsonNew);
      console.info("searchTest_005 component  is: " + JSON.stringify(objNew.$attrs.placeholderFont.size));
      let markObj = JSON.parse(objNew.$attrs.placeholderFont);
      expect(markObj.size).assertEqual("16.00fp");
      expect(markObj.style).assertEqual("FontStyle.Italic");
      console.info('searchTest_005 END');
      done();
    });

    /**
     * @tc.number searchTest_006
     * @tc.name Test the properties of components
     * @tc.desc Set textFont values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('searchTest_006', 0, async (done: Function) => {
      console.info('searchTest_006 START');
      let strJsonNew = getInspectorByKey('search');
      let objNew = JSON.parse(strJsonNew);
      console.info("searchTest_006 component  is: " + JSON.stringify(objNew.$attrs));
      let markObj = JSON.parse(objNew.$attrs.textFont);
      expect(markObj.fontSize).assertEqual("16.00fp");
      expect(markObj.fontStyle).assertEqual("FontStyle.Italic");
      console.info('searchTest_006 END');
      done();
    });

    /**
     * @tc.number searchTest_007
     * @tc.name Test the properties of components
     * @tc.desc Set textAlign values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('searchTest_007', 0, async (done: Function) => {
      console.info('searchTest_007 START');
      let strJsonNew = getInspectorByKey('search');
      let objNew = JSON.parse(strJsonNew);
      console.info("searchTest_007 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.textAlign).assertEqual("TextAlign.Start");
      console.info('searchTest_007 END');
      done();
    });

    /**
     * @tc.number searchTest_008
     * @tc.name Test the properties of components
     * @tc.desc Set enableKeyboardOnFocus values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('searchTest_008', 0, async (done: Function) => {
      console.info('searchTest_008 START');
      let strJsonNew = getInspectorByKey('search');
      let objNew = JSON.parse(strJsonNew);
      console.info("searchTest_008 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.enableKeyboardOnFocus).assertEqual(undefined);
      console.info('searchTest_008 END');
      done();
    });

    /**
     * @tc.number searchTest_009
     * @tc.name Test the properties of components
     * @tc.desc Set selectionMenuHidden values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('searchTest_009', 0, async (done: Function) => {
      console.info('searchTest_009 START');
      let strJsonNew = getInspectorByKey('search');
      let objNew = JSON.parse(strJsonNew);
      console.info("searchTest_009 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.selectionMenuHidden).assertEqual(undefined);
      console.info('searchTest_009 END');
      done();
    });

    /**
     * @tc.number searchTest_010
     * @tc.name Test the properties of components
     * @tc.desc Set caretStyle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('searchTest_010', 0, async (done: Function) => {
      console.info('searchTest_010 START');
      let strJsonNew = getInspectorByKey('search');
      let objNew = JSON.parse(strJsonNew);
      console.info("searchTest_010 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.caretStyle.width).assertEqual("3.20fp");
      expect(objNew.$attrs.caretStyle.color).assertEqual("#80FF64FF");
      console.info('searchTest_010 END');
      done();
    });

    /**
     * @tc.number searchTest_011
     * @tc.name Test the properties of components
     * @tc.desc Set searchIcon values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('searchTest_011', 0, async (done: Function) => {
      console.info('searchTest_011 START');
      let strJsonNew = getInspectorByKey('search');
      let objNew = JSON.parse(strJsonNew);
      console.info("searchTest_011 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.searchIcon.size).assertEqual("15.00px");
      console.info('searchTest_011 END');
      done();
    });

    /**
     * @tc.number searchTest_012
     * @tc.name Test the properties of components
     * @tc.desc Set searchButton values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('searchTest_012', 0, async (done: Function) => {
      console.info('searchTest_012 START');
      let strJsonNew = getInspectorByKey('search');
      let objNew = JSON.parse(strJsonNew);
      console.info("searchTest_012 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.searchButton).assertEqual("SearchText");
      console.info('searchTest_012 END');
      done();
    });

    /**
     * @tc.number searchTest_013
     * @tc.name Test the properties of components
     * @tc.desc Set cancelButton values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('searchTest_013', 0, async (done: Function) => {
      console.info('searchTest_013 START');
      let strJsonNew = getInspectorByKey('search');
      let objNew = JSON.parse(strJsonNew);
      console.info("searchTest_013 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.cancelButton.style).assertEqual("CancelButtonStyle.CONSTANT");
      console.info('searchTest_013 END');
      done();
    });

    /**
     * @tc.number searchTest_001
     * @tc.name Test the properties of components
     * @tc.desc Change copyOption values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('searchTest_001', 0, async (done: Function) => {
      console.info('searchTest_001 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)
      let strJsonNew = getInspectorByKey('search'); //测试组件的key名称
      let objNew = JSON.parse(strJsonNew);
      console.info("searchTest_001 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.copyOption).assertEqual("CopyOptions.InApp");
      console.info('searchTest_001 END');
      done();
    });
  })
}