/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

export const JsImageSourceGetMimeType_Uri: (uri: string) => string;
export const JsImageSourceGetMimeType_Fd: (fd: number) => string;
export const JsImageSourceGetMimeType_Data: (buf: ArrayBufferLike) => string;
export const JsImageSourceGetMimeType_RawFile: (fd: number, offset: number, length: number) => string;
export const imageSourceGetMimeTypeTest_Error01: () => number;
export const imageSourceGetMimeTypeTest_Error02: (uri: string) => number;