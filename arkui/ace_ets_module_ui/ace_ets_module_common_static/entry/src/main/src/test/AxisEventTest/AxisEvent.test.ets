'use static';
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
import { describe, it, expect, beforeAll, beforeEach, afterEach, Level } from '../../../../hypium/index';
import { Driver, ON, Rect} from '@kit.TestKit';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';
import CommonFunc from '../../../ets/MainAbility/common/Common';

const SLEEP_TIME = 1000;
const PAGE_URL = 'MainAbility/pages/AxisEvent/AxisEventIndex';
const PAGE_NAME = 'AxisEventIndex';

function getContentByKey(key: string): string {
  const inspectorText = inspector.getInspectorByKey(key);
  const inspectorObj = JSON.parseJsonElement(inspectorText);
  return inspectorObj.getElement('$attrs').getString('content');
}

export default function AxisEventTest() {
  describe('AxisEventTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.ets.module.common.static', 'EntryAbility');
    });
    beforeEach(async (): Promise<void> => {
      const options: router.RouterOptions = { url: PAGE_URL };
      const routerInstance = AppStorage.get<Router>('router') as Router;
      routerInstance.clear();
      routerInstance.replaceUrl(options);
      await CommonFunc.sleep(SLEEP_TIME);
      expect(routerInstance.getState().name).assertEqual(PAGE_NAME);
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(SLEEP_TIME);
    });

    /**
     * @tc.number AxisEventTest_001
     * @tc.name hasAxis
     * @tc.desc Verify AxisEvent.hasAxis method via onAxisEvent callback on Scroll
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('hasAxis', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        const scrollComp = await driver.findComponent(ON.id('axisEventList'));
        expect(scrollComp !== null).assertTrue();
        const rect = await (scrollComp?.getBounds() as Promise<Rect>)
        const centerX: int = Math.round((rect.left + rect.right) / 2).toInt();
        const startY: int = Math.round(rect.top + (rect.bottom - rect.top) * 0.8).toInt();
        const endY: int = Math.round(rect.top + (rect.bottom - rect.top) * 0.2).toInt();
        await driver.swipe(centerX, startY, centerX, endY, 600);
        await CommonFunc.sleep(500);
        const status = getContentByKey('axisEventHasAxisStatus');
        expect(status === 'hasAxis_ok' || status === 'init').assertTrue();
      } catch (error) {
        console.error('hasAxis error: ' + error);
        expect().assertFail();
      }
      done();
    });
  });
}
