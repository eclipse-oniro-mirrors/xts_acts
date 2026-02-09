'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Utils from '../../../ets/MainAbility/common/Utils';
import {
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import {
  Driver,
  Component,
  UiWindow,
  On,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

export default function BindPopupAvoidTargetTest() {
  describe('BindPopupAvoidTargetTest', () => {
    const SLEEP_TIME_1000 = 1000;
    const SLEEP_TIME_3000 = 3000;
    beforeAll(() => {
      console.info("BindPopupAvoidTargetTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.nowear.api20.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("BindPopupAvoidTargetTest beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get BindPopupAvoidTargetTest state pages:" + JSON.stringify(pages));
        if (!("bindPopupAvoidTarget" == pages.name)) {
          console.info("get BindPopupAvoidTargetTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({
            url: 'MainAbility/pages/popup/bindPopupAvoidTarget',
          })
        }
      } catch (err) {
        console.error("push BindPopupAvoidTargetTest page error:" + err);
      }
      console.info("BindPopupAvoidTargetTest foreEach end");
    });

    /**
     * @tc.number   BindPopup_AvoidTargetPopup_0010
     * @tc.name     BindPopup_AvoidTargetPopup_0010
     * @tc.desc     Test the avoidTarget interface
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('BindPopup_AvoidTargetPopup_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let tagName = 'BindPopup_AvoidTargetPopup_0010';
        console.info('[' + tagName + '] START============================');
        let driver = Driver.create();
        let button = await driver.findComponent(ON.id('bindPopup_001'));
        if (!button) {
          console.error('Button not found');
          done();
          return;
        }
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME_1000);
        const buttonRect = await button.getBounds();
        let on: On = ON.type('Column').within(ON.type('Popup'));
        const popupContent = await driver.findComponent(on);
        if (!popupContent) {
          console.error('Popup content not found');
          done();
          return;
        }
        await CommonFunc.sleep(SLEEP_TIME_1000);
        const popupRect = await popupContent.getBounds();
        console.info(
          `[BindPopup_AvoidTargetPopup_0010] + ${popupRect.left}, ${popupRect.top}, ${popupRect.right},
                ${popupRect.bottom}`
        );
        console.info(
          `[BindPopup_AvoidTargetPopup_0010] + ${buttonRect.left}, ${buttonRect.top}, ${buttonRect.right},
                ${buttonRect.bottom}`
        );
        expect(popupRect.top).assertLargerOrEqual(buttonRect.bottom);
        await (button?.click() as Promise<void>);
        console.info('[' + tagName + '] END ===========================');
        done();
      });

    /**
     * @tc.number   BindPopup_AvoidTargetPopup_0020
     * @tc.name     BindPopup_AvoidTargetPopup_0020
     * @tc.desc     Test the avoidTarget interface
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('BindPopup_AvoidTargetPopup_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let tagName = 'BindPopup_AvoidTargetPopup_0020';
        console.info('[' + tagName + '] START============================');
        let driver = Driver.create();
        let button = await driver.findComponent(ON.id('bindPopup_002'));
        if (!button) {
          console.error('Button not found');
          done();
          return;
        }
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME_1000);
        const buttonRect = await button.getBounds();
        let on: On = ON.type('Column').within(ON.type('Popup'));
        const popupContent = await driver.findComponent(on);
        if (!popupContent) {
          console.error('Popup content not found');
          done();
          return;
        }
        await CommonFunc.sleep(SLEEP_TIME_1000);
        const popupRect = await popupContent.getBounds();
        console.info(
          `[BindPopup_AvoidTargetPopup_0020] + ${popupRect.left}, ${popupRect.top}, ${popupRect.right},
                ${popupRect.bottom}`
        );
        console.info(
          `[BindPopup_AvoidTargetPopup_0020] + ${buttonRect.left}, ${buttonRect.top}, ${buttonRect.right},
                ${buttonRect.bottom}`
        );
        expect(popupRect.top).assertLessOrEqual(buttonRect.bottom);
        await (button?.click() as Promise<void>);
        console.info('[' + tagName + '] END ===========================');
        done();
      });

    /**
     * @tc.number   BindPopup_AvoidTargetPopup_0030
     * @tc.name     BindPopup_AvoidTargetPopup_0030
     * @tc.desc     Test the avoidTarget interface
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('BindPopup_AvoidTargetPopup_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let tagName = 'BindPopup_AvoidTargetPopup_0030';
        console.info('[' + tagName + '] START============================');
        let driver = Driver.create();
        let button = await driver.findComponent(ON.id('bindPopup_003'));
        if (!button) {
          console.error('Button not found');
          done();
          return;
        }
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME_1000);
        const buttonRect = await button.getBounds();
        let on: On = ON.type('Column').within(ON.type('Popup'));
        const popupContent = await driver.findComponent(on);
        if (!popupContent) {
          console.error('Popup content not found');
          done();
          return;
        }
        await CommonFunc.sleep(SLEEP_TIME_1000);
        const popupRect = await popupContent.getBounds();
        console.info(
          `[BindPopup_AvoidTargetPopup_0030] + ${popupRect.left}, ${popupRect.top}, ${popupRect.right},
                ${popupRect.bottom}`
        );
        console.info(
          `[BindPopup_AvoidTargetPopup_0030] + ${buttonRect.left}, ${buttonRect.top}, ${buttonRect.right},
                ${buttonRect.bottom}`
        );
        expect(popupRect.top).assertLessOrEqual(buttonRect.bottom);
        await (button?.click() as Promise<void>);
        console.info('[' + tagName + '] END ===========================');
        done();
      });

    /**
     * @tc.number   BindPopup_AvoidTargetPopup_0040
     * @tc.name     BindPopup_AvoidTargetPopup_0040
     * @tc.desc     Test the avoidTarget interface
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('BindPopup_AvoidTargetPopup_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let tagName = 'BindPopup_AvoidTargetPopup_0040';
        console.info('[' + tagName + '] START============================');
        let driver = Driver.create();
        let button = await driver.findComponent(ON.id('bindPopup_004'));
        if (!button) {
          console.error('Button not found');
          done();
          return;
        }
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME_1000);
        const buttonRect = await button.getBounds();
        let on: On = ON.type('Column').within(ON.type('Popup'));
        const popupContent = await driver.findComponent(on);
        if (!popupContent) {
          console.error('Popup content not found');
          done();
          return;
        }
        await CommonFunc.sleep(SLEEP_TIME_1000);
        const popupRect = await popupContent.getBounds();
        console.info(
          `[BindPopup_AvoidTargetPopup_0040] + ${popupRect.left}, ${popupRect.top}, ${popupRect.right},
                ${popupRect.bottom}`
        );
        console.info(
          `[BindPopup_AvoidTargetPopup_0040] + ${buttonRect.left}, ${buttonRect.top}, ${buttonRect.right},
                ${buttonRect.bottom}`
        );
        expect(popupRect.top).assertLargerOrEqual(buttonRect.bottom);
        await (button?.click() as Promise<void>);
        console.info('[' + tagName + '] END ===========================');
        done();
      });

    /**
     * @tc.number   BindPopup_AvoidTargetPopup_0050
     * @tc.name     BindPopup_AvoidTargetPopup_0050
     * @tc.desc     Test the avoidTarget interface
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('BindPopup_AvoidTargetPopup_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let tagName = 'BindPopup_AvoidTargetPopup_0050';
        console.info('[' + tagName + '] START============================');
        let driver = Driver.create();
        let button = await driver.findComponent(ON.id('bindPopup_005'));
        if (!button) {
          console.error('Button not found');
          done();
          return;
        }
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME_1000);
        const buttonRect = await button.getBounds();
        let on: On = ON.type('Column').within(ON.type('Popup'));
        const popupContent = await driver.findComponent(on);
        if (!popupContent) {
          console.error('Popup content not found');
          done();
          return;
        }
        await CommonFunc.sleep(SLEEP_TIME_1000);
        const popupRect = await popupContent.getBounds();
        console.info(
          `[BindPopup_AvoidTargetPopup_0050] + ${popupRect.left}, ${popupRect.top}, ${popupRect.right},
                ${popupRect.bottom}`
        );
        console.info(
          `[BindPopup_AvoidTargetPopup_0050] + ${buttonRect.left}, ${buttonRect.top}, ${buttonRect.right},
                ${buttonRect.bottom}`
        );
        expect(popupRect.top).assertLessOrEqual(buttonRect.bottom);
        await (button?.click() as Promise<void>);
        console.info('[' + tagName + '] END ===========================');
        done();
      });

    /**
     * @tc.number   BindPopup_AvoidTargetPopup_0060
     * @tc.name     BindPopup_AvoidTargetPopup_0060
     * @tc.desc     Test the avoidTarget interface
     * @tc.level    LEVEL0
     */
    it('BindPopup_AvoidTargetPopup_0060', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'BindPopup_AvoidTargetPopup_0060';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('bindPopup_006'));
      if (!button) {
        console.error('Button not found');
        done();
        return;
      }
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(SLEEP_TIME_1000);
      const buttonRect = await button.getBounds();
      let on: On = ON.type('Column').within(ON.type('Popup'));
      const popupContent = await driver.findComponent(on);
      if (!popupContent) {
        console.error('Popup content not found');
        done();
        return;
      }
      await CommonFunc.sleep(SLEEP_TIME_1000);
      const popupRect = await popupContent.getBounds();
      console.info(
        `[BindPopup_AvoidTargetPopup_0060] + ${popupRect.left}, ${popupRect.top}, ${popupRect.right},
              ${popupRect.bottom}`
      );
      console.info(
        `[BindPopup_AvoidTargetPopup_0060] + ${buttonRect.left}, ${buttonRect.top}, ${buttonRect.right},
              ${buttonRect.bottom}`
      );
      expect(popupRect.top).assertLessOrEqual(buttonRect.bottom);
      await (button?.click() as Promise<void>);
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
