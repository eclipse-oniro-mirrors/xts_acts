/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
export const RegisterSyncFolder: (path: string) => number;
export const RegisterSyncFolder001: (path: string) => number;
export const UnregisterSyncFolder: (path: string) => number;
export const ActiveSyncFolder: (path: string) => number;
export const DeactiveSyncFolder: (path: string) => number;
export const GetSyncFolders: () => number;
export const UpdateCustomAlias: (path: string) => number;
export const ReFolderChanges: (path: string) => number;
export const UnReFolderChanges: (path: string) => number;
export const GetSyncFolderChanges: (path: string) => number;
export const SetFileSyncStates: (path: string) => number;
export const GetFileSyncStates: (path: string) => number;
export const Tset_CloudDisk_ErrorCode_ENUM: () => number;
export const Tset_CloudDisk_OperationType_ENUM: () => number;
export const Tset_CloudDisk_ErrorReason_ENUM: () => number;