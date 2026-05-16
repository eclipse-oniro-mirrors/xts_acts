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
const PAGE_URL = 'MainAbility/pages/ScrollResult/ScrollResultIndex';
const PAGE_NAME = 'ScrollResultIndex';

function getContentByKey(key: string): string {
  const inspectorText = inspector.getInspectorByKey(key);
  const inspectorObj = JSON.parseJsonElement(inspectorText);
  return inspectorObj.getElement('$attrs').getString('content');
}

async function clickById(driver: Driver, id: string): Promise<void> {
  const btn = await driver.findComponent(ON.id(id));
  expect(btn !== null).assertTrue();
  if (btn === null) {
    throw new Error('button not found: ' + id);
  }
  await (btn.click() as Promise<void>);
}

export default function ScrollResultTest() {
  describe('ScrollResultTest', () => {
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
     * @tc.number ScrollResultTest_001
     * @tc.name setOffsetRemain
     * @tc.desc Verify ScrollResult.offsetRemain setter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('setOffsetRemain', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        await clickById(driver, 'scrollResultSetOffsetRemainBtn');
        await CommonFunc.sleep(300);
        expect(getContentByKey('scrollResultSetOffsetRemainStatus')).assertEqual('setOffsetRemain_ok');
        expect(getContentByKey('scrollResultOffsetRemainValue')).assertEqual('88');
      } catch (error) {
        console.error('setOffsetRemain error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number ScrollResultTest_002
     * @tc.name getOffsetRemain
     * @tc.desc Verify ScrollResult.offsetRemain getter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('getOffsetRemain', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        await clickById(driver, 'scrollResultGetOffsetRemainBtn');
        await CommonFunc.sleep(300);
        expect(getContentByKey('scrollResultGetOffsetRemainStatus')).assertEqual('getOffsetRemain_ok');
        expect(getContentByKey('scrollResultOffsetRemainValue')).assertEqual('66');
      } catch (error) {
        console.error('getOffsetRemain error: ' + error);
        expect().assertFail();
      }
      done();
    });
  });
}
