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
import { Driver, ON, MatchPattern, Component } from '@kit.TestKit';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';
import CommonFunc from '../../../ets/MainAbility/common/Common';

const SLEEP_TIME = 1000;
const PAGE_URL = 'MainAbility/pages/OverlayManager/OverlayManagerIndex';
const PAGE_NAME = 'OverlayManagerIndex';

async function clickById(driver: Driver, id: string): Promise<void> {
  const button = await driver.findComponent(ON.id(id));
  expect(button !== null).assertTrue();
  if (button === null) {
    throw new Error('button is null: ' + id);
  }
  await (button.click() as Promise<void>);
}

async function findByText(driver: Driver, text: string): Promise<Component | null> {
  return await driver.findComponent(ON.text(text, MatchPattern.EQUALS));
}

function getContentByKey(key: string): string {
  const inspectorText = inspector.getInspectorByKey(key);
  const inspectorObj = JSON.parseJsonElement(inspectorText);
  return inspectorObj.getElement('$attrs').getString('content');
}

export default function OverlayManagerTest() {
  describe('OverlayManagerTest', () => {
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
        console.error('OverlayManagerTest beforeEach error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(SLEEP_TIME);
    });

    /**
     * @tc.number OverlayManagerTest_001
     * @tc.name addComponentContent
     * @tc.desc Verify addComponentContent shows overlay content
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('addComponentContent', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        await clickById(driver, 'addContent');
        await CommonFunc.sleep(SLEEP_TIME);
        expect(getContentByKey('addStatus')).assertEqual('add_ok');
        const overlayText = await findByText(driver, 'overlay_content_a');
        expect(overlayText !== null).assertTrue();
      } catch (error) {
        console.error('addComponentContent error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number OverlayManagerTest_002
     * @tc.name addComponentContentWithOrder
     * @tc.desc Verify addComponentContentWithOrder shows overlay content
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('addComponentContentWithOrder', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        await clickById(driver, 'addContentWithOrder');
        await CommonFunc.sleep(SLEEP_TIME);
        expect(getContentByKey('addOrderStatus')).assertEqual('add_order_ok');
        const overlayText = await findByText(driver, 'overlay_content_b');
        expect(overlayText !== null).assertTrue();
      } catch (error) {
        console.error('addComponentContentWithOrder error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number OverlayManagerTest_003
     * @tc.name hideComponentContent
     * @tc.desc Verify hideComponentContent hides overlay content
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('hideComponentContent', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        await clickById(driver, 'addContent');
        await CommonFunc.sleep(300);
        await clickById(driver, 'hideContent');
        await CommonFunc.sleep(SLEEP_TIME);
        expect(getContentByKey('hideStatus')).assertEqual('hide_ok');
        const overlayText = await findByText(driver, 'overlay_content_a');
        expect(overlayText === null).assertTrue();
      } catch (error) {
        console.error('hideComponentContent error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number OverlayManagerTest_004
     * @tc.name showAllComponentContents
     * @tc.desc Verify showAllComponentContents shows hidden content
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('showAllComponentContents', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        await clickById(driver, 'addContent');
        await CommonFunc.sleep(300);
        await clickById(driver, 'hideContent');
        await CommonFunc.sleep(300);
        await clickById(driver, 'showAllContents');
        await CommonFunc.sleep(SLEEP_TIME);
        expect(getContentByKey('showAllStatus')).assertEqual('show_all_ok');
        const overlayText = await findByText(driver, 'overlay_content_a');
        expect(overlayText !== null).assertTrue();
      } catch (error) {
        console.error('showAllComponentContents error: ' + error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number OverlayManagerTest_005
     * @tc.name removeComponentContent
     * @tc.desc Verify removeComponentContent removes overlay content
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('removeComponentContent', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        await clickById(driver, 'addContentWithOrder');
        await CommonFunc.sleep(300);
        await clickById(driver, 'removeContent');
        await CommonFunc.sleep(SLEEP_TIME);
        expect(getContentByKey('removeStatus')).assertEqual('remove_ok');
        const overlayText = await findByText(driver, 'overlay_content_b');
        expect(overlayText === null).assertTrue();
      } catch (error) {
        console.error('removeComponentContent error: ' + error);
        expect().assertFail();
      }
      done();
    });
  });
}
