/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
// Compilation Tests - 耗时测试（异步）
export const TestCompilationConstructForCache0100: () => Promise<number>;
export const TestCompilationConstructForCache0200: () => Promise<number>;
export const TestCompilationAddExtensionConfig0100: () => Promise<number>;
export const TestCompilationAddExtensionConfig0200: () => Promise<number>;
export const TestCompilationAddExtensionConfig0300: () => Promise<number>;
export const TestCompilationAddExtensionConfig0400: () => Promise<number>;
export const TestCompilationAddExtensionConfig0500: () => Promise<number>;
export const TestCompilationConstructWithOfflineModelFile0100: () => Promise<number>;
export const TestCompilationConstructWithOfflineModelFile0200: () => Promise<number>;
export const TestCompilationConstructWithOfflineModelBuffer0100: () => Promise<number>;
export const TestCompilationConstructWithOfflineModelBuffer0200: () => Promise<number>;
export const TestCompilationExportCacheToBuffer0100: () => Promise<number>;
export const TestCompilationExportCacheToBuffer0200: () => Promise<number>;
export const TestCompilationImportCacheFromBuffer0100: () => Promise<number>;
export const TestCompilationImportCacheFromBuffer0200: () => Promise<number>;
export const TestCompilationImportCacheFromBuffer0300: () => Promise<number>;

// Compilation Tests - 快速测试（同步）
export const TestCompilationReturnCodeCheck0100: () => number;
export const TestCompilationReturnCodeCheck0200: () => number;
export const TestCompilationReturnCodeCheck0300: () => number;
export const TestCompilationReturnCodeCheck0400: () => number;
export const TestCompilationReturnCodeCheck0500: () => number;
export const TestCompilationReturnCodeCheck0600: () => number;
export const TestCompilationReturnCodeCheck0700: () => number;
export const TestCompilationReturnCodeCheck0800: () => number;
export const TestCompilationReturnCodeCheck0900: () => number;

// Executor Tests - 耗时测试（异步）
export const TestExecutorConstruct0100: () => Promise<number>;
export const TestExecutorRunSync0100: () => Promise<number>;
export const TestExecutorRunSync0200: () => Promise<number>;
export const TestExecutorRunSync0300: () => Promise<number>;
export const TestExecutorRunSync0400: () => Promise<number>;
export const TestExecutorRunSync0500: () => Promise<number>;
export const TestExecutorRunSync0600: () => Promise<number>;
export const TestExecutorRunSync0700: () => Promise<number>;
export const TestExecutorRunSync0800: () => Promise<number>;
export const TestExecutorRunSync0900: () => Promise<number>;
export const TestExecutorRunAsync0100: () => Promise<number>;
export const TestExecutorRunAsync0200: () => Promise<number>;
export const TestExecutorRunAsync0300: () => Promise<number>;
export const TestExecutorRunAsync0400: () => Promise<number>;
export const TestExecutorRunAsync0500: () => Promise<number>;
export const TestExecutorRunAsync0600: () => Promise<number>;
export const TestExecutorGetOutputShape0300: () => Promise<number>;

// Executor Tests - 快速测试（同步）
export const TestExecutorDestroy0100: () => number;
export const TestExecutorDestroy0200: () => number;
export const TestExecutorSetOnRunDone0100: () => number;
export const TestExecutorSetOnRunDone0200: () => number;
export const TestExecutorSetOnServiceDied0100: () => number;
export const TestExecutorSetOnServiceDied0200: () => number;
export const TestExecutorGetOutputShape0100: () => number;
export const TestExecutorGetOutputShape0200: () => number;
export const TestExecutorGetInputCount0100: () => number;
export const TestExecutorGetInputCount0200: () => number;
export const TestExecutorGetInputCount0300: () => number;
export const TestExecutorGetOutputCount0100: () => number;
export const TestExecutorGetOutputCount0200: () => number;
export const TestExecutorGetOutputCount0300: () => number;
export const TestExecutorCreateInputTensorDesc0100: () => number;
export const TestExecutorCreateInputTensorDesc0200: () => number;
export const TestExecutorCreateInputTensorDesc0300: () => number;
export const TestExecutorCreateOutputTensorDesc0100: () => number;
export const TestExecutorCreateOutputTensorDesc0200: () => number;
export const TestExecutorCreateOutputTensorDesc0300: () => number;
export const TestExecutorGetInputDimRange0100: () => number;
export const TestExecutorGetInputDimRange0200: () => number;
export const TestExecutorGetInputDimRange0500: () => Promise<number>;
export const TestExecutorGetInputDimRange0600: () => Promise<number>;
export const TestExecutorGetInputDimRange0700: () => Promise<number>;

// Model Tests - 全部同步
export const TestModelCreateQuantParam0100: () => number;
export const TestModelDestroyQuantParam0100: () => number;
export const TestModelDestroyQuantParam0200: () => number;
export const TestModelSetQuantParam0100: () => number;
export const TestModelSetQuantParam0200: () => number;
export const TestModelSetQuantParam0300: () => number;
export const TestModelSetQuantParam0400: () => number;
export const TestModelSetQuantParam0500: () => number;
export const TestModelSetQuantParam0600: () => number;
export const TestModelSetQuantParam0700: () => number;
export const TestModelSetQuantParam0800: () => number;
export const TestModelSetQuantParam0900: () => number;
export const TestModelAddTensorToModel0100: () => number;
export const TestModelAddTensorToModel0200: () => number;
export const TestModelSetTensorData0100: () => number;
export const TestModelSetTensorData0200: () => number;
export const TestModelSetTensorData0300: () => number;
export const TestModelSetTensorData0400: () => number;
export const TestModelSetTensorType0100: () => number;
export const TestModelSetTensorType0200: () => number;
export const TestModelSetTensorType0300: () => number;

// TensorDesc Tests - 全部同步 (30个)
export const TestTensorDescCreate0100: () => number;
export const TestTensorDescDestroy0100: () => number;
export const TestTensorDescDestroy0200: () => number;
export const TestTensorDescDestroy0300: () => number;
export const TestTensorDescSetDataType0100: () => number;
export const TestTensorDescSetDataType0200: () => number;
export const TestTensorDescSetDataType0300: () => number;
export const TestTensorDescGetDataType0100: () => number;
export const TestTensorDescGetDataType0200: () => number;
export const TestTensorDescSetShape0100: () => number;
export const TestTensorDescSetShape0200: () => number;
export const TestTensorDescGetShape0100: () => number;
export const TestTensorDescGetShape0200: () => number;
export const TestTensorDescGetShape0300: () => number;
export const TestTensorDescSetFormat0100: () => number;
export const TestTensorDescSetFormat0200: () => number;
export const TestTensorDescGetFormat0100: () => number;
export const TestTensorDescGetFormat0200: () => number;
export const TestTensorDescGetFormat0300: () => number;
export const TestTensorDescGetElementCount0100: () => number;
export const TestTensorDescGetElementCount0200: () => number;
export const TestTensorDescGetElementCount0300: () => number;
export const TestTensorDescGetByteSize0100: () => number;
export const TestTensorDescGetByteSize0200: () => number;
export const TestTensorDescGetByteSize0300: () => number;
export const TestTensorDescSetName0100: () => number;
export const TestTensorDescSetName0200: () => number;
export const TestTensorDescGetName0100: () => number;
export const TestTensorDescGetName0200: () => number;
export const TestTensorDescGetName0300: () => number;

// Tensor Tests - 全部同步 (27个)
export const TestTensorCreate0100: () => number;
export const TestTensorCreate0200: () => number;
export const TestTensorCreate0300: () => number;
export const TestTensorCreateWithSize0100: () => number;
export const TestTensorCreateWithSize0200: () => number;
export const TestTensorCreateWithSize0300: () => number;
export const TestTensorCreateWithFd0100: () => number;
export const TestTensorCreateWithFd0200: () => number;
export const TestTensorCreateWithFd0300: () => number;
export const TestTensorCreateWithFd0400: () => number;
export const TestTensorCreateWithFd0500: () => number;
export const TestTensorGetDataBuffer0100: () => number;
export const TestTensorGetDataBuffer0200: () => number;
export const TestTensorDestroy0100: () => number;
export const TestTensorDestroy0200: () => number;
export const TestTensorGetTensorDesc0100: () => number;
export const TestTensorGetTensorDesc0200: () => number;
export const TestTensorGetSize0100: () => number;
export const TestTensorGetSize0200: () => number;
export const TestTensorGetSize0300: () => number;
export const TestTensorGetFd0100: () => number;
export const TestTensorGetFd0200: () => number;
export const TestTensorGetOffset0100: () => number;
export const TestTensorGetOffset0200: () => number;
