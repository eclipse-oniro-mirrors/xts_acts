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
import { inspector } from '@kit.ArkUI';
import { router } from '@kit.ArkUI';
import CommonFunc from '../../../MainAbility/common/Common';

type ComponentObserver = inspector.ComponentObserver;

export default function inspectorCreateComponentObserverNullUndefinedTest() {
  describe('InspectorCreateComponentObserverNullUndefinedTest', () => {
    beforeAll(async () => {
      let options: router.RouterOptions = {
        url: 'pages/inspector/InspectorCreateComponentObserverNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        if (!('InspectorCreateComponentObserverNullUndefined' === pages.name)) {
          await router.pushUrl(options);
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error('push InspectorCreateComponentObserverNullUndefined page error:' + err);
      }
    });

    beforeEach(() => {
    });

    afterEach(() => {
    });

    afterAll(async () => {
    });

    /**
     * @tc.name   inspector_createComponentObserver_id_null_001
     * @tc.number SUB_ARKUI_INSPECTOR_CREATECOMPONENTSERVER_ID_NULL_001
     * @tc.desc   测试inspector.createComponentObserver第1个参数传入null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('inspector_createComponentObserver_id_null_001', Level.LEVEL2, async () => {
      console.info('[inspector_createComponentObserver_id_null_001] 测试开始');

      let listener: ComponentObserver | null = null;
      try {
        listener = inspector.createComponentObserver(null);
      } catch (err) {
        console.info('[inspector_createComponentObserver_id_null_001] error: ' + err);
      }

      expect(listener === null).assertTrue();
      console.info('[inspector_createComponentObserver_id_null_001] 测试结束');
    });

    /**
     * @tc.name   inspector_createComponentObserver_id_undefined_002
     * @tc.number SUB_ARKUI_INSPECTOR_CREATECOMPONENTSERVER_ID_UNDEFINED_002
     * @tc.desc   测试inspector.createComponentObserver第1个参数传入undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('inspector_createComponentObserver_id_undefined_002', Level.LEVEL2, async () => {
      console.info('[inspector_createComponentObserver_id_undefined_002] 测试开始');

      let listener: ComponentObserver | null = null;
      try {
        listener = inspector.createComponentObserver(undefined);
      } catch (err) {
        console.info('[inspector_createComponentObserver_id_undefined_002] error: ' + err);
      }

      expect(listener === null).assertTrue();
      console.info('[inspector_createComponentObserver_id_undefined_002] 测试结束');
    });

    /**
     * @tc.name   inspector_createComponentObserver_id_empty_003
     * @tc.number SUB_ARKUI_INSPECTOR_CREATECOMPONENTSERVER_ID_EMPTY_003
     * @tc.desc   测试inspector.createComponentObserver第1个参数传入空字符串
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('inspector_createComponentObserver_id_empty_003', Level.LEVEL2, async () => {
      console.info('[inspector_createComponentObserver_id_empty_003] 测试开始');

      let listener: ComponentObserver | null = null;
      try {
        listener = inspector.createComponentObserver('');
      } catch (err) {
        console.info('[inspector_createComponentObserver_id_empty_003] error: ' + err);
      }

      expect(listener !== null).assertTrue();
      console.info('[inspector_createComponentObserver_id_empty_003] 测试结束');
    });
  });
}
