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

'use static';

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { abilityDelegatorRegistry, Driver, ON, MatchPattern } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

const SLEEP_TIME = 1000;

export default function GetStateTest() {
  describe('GetStateTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("GetStateTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.menu.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("GetStateTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/getState',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("GetStateTest state pages: " + JSON.stringify(pages));
        console.info("GetStateTest state pages.name: " + pages.name);
        if (pages.name !== "CustomDialogUser") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("GetStateTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info("GetStateTest after each called");
    });

    /**
     * @tc.number GetStateTest_001
     * @tc.name getStateTest
     * @tc.desc Test CustomDialogController getState method, click button to get state and assert Text component value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getStateTest', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('GetStateTest execute: getStateTest START');
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const openDialogButton = await driver.findComponent(ON.id('btnGetCustomDialogOpen'));
        console.info('GetStateTest: getStateTest - found btnGetCustomDialogOpen button component');
        expect(!!openDialogButton).assertEqual(true);
        await (openDialogButton?.click() as Promise<void>);
        console.info('GetStateTest: getStateTest - clicked btnGetCustomDialogOpen, waiting for dialog to open');
        await Utils.sleep(500);
        await driver.click(100, 100);
        const getStateButton = await driver.findComponent(ON.id('btnGetCustomState'));
        console.info('GetStateTest: getStateTest - found btnGetCustomState button component');
        expect(!!getStateButton).assertEqual(true);
        await (getStateButton?.click() as Promise<void>);
        console.info('GetStateTest: getStateTest - clicked btnGetCustomState, waiting for state update');
        await Utils.sleep(500);
        const customText = await driver.findComponent(ON.id('customText'));
        console.info('GetStateTest: getStateTest - found customText component');
        expect(!!customText).assertEqual(true);
        if(customText){
          let textContent = await customText.getText();
          console.info('GetStateTest: getStateTest - got text content: ' + textContent);
          expect(textContent != null && textContent !== '').assertTrue();
          let stateValue = parseInt(textContent);
          expect(stateValue).assertEqual(5);
          console.info('GetStateTest execute: getStateTest END');
          done();
        } else {
          console.info('GetStateTest execute: getStateTest fail');
          expect().assertFail();
          done();
        }
    });
  });
}
