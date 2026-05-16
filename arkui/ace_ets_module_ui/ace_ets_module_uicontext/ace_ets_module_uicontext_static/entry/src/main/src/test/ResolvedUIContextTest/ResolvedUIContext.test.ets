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
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';
import CommonFunc from '../../../ets/MainAbility/common/Common';

const SLEEP_TIME = 1000;
const PAGE_URL = 'MainAbility/pages/ResolvedUIContext/ResolvedUIContextIndex';
const PAGE_NAME = 'ResolvedUIContextIndex';

function getContentByKey(key: string): string {
  const inspectorText = inspector.getInspectorByKey(key);
  const inspectorObj = JSON.parseJsonElement(inspectorText);
  return inspectorObj.getElement('$attrs').getString('content');
}

export default function ResolvedUIContextTest() {
  describe('ResolvedUIContextTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.ets.module.uicontext.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      const options: router.RouterOptions = { url: PAGE_URL };
      const routerInstance = AppStorage.get<Router>('router') as Router;
      routerInstance.clear();
      const pageState = routerInstance.getState();
      if (pageState.name !== PAGE_NAME) {
        routerInstance.replaceUrl(options);
        await CommonFunc.sleep(SLEEP_TIME);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(SLEEP_TIME);
    });

    /**
     * @tc.number ResolvedUIContextTest_001
     * @tc.name strategy
     * @tc.desc Verify ResolvedUIContext.strategy value range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('strategy', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        const btn = await driver.findComponent(ON.id('resolvedStrategyBtn'));
        expect(btn !== null).assertTrue();
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        const value = Number(getContentByKey('resolvedStrategyStatus'));
        expect(Number.isNaN(value)).assertEqual(false);
        expect(value >= 0 && value <= 5).assertTrue();
      } catch (error) {
        console.error('resolvedUIContext strategy error: ' + error);
        expect().assertFail();
      }
      done();
    });
  });
}
