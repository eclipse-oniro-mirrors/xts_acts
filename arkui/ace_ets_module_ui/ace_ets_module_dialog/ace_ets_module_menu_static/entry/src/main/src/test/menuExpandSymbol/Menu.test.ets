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

export default function MenuTest() {
  describe('MenuTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("MenuTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.menu.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("MenuTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/menuExpandSymbol/Menu',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("MenuTest state pages: " + JSON.stringify(pages));
        console.info("MenuTest state pages.name: " + pages.name);
        if (pages.name !== "Index") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("MenuTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info("MenuTest after each called");
    });

    /**
     * @tc.number MenuTest_001
     * @tc.name menuSubMenuExpandSymbol
     * @tc.desc Test Menu subMenuExpandSymbol property, click button to show menu, read from component and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('menuSubMenuExpandSymbol', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('MenuTest execute: menuSubMenuExpandSymbol START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const button = await driver.findComponent(ON.text('click to show menu', MatchPattern.EQUALS));
        expect(!!button).assertEqual(true);
        await (button?.click() as Promise<void>);
        await Utils.sleep(1000);
        const menu = await driver.findComponent(ON.id('subMenuExpandingMode'));
        if (menu !== undefined) {
          let node = JSON.parseJsonElement(inspector.getInspectorByKey('subMenuExpandingMode'));
          logLongString('MenuTest: menuSubMenuExpandSymbol node =', JSON.stringifyJsonElement(node));
          expect(node != null).assertTrue();
        }
        await driver.pressBack();
        await Utils.sleep(200);
        console.info('MenuTest execute: menuSubMenuExpandSymbol END');
        done();
      } catch (error) {
        console.error('MenuTest execute: menuSubMenuExpandSymbol error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
