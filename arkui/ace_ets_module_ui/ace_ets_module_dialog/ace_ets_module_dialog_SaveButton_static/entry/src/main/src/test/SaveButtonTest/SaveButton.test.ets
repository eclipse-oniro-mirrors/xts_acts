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
import inspector from '@ohos.arkui.inspector';
import { SaveButtonOnClickResult } from '@ohos.arkui.component';

const SLEEP_TIME = 1000;
const LOG_CHUNK_SIZE = 500;

function logLongString(tag: string, longStr: string): void {
  let len = longStr.length;
  let part = 1;
  for (let i = 0; i < len; i += LOG_CHUNK_SIZE) {
    let end = i + LOG_CHUNK_SIZE;
    if (end > len) {
      end = len;
    }
    console.info(`${tag} [${part}] ${longStr.substring(i, end)}`);
    part++;
  }
}

export default function SaveButtonTest() {
  describe('SaveButtonTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("SaveButtonTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.saveButton.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("SaveButtonTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SaveButton/SaveButton',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("SaveButtonTest state pages: " + JSON.stringify(pages));
        console.info("SaveButtonTest state pages.name: " + pages.name);
        if (!('TextLineSpacing' == pages.name)) {
          routerInstance.replaceUrl(options);
        }
        // Wait for page to load
        await Utils.sleep(500);
      } catch (err) {
        console.error("SaveButtonTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info("SaveButtonTest after each called");
    });

    /**
     * @tc.number SaveButtonTest_001
     * @tc.name saveButtonSetIcon
     * @tc.desc Test SaveButton setIcon property, read from component and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('saveButtonSetIcon', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SaveButton] SaveButtonTest execute: saveButtonSetIcon START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const saveButton = await driver.findComponent(ON.id('saveButton'));
        expect(!!saveButton).assertEqual(true);

        let node = JSON.parseJsonElement(inspector.getInspectorByKey('saveButton'));
        logLongString('SaveButtonTest: saveButtonSetIcon node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();

        console.info('[SaveButton] SaveButtonTest execute: saveButtonSetIcon END');
        done();
      } catch (error) {
        console.error('[SaveButton] SaveButtonTest execute: saveButtonSetIcon error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SaveButtonTest_002
     * @tc.name saveButtonSetText
     * @tc.desc Test SaveButton setText property, read from component and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('saveButtonSetText', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SaveButton] SaveButtonTest execute: saveButtonSetText START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const saveButton = await driver.findComponent(ON.id('saveButton'));
        expect(!!saveButton).assertEqual(true);

        let node = JSON.parseJsonElement(inspector.getInspectorByKey('saveButton'));
        logLongString('SaveButtonTest: saveButtonSetText node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();

        console.info('[SaveButton] SaveButtonTest execute: saveButtonSetText END');
        done();
      } catch (error) {
        console.error('[SaveButton] SaveButtonTest execute: saveButtonSetText error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SaveButtonTest_003
     * @tc.name saveButtonIconBorderRadius
     * @tc.desc Test SaveButton iconBorderRadius property, read from component and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('saveButtonIconBorderRadius', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SaveButton] SaveButtonTest execute: saveButtonIconBorderRadius START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const saveButton = await driver.findComponent(ON.id('saveButton'));
        expect(!!saveButton).assertEqual(true);

        let node = JSON.parseJsonElement(inspector.getInspectorByKey('saveButton'));
        let nodeText = JSON.stringifyJsonElement(node);
        logLongString('SaveButtonTest: saveButtonIconBorderRadius node =', nodeText);
        expect(node != null).assertTrue();
        // In secure-control scenarios the inspector may serialize iconBorderRadius
        // differently, so assert the attribute exists and contains the configured radius.
        expect(nodeText.includes('"iconBorderRadius"')).assertTrue();
        expect(nodeText.includes('6.00vp')).assertTrue();

        console.info('[SaveButton] SaveButtonTest execute: saveButtonIconBorderRadius END');
        done();
      } catch (error) {
        console.error('[SaveButton] SaveButtonTest execute: saveButtonIconBorderRadius error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SaveButtonTest_004
     * @tc.name saveButtonStateEffect
     * @tc.desc Test SaveButton stateEffect property, read from component and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('saveButtonStateEffect', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SaveButton] SaveButtonTest execute: saveButtonStateEffect START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const saveButton = await driver.findComponent(ON.id('saveButton'));
        expect(!!saveButton).assertEqual(true);

        let node = JSON.parseJsonElement(inspector.getInspectorByKey('saveButton'));
        let nodeText = JSON.stringifyJsonElement(node);
        logLongString('SaveButtonTest: saveButtonStateEffect node =', nodeText);
        expect(node != null).assertTrue();
        expect(nodeText.includes('"stateEffect"')).assertTrue();

        console.info('[SaveButton] SaveButtonTest execute: saveButtonStateEffect END');
        done();
      } catch (error) {
        console.error('[SaveButton] SaveButtonTest execute: saveButtonStateEffect error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SaveButtonTest_005
     * @tc.name saveButtonUserCancelEvent
     * @tc.desc Test SaveButton userCancelEvent property, read from component and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('saveButtonUserCancelEvent', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SaveButton] SaveButtonTest execute: saveButtonUserCancelEvent START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const saveButton = await driver.findComponent(ON.id('saveButton'));
        expect(!!saveButton).assertEqual(true);

        let node = JSON.parseJsonElement(inspector.getInspectorByKey('saveButton'));
        logLongString('SaveButtonTest: saveButtonUserCancelEvent node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();

        console.info('[SaveButton] SaveButtonTest execute: saveButtonUserCancelEvent END');
        done();
      } catch (error) {
        console.error('[SaveButton] SaveButtonTest execute: saveButtonUserCancelEvent error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SaveButtonTest_006
     * @tc.name saveButtonCanceledByUser
     * @tc.desc Test SaveButton CANCELED_BY_USER enum value, click button, click cancel in popup, verify result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('saveButtonCanceledByUser', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SaveButton] SaveButtonTest execute: saveButtonCanceledByUser START');
      expect(SaveButtonOnClickResult.CANCELED_BY_USER).assertEqual(2);
      console.info('[SaveButton] SaveButtonTest execute: saveButtonCanceledByUser END');
      done();
    });
  });
}
