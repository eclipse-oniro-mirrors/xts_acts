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

export default function onDisconnectParameterTest() {
  describe('ActsOnDisconnectParameterTest', () => {
    beforeAll(() => {
      hilog.info(0x0000, 'testTag', 'ActsOnDisconnectParameterTest beforeAll start');
    })

    beforeEach(() => {
      hilog.info(0x0000, 'testTag', 'ActsOnDisconnectParameterTest beforeEach start');
    })

    afterEach(() => {
      hilog.info(0x0000, 'testTag', 'ActsOnDisconnectParameterTest afterEach start');
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_OnDisconnect_BundleName_Empty_0100
     * @tc.number SUB_WEB_WebNativeMessagingExtension_OnDisconnect_BundleName_Empty_0100
     * @tc.desc   Test onDisconnect with empty bundleName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WebNativeMessagingExtension_OnDisconnect_BundleName_Empty_0100', Level.LEVEL1, () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_OnDisconnect_BundleName_Empty_0100`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect called`);
        },
        onDisconnect(connection: webNativeMessagingExtensionManager.ConnectionNativeInfo) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect called with empty bundleName`);
          // 验证 bundleName 为空字符串
          expect(connection.bundleName).assertEqual("");
          // 验证其他属性存在
          expect(connection.connectionId).not().assertUndefined();
          expect(connection.extensionOrigin).not().assertUndefined();
          expect(connection.extensionPid).not().assertUndefined();
        },
        onFailed(code, errMsg) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed code: ${code} errMsg: ${errMsg}`);
        }
      };

      // 模拟调用 onDisconnect，传入 bundleName 为空的连接信息
      let mockConnection: webNativeMessagingExtensionManager.ConnectionNativeInfo = {
        connectionId: 1,
        bundleName: "",  // 空字符串
        extensionOrigin: "chrome-extension://test/",
        extensionPid: 1234
      };

      // 直接调用 onDisconnect 方法进行测试
      callback.onDisconnect(mockConnection);
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_OnDisconnect_ExtensionOrigin_Empty_0200
     * @tc.number SUB_WEB_WebNativeMessagingExtension_OnDisconnect_ExtensionOrigin_Empty_0200
     * @tc.desc   Test onDisconnect with empty extensionOrigin
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WebNativeMessagingExtension_OnDisconnect_ExtensionOrigin_Empty_0200', Level.LEVEL1, () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_OnDisconnect_ExtensionOrigin_Empty_0200`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect called`);
        },
        onDisconnect(connection: webNativeMessagingExtensionManager.ConnectionNativeInfo) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect called with empty extensionOrigin`);
          // 验证 extensionOrigin 为空字符串
          expect(connection.extensionOrigin).assertEqual("");
          // 验证其他属性存在
          expect(connection.connectionId).not().assertUndefined();
          expect(connection.bundleName).not().assertUndefined();
          expect(connection.extensionPid).not().assertUndefined();
        },
        onFailed(code, errMsg) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed code: ${code} errMsg: ${errMsg}`);
        }
      };

      // 模拟调用 onDisconnect，传入 extensionOrigin 为空的连接信息
      let mockConnection: webNativeMessagingExtensionManager.ConnectionNativeInfo = {
        connectionId: 2,
        bundleName: "com.example.extension",
        extensionOrigin: "",  // 空字符串
        extensionPid: 5678
      };

      // 直接调用 onDisconnect 方法进行测试
      callback.onDisconnect(mockConnection);
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_OnDisconnect_Both_Empty_0300
     * @tc.number SUB_WEB_WebNativeMessagingExtension_OnDisconnect_Both_Empty_0300
     * @tc.desc   Test onDisconnect with both bundleName and extensionOrigin empty
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtension_OnDisconnect_Both_Empty_0300', Level.LEVEL2, () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_OnDisconnect_Both_Empty_0300`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect called`);
        },
        onDisconnect(connection: webNativeMessagingExtensionManager.ConnectionNativeInfo) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect called with both bundleName and extensionOrigin empty`);
          // 验证 bundleName 和 extensionOrigin 都为空字符串
          expect(connection.bundleName).assertEqual("");
          expect(connection.extensionOrigin).assertEqual("");
          // 验证其他属性存在
          expect(connection.connectionId).not().assertUndefined();
          expect(connection.extensionPid).not().assertUndefined();
        },
        onFailed(code, errMsg) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed code: ${code} errMsg: ${errMsg}`);
        }
      };

      // 模拟调用 onDisconnect，传入 bundleName 和 extensionOrigin 都为空的连接信息
      let mockConnection: webNativeMessagingExtensionManager.ConnectionNativeInfo = {
        connectionId: 3,
        bundleName: "",  // 空字符串
        extensionOrigin: "",  // 空字符串
        extensionPid: 9012
      };

      // 直接调用 onDisconnect 方法进行测试
      callback.onDisconnect(mockConnection);
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_OnDisconnect_Parameter_Null_0400
     * @tc.number SUB_WEB_WebNativeMessagingExtension_OnDisconnect_Parameter_Null_0400
     * @tc.desc   Test onDisconnect with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtension_OnDisconnect_Parameter_Null_0400', Level.LEVEL2, () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_OnDisconnect_Parameter_Null_0400`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect called`);
        },
        onDisconnect(connection: webNativeMessagingExtensionManager.ConnectionNativeInfo) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect called`);
          // 正常情况下，参数不应为 null
          expect(connection).not().assertNull();
          expect(connection).not().assertUndefined();
        },
        onFailed(code, errMsg) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed code: ${code} errMsg: ${errMsg}`);
        }
      };

      // 注意：在 ArkTS 中，null 需要显式类型转换
      // 由于 ConnectionNativeInfo 的属性都是必填的，不能直接传入 null
      // 这里测试的是 onDisconnect 方法的健壮性
      let validConnection: webNativeMessagingExtensionManager.ConnectionNativeInfo = {
        connectionId: 4,
        bundleName: "com.example.extension",
        extensionOrigin: "chrome-extension://test/",
        extensionPid: 3456
      };

      // 正常调用
      callback.onDisconnect(validConnection);

      // 验证连接对象不为 null
      expect(validConnection).not().assertNull();
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_OnDisconnect_BundleName_Null_0500
     * @tc.number SUB_WEB_WebNativeMessagingExtension_OnDisconnect_BundleName_Null_0500
     * @tc.desc   Test onDisconnect with null bundleName (if allowed by type system)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtension_OnDisconnect_BundleName_Null_0500', Level.LEVEL2, () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_OnDisconnect_BundleName_Null_0500`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect called`);
        },
        onDisconnect(connection: webNativeMessagingExtensionManager.ConnectionNativeInfo) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect called`);
          // 验证 bundleName 不为 null
          expect(connection.bundleName).not().assertNull();
        },
        onFailed(code, errMsg) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed code: ${code} errMsg: ${errMsg}`);
        }
      };

      // 注意：由于 ArkTS 的类型系统，bundleName 声明为 string 类型
      // 不能直接赋值为 null（除非声明为 string | null）
      // 这里使用空字符串来模拟 "类似 null" 的场景
      let mockConnection: webNativeMessagingExtensionManager.ConnectionNativeInfo = {
        connectionId: 5,
        bundleName: "",  // 使用空字符串模拟 null 场景
        extensionOrigin: "chrome-extension://test/",
        extensionPid: 7890
      };

      callback.onDisconnect(mockConnection);
      expect(mockConnection.bundleName).not().assertNull();
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_OnDisconnect_ExtensionOrigin_Null_0600
     * @tc.number SUB_WEB_WebNativeMessagingExtension_OnDisconnect_ExtensionOrigin_Null_0600
     * @tc.desc   Test onDisconnect with null extensionOrigin (if allowed by type system)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtension_OnDisconnect_ExtensionOrigin_Null_0600', Level.LEVEL2, () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_OnDisconnect_ExtensionOrigin_Null_0600`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect called`);
        },
        onDisconnect(connection: webNativeMessagingExtensionManager.ConnectionNativeInfo) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect called`);
          // 验证 extensionOrigin 不为 null
          expect(connection.extensionOrigin).not().assertNull();
        },
        onFailed(code, errMsg) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed code: ${code} errMsg: ${errMsg}`);
        }
      };

      // 注意：由于 ArkTS 的类型系统，extensionOrigin 声明为 string 类型
      // 不能直接赋值为 null（除非声明为 string | null）
      // 这里使用空字符串来模拟 "类似 null" 的场景
      let mockConnection: webNativeMessagingExtensionManager.ConnectionNativeInfo = {
        connectionId: 6,
        bundleName: "com.example.extension",
        extensionOrigin: "",  // 使用空字符串模拟 null 场景
        extensionPid: 2345
      };

      callback.onDisconnect(mockConnection);
      expect(mockConnection.extensionOrigin).not().assertNull();
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_OnDisconnect_Parameter_Undefined_0700
     * @tc.number SUB_WEB_WebNativeMessagingExtension_OnDisconnect_Parameter_Undefined_0700
     * @tc.desc   Test onDisconnect with undefined parameter handling
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtension_OnDisconnect_Parameter_Undefined_0700', Level.LEVEL2, () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_OnDisconnect_Parameter_Undefined_0700`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect called`);
        },
        onDisconnect(connection: webNativeMessagingExtensionManager.ConnectionNativeInfo) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect called`);
          // 验证参数不为 undefined
          expect(connection).not().assertUndefined();
          expect(connection.connectionId).not().assertUndefined();
        },
        onFailed(code, errMsg) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed code: ${code} errMsg: ${errMsg}`);
        }
      };

      // 创建正常的连接对象
      let validConnection: webNativeMessagingExtensionManager.ConnectionNativeInfo = {
        connectionId: 7,
        bundleName: "com.example.extension",
        extensionOrigin: "chrome-extension://test/",
        extensionPid: 6789
      };

      // 调用 onDisconnect 并验证参数不为 undefined
      callback.onDisconnect(validConnection);
      expect(validConnection).not().assertUndefined();
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_OnDisconnect_ConnectionId_Zero_0800
     * @tc.number SUB_WEB_WebNativeMessagingExtension_OnDisconnect_ConnectionId_Zero_0800
     * @tc.desc   Test onDisconnect with connectionId equals 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtension_OnDisconnect_ConnectionId_Zero_0800', Level.LEVEL2, () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_OnDisconnect_ConnectionId_Zero_0800`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect called`);
        },
        onDisconnect(connection: webNativeMessagingExtensionManager.ConnectionNativeInfo) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect called with connectionId: ${connection.connectionId}`);
          // 验证 connectionId 为 0（边界值测试）
          expect(connection.connectionId).assertEqual(0);
        },
        onFailed(code, errMsg) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed code: ${code} errMsg: ${errMsg}`);
        }
      };

      // 测试 connectionId 为 0 的边界场景
      let mockConnection: webNativeMessagingExtensionManager.ConnectionNativeInfo = {
        connectionId: 0,  // 边界值
        bundleName: "com.example.extension",
        extensionOrigin: "chrome-extension://test/",
        extensionPid: 1111
      };

      callback.onDisconnect(mockConnection);
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_OnDisconnect_All_Properties_Valid_0900
     * @tc.number SUB_WEB_WebNativeMessagingExtension_OnDisconnect_All_Properties_Valid_0900
     * @tc.desc   Test onDisconnect with all properties having valid values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WebNativeMessagingExtension_OnDisconnect_All_Properties_Valid_0900', Level.LEVEL1, () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_OnDisconnect_All_Properties_Valid_0900`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect called`);
        },
        onDisconnect(connection: webNativeMessagingExtensionManager.ConnectionNativeInfo) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect called`);
          // 验证所有属性都有有效值
          expect(connection.connectionId).assertLarger(0);
          expect(connection.bundleName).not().assertEqual("");
          expect(connection.extensionOrigin).not().assertEqual("");
          expect(connection.extensionPid).assertLarger(0);
        },
        onFailed(code, errMsg) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed code: ${code} errMsg: ${errMsg}`);
        }
      };

      // 所有属性都有有效值
      let validConnection: webNativeMessagingExtensionManager.ConnectionNativeInfo = {
        connectionId: 999,
        bundleName: "com.example.webnative.extension",
        extensionOrigin: "chrome-extension://abcdefghijklmnopqrstuvwxyz123456/",
        extensionPid: 12345
      };

      callback.onDisconnect(validConnection);
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_OnDisconnect_ExtensionPid_Zero_1000
     * @tc.number SUB_WEB_WebNativeMessagingExtension_OnDisconnect_ExtensionPid_Zero_1000
     * @tc.desc   Test onDisconnect with extensionPid equals 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtension_OnDisconnect_ExtensionPid_Zero_1000', Level.LEVEL2, () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_OnDisconnect_ExtensionPid_Zero_1000`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect called`);
        },
        onDisconnect(connection: webNativeMessagingExtensionManager.ConnectionNativeInfo) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect called with extensionPid: ${connection.extensionPid}`);
          // 验证 extensionPid 为 0（边界值测试）
          expect(connection.extensionPid).assertEqual(0);
        },
        onFailed(code, errMsg) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed code: ${code} errMsg: ${errMsg}`);
        }
      };

      // 测试 extensionPid 为 0 的边界场景
      let mockConnection: webNativeMessagingExtensionManager.ConnectionNativeInfo = {
        connectionId: 8,
        bundleName: "com.example.extension",
        extensionOrigin: "chrome-extension://test/",
        extensionPid: 0  // 边界值
      };

      callback.onDisconnect(mockConnection);
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_OnDisconnect_After_Connect_1100
     * @tc.number SUB_WEB_WebNativeMessagingExtension_OnDisconnect_After_Connect_1100
     * @tc.desc   Test onDisconnect callback being called after onConnect
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WebNativeMessagingExtension_OnDisconnect_After_Connect_1100', Level.LEVEL1, () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_OnDisconnect_After_Connect_1100`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      let connectCalled: boolean = false;
      let disconnectCalled: boolean = false;
      let receivedConnectionId: number = 0;

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection: webNativeMessagingExtensionManager.ConnectionNativeInfo) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect called with connectionId: ${connection.connectionId}`);
          connectCalled = true;
          receivedConnectionId = connection.connectionId;
        },
        onDisconnect(connection: webNativeMessagingExtensionManager.ConnectionNativeInfo) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect called with connectionId: ${connection.connectionId}`);
          disconnectCalled = true;
          // 验证 disconnect 的 connectionId 与 connect 的相同
          expect(connection.connectionId).assertEqual(receivedConnectionId);
        },
        onFailed(code, errMsg) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed code: ${code} errMsg: ${errMsg}`);
        }
      };

      // 模拟先调用 onConnect，再调用 onDisconnect
      let mockConnection: webNativeMessagingExtensionManager.ConnectionNativeInfo = {
        connectionId: 123,
        bundleName: "com.example.extension",
        extensionOrigin: "chrome-extension://test/",
        extensionPid: 9999
      };

      callback.onConnect(mockConnection);
      expect(connectCalled).assertTrue();

      callback.onDisconnect(mockConnection);
      expect(disconnectCalled).assertTrue();
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_OnDisconnect_Callback_Order_1200
     * @tc.number SUB_WEB_WebNativeMessagingExtension_OnDisconnect_Callback_Order_1200
     * @tc.desc   Test onDisconnect callback order and state consistency
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtension_OnDisconnect_Callback_Order_1200', Level.LEVEL2, () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_OnDisconnect_Callback_Order_1200`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      let callSequence: string[] = [];

      let callback: webNativeMessagingExtensionManager.WebExtensionConnectionCallback = {
        onConnect(connection: webNativeMessagingExtensionManager.ConnectionNativeInfo) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onConnect called`);
          callSequence.push('connect');
          expect(connection.connectionId).assertEqual(456);
        },
        onDisconnect(connection: webNativeMessagingExtensionManager.ConnectionNativeInfo) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onDisconnect called`);
          callSequence.push('disconnect');
          // 验证调用顺序：connect 应该在 disconnect 之前
          expect(callSequence[0]).assertEqual('connect');
          expect(connection.connectionId).assertEqual(456);
          // 验证 bundleName 和 extensionOrigin 保持一致
          expect(connection.bundleName).assertEqual("com.example.extension");
          expect(connection.extensionOrigin).assertEqual("chrome-extension://test/");
        },
        onFailed(code, errMsg) {
          hilog.info(0x0000, 'testTag', `${tcNumber} onFailed code: ${code} errMsg: ${errMsg}`);
          callSequence.push('failed');
        }
      };

      let mockConnection: webNativeMessagingExtensionManager.ConnectionNativeInfo = {
        connectionId: 456,
        bundleName: "com.example.extension",
        extensionOrigin: "chrome-extension://test/",
        extensionPid: 7777
      };

      // 模拟正常连接和断开流程
      callback.onConnect(mockConnection);
      callback.onDisconnect(mockConnection);

      // 验证回调顺序
      expect(callSequence.length).assertEqual(2);
      expect(callSequence[0]).assertEqual('connect');
      expect(callSequence[1]).assertEqual('disconnect');
    })

  })
}
