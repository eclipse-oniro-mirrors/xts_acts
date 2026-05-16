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
const PAGE_URL = 'MainAbility/pages/TextContentControllerBase/TextContentControllerBaseIndex';
const PAGE_NAME = 'TextContentControllerBaseIndex';

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

export default function TextContentControllerBaseTest() {
  describe('TextContentControllerBaseTest', () => {
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
     * @tc.number TextContentControllerBaseTest_001
     * @tc.name setStyledPlaceholder
     * @tc.desc Verify TextContentControllerBase.setStyledPlaceholder method
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('setStyledPlaceholder', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        await clickById(driver, 'textContentSetStyledPlaceholderBtn');
        await CommonFunc.sleep(300);
        expect(getContentByKey('textContentSetStyledPlaceholderStatus')).assertEqual('setStyledPlaceholder_ok');
      } catch (error) {
        console.error('setStyledPlaceholder error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number TextContentControllerBaseTest_002
     * @tc.name deleteBackward
     * @tc.desc Verify TextContentControllerBase.deleteBackward method
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('deleteBackward', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        await clickById(driver, 'textContentDeleteBackwardBtn');
        await CommonFunc.sleep(300);
        expect(getContentByKey('textContentDeleteBackwardStatus')).assertEqual('deleteBackward_ok');
      } catch (error) {
        console.error('deleteBackward error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number TextContentControllerBaseTest_003
     * @tc.name scrollToVisible
     * @tc.desc Verify TextContentControllerBase.scrollToVisible method
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('scrollToVisible', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        await clickById(driver, 'textContentScrollToVisibleBtn');
        await CommonFunc.sleep(300);
        expect(getContentByKey('textContentScrollToVisibleStatus')).assertEqual('scrollToVisible_ok');
      } catch (error) {
        console.error('scrollToVisible error: ' + error);
        expect().assertFail();
      }
      done();
    });
  });
}
