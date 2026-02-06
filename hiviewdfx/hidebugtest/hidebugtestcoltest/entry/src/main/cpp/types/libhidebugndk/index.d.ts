/*
 * Copyright (c) 2021-2022 Huawei Device Co., Ltd.
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

import hidebug from '@ohos.hidebug';

export const getTotalMem: () => number;
export const getFreeMem: () => number;
export const getAvailableMem: () => number;
export const getPss: () => number;
export const getVss: () => number;
export const getRss: () => number;
export const getSharedDirty: () => number;
export const getPrivateDirty: () => number;
export const getSharedClean: () => number;
export const getPrivateClean: () => number;

export const getRssLimit: () => number;
export const getVssLimit: () => number;

export const getSysCpuUsage: () => number;
export const getAppThreadCpuUsage: () => hidebug.ThreadCpuUsage[];
export const getAppCpuUsage: () => number;

export const startAppTraceCapture: (a: number, b: number, c: number) => number;
export const getAppTraceCaptureFile: (a: number, b: number, c: number) => string;
export const startAppTraceCaptureTag: () => number;
export const stopAppTraceCapture: () => number;
export const getGraphicsMemory: () => number;
export const getGraphicsMemoryNULL: () => number;
export const getGraphicsMemoryArray: () => number;
export const getBacktraceFromFp: () => void;
export const getBacktraceInvaildFromFp: () => void;
export const getDefaultMallocDispatchTable: () => number;
export const restoreMallocDispatchTable: () => number;
export const getInvaildMallocDispatchTable: () => number;