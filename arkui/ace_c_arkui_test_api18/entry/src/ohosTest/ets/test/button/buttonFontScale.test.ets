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

import { expect, describe, it, afterEach, Level, Size, TestType } from '@ohos/hypium';
import Utils from '../common/Utils';

const SLEEP_TIME=1000;

export default function buttonFontScaleTest() {

  describe('ButtonFontScaleTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(SLEEP_TIME);
      done();
    })

    /**
     * @tc.name   SUB_ARKUI_CAPI_BUTTON_FONTSCALE_0100
     * @tc.number SUB_ARKUI_CAPI_BUTTON_FONTSCALE_0100
     * @tc.desc   button minFontScale input normal value: 0.5,return value:0.500000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_BUTTON_FONTSCALE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('TestButtonFontScale001 START');
      let PAGE_TAG = 'ButtonFontScale';
      await Utils.pushPage('button/buttonFontScale');
      await Utils.sleep(SLEEP_TIME);
      let btn1 = getInspectorByKey('button_001');
      console.info("buttonMinFontScaleTest_0100 component obj is: " + JSON.stringify(btn1));
      console.info("[buttonMinFontScaleTest_0100] title: " + JSON.stringify(JSON.parse(btn1).$attrs.minFontScale));
      expect(JSON.stringify(JSON.parse(btn1).$attrs.minFontScale)).assertEqual('"0.500000"');
      console.info('buttonMinFontScaleTest_0100 END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_BUTTON_FONTSCALE_0200
     * @tc.number SUB_ARKUI_CAPI_BUTTON_FONTSCALE_0200
     * @tc.desc   button minFontScale input normal value: 0,return value:0.000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_BUTTON_FONTSCALE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('TestButtonFontScale002 START');
      let PAGE_TAG = 'ButtonFontScale';
      await Utils.pushPage('button/buttonFontScale');
      await Utils.sleep(SLEEP_TIME);
      let btn2 = getInspectorByKey('button_002');
      console.info("buttonMinFontScaleTest_0200 component obj is: " + JSON.stringify(btn2));
      console.info("[buttonMinFontScaleTest_0200] title: " + JSON.stringify(JSON.parse(btn2).$attrs.minFontScale));
      expect(JSON.stringify(JSON.parse(btn2).$attrs.minFontScale)).assertEqual('"0.000000"');
      console.info('buttonMinFontScaleTest_0200 END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_BUTTON_FONTSCALE_0300
     * @tc.number SUB_ARKUI_CAPI_BUTTON_FONTSCALE_0300
     * @tc.desc   button minFontScale input normal value: 1,return value:1.000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_BUTTON_FONTSCALE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('TestButtonFontScale003 START');
      let PAGE_TAG = 'ButtonFontScale';
      await Utils.pushPage('button/buttonFontScale');
      await Utils.sleep(SLEEP_TIME);
      let btn3 = getInspectorByKey('button_003');
      console.info("buttonMinFontScaleTest_0300 component obj is: " + JSON.stringify(btn3));
      console.info("[buttonMinFontScaleTest_0300] title: " + JSON.stringify(JSON.parse(btn3).$attrs.minFontScale));
      expect(JSON.stringify(JSON.parse(btn3).$attrs.minFontScale)).assertEqual('"1.000000"');
      console.info('buttonMinFontScaleTest_0300 END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_BUTTON_FONTSCALE_0400
     * @tc.number SUB_ARKUI_CAPI_BUTTON_FONTSCALE_0400
     * @tc.desc   button maxFontScale input normal value: 2,return value:2.000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_BUTTON_FONTSCALE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('TestButtonFontScale004 START');
      let PAGE_TAG = 'ButtonFontScale';
      await Utils.pushPage('button/buttonFontScale');
      await Utils.sleep(SLEEP_TIME);
      let btn4 = getInspectorByKey('button_001');
      console.info("buttonMinFontScaleTest_0400 component obj is: " + JSON.stringify(btn4));
      console.info("[buttonMinFontScaleTest_0400] title: " + JSON.stringify(JSON.parse(btn4).$attrs.maxFontScale));
      expect(JSON.stringify(JSON.parse(btn4).$attrs.maxFontScale)).assertEqual('"2.000000"');
      console.info('buttonMinFontScaleTest_0400 END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_BUTTON_FONTSCALE_0500
     * @tc.number SUB_ARKUI_CAPI_BUTTON_FONTSCALE_0500
     * @tc.desc   button maxFontScale input normal value: 1,return value:1.000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_BUTTON_FONTSCALE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('TestButtonFontScale005 START');
      let PAGE_TAG = 'ButtonFontScale';
      await Utils.pushPage('button/buttonFontScale');
      await Utils.sleep(SLEEP_TIME);
      let btn5 = getInspectorByKey('button_002');
      console.info("buttonMinFontScaleTest_0500 component obj is: " + JSON.stringify(btn5));
      console.info("[buttonMinFontScaleTest_0500] title: " + JSON.stringify(JSON.parse(btn5).$attrs.maxFontScale));
      expect(JSON.stringify(JSON.parse(btn5).$attrs.maxFontScale)).assertEqual('"1.000000"');
      console.info('buttonMinFontScaleTest_0500 END');
      done();
    });
  })
}