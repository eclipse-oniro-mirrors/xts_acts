/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

export const TestLoadDocumentFromFile_Normal: () => number;
export const TestDocumentGetNativeFilePath_OEIDIsEmpty: () => number;
export const TestStorageSetOEid_OEIDIsEmpty: () => number;
export const TestProxyGetOEidFromFormat_OEIDIsEmpty: () => number;
export const TestCreateDocumentByOEid_OEIDIsValid: () => number;
export const TestStorageCreateStorage_NameIsValid: () => number;
export const TestStorageCreateStorage_NameExceedMaxLen: () => number;
export const TestStorageGetStorage_NameIsValid: () => number;
export const TestStorageGetStorage_NameExceedMaxLen: () => number;
export const TestStorageCreateStream_StreamFailed: () => number;
export const TestStorageGetStream_StorageFailed: () => number;
export const TestStorageGetStream_StreamFailed: () => number;
export const TestCreateDocumentByFile_EmptyPath: () => number;
export const TestStorageDeleteEntry_FileFailed: () => number;
export const TestStreamSeek_ExceedSize: () => number;
export const TestStreamRead_StreamFailed: () => number;
export const TestStreamWrite_StreamFailed: () => number;
export const TestStreamGetPosition_StreamFailed: () => number;
export const TestStreamGetSize_StreamFailed: () => number;
