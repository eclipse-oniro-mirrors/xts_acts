'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { KeyCode } from '@ohos.multimodalInput.keyCode';

export default function AttributeModifierDemoAPI02Jsunit() {
  describe('AttributeModifierDemoAPI02Jsunit', () => {
    beforeAll(() => {
      console.info("AttributeModifierDemoAPI02Jsunit beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.commonAttrsOther.nowear.api11.static", "EntryAbility")

    });
    beforeEach(async (): Promise<void> => {
      console.info("AttributeModifierDemoAPI02Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/attributeModifier/AttributeModifierDemoAPI02',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AttributeModifierDemoAPI02Jsunit state pages:" + JSON.stringify(pages));
        if (!("AttributeModifierDemoAPI02" == pages.name)) {
          console.info("get AttributeModifierDemoAPI02Jsunit state pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push AttributeModifierDemoAPI02Jsunit page error:" + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   AttributeModifierDemoAPI02Jsunit_static_0100
     * @tc.name     AttributeModifierDemoAPI02Jsunit_static_0100
     * @tc.desc     AttributeModifierDemoAPI02Jsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('AttributeModifierDemoAPI02Jsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('AttributeModifierDemoAPI02Jsunit_static_0100 START');

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2049)
      await CommonFunc.sleep(5000);

      let strcontent = inspector.getInspectorByKey('AttributeModifierDemoAPI02ButtonFocus');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strcontent);
      console.info('AttributeModifierDemoAPI02Jsunit_static_0100 component obj.backgroundColor is: ' +
      obj.getElement('$attrs').getString('backgroundColor'));
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual("#FF209B08");
      console.info('AttributeModifierDemoAPI02Jsunit_static_0100 END')
      done();
    });

  })
}