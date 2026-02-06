/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { ResolveStrategy } from '@ohos.arkui.UIContext';

export default function GetUIContextTest() {
  describe('GetUIContextTest', () => {
    beforeEach(async (done: Function) => {
      console.info("GetUIContextTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getUIContext/GetUIContextTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GetUIContextTest state pages:" + JSON.stringify(pages));
        let result = await router.pushUrl(options);
        if (!("gestureEventTest" == pages.name)) {
          console.info("get GetUIContextTest pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push GetUIContextTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GetUIContextTest page error:" + err);
      }
      console.info("GetUIContextTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("GetUIContextTest after each called");
    });

    /**
     * @tc.name   GetUIContextTest_0100
     * @tc.number GetUIContextTest_0100
     * @tc.desc   getUIContext test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetUIContextTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('GetUIContextTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_resolvedUIContext'));
      await button.click();
      await CommonFunc.sleep(1000);

      console.info('ResolveStrategy.CALLING_SCOPE :' + ResolveStrategy.CALLING_SCOPE);
      console.info('ResolveStrategy.LAST_FOCUS :' + ResolveStrategy.LAST_FOCUS);
      console.info('ResolveStrategy.MAX_INSTANCE_ID :' + ResolveStrategy.MAX_INSTANCE_ID);
      console.info('ResolveStrategy.UNIQUE :' + ResolveStrategy.UNIQUE);
      console.info('ResolveStrategy.LAST_FOREGROUND :' + ResolveStrategy.LAST_FOREGROUND);
      console.info('ResolveStrategy.UNDEFINED :' + ResolveStrategy.UNDEFINED);
      expect(ResolveStrategy.CALLING_SCOPE).assertEqual(0);
      expect(ResolveStrategy.LAST_FOCUS).assertEqual(1);
      expect(ResolveStrategy.MAX_INSTANCE_ID).assertEqual(2);
      expect(ResolveStrategy.UNIQUE).assertEqual(3);
      expect(ResolveStrategy.LAST_FOREGROUND).assertEqual(4);
      expect(ResolveStrategy.UNDEFINED).assertEqual(5);
      
      expect(AppStorage.get('getAllUIContextsNull')).assertEqual(0);
      expect(AppStorage.get('getCallingScopeUIContextUndefined')).assertEqual(undefined);
      expect(AppStorage.get('getLastFocusedUIContextUndefined')).assertEqual(undefined);
      expect(AppStorage.get('getLastForegroundUIContextUndefined')).assertEqual(undefined);
      console.info('resolveUIContextStrategy5 :' + AppStorage.get('resolveUIContextStrategy5'));
      console.info('resolveUIContextStrategy3 :' + AppStorage.get('resolveUIContextStrategy3'));
      console.info('resolveUIContextStrategy0 :' + AppStorage.get('resolveUIContextStrategy0'));
      expect(AppStorage.get('resolveUIContextStrategy5')).assertEqual(ResolveStrategy.UNDEFINED);
      expect(AppStorage.get('resolveUIContextStrategy3')).assertEqual(ResolveStrategy.UNIQUE);
      expect(AppStorage.get('resolveUIContextStrategy0')).assertEqual(ResolveStrategy.CALLING_SCOPE);
      expect(AppStorage.get('resolveUIContextStrategy1')).assertEqual(ResolveStrategy.LAST_FOCUS);

      AppStorage.delete('getAllUIContextsNull');
      AppStorage.delete('getCallingScopeUIContextUndefined');
      AppStorage.delete('getLastFocusedUIContextUndefined');
      AppStorage.delete('getLastForegroundUIContextUndefined');
      AppStorage.delete('resolveUIContextStrategy5');
      AppStorage.delete('resolveUIContextStrategy3');
      AppStorage.delete('resolveUIContextStrategy0');
      AppStorage.delete('resolveUIContextStrategy1');

      console.info('[GetUIContextTest_0100] END');
      done();
    });

  })
}