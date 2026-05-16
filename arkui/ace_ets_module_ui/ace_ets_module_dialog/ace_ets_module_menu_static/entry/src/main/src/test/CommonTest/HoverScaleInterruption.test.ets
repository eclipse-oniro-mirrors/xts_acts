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

export default function HoverScaleInterruptionTest() {
  describe('HoverScaleInterruptionTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("HoverScaleInterruptionTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.menu.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("HoverScaleInterruptionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/common/HoverScaleInterruption',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("HoverScaleInterruptionTest state pages: " + JSON.stringify(pages));
        console.info("HoverScaleInterruptionTest state pages.name: " + pages.name);
        if (pages.name !== "HoverScaleInterruptionIndex") {
          routerInstance.replaceUrl(options);
        }
        // Wait for page to load
        await Utils.sleep(500);
      } catch (err) {
        console.error("HoverScaleInterruptionTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info("HoverScaleInterruptionTest after each called");
    });

    /**
     * @tc.number HoverScaleInterruptionTest_001
     * @tc.name hoverScaleInterruptionTrue
     * @tc.desc Test ContextMenuOptions hoverScaleInterruption property with true value, read from component and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('hoverScaleInterruptionTrue', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('HoverScaleInterruptionTest execute: hoverScaleInterruptionTrue START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnHoverScaleInterruptionTrue'));
        expect(!!button).assertEqual(true);
        let buttonNode = JSON.parseJsonElement(inspector.getInspectorByKey('btnHoverScaleInterruptionTrue'));
        logLongString('HoverScaleInterruptionTest: btnHoverScaleInterruptionTrue node =', JSON.stringifyJsonElement(buttonNode));
        if(button){
          await button.longClick();
          await Utils.sleep(1500);
        }
        const menuItem = await driver.waitForComponent(ON.id('HoverMenu1'), 1000);
        if (menuItem !== undefined) {
          let menuNode = JSON.parseJsonElement(inspector.getInspectorByKey('btnHoverScaleInterruptionTrue'));
          logLongString('HoverScaleInterruptionTest: menu node =', JSON.stringifyJsonElement(menuNode));
        }
        await driver.pressBack();
        await Utils.sleep(200);
        console.info('HoverScaleInterruptionTest execute: hoverScaleInterruptionTrue END');
        done();
      } catch (error) {
        console.error('HoverScaleInterruptionTest execute: hoverScaleInterruptionTrue error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number HoverScaleInterruptionTest_002
     * @tc.name hoverScaleInterruptionFalse
     * @tc.desc Test ContextMenuOptions hoverScaleInterruption property with false value, read from component and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('hoverScaleInterruptionFalse', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('HoverScaleInterruptionTest execute: hoverScaleInterruptionFalse START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btnHoverScaleInterruptionFalse'));
        expect(!!button).assertEqual(true);
        let buttonNode = JSON.parseJsonElement(inspector.getInspectorByKey('btnHoverScaleInterruptionFalse'));
        logLongString('HoverScaleInterruptionTest: btnHoverScaleInterruptionFalse node =', JSON.stringifyJsonElement(buttonNode));
        if(button){
          await button.longClick();
          await Utils.sleep(1500);
        }
        const menuItem = await driver.waitForComponent(ON.id('HoverMenu1'), 1000);
        if (menuItem !== undefined) {
          let menuNode = JSON.parseJsonElement(inspector.getInspectorByKey('btnHoverScaleInterruptionFalse'));
          logLongString('HoverScaleInterruptionTest: menu node =', JSON.stringifyJsonElement(menuNode));
        }
        await driver.pressBack();
        await Utils.sleep(200);
        console.info('HoverScaleInterruptionTest execute: hoverScaleInterruptionFalse END');
        done();
      } catch (error) {
        console.error('HoverScaleInterruptionTest execute: hoverScaleInterruptionFalse error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
