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
import { Driver } from '@kit.TestKit';
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

export default function SpanTest() {
  describe('SpanTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("SpanTest beforeAll start");
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.span.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("SpanTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Span/SpanIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("SpanTest state pages: " + JSON.stringify(pages));
        if (pages.name !== "SpanIndex") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("SpanTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info("SpanTest after each called");
    });

    /**
     * @tc.number SpanTest_001
     * @tc.name spanFontWeightBold
     * @tc.desc Test SpanAttribute fontWeight with FontWeight.Bold (700)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('spanFontWeightBold', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SpanTest execute: spanFontWeightBold START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);

        let node = JSON.parseJsonElement(inspector.getInspectorByKey('spanFontWeightBold'));
        logLongString('SpanTest: spanFontWeightBold node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();

        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let fontWeight = attrs.getString('fontWeight');
        console.info('SpanTest: spanFontWeightBold fontWeight = ' + fontWeight);
        expect(fontWeight).assertEqual('FontWeight.Bold');

        console.info('SpanTest execute: spanFontWeightBold END');
        done();
      } catch (error) {
        console.error('SpanTest execute: spanFontWeightBold error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SpanTest_002
     * @tc.name spanFontWeightNormal
     * @tc.desc Test SpanAttribute fontWeight with FontWeight.Normal (400)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('spanFontWeightNormal', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SpanTest execute: spanFontWeightNormal START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);

        let node = JSON.parseJsonElement(inspector.getInspectorByKey('spanFontWeightNormal'));
        logLongString('SpanTest: spanFontWeightNormal node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();

        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let fontWeight = attrs.getString('fontWeight');
        console.info('SpanTest: spanFontWeightNormal fontWeight = ' + fontWeight);
        expect(fontWeight).assertEqual('FontWeight.Normal');

        console.info('SpanTest execute: spanFontWeightNormal END');
        done();
      } catch (error) {
        console.error('SpanTest execute: spanFontWeightNormal error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SpanTest_003
     * @tc.name spanFontWeightMedium
     * @tc.desc Test SpanAttribute fontWeight with FontWeight.Medium (500)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('spanFontWeightMedium', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SpanTest execute: spanFontWeightMedium START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);

        let node = JSON.parseJsonElement(inspector.getInspectorByKey('spanFontWeightMedium'));
        logLongString('SpanTest: spanFontWeightMedium node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();

        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let fontWeight = attrs.getString('fontWeight');
        console.info('SpanTest: spanFontWeightMedium fontWeight = ' + fontWeight);
        expect(fontWeight).assertEqual('FontWeight.Medium');

        console.info('SpanTest execute: spanFontWeightMedium END');
        done();
      } catch (error) {
        console.error('SpanTest execute: spanFontWeightMedium error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SpanTest_004
     * @tc.name spanFontWeightLighter
     * @tc.desc Test SpanAttribute fontWeight with FontWeight.Lighter (100)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('spanFontWeightLighter', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SpanTest execute: spanFontWeightLighter START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);

        let node = JSON.parseJsonElement(inspector.getInspectorByKey('spanFontWeightLighter'));
        logLongString('SpanTest: spanFontWeightLighter node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();

        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let fontWeight = attrs.getString('fontWeight');
        console.info('SpanTest: spanFontWeightLighter fontWeight = ' + fontWeight);
        expect(fontWeight).assertEqual('FontWeight.Lighter');

        console.info('SpanTest execute: spanFontWeightLighter END');
        done();
      } catch (error) {
        console.error('SpanTest execute: spanFontWeightLighter error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SpanTest_005
     * @tc.name spanFontWeightBolder
     * @tc.desc Test SpanAttribute fontWeight with FontWeight.Bolder (900)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('spanFontWeightBolder', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SpanTest execute: spanFontWeightBolder START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);

        let node = JSON.parseJsonElement(inspector.getInspectorByKey('spanFontWeightBolder'));
        logLongString('SpanTest: spanFontWeightBolder node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();

        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let fontWeight = attrs.getString('fontWeight');
        console.info('SpanTest: spanFontWeightBolder fontWeight = ' + fontWeight);
        expect(fontWeight).assertEqual('FontWeight.Bolder');

        console.info('SpanTest execute: spanFontWeightBolder END');
        done();
      } catch (error) {
        console.error('SpanTest execute: spanFontWeightBolder error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SpanTest_006
     * @tc.name spanFontWeightInt700
     * @tc.desc Test SpanAttribute fontWeight with int value 700 (equals Bold)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('spanFontWeightInt700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SpanTest execute: spanFontWeightInt700 START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);

        let node = JSON.parseJsonElement(inspector.getInspectorByKey('spanFontWeightInt700'));
        logLongString('SpanTest: spanFontWeightInt700 node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();

        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let fontWeight = attrs.getString('fontWeight');
        console.info('SpanTest: spanFontWeightInt700 fontWeight = ' + fontWeight);
        expect(fontWeight).assertEqual('700');

        console.info('SpanTest execute: spanFontWeightInt700 END');
        done();
      } catch (error) {
        console.error('SpanTest execute: spanFontWeightInt700 error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SpanTest_007
     * @tc.name spanFontWeightInt400
     * @tc.desc Test SpanAttribute fontWeight with int value 400 (equals Normal)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('spanFontWeightInt400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SpanTest execute: spanFontWeightInt400 START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);

        let node = JSON.parseJsonElement(inspector.getInspectorByKey('spanFontWeightInt400'));
        logLongString('SpanTest: spanFontWeightInt400 node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();

        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let fontWeight = attrs.getString('fontWeight');
        console.info('SpanTest: spanFontWeightInt400 fontWeight = ' + fontWeight);
        expect(fontWeight).assertEqual('400');

        console.info('SpanTest execute: spanFontWeightInt400 END');
        done();
      } catch (error) {
        console.error('SpanTest execute: spanFontWeightInt400 error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SpanTest_008
     * @tc.name spanFontWeightStrBold
     * @tc.desc Test SpanAttribute fontWeight with ResourceStr 'bold' (maps to 700)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('spanFontWeightStrBold', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SpanTest execute: spanFontWeightStrBold START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);

        let node = JSON.parseJsonElement(inspector.getInspectorByKey('spanFontWeightStrBold'));
        logLongString('SpanTest: spanFontWeightStrBold node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();

        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let fontWeight = attrs.getString('fontWeight');
        console.info('SpanTest: spanFontWeightStrBold fontWeight = ' + fontWeight);
        expect(fontWeight).assertEqual('FontWeight.Bold');

        console.info('SpanTest execute: spanFontWeightStrBold END');
        done();
      } catch (error) {
        console.error('SpanTest execute: spanFontWeightStrBold error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SpanTest_009
     * @tc.name spanFontWeightUndefined
     * @tc.desc Test SpanAttribute fontWeight with undefined (resets to default Normal=400)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('spanFontWeightUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SpanTest execute: spanFontWeightUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);

        let node = JSON.parseJsonElement(inspector.getInspectorByKey('spanFontWeightUndefined'));
        logLongString('SpanTest: spanFontWeightUndefined node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();

        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let fontWeight = attrs.getString('fontWeight');
        console.info('SpanTest: spanFontWeightUndefined fontWeight = ' + fontWeight);
        // undefined resets to default FontWeight.Normal
        expect(fontWeight).assertEqual('FontWeight.Normal');

        console.info('SpanTest execute: spanFontWeightUndefined END');
        done();
      } catch (error) {
        console.error('SpanTest execute: spanFontWeightUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
