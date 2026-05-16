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

export default function PopupCommonTest() {
  describe('PopupCommonTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("PopupCommonTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.popup.static", "EntryAbility");

      let options: router.RouterOptions = {
        url: 'MainAbility/pages/popup/PopupCommonOptions',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("PopupCommonTest state pages: " + JSON.stringify(pages));
        console.info("PopupCommonTest state pages.name: " + pages.name);
        if (!('TextLineSpacing' == pages.name)) {
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error("PopupCommonTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    beforeEach(async (): Promise<void> => {
      console.info("PopupCommonTest beforeEach start");
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info("PopupCommonTest after each called");
    });

    /**
     * @tc.number PopupCommonTest_001
     * @tc.name popupCommonOptionsAvoidTarget
     * @tc.desc Test PopupCommonOptions avoidTarget property, read from component and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('popupCommonOptionsAvoidTarget', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PopupCommonTest execute: popupCommonOptionsAvoidTarget START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const openPopupButton = await driver.findComponent(ON.id('btnOpenPopup'));
        expect(!!openPopupButton).assertEqual(true);
        await (openPopupButton?.click() as Promise<void>);
        await Utils.sleep(500);
        const popupContent = await driver.findComponent(ON.id('popupContent'));
        if (popupContent !== undefined) {
          let node = JSON.parseJsonElement(inspector.getInspectorByKey('popupContent'));
          logLongString('PopupCommonTest: popupContent node =', JSON.stringifyJsonElement(node));
          expect(node != null).assertTrue();
        }
        await driver.pressBack();
        await Utils.sleep(200);
        console.info('PopupCommonTest execute: popupCommonOptionsAvoidTarget END');
        done();
      } catch (error) {
        console.error('PopupCommonTest execute: popupCommonOptionsAvoidTarget error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PopupCommonTest_002
     * @tc.name popupCommonOptionsOutlineWidth
     * @tc.desc Test PopupCommonOptions outlineWidth property, read from component and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('popupCommonOptionsOutlineWidth', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PopupCommonTest execute: popupCommonOptionsOutlineWidth START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const openPopupButton = await driver.findComponent(ON.id('btnOpenPopup'));
        expect(!!openPopupButton).assertEqual(true);
        await (openPopupButton?.click() as Promise<void>);
        await Utils.sleep(500);
        
        const popupContent = await driver.findComponent(ON.id('popupContent'));
        if (popupContent !== undefined) {
          let node = JSON.parseJsonElement(inspector.getInspectorByKey('popupContent'));
          logLongString('PopupCommonTest: popupContent node =', JSON.stringifyJsonElement(node));
          expect(node != null).assertTrue();
        }
        
        await driver.pressBack();
        await Utils.sleep(200);
        console.info('PopupCommonTest execute: popupCommonOptionsOutlineWidth END');
        done();
      } catch (error) {
        console.error('PopupCommonTest execute: popupCommonOptionsOutlineWidth error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PopupCommonTest_003
     * @tc.name popupCommonOptionsBorderWidth
     * @tc.desc Test PopupCommonOptions borderWidth property, read from component and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('popupCommonOptionsBorderWidth', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PopupCommonTest execute: popupCommonOptionsBorderWidth START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const openPopupButton = await driver.findComponent(ON.id('btnOpenPopup'));
        expect(!!openPopupButton).assertEqual(true);
        await (openPopupButton?.click() as Promise<void>);
        await Utils.sleep(500);
        
        const popupContent = await driver.findComponent(ON.id('popupContent'));
        if (popupContent !== undefined) {
          let node = JSON.parseJsonElement(inspector.getInspectorByKey('popupContent'));
          logLongString('PopupCommonTest: popupContent node =', JSON.stringifyJsonElement(node));
          expect(node != null).assertTrue();
        }
        
        await driver.pressBack();
        await Utils.sleep(200);
        console.info('PopupCommonTest execute: popupCommonOptionsBorderWidth END');
        done();
      } catch (error) {
        console.error('PopupCommonTest execute: popupCommonOptionsBorderWidth error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PopupCommonTest_004
     * @tc.name popupCommonOptionsOutlineLinearGradient
     * @tc.desc Test PopupCommonOptions outlineLinearGradient property, read from component and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('popupCommonOptionsOutlineLinearGradient', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PopupCommonTest execute: popupCommonOptionsOutlineLinearGradient START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const openPopupButton = await driver.findComponent(ON.id('btnOpenPopup'));
        expect(!!openPopupButton).assertEqual(true);
        await (openPopupButton?.click() as Promise<void>);
        await Utils.sleep(500);
        
        const popupContent = await driver.findComponent(ON.id('popupContent'));
        if (popupContent !== undefined) {
          let node = JSON.parseJsonElement(inspector.getInspectorByKey('popupContent'));
          logLongString('PopupCommonTest: popupContent node =', JSON.stringifyJsonElement(node));
          expect(node != null).assertTrue();
        }
        
        await driver.pressBack();
        await Utils.sleep(200);
        console.info('PopupCommonTest execute: popupCommonOptionsOutlineLinearGradient END');
        done();
      } catch (error) {
        console.error('PopupCommonTest execute: popupCommonOptionsOutlineLinearGradient error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PopupCommonTest_005
     * @tc.name popupCommonOptionsBorderLinearGradient
     * @tc.desc Test PopupCommonOptions borderLinearGradient property, read from component and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('popupCommonOptionsBorderLinearGradient', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PopupCommonTest execute: popupCommonOptionsBorderLinearGradient START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const openPopupButton = await driver.findComponent(ON.id('btnOpenPopup'));
        expect(!!openPopupButton).assertEqual(true);
        await (openPopupButton?.click() as Promise<void>);
        await Utils.sleep(500);
        
        const popupContent = await driver.findComponent(ON.id('popupContent'));
        if (popupContent !== undefined) {
          let node = JSON.parseJsonElement(inspector.getInspectorByKey('popupContent'));
          logLongString('PopupCommonTest: popupContent node =', JSON.stringifyJsonElement(node));
          expect(node != null).assertTrue();
        }
        
        await driver.pressBack();
        await Utils.sleep(200);
        console.info('PopupCommonTest execute: popupCommonOptionsBorderLinearGradient END');
        done();
      } catch (error) {
        console.error('PopupCommonTest execute: popupCommonOptionsBorderLinearGradient error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
