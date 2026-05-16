/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static'

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME = 1000;

export default function DataPanelTest() {
  describe('DataPanelTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('DataPanelTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.picker.datePicker.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info('DataPanelTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DataPanel/DataPanel',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('DataPanelTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'DataPanel') {
          routerInstance.replaceUrl(options);
        }
        await CommonFunc.sleep(SLEEP_TIME);
      } catch (err) {
        console.error('DataPanelTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(SLEEP_TIME);
      console.info('DataPanelTest after each called');
    });

    /**
     * @tc.number DataPanelTest_001
     * @tc.name colorStopColor
     * @tc.desc Test ColorStop color property (color: ResourceColor)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('colorStopColor', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('DataPanelTest execute: colorStopColor START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('colorStopColorCase');
        expect(nodeRaw.length > 0).assertEqual(true);
        
        // 验证ColorStop.color属性
        let dataPanelState = AppStorage.get<string>('DataPanelPageState') ?? '';
        console.info('DataPanelTest dataPanelState: ' + dataPanelState);
        expect(dataPanelState.includes('colorStopColor')).assertEqual(true);

        console.info('DataPanelTest execute: colorStopColor END');
        done();
      } catch (error) {
        console.error('DataPanelTest execute: colorStopColor error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number DataPanelTest_002
     * @tc.name colorStopOffset
     * @tc.desc Test ColorStop offset property (offset: Length)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('colorStopOffset', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('DataPanelTest execute: colorStopOffset START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('colorStopOffsetCase');
        expect(nodeRaw.length > 0).assertEqual(true);
        
        // 验证ColorStop.offset属性
        let dataPanelState = AppStorage.get<string>('DataPanelPageState') ?? '';
        expect(dataPanelState.includes('colorStopOffset')).assertEqual(true);

        console.info('DataPanelTest execute: colorStopOffset END');
        done();
      } catch (error) {
        console.error('DataPanelTest execute: colorStopOffset error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}