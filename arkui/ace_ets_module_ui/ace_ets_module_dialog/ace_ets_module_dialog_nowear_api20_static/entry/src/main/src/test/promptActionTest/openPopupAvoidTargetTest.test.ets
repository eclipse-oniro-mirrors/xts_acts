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

export default function OpenPopupAvoidTargetTest() {
  describe('OpenPopupAvoidTargetTest', () => {
    const SLEEP_TIME_1000 = 1000;
    const SLEEP_TIME_3000 = 3000;
    beforeAll(() => {
      console.info("OpenPopupAvoidTargetTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.nowear.api20.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("OpenPopupAvoidTargetTest beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get OpenPopupAvoidTargetTest state pages:" + JSON.stringify(pages));
        if (!("openPopupAvoidTarget" == pages.name)) {
          console.info("get OpenPopupAvoidTargetTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({
            url: 'MainAbility/pages/promptAction/openPopupAvoidTarget',
          })
        }
      } catch (err) {
        console.error("push OpenPopupAvoidTargetTest page error:" + err);
      }
      console.info("OpenPopupAvoidTargetTest foreEach end");
    });

    /**
     * @tc.number   OpenPopup_AvoidTargetPopup_0010
     * @tc.name     OpenPopup_AvoidTargetPopup_0010
     * @tc.desc     Test the avoidTarget interface
     * @tc.level    LEVEL0
     */
    it('OpenPopup_AvoidTargetPopup_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'OpenPopup_AvoidTargetPopup_0010';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('avoidID'));
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
         `[OpenPopup_AvoidTargetPopup_0010] + ${popupRect.left}, ${popupRect.top}, ${popupRect.right},
              ${popupRect.bottom}`
      );
      console.info(
        `[OpenPopup_AvoidTargetPopup_0010] + ${buttonRect.left}, ${buttonRect.top}, ${buttonRect.right},
              ${buttonRect.bottom}`
      );
      expect(popupRect.top).assertLargerOrEqual(buttonRect.bottom);
      await (button?.click() as Promise<void>);
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number   OpenPopup_AvoidTargetPopup_0020
     * @tc.name     OpenPopup_AvoidTargetPopup_0020
     * @tc.desc     Test the avoidTarget interface
     * @tc.level    LEVEL0
     */
    it('OpenPopup_AvoidTargetPopup_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'OpenPopup_AvoidTargetPopup_0020';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('avoidID1'));
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
        `[OpenPopup_AvoidTargetPopup_0020] + ${popupRect.left}, ${popupRect.top}, ${popupRect.right},
              ${popupRect.bottom}`
      );
      console.info(
        `[OpenPopup_AvoidTargetPopup_0020] + ${buttonRect.left}, ${buttonRect.top}, ${buttonRect.right},
              ${buttonRect.bottom}`
      );
      expect(popupRect.top).assertLessOrEqual(buttonRect.bottom);
      await (button?.click() as Promise<void>);
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number   OpenPopup_AvoidTargetPopup_0030
     * @tc.name     OpenPopup_AvoidTargetPopup_0030
     * @tc.desc     Test the avoidTarget interface
     * @tc.level    LEVEL0
     */
    it('OpenPopup_AvoidTargetPopup_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'OpenPopup_AvoidTargetPopup_0030';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('avoidID2'));
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
        `[OpenPopup_AvoidTargetPopup_0030] + ${popupRect.left}, ${popupRect.top}, ${popupRect.right},
              ${popupRect.bottom}`
      );
      console.info(
        `[OpenPopup_AvoidTargetPopup_0030] + ${buttonRect.left}, ${buttonRect.top}, ${buttonRect.right},
              ${buttonRect.bottom}`
      );
      expect(popupRect.top).assertLessOrEqual(buttonRect.bottom);
        await (button?.click() as Promise<void>);
        console.info('[' + tagName + '] END ===========================');
        done();
      });
  })
}
