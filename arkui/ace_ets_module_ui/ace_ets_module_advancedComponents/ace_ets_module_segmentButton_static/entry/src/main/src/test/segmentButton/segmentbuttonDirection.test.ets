'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium';
import { Driver, ON ,Component} from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest, startAbility } from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function segmentButtonDirectionTest() {
  describe('segmentButtonDirectionTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("segmentButtonDirectionTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.advanced.segmentButton.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("segmentButtonDirectionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/segmentButton/SegmentButtonDirection',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get segmentButtonDirectionTest state pages:" + JSON.stringify(pages));
        if (!("segmentButtonDirectionTest" == pages.name)) {
          console.info("get segmentButtonDirectionTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push segmentButtonDirectionTest page error:" + err);
        expect().assertFail();
      }
      console.info("segmentButtonDirectionTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('segmentButtonDirectionTest after each called');
    });


    /**
     * @tc.name   segmentButtonDirectionTest_0100
     * @tc.number segmentButtonDirectionTest_0100
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('segmentButtonDirectionTest_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('segmentButtonDirectionTest_0100 START');
      let driver: Driver = Driver.create();
      let buttonAuto = (await driver.findComponent(ON.id('Auto'))) as Component;
      await (buttonAuto?.click() as Promise<void>);
      await driver.delayMs(1000);
      console.log("testSegmentButtonDirection_0100 ", "click Auto");
      let tab1 = (await driver.findComponent(ON.text('页签按钮1'))) as Component;
      let single1 = (await driver.findComponent(ON.text('单选按钮a'))) as Component;
      let tabRect1 = await tab1.getBounds();
      let singleRect1 = await single1.getBounds();
      console.log("testSegmentButtonDirection_0100 ", "tabRect1 :" + JSON.stringify(tabRect1));
      console.log("testSegmentButtonDirection_0100 ", "singleRect1 :" + JSON.stringify(singleRect1));
      let buttonRtl = (await driver.findComponent(ON.id('Rtl'))) as Component;
      await (buttonRtl?.click() as Promise<void>);
      console.log("testSegmentButtonDirection_0100 ", "click Rtl");
      await driver.delayMs(1000);
      let tab2 = (await driver.findComponent(ON.text('页签按钮1'))) as Component;
      let single2 = (await driver.findComponent(ON.text('单选按钮a'))) as Component;
      let tabRect2 = await tab2.getBounds();
      let singleRect2 = await single2.getBounds();
      console.log("testSegmentButtonDirection_0100 ", "tabRect2 :" + JSON.stringify(tabRect2));
      console.log("testSegmentButtonDirection_0100 ", "singleRect2 :" + JSON.stringify(singleRect2));
      expect(tabRect1.left == tabRect2.left).assertFalse();
      expect(singleRect1.left == singleRect2.left).assertFalse();
      console.log("testSegmentButtonDirection_0100 ", "END");
      done();
    });
    /**
     * @tc.name   segmentButtonDirectionTest_0200
     * @tc.number segmentButtonDirectionTest_0200
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('segmentButtonDirectionTest_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log("testSegmentButtonDirection_0200 ", "START");
      let driver: Driver = Driver.create();
      let buttonAuto = (await driver.findComponent(ON.id('Auto'))) as Component;
      await (buttonAuto?.click() as Promise<void>);
      await driver.delayMs(1000);
      console.log("[testSegmentButtonDirection_0200]", "click Auto");
      let multi1 = (await driver.findComponent(ON.text('多选按钮1'))) as Component;
      let icon1 = (await driver.findComponent(ON.text('图标1'))) as Component;
      let multiRect1 = await multi1.getBounds();
      let iconRect1 = await icon1.getBounds();
      console.log("[testSegmentButtonDirection_0200]", "multiRect1 :" + JSON.stringify(multiRect1));
      console.log("[testSegmentButtonDirection_0200]", "iconRect1 :" + JSON.stringify(iconRect1));
      let buttonRtl = (await driver.findComponent(ON.id('Rtl'))) as Component;
      await (buttonRtl?.click() as Promise<void>);
      console.log("[testSegmentButtonDirection_0200]", "click Rtl");
      await driver.delayMs(1000);
      let multi2 = (await driver.findComponent(ON.text('多选按钮1'))) as Component;
      let icon2 = (await driver.findComponent(ON.text('图标1'))) as Component;
      let multiRect2 = await multi2.getBounds();
      let iconRect2 = await icon2.getBounds();
      console.log("[testSegmentButtonDirection_0200]", "multiRect2 :" + JSON.stringify(multiRect2));
      console.log("[testSegmentButtonDirection_0200]", "iconRect2 :" + JSON.stringify(iconRect2));
      expect(iconRect1.left == iconRect2.left).assertFalse();
      expect(iconRect1.left == iconRect2.left).assertFalse();
      console.log("[testSegmentButtonDirection_0200]", "END");
      done();
    });

  })
}