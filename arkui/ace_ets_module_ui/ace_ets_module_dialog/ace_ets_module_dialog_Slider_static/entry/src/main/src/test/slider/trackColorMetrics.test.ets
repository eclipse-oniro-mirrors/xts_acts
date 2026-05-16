/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeEach, it, expect, Level, beforeAll, beforeEach, Size, afterEach, TestType } from '../../../../hypium/index';
import { Color } from '@ohos.arkui.component'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

export default function trackColorMetricsTest() {
  describe('trackColorMetrics', () => {

    beforeAll(() => {
      console.info("trackColorMetrics beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.slider_static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info('trackColorMetrics beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/slider/trackColorMetrics',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get trackColorMetrics state pages:' + JSON.stringify(pages));
        if (!('trackColorMetrics' == pages.name)) {
          console.info('get trackColorMetrics pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2500);
        }
      } catch (err) {
        console.error('push trackColorMetrics page error:' + err);
      }
      console.info('trackColorMetrics beforeEach end');
    });

    /**
     * @tc.number   trackColorMetrics_static_001
     * @tc.name     trackColorMetrics_static_001
     * @tc.desc     trackColorMetrics_static_001
     * @tc.level    Level.LEVEL0
     */
    it('trackColorMetrics_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.sleep(1000);
      let strJson0 = inspector.getInspectorByKey('Slider0');
      let obj = JSON.parseJsonElement(strJson0);
      let defaultColor :string = obj.getElement('$attrs').getString('trackColor');
      console.info('[TrackColorMetrics_0010] defaultColor:' + defaultColor);

      let strJson1 = inspector.getInspectorByKey('Slider1');
      console.info('[TrackColorMetrics_0010] strJson1:' + JSON.parseJsonElement(strJson1).getElement('$attrs').getString('trackColor'));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('trackColor'))
        .assertEqual('[{"color":"#FFFF0000","offset":"0.000000"},{"color":"#FF0000FF","offset":"1.000000"}]');

      let strJson2 = inspector.getInspectorByKey('Slider2');
      console.info('[TrackColorMetrics_0010] strJson2:' + JSON.parseJsonElement(strJson2).getElement('$attrs').getString('trackColor'));
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('trackColor')).assertEqual(defaultColor);

      let strJson3 = inspector.getInspectorByKey('Slider3');
      console.info('[TrackColorMetrics_0010] strJson3:' + JSON.parseJsonElement(strJson3).getElement('$attrs').getString('trackColor'));
      expect(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('trackColor')).assertEqual(defaultColor);

      let strJson4 = inspector.getInspectorByKey('Slider4');
      console.info('[TrackColorMetrics_0010] strJson4:' + JSON.parseJsonElement(strJson4).getElement('$attrs').getString('trackColor'));
      expect(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('trackColor'))
        .assertEqual('[{"color":"#FF0000FF","offset":"0.000000"},{"color":"#FFFF0000","offset":"0.700000"},' +
          '{"color":"#FFFFFF00","offset":"0.300000"},{"color":"#FF0000FF","offset":"1.000000"}]');

      let strJson5 = inspector.getInspectorByKey('Slider5');
      console.info('[TrackColorMetrics_0010] strJson5:' + JSON.parseJsonElement(strJson5).getElement('$attrs').getString('trackColor'));
      expect(JSON.parseJsonElement(strJson5).getElement('$attrs').getString('trackColor'))
        .assertEqual('[{"color":"#FFFF0000","offset":"0.000000"},{"color":"#FF0000FF","offset":"1.000000"}]');

      let strJson6 = inspector.getInspectorByKey('Slider6');
      console.info('[TrackColorMetrics_0010] strJson6:' + JSON.parseJsonElement(strJson6).getElement('$attrs').getString('trackColor'));
      expect(JSON.parseJsonElement(strJson6).getElement('$attrs').getString('trackColor'))
        .assertEqual('[{"color":"#FFFF0000","offset":"0.000000"},{"color":"#FF0000FF","offset":"1.000000"}]');

      let strJson7 = inspector.getInspectorByKey('Slider7');
      console.info('[TrackColorMetrics_0010] strJson7:' + JSON.parseJsonElement(strJson7).getElement('$attrs').getString('trackColor'));
      expect(JSON.parseJsonElement(strJson7).getElement('$attrs').getString('trackColor')).assertEqual("#FFFF0000");

      let strJson8 = inspector.getInspectorByKey('Slider8');
      console.info('[TrackColorMetrics_0010] strJson8:' + JSON.parseJsonElement(strJson8).getElement('$attrs').getString('trackColor'));
      expect(JSON.parseJsonElement(strJson8).getElement('$attrs').getString('trackColor'))
        .assertEqual('[{"color":"#FFFF0000","offset":"1.000000"},{"color":"#FFFF0000","offset":"1.000000"}]');
      done();
    });
  })
}