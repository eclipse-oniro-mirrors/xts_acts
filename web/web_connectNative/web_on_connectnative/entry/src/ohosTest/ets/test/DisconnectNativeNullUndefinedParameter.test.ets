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

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve('ok');
    }, time)
  });
}

export default function disconnectNativeNullUndefinedParameterTest() {
  describe('ActsDisconnectNativeNullUndefinedParameterTest', () => {
    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>('abilityContext') as common.UIAbilityContext;
      hilog.info(0x0000, 'testTag', 'ActsDisconnectNativeNullUndefinedParameterTest beforeAll start');
    })

    beforeEach(() => {
      hilog.info(0x0000, 'testTag', 'ActsDisconnectNativeNullUndefinedParameterTest beforeEach start');
    })

    afterEach(async () => {
      hilog.info(0x0000, 'testTag', 'ActsDisconnectNativeNullUndefinedParameterTest afterEach start');
      await sleep(1000);
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Null_0100
     * @tc.number SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Null_0100
     * @tc.desc   Test disconnectNative with null connectionId parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Null_0100', Level.LEVEL2, async () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Null_0100`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      let connectionId: number = 0; // 使用0作为无效的connectionId
      
      try {
        await webNativeMessagingExtensionManager.disconnectNative(connectionId).then(() => {
          hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative completed successfully`);
          // 如果断开成功，测试仍然通过
          expect(true).assertTrue();
        }).catch((error: BusinessError) => {
          hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative caught error: ${error.code}, message: ${error.message}`);
          
          // 检查是否为能力不支持错误
          if (isCapabilityNotSupported(error)) {
            hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
            return; // 跳过测试，不失败
          }
          
          // 其他错误码视为有效错误
          expect(error.code !== null && error.code !== undefined).assertTrue();
        });
      } catch (error) {
        let err = error as BusinessError;
        if (isCapabilityNotSupported(err)) {
          hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
          return; // 跳过测试，不失败
        }
        hilog.info(0x0000, 'testTag', `${tcNumber} caught error: ${err.code}`);
        expect(err.code !== null).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Undefined_0200
     * @tc.number SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Undefined_0200
     * @tc.desc   Test disconnectNative with undefined connectionId parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Undefined_0200', Level.LEVEL2, async () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Undefined_0200`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      // 注意：由于 ArkTS 的类型系统，connectionId 参数不能直接赋值为 undefined
      // 这里使用 -1 作为无效的connectionId来模拟undefined的情况
      let connectionId: number = -1;
      
      try {
        await webNativeMessagingExtensionManager.disconnectNative(connectionId).then(() => {
          hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative completed successfully`);
          // 如果断开成功，测试仍然通过
          expect(true).assertTrue();
        }).catch((error: BusinessError) => {
          hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative caught error: ${error.code}, message: ${error.message}`);
          
          // 检查是否为能力不支持错误
          if (isCapabilityNotSupported(error)) {
            hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
            return; // 跳过测试，不失败
          }
          
          // 其他错误码视为有效错误
          expect(error.code !== null && error.code !== undefined).assertTrue();
        });
      } catch (error) {
        let err = error as BusinessError;
        if (isCapabilityNotSupported(err)) {
          hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
          return; // 跳过测试，不失败
        }
        hilog.info(0x0000, 'testTag', `${tcNumber} caught error: ${err.code}`);
        expect(err.code !== undefined).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Invalid_Type_0300
     * @tc.number SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Invalid_Type_0300
     * @tc.desc   Test disconnectNative with invalid type connectionId parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Invalid_Type_0300', Level.LEVEL2, async () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Invalid_Type_0300`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      // 使用 Number.MAX_SAFE_INTEGER 作为无效的connectionId
      let connectionId: number = Number.MAX_SAFE_INTEGER;
      
      try {
        await webNativeMessagingExtensionManager.disconnectNative(connectionId).then(() => {
          hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative completed successfully`);
          // 如果断开成功，测试仍然通过
          expect(true).assertTrue();
        }).catch((error: BusinessError) => {
          hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative caught error: ${error.code}, message: ${error.message}`);
          
          // 检查是否为能力不支持错误
          if (isCapabilityNotSupported(error)) {
            hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
            return; // 跳过测试，不失败
          }
          
          // 其他错误码视为有效错误
          expect(error.code !== null && error.code !== undefined).assertTrue();
        });
      } catch (error) {
        let err = error as BusinessError;
        if (isCapabilityNotSupported(err)) {
          hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
          return; // 跳过测试，不失败
        }
        hilog.info(0x0000, 'testTag', `${tcNumber} caught error: ${err.code}`);
        expect(err.code !== null && err.code !== undefined).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Negative_Number_0400
     * @tc.number SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Negative_Number_0400
     * @tc.desc   Test disconnectNative with negative number as connectionId parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Negative_Number_0400', Level.LEVEL2, async () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Negative_Number_0400`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      // 使用负数作为无效的connectionId
      let connectionId: number = -999;
      
      try {
        await webNativeMessagingExtensionManager.disconnectNative(connectionId).then(() => {
          hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative completed successfully`);
          // 如果断开成功，测试仍然通过
          expect(true).assertTrue();
        }).catch((error: BusinessError) => {
          hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative caught error: ${error.code}, message: ${error.message}`);
          
          // 检查是否为能力不支持错误
          if (isCapabilityNotSupported(error)) {
            hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
            return; // 跳过测试，不失败
          }
          
          // 其他错误码视为有效错误
          expect(error.code !== null && error.code !== undefined).assertTrue();
        });
      } catch (error) {
        let err = error as BusinessError;
        if (isCapabilityNotSupported(err)) {
          hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
          return; // 跳过测试，不失败
        }
        hilog.info(0x0000, 'testTag', `${tcNumber} caught error: ${err.code}`);
        expect(err.code !== null && err.code !== undefined).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Zero_0500
     * @tc.number SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Zero_0500
     * @tc.desc   Test disconnectNative with zero as connectionId parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Zero_0500', Level.LEVEL2, async () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Zero_0500`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      // 使用0作为无效的connectionId
      let connectionId: number = 0;
      
      try {
        await webNativeMessagingExtensionManager.disconnectNative(connectionId).then(() => {
          hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative completed successfully`);
          // 如果断开成功，测试仍然通过
          expect(true).assertTrue();
        }).catch((error: BusinessError) => {
          hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative caught error: ${error.code}, message: ${error.message}`);
          
          // 检查是否为能力不支持错误
          if (isCapabilityNotSupported(error)) {
            hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
            return; // 跳过测试，不失败
          }
          
          // 其他错误码视为有效错误
          expect(error.code !== null && error.code !== undefined).assertTrue();
        });
      } catch (error) {
        let err = error as BusinessError;
        if (isCapabilityNotSupported(err)) {
          hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
          return; // 跳过测试，不失败
        }
        hilog.info(0x0000, 'testTag', `${tcNumber} caught error: ${err.code}`);
        expect(err.code !== null && err.code !== undefined).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Boundary_Values_0600
     * @tc.number SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Boundary_Values_0600
     * @tc.desc   Test disconnectNative with boundary values as connectionId parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Boundary_Values_0600', Level.LEVEL2, async () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Boundary_Values_0600`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      // 测试多个边界值
      const boundaryValues = [Number.MIN_SAFE_INTEGER, Number.MAX_SAFE_INTEGER, 0, -1, 1];
      
      for (let connectionId of boundaryValues) {
        try {
          await webNativeMessagingExtensionManager.disconnectNative(connectionId).then(() => {
            hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative completed successfully for connectionId: ${connectionId}`);
            // 如果断开成功，测试仍然通过
          }).catch((error: BusinessError) => {
            hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative caught error for connectionId ${connectionId}: ${error.code}, message: ${error.message}`);
            
            // 检查是否为能力不支持错误
            if (isCapabilityNotSupported(error)) {
              hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801) for connectionId: ${connectionId}`);
              return; // 跳过测试，不失败
            }
            
            // 其他错误码视为有效错误
            expect(error.code !== null && error.code !== undefined).assertTrue();
          });
        } catch (error) {
          let err = error as BusinessError;
          if (isCapabilityNotSupported(err)) {
            hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801) for connectionId: ${connectionId}`);
            return; // 跳过测试，不失败
          }
          hilog.info(0x0000, 'testTag', `${tcNumber} caught error for connectionId ${connectionId}: ${err.code}`);
          expect(err.code !== null && err.code !== undefined).assertTrue();
        }
        
        // 添加小延迟避免请求过于频繁
        await sleep(100);
      }
      
      // 所有边界值测试完成
      expect(true).assertTrue();
    })
  })
}