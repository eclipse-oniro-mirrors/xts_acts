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

export default function SelectTest() {
  describe('SelectTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("SelectTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.select.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("SelectTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Select/Select',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("SelectTest state pages: " + JSON.stringify(pages));
        console.info("SelectTest state pages.name: " + pages.name);
        if (!('TextLineSpacing' == pages.name)) {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("SelectTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info("SelectTest after each called");
    });

    /**
     * @tc.number SelectTest_001
     * @tc.name selectShowInSubWindow
     * @tc.desc Test Select showInSubWindow property, read from component and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('selectShowInSubWindow', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SelectTest execute: selectShowInSubWindow START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const select = await driver.findComponent(ON.id('selectAllProperties'));
        expect(!!select).assertEqual(true);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('selectAllProperties'));
        logLongString('SelectTest: selectShowInSubWindow node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        let showInSubWindow = attrs.getString('showInSubWindow');
        expect(showInSubWindow).assertEqual('false');
        console.info('SelectTest execute: selectShowInSubWindow END');
        done();
      } catch (error) {
        console.error('SelectTest execute: selectShowInSubWindow error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SelectTest_002
     * @tc.name selectShowDefaultSelectedIcon
     * @tc.desc Test Select showDefaultSelectedIcon property, read from component and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('selectShowDefaultSelectedIcon', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SelectTest execute: selectShowDefaultSelectedIcon START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const select = await driver.findComponent(ON.id('selectAllProperties'));
        expect(!!select).assertEqual(true);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('selectAllProperties'));
        logLongString('SelectTest: selectShowDefaultSelectedIcon node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        let showDefaultSelectedIcon = attrs.getString('showDefaultSelectedIcon');
        expect(showDefaultSelectedIcon).assertEqual('false');
        console.info('SelectTest execute: selectShowDefaultSelectedIcon END');
        done();
      } catch (error) {
        console.error('SelectTest execute: selectShowDefaultSelectedIcon error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SelectTest_003
     * @tc.name selectKeyboardAvoidMode
     * @tc.desc Test Select keyboardAvoidMode property, read from component and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('selectKeyboardAvoidMode', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SelectTest execute: selectKeyboardAvoidMode START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const select = await driver.findComponent(ON.id('selectAllProperties'));
        expect(!!select).assertEqual(true);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('selectAllProperties'));
        logLongString('SelectTest: selectKeyboardAvoidMode node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();
        console.info('SelectTest execute: selectKeyboardAvoidMode END');
        done();
      } catch (error) {
        console.error('SelectTest execute: selectKeyboardAvoidMode error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SelectTest_004
     * @tc.name selectMinKeyboardAvoidDistance
     * @tc.desc Test Select minKeyboardAvoidDistance property, read from component and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('selectMinKeyboardAvoidDistance', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SelectTest execute: selectMinKeyboardAvoidDistance START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const select = await driver.findComponent(ON.id('selectAllProperties'));
        expect(!!select).assertEqual(true);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('selectAllProperties'));
        logLongString('SelectTest: selectMinKeyboardAvoidDistance node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();
        console.info('SelectTest execute: selectMinKeyboardAvoidDistance END');
        done();
      } catch (error) {
        console.error('SelectTest execute: selectMinKeyboardAvoidDistance error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
