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
import { router } from '@kit.ArkUI';
import { pluginComponentManager, PluginComponentTemplate } from '@kit.ArkUI';
import { Want } from '@kit.AbilityKit';
import CommonFunc from '../../../MainAbility/common/Common';

type KVObject = Record<string, Object>;

class CallbackTracker {
  static pushCallbackInvoked: boolean = false;
  static requestCallbackInvoked: boolean = false;
  static requestCallbackError: string = '';
}

function onPushListener(source: Want, template: PluginComponentTemplate, data: KVObject, extraData: KVObject): void {
  CallbackTracker.pushCallbackInvoked = true;
  console.info('test onPushListener called');
}

function onRequestListener(source: Want, name: string, data: KVObject): Record<string, string | KVObject> {
  CallbackTracker.requestCallbackInvoked = true;
  let result: Record<string, string | KVObject> = {
    'template': 'testTemplate',
    'data': data,
  };
  return result;
}

export default function pluginComponentManagerNullUndefinedTest() {
  describe('PluginComponentManagerNullUndefinedTest', () => {
    beforeAll(async () => {
      let options: router.RouterOptions = {
        url: 'pages/pluginComponentManager/PluginComponentManagerNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        if (!('PluginComponentManagerNullUndefined' === pages.name)) {
          await router.pushUrl(options);
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error('push PluginComponentManagerNullUndefined page error:' + err);
      }
    });

    beforeEach(() => {
      CallbackTracker.pushCallbackInvoked = false;
      CallbackTracker.requestCallbackInvoked = false;
      CallbackTracker.requestCallbackError = '';
    });

    afterEach(() => {
    });

    afterAll(async () => {
    });

    /**
     * @tc.name   pluginComponentManager_on_eventType_null_001
     * @tc.number SUB_ARKUI_PLUGCOMPONENT_ON_EVENTTYPE_NULL_001
     * @tc.desc   测试pluginComponentManager.on第1个参数传入null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('pluginComponentManager_on_eventType_null_001', Level.LEVEL2, async () => {
      let testResult: boolean = false;
      try {
        pluginComponentManager.on(null, onPushListener);
        await CommonFunc.sleep(500);
        testResult = CallbackTracker.pushCallbackInvoked;
      } catch (err) {
        console.info('[pluginComponentManager_on_eventType_null_001] error: ' + err);
        CallbackTracker.requestCallbackError = err.toString();
      }
      expect(testResult).assertFalse();
    });

    /**
     * @tc.name   pluginComponentManager_on_eventType_undefined_002
     * @tc.number SUB_ARKUI_PLUGCOMPONENT_ON_EVENTTYPE_UNDEFINED_002
     * @tc.desc   测试pluginComponentManager.on第1个参数传入undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('pluginComponentManager_on_eventType_undefined_002', Level.LEVEL2, async () => {
      let testResult: boolean = false;
      try {
        pluginComponentManager.on(undefined, onPushListener);
        await CommonFunc.sleep(500);
        testResult = CallbackTracker.pushCallbackInvoked;
      } catch (err) {
        console.info('[pluginComponentManager_on_eventType_undefined_002] error: ' + err);
        CallbackTracker.requestCallbackError = err.toString();
      }
      expect(testResult).assertFalse();
    });

    /**
     * @tc.name   pluginComponentManager_on_eventType_empty_003
     * @tc.number SUB_ARKUI_PLUGCOMPONENT_ON_EVENTTYPE_EMPTY_003
     * @tc.desc   测试pluginComponentManager.on第1个参数传入空字符串
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('pluginComponentManager_on_eventType_empty_003', Level.LEVEL2, async () => {
      let testResult: boolean = false;
      try {
        pluginComponentManager.on('', onPushListener);
        await CommonFunc.sleep(500);
        testResult = CallbackTracker.pushCallbackInvoked;
      } catch (err) {
        console.info('[pluginComponentManager_on_eventType_empty_003] error: ' + err);
        CallbackTracker.requestCallbackError = err.toString();
      }
      expect(testResult).assertFalse();
    });

    /**
     * @tc.name   pluginComponentManager_on_callback_null_004
     * @tc.number SUB_ARKUI_PLUGCOMPONENT_ON_CALLBACK_NULL_004
     * @tc.desc   测试pluginComponentManager.on第2个参数传入null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('pluginComponentManager_on_callback_null_004', Level.LEVEL2, async () => {
      let testResult: boolean = false;
      try {
        pluginComponentManager.on('push', null);
        await CommonFunc.sleep(500);
        testResult = CallbackTracker.pushCallbackInvoked;
      } catch (err) {
        console.info('[pluginComponentManager_on_callback_null_004] error: ' + err);
        CallbackTracker.requestCallbackError = err.toString();
      }
      expect(testResult).assertFalse();
    });

    /**
     * @tc.name   pluginComponentManager_on_callback_undefined_005
     * @tc.number SUB_ARKUI_PLUGCOMPONENT_ON_CALLBACK_UNDEFINED_005
     * @tc.desc   测试pluginComponentManager.on第2个参数传入undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('pluginComponentManager_on_callback_undefined_005', Level.LEVEL2, async () => {
      let testResult: boolean = false;
      try {
        pluginComponentManager.on('push', undefined);
        await CommonFunc.sleep(500);
        testResult = CallbackTracker.pushCallbackInvoked;
      } catch (err) {
        console.info('[pluginComponentManager_on_callback_undefined_005] error: ' + err);
        CallbackTracker.requestCallbackError = err.toString();
      }
      expect(testResult).assertFalse();
    });

    /**
     * @tc.name   pluginComponentManager_request_param_null_006
     * @tc.number SUB_ARKUI_PLUGCOMPONENT_REQUEST_PARAM_NULL_006
     * @tc.desc   测试pluginComponentManager.request第1个参数传入null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('pluginComponentManager_request_param_null_006', Level.LEVEL2, async () => {
      let testResult: boolean = false;
      try {
        pluginComponentManager.request(null, (err, data) => {
          if (err) {
            CallbackTracker.requestCallbackError = err.toString();
          }
          CallbackTracker.requestCallbackInvoked = true;
        });
        await CommonFunc.sleep(1000);
        testResult = CallbackTracker.requestCallbackInvoked;
      } catch (err) {
        console.info('[pluginComponentManager_request_param_null_006] error: ' + err);
        CallbackTracker.requestCallbackError = err.toString();
      }
      expect(testResult).assertFalse();
    });

    /**
     * @tc.name   pluginComponentManager_request_param_undefined_007
     * @tc.number SUB_ARKUI_PLUGCOMPONENT_REQUEST_PARAM_UNDEFINED_007
     * @tc.desc   测试pluginComponentManager.request第1个参数传入undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('pluginComponentManager_request_param_undefined_007', Level.LEVEL2, async () => {
      let testResult: boolean = false;
      try {
        pluginComponentManager.request(undefined, (err, data) => {
          if (err) {
            CallbackTracker.requestCallbackError = err.toString();
          }
          CallbackTracker.requestCallbackInvoked = true;
        });
        await CommonFunc.sleep(1000);
        testResult = CallbackTracker.requestCallbackInvoked;
      } catch (err) {
        console.info('[pluginComponentManager_request_param_undefined_007] error: ' + err);
        CallbackTracker.requestCallbackError = err.toString();
      }
      expect(testResult).assertFalse();
    });
  });
}
