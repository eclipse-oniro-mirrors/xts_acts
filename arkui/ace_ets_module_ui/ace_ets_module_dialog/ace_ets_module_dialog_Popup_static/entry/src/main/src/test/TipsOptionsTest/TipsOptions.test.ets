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

export default function TipsOptionsTest() {
  describe('TipsOptionsTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("TipsOptionsTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.popup.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("TipsOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TipsOptions/TipsOptions',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("TipsOptionsTest state pages: " + JSON.stringify(pages));
        console.info("TipsOptionsTest state pages.name: " + pages.name);
        if (pages.name !== "TipsExample") {
          routerInstance.replaceUrl(options);
        }
        // Wait for page to load
        await Utils.sleep(500);
      } catch (err) {
        console.error("TipsOptionsTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info("TipsOptionsTest after each called");
    });

    /**
     * @tc.number TipsOptionsTest_001
     * @tc.name tipsOptionsShowAtAnchor1
     * @tc.desc Test TipsOptions showAtAnchor property for tips1 button, read from component and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tipsOptionsShowAtAnchor1', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TipsOptionsTest execute: tipsOptionsShowAtAnchor1 START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        
        const button = await driver.findComponent(ON.id('tips1'));
        console.info('TipsOptionsTest: tipsOptionsShowAtAnchor1 - found tips1 button component');
        expect(!!button).assertEqual(true);
        
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('tips1'));
        console.info('TipsOptionsTest: tipsOptionsShowAtAnchor1 - got node from inspector');
        logLongString('TipsOptionsTest: tipsOptionsShowAtAnchor1 node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();
        
        console.info('TipsOptionsTest execute: tipsOptionsShowAtAnchor1 END');
        done();
      } catch (error) {
        console.error('TipsOptionsTest execute: tipsOptionsShowAtAnchor1 error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TipsOptionsTest_002
     * @tc.name tipsOptionsShowAtAnchor2
     * @tc.desc Test TipsOptions showAtAnchor property for tips2 button, read from component and print component tree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tipsOptionsShowAtAnchor2', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TipsOptionsTest execute: tipsOptionsShowAtAnchor2 START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        
        const button = await driver.findComponent(ON.id('tips2'));
        console.info('TipsOptionsTest: tipsOptionsShowAtAnchor2 - found tips2 button component');
        expect(!!button).assertEqual(true);
        
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('tips2'));
        console.info('TipsOptionsTest: tipsOptionsShowAtAnchor2 - got node from inspector');
        logLongString('TipsOptionsTest: tipsOptionsShowAtAnchor2 node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();
        
        console.info('TipsOptionsTest execute: tipsOptionsShowAtAnchor2 END');
        done();
      } catch (error) {
        console.error('TipsOptionsTest execute: tipsOptionsShowAtAnchor2 error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
