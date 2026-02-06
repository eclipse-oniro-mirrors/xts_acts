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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level, TestType, Size } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import deviceInfo from "@ohos.deviceInfo"
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
export default function MaxwidthTest() {
  describe('MaxwidthTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.dialog.api16.static", "EntryAbility")
    })

    beforeEach(async () => {
      console.info('MaxwidthTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Popup/Maxwidth',
      }
      try {
        const OpenDialogTransitionTest = AppStorage.get<Router>("router") as Router
        OpenDialogTransitionTest.clear();
        let pages = OpenDialogTransitionTest.getState();
        console.info('get MaxwidthTest state pages:' + JSON.stringify(pages));
        if (!('Maxwidth' == pages.name)) {
          console.info('get MaxwidthTest pages.name:' + JSON.stringify(pages.name));
          OpenDialogTransitionTest.pushUrl(options);
          await UtilsTest.msSleep(2500);
        }
      } catch (err) {
        console.error('push MaxwidthTest page error:' + err);
      }
      console.info('MaxwidthTest beforeEach end');
    });

    
    /**
     * @tc.number   popup_maxWidth_static_0101
     * @tc.name     popup_maxWidth_static_0101
     * @tc.desc     popup_maxWidth_static_0101
     * @tc.level    Level.LEVEL2
     */
it('popup_maxWidth_static_0101', Level.LEVEL2, async (done: () => void): Promise<void> => {
        console.info('popup_maxWidth_static_0101 START');
        await CommonFunc.sleep(1000);
        inspector.sendEventByKey('PopupApi1_btn1',10,"")
        await CommonFunc.sleep(1000);
        console.info('popup_maxWidth_static_0101 click after')
        let text = inspector.getInspectorByKey('PopupApi1_text1');
        expect(JSON.stringify(JSON.parseJsonElement(text).getElement('$attrs').getString('content'))).assertEqual('\"300.00vp\"');
        await CommonFunc.sleep(1000);
        console.info('popup_maxWidth_0100 END');
        done();
      });


    
    /**
     * @tc.number   popup_maxWidth_static_0102
     * @tc.name     popup_maxWidth_static_0102
     * @tc.desc     popup_maxWidth_static_0102
     * @tc.level    Level.LEVEL2
     */
it('popup_maxWidth_static_0102', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('popup_maxWidth_static_0102 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      console.info("popup_maxWidth_static_0102 driver success");
      let size = await driver.getDisplaySize();
      console.info("popup_maxWidth_static_0102 size state:" + JSON.stringify(size.x));
      let displayWidth = UIContext.resolveUIContext()!.vp2px(size.x);
      console.info("popup_maxWidth_static_0102 displayWidth state:" + JSON.stringify(displayWidth));
      inspector.sendEventByKey('PopupApi1_btn2', 10, "");
      await CommonFunc.sleep(1000);
      console.info('popup_maxWidth_static_0102 click after');
      let text = inspector.getInspectorByKey('PopupApi1_text2');
      console.log('popup_maxWidth_static_0102 click after text' + text);
      if (displayWidth < 400) {
        expect(JSON.stringify(JSON.parseJsonElement(text).getElement('$attrs').getString('content')))
          .assertEqual(JSON.stringify(displayWidth.toFixed(2).toString() + 'vp'))
      } else {
        expect(JSON.stringify(JSON.parseJsonElement(text).getElement('$attrs').getString('content')))
          .assertEqual('\"400.00vp\"');
      }
      await CommonFunc.sleep(1000);
      console.info('popup_maxWidth_static_0102 END');
      done();
    });


    
    /**
     * @tc.number   popup_maxWidth_static_0103
     * @tc.name     popup_maxWidth_static_0103
     * @tc.desc     popup_maxWidth_static_0103
     * @tc.level    Level.LEVEL2
     */
it('popup_maxWidth_static_0103', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('popup_maxWidth_static_0103 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      console.info("popup_maxWidth_static_0103 driver success");
      let size = await driver.getDisplaySize();
      console.info("popup_maxWidth_static_0103 size state:" + JSON.stringify(size.x));
      let displayWidth = UIContext.resolveUIContext()!.vp2px(size.x);
      console.info("popup_maxWidth_static_0103 displayWidth state:" + JSON.stringify(displayWidth));
      inspector.sendEventByKey('PopupApi1_btn3', 10, "");
      await CommonFunc.sleep(1000);
      console.info('popup_maxWidth_static_0103 click after');
      let text = inspector.getInspectorByKey('PopupApi1_text3');
      if (displayWidth < 400) {
        expect(JSON.stringify(JSON.parseJsonElement(text).getElement('$attrs').getString('content')))
          .assertEqual(JSON.stringify(displayWidth.toFixed(2).toString() + 'vp'))
      } else {
        expect(JSON.stringify(JSON.parseJsonElement(text).getElement('$attrs').getString('content')))
          .assertEqual('\"400.00vp\"');
      }
      await CommonFunc.sleep(1000);
      console.info('popup_maxWidth_static_0103 END');
      done();
    });
  })
}
