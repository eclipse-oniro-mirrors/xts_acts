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

export const TestCreateDocumentByFile_LinkingFailed: () => number;
export const TestCreateDocumentByFile_Normal: () => number;
export const TestCreateDocumentByFile_PathEmpty: () => number;
export const TestDocumentGetNativeFilePath_PathEmpty: () => number;
export const TestStorageCreateStorage_NameEmpty: () => number;
export const TestStorageCreateStorage_SameName: () => number;
export const TestStorageGetStorage_NameEmpty: () => number;
export const TestStorageGetStorage_StorageFailed: () => number;
export const TestStorageCreateStream_NameEmpty: () => number;
export const TestStorageCreateStream_StorageFailed: () => number;
export const TestDeleteEntry_StorageFailed: () => number;
export const TestDeleteEntry_Normal: () => number;
export const TestDeleteAllEntry_StorageFailed: () => number;
export const TestStreamRead_ReturnNull: () => number;
export const TestStreamWrite_ReturnNull: () => number;
export const TestStreamSeek_ReturnNull: () => number;
export const TestStreamGetPosition_ReturnNull: () => number;
export const TestStreamGetSize_ReturnNull: () => number;
export const TestStreamGetOEid_StorageFailed: () => number;
export const TestStreamSetOEid_StorageFailed: () => number;
export const TestCreateStorageElements_Nullptr: () => number;
export const TestDestroyStorageElements_Nullptr: () => number;
export const TestDestroyStorageElements_Normal: () => number;
export const TestStorageGetElements_Nullptr: () => number;
export const TestStorageGetElements_StorageNullptr: () => number;
export const TestStorageGetElements_ElementsNullptr: () => number;
export const TestStorageGetElements_StorageFailed: () => number;
export const TestGetElementsCount_Nullptr: () => number;
export const TestGetElementsCount_ElementsNullptr: () => number;
export const TestGetElementsCount_CountNullptr: () => number;
export const TestGetElement_Nullptr: () => number;
export const TestGetElement_ElementsNullptr: () => number;
export const TestGetElement_ElementNullptr: () => number;
export const TestGetElement_SizeInvalid: () => number;
export const TestGetElementName_Normal: () => number;
export const TestGetElementCTime_Normal: () => number;
export const TestGetElementMTime_Normal: () => number;
export const TestGetElementIsStorage_Normal: () => number;
export const TestGetElementIsStream_Normal: () => number;
export const TestStorageCopyTo_StorageFailed: () => number;
export const TestStorageCopyTo_Normal: () => number;
