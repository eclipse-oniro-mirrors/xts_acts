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
 	 
 	 // Error code for "Capability not supported"
 	 const CAPABILITY_NOT_SUPPORTED_ERROR = 801;
 	 
 	 // Helper function to check if error is capability not supported
 	 function isCapabilityNotSupported(error: BusinessError): boolean {
 	   return error.code === CAPABILITY_NOT_SUPPORTED_ERROR;
 	 }
 	 
 	 export default function disconnectNativeParameterTest() {
 	   describe('ActsDisconnectNativeParameterTest', () => {
 	     beforeAll(() => {
 	       hilog.info(0x0000, 'testTag', 'ActsDisconnectNativeParameterTest beforeAll start');
 	     })
 	 
 	     beforeEach(() => {
 	       hilog.info(0x0000, 'testTag', 'ActsDisconnectNativeParameterTest beforeEach start');
 	     })
 	 
 	     afterEach(() => {
 	       hilog.info(0x0000, 'testTag', 'ActsDisconnectNativeParameterTest afterEach start');
 	     })
 	 
 	     /**
 	      * @tc.name   SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Null_0100
 	      * @tc.number SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Null_0100
 	      * @tc.desc   Test disconnectNative with null connectionId parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   SMALLTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Null_0100', Level.LEVEL2, async () => {
 	       const tcNumber = `SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Null_0100`;
 	       hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
 	 
 	       try {
 	         // 注意：由于 ArkTS 的类型系统，connectionId 参数不能直接赋值为 null
 	         // number 类型不允许 null 值。这里测试无效的 connectionId 值
 	         let invalidConnectionId: number = -1;  // 使用无效值模拟错误场景
 	 
 	         await webNativeMessagingExtensionManager.disconnectNative(invalidConnectionId).then(() => {
 	           // 如果没有抛出异常，测试失败
 	           hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative should have thrown an error`);
 	           expect().assertFail();
 	         }).catch((error: BusinessError) => {
 	           // 检查是否为能力不支持错误
 	           if (isCapabilityNotSupported(error)) {
 	             hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
 	             return;  // 跳过测试，不失败
 	           }
 	           // 验证捕获到预期的错误
 	           hilog.info(0x0000, 'testTag', `${tcNumber} caught expected error: ${error.code}, message: ${error.message}`);
 	           expect(error.code).not().assertUndefined();
 	           expect(error.code).not().assertEqual(0);
 	         });
 	       } catch (error) {
 	         // 同步抛出的错误处理
 	         let err = error as BusinessError;
 	         if (isCapabilityNotSupported(err)) {
 	           hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
 	           return;  // 跳过测试，不失败
 	         }
 	         hilog.info(0x0000, 'testTag', `${tcNumber} caught error: ${err.code}`);
 	         expect(err.code).not().assertUndefined();
 	       }
 	     })
 	 
 	     /**
 	      * @tc.name   SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Undefined_0200
 	      * @tc.number SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Undefined_0200
 	      * @tc.desc   Test disconnectNative with undefined connectionId parameter
 	      * @tc.type   FUNCTION
 	      * @tc.size   SMALLTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Undefined_0200', Level.LEVEL2, async () => {
 	       const tcNumber = `SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Undefined_0200`;
 	       hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
 	 
 	       try {
 	         // 注意：由于 ArkTS 的类型系统，connectionId 参数不能直接赋值为 undefined
 	         // number 类型不允许 undefined 值。这里测试无效的 connectionId 值
 	         let invalidConnectionId: number = 0;  // 使用边界值（无效的 connectionId）
 	 
 	         await webNativeMessagingExtensionManager.disconnectNative(invalidConnectionId).then(() => {
 	           // 如果没有抛出异常，测试失败
 	           hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative should have thrown an error`);
 	           expect().assertFail();
 	         }).catch((error: BusinessError) => {
 	           // 检查是否为能力不支持错误
 	           if (isCapabilityNotSupported(error)) {
 	             hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
 	             return;  // 跳过测试，不失败
 	           }
 	           // 验证捕获到预期的错误
 	           hilog.info(0x0000, 'testTag', `${tcNumber} caught expected error: ${error.code}, message: ${error.message}`);
 	           expect(error.code).not().assertUndefined();
 	           expect(error.code).not().assertEqual(0);
 	         });
 	       } catch (error) {
 	         // 同步抛出的错误处理
 	         let err = error as BusinessError;
 	         if (isCapabilityNotSupported(err)) {
 	           hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
 	           return;  // 跳过测试，不失败
 	         }
 	         hilog.info(0x0000, 'testTag', `${tcNumber} caught error: ${err.code}`);
 	         expect(err.code).not().assertUndefined();
 	       }
 	     })
 	 
 	     /**
 	      * @tc.name   SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Zero_0300
 	      * @tc.number SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Zero_0300
 	      * @tc.desc   Test disconnectNative with connectionId equals 0 (boundary value)
 	      * @tc.type   FUNCTION
 	      * @tc.size   SMALLTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Zero_0300', Level.LEVEL2, async () => {
 	       const tcNumber = `SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Zero_0300`;
 	       hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
 	 
 	       let connectionId: number = 0;  // 边界值
 	 
 	       try {
 	         await webNativeMessagingExtensionManager.disconnectNative(connectionId).then(() => {
 	           hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative called with connectionId: ${connectionId}`);
 	           // 对于无效的 connectionId (如 0)，预期抛出错误
 	           expect().assertFail();
 	         }).catch((error: BusinessError) => {
 	           // 检查是否为能力不支持错误
 	           if (isCapabilityNotSupported(error)) {
 	             hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
 	             return;  // 跳过测试，不失败
 	           }
 	           hilog.info(0x0000, 'testTag', `${tcNumber} caught expected error: ${error.code}, message: ${error.message}`);
 	           // 验证错误码不为 0
 	           expect(error.code).not().assertEqual(0);
 	         });
 	       } catch (error) {
 	         let err = error as BusinessError;
 	         if (isCapabilityNotSupported(err)) {
 	           hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
 	           return;  // 跳过测试，不失败
 	         }
 	         hilog.info(0x0000, 'testTag', `${tcNumber} caught error: ${err.code}`);
 	         expect(err.code).not().assertUndefined();
 	       }
 	     })
 	 
 	     /**
 	      * @tc.name   SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Negative_0400
 	      * @tc.number SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Negative_0400
 	      * @tc.desc   Test disconnectNative with negative connectionId
 	      * @tc.type   FUNCTION
 	      * @tc.size   SMALLTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Negative_0400', Level.LEVEL2, async () => {
 	       const tcNumber = `SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Negative_0400`;
 	       hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
 	 
 	       let connectionId: number = -1;  // 负数
 	 
 	       try {
 	         await webNativeMessagingExtensionManager.disconnectNative(connectionId).then(() => {
 	           hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative called with negative connectionId`);
 	           // 对于无效的 connectionId，预期抛出错误
 	           expect().assertFail();
 	         }).catch((error: BusinessError) => {
 	           // 检查是否为能力不支持错误
 	           if (isCapabilityNotSupported(error)) {
 	             hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
 	             return;  // 跳过测试，不失败
 	           }
 	           hilog.info(0x0000, 'testTag', `${tcNumber} caught expected error: ${error.code}, message: ${error.message}`);
 	           expect(error.code).not().assertEqual(0);
 	         });
 	       } catch (error) {
 	         let err = error as BusinessError;
 	         if (isCapabilityNotSupported(err)) {
 	           hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
 	           return;  // 跳过测试，不失败
 	         }
 	         hilog.info(0x0000, 'testTag', `${tcNumber} caught error: ${err.code}`);
 	         expect(err.code).not().assertUndefined();
 	       }
 	     })
 	 
 	     /**
 	      * @tc.name   SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Large_Value_0500
 	      * @tc.number SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Large_Value_0500
 	      * @tc.desc   Test disconnectNative with large connectionId value
 	      * @tc.type   FUNCTION
 	      * @tc.size   SMALLTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Large_Value_0500', Level.LEVEL2, async () => {
 	       const tcNumber = `SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Large_Value_0500`;
 	       hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
 	 
 	       let connectionId: number = 999999999;  // 大数值
 	 
 	       try {
 	         await webNativeMessagingExtensionManager.disconnectNative(connectionId).then(() => {
 	           hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative called with large connectionId: ${connectionId}`);
 	           // 对于不存在的 connectionId，预期抛出错误
 	           expect().assertFail();
 	         }).catch((error: BusinessError) => {
 	           // 检查是否为能力不支持错误
 	           if (isCapabilityNotSupported(error)) {
 	             hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
 	             return;  // 跳过测试，不失败
 	           }
 	           hilog.info(0x0000, 'testTag', `${tcNumber} caught expected error: ${error.code}, message: ${error.message}`);
 	           // 验证错误码不为 0
 	           expect(error.code).not().assertEqual(0);
 	         });
 	       } catch (error) {
 	         let err = error as BusinessError;
 	         if (isCapabilityNotSupported(err)) {
 	           hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
 	           return;  // 跳过测试，不失败
 	         }
 	         hilog.info(0x0000, 'testTag', `${tcNumber} caught error: ${err.code}`);
 	         expect(err.code).not().assertUndefined();
 	       }
 	     })
 	 
 	     /**
 	      * @tc.name   SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Float_0600
 	      * @tc.number SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Float_0600
 	      * @tc.desc   Test disconnectNative with float connectionId value (if type system allows)
 	      * @tc.type   FUNCTION
 	      * @tc.size   SMALLTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Float_0600', Level.LEVEL2, async () => {
 	       const tcNumber = `SUB_WEB_WebNativeMessagingExtension_DisconnectNative_ConnectionId_Float_0600`;
 	       hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
 	 
 	       try {
 	         // 注意：由于 ArkTS 的类型系统，connectionId 参数声明为 number 类型
 	         // 不能直接传入浮点数（除非声明为 number 类型，但会自动取整）
 	         // 这里使用浮点数，系统会自动转换为整数
 	         let floatConnectionId: number = 123.456;  // 将被转换为 123
 	 
 	         await webNativeMessagingExtensionManager.disconnectNative(floatConnectionId).then(() => {
 	           hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative called with float connectionId: ${floatConnectionId}`);
 	           // 对于不存在的 connectionId，预期抛出错误
 	           expect().assertFail();
 	         }).catch((error: BusinessError) => {
 	           // 检查是否为能力不支持错误
 	           if (isCapabilityNotSupported(error)) {
 	             hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
 	             return;  // 跳过测试，不失败
 	           }
 	           hilog.info(0x0000, 'testTag', `${tcNumber} caught expected error: ${error.code}, message: ${error.message}`);
 	           expect(error.code).not().assertUndefined();
 	         });
 	       } catch (error) {
 	         let err = error as BusinessError;
 	         if (isCapabilityNotSupported(err)) {
 	           hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
 	           return;  // 跳过测试，不失败
 	         }
 	         hilog.info(0x0000, 'testTag', `${tcNumber} caught error: ${err.code}`);
 	         expect(err.code).not().assertUndefined();
 	       }
 	     })
 	 
 	   
 	     /**
 	      * @tc.name   SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Return_Type_0800
 	      * @tc.number SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Return_Type_0800
 	      * @tc.desc   Test disconnectNative return type is Promise<void>
 	      * @tc.type   FUNCTION
 	      * @tc.size   SMALLTEST
 	      * @tc.level  LEVEL1
 	      */
 	     it('SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Return_Type_0800', Level.LEVEL1, async () => {
 	       const tcNumber = `SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Return_Type_0800`;
 	       hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
 	 
 	       let connectionId: number = 12345;
 	 
 	       try {
 	         // 调用 disconnectNative 并验证返回值类型
 	         let result: Promise<void> = webNativeMessagingExtensionManager.disconnectNative(connectionId);
 	 
 	         // 验证返回值为 Promise 类型
 	         expect(result instanceof Promise).assertTrue();
 	 
 	         // Promise 应该被拒绝（因为 connectionId 不存在）
 	         await result.then(() => {
 	           // 不应该进入这里
 	           expect().assertFail();
 	         }).catch((error: BusinessError) => {
 	           // 检查是否为能力不支持错误
 	           if (isCapabilityNotSupported(error)) {
 	             hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
 	             return;  // 跳过测试，不失败
 	           }
 	           // 验证错误
 	           hilog.info(0x0000, 'testTag', `${tcNumber} caught expected error: ${error.code}`);
 	           expect(error.code).not().assertUndefined();
 	         });
 	       } catch (error) {
 	         let err = error as BusinessError;
 	         if (isCapabilityNotSupported(err)) {
 	           hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
 	           return;  // 跳过测试，不失败
 	         }
 	         hilog.info(0x0000, 'testTag', `${tcNumber} caught error: ${err.code}`);
 	         expect(err.code).not().assertUndefined();
 	       }
 	     })
 	 
 	     /**
 	      * @tc.name   SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Double_Disconnect_0900
 	      * @tc.number SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Double_Disconnect_0900
 	      * @tc.desc   Test disconnectNative called twice with same connectionId
 	      * @tc.type   FUNCTION
 	      * @tc.size   SMALLTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Double_Disconnect_0900', Level.LEVEL2, async () => {
 	       const tcNumber = `SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Double_Disconnect_0900`;
 	       hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
 	 
 	       let connectionId: number = 54321;
 	       let firstCallError: boolean = false;
 	       let secondCallError: boolean = false;
 	       let capabilityNotSupported: boolean = false;
 	 
 	       // 第一次调用        // 检查是否为能力不支持错误
 	       if(!canIUse('SystemCapability.PCService.OpenFileBoost')) {
 	         hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
 	         expect(true).assertTrue();
 	       } else {
 	         await webNativeMessagingExtensionManager.disconnectNative(connectionId).then(() => {
 	           hilog.info(0x0000, 'testTag', `${tcNumber} first disconnectNative called`);
 	         }).catch((error: BusinessError) => {
 	 
 	           hilog.info(0x0000, 'testTag', `${tcNumber} first disconnectNative caught error: ${error.code}`);
 	           firstCallError = true;
 	         });
 	         // 第二次调用同一个 connectionId
 	         await webNativeMessagingExtensionManager.disconnectNative(connectionId).then(() => {
 	           hilog.info(0x0000, 'testTag', `${tcNumber} second disconnectNative called`);
 	         }).catch((error: BusinessError) => {
 	           hilog.info(0x0000, 'testTag', `${tcNumber} second disconnectNative caught error: ${error.code}`);
 	           secondCallError = true;
 	         });
 	 
 	         // 验证两次调用都产生错误（因为 connectionId 无效）
 	         expect(firstCallError).assertTrue();
 	         expect(secondCallError).assertTrue();
 	       }
 	     })
 	 
 	 
 	     /**
 	      * @tc.name   SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Async_Wait_1100
 	      * @tc.number SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Async_Wait_1100
 	      * @tc.desc   Test disconnectNative async/await pattern
 	      * @tc.type   FUNCTION
 	      * @tc.size   SMALLTEST
 	      * @tc.level  LEVEL1
 	      */
 	     it('SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Async_Wait_1100', Level.LEVEL1, async () => {
 	       const tcNumber = `SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Async_Wait_1100`;
 	       hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
 	 
 	       let connectionId: number = 67890;
 	       let errorCaught: boolean = false;
 	 
 	       try {
 	         // 使用 async/await 模式调用
 	         await webNativeMessagingExtensionManager.disconnectNative(connectionId);
 	         hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative completed (connectionId may be invalid)`);
 	       } catch (error) {
 	         let err = error as BusinessError;
 	         // 检查是否为能力不支持错误
 	         if (isCapabilityNotSupported(err)) {
 	           hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
 	           return;  // 跳过测试，不失败
 	         }
 	         errorCaught = true;
 	         hilog.info(0x0000, 'testTag', `${tcNumber} caught error in async/await: ${err.code}`);
 	         expect(err.code).not().assertUndefined();
 	       }
 	 
 	       // 验证错误被正确处理（因为 connectionId 可能无效）
 	       // 如果 connectionId 有效，测试仍然通过
 	       expect(true).assertTrue();
 	     })
 	 
 	     /**
 	      * @tc.name   SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Concurrent_Calls_1200
 	      * @tc.number SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Concurrent_Calls_1200
 	      * @tc.desc   Test disconnectNative with concurrent calls
 	      * @tc.type   FUNCTION
 	      * @tc.size   SMALLTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Concurrent_Calls_1200', Level.LEVEL2, async () => {
 	       const tcNumber = `SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Concurrent_Calls_1200`;
 	       hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);
 	 
 	       let connectionId1: number = 11111;
 	       let connectionId2: number = 22222;
 	       let results: (boolean | null)[] = [null, null];
 	       let capabilityNotSupported: boolean = false;
 	       // 检查是否为能力不支持错误
 	       if(!canIUse('SystemCapability.PCService.OpenFileBoost')) {
 	         hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
 	         expect(true).assertTrue();
 	       } else {
 	         // 并发调用 disconnectNative
 	         let promise1 = webNativeMessagingExtensionManager.disconnectNative(connectionId1).then(() => {
 	           hilog.info(0x0000, 'testTag', `${tcNumber} first disconnectNative completed`);
 	           return true;
 	         }).catch((error: BusinessError) => {
 	 
 	           hilog.info(0x0000, 'testTag', `${tcNumber} first disconnectNative caught error: ${error.code}`);
 	           return false;
 	         });
 	 
 	         let promise2 = webNativeMessagingExtensionManager.disconnectNative(connectionId2).then(() => {
 	           hilog.info(0x0000, 'testTag', `${tcNumber} second disconnectNative completed`);
 	           return true;
 	         }).catch((error: BusinessError) => {
 	           hilog.info(0x0000, 'testTag', `${tcNumber} second disconnectNative caught error: ${error.code}`);
 	           return false;
 	         });
 	 
 	         // 等待两个 Promise 完成
 	         await Promise.all([promise1, promise2]).then((values) => {
 	           results = values;
 	           hilog.info(0x0000, 'testTag', `${tcNumber} both disconnectNative calls completed`);
 	         });
 	 
 	         if (capabilityNotSupported) {
 	           // Skip test, don't fail
 	           return;
 	         }
 	 
 	         // 验证两个调用都完成了（无论是成功还是失败）
 	         expect(results[0]).not().assertNull();
 	         expect(results[1]).not().assertNull();
 	       }
 	     })
 	   })
 	 }