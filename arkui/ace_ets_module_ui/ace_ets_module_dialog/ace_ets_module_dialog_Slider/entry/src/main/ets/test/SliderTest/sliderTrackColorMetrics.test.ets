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
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function sliderTrackColorMetricsTest() {
  describe('sliderTrackColorMetrics', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Slider/sliderTrackColorMetrics',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get trackColorMetrics state pages: ' + JSON.stringify(pages));
        if (!('trackColorMetrics' == pages.name)) {
          console.info('get trackColorMetrics state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push trackColorMetrics success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push trackColorMetrics page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('badgeStyle after each called');
    });

    /**
     * @tc.name   TrackColorMetrics_0010
     * @tc.number TrackColorMetrics_0010
     * @tc.desc   test Slider api trackColorMetrics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TrackColorMetrics_0010', Level.LEVEL1, async (done: Function) => {
      let strJson0 = getInspectorByKey('Slider0');
      let defaultColor: string = JSON.parse(strJson0).$attrs.trackColor;
      console.info('[TrackColorMetrics_0010] defaultColor:' + defaultColor);

      let strJson1 = getInspectorByKey('Slider1');
      console.info('[TrackColorMetrics_0010] strJson1:' + JSON.parse(strJson1).$attrs.trackColor);
      expect(JSON.parse(strJson1).$attrs.trackColor)
        .assertEqual('[{"color":"#FFFF0000","offset":"0.000000"},{"color":"#FF0000FF","offset":"1.000000"}]');

      let strJson2 = getInspectorByKey('Slider2');
      console.info('[TrackColorMetrics_0010] strJson2:' + JSON.parse(strJson2).$attrs.trackColor);
      expect(JSON.parse(strJson2).$attrs.trackColor).assertEqual(defaultColor);

      let strJson3 = getInspectorByKey('Slider3');
      console.info('[TrackColorMetrics_0010] strJson3:' + JSON.parse(strJson3).$attrs.trackColor);
      expect(JSON.parse(strJson3).$attrs.trackColor).assertEqual(defaultColor);

      let strJson4 = getInspectorByKey('Slider4');
      console.info('[TrackColorMetrics_0010] strJson4:' + JSON.parse(strJson4).$attrs.trackColor);
      expect(JSON.parse(strJson4).$attrs.trackColor)
        .assertEqual('[{"color":"#FF0000FF","offset":"0.000000"},{"color":"#FFFF0000","offset":"0.700000"},' +
          '{"color":"#FFFFFF00","offset":"0.300000"},{"color":"#FF0000FF","offset":"1.000000"}]');

      let strJson5 = getInspectorByKey('Slider5');
      console.info('[TrackColorMetrics_0010] strJson5:' + JSON.parse(strJson5).$attrs.trackColor);
      expect(JSON.parse(strJson5).$attrs.trackColor)
        .assertEqual('[{"color":"#FFFF0000","offset":"0.000000"},{"color":"#FF0000FF","offset":"1.000000"}]');

      let strJson6 = getInspectorByKey('Slider6');
      console.info('[TrackColorMetrics_0010] strJson6:' + JSON.parse(strJson6).$attrs.trackColor);
      expect(JSON.parse(strJson6).$attrs.trackColor)
        .assertEqual('[{"color":"#FFFF0000","offset":"0.000000"},{"color":"#FF0000FF","offset":"1.000000"}]');

      let strJson7 = getInspectorByKey('Slider7');
      console.info('[TrackColorMetrics_0010] strJson7:' + JSON.parse(strJson7).$attrs.trackColor);
      expect(JSON.parse(strJson7).$attrs.trackColor).assertEqual("#FFFF0000");

      let strJson8 = getInspectorByKey('Slider8');
      console.info('[TrackColorMetrics_0010] strJson8:' + JSON.parse(strJson8).$attrs.trackColor);
      expect(JSON.parse(strJson8).$attrs.trackColor)
        .assertEqual('[{"color":"#FFFF0000","offset":"1.000000"},{"color":"#FFFF0000","offset":"1.000000"}]');
      done();
    });
  })
}