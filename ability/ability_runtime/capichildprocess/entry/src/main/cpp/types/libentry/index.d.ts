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

export const childProcessAdd: (a: number, b: number) => number;
export const startNativeChildProcess: (libName: String) => number;
export const requestExitChildProcess: (a: number) => number;
export const callApiWithNullCallback: () => number;
export const callApiWithNullLibName: () => number;
export const callApiWithNull: () => number;
export const childProcessStartNewProcess: () => number;
export const busyTest: () => number;
export const registerNativeChildExit: () => number;
export const unregisterNativeChildExit: () => number;
export const createThread: () => void;
export const destroyThread: () => void;

export const startChildIsolated: () => number;
export const startChildNormal: () => number;
export const startChildNoArgs: () => number;

export const CreateNativeChildProcessWithConfigs: (libName: String) => number;
export const CreateNativeChildProcessWithConfigsLibNamenullptr: () => number;
export const CreateNativeChildProcessWithConfigsNullCallback: () => number;
export const StartNativeChildProcessWithConfigs: (entryName: String) => number;
export const StartNativeChildProcessWithConfigsEntryNull: () => number;
export const StartNativeChildProcessWithConfigsFdlistNum17: () => number;
export const StartNativeChildProcessWithConfigsEntryParams200K: () => number;
export const SetIsolationModeConfigsNullptr: () => number;
export const SetProcessName: (processName: String) => number;
export const SetProcessNameConfigsNullptr: () => number;
export const DestroyChildProcessConfigs: () => number;
export const DestroyChildProcessConfigsNullptr: () => number;