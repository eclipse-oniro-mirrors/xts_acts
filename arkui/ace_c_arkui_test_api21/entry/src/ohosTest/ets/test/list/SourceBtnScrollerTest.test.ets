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

import { beforeAll, describe, expect, it, Level, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON, PointerMatrix, Rect, Component } from '@ohos.UiTest';

export default function SourceBtnScrollerTest() {

  describe('SourceBtnScrollerTest', () => {

    /**
     * @tc.name   SourceBtnScrollerTest_0100
     * @tc.number SourceBtnScrollerTest_0100
     * @tc.desc   Test capi source: ARKUI_SCROLL_SOURCE_SCROLLER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SourceBtnScrollerTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[SourceBtnScrollerTest_0100] START');
      await Utils.pushPage(`list/SourceScrollerTest`);
      await Utils.sleep(1500)
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('scroller_btn_1'));
      await button.click();
      await Utils.sleep(1500);
      let strJson = getInspectorByKey('list_source_scroller'); //ARKUI_SCROLL_SOURCE_SCROLLER
      console.info("[SourceBtnScrollerTest_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[SourceBtnScrollerTest_0100] backgroundColor: " + JSON.stringify(JSON.parse(strJson).$attrs.backgroundColor));
      expect(JSON.parse(strJson).$attrs.backgroundColor).assertEqual("#FF00FF00");
      console.info('[SourceBtnScrollerTest_0100] END');
      done();
    })

    /**
     * @tc.name   SourceBtnScrollerTest_0200
     * @tc.number SourceBtnScrollerTest_0200
     * @tc.desc   Test capi source: ARKUI_SCROLL_SOURCE_ANIMATION.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SourceBtnScrollerTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[SourceBtnScrollerTest_0200] START');
      await Utils.pushPage(`list/SourceAnimationTest`);
      await Utils.sleep(1500)
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('scroller_btn_2'));
      await button.click();
      await Utils.sleep(1500);
      let strJson = getInspectorByKey('list_source_scroller'); //ARKUI_SCROLL_SOURCE_ANIMATION
      console.info("[SourceBtnScrollerTest_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[SourceBtnScrollerTest_0100] backgroundColor: " + JSON.stringify(JSON.parse(strJson).$attrs.backgroundColor));
      expect(JSON.parse(strJson).$attrs.backgroundColor).assertEqual("#FF00FF00");
      console.info('[SourceBtnScrollerTest_0200] END');
      done();
    })

  })
}