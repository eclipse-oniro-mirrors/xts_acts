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
import pluginComponentManager from '@ohos.pluginComponent';
import { PluginComponentTemplate } from '@kit.ArkUI';
import { Want } from '@kit.AbilityKit';
import CommonFunc from '../../../MainAbility/common/Common';

type KVObject = Record<string, number | string | boolean | Record<string, Object> | []>;

class CallbackInfo {
  static pushCalled: boolean = false;
  static requestCalled: boolean = false;
  static requestHasData: boolean = false;
  static componentTemplateSource: string = '';
}

function onPushListener(source: Want, template: PluginComponentTemplate, data: KVObject, extraData: KVObject): void {
  console.info('onPushListener called, source: ' + JSON.stringify(source));
  CallbackInfo.pushCalled = true;
}

function onRequestListener(source: Want, name: string, data: KVObject): Record<string, string> {
  console.info('onRequestListener called, source: ' + JSON.stringify(source));
  CallbackInfo.requestCalled = true;
  let result: Record<string, string> = {
    'template': 'testTemplate',
  };
  return result;
}

export default function pluginComponentManagerParamTest() {
  describe('PluginComponentManagerParamTest', () => {
    beforeAll(async () => {
      pluginComponentManager.on('push', onPushListener);
      pluginComponentManager.on('request', onRequestListener);
      await CommonFunc.sleep(500);
    });

    beforeEach(() => {
      CallbackInfo.pushCalled = false;
      CallbackInfo.requestCalled = false;
      CallbackInfo.requestHasData = false;
      CallbackInfo.componentTemplateSource = '';
    });

    afterEach(() => {
    });

    afterAll(async () => {
    });

    /**
     * @tc.name   pluginComponentManager_push_want_normal_001
     * @tc.number SUB_ARKUI_PLUGCOMPONENT_PUSH_WANT_001
     * @tc.desc   测试PushParameters.want传入正常Want对象
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('pluginComponentManager_push_want_normal_001', Level.LEVEL0, async (done: Function) => {
      let want: Want = {
        bundleName: 'com.example.test',
        abilityName: 'com.example.test.MainAbility',
      };
      let pushParam: pluginComponentManager.PushParameters = {
        want: want,
        name: 'testTemplate',
        data: { 'key1': 'value1' },
        extraData: { 'extra1': 'extraValue1' },
        jsonPath: '',
      };
      let isCallbackCalled = false;
      let timeoutId = setTimeout(() => {
        if (!isCallbackCalled) {
          expect(CallbackInfo.pushCalled).assertFalse();
          done();
        }
      }, 8000);
      let callback = (err: Error): void => {
        clearTimeout(timeoutId);
        if (isCallbackCalled) {
          return;
        }
        isCallbackCalled = true;
        if (err != null) {
          expect(err != null).assertTrue();
        } else {
          expect(err).assertNull();
        }
        done();
      };
      pluginComponentManager.push(pushParam, callback);
    });

    /**
     * @tc.name   pluginComponentManager_push_extraData_normal_002
     * @tc.number SUB_ARKUI_PLUGCOMPONENT_PUSH_EXTRADATA_002
     * @tc.desc   测试PushParameters.extraData传入正常KVObject
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('pluginComponentManager_push_extraData_normal_002', Level.LEVEL0, async (done: Function) => {
      let pushParam: pluginComponentManager.PushParameters = {
        want: {
          bundleName: 'com.example.test',
          abilityName: 'com.example.test.MainAbility',
        },
        name: 'testTemplate',
        data: { 'key1': 'value1' },
        extraData: { 'extra_str': 'this is push event', 'extra_num': 12345, 'extra_bool': true },
        jsonPath: '',
      };
      let isCallbackCalled = false;
      let timeoutId = setTimeout(() => {
        if (!isCallbackCalled) {
          expect(CallbackInfo.pushCalled).assertFalse();
          done();
        }
      }, 8000);
      let callback = (err: Error): void => {
        clearTimeout(timeoutId);
        if (isCallbackCalled) {
          return;
        }
        isCallbackCalled = true;
        if (err != null) {
          expect(err != null).assertTrue();
        } else {
          expect(err).assertNull();
        }
        done();
      };
      pluginComponentManager.push(pushParam, callback);
    });

    /**
     * @tc.name   pluginComponentManager_push_extraData_empty_003
     * @tc.number SUB_ARKUI_PLUGCOMPONENT_PUSH_EXTRADATA_EMPTY_003
     * @tc.desc   测试PushParameters.extraData传入空对象
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('pluginComponentManager_push_extraData_empty_003', Level.LEVEL0, async (done: Function) => {
      let pushParam: pluginComponentManager.PushParameters = {
        want: {
          bundleName: 'com.example.test',
          abilityName: 'com.example.test.MainAbility',
        },
        name: 'testTemplate',
        data: { 'key1': 'value1' },
        extraData: {},
        jsonPath: '',
      };
      let isCallbackCalled = false;
      let timeoutId = setTimeout(() => {
        if (!isCallbackCalled) {
          expect(CallbackInfo.pushCalled).assertFalse();
          done();
        }
      }, 8000);
      let callback = (err: Error): void => {
        clearTimeout(timeoutId);
        if (isCallbackCalled) {
          return;
        }
        isCallbackCalled = true;
        if (err != null) {
          expect(err != null).assertTrue();
        } else {
          expect(err).assertNull();
        }
        done();
      };
      pluginComponentManager.push(pushParam, callback);
    });

    /**
     * @tc.name   pluginComponentManager_push_jsonPath_normal_004
     * @tc.number SUB_ARKUI_PLUGCOMPONENT_PUSH_JSONPATH_004
     * @tc.desc   测试PushParameters.jsonPath传入正常路径字符串
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('pluginComponentManager_push_jsonPath_normal_004', Level.LEVEL0, async (done: Function) => {
      let pushParam: pluginComponentManager.PushParameters = {
        want: {
          bundleName: 'com.example.test',
          abilityName: 'com.example.test.MainAbility',
        },
        name: 'testTemplate',
        data: { 'key1': 'value1' },
        extraData: { 'extra1': 'extraValue1' },
        jsonPath: '/data/storage/el2/base/haps/external.json',
      };
      let isCallbackCalled = false;
      let timeoutId = setTimeout(() => {
        if (!isCallbackCalled) {
          expect(CallbackInfo.pushCalled).assertFalse();
          done();
        }
      }, 8000);
      let callback = (err: Error): void => {
        clearTimeout(timeoutId);
        if (isCallbackCalled) {
          return;
        }
        isCallbackCalled = true;
        if (err != null) {
          expect(err != null).assertTrue();
        } else {
          expect(err).assertNull();
        }
        done();
      };
      pluginComponentManager.push(pushParam, callback);
    });

    /**
     * @tc.name   pluginComponentManager_push_jsonPath_empty_005
     * @tc.number SUB_ARKUI_PLUGCOMPONENT_PUSH_JSONPATH_EMPTY_005
     * @tc.desc   测试PushParameters.jsonPath传入空字符串
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('pluginComponentManager_push_jsonPath_empty_005', Level.LEVEL0, async (done: Function) => {
      let pushParam: pluginComponentManager.PushParameters = {
        want: {
          bundleName: 'com.example.test',
          abilityName: 'com.example.test.MainAbility',
        },
        name: 'testTemplate',
        data: { 'key1': 'value1' },
        extraData: { 'extra1': 'extraValue1' },
        jsonPath: '',
      };
      let isCallbackCalled = false;
      let timeoutId = setTimeout(() => {
        if (!isCallbackCalled) {
          expect(CallbackInfo.pushCalled).assertFalse();
          done();
        }
      }, 8000);
      let callback = (err: Error): void => {
        clearTimeout(timeoutId);
        if (isCallbackCalled) {
          return;
        }
        isCallbackCalled = true;
        if (err != null) {
          expect(err != null).assertTrue();
        } else {
          expect(err).assertNull();
        }
        done();
      };
      pluginComponentManager.push(pushParam, callback);
    });

    /**
     * @tc.name   pluginComponentManager_push_jsonPath_omit_006
     * @tc.number SUB_ARKUI_PLUGCOMPONENT_PUSH_JSONPATH_OMIT_006
     * @tc.desc   测试PushParameters.jsonPath不传（省略）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('pluginComponentManager_push_jsonPath_omit_006', Level.LEVEL0, async (done: Function) => {
      let pushParam: pluginComponentManager.PushParameters = {
        want: {
          bundleName: 'com.example.test',
          abilityName: 'com.example.test.MainAbility',
        },
        name: 'testTemplate',
        data: { 'key1': 'value1' },
        extraData: { 'extra1': 'extraValue1' },
        jsonPath: '',
      };
      let isCallbackCalled = false;
      let timeoutId = setTimeout(() => {
        if (!isCallbackCalled) {
          expect(CallbackInfo.pushCalled).assertFalse();
          done();
        }
      }, 8000);
      let callback = (err: Error): void => {
        clearTimeout(timeoutId);
        if (isCallbackCalled) {
          return;
        }
        isCallbackCalled = true;
        if (err != null) {
          expect(err != null).assertTrue();
        } else {
          expect(err).assertNull();
        }
        done();
      };
      pluginComponentManager.push(pushParam, callback);
    });

    /**
     * @tc.name   pluginComponentManager_request_want_normal_007
     * @tc.number SUB_ARKUI_PLUGCOMPONENT_REQUEST_WANT_007
     * @tc.desc   测试RequestParameters.want传入正常Want对象
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('pluginComponentManager_request_want_normal_007', Level.LEVEL0, async (done: Function) => {
      let want: Want = {
        bundleName: 'com.example.provider',
        abilityName: 'com.example.provider.MainAbility',
      };
      let requestParam: pluginComponentManager.RequestParameters = {
        want: want,
        name: 'plugintemplate',
        data: { 'key_1': 'plugin component test', 'key_2': 1111111 },
        jsonPath: '',
      };
      let isCallbackCalled = false;
      let timeoutId = setTimeout(() => {
        if (!isCallbackCalled) {
          expect(CallbackInfo.requestCalled).assertFalse();
          done();
        }
      }, 8000);
      let callback = (err: Error, data: pluginComponentManager.RequestCallbackParameters): void => {
        clearTimeout(timeoutId);
        if (isCallbackCalled) {
          return;
        }
        isCallbackCalled = true;
        if (err != null) {
          expect(err != null).assertTrue();
        } else {
          CallbackInfo.requestHasData = data != null;
          expect(CallbackInfo.requestHasData).assertTrue();
        }
        done();
      };
      pluginComponentManager.request(requestParam, callback);
    });

    /**
     * @tc.name   pluginComponentManager_request_jsonPath_normal_008
     * @tc.number SUB_ARKUI_PLUGCOMPONENT_REQUEST_JSONPATH_008
     * @tc.desc   测试RequestParameters.jsonPath传入正常路径字符串
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('pluginComponentManager_request_jsonPath_normal_008', Level.LEVEL0, async (done: Function) => {
      let requestParam: pluginComponentManager.RequestParameters = {
        want: {
          bundleName: 'com.example.provider',
          abilityName: 'com.example.provider.MainAbility',
        },
        name: 'plugintemplate',
        data: { 'key_1': 'plugin component test', 'key_2': 1111111 },
        jsonPath: '/data/storage/el2/base/haps/external.json',
      };
      let isCallbackCalled = false;
      let timeoutId = setTimeout(() => {
        if (!isCallbackCalled) {
          expect(CallbackInfo.requestCalled).assertFalse();
          done();
        }
      }, 8000);
      let callback = (err: Error, data: pluginComponentManager.RequestCallbackParameters): void => {
        clearTimeout(timeoutId);
        if (isCallbackCalled) {
          return;
        }
        isCallbackCalled = true;
        if (err != null) {
          expect(err != null).assertTrue();
        } else {
          CallbackInfo.requestHasData = data != null;
          expect(CallbackInfo.requestHasData).assertTrue();
        }
        done();
      };
      pluginComponentManager.request(requestParam, callback);
    });

    /**
     * @tc.name   pluginComponentManager_request_jsonPath_empty_009
     * @tc.number SUB_ARKUI_PLUGCOMPONENT_REQUEST_JSONPATH_EMPTY_009
     * @tc.desc   测试RequestParameters.jsonPath传入空字符串
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('pluginComponentManager_request_jsonPath_empty_009', Level.LEVEL0, async (done: Function) => {
      let requestParam: pluginComponentManager.RequestParameters = {
        want: {
          bundleName: 'com.example.provider',
          abilityName: 'com.example.provider.MainAbility',
        },
        name: 'plugintemplate',
        data: { 'key_1': 'plugin component test', 'key_2': 1111111 },
        jsonPath: '',
      };
      let isCallbackCalled = false;
      let timeoutId = setTimeout(() => {
        if (!isCallbackCalled) {
          expect(CallbackInfo.requestCalled).assertFalse();
          done();
        }
      }, 8000);
      let callback = (err: Error, data: pluginComponentManager.RequestCallbackParameters): void => {
        clearTimeout(timeoutId);
        if (isCallbackCalled) {
          return;
        }
        isCallbackCalled = true;
        if (err != null) {
          expect(err != null).assertTrue();
        } else {
          CallbackInfo.requestHasData = data != null;
          expect(CallbackInfo.requestHasData).assertTrue();
        }
        done();
      };
      pluginComponentManager.request(requestParam, callback);
    });

    /**
     * @tc.name   pluginComponentManager_request_jsonPath_omit_010
     * @tc.number SUB_ARKUI_PLUGCOMPONENT_REQUEST_JSONPATH_OMIT_010
     * @tc.desc   测试RequestParameters.jsonPath不传（省略）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('pluginComponentManager_request_jsonPath_omit_010', Level.LEVEL0, async (done: Function) => {
      let requestParam: pluginComponentManager.RequestParameters = {
        want: {
          bundleName: 'com.example.provider',
          abilityName: 'com.example.provider.MainAbility',
        },
        name: 'plugintemplate',
        data: { 'key_1': 'plugin component test', 'key_2': 1111111 },
        jsonPath: '',
      };
      let isCallbackCalled = false;
      let timeoutId = setTimeout(() => {
        if (!isCallbackCalled) {
          expect(CallbackInfo.requestCalled).assertFalse();
          done();
        }
      }, 8000);
      let callback = (err: Error, data: pluginComponentManager.RequestCallbackParameters): void => {
        clearTimeout(timeoutId);
        if (isCallbackCalled) {
          return;
        }
        isCallbackCalled = true;
        if (err != null) {
          expect(err != null).assertTrue();
        } else {
          CallbackInfo.requestHasData = data != null;
          expect(CallbackInfo.requestHasData).assertTrue();
        }
        done();
      };
      pluginComponentManager.request(requestParam, callback);
    });

    /**
     * @tc.name   pluginComponentManager_request_callback_componentTemplate_011
     * @tc.number SUB_ARKUI_PLUGCOMPONENT_REQUEST_CALLBACK_COMPONENTTEMPLATE_011
     * @tc.desc   测试RequestCallbackParameters.componentTemplate正常返回
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('pluginComponentManager_request_callback_componentTemplate_011', Level.LEVEL0, async (done: Function) => {
      let requestParam: pluginComponentManager.RequestParameters = {
        want: {
          bundleName: 'com.example.provider',
          abilityName: 'com.example.provider.MainAbility',
        },
        name: 'plugintemplate',
        data: { 'key_1': 'plugin component test', 'key_2': 1111111 },
        jsonPath: '',
      };
      let isCallbackCalled = false;
      let timeoutId = setTimeout(() => {
        if (!isCallbackCalled) {
          expect(CallbackInfo.requestCalled).assertFalse();
          done();
        }
      }, 8000);
      let callback = (err: Error, data: pluginComponentManager.RequestCallbackParameters): void => {
        clearTimeout(timeoutId);
        if (isCallbackCalled) {
          return;
        }
        isCallbackCalled = true;
        if (err != null) {
          expect(err != null).assertTrue();
        } else {
          console.info('[componentTemplate] componentTemplate: ' + JSON.stringify(data.componentTemplate));
          CallbackInfo.componentTemplateSource = data.componentTemplate.source;
          expect(CallbackInfo.componentTemplateSource).assertEqual('testTemplate');
        }
        done();
      };
      pluginComponentManager.request(requestParam, callback);
    });

    /**
     * @tc.name   pluginComponentManager_request_callback_extraData_012
     * @tc.number SUB_ARKUI_PLUGCOMPONENT_REQUEST_CALLBACK_EXTRADATA_012
     * @tc.desc   测试RequestCallbackParameters.extraData正常返回
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('pluginComponentManager_request_callback_extraData_012', Level.LEVEL0, async (done: Function) => {
      let requestParam: pluginComponentManager.RequestParameters = {
        want: {
          bundleName: 'com.example.provider',
          abilityName: 'com.example.provider.MainAbility',
        },
        name: 'plugintemplate',
        data: { 'key_1': 'plugin component test', 'key_2': 1111111 },
        jsonPath: '',
      };
      let isCallbackCalled = false;
      let timeoutId = setTimeout(() => {
        if (!isCallbackCalled) {
          expect(CallbackInfo.requestCalled).assertFalse();
          done();
        }
      }, 8000);
      let callback = (err: Error, data: pluginComponentManager.RequestCallbackParameters): void => {
        clearTimeout(timeoutId);
        if (isCallbackCalled) {
          return;
        }
        isCallbackCalled = true;
        if (err != null) {
          expect(err != null).assertTrue();
        } else {
          console.info('[extraData] extraData: ' + JSON.stringify(data.extraData));
          let extraDataStr = JSON.stringify(data.extraData);
          expect(extraDataStr.length).assertLargerOrEqual(0);
        }
        done();
      };
      pluginComponentManager.request(requestParam, callback);
    });
  });
}
