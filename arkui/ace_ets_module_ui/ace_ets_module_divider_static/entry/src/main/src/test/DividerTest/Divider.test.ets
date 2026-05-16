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
import { LineCapStyle } from '@ohos.arkui.component';

const SLEEP_TIME = 1000;

export default function DividerTest() {
  describe('DividerTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('[ARKUI_NEW] DividerTest beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.divider.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info('[ARKUI_NEW] DividerTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Divider/DividerIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('[ARKUI_NEW] DividerTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== "DividerIndex") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error('[ARKUI_NEW] DividerTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      console.info('[ARKUI_NEW] DividerTest afterEach start');
      await Utils.sleep(SLEEP_TIME);
      console.info('[ARKUI_NEW] DividerTest afterEach end');
    });

    /**
     * @tc.number SUB_ARKUI_ACE_DIVIDER_0100
     * @tc.name dividerDefault
     * @tc.desc Divider default — verify node exists via inspector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dividerDefault', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] DividerTest execute: dividerDefault START');
      await CommonFunc.sleep(SLEEP_TIME);
      const driver = Driver.create();
      const comp = await driver.findComponent(ON.id('dividerDefault'));
      expect(!!comp).assertEqual(true);
      let strJson = inspector.getInspectorByKey('dividerDefault');
      let node = JSON.parseJsonElement(strJson);
      expect(node != null).assertTrue();
      let attrs = node.getElement('$attrs');
      expect(attrs != null).assertTrue();
      console.info('[ARKUI_NEW] DividerTest execute: dividerDefault END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_ACE_DIVIDER_0200
     * @tc.name dividerVerticalTrue
     * @tc.desc Divider vertical true — verify node exists, check attrs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dividerVerticalTrue', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] DividerTest execute: dividerVerticalTrue START');
      await CommonFunc.sleep(SLEEP_TIME);
      const driver = Driver.create();
      const comp = await driver.findComponent(ON.id('dividerVerticalTrue'));
      expect(!!comp).assertEqual(true);
      let strJson = inspector.getInspectorByKey('dividerVerticalTrue');
      let node = JSON.parseJsonElement(strJson);
      expect(node != null).assertTrue();
      let attrs = node.getElement('$attrs');
      expect(attrs != null).assertTrue();
      let vertical = attrs.getString('vertical');
      console.info('[ARKUI_NEW] dividerVerticalTrue vertical = ' + vertical);
      expect(vertical != null && vertical != undefined).assertTrue();
      console.info('[ARKUI_NEW] DividerTest execute: dividerVerticalTrue END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_ACE_DIVIDER_0300
     * @tc.name dividerVerticalFalse
     * @tc.desc Divider vertical false — verify node exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dividerVerticalFalse', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] DividerTest execute: dividerVerticalFalse START');
      await CommonFunc.sleep(SLEEP_TIME);
      const driver = Driver.create();
      const comp = await driver.findComponent(ON.id('dividerVerticalFalse'));
      expect(!!comp).assertEqual(true);
      let strJson = inspector.getInspectorByKey('dividerVerticalFalse');
      let node = JSON.parseJsonElement(strJson);
      expect(node != null).assertTrue();
      let attrs = node.getElement('$attrs');
      expect(attrs != null).assertTrue();
      let vertical = attrs.getString('vertical');
      console.info('[ARKUI_NEW] dividerVerticalFalse vertical = ' + vertical);
      expect(vertical != null && vertical != undefined).assertTrue();
      console.info('[ARKUI_NEW] DividerTest execute: dividerVerticalFalse END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_ACE_DIVIDER_0400
     * @tc.name dividerColorRed
     * @tc.desc Divider color red — verify node exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dividerColorRed', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] DividerTest execute: dividerColorRed START');
      await CommonFunc.sleep(SLEEP_TIME);
      const driver = Driver.create();
      const comp = await driver.findComponent(ON.id('dividerColorRed'));
      expect(!!comp).assertEqual(true);
      let strJson = inspector.getInspectorByKey('dividerColorRed');
      let node = JSON.parseJsonElement(strJson);
      expect(node != null).assertTrue();
      let attrs = node.getElement('$attrs');
      expect(attrs != null).assertTrue();
      let color = attrs.getString('color');
      console.info('[ARKUI_NEW] dividerColorRed color = ' + color);
      expect(color != null && color.indexOf('FF0000') >= 0).assertTrue();
      console.info('[ARKUI_NEW] DividerTest execute: dividerColorRed END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_ACE_DIVIDER_0500
     * @tc.name dividerStrokeWidth5
     * @tc.desc Divider strokeWidth 5 — verify node exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dividerStrokeWidth5', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] DividerTest execute: dividerStrokeWidth5 START');
      await CommonFunc.sleep(SLEEP_TIME);
      const driver = Driver.create();
      const comp = await driver.findComponent(ON.id('dividerStrokeWidth5'));
      expect(!!comp).assertEqual(true);
      let strJson = inspector.getInspectorByKey('dividerStrokeWidth5');
      let node = JSON.parseJsonElement(strJson);
      expect(node != null).assertTrue();
      let attrs = node.getElement('$attrs');
      expect(attrs != null).assertTrue();
      let strokeWidth = attrs.getString('strokeWidth');
      console.info('[ARKUI_NEW] dividerStrokeWidth5 strokeWidth = ' + strokeWidth);
      expect(strokeWidth != null && strokeWidth != undefined && strokeWidth.length > 0).assertTrue();
      console.info('[ARKUI_NEW] DividerTest execute: dividerStrokeWidth5 END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_ACE_DIVIDER_0600
     * @tc.name dividerStrokeWidth10px
     * @tc.desc Divider strokeWidth 10px — verify node exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dividerStrokeWidth10px', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] DividerTest execute: dividerStrokeWidth10px START');
      await CommonFunc.sleep(SLEEP_TIME);
      const driver = Driver.create();
      const comp = await driver.findComponent(ON.id('dividerStrokeWidth10px'));
      expect(!!comp).assertEqual(true);
      let strJson = inspector.getInspectorByKey('dividerStrokeWidth10px');
      let node = JSON.parseJsonElement(strJson);
      expect(node != null).assertTrue();
      let attrs = node.getElement('$attrs');
      expect(attrs != null).assertTrue();
      let strokeWidth = attrs.getString('strokeWidth');
      console.info('[ARKUI_NEW] dividerStrokeWidth10px strokeWidth = ' + strokeWidth);
      expect(strokeWidth != null && strokeWidth != undefined && strokeWidth.length > 0).assertTrue();
      console.info('[ARKUI_NEW] DividerTest execute: dividerStrokeWidth10px END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_ACE_DIVIDER_0700
     * @tc.name dividerLineCapButt
     * @tc.desc Divider lineCap Butt — LineCapStyle.Butt == 0, inspector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dividerLineCapButt', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] DividerTest execute: dividerLineCapButt START');
      await CommonFunc.sleep(SLEEP_TIME);
      expect(LineCapStyle.Butt).assertEqual(0);
      const driver = Driver.create();
      const comp = await driver.findComponent(ON.id('dividerLineCapButt'));
      expect(!!comp).assertEqual(true);
      let strJson = inspector.getInspectorByKey('dividerLineCapButt');
      let node = JSON.parseJsonElement(strJson);
      expect(node != null).assertTrue();
      let attrs = node.getElement('$attrs');
      expect(attrs != null).assertTrue();
      let lineCap = attrs.getString('lineCap');
      console.info('[ARKUI_NEW] dividerLineCapButt lineCap = ' + lineCap);
      expect(lineCap != null && lineCap != undefined && lineCap.length > 0).assertTrue();
      console.info('[ARKUI_NEW] DividerTest execute: dividerLineCapButt END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_ACE_DIVIDER_0800
     * @tc.name dividerLineCapRound
     * @tc.desc Divider lineCap Round — LineCapStyle.Round == 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dividerLineCapRound', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] DividerTest execute: dividerLineCapRound START');
      await CommonFunc.sleep(SLEEP_TIME);
      expect(LineCapStyle.Round).assertEqual(1);
      const driver = Driver.create();
      const comp = await driver.findComponent(ON.id('dividerLineCapRound'));
      expect(!!comp).assertEqual(true);
      let strJson = inspector.getInspectorByKey('dividerLineCapRound');
      let node = JSON.parseJsonElement(strJson);
      expect(node != null).assertTrue();
      let attrs = node.getElement('$attrs');
      expect(attrs != null).assertTrue();
      let lineCap = attrs.getString('lineCap');
      console.info('[ARKUI_NEW] dividerLineCapRound lineCap = ' + lineCap);
      expect(lineCap != null && lineCap != undefined && lineCap.length > 0).assertTrue();
      console.info('[ARKUI_NEW] DividerTest execute: dividerLineCapRound END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_ACE_DIVIDER_0900
     * @tc.name dividerLineCapSquare
     * @tc.desc Divider lineCap Square — LineCapStyle.Square == 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dividerLineCapSquare', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] DividerTest execute: dividerLineCapSquare START');
      await CommonFunc.sleep(SLEEP_TIME);
      expect(LineCapStyle.Square).assertEqual(2);
      const driver = Driver.create();
      const comp = await driver.findComponent(ON.id('dividerLineCapSquare'));
      expect(!!comp).assertEqual(true);
      let strJson = inspector.getInspectorByKey('dividerLineCapSquare');
      let node = JSON.parseJsonElement(strJson);
      expect(node != null).assertTrue();
      let attrs = node.getElement('$attrs');
      expect(attrs != null).assertTrue();
      let lineCap = attrs.getString('lineCap');
      console.info('[ARKUI_NEW] dividerLineCapSquare lineCap = ' + lineCap);
      expect(lineCap != null && lineCap != undefined && lineCap.length > 0).assertTrue();
      console.info('[ARKUI_NEW] DividerTest execute: dividerLineCapSquare END');
      done();
    });
    
  });
}
