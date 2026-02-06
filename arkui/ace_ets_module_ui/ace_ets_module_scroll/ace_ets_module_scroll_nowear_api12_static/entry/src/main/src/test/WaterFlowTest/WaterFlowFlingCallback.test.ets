'use static';
/**
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
import { describe, beforeEach, afterEach, it, expect, beforeAll, Level } from '../../../../hypium/index';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import { Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function WaterFlowFlingCallbackJsunit() {
  describe('WaterFlowFlingCallbackTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll.nowear.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info('text beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WaterFlow/WaterFlowFlingCallback',
      }
      try {
       const routerScroll = AppStorage.get<Router>("router") as Router
        routerScroll.clear();
        let pages = routerScroll.getState();
        console.info('get WaterFlowFlingCallback state pages:' + JSON.stringify(pages));
        if (!('WaterFlowFlingCallback' == pages.name)) {
          console.info('get WaterFlowFlingCallback state pages.name:' + JSON.stringify(pages.name));
          routerScroll.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push WaterFlowFlingCallback page error:' + JSON.stringify(err));
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('WaterFlowFlingCallback after each called');
    });

    
    
/**
     * @tc.number   WaterFlowFlingCallbackTest_static_0100
     * @tc.name     WaterFlowFlingCallbackTest_static_0100
     * @tc.desc     WaterFlowFlingCallbackTest_static_0100
     * @tc.level    Level.LEVEL1
     */
it('WaterFlowFlingCallbackTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('WaterFlowFlingCallbackTest_static_0100 START');
      let driver1 = Driver.create();
      let button = await driver1.findComponent(ON.id('btn_waterflow_fling_01'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text = inspector.getInspectorByKey('key_waterflow_fling_text1');
      let obj = JSON.parseJsonElement(text);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('1000');
      console.info('WaterFlowFlingCallbackTest_static_0100 END');
      done();
    });

    
    
/**
     * @tc.number   WaterFlowFlingCallbackTest_static_0200
     * @tc.name     WaterFlowFlingCallbackTest_static_0200
     * @tc.desc     WaterFlowFlingCallbackTest_static_0200
     * @tc.level    Level.LEVEL1
     */
it('WaterFlowFlingCallbackTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('WaterFlowFlingCallbackTest_static_0200 START');
      let driver1 = Driver.create();
      let button = await driver1.findComponent(ON.id('btn_waterflow_fling_02'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text = inspector.getInspectorByKey('key_waterflow_fling_text2');
      let obj = JSON.parseJsonElement(text);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('-1000');
      console.info('WaterFlowFlingCallbackTest_static_0200 END');
      done();
    });
  })
}