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