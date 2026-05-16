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
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation,
  ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import router from '@ohos.router';
import { beforeEach, describe, expect, it, Level, beforeAll, afterEach } from '../../../../hypium/index';
import { i18n } from '@kit.LocalizationKit';
import display from '@ohos.display';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test'
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BorderRadiuses } from '@ohos.arkui.component'


export default function SegmentButtonBorderTest() {
  describe('SegmentButtonBorderTest', () => {

    beforeAll(() => {
      console.info("SegmentButtonBorderTest beforeEach start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.nowear.test.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info("SegmentButtonBorderTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/segmentButton/SegmentButtonBorder",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("SegmentButtonBorder" == pages.name)) {
          console.info("get SegmentButtonBorderTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SegmentButtonBorderTest page error:" + err);
      }
      console.info("SegmentButtonBorderTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SegmentButtonBorderTest after each called");
    });

    
    
    /**
     * @tc.number   SegmentButtonBorderTest_static_001
     * @tc.name     SegmentButtonBorderTest_static_001
     * @tc.desc     SegmentButtonBorderTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('SegmentButtonBorderTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SegmentButtonBorderTest_static_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[1]
        .getArray('$children')[0]
      console.info("[SegmentButtonBorderTest_static_001_1] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('borderRadius')).assertEqual('14.00vp');
      await CommonFunc.sleep(1000);
      let obj2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[1]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
      console.info("[SegmentButtonBorderTest_static_001_2]  component obj is: " + JSON.stringify(obj2));
      // expect(obj2.$attrs.borderRadius).assertEqual('12.00vp');
      expect(JSON.stringify(obj2.getElement('$attrs').getElement('borderRadius'))).assertEqual(JSON.stringify({
        topLeft: "12.00vp",
        topRight: "12.00vp",
        bottomLeft: "12.00vp",
        bottomRight: "12.00vp"
      } as BorderRadiuses));
      console.info('[SegmentButtonBorderTest_static_001] END');
      done();
    });

    
    
    /**
     * @tc.number   SegmentButtonBorderTest_static_002
     * @tc.name     SegmentButtonBorderTest_static_002
     * @tc.desc     SegmentButtonBorderTest_static_002
     * @tc.level    Level.LEVEL0
     */
it('SegmentButtonBorderTest_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SegmentButtonBorderTest_static_002] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let obj3 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[3]
        .getArray('$children')[0]
      console.info("[SegmentButtonBorderTest_static_002_1] component obj is: " + JSON.stringify(obj3));
      expect(obj3.getElement('$attrs').getString('borderRadius')).assertEqual('20.00vp');
      await CommonFunc.sleep(1000);
      let obj4 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[3]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
      console.info("[SegmentButtonBorderTest_static_002_2] component obj is: " + JSON.stringify(obj4));
      // expect(obj4.$attrs.borderRadius).assertEqual('20.00vp');
      expect(JSON.stringify(obj4.getElement('$attrs').getElement('borderRadius'))).assertEqual(JSON.stringify({
        topLeft: "18.00vp",
        topRight: "18.00vp",
        bottomLeft: "18.00vp",
        bottomRight: "18.00vp"
      } as BorderRadiuses));
      console.info('[SegmentButtonBorderTest_static_002] END');
      done();
    });
  })
}