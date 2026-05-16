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

export const TestCreateDocumentByOEid_NullOEid: () => number;
export const TestCreateDocumentByOEid_NullDocument: () => number;
export const TestCreateDocumentByOEid_ValidParam: () => number;
export const TestCreateDocumentByFile_NullFilePath: () => number;
export const TestCreateDocumentByFile_ZeroPathLength: () => number;
export const TestCreateDocumentByFile_NullDocument: () => number;
export const TestCreateDocumentByFile_ValidParam: () => number;
export const TestLoadDocumentFromFile_NullFilePath: () => number;
export const TestLoadDocumentFromFile_ZeroPathLength: () => number;
export const TestLoadDocumentFromFile_NullDocument: () => number;
export const TestLoadDocumentFromFile_ValidParam: () => number;
export const TestDocumentRead_NullBuffer: () => number;
export const TestDocumentRead_NullDocument: () => number;
export const TestDocumentRead_NullReadSize: () => number;
export const TestDocumentRead_ValidParam: () => number;
export const TestDocumentGetOEid_NullDocument: () => number;
export const TestDocumentGetOEid_NullOEidOut: () => number;
export const TestDocumentGetOEid_ValidParam: () => number;
export const TestDocumentIsLinking_NullDocument: () => number;
export const TestDocumentIsLinking_NullIsLinking: () => number;
export const TestDocumentIsLinking_ValidParam: () => number;
export const TestDocumentGetNativeFilePath_NullDocument: () => number;
export const TestDocumentGetNativeFilePath_NullBuffer: () => number;
export const TestDocumentGetNativeFilePath_ValidParam: () => number;
export const TestDocumentGetRootStorage_NullDocument: () => number;
export const TestDocumentGetRootStorage_NullStorage: () => number;
export const TestDocumentGetRootStorage_ValidParam: () => number;
export const TestDocumentFlush_NullDocument: () => number;
export const TestDocumentFlush_ValidParam: () => number;
export const TestStorageCreateStorage_NullParentStorage: () => number;
export const TestStorageCreateStorage_NullName: () => number;
export const TestStorageCreateStorage_NullOutStorage: () => number;
export const TestStorageCreateStorage_ValidParam: () => number;
export const TestStorageGetStorage_NullParentStorage: () => number;
export const TestStorageGetStorage_NullName: () => number;
export const TestStorageGetStorage_NullOutStorage: () => number;
export const TestStorageGetStorage_ValidParam: () => number;
export const TestStorageCreateStream_NullStorage: () => number;
export const TestStorageCreateStream_NullName: () => number;
export const TestStorageCreateStream_NullOutStream: () => number;
export const TestStorageCreateStream_ValidParam: () => number;
export const TestStorageGetStream_NullStorage: () => number;
export const TestStorageGetStream_NullName: () => number;
export const TestStorageGetStream_NullOutStream: () => number;
export const TestStorageGetStream_ValidParam: () => number;
export const TestStorageDeleteEntry_NullStorage: () => number;
export const TestStorageDeleteEntry_NullName: () => number;
export const TestStorageDeleteEntry_ValidParam: () => number;
export const TestDeleteStorage_NullStorage: () => number;
export const TestDeleteStorage_ValidParam: () => number;
export const TestStreamRead_NullStream: () => number;
export const TestStreamRead_NullBuffer: () => number;
export const TestStreamRead_NullReadSize: () => number;
export const TestStreamRead_ValidParam: () => number;
export const TestStreamWrite_NullStream: () => number;
export const TestStreamWrite_NullBuffer: () => number;
export const TestStreamWrite_NullWriteSize: () => number;
export const TestStreamWrite_ValidParam: () => number;
export const TestStreamSeek_NullStream: () => number;
export const TestStreamSeek_ValidParam: () => number;
export const TestStreamGetPosition_NullStream: () => number;
export const TestStreamGetPosition_NullPosition: () => number;
export const TestStreamGetPosition_ValidParam: () => number;
export const TestStreamGetSize_NullStream: () => number;
export const TestStreamGetSize_NullSize: () => number;
export const TestStreamGetSize_ValidParam: () => number;
export const TestDestroyStream_NullStream: () => number;
export const TestDestroyStream_ValidParam: () => number;
export const TestDestroyDocument_NullDocument: () => number;
export const TestDestroyDocument_ValidParam: () => number;
export const TestStorageDeleteAllEntry_NullStorage: () => number;
export const TestStorageDeleteAllEntry_ValidParam: () => number;
export const TestStorageGetOEid_NullStorage: () => number;
export const TestStorageGetOEid_NullOEidOut: () => number;
export const TestStorageGetOEid_ZeroBufferSize: () => number;
export const TestStorageGetOEid_ValidParam: () => number;
export const TestStorageSetOEid_NullStorage: () => number;
export const TestStorageSetOEid_NullOEid: () => number;
export const TestStorageSetOEid_ZeroBufferSize: () => number;
export const TestStorageSetOEid_ValidParam: () => number;
export const TestStorageElements_CreateElements: () => number;
export const TestStorageGetElements_ValidParam: () => number;
export const TestStorageElementsGetCount_NullElements: () => number;
export const TestStorageElementsGetCount_NullCount: () => number;
export const TestStorageElementsGetCount_ValidParam: () => number;
export const TestStorageElementsGetElement_NullElements: () => number;
export const TestStorageElementsGetElement_NullElement: () => number;
export const TestStorageElementsGetElement_ValidParam: () => number;
export const TestStorageElementGetName_NullElement: () => number;
export const TestStorageElementGetName_NullName: () => number;
export const TestStorageElementGetName_NullLength: () => number;
export const TestStorageElementGetCTime_NullElement: () => number;
export const TestStorageElementGetCTime_NullTime: () => number;
export const TestStorageElementGetMTime_NullElement: () => number;
export const TestStorageElementGetMTime_NullTime: () => number;
export const TestStorageElementIsStorage_NullElement: () => number;
export const TestStorageElementIsStorage_NullResult: () => number;
export const TestStorageElementIsStream_NullElement: () => number;
export const TestStorageElementIsStream_NullResult: () => number;
export const TestStorageCopyTo_NullSrcStorage: () => number;
export const TestStorageCopyTo_NullDstStorage: () => number;
