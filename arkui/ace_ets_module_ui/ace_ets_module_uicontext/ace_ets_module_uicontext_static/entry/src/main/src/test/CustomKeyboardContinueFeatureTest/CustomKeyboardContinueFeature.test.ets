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
const PAGE_URL = 'MainAbility/pages/CustomKeyboardContinueFeature/CustomKeyboardContinueFeatureIndex';
const PAGE_NAME = 'CustomKeyboardContinueFeatureIndex';

async function clickById(driver: Driver, id: string): Promise<void> {
  const button = await driver.findComponent(ON.id(id));
  expect(button !== null).assertTrue();
  if (button === null) {
    throw new Error('button is null: ' + id);
  }
  await (button.click() as Promise<void>);
}

function getContentByKey(key: string): string {
  const inspectorText = inspector.getInspectorByKey(key);
  const inspectorObj = JSON.parseJsonElement(inspectorText);
  return inspectorObj.getElement('$attrs').getString('content');
}

export default function CustomKeyboardContinueFeatureTest() {
  describe('CustomKeyboardContinueFeatureTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.ets.module.uicontext.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      const options: router.RouterOptions = { url: PAGE_URL };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        routerInstance.replaceUrl(options);
        await CommonFunc.sleep(SLEEP_TIME);
        const state = routerInstance.getState();
        if (state.name !== PAGE_NAME) {
          throw new Error('not in page ' + PAGE_NAME + ', current=' + state.name);
        }
      } catch (error) {
        console.error('CustomKeyboardContinueFeatureTest beforeEach error: ' + error);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(SLEEP_TIME);
    });

    /**
     * @tc.number CustomKeyboardContinueFeatureTest_001
     * @tc.name enabled
     * @tc.desc Verify CustomKeyboardContinueFeature.ENABLED enum value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('enabled', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        expect(getContentByKey('customKeyboardEnabledValue')).assertEqual('0');
      } catch (error) {
        console.error('enabled error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number CustomKeyboardContinueFeatureTest_002
     * @tc.name disabled
     * @tc.desc Verify CustomKeyboardContinueFeature.DISABLED enum value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('disabled', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        expect(getContentByKey('customKeyboardDisabledValue')).assertEqual('1');
      } catch (error) {
        console.error('disabled error: ' + error);
        expect().assertFail();
      }
      done();
    });

  });
}
