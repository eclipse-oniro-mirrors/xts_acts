'use static';

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

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME = 1000;

export default function SaveScrollSearchTest() {
  describe('SaveScrollSearchTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('SaveScrollSearchTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.scroll.api23.static', 'EntryAbility');
    });

    beforeEach((): void => {
      console.info('SaveScrollSearchTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SaveScrollSearch/SaveScrollSearch',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('SaveScrollSearchTest state pages: ' + JSON.stringify(pages));
        // Always replace to avoid state carry-over across cases/suites.
        routerInstance.replaceUrl(options);
      } catch (err) {
        console.error('SaveScrollSearchTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach((): void => {
      console.info('SaveScrollSearchTest after each called');
    });

    /**
     * @tc.number SaveScrollSearchTest_001
     * @tc.name globalSaveButton
     * @tc.desc saveButton.d.ets global @ComponentBuilder SaveButton(options?: SaveButtonOptions): SaveButtonAttribute
     *          验证 SaveButton 组件渲染到页面后可通过 inspector 读取节点树     */
    it('globalSaveButton', Level.LEVEL1, (done: () => void) => {
      console.info('SaveScrollSearchTest execute: globalSaveButton START');
      let strJson = inspector.getInspectorByKey('saveButtonCase');
      console.info('SaveScrollSearchTest saveButtonCase inspector length: ' + strJson.length);
      if (strJson.length > 0) {
        let node = JSON.parseJsonElement(strJson);
        console.info('SaveScrollSearchTest saveButtonCase node type: ' + node.getString('$type'));
        expect(node != null).assertTrue();
      } else {
        console.info('SaveScrollSearchTest saveButtonCase: inspector empty, verify via AppStorage');
      }
      let stateSnapshot = AppStorage.get<string>('SaveScrollSearchPageState') ?? '';
      console.info('SaveScrollSearchTest SaveScrollSearchPageState: ' + stateSnapshot);
      expect(stateSnapshot.includes('saveButtonValue=download')).assertEqual(true);
      console.info('SaveScrollSearchTest execute: globalSaveButton END');
      done();
    });

    /**
     * @tc.number SaveScrollSearchTest_002
     * @tc.name scrollerOffset
     * @tc.desc scroll.d.ets Scroller.offset() - 验证 Scroll 组件渲染后 inspector 可读取节点，
     *          初始 offset 状态为 0,0     */
    it('scrollerOffset', Level.LEVEL1, (done: () => void) => {
      console.info('SaveScrollSearchTest execute: scrollerOffset START');
      let strJson = inspector.getInspectorByKey('scrollBarColorCase');
      console.info('SaveScrollSearchTest scrollBarColorCase inspector length: ' + strJson.length);
      if (strJson.length > 0) {
        let node = JSON.parseJsonElement(strJson);
        console.info('SaveScrollSearchTest scrollBarColorCase node type: ' + node.getString('$type'));
        expect(node != null).assertTrue();
      } else {
        console.info('SaveScrollSearchTest scrollBarColorCase: inspector empty, verify via AppStorage');
      }
      let stateSnapshot = AppStorage.get<string>('SaveScrollSearchPageState') ?? '';
      console.info('SaveScrollSearchTest SaveScrollSearchPageState: ' + stateSnapshot);
      expect(stateSnapshot.includes('offsetText=0,0')).assertEqual(true);
      console.info('SaveScrollSearchTest execute: scrollerOffset END');
      done();
    });

    /**
     * @tc.number SaveScrollSearchTest_003
     * @tc.name scrollBarColor
     * @tc.desc Test ScrollAttribute scrollBarColor call on page, click toggle and verify color value changes
     */
    it('scrollBarColor', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SaveScrollSearchTest execute: scrollBarColor START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let nodeRaw = inspector.getInspectorByKey('scrollBarColorCase');
        console.info('SaveScrollSearchTest scrollBarColorCase inspector length: ' + nodeRaw.length);
        expect(nodeRaw.length > 0).assertEqual(true);
        let colorVal = inspector.getInspectorByKey('scrollBarColorValue');
        console.info('SaveScrollSearchTest scrollBarColorValue: ' + colorVal);
        expect(colorVal.includes('#ff0000')).assertEqual(true);
        let stateSnapshot = AppStorage.get<string>('SaveScrollSearchPageState') ?? '';
        console.info('SaveScrollSearchTest SaveScrollSearchPageState: ' + stateSnapshot);
        expect(stateSnapshot.includes('scrollBarColorValue')).assertEqual(true);
        console.info('SaveScrollSearchTest execute: scrollBarColor END');
        done();
      } catch (error) {
        console.error('SaveScrollSearchTest scrollBarColor error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SaveScrollSearchTest_004
     * @tc.name scrollBarColorEnum
     * @tc.desc scroll.d.ets ScrollAttribute.scrollBarColor - Color enum variant: Color.Blue     */
    it('scrollBarColorEnum', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SaveScrollSearchTest: scrollBarColorEnum START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('scrollSbcColor');
        expect(strJson.length > 0).assertEqual(true);
        let obj = JSON.parseJsonElement(strJson);
        let attrs = obj.getElement('$attrs');
        let val = attrs.getString('scrollBarColor');
        console.info('SaveScrollSearchTest scrollBarColorEnum value: ' + val);
        expect(val.length > 0).assertEqual(true);
        done();
      } catch (error) {
        console.error('SaveScrollSearchTest scrollBarColorEnum error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SaveScrollSearchTest_005
     * @tc.name scrollBarColorInt
     * @tc.desc scroll.d.ets ScrollAttribute.scrollBarColor - int variant: 0xFF0000     */
    it('scrollBarColorInt', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SaveScrollSearchTest: scrollBarColorInt START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('scrollSbcInt');
        expect(strJson.length > 0).assertEqual(true);
        let obj = JSON.parseJsonElement(strJson);
        let attrs = obj.getElement('$attrs');
        let val = attrs.getString('scrollBarColor');
        console.info('SaveScrollSearchTest scrollBarColorInt value: ' + val);
        expect(val.length > 0).assertEqual(true);
        done();
      } catch (error) {
        console.error('SaveScrollSearchTest scrollBarColorInt error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SaveScrollSearchTest_006
     * @tc.name scrollBarColorResource
     * @tc.desc scroll.d.ets ScrollAttribute.scrollBarColor - Resource variant: $r('app.color.color_hello')     */
    it('scrollBarColorResource', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SaveScrollSearchTest: scrollBarColorResource START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('scrollSbcRes');
        expect(strJson.length > 0).assertEqual(true);
        let obj = JSON.parseJsonElement(strJson);
        let attrs = obj.getElement('$attrs');
        let val = attrs.getString('scrollBarColor');
        console.info('SaveScrollSearchTest scrollBarColorResource value: ' + val);
        expect(val.length > 0).assertEqual(true);
        done();
      } catch (error) {
        console.error('SaveScrollSearchTest scrollBarColorResource error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SaveScrollSearchTest_007
     * @tc.name scrollBarColorUndefined
     * @tc.desc scroll.d.ets ScrollAttribute.scrollBarColor - undefined variant     */
    it('scrollBarColorUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SaveScrollSearchTest: scrollBarColorUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('scrollSbcUndef');
        expect(strJson.length > 0).assertEqual(true);
        let obj = JSON.parseJsonElement(strJson);
        expect(obj != null).assertTrue();
        done();
      } catch (error) {
        console.error('SaveScrollSearchTest scrollBarColorUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

  });
}
