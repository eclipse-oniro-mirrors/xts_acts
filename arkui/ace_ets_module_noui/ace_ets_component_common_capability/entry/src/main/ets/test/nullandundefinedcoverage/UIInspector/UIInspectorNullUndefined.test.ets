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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { UIInspector, inspector, UIContext, window } from '@kit.ArkUI';
import { common } from '@kit.AbilityKit';
import { router } from '@kit.ArkUI';
import CommonFunc from '../../../MainAbility/common/Common';

type ComponentObserver = inspector.ComponentObserver;

let uiContext: UIContext;
let uiInspector: UIInspector;

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

export default function UIInspectorNullUndefinedTest() {
  describe('UIInspectorNullUndefinedTest', () => {
    beforeAll(async () => {
      let options: router.RouterOptions = {
        url: 'pages/UIInspector/UIInspectorNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        if (!('UIInspectorNullUndefined' === pages.name)) {
          await router.pushUrl(options);
          await CommonFunc.sleep(1000);
        }
        uiContext = await getUIContextByWindow();
        uiInspector = uiContext.getUIInspector();
      } catch (err) {
        console.error('push UIInspectorNullUndefined page error:' + err);
      }
    });

    beforeEach(() => {
    });

    afterEach(() => {
    });

    afterAll(async () => {
    });

    /**
     * @tc.name   UIInspector_createComponentObserver_id_null_001
     * @tc.number SUB_ARKUI_UIINSPECTOR_CREATECOMPONENTSERVER_ID_NULL_001
     * @tc.desc   测试UIInspector.createComponentObserver第1个参数传入null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIInspector_createComponentObserver_id_null_001', Level.LEVEL2, async () => {
      console.info('[UIInspector_createComponentObserver_id_null_001] 测试开始');

      let listener: ComponentObserver | null = null;
      try {
        listener = uiInspector.createComponentObserver(null);
      } catch (err) {
        console.info('[UIInspector_createComponentObserver_id_null_001] error: ' + err);
      }

      expect(listener === null).assertTrue();
      console.info('[UIInspector_createComponentObserver_id_null_001] 测试结束');
    });

    /**
     * @tc.name   UIInspector_createComponentObserver_id_undefined_002
     * @tc.number SUB_ARKUI_UIINSPECTOR_CREATECOMPONENTSERVER_ID_UNDEFINED_002
     * @tc.desc   测试UIInspector.createComponentObserver第1个参数传入undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIInspector_createComponentObserver_id_undefined_002', Level.LEVEL2, async () => {
      console.info('[UIInspector_createComponentObserver_id_undefined_002] 测试开始');

      let listener: ComponentObserver | null = null;
      try {
        listener = uiInspector.createComponentObserver(undefined);
      } catch (err) {
        console.info('[UIInspector_createComponentObserver_id_undefined_002] error: ' + err);
      }

      expect(listener === null).assertTrue();
      console.info('[UIInspector_createComponentObserver_id_undefined_002] 测试结束');
    });

    /**
     * @tc.name   UIInspector_createComponentObserver_id_empty_003
     * @tc.number SUB_ARKUI_UIINSPECTOR_CREATECOMPONENTSERVER_ID_EMPTY_003
     * @tc.desc   测试UIInspector.createComponentObserver第1个参数传入空字符串
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('UIInspector_createComponentObserver_id_empty_003', Level.LEVEL2, async () => {
      console.info('[UIInspector_createComponentObserver_id_empty_003] 测试开始');

      let listener: ComponentObserver | null = null;
      try {
        listener = uiInspector.createComponentObserver('');
      } catch (err) {
        console.info('[UIInspector_createComponentObserver_id_empty_003] error: ' + err);
      }

      expect(listener == null).assertTrue();
      console.info('[UIInspector_createComponentObserver_id_empty_003] 测试结束');
    });
  });
}
