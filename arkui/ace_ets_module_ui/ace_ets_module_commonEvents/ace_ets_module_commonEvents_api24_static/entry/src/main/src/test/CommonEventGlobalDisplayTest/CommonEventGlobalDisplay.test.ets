'use static';
/*
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

import { describe, it, expect, Level, beforeAll, beforeEach } from '../../../../hypium/index';
import { AppStorage } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { waitForMainRouterForStaticTest } from '../../../ets/MainAbility/common/UIContextStaticTestBridge';
import { UtilsTest } from '../Util.test';
import { Driver, ON, Point } from '@kit.TestKit';

export default function CommonEventGlobalDisplayTest(): void {
  describe('CommonEventGlobalDisplayTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.commonEvents.api24.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      let r = await waitForMainRouterForStaticTest();
      expect(r !== undefined && r !== null).assertTrue();
      let ro: router.RouterOptions = { url: 'MainAbility/pages/CommonEventApiProbe/CommonEventApiProbe' };
      r!.clear();
      await r!.replaceUrl(ro);
      await Utils.sleep(600);
    });

    /**
     * @tc.number SUB_ArkUI_Common_ClickEvent_GlobalDisplayXY_1800
     * @tc.name SUB_ArkUI_Common_ClickEvent_GlobalDisplayXY_1800
     * @tc.desc common.d.ets ClickEvent：探测页 onClick 真实回调中的 globalDisplayX/Y
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ArkUI_Common_ClickEvent_GlobalDisplayXY_1800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id("commonEventClickHost"));
      await (button?.click() as Promise<void>);
      await Utils.sleep(300);
      let gdx = AppStorage.get<string>('ce_click_gdx');
      let gdy = AppStorage.get<string>('ce_click_gdy');
      let clickGdxOk: boolean = gdx != null && gdx.length > 0;
      let clickGdyOk: boolean = gdy != null && gdy.length > 0;
      expect(clickGdxOk).assertTrue();
      expect(clickGdyOk).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ArkUI_Common_HoverEvent_GlobalDisplayXY_1900
     * @tc.name SUB_ArkUI_Common_HoverEvent_GlobalDisplayXY_1900
     * @tc.desc HoverEvent：真实 onHover 回调（依赖设备/输入链路能触发 hover）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ArkUI_Common_HoverEvent_GlobalDisplayXY_1900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('commonEventClickHost'));
      let button2 = await driver.findComponent(ON.id('commonEventHoverHost'));
      let center1 = await (button1?.getBoundsCenter() as Promise<Point>);
      let center2 = await (button2?.getBoundsCenter() as Promise<Point>);
      await driver.mouseMoveWithTrack(center1, center2, 600);
      await Utils.sleep(300);
      let gdx = AppStorage.get<string>('ce_hover_gdx');
      let gdy = AppStorage.get<string>('ce_hover_gdy');
      let hoverGdxOk: boolean = gdx != null && gdx.length > 0;
      let hoverGdyOk: boolean = gdy != null && gdy.length > 0;
      expect(hoverGdxOk).assertTrue();
      expect(hoverGdyOk).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ArkUI_Common_MouseEvent_GlobalDisplayXY_2000
     * @tc.name SUB_ArkUI_Common_MouseEvent_GlobalDisplayXY_2000
     * @tc.desc MouseEvent：真实 onMouse 回调
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ArkUI_Common_MouseEvent_GlobalDisplayXY_2000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      let host = await driver.findComponent(ON.id('commonEventMouseHost'));
      let hostOk: boolean = host != undefined && host != null;
      expect(hostOk).assertTrue();
      if (host != undefined && host != null) {
        await host.click();
      }
      await Utils.sleep(500);
      let gdx = AppStorage.get<string>('ce_mouse_gdx');
      let gdy = AppStorage.get<string>('ce_mouse_gdy');
      let mouseGdxOk: boolean = gdx != null && gdx.length > 0;
      let mouseGdyOk: boolean = gdy != null && gdy.length > 0;
      expect(mouseGdxOk).assertTrue();
      expect(mouseGdyOk).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ArkUI_Common_AccessibilityHoverEvent_GlobalDisplayXY_2100
     * @tc.name SUB_ArkUI_Common_AccessibilityHoverEvent_GlobalDisplayXY_2100
     * @tc.desc AccessibilityHoverEvent：真实 onAccessibilityHover
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ArkUI_Common_AccessibilityHoverEvent_GlobalDisplayXY_2100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      let host = await driver.findComponent(ON.id('commonEventAccHoverHost'));
      let hostOk: boolean = host != undefined && host != null;
      expect(hostOk).assertTrue();
      if (host != undefined && host != null) {
        await host.click();
      }
      await Utils.sleep(500);
      let gdx = AppStorage.get<string>('ce_acc_gdx');
      let gdy = AppStorage.get<string>('ce_acc_gdy');
      let accGdxOk: boolean = gdx != null && gdx.length > 0;
      let accGdyOk: boolean = gdy != null && gdy.length > 0;
      expect(accGdxOk).assertTrue();
      expect(accGdyOk).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ArkUI_Common_TouchObject_GlobalDisplayXY_2200
     * @tc.name SUB_ArkUI_Common_TouchObject_GlobalDisplayXY_2200
     * @tc.desc TouchObject：真实 onTouch Down 的 changedTouches[0] globalDisplayX/Y
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ArkUI_Common_TouchObject_GlobalDisplayXY_2200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id("commonEventTouchHost"));
      await (button?.click() as Promise<void>);
      await Utils.sleep(300);
      let gdx = AppStorage.get<string>('ce_touch_gdx');
      let gdy = AppStorage.get<string>('ce_touch_gdy');
      let touchGdxOk: boolean = gdx != null && gdx.length > 0;
      let touchGdyOk: boolean = gdy != null && gdy.length > 0;
      expect(touchGdxOk).assertTrue();
      expect(touchGdyOk).assertTrue();
      done();
    });
  });
}
