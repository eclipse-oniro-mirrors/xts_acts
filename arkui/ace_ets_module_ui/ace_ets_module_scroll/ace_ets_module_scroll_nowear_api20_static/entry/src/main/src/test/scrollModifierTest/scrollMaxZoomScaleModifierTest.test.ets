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

import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { startAbility, UtilsTest } from '../Util.test.ets';
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function ScrollMaxZoomScaleModifierTest() {
  describe('ScrollMaxZoomScaleModifierTest', () => {
    const SLEEP_TIME_1000 = 1000;
    beforeAll(async (): Promise<void> => {
      console.info('ScrollMaxZoomScaleModifierTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.scroll.nowear.api20.static', 'EntryAbility')
    });
    beforeEach(async (): Promise<void> => {
      console.info('ScrollMaxZoomScaleModifierTest beforeEach start');
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get ScrollMaxZoomScaleModifierTest state pages:' + JSON.stringify(pages));
        if (!('scrollMaxZoomScaleModifier' == pages.name)) {
          console.info('get  ScrollMaxZoomScaleModifierTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.replaceUrl({
            url: 'MainAbility/pages/scrollModifier/scrollMaxZoomScaleModifier',
          })
        }
      } catch (err) {
        console.error('push ScrollMaxZoomScaleModifierTest page error:' + err);
      }
      console.info('ScrollMaxZoomScaleModifierTest foreEach end');
    });

    /**
     * @tc.number   ScrollMaxZoomScaleModifier_static_0100
     * @tc.name     ScrollMaxZoomScaleModifier_static_0100
     * @tc.desc     ScrollMaxZoomScaleModifier_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('ScrollMaxZoomScaleModifier_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'ScrollMaxZoomScaleModifier_static_0100';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(SLEEP_TIME_1000);
      let strJson = inspector.getInspectorByKey('maxZoomScaleModifier_001');
      let obj = JSON.parseJsonElement(strJson);
      let maxZoomScaleStr = obj.getElement('$attrs').getDouble('maxZoomScale');
      console.info('[ScrollMaxZoomScaleModifier_static_0100] maxZoomScale obj is: ' + maxZoomScaleStr);
      expect(maxZoomScaleStr).assertEqual(5);
      console.info('[' + tagName + '] END============================');
      await CommonFunc.sleep(SLEEP_TIME_1000);
      done();
    });

    /**
     * @tc.number   ScrollMaxZoomScaleModifier_static_0200
     * @tc.name     ScrollMaxZoomScaleModifier_static_0200
     * @tc.desc     ScrollMaxZoomScaleModifier_static_0200
     * @tc.level    Level.LEVEL2
     */
    it('ScrollMaxZoomScaleModifier_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'ScrollMaxZoomScaleModifier_static_0200';
      console.info('[' + tagName + '] START============================');
      await CommonFunc.sleep(SLEEP_TIME_1000);
      let strJson = inspector.getInspectorByKey('maxZoomScaleModifier_002');
      let obj = JSON.parseJsonElement(strJson);
      let maxZoomScaleStr = obj.getElement('$attrs').getDouble('maxZoomScale');
      console.info('[ScrollMaxZoomScaleModifier_static_0200] maxZoomScale obj is: ' + maxZoomScaleStr);
      expect(maxZoomScaleStr).assertEqual(1);
      console.info('[' + tagName + '] END============================');
      await CommonFunc.sleep(SLEEP_TIME_1000);
      done();
    });

    /**
     * @tc.number   ScrollMaxZoomScaleModifier_static_0300
     * @tc.name     ScrollMaxZoomScaleModifier_static_0300
     * @tc.desc     ScrollMaxZoomScaleModifier_static_0300
     * @tc.level    Level.LEVEL2
     */
    it('ScrollMaxZoomScaleModifier_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'ScrollMaxZoomScaleModifier_static_0300';
      console.info('[' + tagName + '] START============================');
      let strJson = inspector.getInspectorByKey('maxZoomScaleModifier_003');
      let obj = JSON.parseJsonElement(strJson);
      let maxZoomScaleStr = obj.getElement('$attrs').getDouble('maxZoomScale');
      console.info('[ScrollMaxZoomScaleModifier_static_0300] maxZoomScale obj is: ' + maxZoomScaleStr);
      expect(maxZoomScaleStr).assertEqual(1);
      console.info('[' + tagName + '] END============================');
      await CommonFunc.sleep(SLEEP_TIME_1000);
      done();
    });

    /**
     * @tc.number   ScrollMaxZoomScaleModifier_static_0400
     * @tc.name     ScrollMaxZoomScaleModifier_static_0400
     * @tc.desc     ScrollMaxZoomScaleModifier_static_0400
     * @tc.level    Level.LEVEL2
     */
    it('ScrollMaxZoomScaleModifier_static_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'ScrollMaxZoomScaleModifier_static_0400';
      console.info('[' + tagName + '] START============================');
      let strJson = inspector.getInspectorByKey('maxZoomScaleModifier_004');
      let obj = JSON.parseJsonElement(strJson);
      let maxZoomScaleStr = obj.getElement('$attrs').getDouble('maxZoomScale');
      console.info('[ScrollMaxZoomScaleModifier_static_0400] maxZoomScale obj is: ' + maxZoomScaleStr);
      expect(maxZoomScaleStr).assertEqual(1);
      console.info('[' + tagName + '] END============================');
      await CommonFunc.sleep(SLEEP_TIME_1000);
      done();
    });

    /**
     * @tc.number   ScrollMaxZoomScaleModifier_static_0500
     * @tc.name     ScrollMaxZoomScaleModifier_static_0500
     * @tc.desc     ScrollMaxZoomScaleModifier_static_0500
     * @tc.level    Level.LEVEL2
     */
    it('ScrollMaxZoomScaleModifier_static_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'ScrollMaxZoomScaleModifier_static_0500';
      console.info('[' + tagName + '] START============================');
      let strJson = inspector.getInspectorByKey('maxZoomScaleModifier_005');
      let obj = JSON.parseJsonElement(strJson);
      let maxZoomScaleStr = obj.getElement('$attrs').getDouble('maxZoomScale');
      console.info('[ScrollMaxZoomScaleModifier_static_0500] maxZoomScale obj is: ' + maxZoomScaleStr);
      expect(maxZoomScaleStr).assertEqual(1);
      console.info('[' + tagName + '] END============================');
      await CommonFunc.sleep(SLEEP_TIME_1000);
      done();
    });

  })
}
