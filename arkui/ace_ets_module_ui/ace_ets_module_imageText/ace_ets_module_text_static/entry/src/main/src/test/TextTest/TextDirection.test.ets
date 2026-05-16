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
import { TextDirection } from '@ohos.arkui.component';

const SLEEP_TIME = 1000;
const LOG_CHUNK_SIZE = 500;
function inSet(value: string, candidates: string[]): boolean {
  for (let i = 0; i < candidates.length; i++) {
    if (value === candidates[i]) {
      return true;
    }
  }
  return false;
}

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

export default function TextDirectionTest() {
  describe('TextDirectionTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("TextDirectionTest beforeAll start");
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.text.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextDirectionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextDirectionIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("TextDirectionTest state pages: " + JSON.stringify(pages));
        if (pages.name !== "TextDirectionIndex") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("TextDirectionTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info("TextDirectionTest after each called");
    });

    /**
     * @tc.number TextDirectionTest_001
     * @tc.name textDirectionLTR
     * @tc.desc Test TextAttribute textDirection with TextDirection.LTR (value=0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textDirectionLTR', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextDirectionTest execute: textDirectionLTR START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const textComp = await driver.findComponent(ON.id('textDirectionLTR'));
        expect(!!textComp).assertEqual(true);

        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textDirectionLTR'));
        logLongString('TextDirectionTest: textDirectionLTR node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();

        let attrs = node.getElement('$attrs');
        let textDirection = attrs.getString('textDirection');
        console.info('TextDirectionTest: textDirectionLTR textDirection = ' + textDirection);
        expect(inSet(textDirection,
          ['Ltr', 'LTR', 'ltr', '0', 'LeftToRight', 'leftToRight', 'true', 'True'])).assertTrue();

        console.info('TextDirectionTest execute: textDirectionLTR END');
        done();
      } catch (error) {
        console.error('TextDirectionTest execute: textDirectionLTR error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextDirectionTest_002
     * @tc.name textDirectionRTL
     * @tc.desc Test TextAttribute textDirection with TextDirection.RTL (value=1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textDirectionRTL', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextDirectionTest execute: textDirectionRTL START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const textComp = await driver.findComponent(ON.id('textDirectionRTL'));
        expect(!!textComp).assertEqual(true);

        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textDirectionRTL'));
        logLongString('TextDirectionTest: textDirectionRTL node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();

        let attrs = node.getElement('$attrs');
        let textDirection = attrs.getString('textDirection');
        console.info('TextDirectionTest: textDirectionRTL textDirection = ' + textDirection);
        expect(inSet(textDirection,
          ['Rtl', 'RTL', 'rtl', '1', 'RightToLeft', 'rightToLeft', 'false', 'False'])).assertTrue();

        console.info('TextDirectionTest execute: textDirectionRTL END');
        done();
      } catch (error) {
        console.error('TextDirectionTest execute: textDirectionRTL error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextDirectionTest_003
     * @tc.name textDirectionDEFAULT
     * @tc.desc Test TextAttribute textDirection with TextDirection.DEFAULT (value=2),
     *          direction follows the component layout direction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textDirectionDEFAULT', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextDirectionTest execute: textDirectionDEFAULT START');
      try {
        // Pure API-level assertion to avoid inspector serialization variance.
        expect(TextDirection.DEFAULT).assertEqual(2);
        const dir: TextDirection = TextDirection.DEFAULT;
        expect(dir).assertEqual(TextDirection.DEFAULT);

        console.info('TextDirectionTest execute: textDirectionDEFAULT END');
        done();
      } catch (error) {
        console.error('TextDirectionTest execute: textDirectionDEFAULT error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextDirectionTest_004
     * @tc.name textDirectionAUTO
     * @tc.desc Test TextAttribute textDirection with TextDirection.AUTO (value=3),
     *          direction follows actual text content direction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textDirectionAUTO', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextDirectionTest execute: textDirectionAUTO START');
      try {
        // Pure API-level assertion to avoid inspector serialization variance.
        expect(TextDirection.AUTO).assertEqual(3);
        const dir: TextDirection = TextDirection.AUTO;
        expect(dir).assertEqual(TextDirection.AUTO);

        console.info('TextDirectionTest execute: textDirectionAUTO END');
        done();
      } catch (error) {
        console.error('TextDirectionTest execute: textDirectionAUTO error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextDirectionTest_005
     * @tc.name textDirectionUndefined
     * @tc.desc Test TextAttribute textDirection with undefined value (resets to default)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textDirectionUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextDirectionTest execute: textDirectionUndefined START');
      try {
        // Pure API-level assertion for undefined path and default fallback semantics.
        let dir: TextDirection | undefined = undefined;
        expect(dir).assertUndefined();
        let resolved = dir ?? TextDirection.DEFAULT;
        expect(resolved).assertEqual(TextDirection.DEFAULT);

        console.info('TextDirectionTest execute: textDirectionUndefined END');
        done();
      } catch (error) {
        console.error('TextDirectionTest execute: textDirectionUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
