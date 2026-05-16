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
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME = 1000;

export default function BlankTest() {
  describe('BlankTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('[ARKUI_NEW] BlankTest beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.blank.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info('[ARKUI_NEW] BlankTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Blank/BlankIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('[ARKUI_NEW] BlankTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== "BlankIndex") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error('[ARKUI_NEW] BlankTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      console.info('[ARKUI_NEW] BlankTest afterEach start');
      await Utils.sleep(SLEEP_TIME);
      console.info('[ARKUI_NEW] BlankTest afterEach end');
    });

    /**
     * @tc.number SUB_ARKUI_ACE_BLANK_0100
     * @tc.name blankNoArgs
     * @tc.desc Test Blank() with no arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('blankNoArgs', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] BlankTest execute: blankNoArgs START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('blankNoArgs');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        console.info('[ARKUI_NEW] BlankTest execute: blankNoArgs END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] BlankTest execute: blankNoArgs error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_BLANK_0200
     * @tc.name blankMinDouble
     * @tc.desc Test Blank(100) with double min value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('blankMinDouble', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] BlankTest execute: blankMinDouble START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('blankMinDouble');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let min = attrs.getString('min');
        console.info('[ARKUI_NEW] blankMinDouble min = ' + min);
        expect(min != null && min != undefined && min.length > 0).assertTrue();
        console.info('[ARKUI_NEW] BlankTest execute: blankMinDouble END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] BlankTest execute: blankMinDouble error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_BLANK_0300
     * @tc.name blankMinString
     * @tc.desc Test Blank('50vp') with string min value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('blankMinString', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] BlankTest execute: blankMinString START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('blankMinString');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let min = attrs.getString('min');
        console.info('[ARKUI_NEW] blankMinString min = ' + min);
        expect(min != null && min != undefined && min.length > 0).assertTrue();
        console.info('[ARKUI_NEW] BlankTest execute: blankMinString END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] BlankTest execute: blankMinString error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_BLANK_0400
     * @tc.name blankMinZero
     * @tc.desc Test Blank(0) with zero min value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('blankMinZero', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] BlankTest execute: blankMinZero START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('blankMinZero');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        let min = attrs.getString('min');
        console.info('[ARKUI_NEW] blankMinZero min = ' + min);
        expect(min != null && min != undefined).assertTrue();
        console.info('[ARKUI_NEW] BlankTest execute: blankMinZero END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] BlankTest execute: blankMinZero error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_BLANK_0500
     * @tc.name blankMinUndefined
     * @tc.desc Test Blank(undefined) with undefined min value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('blankMinUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] BlankTest execute: blankMinUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('blankMinUndefined');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        console.info('[ARKUI_NEW] BlankTest execute: blankMinUndefined END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] BlankTest execute: blankMinUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
