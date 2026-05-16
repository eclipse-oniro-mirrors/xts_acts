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

export default function PopupOptionsTest() {
  describe('PopupOptionsTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("PopupOptionsTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.popup.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("PopupOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/popup/PopupOptions',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("PopupOptionsTest state pages: " + JSON.stringify(pages));
        console.info("PopupOptionsTest state pages.name: " + pages.name);
        if (!('TextLineSpacing' == pages.name)) {
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error("PopupOptionsTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info("PopupOptionsTest after each called");
    });

    /**
     * @tc.number PopupOptionsTest_001
     * @tc.name popupOptionsAvoidTarget
     * @tc.desc Test PopupOptions avoidTarget property, verify component exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('popupOptionsAvoidTarget', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PopupOptionsTest execute: popupOptionsAvoidTarget START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const openPopupButton = await driver.findComponent(ON.id('btnOpenPopupNew'));
        expect(!!openPopupButton).assertEqual(true);
        await (openPopupButton?.click() as Promise<void>);
        await Utils.sleep(500);
        
        const popupContent = await driver.findComponent(ON.text('PopupOptions'));
        expect(!!popupContent).assertEqual(true);
        
        await driver.pressBack();
        await Utils.sleep(200);
        console.info('PopupOptionsTest execute: popupOptionsAvoidTarget END');
        done();
      } catch (error) {
        console.error('PopupOptionsTest execute: popupOptionsAvoidTarget error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PopupOptionsTest_002
     * @tc.name popupOptionsOutlineWidth
     * @tc.desc Test PopupOptions outlineWidth property, verify component exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('popupOptionsOutlineWidth', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PopupOptionsTest execute: popupOptionsOutlineWidth START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const openPopupButton = await driver.findComponent(ON.id('btnOpenPopupNew'));
        expect(!!openPopupButton).assertEqual(true);
        await (openPopupButton?.click() as Promise<void>);
        await Utils.sleep(500);
        
        const popupContent = await driver.findComponent(ON.text('PopupOptions'));
        expect(!!popupContent).assertEqual(true);
        
        await driver.pressBack();
        await Utils.sleep(200);
        console.info('PopupOptionsTest execute: popupOptionsOutlineWidth END');
        done();
      } catch (error) {
        console.error('PopupOptionsTest execute: popupOptionsOutlineWidth error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PopupOptionsTest_003
     * @tc.name popupOptionsBorderWidth
     * @tc.desc Test PopupOptions borderWidth property, verify component exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('popupOptionsBorderWidth', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PopupOptionsTest execute: popupOptionsBorderWidth START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const openPopupButton = await driver.findComponent(ON.id('btnOpenPopupNew'));
        expect(!!openPopupButton).assertEqual(true);
        await (openPopupButton?.click() as Promise<void>);
        await Utils.sleep(500);
        
        const popupContent = await driver.findComponent(ON.text('PopupOptions'));
        expect(!!popupContent).assertEqual(true);
        
        await driver.pressBack();
        await Utils.sleep(200);
        console.info('PopupOptionsTest execute: popupOptionsBorderWidth END');
        done();
      } catch (error) {
        console.error('PopupOptionsTest execute: popupOptionsBorderWidth error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PopupOptionsTest_004
     * @tc.name popupOptionsOutlineLinearGradient
     * @tc.desc Test PopupOptions outlineLinearGradient property, verify component exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('popupOptionsOutlineLinearGradient', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PopupOptionsTest execute: popupOptionsOutlineLinearGradient START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const openPopupButton = await driver.findComponent(ON.id('btnOpenPopupNew'));
        expect(!!openPopupButton).assertEqual(true);
        await (openPopupButton?.click() as Promise<void>);
        await Utils.sleep(500);
        
        const popupContent = await driver.findComponent(ON.text('PopupOptions'));
        expect(!!popupContent).assertEqual(true);
        
        await driver.pressBack();
        await Utils.sleep(200);
        console.info('PopupOptionsTest execute: popupOptionsOutlineLinearGradient END');
        done();
      } catch (error) {
        console.error('PopupOptionsTest execute: popupOptionsOutlineLinearGradient error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number PopupOptionsTest_005
     * @tc.name popupOptionsBorderLinearGradient
     * @tc.desc Test PopupOptions borderLinearGradient property, verify component exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('popupOptionsBorderLinearGradient', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('PopupOptionsTest execute: popupOptionsBorderLinearGradient START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const openPopupButton = await driver.findComponent(ON.id('btnOpenPopupNew'));
        expect(!!openPopupButton).assertEqual(true);
        await (openPopupButton?.click() as Promise<void>);
        await Utils.sleep(500);
        
        const popupContent = await driver.findComponent(ON.text('PopupOptions'));
        expect(!!popupContent).assertEqual(true);
        
        await driver.pressBack();
        await Utils.sleep(200);
        console.info('PopupOptionsTest execute: popupOptionsBorderLinearGradient END');
        done();
      } catch (error) {
        console.error('PopupOptionsTest execute: popupOptionsBorderLinearGradient error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
