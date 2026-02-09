'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation,
  ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import Utils from '../../../ets/MainAbility/common/Utils';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function SegmentButtonV2Test0010() {
  describe('SegmentButtonV2Test0010', () => {
    beforeAll(() => {
      console.info("SegmentButtonV2Test0010 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.advanced.component.nowear.api18.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("SegmentButtonV2Test0010 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/segmentButtonV2/SegmentButtonV20010",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SegmentButtonV2Test0010 state pages:" + JSON.stringify(pages));
        if (!("SegmentButtonV20010" == pages.name)) {
          console.info("get SegmentButtonV2Test0010 pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push SegmentButtonV2Test0010 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SegmentButtonV2Test0010 page error:" + err);
      }
      console.info("SegmentButtonV2Test0010 beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("SegmentButtonV2Test0010 after each called");
    });

    
    
    
    /**
     * @tc.number   SegmentButtonV2Test0010_static_001
     * @tc.name     SegmentButtonV2Test0010_static_001
     * @tc.desc     SegmentButtonV2Test0010_static_001
     * @tc.level    Level.LEVEL0
     */
it('SegmentButtonV2Test0010_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SegmentButtonV2Test0010_static_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let textClick = await driver.findComponent(ON.text("share"));
      await CommonFunc.sleep(500);
      await (textClick?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey('tvIndex0'));
      console.info("[SegmentButtonV2Test0010] select index is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('2');
      await CommonFunc.sleep(500);
      let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]
        .getArray("$children")[5]
        .getArray("$children")[0]
      console.info("[SegmentButtonV2Test0010_static_001] component btn0.attrs.accessibilityText is: " + JSON.stringify(btn0.getElement('$attrs').getString('accessibilityText')));
      expect(btn0.getElement('$attrs').getString('accessibilityText')).assertEqual('search');
      console.info("[SegmentButtonV2Test0010_static_001] component btn0.attrs.accessibilityLevel is: " + JSON.stringify(btn0.getElement('$attrs').getString('accessibilityLevel')));
      expect(btn0.getElement('$attrs').getString('accessibilityLevel')).assertEqual('auto');
      console.info("[SegmentButtonV2Test0010_static_001] component btn0.attrs.accessibilityDescription is: " +
      JSON.stringify(btn0.getElement('$attrs').getString('accessibilityDescription')));
      expect(btn0.getElement('$attrs').getString('accessibilityDescription')).assertEqual('ButtonSearch');
      console.info("[SegmentButtonV2Test0010_static_001] component btn0.attrs.enabled is: " + JSON.stringify(btn0.getElement('$attrs').getString('enabled')));
      expect(btn0.getElement('$attrs').getString('enabled')).assertTrue();
      await CommonFunc.sleep(500);
      let btn1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]
        .getArray("$children")[5]
        .getArray("$children")[1]
      console.info("[SegmentButtonV2Test0010_static_001] component btn1.attrs.accessibilityLevel is: " + JSON.stringify(btn1.getElement('$attrs').getString('accessibilityLevel')));
      expect(btn1.getElement('$attrs').getString('accessibilityLevel')).assertEqual('no');
      console.info("[SegmentButtonV2Test0010_static_001] component btn1.attrs.enabled is: " + JSON.stringify(btn1.getElement('$attrs').getString('enabled')));
      expect(btn1.getElement('$attrs').getString('enabled')).assertFalse();
      await CommonFunc.sleep(500);
      let btn2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]
        .getArray("$children")[5]
        .getArray("$children")[2]
      console.info("[SegmentButtonV2Test0010_static_001] component btn2.getElement('$attrs').accessibilityLevel is: " + JSON.stringify(btn2.getElement('$attrs').getString('accessibilityLevel')));
      expect(btn2.getElement('$attrs').getString('accessibilityLevel')).assertEqual('yes');
      await CommonFunc.sleep(500);
      let btn3 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]
        .getArray("$children")[5]
        .getArray("$children")[3]
      console.info("[SegmentButtonV2Test0010_static_001] component btn3.getElement('$attrs').enabled is: " + JSON.stringify(btn3.getElement('$attrs').getString('enabled')));
      expect(btn3.getElement('$attrs').getString('enabled')).assertTrue();
      console.info("[SegmentButtonV2Test0010_static_001] component btn3.getElement('$attrs').accessibilityLevel is: " + JSON.stringify(btn3.getElement('$attrs').getString('accessibilityLevel')));
      expect(btn3.getElement('$attrs').getString('accessibilityLevel')).assertEqual('no-hide-descendants');
      let text0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]
        .getArray("$children")[5]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[1]
      console.info("[SegmentButtonV2Test0010_static_001] component text0.getElement('$attrs').getString('content') is: " + JSON.stringify(text0.getElement('$attrs').getString('content')));
      expect(text0.getElement('$attrs').getString('content')).assertEqual('search');
      console.info("[SegmentButtonV2Test0010_static_001] component text0.getElement('$attrs').getString('fontColor') is: " + JSON.stringify(text0.getElement('$attrs').getString('fontColor')));
      expect(text0.getElement('$attrs').getString('fontColor')).assertEqual('#FFFFFF00');
      await CommonFunc.sleep(500);
      let text2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]
        .getArray("$children")[5]
        .getArray("$children")[2]
        .getArray("$children")[0]
        .getArray("$children")[1]
      console.info("[SegmentButtonV2Test0010_static_001] component text2.getElement('$attrs').getString('content') is: " + JSON.stringify(text2.getElement('$attrs').getString('content')));
      expect(text2.getElement('$attrs').getString('content')).assertEqual('share');
      await CommonFunc.sleep(500);
      let icon0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]
        .getArray("$children")[5]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.info("[SegmentButtonV2Test0010_static_001] component icon0.getElement('$attrs').src is: " + JSON.stringify(icon0.getElement('$attrs').getString('src')));
      expect(icon0.getElement('$attrs').getString('src')).assertEqual('resource:///125830097.svg');
      console.info("[SegmentButtonV2Test0010_static_001] component icon0.getElement('$attrs').getString('backgroundColor') is: " + JSON.stringify(icon0.getElement('$attrs').getString('backgroundColor')));
      expect(icon0.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFFA500');
      await CommonFunc.sleep(500);
      let icon1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]
        .getArray("$children")[5]
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.info("[SegmentButtonV2Test0010_static_001] component icon1.getElement('$attrs').src is: " + JSON.stringify(icon1.getElement('$attrs').getString('src')));
      expect(icon1.getElement('$attrs').getString('src')).assertEqual('resource:///125830651.svg');
      console.info("[SegmentButtonV2Test0010_static_001] component icon1.getElement('$attrs').getString('backgroundColor') is: " + JSON.stringify(icon1.getElement('$attrs').getString('backgroundColor')));
      expect(icon1.getElement('$attrs').getString('backgroundColor')).assertEqual('#00000000');
      await CommonFunc.sleep(500);
      let symbol3 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]
        .getArray("$children")[5]
        .getArray("$children")[3]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.info("[SegmentButtonV2Test0010_static_001] component symbol3.getElement('$attrs').fontWeight is: " + JSON.stringify(symbol3.getElement('$attrs').getString('fontWeight')));
      expect(symbol3.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Bolder');
      console.info('[SegmentButtonV2Test0010_static_001] END');
      done();
    });

    
    
    
    /**
     * @tc.number   SegmentButtonV2Test0010_static_002
     * @tc.name     SegmentButtonV2Test0010_static_002
     * @tc.desc     SegmentButtonV2Test0010_static_002
     * @tc.level    Level.LEVEL0
     */
it('SegmentButtonV2Test0010_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SegmentButtonV2Test0010_static_002] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let textClick = await driver.findComponent(ON.text("close3"));
      await CommonFunc.sleep(500);
      await (textClick?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey('tvIndex1'));
      console.info("[SegmentButtonV2Test0010] select index is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('2');
      await CommonFunc.sleep(500);
      let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[3]
        .getArray("$children")[0]
        .getArray("$children")[5]
        .getArray("$children")[0]
      console.info("[SegmentButtonV2Test0010_static_002] component btn0.getElement('$attrs').accessibilityText is: " + JSON.stringify(btn0.getElement('$attrs').getString('accessibilityText')));
      expect(btn0.getElement('$attrs').getString('accessibilityText')).assertEqual('close1');
      console.info("[SegmentButtonV2Test0010_static_002] component btn0.getElement('$attrs').accessibilityLevel is: " + JSON.stringify(btn0.getElement('$attrs').getString('accessibilityLevel')));
      expect(btn0.getElement('$attrs').getString('accessibilityLevel')).assertEqual('auto');
      console.info("[SegmentButtonV2Test0010_static_002] component btn0.getElement('$attrs').accessibilityDescription is: " +
      JSON.stringify(btn0.getElement('$attrs').getString('accessibilityDescription')));
      expect(btn0.getElement('$attrs').getString('accessibilityDescription')).assertEqual('ButtonClose1');
      console.info("[SegmentButtonV2Test0010_static_002] component btn0.getElement('$attrs').enabled is: " + JSON.stringify(btn0.getElement('$attrs').getString('enabled')));
      expect(btn0.getElement('$attrs').getString('enabled')).assertTrue();
      await CommonFunc.sleep(500);
      let btn1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[3]
        .getArray("$children")[0]
        .getArray("$children")[5]
        .getArray("$children")[1]
      console.info("[SegmentButtonV2Test0010_static_002] component btn1.getElement('$attrs').accessibilityLevel is: " + JSON.stringify(btn1.getElement('$attrs').getString('accessibilityLevel')));
      expect(btn1.getElement('$attrs').getString('accessibilityLevel')).assertEqual('no-hide-descendants');
      console.info("[SegmentButtonV2Test0010_static_002] component btn1.getElement('$attrs').enabled is: " + JSON.stringify(btn1.getElement('$attrs').getString('enabled')));
      expect(btn1.getElement('$attrs').getString('enabled')).assertFalse();
      await CommonFunc.sleep(500);
      let btn2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[3]
        .getArray("$children")[0]
        .getArray("$children")[5]
        .getArray("$children")[2]
      console.info("[SegmentButtonV2Test0010_static_002] component btn2.getElement('$attrs').accessibilityLevel is: " + JSON.stringify(btn2.getElement('$attrs').getString('accessibilityLevel')));
      expect(btn2.getElement('$attrs').getString('accessibilityLevel')).assertEqual('no');
      await CommonFunc.sleep(500);
      let btn3 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[3]
        .getArray("$children")[0]
        .getArray("$children")[5]
        .getArray("$children")[3]
      console.info("[SegmentButtonV2Test0010_static_002] component btn3.getElement('$attrs').enabled is: " + JSON.stringify(btn3.getElement('$attrs').getString('enabled')));
      expect(btn3.getElement('$attrs').getString('enabled')).assertTrue();
      expect(btn3.getElement('$attrs').getString('accessibilityLevel')).assertEqual('yes');
      let text0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[3]
        .getArray("$children")[0]
        .getArray("$children")[5]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[1]
      console.info("[SegmentButtonV2Test0010_static_002] component text0.getElement('$attrs').getString('content') is: " + JSON.stringify(text0.getElement('$attrs').getString('content')));
      expect(text0.getElement('$attrs').getString('content')).assertEqual('close1');
      console.info("[SegmentButtonV2Test0010_static_002] component text0.getElement('$attrs').getString('fontColor') is: " + JSON.stringify(text0.getElement('$attrs').getString('fontColor')));
      expect(text0.getElement('$attrs').getString('fontColor')).assertEqual('#FFFFFF00');
      await CommonFunc.sleep(500);
      let text2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[3]
        .getArray("$children")[0]
        .getArray("$children")[5]
        .getArray("$children")[2]
        .getArray("$children")[0]
        .getArray("$children")[1]
      console.info("[SegmentButtonV2Test0010_static_002] component text2.getElement('$attrs').getString('content') is: " + JSON.stringify(text2.getElement('$attrs').getString('content')));
      expect(text2.getElement('$attrs').getString('content')).assertEqual('close3');
      await CommonFunc.sleep(500);
      let icon0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[3]
        .getArray("$children")[0]
        .getArray("$children")[5]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.info("[SegmentButtonV2Test0010_static_002] component icon0.getElement('$attrs').src is: " + JSON.stringify(icon0.getElement('$attrs').getString('src')));
      expect(icon0.getElement('$attrs').getString('src')).assertEqual('resource:///125830852.svg');
      console.info("[SegmentButtonV2Test0010_static_002] component icon0.getElement('$attrs').getString('backgroundColor') is: " + JSON.stringify(icon0.getElement('$attrs').getString('backgroundColor')));
      expect(icon0.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFFA500');
      await CommonFunc.sleep(500);
      let icon1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[3]
        .getArray("$children")[0]
        .getArray("$children")[5]
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.info("[SegmentButtonV2Test0010_static_002] component icon1.getElement('$attrs').src is: " + JSON.stringify(icon1.getElement('$attrs').getString('src')));
      expect(icon1.getElement('$attrs').getString('src')).assertEqual('resource:///125830852.svg');
      console.info("[SegmentButtonV2Test0010_static_002] component icon1.getElement('$attrs').getString('backgroundColor') is: " + JSON.stringify(icon1.getElement('$attrs').getString('backgroundColor')));
      expect(icon1.getElement('$attrs').getString('backgroundColor')).assertEqual('#00000000');
      await CommonFunc.sleep(500);
      let symbol3 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[3]
        .getArray("$children")[0]
        .getArray("$children")[5]
        .getArray("$children")[3]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.info("[SegmentButtonV2Test0010_static_002] component symbol3.getElement('$attrs').fontWeight is: " + JSON.stringify(symbol3.getElement('$attrs').getString('fontWeight')));
      expect(symbol3.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Bolder');
      console.info('[SegmentButtonV2Test0010_static_002] END');
      done();
    });
  })
}