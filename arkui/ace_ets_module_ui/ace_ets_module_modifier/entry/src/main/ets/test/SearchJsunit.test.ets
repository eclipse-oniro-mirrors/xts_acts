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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
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
     * @tc.name   searchTest_002
     * @tc.number searchTest_002
     * @tc.desc   Set copyOption values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('searchTest_002', Level.LEVEL0, async (done: Function) => {
      console.info('searchTest_002 START');
      let strJsonNew = getInspectorByKey('search');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("searchTest_002 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.copyOption).assertEqual("CopyOptions.None");
      console.info('searchTest_002 END');
      done();
    });

    /**
     * @tc.name   searchTest_003
     * @tc.number searchTest_003
     * @tc.desc   Set fontColor values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('searchTest_003', Level.LEVEL0, async (done: Function) => {
      console.info('searchTest_003 START');
      let strJsonNew = getInspectorByKey('search');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("searchTest_003 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.fontColor).assertEqual("#FF4169E1");
      console.info('searchTest_003 END');
      done();
    });

    /**
     * @tc.name   searchTest_004
     * @tc.number searchTest_004
     * @tc.desc   Set placeholderColor values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('searchTest_004', Level.LEVEL0, async (done: Function) => {
      console.info('searchTest_004 START');
      let strJsonNew = getInspectorByKey('search');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("searchTest_004 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.placeholderColor).assertEqual("#FF4169E1");
      console.info('searchTest_004 END');
      done();
    });

    /**
     * @tc.name   searchTest_005
     * @tc.number searchTest_005
     * @tc.desc   Set placeholderFont values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('searchTest_005', Level.LEVEL0, async (done: Function) => {
      console.info('searchTest_005 START');
      let strJsonNew = getInspectorByKey('search');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("searchTest_005 component  is: " + JSON.stringify(objNew.$attrs.placeholderFont.size));
      let markObj: ESObject = JSON.parse(objNew.$attrs.placeholderFont);
      expect(markObj.size).assertEqual("16.00fp");
      expect(markObj.style).assertEqual("FontStyle.Italic");
      console.info('searchTest_005 END');
      done();
    });

    /**
     * @tc.name   searchTest_006
     * @tc.number searchTest_006
     * @tc.desc   Set textFont values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('searchTest_006', Level.LEVEL0, async (done: Function) => {
      console.info('searchTest_006 START');
      let strJsonNew = getInspectorByKey('search');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("searchTest_006 component  is: " + JSON.stringify(objNew.$attrs));
      let markObj: ESObject = JSON.parse(objNew.$attrs.textFont);
      expect(markObj.fontSize).assertEqual("16.00fp");
      expect(markObj.fontStyle).assertEqual("FontStyle.Italic");
      console.info('searchTest_006 END');
      done();
    });

    /**
     * @tc.name   searchTest_007
     * @tc.number searchTest_007
     * @tc.desc   Set textAlign values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('searchTest_007', Level.LEVEL0, async (done: Function) => {
      console.info('searchTest_007 START');
      let strJsonNew = getInspectorByKey('search');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("searchTest_007 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.textAlign).assertEqual("TextAlign.Start");
      console.info('searchTest_007 END');
      done();
    });

    /**
     * @tc.name   searchTest_008
     * @tc.number searchTest_008
     * @tc.desc   Set enableKeyboardOnFocus values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('searchTest_008', Level.LEVEL0, async (done: Function) => {
      console.info('searchTest_008 START');
      let strJsonNew = getInspectorByKey('search');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("searchTest_008 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.enableKeyboardOnFocus).assertEqual(undefined);
      console.info('searchTest_008 END');
      done();
    });

    /**
     * @tc.name   searchTest_009
     * @tc.number searchTest_009
     * @tc.desc   Set selectionMenuHidden values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('searchTest_009', Level.LEVEL0, async (done: Function) => {
      console.info('searchTest_009 START');
      let strJsonNew = getInspectorByKey('search');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("searchTest_009 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.selectionMenuHidden).assertEqual(undefined);
      console.info('searchTest_009 END');
      done();
    });

    /**
     * @tc.name   searchTest_010
     * @tc.number searchTest_010
     * @tc.desc   Set caretStyle values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('searchTest_010', Level.LEVEL0, async (done: Function) => {
      console.info('searchTest_010 START');
      let strJsonNew = getInspectorByKey('search');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("searchTest_010 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.caretStyle.width).assertEqual("3.20fp");
      expect(objNew.$attrs.caretStyle.color).assertEqual("#80FF64FF");
      console.info('searchTest_010 END');
      done();
    });

    /**
     * @tc.name   searchTest_011
     * @tc.number searchTest_011
     * @tc.desc   Set searchIcon values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('searchTest_011', Level.LEVEL0, async (done: Function) => {
      console.info('searchTest_011 START');
      let strJsonNew = getInspectorByKey('search');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("searchTest_011 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.searchIcon.size).assertEqual("15.00px");
      console.info('searchTest_011 END');
      done();
    });

    /**
     * @tc.name   searchTest_012
     * @tc.number searchTest_012
     * @tc.desc   Set searchButton values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('searchTest_012', Level.LEVEL0, async (done: Function) => {
      console.info('searchTest_012 START');
      let strJsonNew = getInspectorByKey('search');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("searchTest_012 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.searchButton).assertEqual("SearchText");
      console.info('searchTest_012 END');
      done();
    });

    /**
     * @tc.name   searchTest_013
     * @tc.number searchTest_013
     * @tc.desc   Set cancelButton values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('searchTest_013', Level.LEVEL0, async (done: Function) => {
      console.info('searchTest_013 START');
      let strJsonNew = getInspectorByKey('search');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("searchTest_013 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.cancelButton.style).assertEqual("CancelButtonStyle.CONSTANT");
      console.info('searchTest_013 END');
      done();
    });

    /**
     * @tc.name   searchTest_001
     * @tc.number searchTest_001
     * @tc.desc   Change copyOption values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('searchTest_001', Level.LEVEL0, async (done: Function) => {
      console.info('searchTest_001 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)
      let strJsonNew = getInspectorByKey('search'); //测试组件的key名称
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("searchTest_001 component  is: " + JSON.stringify(objNew.$attrs));
      expect(objNew.$attrs.copyOption).assertEqual("CopyOptions.InApp");
      console.info('searchTest_001 END');
      done();
    });
  })
}