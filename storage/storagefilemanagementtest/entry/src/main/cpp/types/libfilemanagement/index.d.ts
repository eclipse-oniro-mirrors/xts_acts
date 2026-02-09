/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

export const EnvironmentErrCodeErrOK: () => number;
export const EnvironmentErrCodeErrInvalidParameter: () => number;
export const EnvironmentErrCodeErrDeviceNotSupported: () => number;
export const EnvironmentGetUserDownloadDir: (errCode: string, isValid: boolean) => number;
export const EnvironmentGetUserDesktopDir: (errCode: string, isValid: boolean) => number;
export const EnvironmentGetUserDocumentDir: (errCode: string, isValid: boolean) => number;
export const FileIOErrCodeErrOK: () => number;
export const FileIOErrCodeErrEnoent: () => number;
export const FileIOErrCodeErrInvalidParameter: () => number;
export const FileIOFileLocationLocal: () => number;
export const FileIOFileLocationCloud: () => number;
export const FileIOFileLocationLocalAndCloud: () => number;
export const FileIOFileLocation: (errCode: string) => number;
export const FileShareErrCodeErrOk: () => number;
export const FileShareErrCodeErrDeviceNotSupport: () => number;
export const FileShareErrCodeErrEperm: () => number;
export const FileShareErrCodeErrPermissionError: () => number;
export const FileShareErrCodeErrInvalidParameter: () => number;
export const FileShareErrCodeErrEnomem: () => number;
export const FileSharePolicyErrorCodePersistenceForbidden: () => number;
export const FileSharePolicyErrorCodeInvalidMode: () => number;
export const FileSharePolicyErrorCodeInvalidPath: () => number;
export const FileSharePolicyErrorCodePermissionNotPersisted: () => number;
export const FileSharePolicyErrorResultUri: () => number;
export const FileSharePolicyErrorResultCode: () => number;
export const FileSharePolicyErrorResultMessage: () => number;
export const FileShareRevokePermission: (errcode: string) => number;
export const FileShareRevokePermissionErrInvalidParameter: () => number;
export const FileShareRevokePermissionErrEperm: () => number;
export const FileShareActivatePermission: (errcode: string) => number;
export const FileShareActivatePermissionErrInvalidParameter: () => number;
export const FileShareActivatePermissionErrEperm: () => number;
export const FileShareDeactivatePermission: (errcode: string) => number;
export const FileShareDeactivatePermissionErrInvalidParameter: () => number;
export const FileShareDeactivatePermissionErrEperm: () => number;
export const FileShareCheckPersistentPermission: (errcode: string) => number;
export const FileShareCheckPersistentPermissionErrInvalidParameter: () => number;
export const FileShareCheckPersistentPermissionErrEperm: () => number;
export const FileUriErrCodeErrOk: () => number;
export const FileUriErrCodeErrInvalidParameter: () => number;
export const FileUriErrCodeErrUnknown: () => number;
export const FileUriErrCodeErrEnoent: () => number;
export const FileUriGetPathFromUriErrOk: () => number;
export const FileUriGetPathFromUriErrInvalidParameter: () => number;
export const FileUriGetPathFromUriErrUnknown: () => number;
export const FileUriGetFullDirectoryUriErrOk: () => number;
export const FileUriGetFullDirectoryUriErrInvalidParameter: () => number;
export const FileUriGetFileNameErrOk: () => number;
export const FileUriGetFileNameErrInvalidParameter: () => number;
