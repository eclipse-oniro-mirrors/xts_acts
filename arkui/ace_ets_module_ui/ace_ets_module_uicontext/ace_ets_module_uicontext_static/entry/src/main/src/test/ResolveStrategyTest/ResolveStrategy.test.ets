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
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';
import CommonFunc from '../../../ets/MainAbility/common/Common';

const SLEEP_TIME = 1000;
const PAGE_URL = 'MainAbility/pages/ResolveStrategy/ResolveStrategyIndex';
const PAGE_NAME = 'ResolveStrategyIndex';

function getContentByKey(key: string): string {
  const inspectorText = inspector.getInspectorByKey(key);
  const inspectorObj = JSON.parseJsonElement(inspectorText);
  return inspectorObj.getElement('$attrs').getString('content');
}

export default function ResolveStrategyTest() {
  describe('ResolveStrategyTest', () => {
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
     * @tc.number ResolveStrategyTest_001
     * @tc.name callingScope
     * @tc.desc Verify ResolveStrategy.CALLING_SCOPE enum value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('callingScope', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(getContentByKey('resolveStrategyCallingScope')).assertEqual('0');
      done();
    });

    /**
     * @tc.number ResolveStrategyTest_002
     * @tc.name lastFocus
     * @tc.desc Verify ResolveStrategy.LAST_FOCUS enum value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('lastFocus', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(getContentByKey('resolveStrategyLastFocus')).assertEqual('1');
      done();
    });

    /**
     * @tc.number ResolveStrategyTest_003
     * @tc.name maxInstanceId
     * @tc.desc Verify ResolveStrategy.MAX_INSTANCE_ID enum value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('maxInstanceId', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(getContentByKey('resolveStrategyMaxInstanceId')).assertEqual('2');
      done();
    });

    /**
     * @tc.number ResolveStrategyTest_004
     * @tc.name unique
     * @tc.desc Verify ResolveStrategy.UNIQUE enum value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('unique', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(getContentByKey('resolveStrategyUnique')).assertEqual('3');
      done();
    });

    /**
     * @tc.number ResolveStrategyTest_005
     * @tc.name lastForeground
     * @tc.desc Verify ResolveStrategy.LAST_FOREGROUND enum value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('lastForeground', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(getContentByKey('resolveStrategyLastForeground')).assertEqual('4');
      done();
    });

    /**
     * @tc.number ResolveStrategyTest_006
     * @tc.name undefinedValue
     * @tc.desc Verify ResolveStrategy.UNDEFINED enum value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('undefinedValue', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(getContentByKey('resolveStrategyUndefined')).assertEqual('5');
      done();
    });
  });
}
