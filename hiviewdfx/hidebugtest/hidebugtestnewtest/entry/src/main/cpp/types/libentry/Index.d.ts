/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
export const add: (a: number, b: number) => number;
import hidebug from '@ohos.hidebug';
export const getNativeMemInfoTrue: () => hidebug.NativeMemInfo;
export const getNativeMemInfoFalse: () => hidebug.NativeMemInfo;
export const getGraphicMemSummaryC: (interval: number, undefineTest?: boolean) => hidebug.GraphicsMemorySummary;
export const addthread: (a: number) => void;
export const clearthreads: () => void;
export const start: (f: number, d: number) => number;
export const starterrstack: () => number;
export const starterrconfig: () => number;
export const starterrconfigtid: () => number;
export const CHECK_HIDEBUG_TRACE_ABNORMAL: () => boolean;
export const CHECK_HIDEBUG_NO_PERMISSION: () => boolean;
export const CHECK_HIDEBUG_INVALID_SYMBOLIC_PC_ADDRESS: () => boolean;
export const CHECK_HIDEBUG_NOT_SUPPORTED: () => boolean;
export const CHECK_HIDEBUG_UNDER_SAMPLING: () => boolean;
export const CHECK_HIDEBUG_RESOURCE_UNAVAILABLE: () => boolean;
export const CHECK_HICOLLIE_REMOTE_FAILED: () => boolean;
export const CHECK_ThreadCpuUsage: () => number;
export const CHECK_OH_HiDebug_GetDefaultMallocDispatchTable: () => number;
export const CHECK_OH_HiDebug_CreateBacktraceObject: () => number;
export const testSetCrashObjType: (obj_type: number) => number;
export const testSetCrashObjAddr: (obj_type: number) => number;
export const checkSetCrashObj: () => number;
export const testSetCrashObjAddrLen: (addr_len: number) => number;
export const startProfiler: (resourceType: number, maxDuration: number, filterSize: number,
  maxStackDepth: number, statisticsInterval: number, sampleInterval: number) => number;
export const startProfilerNull: (resourceType: number) => number;
export const stopProfiler: () => number;
export const TestRequestTrace: () => number;
export const TestRequestTraceIdentifier1: () => number;
export const TestRequestTraceIdentifier2: () => number;
export const TestRequestTraceIdentifier3: () => number;
export const TestRequestTraceBufferSize1: () => number;
export const TestRequestTraceBufferSize2: () => number;
export const TestRequestTraceBufferSize3: () => number;
export const TestRequestTraceBufferSize4: () => number;
export const TestRequestTraceBufferSize5: () => number;
export const TestRequestTracedurationMs1: () => number;
export const TestRequestTracedurationMs2: () => number;
export const TestRequestTracedurationMs3: () => number;
export const TestRequestTracedurationMs4: () => number;
export const TestRequestTraceReserved1: () => number;
export const checkHidebugTraceStorageLimit: () => boolean;
export const checkHidebugSuccess: () => boolean;
export const checkHidebugPermissionDenied: () => boolean;
export const checkHidebugAlreadyStarted: () => boolean;
export const checkHidebugNotStarted: () => boolean;
export const checkHidebugProcessOverlimit: () => boolean;
export const checkHidebugConflict: () => boolean;
export const checkHidebugAutoStoppedByDuration: () => boolean;
export const checkHidebugDailyQuotaExceeded: () => boolean;
export const checkHidebugCpuOverloaded: () => boolean;
export const checkHidebugMemPressureCritical: () => boolean;
export const checkHidebugStoragePressureCritical: () => boolean;