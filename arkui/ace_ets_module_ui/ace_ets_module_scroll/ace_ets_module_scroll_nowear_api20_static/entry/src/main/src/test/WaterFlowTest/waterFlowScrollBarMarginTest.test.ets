'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import events_emitter from '@ohos.events.emitter';
import { Color,$r } from '@ohos.arkui.component'
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../common/Common';
import { startAbility, UtilsTest } from '../Util.test.ets';

import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function WaterFlowScrollBarMarginTest() {
  describe('WaterFlowScrollBarMarginTest', () => {
    const SLEEP_TIME_1000 = 1000;
    beforeAll(async (): Promise<void> => {
      console.info('WaterFlowScrollBarMarginTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.scroll.nowear.api20.static', 'EntryAbility')
    });
    beforeEach(async (): Promise<void> => {
      console.info('WaterFlowScrollBarMarginTest beforeEach start');
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get WaterFlowScrollBarMarginTest state pages:' + JSON.stringify(pages));
        if (!('waterFlowScrollBarMargin' == pages.name)) {
          console.info('get  WaterFlowScrollBarMarginTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.replaceUrl({
            url: 'MainAbility/pages/WaterFlow/waterFlowScrollBarMargin',
          })
        }
      } catch (err) {
        console.error('push WaterFlowScrollBarMarginTest page error:' + err);
      }
      console.info('WaterFlowScrollBarMarginTest foreEach end');
    });

    /**
     * @tc.number   WaterFlowScrollBarMargin_static_0100
     * @tc.name     WaterFlowScrollBarMargin_static_0100
     * @tc.desc     WaterFlowScrollBarMargin_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('WaterFlowScrollBarMargin_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'WaterFlowScrollBarMargin_static_0100';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(SLEEP_TIME_1000);
      let strJson = inspector.getInspectorByKey('waterFlowScrollBarMargin_001');
      let obj = JSON.parseJsonElement(strJson);
      let waterFlowScrollBarMarginStr = obj.getElement('$attrs').getString('scrollBarMargin');
      console.info('[ScrollBarMargin_static_0100] waterFlowScrollBarMargin obj is: ' + waterFlowScrollBarMarginStr);
      expect(waterFlowScrollBarMarginStr).assertEqual('ScrollBarMargin start: 45.00vp, end: 70.00vp');
      console.info('[' + tagName + '] END============================');
      await CommonFunc.sleep(SLEEP_TIME_1000);
      done();
    });

    /**
     * @tc.number   WaterFlowScrollBarMargin_static_0200
     * @tc.name     WaterFlowScrollBarMargin_static_0200
     * @tc.desc     WaterFlowScrollBarMargin_static_0200
     * @tc.level    Level.LEVEL2
     */
    it('WaterFlowScrollBarMargin_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'WaterFlowScrollBarMargin_static_0200';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(SLEEP_TIME_1000);
      let strJson = inspector.getInspectorByKey('waterFlowScrollBarMargin_002');
      let obj = JSON.parseJsonElement(strJson);
      let waterFlowScrollBarMarginStr = obj.getElement('$attrs').getString('scrollBarMargin');
      console.info('[WaterFlowScrollBarMargin_static_0200] scrollBarMargin obj is: ' + waterFlowScrollBarMarginStr);
      expect(waterFlowScrollBarMarginStr).assertEqual('ScrollBarMargin start: 0.00px, end: 0.00px');
      console.info('[' + tagName + '] END============================');
      await CommonFunc.sleep(SLEEP_TIME_1000);
      done();
    });

    /**
     * @tc.number   WaterFlowScrollBarMargin_static_0300
     * @tc.name     WaterFlowScrollBarMargin_static_0300
     * @tc.desc     WaterFlowScrollBarMargin_static_0300
     * @tc.level    Level.LEVEL2
     */
    it('WaterFlowScrollBarMargin_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'WaterFlowScrollBarMargin_static_0300';
      console.info('[' + tagName + '] START============================');
      let strJson = inspector.getInspectorByKey('waterFlowScrollBarMargin_003');
      let obj = JSON.parseJsonElement(strJson);
      let waterFlowScrollBarMarginStr = obj.getElement('$attrs').getString('scrollBarMargin');
      console.info('[WaterFlowScrollBarMargin_static_0300] scrollBarMargin obj is: ' + waterFlowScrollBarMarginStr);
      expect(waterFlowScrollBarMarginStr).assertEqual('ScrollBarMargin start: 0.00px, end: 0.00px');
      console.info('[' + tagName + '] END============================');
      await CommonFunc.sleep(SLEEP_TIME_1000);
      done();
    });

  })
}
