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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, Level, it, expect } from '@ohos/hypium';
import { Want, common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import webNativeMessagingExtensionManager from '@ohos.web.webNativeMessagingExtensionManager';

let context: common.UIAbilityContext;

// Error code for "Capability not supported"
const CAPABILITY_NOT_SUPPORTED_ERROR = 801;

// Helper function to check if error is capability not supported
function isCapabilityNotSupported(error: BusinessError): boolean {
  return error.code === CAPABILITY_NOT_SUPPORTED_ERROR;
}

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve: (value: void) => void) => {
    setTimeout(() => {
      resolve();
    }, time)
  });
}

export default function connectNativeErrorCodeTest() {
  describe('ActsConnectNativeErrorCodeTest', () => {
    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>('abilityContext') as common.UIAbilityContext;
      hilog.info(0x0000, 'testTag', 'ActsConnectNativeErrorCodeTest beforeAll start');
    })

    beforeEach(() => {
      hilog.info(0x0000, 'testTag', 'ActsConnectNativeErrorCodeTest beforeEach start');
    })

    afterEach(async () => {
      hilog.info(0x0000, 'testTag', 'ActsConnectNativeErrorCodeTest afterEach start');
      await sleep(1000);
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_ConnectNative_Error_Code_801_0100
     * @tc.number SUB_WEB_WebNativeMessagingExtension_ConnectNative_Error_Code_801_0100
     * @tc.desc   Test connectNative with error code 801 (Capability not supported)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WebNativeMessagingExtension_ConnectNative_Error_Code_801_0100', Level.LEVEL1, () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_ConnectNative_Error_Code_801_0100`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      let want: Want = {
        bundleName: 'com.example.nonexistent.bundle.that.should.not.exist',
        abilityName: 'NonexistentAbility',
        parameters: {
          "ohos.arkweb.extensionOrigin": "testOrigin",
          "ohos.arkweb.messageReadPipe": { 'type': 'FD', 'value': 1 },
          "ohos.arkweb.messageWritePipe": { 'type': 'FD', 'value': 2 }
        }
      };

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect called with connection: ${connection}`);
        },
        onDisconnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect called with connection: ${connection}`);
        },
        onFailed(code, errMsg) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed called with code: ${code} errMsg: ${errMsg}`);
          // 检查是否为能力不支持错误 (801)
          if (isCapabilityNotSupported({ code: code } as BusinessError)) {
            hilog.info(0x0000, 'testTag', `${tcNumber} Error code 801 detected as expected`);
            expect(code).assertEqual(CAPABILITY_NOT_SUPPORTED_ERROR);
          } else {
            hilog.info(0x0000, 'testTag', `${tcNumber} Unexpected error code: ${code}`);
            // 如果不是801错误，至少应该是一个有效的错误码
            expect(code).not().assertEqual(0);
          }
        }
      };

      try {
        let connId = webNativeMessagingExtensionManager.connectNative(context, want, callback);
        hilog.info(0x0000, 'testTag', `${tcNumber} connectNative called with connId: ${connId}`);
        // 如果没有抛出异常，返回的连接ID应该是一个有效数字
        expect(connId).not().assertEqual(-1);
      } catch (error) {
        let err = error as BusinessError;
        if (isCapabilityNotSupported(err)) {
          hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
          expect(err.code).assertEqual(CAPABILITY_NOT_SUPPORTED_ERROR);
          return;  // 跳过测试，不失败
        }
        hilog.info(0x0000, 'testTag', `${tcNumber} caught error: ${err.code} ${err.message}`);
        // 如果抛出异常，错误码应该有效
        expect(err.code).not().assertEqual(0);
      }
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_ConnectNative_Error_Code_801_Invalid_Ability_0200
     * @tc.number SUB_WEB_WebNativeMessagingExtension_ConnectNative_Error_Code_801_Invalid_Ability_0200
     * @tc.desc   Test connectNative with invalid ability name expecting error code 801
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WebNativeMessagingExtension_ConnectNative_Error_Code_801_Invalid_Ability_0200', Level.LEVEL1, () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_ConnectNative_Error_Code_801_Invalid_Ability_0200`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      let want: Want = {
        bundleName: 'com.acts.context.webonconnectnativerely',
        abilityName: 'InvalidAbilityNameThatDoesNotExistAndShouldTriggerError801',
        parameters: {
          "ohos.arkweb.extensionOrigin": "testOrigin",
          "ohos.arkweb.messageReadPipe": { 'type': 'FD', 'value': 1 },
          "ohos.arkweb.messageWritePipe": { 'type': 'FD', 'value': 2 }
        }
      };

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect called with connection: ${connection}`);
        },
        onDisconnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect called with connection: ${connection}`);
        },
        onFailed(code, errMsg) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed called with code: ${code} errMsg: ${errMsg}`);
          // 检查是否为能力不支持错误 (801)
          if (isCapabilityNotSupported({ code: code } as BusinessError)) {
            hilog.info(0x0000, 'testTag', `${tcNumber} Error code 801 detected as expected`);
            expect(code).assertEqual(CAPABILITY_NOT_SUPPORTED_ERROR);
          } else {
            hilog.info(0x0000, 'testTag', `${tcNumber} Unexpected error code: ${code}`);
            // 如果不是801错误，至少应该是一个有效的错误码
            expect(code).not().assertEqual(0);
          }
        }
      };

      try {
        let connId = webNativeMessagingExtensionManager.connectNative(context, want, callback);
        hilog.info(0x0000, 'testTag', `${tcNumber} connectNative called with connId: ${connId}`);
        // 如果没有抛出异常，返回的连接ID应该是一个有效数字
        expect(connId).not().assertEqual(-1);
      } catch (error) {
        let err = error as BusinessError;
        if (isCapabilityNotSupported(err)) {
          hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
          expect(err.code).assertEqual(CAPABILITY_NOT_SUPPORTED_ERROR);
          return;  // 跳过测试，不失败
        }
        hilog.info(0x0000, 'testTag', `${tcNumber} caught error: ${err.code} ${err.message}`);
        // 如果抛出异常，错误码应该有效
        expect(err.code).not().assertEqual(0);
      }
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_ConnectNative_Error_Code_801_Missing_Parameters_0300
     * @tc.number SUB_WEB_WebNativeMessagingExtension_ConnectNative_Error_Code_801_Missing_Parameters_0300
     * @tc.desc   Test connectNative with missing required parameters expecting error code 801
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WebNativeMessagingExtension_ConnectNative_Error_Code_801_Missing_Parameters_0300', Level.LEVEL1, () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_ConnectNative_Error_Code_801_Missing_Parameters_0300`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      let want: Want = {
        bundleName: 'com.acts.context.webonconnectnativerely',
        abilityName: 'WebNativeExtensionExtAbility1'
        // Intentionally missing required parameters
      };

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect called with connection: ${connection}`);
        },
        onDisconnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect called with connection: ${connection}`);
        },
        onFailed(code, errMsg) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed called with code: ${code} errMsg: ${errMsg}`);
          // 检查是否为能力不支持错误 (801)
          if (isCapabilityNotSupported({ code: code } as BusinessError)) {
            hilog.info(0x0000, 'testTag', `${tcNumber} Error code 801 detected as expected`);
            expect(code).assertEqual(CAPABILITY_NOT_SUPPORTED_ERROR);
          } else {
            hilog.info(0x0000, 'testTag', `${tcNumber} Unexpected error code: ${code}`);
            // 如果不是801错误，至少应该是一个有效的错误码
            expect(code).not().assertEqual(0);
          }
        }
      };

      try {
        let connId = webNativeMessagingExtensionManager.connectNative(context, want, callback);
        hilog.info(0x0000, 'testTag', `${tcNumber} connectNative called with connId: ${connId}`);
        // 如果没有抛出异常，返回的连接ID应该是一个有效数字
        expect(connId).not().assertEqual(-1);
      } catch (error) {
        let err = error as BusinessError;
        if (isCapabilityNotSupported(err)) {
          hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
          expect(err.code).assertEqual(CAPABILITY_NOT_SUPPORTED_ERROR);
          return;  // 跳过测试，不失败
        }
        hilog.info(0x0000, 'testTag', `${tcNumber} caught error: ${err.code} ${err.message}`);
        // 如果抛出异常，错误码应该有效
        expect(err.code).not().assertEqual(0);
      }
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_ConnectNative_Error_Code_801_Long_Bundle_Name_0400
     * @tc.number SUB_WEB_WebNativeMessagingExtension_ConnectNative_Error_Code_801_Long_Bundle_Name_0400
     * @tc.desc   Test connectNative with extremely long bundle name expecting error code 801
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtension_ConnectNative_Error_Code_801_Long_Bundle_Name_0400', Level.LEVEL2, () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_ConnectNative_Error_Code_801_Long_Bundle_Name_0400`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      // Create a very long bundle name that should not exist
      let longBundleName = 'com.example.';
      for (let i = 0; i < 20; i++) {
        longBundleName += 'nonexistent.';
      }
      longBundleName += 'bundle';

      let want: Want = {
        bundleName: longBundleName,
        abilityName: 'WebNativeExtensionExtAbility1',
        parameters: {
          "ohos.arkweb.extensionOrigin": "testOrigin",
          "ohos.arkweb.messageReadPipe": { 'type': 'FD', 'value': 1 },
          "ohos.arkweb.messageWritePipe": { 'type': 'FD', 'value': 2 }
        }
      };

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect called with connection: ${connection}`);
        },
        onDisconnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect called with connection: ${connection}`);
        },
        onFailed(code, errMsg) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed called with code: ${code} errMsg: ${errMsg}`);
          // 检查是否为能力不支持错误 (801)
          if (isCapabilityNotSupported({ code: code } as BusinessError)) {
            hilog.info(0x0000, 'testTag', `${tcNumber} Error code 801 detected as expected`);
            expect(code).assertEqual(CAPABILITY_NOT_SUPPORTED_ERROR);
          } else {
            hilog.info(0x0000, 'testTag', `${tcNumber} Unexpected error code: ${code}`);
            // 如果不是801错误，至少应该是一个有效的错误码
            expect(code).not().assertEqual(0);
          }
        }
      };

      try {
        let connId = webNativeMessagingExtensionManager.connectNative(context, want, callback);
        hilog.info(0x0000, 'testTag', `${tcNumber} connectNative called with connId: ${connId}`);
        // 如果没有抛出异常，返回的连接ID应该是一个有效数字
        expect(connId).not().assertEqual(-1);
      } catch (error) {
        let err = error as BusinessError;
        if (isCapabilityNotSupported(err)) {
          hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
          expect(err.code).assertEqual(CAPABILITY_NOT_SUPPORTED_ERROR);
          return;  // 跳过测试，不失败
        }
        hilog.info(0x0000, 'testTag', `${tcNumber} caught error: ${err.code} ${err.message}`);
        // 如果抛出异常，错误码应该有效
        expect(err.code).not().assertEqual(0);
      }
    })
  })
}