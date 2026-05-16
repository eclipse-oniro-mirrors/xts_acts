'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import {  Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import { ColorMetrics, ColorSpace } from '@ohos.arkui.component';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest,startAbility} from '../Util.test';
export default function ColorMetricsColorWithSpaceTest() {
  describe('ColorMetricsColorWithSpaceTest', () => { 
    beforeAll(async (): Promise<void> => {
      console.info("ColorMetricsColorWithSpaceTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.XNode.api12.static", "EntryAbility")
      await UtilsTest.msSleep(1000)
      console.info('ColorMetricsColorWithSpaceTest startAbility completed');
    });
    beforeEach(async () : Promise<void> => {
      console.info("ColorMetricsColorWithSpaceTest beforeEach start");
    }); 

    /**
     * @tc.number   ColorMetricsColorWithSpaceTest_static_0100
     * @tc.name     ColorMetricsColorWithSpaceTest_static_0100
     * @tc.desc     ColorMetricsColorWithSpaceTest_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('ColorMetricsColorWithSpaceTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ColorMetricsColorWithSpaceTest_0100 START');

      let testColor: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.SRGB, 255, 0, 0, 0);
      console.log('ColorMetricsColorWithSpaceTest_static_0100 color: ' + testColor.color);
      console.log('ColorMetricsColorWithSpaceTest_static_0100 alpha: ' + testColor.alpha);
      expect(testColor.color).assertEqual('rgba(255, 0, 0, 0)');
      expect(testColor.alpha).assertEqual(0);

      console.info('[ColorMetricsColorWithSpaceTest_0100 ] END');
      done();
    });

    /**
     * @tc.number   ColorMetricsColorWithSpaceTest_static_0200
     * @tc.name     ColorMetricsColorWithSpaceTest_static_0200
     * @tc.desc     ColorMetricsColorWithSpaceTest_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('ColorMetricsColorWithSpaceTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ColorMetricsColorWithSpaceTest_static_0200 START');

      let testColor: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.SRGB, 255, 0, 0, 1);
      console.log('ColorMetricsColorWithSpaceTest_static_0200 color: ' + testColor.color);
      console.log('ColorMetricsColorWithSpaceTest_static_0200 alpha: ' + testColor.alpha);
      expect(testColor.color).assertEqual('rgba(255, 0, 0, 1)');
      expect(testColor.alpha).assertEqual(255);

      console.info('[ColorMetricsColorWithSpaceTest_static_0200 ] END');
      done();
    });

    /**
     * @tc.number   ColorMetricsColorWithSpaceTest_static_0300
     * @tc.name     ColorMetricsColorWithSpaceTest_static_0300
     * @tc.desc     ColorMetricsColorWithSpaceTest_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('ColorMetricsColorWithSpaceTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ColorMetricsColorWithSpaceTest_static_0300 START');

      let testColor: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.SRGB, 255, 0, 0);
      console.log('ColorMetricsColorWithSpaceTest_static_0300 color: ' + testColor.color);
      console.log('ColorMetricsColorWithSpaceTest_static_0300 alpha: ' + testColor.alpha);
      expect(testColor.color).assertEqual('rgba(255, 0, 0, 1)');
      expect(testColor.alpha).assertEqual(255);

      console.info('[ColorMetricsColorWithSpaceTest_static_0300 ] END');
      done();
    });
  })
}
