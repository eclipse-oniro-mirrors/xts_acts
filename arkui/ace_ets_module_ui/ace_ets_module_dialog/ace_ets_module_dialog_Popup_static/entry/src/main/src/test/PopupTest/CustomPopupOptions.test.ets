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

export default function CustomPopupOptionsTest() {
  describe('CustomPopupOptionsTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("CustomPopupOptionsTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.popup.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("CustomPopupOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/popup/CustomPopupOptions',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("CustomPopupOptionsTest state pages: " + JSON.stringify(pages));
        console.info("CustomPopupOptionsTest state pages.name: " + pages.name);
        if (!('TextLineSpacing' == pages.name)) {
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error("CustomPopupOptionsTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info("CustomPopupOptionsTest after each called");
    });

    /**
     * @tc.number CustomPopupOptionsTest_001
     * @tc.name customPopupOptionsAvoidTarget
     * @tc.desc Test CustomPopupOptions avoidTarget property, verify component exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('customPopupOptionsAvoidTarget', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CustomPopupOptionsTest execute: customPopupOptionsAvoidTarget START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const openPopupButton = await driver.findComponent(ON.id('btnOpenCustomPopupNew'));
        expect(!!openPopupButton).assertEqual(true);
        let buttonNode = JSON.parseJsonElement(inspector.getInspectorByKey('btnOpenCustomPopupNew'));
        logLongString('CustomPopupOptionsTest: btnOpenCustomPopupNew node =', JSON.stringifyJsonElement(buttonNode));
        await (openPopupButton?.click() as Promise<void>);
        await Utils.sleep(500);
        const popupContent = await driver.findComponent(ON.id('customPopupContentNew'));
        expect(!!popupContent).assertEqual(true);
        await driver.pressBack();
        await Utils.sleep(200);
        console.info('CustomPopupOptionsTest execute: customPopupOptionsAvoidTarget END');
        done();
      } catch (error) {
        console.error('CustomPopupOptionsTest execute: customPopupOptionsAvoidTarget error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CustomPopupOptionsTest_002
     * @tc.name customPopupOptionsOutlineWidth
     * @tc.desc Test CustomPopupOptions outlineWidth property, verify component exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('customPopupOptionsOutlineWidth', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CustomPopupOptionsTest execute: customPopupOptionsOutlineWidth START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const openPopupButton = await driver.findComponent(ON.id('btnOpenCustomPopupNew'));
        expect(!!openPopupButton).assertEqual(true);
        let buttonNode = JSON.parseJsonElement(inspector.getInspectorByKey('btnOpenCustomPopupNew'));
        logLongString('CustomPopupOptionsTest: btnOpenCustomPopupNew node =', JSON.stringifyJsonElement(buttonNode));
        await (openPopupButton?.click() as Promise<void>);
        await Utils.sleep(500);
        const popupContent = await driver.findComponent(ON.id('customPopupContentNew'));
        expect(!!popupContent).assertEqual(true);
        await driver.pressBack();
        await Utils.sleep(200);
        console.info('CustomPopupOptionsTest execute: customPopupOptionsOutlineWidth END');
        done();
      } catch (error) {
        console.error('CustomPopupOptionsTest execute: customPopupOptionsOutlineWidth error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CustomPopupOptionsTest_003
     * @tc.name customPopupOptionsBorderWidth
     * @tc.desc Test CustomPopupOptions borderWidth property, verify component exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('customPopupOptionsBorderWidth', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CustomPopupOptionsTest execute: customPopupOptionsBorderWidth START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const openPopupButton = await driver.findComponent(ON.id('btnOpenCustomPopupNew'));
        expect(!!openPopupButton).assertEqual(true);
        let buttonNode = JSON.parseJsonElement(inspector.getInspectorByKey('btnOpenCustomPopupNew'));
        logLongString('CustomPopupOptionsTest: btnOpenCustomPopupNew node =', JSON.stringifyJsonElement(buttonNode));
        await (openPopupButton?.click() as Promise<void>);
        await Utils.sleep(500);
        const popupContent = await driver.findComponent(ON.id('customPopupContentNew'));
        expect(!!popupContent).assertEqual(true);
        await driver.pressBack();
        await Utils.sleep(200);
        console.info('CustomPopupOptionsTest execute: customPopupOptionsBorderWidth END');
        done();
      } catch (error) {
        console.error('CustomPopupOptionsTest execute: customPopupOptionsBorderWidth error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CustomPopupOptionsTest_004
     * @tc.name customPopupOptionsOutlineLinearGradient
     * @tc.desc Test CustomPopupOptions outlineLinearGradient property, verify component exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('customPopupOptionsOutlineLinearGradient', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CustomPopupOptionsTest execute: customPopupOptionsOutlineLinearGradient START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const openPopupButton = await driver.findComponent(ON.id('btnOpenCustomPopupNew'));
        expect(!!openPopupButton).assertEqual(true);
        let buttonNode = JSON.parseJsonElement(inspector.getInspectorByKey('btnOpenCustomPopupNew'));
        logLongString('CustomPopupOptionsTest: btnOpenCustomPopupNew node =', JSON.stringifyJsonElement(buttonNode));
        await (openPopupButton?.click() as Promise<void>);
        await Utils.sleep(500);
        const popupContent = await driver.findComponent(ON.id('customPopupContentNew'));
        expect(!!popupContent).assertEqual(true);
        await driver.pressBack();
        await Utils.sleep(200);
        console.info('CustomPopupOptionsTest execute: customPopupOptionsOutlineLinearGradient END');
        done();
      } catch (error) {
        console.error('CustomPopupOptionsTest execute: customPopupOptionsOutlineLinearGradient error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CustomPopupOptionsTest_005
     * @tc.name customPopupOptionsBorderLinearGradient
     * @tc.desc Test CustomPopupOptions borderLinearGradient property, verify component exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('customPopupOptionsBorderLinearGradient', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('CustomPopupOptionsTest execute: customPopupOptionsBorderLinearGradient START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const openPopupButton = await driver.findComponent(ON.id('btnOpenCustomPopupNew'));
        expect(!!openPopupButton).assertEqual(true);
        let buttonNode = JSON.parseJsonElement(inspector.getInspectorByKey('btnOpenCustomPopupNew'));
        logLongString('CustomPopupOptionsTest: btnOpenCustomPopupNew node =', JSON.stringifyJsonElement(buttonNode));
        await (openPopupButton?.click() as Promise<void>);
        await Utils.sleep(500);
        const popupContent = await driver.findComponent(ON.id('customPopupContentNew'));
        expect(!!popupContent).assertEqual(true);
        await driver.pressBack();
        await Utils.sleep(200);
        console.info('CustomPopupOptionsTest execute: customPopupOptionsBorderLinearGradient END');
        done();
      } catch (error) {
        console.error('CustomPopupOptionsTest execute: customPopupOptionsBorderLinearGradient error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
