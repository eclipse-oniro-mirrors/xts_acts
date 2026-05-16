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
const PAGE_URL = 'MainAbility/pages/Magnifier/MagnifierIndex';
const PAGE_NAME = 'MagnifierIndex';

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

export default function MagnifierTest() {
  describe('MagnifierTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.ets.module.uicontext.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      const options: router.RouterOptions = { url: PAGE_URL };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        const pageState = routerInstance.getState();
        if (pageState.name !== PAGE_NAME) {
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(SLEEP_TIME);
        }
      } catch (err) {
        console.error('MagnifierTest beforeEach error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(SLEEP_TIME);
    });

    /**
     * @tc.number MagnifierTest_001
     * @tc.name magnifierBind
     * @tc.desc Verify Magnifier.bind
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('magnifierBind', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        await clickById(driver, 'bindMagnifier');
        await CommonFunc.sleep(SLEEP_TIME);
        expect(getContentByKey('bindStatus')).assertEqual('bind_ok');
      } catch (error) {
        console.error('magnifierBind error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number MagnifierTest_002
     * @tc.name magnifierShow
     * @tc.desc Verify Magnifier.show
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('magnifierShow', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        await clickById(driver, 'showMagnifier');
        await CommonFunc.sleep(SLEEP_TIME);
        expect(getContentByKey('showStatus')).assertEqual('show_ok');
      } catch (error) {
        console.error('magnifierShow error: ' + error);
        expect().assertFail();
      }
      done();
    });


  });
}
