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

export default function FocusBoxTest() {
  describe('FocusBoxTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("FocusBoxTest beforeAll start");
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.securityComponent.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("FocusBoxTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SecurityComponent/FocusBoxIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("FocusBoxTest state pages: " + JSON.stringify(pages));
        if (pages.name !== "FocusBoxIndex") {
          routerInstance.replaceUrl(options);
          await Utils.sleep(1000);
        }
      } catch (err) {
        console.error("FocusBoxTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info("FocusBoxTest after each called");
    });

    /**
     * @tc.number FocusBoxTest_001
     * @tc.name focusBoxWithStyle
     * @tc.desc Test SecurityComponentMethod focusBox with FocusBoxStyle (margin=4vp, strokeColor=Blue, strokeWidth=2vp)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('focusBoxWithStyle', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('FocusBoxTest execute: focusBoxWithStyle START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const comp = await driver.findComponent(ON.id('focusBoxWithStyle'));
        expect(!!comp).assertEqual(true);

        let node = JSON.parseJsonElement(inspector.getInspectorByKey('focusBoxWithStyle'));
        logLongString('FocusBoxTest: focusBoxWithStyle node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();

        let attrs = node.getElement('$attrs');
        let focusBox = attrs.getElement('focusBox');
        console.info('FocusBoxTest: focusBoxWithStyle focusBox = ' + JSON.stringifyJsonElement(focusBox));
        expect(focusBox != null).assertTrue();

        let strokeWidth = focusBox.getString('strokeWidth');
        console.info('FocusBoxTest: focusBoxWithStyle strokeWidth = ' + strokeWidth);
        expect(strokeWidth).assertEqual('2.00vp');

        let margin = focusBox.getString('margin');
        console.info('FocusBoxTest: focusBoxWithStyle margin = ' + margin);
        expect(margin).assertEqual('4.00vp');

        let strokeColor = focusBox.getString('strokeColor');
        console.info('FocusBoxTest: focusBoxWithStyle strokeColor = ' + strokeColor);
        expect(strokeColor != null && strokeColor.length > 0).assertTrue();

        console.info('FocusBoxTest execute: focusBoxWithStyle END');
        done();
      } catch (error) {
        console.error('FocusBoxTest execute: focusBoxWithStyle error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number FocusBoxTest_002
     * @tc.name focusBoxRedStroke
     * @tc.desc Test SecurityComponentMethod focusBox with strokeColor=Red, strokeWidth=4vp, margin=2vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('focusBoxRedStroke', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('FocusBoxTest execute: focusBoxRedStroke START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const comp = await driver.findComponent(ON.id('focusBoxRedStroke'));
        expect(!!comp).assertEqual(true);

        let node = JSON.parseJsonElement(inspector.getInspectorByKey('focusBoxRedStroke'));
        logLongString('FocusBoxTest: focusBoxRedStroke node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();

        let attrs = node.getElement('$attrs');
        let focusBox = attrs.getElement('focusBox');
        console.info('FocusBoxTest: focusBoxRedStroke focusBox = ' + JSON.stringifyJsonElement(focusBox));
        expect(focusBox != null).assertTrue();

        let strokeWidth = focusBox.getString('strokeWidth');
        console.info('FocusBoxTest: focusBoxRedStroke strokeWidth = ' + strokeWidth);
        expect(strokeWidth).assertEqual('4.00vp');

        let margin = focusBox.getString('margin');
        console.info('FocusBoxTest: focusBoxRedStroke margin = ' + margin);
        expect(margin).assertEqual('2.00vp');

        let strokeColor = focusBox.getString('strokeColor');
        console.info('FocusBoxTest: focusBoxRedStroke strokeColor = ' + strokeColor);
        expect(strokeColor != null && strokeColor.length > 0).assertTrue();

        console.info('FocusBoxTest execute: focusBoxRedStroke END');
        done();
      } catch (error) {
        console.error('FocusBoxTest execute: focusBoxRedStroke error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number FocusBoxTest_003
     * @tc.name focusBoxColorOnly
     * @tc.desc Test SecurityComponentMethod focusBox with only strokeColor set (strokeColor=Green)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('focusBoxColorOnly', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('FocusBoxTest execute: focusBoxColorOnly START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const comp = await driver.findComponent(ON.id('focusBoxColorOnly'));
        expect(!!comp).assertEqual(true);

        let node = JSON.parseJsonElement(inspector.getInspectorByKey('focusBoxColorOnly'));
        logLongString('FocusBoxTest: focusBoxColorOnly node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();

        let attrs = node.getElement('$attrs');
        let focusBox = attrs.getElement('focusBox');
        console.info('FocusBoxTest: focusBoxColorOnly focusBox = ' + JSON.stringifyJsonElement(focusBox));
        expect(focusBox != null).assertTrue();

        console.info('FocusBoxTest execute: focusBoxColorOnly END');
        done();
      } catch (error) {
        console.error('FocusBoxTest execute: focusBoxColorOnly error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number FocusBoxTest_004
     * @tc.name focusBoxUndefined
     * @tc.desc Test SecurityComponentMethod focusBox with undefined value (resets to default)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('focusBoxUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('FocusBoxTest execute: focusBoxUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const comp = await driver.findComponent(ON.id('focusBoxUndefined'));
        expect(!!comp).assertEqual(true);

        let node = JSON.parseJsonElement(inspector.getInspectorByKey('focusBoxUndefined'));
        logLongString('FocusBoxTest: focusBoxUndefined node =', JSON.stringifyJsonElement(node));
        expect(node != null).assertTrue();

        console.info('FocusBoxTest execute: focusBoxUndefined END');
        done();
      } catch (error) {
        console.error('FocusBoxTest execute: focusBoxUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
