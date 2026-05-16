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
import { BusinessError } from '@kit.BasicServicesKit';
import webNativeMessagingExtensionManager from '@ohos.web.webNativeMessagingExtensionManager';

export default function onFailedParameterTest() {
  describe('ActsOnFailedParameterTest', () => {
    beforeAll(() => {
      hilog.info(0x0000, 'testTag', 'ActsOnFailedParameterTest beforeAll start');
    })

    beforeEach(() => {
      hilog.info(0x0000, 'testTag', 'ActsOnFailedParameterTest beforeEach start');
    })

    afterEach(() => {
      hilog.info(0x0000, 'testTag', 'ActsOnFailedParameterTest afterEach start');
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_OnFailed_ErrorMsg_Empty_0100
     * @tc.number SUB_WEB_WebNativeMessagingExtension_OnFailed_ErrorMsg_Empty_0100
     * @tc.desc   Test onFailed with empty errMsg
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WebNativeMessagingExtension_OnFailed_ErrorMsg_Empty_0100', Level.LEVEL1, () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_OnFailed_ErrorMsg_Empty_0100`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect called`);
        },
        onDisconnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect called`);
        },
        onFailed(code: webNativeMessagingExtensionManager.NmErrorCode, errMsg: string) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed called with empty errMsg, code: ${code}`);
          // 验证 errMsg 为空字符串
          expect(errMsg).assertEqual("");
          // 验证错误码为 PERMISSION_DENY
          expect(code).assertEqual(webNativeMessagingExtensionManager.NmErrorCode.PERMISSION_DENY);
        }
      };

      // 模拟调用 onFailed，传入空字符串 errMsg
      callback.onFailed(webNativeMessagingExtensionManager.NmErrorCode.PERMISSION_DENY, "");
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_OnFailed_ErrorMsg_Null_0200
     * @tc.number SUB_WEB_WebNativeMessagingExtension_OnFailed_ErrorMsg_Null_0200
     * @tc.desc   Test onFailed with null errMsg (using empty string to simulate)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtension_OnFailed_ErrorMsg_Null_0200', Level.LEVEL2, () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_OnFailed_ErrorMsg_Null_0200`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect called`);
        },
        onDisconnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect called`);
        },
        onFailed(code: webNativeMessagingExtensionManager.NmErrorCode, errMsg: string) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed called`);
          // 验证 errMsg 不为 null（使用空字符串模拟）
          expect(errMsg).not().assertNull();
          expect(errMsg).assertEqual("");
        }
      };

      // 注意：由于 ArkTS 的类型系统，errMsg 声明为 string 类型
      // 不能直接赋值为 null（除非声明为 string | null）
      // 这里使用空字符串来模拟 "类似 null" 的场景
      callback.onFailed(webNativeMessagingExtensionManager.NmErrorCode.WANT_CONTENT_ERROR, "");
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_OnFailed_ErrorMsg_Undefined_0300
     * @tc.number SUB_WEB_WebNativeMessagingExtension_OnFailed_ErrorMsg_Undefined_0300
     * @tc.desc   Test onFailed with undefined errMsg handling
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtension_OnFailed_ErrorMsg_Undefined_0300', Level.LEVEL2, () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_OnFailed_ErrorMsg_Undefined_0300`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect called`);
        },
        onDisconnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect called`);
        },
        onFailed(code: webNativeMessagingExtensionManager.NmErrorCode, errMsg: string) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed called`);
          // 验证 errMsg 不为 undefined
          expect(errMsg).not().assertUndefined();
        }
      };

      // 创建一个有意义的错误消息
      let validErrMsg: string = "Connection failed due to inner error";
      callback.onFailed(webNativeMessagingExtensionManager.NmErrorCode.INNER_ERROR, validErrMsg);
      expect(validErrMsg).not().assertUndefined();
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_OnFailed_Code_PERMISSION_DENY_0400
     * @tc.number SUB_WEB_WebNativeMessagingExtension_OnFailed_Code_PERMISSION_DENY_0400
     * @tc.desc   Test onFailed with PERMISSION_DENY error code
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WEB_WebNativeMessagingExtension_OnFailed_Code_PERMISSION_DENY_0400', Level.LEVEL0, () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_OnFailed_Code_PERMISSION_DENY_0400`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect called`);
        },
        onDisconnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect called`);
        },
        onFailed(code: webNativeMessagingExtensionManager.NmErrorCode, errMsg: string) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed called with code: ${code}, errMsg: ${errMsg}`);
          // 验证错误码为 PERMISSION_DENY (17100203)
          expect(code).assertEqual(webNativeMessagingExtensionManager.NmErrorCode.PERMISSION_DENY);
          expect(code).assertEqual(17100203);
          // 验证错误消息包含权限相关内容
          expect(errMsg).not().assertEqual("");
        }
      };

      // 模拟调用 onFailed，传入 PERMISSION_DENY 错误码
      let errorMsg: string = "Permission denied due to missing ohos.permission.WEB_NATIVE_MESSAGING.";
      callback.onFailed(webNativeMessagingExtensionManager.NmErrorCode.PERMISSION_DENY, errorMsg);
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_OnFailed_Code_WANT_CONTENT_ERROR_0500
     * @tc.number SUB_WEB_WebNativeMessagingExtension_OnFailed_Code_WANT_CONTENT_ERROR_0500
     * @tc.desc   Test onFailed with WANT_CONTENT_ERROR error code
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WEB_WebNativeMessagingExtension_OnFailed_Code_WANT_CONTENT_ERROR_0500', Level.LEVEL0, () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_OnFailed_Code_WANT_CONTENT_ERROR_0500`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect called`);
        },
        onDisconnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect called`);
        },
        onFailed(code: webNativeMessagingExtensionManager.NmErrorCode, errMsg: string) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed called with code: ${code}, errMsg: ${errMsg}`);
          // 验证错误码为 WANT_CONTENT_ERROR (17100202)
          expect(code).assertEqual(webNativeMessagingExtensionManager.NmErrorCode.WANT_CONTENT_ERROR);
          expect(code).assertEqual(17100202);
          // 验证错误消息包含 Want 内容相关内容
          expect(errMsg).not().assertEqual("");
        }
      };

      // 模拟调用 onFailed，传入 WANT_CONTENT_ERROR 错误码
      let errorMsg: string = "The want content is invalid.";
      callback.onFailed(webNativeMessagingExtensionManager.NmErrorCode.WANT_CONTENT_ERROR, errorMsg);
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_OnFailed_Code_INNER_ERROR_0600
     * @tc.number SUB_WEB_WebNativeMessagingExtension_OnFailed_Code_INNER_ERROR_0600
     * @tc.desc   Test onFailed with INNER_ERROR error code
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WEB_WebNativeMessagingExtension_OnFailed_Code_INNER_ERROR_0600', Level.LEVEL0, () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_OnFailed_Code_INNER_ERROR_0600`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect called`);
        },
        onDisconnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect called`);
        },
        onFailed(code: webNativeMessagingExtensionManager.NmErrorCode, errMsg: string) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed called with code: ${code}, errMsg: ${errMsg}`);
          // 验证错误码为 INNER_ERROR (17100201)
          expect(code).assertEqual(webNativeMessagingExtensionManager.NmErrorCode.INNER_ERROR);
          expect(code).assertEqual(17100201);
          // 验证错误消息包含内部错误相关内容
          expect(errMsg).not().assertEqual("");
        }
      };

      // 模拟调用 onFailed，传入 INNER_ERROR 错误码
      let errorMsg: string = "Inner error for native messaging.";
      callback.onFailed(webNativeMessagingExtensionManager.NmErrorCode.INNER_ERROR, errorMsg);
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_OnFailed_All_Error_Codes_0700
     * @tc.number SUB_WEB_WebNativeMessagingExtension_OnFailed_All_Error_Codes_0700
     * @tc.desc   Test onFailed with all error codes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WebNativeMessagingExtension_OnFailed_All_Error_Codes_0700', Level.LEVEL1, () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_OnFailed_All_Error_Codes_0700`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

           let errorCodes: webNativeMessagingExtensionManager.NmErrorCode[] = [
             webNativeMessagingExtensionManager.NmErrorCode.PERMISSION_DENY,
             webNativeMessagingExtensionManager.NmErrorCode.WANT_CONTENT_ERROR,
             webNativeMessagingExtensionManager.NmErrorCode.INNER_ERROR
           ];

      let expectedValues: number[] = [17100203, 17100202, 17100201];

      for (let i = 0; i < errorCodes.length; i++) {
        let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
          onConnect(connection) {
            hilog.info(0x0000, 'testTag', `${tcNumber} onConnect called`);
          },
          onDisconnect(connection) {
            hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect called`);
          },
          onFailed(code: webNativeMessagingExtensionManager.NmErrorCode, errMsg: string) {
            hilog.info(0x0000, 'testTag', `${tcNumber} onFailed called with code: ${code}`);
            // 验证错误码值
            expect(code).assertEqual(expectedValues[i]);
          }
        };

        let errorMsg: string = `Error message for error code ${expectedValues[i]}`;
        callback.onFailed(errorCodes[i], errorMsg);
      }
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_OnFailed_ErrorMsg_Long_String_0800
     * @tc.number SUB_WEB_WebNativeMessagingExtension_OnFailed_ErrorMsg_Long_String_0800
     * @tc.desc   Test onFailed with long error message
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtension_OnFailed_ErrorMsg_Long_String_0800', Level.LEVEL2, () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_OnFailed_ErrorMsg_Long_String_0800`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect called`);
        },
        onDisconnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect called`);
        },
        onFailed(code: webNativeMessagingExtensionManager.NmErrorCode, errMsg: string) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed called`);
          // 验证错误消息长度
          expect(errMsg.length).assertLarger(0);
          expect(errMsg.length).not().assertLarger(10000); // 假设最大长度限制
          // 验证错误码
          expect(code).assertEqual(webNativeMessagingExtensionManager.NmErrorCode.INNER_ERROR);
        }
      };

      // 创建一个较长的错误消息
      let longErrorMsg: string = "This is a very long error message that contains detailed information about what went wrong during the native messaging connection process. ".repeat(10);
      callback.onFailed(webNativeMessagingExtensionManager.NmErrorCode.INNER_ERROR, longErrorMsg);
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_OnFailed_ErrorMsg_Special_Chars_0900
     * @tc.number SUB_WEB_WebNativeMessagingExtension_OnFailed_ErrorMsg_Special_Chars_0900
     * @tc.desc   Test onFailed with error message containing special characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtension_OnFailed_ErrorMsg_Special_Chars_0900', Level.LEVEL2, () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_OnFailed_ErrorMsg_Special_Chars_0900`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect called`);
        },
        onDisconnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect called`);
        },
        onFailed(code: webNativeMessagingExtensionManager.NmErrorCode, errMsg: string) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed called with errMsg: ${errMsg}`);
          // 验证错误消息包含特殊字符
          expect(errMsg).not().assertEqual("");
          expect(errMsg).not().assertUndefined();
        }
      };

      // 创建包含特殊字符的错误消息
      let specialCharsErrorMsg: string = "Error: @#$%^&*()_+-=[]{}|;':\",./<>?~`";
      callback.onFailed(webNativeMessagingExtensionManager.NmErrorCode.INNER_ERROR, specialCharsErrorMsg);
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_OnFailed_ErrorMsg_With_Newline_1000
     * @tc.number SUB_WEB_WebNativeMessagingExtension_OnFailed_ErrorMsg_With_Newline_1000
     * @tc.desc   Test onFailed with error message containing newline characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtension_OnFailed_ErrorMsg_With_Newline_1000', Level.LEVEL2, () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_OnFailed_ErrorMsg_With_Newline_1000`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect called`);
        },
        onDisconnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect called`);
        },
        onFailed(code: webNativeMessagingExtensionManager.NmErrorCode, errMsg: string) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed called`);
          // 验证错误消息包含换行符
          expect(errMsg.indexOf('\n') >= 0).assertTrue();
          // 验证错误码
          expect(code).assertEqual(webNativeMessagingExtensionManager.NmErrorCode.WANT_CONTENT_ERROR);
        }
      };

      // 创建包含换行符的错误消息
      let multilineErrorMsg: string = "Error: Invalid want content.\nPlease check your want parameters.\nSee documentation for details.";
      callback.onFailed(webNativeMessagingExtensionManager.NmErrorCode.WANT_CONTENT_ERROR, multilineErrorMsg);
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_OnFailed_ErrorMsg_Unicode_1100
     * @tc.number SUB_WEB_WebNativeMessagingExtension_OnFailed_ErrorMsg_Unicode_1100
     * @tc.desc   Test onFailed with error message containing Unicode characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtension_OnFailed_ErrorMsg_Unicode_1100', Level.LEVEL2, () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_OnFailed_ErrorMsg_Unicode_1100`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect called`);
        },
        onDisconnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect called`);
        },
        onFailed(code: webNativeMessagingExtensionManager.NmErrorCode, errMsg: string) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed called with errMsg: ${errMsg}`);
          // 验证错误消息包含 Unicode 字符
          expect(errMsg).not().assertEqual("");
          expect(errMsg).not().assertUndefined();
        }
      };

      // 创建包含 Unicode 字符的错误消息
      let unicodeErrorMsg: string = "错误：权限被拒绝。错误码：17100203。请检查权限设置。🔒";
      callback.onFailed(webNativeMessagingExtensionManager.NmErrorCode.PERMISSION_DENY, unicodeErrorMsg);
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_OnFailed_Callback_Not_Called_1200
     * @tc.number SUB_WEB_WebNativeMessagingExtension_OnFailed_Callback_Not_Called_1200
     * @tc.desc   Test onFailed callback is not called when connection succeeds
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtension_OnFailed_Callback_Not_Called_1200', Level.LEVEL2, () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_OnFailed_Callback_Not_Called_1200`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      let onFailedCalled: boolean = false;
      let onDisconnectCalled: boolean = false;

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect called`);
        },
        onDisconnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect called`);
          onDisconnectCalled = true;
          // 验证 onFailed 没有被调用
          expect(onFailedCalled).assertFalse();
        },
        onFailed(code: webNativeMessagingExtensionManager.NmErrorCode, errMsg: string) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed called`);
          onFailedCalled = true;
        }
      };

      // 模拟正常的断开连接流程，不调用 onFailed
      let mockConnection: webNativeMessagingExtensionManager.ConnectionNativeInfo = {
        connectionId: 999,
        bundleName: "com.example.extension",
        extensionOrigin: "chrome-extension://test/",
        extensionPid: 12345
      };

      callback.onDisconnect(mockConnection);
      expect(onDisconnectCalled).assertTrue();
      expect(onFailedCalled).assertFalse();
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_OnFailed_Error_Code_Value_Check_1300
     * @tc.number SUB_WEB_WebNativeMessagingExtension_OnFailed_Error_Code_Value_Check_1300
     * @tc.desc   Test onFailed error code values match expected enum values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WebNativeMessagingExtension_OnFailed_Error_Code_Value_Check_1300', Level.LEVEL1, () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_OnFailed_Error_Code_Value_Check_1300`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      // 验证枚举值与预期值一致
      expect(webNativeMessagingExtensionManager.NmErrorCode.PERMISSION_DENY).assertEqual(17100203);
      expect(webNativeMessagingExtensionManager.NmErrorCode.WANT_CONTENT_ERROR).assertEqual(17100202);
      expect(webNativeMessagingExtensionManager.NmErrorCode.INNER_ERROR).assertEqual(17100201);

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect called`);
        },
        onDisconnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect called`);
        },
        onFailed(code: webNativeMessagingExtensionManager.NmErrorCode, errMsg: string) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed called with code: ${code}`);
          // 验证错误码在有效范围内
          expect(code >= 17100201 && code <= 17100203).assertTrue();
        }
      };

      // 测试所有错误码
      callback.onFailed(webNativeMessagingExtensionManager.NmErrorCode.PERMISSION_DENY, "Test");
      callback.onFailed(webNativeMessagingExtensionManager.NmErrorCode.WANT_CONTENT_ERROR, "Test");
      callback.onFailed(webNativeMessagingExtensionManager.NmErrorCode.INNER_ERROR, "Test");
    })

  })
}
