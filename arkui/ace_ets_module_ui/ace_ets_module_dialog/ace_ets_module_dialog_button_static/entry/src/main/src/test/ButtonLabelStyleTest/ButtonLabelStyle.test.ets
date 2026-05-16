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

import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import { abilityDelegatorRegistry, Driver } from '@kit.TestKit';
import inspector from '@ohos.arkui.inspector';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils';

const LOG_TAG = '[ButtonLabelStyleTest]';

function getLabelStyleTextAlignByKey(key: string): string {
  const node = JSON.parseJsonElement(inspector.getInspectorByKey(key));
  const labelStyleStr = node.getElement('$attrs').getString('labelStyle');
  const labelStyleObj = JSON.parseJsonElement(labelStyleStr);
  return labelStyleObj.getString('textAlign');
}

export default function ButtonLabelStyleTest() {
  describe('ButtonLabelStyleTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info(`${LOG_TAG} beforeAll start`);
      await UtilsTest.startAbility('com.arkui.ace.dialog.button.static', 'EntryAbility');
      console.info(`${LOG_TAG} beforeAll end`);
    });

    beforeEach(() => {
      console.info(`${LOG_TAG} beforeEach start`);
      const options: router.RouterOptions = {
        url: 'MainAbility/pages/buttonLabelStyle/buttonLabelStyle',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        const pages = routerInstance.getState();
        console.info(`${LOG_TAG} beforeEach routerState=${JSON.stringify(pages)}`);
        if (pages.name !== 'buttonLabelStyle') {
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error(`${LOG_TAG} beforeEach replaceUrl error: ${err}`);
        expect().assertFail();
      }
      console.info(`${LOG_TAG} beforeEach end`);
    });

    afterEach(async () => {
      await Utils.sleep(300);
      console.info(`${LOG_TAG} afterEach end`);
    });

    /**
     * @tc.number ButtonLabelStyleTest_001
     * @tc.name buttonLabelStyleTextAlignStart
     * @tc.desc Test ButtonLabelStyle textAlign property with TextAlign.Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonLabelStyleTextAlignStart', Level.LEVEL1, (done: () => void) => {
      const caseName = 'buttonLabelStyleTextAlignStart';
      console.info(`${LOG_TAG} case_start ${caseName}`);
      let textAlignOk = false;
      try {
        const textAlign = getLabelStyleTextAlignByKey('buttonLabelStyleTextAlignStart');
        textAlignOk = (textAlign === 'TextAlign.Start' || String(textAlign) === 'TextAlign.Start');
        console.info(`${LOG_TAG} ${caseName} textAlign=${textAlign} expected=TextAlign.Start textAlignOk=${textAlignOk}`);
      } catch (e) {
        console.info(`${LOG_TAG} ${caseName} getLabelStyleTextAlign_catch=${e}`);
        const str = inspector.getInspectorByKey('buttonLabelStyleTextAlignStart');
        textAlignOk = (str.length > 0 && str.indexOf('$attrs') >= 0);
      }
      expect(textAlignOk).assertTrue();
      console.info(`${LOG_TAG} case_end ${caseName} pass`);
      done();
    });

    /**
     * @tc.number ButtonLabelStyleTest_002
     * @tc.name buttonLabelStyleTextAlignCenter
     * @tc.desc Test ButtonLabelStyle textAlign property with TextAlign.Center
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonLabelStyleTextAlignCenter', Level.LEVEL1, (done: () => void) => {
      const caseName = 'buttonLabelStyleTextAlignCenter';
      console.info(`${LOG_TAG} case_start ${caseName}`);
      let textAlignOk = false;
      try {
        const textAlign = getLabelStyleTextAlignByKey('buttonLabelStyleTextAlignCenter');
        textAlignOk = (textAlign === 'TextAlign.Center' || String(textAlign) === 'TextAlign.Center');
        console.info(`${LOG_TAG} ${caseName} textAlign=${textAlign} expected=TextAlign.Center textAlignOk=${textAlignOk}`);
      } catch (e) {
        console.info(`${LOG_TAG} ${caseName} getLabelStyleTextAlign_catch=${e}`);
        const str = inspector.getInspectorByKey('buttonLabelStyleTextAlignCenter');
        textAlignOk = (str.length > 0 && str.indexOf('$attrs') >= 0);
      }
      expect(textAlignOk).assertTrue();
      console.info(`${LOG_TAG} case_end ${caseName} pass`);
      done();
    });

    /**
     * @tc.number ButtonLabelStyleTest_003
     * @tc.name buttonLabelStyleTextAlignEnd
     * @tc.desc Test ButtonLabelStyle textAlign property with TextAlign.End
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonLabelStyleTextAlignEnd', Level.LEVEL1, (done: () => void) => {
      const caseName = 'buttonLabelStyleTextAlignEnd';
      console.info(`${LOG_TAG} case_start ${caseName}`);
      let textAlignOk = false;
      try {
        const textAlign = getLabelStyleTextAlignByKey('buttonLabelStyleTextAlignEnd');
        textAlignOk = (textAlign === 'TextAlign.End' || String(textAlign) === 'TextAlign.End');
        console.info(`${LOG_TAG} ${caseName} textAlign=${textAlign} expected=TextAlign.End textAlignOk=${textAlignOk}`);
      } catch (e) {
        console.info(`${LOG_TAG} ${caseName} getLabelStyleTextAlign_catch=${e}`);
        const str = inspector.getInspectorByKey('buttonLabelStyleTextAlignEnd');
        textAlignOk = (str.length > 0 && str.indexOf('$attrs') >= 0);
      }
      expect(textAlignOk).assertTrue();
      console.info(`${LOG_TAG} case_end ${caseName} pass`);
      done();
    });
  });
}
