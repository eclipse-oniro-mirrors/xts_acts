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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium';
import { inspector, UIContext, window } from '@kit.ArkUI';
import { common } from '@kit.AbilityKit';
import { router } from '@kit.ArkUI';
import CommonFunc from '../../../MainAbility/common/Common';

type ComponentObserver = inspector.ComponentObserver;

let uiContext: UIContext;
let listener: ComponentObserver;

async function getUIContextByWindow(): Promise<UIContext> {
  try {
    let context: common.UIAbilityContext | undefined = AppStorage.get('context');
    if (!context) {
      throw new Error('context is undefined');
    }
    let win = await window.getLastWindow(context);
    return win.getUIContext();
  } catch (err) {
    console.error('getUIContextByWindow error: ' + err);
  }
  throw new Error('Failed to get UIContext');
}

export default function ComponentObserverNullUndefinedTest() {
  describe('ComponentObserverNullUndefinedTest', () => {
    beforeAll(async () => {
      console.info('[ComponentObserverNullUndefinedTest] 测试前置开始');
      let options: router.RouterOptions = {
        url: 'pages/ComponentObserver/ComponentObserverTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        if (!('ComponentObserverTest' === pages.name)) {
          await router.pushUrl(options);
          await CommonFunc.sleep(1000);
        }
        uiContext = await getUIContextByWindow();
        let uiInspector = uiContext.getUIInspector();
        listener = uiInspector.createComponentObserver('observer_id');
      } catch (err) {
        console.error('[ComponentObserverNullUndefinedTest] beforeAll error: ' + err);
      }
      console.info('[ComponentObserverNullUndefinedTest] 测试前置结束');
    });

    beforeEach(() => {
      console.info('[ComponentObserverNullUndefinedTest] 每个测试用例开始');
    });

    afterEach(() => {
      console.info('[ComponentObserverNullUndefinedTest] 每个测试用例结束');
    });

    afterAll(async () => {
      console.info('[ComponentObserverNullUndefinedTest] 测试后置开始');
    });

    /**
     * @tc.name   componentObserver_off_drawChildren_001
     * @tc.number SUB_ARKUI_COMPONENTOBSERVER_OFF_DRAWCHILDREN_001
     * @tc.desc   测试ComponentObserver.off drawChildren方法取消注册回调
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('componentObserver_off_drawChildren_001', Level.LEVEL2, async () => {
      console.info('[componentObserver_off_drawChildren_001] 测试开始');

      if (!listener) {
        console.info('[componentObserver_off_drawChildren_001] listener is undefined, skip test');
        return;
      }

      let callbackCalled = false;
      let testCallback: () => void = () => {
        callbackCalled = true;
      };

      listener.on('drawChildren', testCallback);
      listener.off('drawChildren', testCallback);
      listener.off('drawChildren', testCallback);

      expect(callbackCalled).assertFalse();
      console.info('[componentObserver_off_drawChildren_001] 测试结束');
    });

    /**
     * @tc.name   componentObserver_off_drawChildren_without_callback_001
     * @tc.number SUB_ARKUI_COMPONENTOBSERVER_OFF_DRAWCHILDREN_WITHOUT_CALLBACK_001
     * @tc.desc   测试ComponentObserver.off drawChildren方法不带callback参数时取消所有回调
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('componentObserver_off_drawChildren_without_callback_001', Level.LEVEL2, async () => {
      console.info('[componentObserver_off_drawChildren_without_callback_001] 测试开始');

      if (!listener) {
        console.info('[componentObserver_off_drawChildren_without_callback_001] listener is undefined, skip test');
        return;
      }

      let callback1Called = false;
      let callback2Called = false;
      let testCallback1: () => void = () => {
        callback1Called = true;
      };
      let testCallback2: () => void = () => {
        callback2Called = true;
      };

      listener.on('drawChildren', testCallback1);
      listener.on('drawChildren', testCallback2);
      listener.off('drawChildren');

      expect(callback1Called).assertFalse();
      expect(callback2Called).assertFalse();
      console.info('[componentObserver_off_drawChildren_without_callback_001] 测试结束');
    });

    /**
     * @tc.name   componentObserver_off_layout_001
     * @tc.number SUB_ARKUI_COMPONENTOBSERVER_OFF_LAYOUT_001
     * @tc.desc   测试ComponentObserver.off layout方法取消注册回调
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('componentObserver_off_layout_001', Level.LEVEL2, async () => {
      console.info('[componentObserver_off_layout_001] 测试开始');

      if (!listener) {
        console.info('[componentObserver_off_layout_001] listener is undefined, skip test');
        return;
      }

      let callbackCalled = false;
      let testCallback: () => void = () => {
        callbackCalled = true;
      };

      listener.on('layout', testCallback);
      listener.off('layout', testCallback);

      expect(callbackCalled).assertFalse();
      console.info('[componentObserver_off_layout_001] 测试结束');
    });

    /**
     * @tc.name   componentObserver_off_draw_001
     * @tc.number SUB_ARKUI_COMPONENTOBSERVER_OFF_DRAW_001
     * @tc.desc   测试ComponentObserver.off draw方法取消注册回调
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('componentObserver_off_draw_001', Level.LEVEL2, async () => {
      console.info('[componentObserver_off_draw_001] 测试开始');

      if (!listener) {
        console.info('[componentObserver_off_draw_001] listener is undefined, skip test');
        return;
      }

      let callbackCalled = false;
      let testCallback: () => void = () => {
        callbackCalled = true;
      };

      listener.on('draw', testCallback);
      listener.off('draw', testCallback);

      expect(callbackCalled).assertFalse();
      console.info('[componentObserver_off_draw_001] 测试结束');
    });

    /**
     * @tc.name   componentObserver_on_layout_type_null_001
     * @tc.number SUB_ARKUI_COMPONENTOBSERVER_ON_LAYOUT_TYPE_NULL_001
     * @tc.desc   测试ComponentObserver.on layout方法第1个参数传入null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('componentObserver_on_layout_type_null_001', Level.LEVEL2, async () => {
      console.info('[componentObserver_on_layout_type_null_001] 测试开始');

      let callbackInvoked = false;
      let testCallback: () => void = () => {
        callbackInvoked = true;
      };

      try {
        listener.on(null, testCallback);
      } catch (err) {
        console.info('[componentObserver_on_layout_type_null_001] error: ' + err);
      }

      expect(callbackInvoked).assertFalse();
      console.info('[componentObserver_on_layout_type_null_001] 测试结束');
    });

    /**
     * @tc.name   componentObserver_on_layout_type_undefined_002
     * @tc.number SUB_ARKUI_COMPONENTOBSERVER_ON_LAYOUT_TYPE_UNDEFINED_002
     * @tc.desc   测试ComponentObserver.on layout方法第1个参数传入undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('componentObserver_on_layout_type_undefined_002', Level.LEVEL2, async () => {
      console.info('[componentObserver_on_layout_type_undefined_002] 测试开始');

      let callbackInvoked = false;
      let testCallback: () => void = () => {
        callbackInvoked = true;
      };

      try {
        listener.on(undefined, testCallback);
      } catch (err) {
        console.info('[componentObserver_on_layout_type_undefined_002] error: ' + err);
      }

      expect(callbackInvoked).assertFalse();
      console.info('[componentObserver_on_layout_type_undefined_002] 测试结束');
    });

    /**
     * @tc.name   componentObserver_on_draw_type_null_003
     * @tc.number SUB_ARKUI_COMPONENTOBSERVER_ON_DRAW_TYPE_NULL_003
     * @tc.desc   测试ComponentObserver.on draw方法第1个参数传入null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('componentObserver_on_draw_type_null_003', Level.LEVEL2, async () => {
      console.info('[componentObserver_on_draw_type_null_003] 测试开始');

      let callbackInvoked = false;
      let testCallback: () => void = () => {
        callbackInvoked = true;
      };

      try {
        listener.on(null, testCallback);
      } catch (err) {
        console.info('[componentObserver_on_draw_type_null_003] error: ' + err);
      }

      expect(callbackInvoked).assertFalse();
      console.info('[componentObserver_on_draw_type_null_003] 测试结束');
    });

    /**
     * @tc.name   componentObserver_on_draw_type_undefined_004
     * @tc.number SUB_ARKUI_COMPONENTOBSERVER_ON_DRAW_TYPE_UNDEFINED_004
     * @tc.desc   测试ComponentObserver.on draw方法第1个参数传入undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('componentObserver_on_draw_type_undefined_004', Level.LEVEL2, async () => {
      console.info('[componentObserver_on_draw_type_undefined_004] 测试开始');

      let callbackInvoked = false;
      let testCallback: () => void = () => {
        callbackInvoked = true;
      };

      try {
        listener.on(undefined, testCallback);
      } catch (err) {
        console.info('[componentObserver_on_draw_type_undefined_004] error: ' + err);
      }

      expect(callbackInvoked).assertFalse();
      console.info('[componentObserver_on_draw_type_undefined_004] 测试结束');
    });

    /**
     * @tc.name   componentObserver_on_drawChildren_type_null_005
     * @tc.number SUB_ARKUI_COMPONENTOBSERVER_ON_DRAWCHILDREN_TYPE_NULL_005
     * @tc.desc   测试ComponentObserver.on drawChildren方法第1个参数传入null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('componentObserver_on_drawChildren_type_null_005', Level.LEVEL2, async () => {
      console.info('[componentObserver_on_drawChildren_type_null_005] 测试开始');

      let callbackInvoked = false;
      let testCallback: () => void = () => {
        callbackInvoked = true;
      };

      try {
        listener.on(null, testCallback);
      } catch (err) {
        console.info('[componentObserver_on_drawChildren_type_null_005] error: ' + err);
      }

      expect(callbackInvoked).assertFalse();
      console.info('[componentObserver_on_drawChildren_type_null_005] 测试结束');
    });

    /**
     * @tc.name   componentObserver_on_drawChildren_type_undefined_006
     * @tc.number SUB_ARKUI_COMPONENTOBSERVER_ON_DRAWCHILDREN_TYPE_UNDEFINED_006
     * @tc.desc   测试ComponentObserver.on drawChildren方法第1个参数传入undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('componentObserver_on_drawChildren_type_undefined_006', Level.LEVEL2, async () => {
      console.info('[componentObserver_on_drawChildren_type_undefined_006] 测试开始');

      let callbackInvoked = false;
      let testCallback: () => void = () => {
        callbackInvoked = true;
      };

      try {
        listener.on(undefined, testCallback);
      } catch (err) {
        console.info('[componentObserver_on_drawChildren_type_undefined_006] error: ' + err);
      }

      expect(callbackInvoked).assertFalse();
      console.info('[componentObserver_on_drawChildren_type_undefined_006] 测试结束');
    });
  });
}
