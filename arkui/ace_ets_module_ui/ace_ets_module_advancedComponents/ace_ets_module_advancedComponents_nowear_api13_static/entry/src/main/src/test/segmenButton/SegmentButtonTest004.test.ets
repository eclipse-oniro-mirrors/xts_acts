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

import {Driver, Component, UiWindow, ON,  MatchPattern, DisplayRotation,
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

export default function SegmentButtonTest004() {
  describe('SegmentButton004', () => {

    beforeAll(() => {
      console.info("SegmentButton004 beforeEach start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.nowear.api13.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info("SegmentButton004 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/segmentButton/SegmentButton004",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("SegmentButton004" == pages.name)) {
          console.info("get SegmentButton004 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SegmentButton004 page error:" + err);
      }
      console.info("SegmentButton004 beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SegmentButton004 after each called");
    });

    
    
    /**
     * @tc.number   SegmentButtonTest004_static_001
     * @tc.name     SegmentButtonTest004_static_001
     * @tc.desc     SegmentButtonTest004_static_001
     * @tc.level    Level.LEVEL1
     */
it('SegmentButtonTest004_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SegmentButtonTest004_static_001] START');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[2]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
      console.info("[SegmentButtonTest004_static_001] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('accessibilityText')).assertEqual('notSelect');
      console.info('[SegmentButtonTest004_static_001] END');
      done();
    });

    
    
    /**
     * @tc.number   SegmentButtonTest004_static_002
     * @tc.name     SegmentButtonTest004_static_002
     * @tc.desc     SegmentButtonTest004_static_002
     * @tc.level    Level.LEVEL1
     */
it('SegmentButtonTest004_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SegmentButtonTest004_static_002] START');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[2]
        .getArray('$children')[1]
        .getArray('$children')[0]
        .getArray('$children')[0]
      console.info("[SegmentButtonTest004_static_002] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('accessibilityText')).assertEqual('select');
      console.info('[SegmentButtonTest004_static_002] END');
      done();
    });
    
    
    /**
     * @tc.number   SegmentButtonTest004_static_003
     * @tc.name     SegmentButtonTest004_static_003
     * @tc.desc     SegmentButtonTest004_static_003
     * @tc.level    Level.LEVEL1
     */
it('SegmentButtonTest004_static_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SegmentButtonTest004_static_003] START');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[2]
        .getArray('$children')[0]
      console.info("[SegmentButtonTest004_static_003] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('accessibilityLevel')).assertEqual('yes');
      console.info('[SegmentButtonTest004_static_003] END');
      done();
    });
    
    
    /**
     * @tc.number   SegmentButtonTest004_static_004
     * @tc.name     SegmentButtonTest004_static_004
     * @tc.desc     SegmentButtonTest004_static_004
     * @tc.level    Level.LEVEL1
     */
it('SegmentButtonTest004_static_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SegmentButtonTest004_static_004] START');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[0]
        .getArray('$children')[2]
        .getArray('$children')[0]
      console.info("[SegmentButtonTest004_static_004] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('accessibilityDescription')).assertEqual('SegmentButtonIconTextItem');
      console.info('[SegmentButtonTest004_static_004] END');
      done();
    });
  })
}
