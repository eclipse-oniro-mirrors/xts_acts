'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
 * kdslahfahnja fsd skdfsf fsdsdffs
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'

export default function WaterFlowScrollEdgeCallbackJsunit() {
  describe('WaterFlowScrollEdgeCallbackJsunit', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll.nowear.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info('text beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WaterFlow/WaterFlowScrollEdgeCallback',
      }
      try {
       const routerScroll = AppStorage.get<Router>("router") as Router
        routerScroll.clear();
        let pages = routerScroll.getState();
        console.info('get WaterFlowScrollEdgeCallback state pages:' + JSON.stringify(pages));
        if (!('WaterFlowScrollEdgeCallback' == pages.name)) {
          console.info('get WaterFlowScrollEdgeCallback state pages.name:' + JSON.stringify(pages.name));
          routerScroll.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push WaterFlowScrollEdgeCallback page error:' + JSON.stringify(err));
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('WaterFlowScrollEdgeCallback after each called');
    });

    
    
/**
     * @tc.number   WaterFlowScrollEdgeCallbackTest_static_0100
     * @tc.name     WaterFlowScrollEdgeCallbackTest_static_0100
     * @tc.desc     WaterFlowScrollEdgeCallbackTest_static_0100
     * @tc.level    Level.LEVEL1
     */
it('WaterFlowScrollEdgeCallbackTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('WaterFlowScrollEdgeCallbackTest_static_0100 START');
      let driver1 = Driver.create();
      let button = await driver1.findComponent(ON.id('WaterFlowScrollEdgeCallback01'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('WaterFlowTextByScrollEdge01')
      console.info('[WaterFlow_ReachStartAndEnd_static_0100] component obj1 is: ' + JSON.stringify(JSON.parseJsonElement(strJson1)))
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('ScrollEdgeSuccess');
      await CommonFunc.sleep(1000);
      console.info('WaterFlowScrollEdgeCallbackTest_static_0100 END');
      done();
    });
  })
}