/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

export const CreateBufferCopy: () => object;
export const IsBuffer: (buffer) => boolean;
export const GetBufferInfo: (buffer) => boolean;
export const CreateExternalBufferTest: () => object;
export const createBufferSizeZeroTest: () => object;
export const CreateBufferMaxLength: () => object;
export const CreateBufferExceedMaxLength: () => object;
export const CreateBufferInvalidEnv: () => object;
export const CreateBufferInvalidData: () => object;
export const CreateBufferInvalidResult: () => object;
export const CreateInt32Test: () => object;
export const GetBufferInfoNonBuffer: (object) => object;
export const TestMultipleOperations: () => object;
export const TestExternalArrayBuffer: () => object;
export const TestArrayBufferThreadSafety: () => boolean;
export const TestArrayBufferComparison: () => number;
export const NapiArrayBufferTest01: () => boolean;
export const NapiArrayBufferTest02: () => boolean;
export const NapiArrayBufferTest03: () => boolean;
export const NapiArrayBufferTest04: () => boolean;
export const NapiArrayBufferTest05: () => boolean;
export const NapiArrayBufferTest06: () => boolean;
export const NapiArrayBufferTest07: () => boolean;
export const NapiBigIntTest01: () => boolean;
export const NapiBigIntTest02: () => boolean;
export const NapiBigIntTest03: () => boolean;
export const NapiBigIntTest04: () => boolean;
export const NapiBigIntTest05: () => boolean;
export const NapiBigIntTest06: () => boolean;
export const NapiBigIntTest07: () => boolean;
export const NapiBigIntTest08: () => boolean;
export const NapiBigIntTest09: () => boolean;
export const NapiBigIntTest10: () => boolean;
export const NapiBigIntTest11: () => boolean;
export const NapiBigIntTest12: () => boolean;
export const NapiBigIntTest13: () => boolean;
export const NapiBigIntTest14: () => boolean;
export const NapiBigIntTest15: () => boolean;
export const NapiBigIntTest16: () => boolean;
export const NapiBigIntTest17: () => boolean;
// Date test functions
export const testCreateDate: (timestamp: number) => Date;
export const testGetDateValue: (dateValue: Date) => number;
export const testIsDate: (value: string | number | TestObject) => boolean;
// Interface for date value retrieval with error handling
export interface DateValueWithErrorResult {
  isDateStatus: number;
  getDateStatus: number;
  isDate: boolean;
  timestamp: number;
  errorDescription: string;
}

// Interface for date value retrieval only
export interface DateValueOnlyResult {
  status: number;
  value?: number;
}

// Interface for date creation with min timestamp
export interface DateMinTimestampResult {
  createStatus: number;
  getStatus: number;
  timestamp: number;
}

// Interface for date creation with max timestamp
export interface DateMaxTimestampResult {
  createStatus: number;
  getStatus: number;
  timestamp: number;
}

// Interface for multiple date operations
export interface MultipleDateOperationsResult {
  dateA: Date;
  dateB: Date;
  timestampA: number;
  timestampB: number;
  modifiedTimestampA: number;
}

// Interface for bulk date creation
export interface BulkDateCreationResult {
  success: boolean;
  totalCreated: number;
  totalVerified: number;
  totalTimestamps: number;
  executionTime: number;
}

export interface TestObject {
  test: string;
}

// Date value retrieval with error handling
export const testGetDateValueWithError: (value: string | number | TestObject) => DateValueWithErrorResult;

// Date value retrieval only
export const testGetDateValueOnly: (value: string | number | TestObject) => DateValueOnlyResult;

// Date creation with minimum timestamp
export const testCreateDateWithMinTimestamp: () => DateMinTimestampResult;

// Date creation with maximum timestamp
export const testCreateDateWithMaxTimestamp: () => DateMaxTimestampResult;

// Multiple date operations
export const testMultipleDateOperations: () => MultipleDateOperationsResult;

// Bulk date creation
export const testBulkDateCreation: (count: number) => BulkDateCreationResult;
// Interface for individual thread result in concurrent date creation
export interface ConcurrentDateThreadResult {
  threadId: number;
  createStatus: number;
  isDate: boolean;
  timestamp: number;
  originalTimestamp: number;
}

// Interface for concurrent date creation test result
export interface ConcurrentDateCreationResult {
  success: boolean;
  threadResults: Array<ConcurrentDateThreadResult>;
  totalThreads: number;
}

// Concurrent date creation test
export const testConcurrentDateCreation: () => ConcurrentDateCreationResult;

// Interface for individual thread result in shared date object read test
export interface SharedDateReadThreadResult {
  threadId: number;
  isDateStatus: number;
  isDate: boolean;
  getDateStatus: number;
  timestamp: number;
}

// Interface for shared date object read test result
export interface SharedDateObjectReadResult {
  success: boolean;
  threadResults: Array<SharedDateReadThreadResult>;
  totalThreads: number;
  originalTimestamp: number;
}

// Shared date object read test
export const testSharedDateObjectRead: () => SharedDateObjectReadResult;

// Interface for individual thread result in high concurrency stress test
export interface StressTestThreadResult {
  threadId: number;
  totalOperations: number;
  successfulOperations: number;
  failedOperations: number;
  executionTime: number;
  memoryUsage: number;
}

// Interface for high concurrency date stress test result
export interface HighConcurrencyDateStressResult {
  success: boolean;
  threadResults: Array<StressTestThreadResult>;
  totalThreads: number;
  overallSuccess: boolean;
  totalOperations: number;
  totalSuccessfulOperations: number;
  totalFailedOperations: number;
  overallExecutionTime: number;
  peakMemoryUsage: number;
}

// High concurrency date stress test
export const testHighConcurrencyDateStress: () => HighConcurrencyDateStressResult;

// Interface for individual thread result in cross-thread date passing test
export interface CrossThreadDatePassingThreadResult {
  threadId: number;
  operation: string;
  isDateStatus: number;
  isDate: boolean;
  getDateStatus: number;
  timestamp: number;
  originalTimestamp: number;
}

// Interface for cross-thread date passing test result
export interface CrossThreadDatePassingResult {
  success: boolean;
  threadResults: Array<CrossThreadDatePassingThreadResult>;
  totalThreads: number;
  originalTimestamp: number;
}

// Interface for individual thread result in thread safety error handling test
export interface ThreadSafetyErrorHandlingThreadResult {
  threadId: number;
  operation: string;
  apiStatus: number;
  expectedStatus: number;
  isSuccess: boolean;
  errorDescription: string;
}

// Interface for thread safety error handling test result
export interface ThreadSafetyErrorHandlingResult {
  success: boolean;
  threadResults: Array<ThreadSafetyErrorHandlingThreadResult>;
  totalThreads: number;
  overallSuccess: boolean;
}

// Cross-thread date passing test
export const testCrossThreadDatePassing: () => CrossThreadDatePassingResult;

// Thread safety error handling test
export const testThreadSafetyErrorHandling: () => ThreadSafetyErrorHandlingResult;
export const NapiStringTest001: () => boolean;
export const NapiStringTest002: () => boolean;
export const NapiStringTest003: () => boolean;
export const NapiStringTest004: () => boolean;
export const NapiStringTest005: () => boolean;
export const NapiStringTest006: () => boolean;
export const NapiStringTest007: () => boolean;
export const NapiStringTest008: () => boolean;
export const NapiStringTest009: () => boolean;
export const NapiPrimitiveTest01: () => boolean;
export const NapiPrimitiveTest02: () => boolean;
export const NapiPrimitiveTest03: () => boolean;
export const NapiPrimitiveTest04: () => boolean;
export const NapiPrimitiveTest05: () => boolean;
export const NapiPrimitiveTest06: () => boolean;
export const NapiPrimitiveTest07: () => boolean;
export const NapiPrimitiveTest08: () => boolean;
export const NapiPrimitiveTest09: () => boolean;
export const NapiPrimitiveTest10: () => boolean;
export const NapiPrimitiveTest11: () => boolean;
export const NapiPrimitiveTest12: () => boolean;
// NAPI Number Test Functions
export const NapiNumberTest001: () => boolean;
export const NapiNumberTest002: () => boolean;
export const NapiNumberTest003: () => boolean;
export const NapiNumberTest004: () => boolean;
export const NapiNumberTest005: () => boolean;
export const NapiNumberTest006: () => boolean;
export const NapiNumberTest007: () => boolean;
export const NapiNumberTest008: () => boolean;
// NAPI Object Test Functions
export const NapiObjectTest001: () => boolean;
export const NapiObjectTest002: () => boolean;
export const NapiObjectTest003: () => boolean;
export const NapiObjectTest004: () => boolean;
export const NapiObjectTest005: () => boolean;
export const NapiObjectTest006: () => boolean;
export const NapiObjectTest007: () => boolean;
export const NapiObjectTest008: () => boolean;
export const NapiObjectTest009: () => boolean;
export const NapiObjectTest010: () => boolean;
export const NapiObjectTest011: () => boolean;
export const NapiObjectTest012: () => boolean;

// NAPI Extension Test Functions
export const NapiExtensionTest001: () => boolean;
export const NapiExtensionTest002: () => boolean;
export const NapiExtensionTest003: () => boolean;
export const NapiExtensionTest004: () => boolean;
export const NapiExtensionTest005: () => boolean;
export const NapiExtensionTest006: () => boolean;
export const NapiExtensionTest007: () => boolean;
export const NapiExtensionTest008: () => boolean;
export const NapiExtensionTest009: () => boolean;
export const NapiExtensionTest010: () => boolean;
export const NapiExtensionTest011: () => boolean;
export const NapiExtensionTest012: () => boolean;
export const NapiExtensionTest013: () => boolean;
export const NapiExtensionTest014: () => boolean;
export const NapiExtensionTest015: () => boolean;
export const NapiExtensionTest020: () => boolean;
export const NapiExtensionTest021: () => boolean;
export const NapiExtensionTest027: () => boolean;
export const NapiExtensionTest036: () => boolean;
export const NapiExtensionTest037: () => boolean;
export const NapiExtensionTest038: () => boolean;
export const NapiExtensionTest039: () => boolean;
export const NapiExtensionTest045: () => boolean;
export const callFunctionBasicTest: () => object;
export const callFunctionWithParamsTest: () => object;
export const getCbInfoBasicTest: () => object;
export const getCbInfoDynamicTest: () => object;
export const getCbInfoDataTest: () => object;
export const getCbInfoPartialTest: () => object;
export const getCbInfoVariousTypesTest: () => object;
export const createFunctionBasicTest: () => object;
export const createFunctionNamedTest: () => object;
export const createFunctionWithDataTest: () => object;
export const createFunctionLengthTest: () => object;
export const completeLifecycleTest: () => object;
export const multiThreadCreateFunctionTest: () => object;
export const multiThreadCallFunctionTest: () => object;
export const multiThreadGetCbInfoTest: () => object;
export const multiThreadComprehensiveTest: () => object;
export const NapiOthersAndModuleTest01: () => boolean;
export const NapiOthersAndModuleTest02: () => boolean;
export const NapiOthersAndModuleTest03: () => boolean;
export const NapiOthersAndModuleTest04: () => boolean;

// NAPI Promise Test Functions
export const NapiPromiseTest001: () => boolean;
export const NapiPromiseTest002: () => boolean;
export const NapiPromiseTest003: () => boolean;
export const NapiPromiseTest004: () => boolean;
export const NapiPromiseTest005: () => boolean;
export const NapiPromiseTest006: () => boolean;
export const NapiPromiseTest007: () => boolean;
export const NapiPromiseTest008: () => boolean;
export const NapiPromiseTest009: () => boolean;
export const NapiPromiseTest010: () => boolean;
export const NapiPromiseTest011: () => boolean;
export const NapiPromiseTest012: () => boolean;
export const NapiPromiseTest013: () => boolean;
export const NapiPromiseTest014: () => boolean;
export const TestIsSendable: () => boolean;
export const TestIsSendableTrue: () => boolean;
export const TestIsSendableNull: () => boolean;
export const TestDefineSendableClass: () => boolean;
export const TestDefineSendableClassInherit: () => boolean;
export const TestCreateSendableObject: () => boolean;
export const TestCreateSendableArray: () => boolean;
export const TestCreateSendableTypedArray: () => boolean;
export const TestWrapSendable: () => boolean;
export const TestWrapSendableWithSize: () => boolean;
export const TestWrapEnhance: () => boolean;
export const TestUnwrapSendable: () => boolean;
export const TestUnwrapSendableMultiple: () => boolean;
export const TestRemoveWrapSendable: () => boolean;
export const TestComplexSendableStructure: () => boolean;
export const TestDefineClass: () => boolean;
export const TestDefineClassWithProps: () => boolean;
export const TestDefineClassLengthMismatch: () => boolean;
export const TestDefineClassNullName: () => boolean;
export const TestDefineClassInvalidProps: () => boolean;
export const TestNewInstance: () => boolean;
export const TestNewInstanceWithArgs: () => boolean;
export const TestGetNewTargetConstructor: () => boolean;
export const TestGetNewTargetFunction: () => boolean;
export const TestWrap: () => boolean;
export const TestWrapWithFinalize: () => boolean;
export const TestUnwrapNotWrapped: () => boolean;
export const TestUnwrapWrapped: () => boolean;
export const TestRemoveWrapWrapped: () => boolean;
export const TestRemoveWrapNotWrapped: () => boolean;
export const TestFullLifecycle: () => boolean;
export const TestMassWrapUnwrap: () => boolean;
export const TestMassClassDefine: () => boolean;
export const TestClassDefineWithArgs: () => boolean;
export const TestMultiThreadClassDefine: () => boolean;
export const TestMultiThreadWrapUnwrapRace: () => boolean;
export const TestClassInheritanceWrapping: () => boolean;
export const TestMultipleWrapUnwrap: () => boolean;
export const testBasicInstanceDataSetAndGet: (value: number) => boolean;
export const testMultipleSetInstanceData: (valueA: number, valueB: number) => boolean;
export const testNoFinalizeCallback: (value1: number, value2: number) => boolean;
export const testMultiThreadInstanceData: () => boolean;
export const testLargeDataBlockSetAndGet: () => boolean;
export const testFinalizeCallbackApiCalls: () => boolean;
export const testLongRunningInstanceDataPersistence: () => boolean;