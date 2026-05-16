/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with License.
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

export const TestProxyCreateContentEmbedInfo_NullInfo: () => number;
export const TestProxyCreateContentEmbedInfo_Normal: () => number;
export const TestProxyDestroyContentEmbedInfo_NullInfo: () => number;
export const TestProxyDestroyContentEmbedInfo_Normal: () => number;
export const TestProxyGetContentEmbedInfo_NullLocaleNullInfo: () => number;
export const TestProxyGetContentEmbedInfo_NullInfo: () => number;
export const TestProxyGetContentEmbedInfo_EmptyLocal: () => number;
export const TestProxyGetContentEmbedInfo_LocaleInvalid: () => number;
export const TestProxyGetContentEmbedInfo_Normal: () => number;
export const TestProxyGetFormatCountFromInfo_NullInfoNullCount: () => number;
export const TestProxyGetFormatCountFromInfo_NullCount: () => number;
export const TestProxyGetFormatCountFromInfo_Normal: () => number;
export const TestProxyGetFormatFromInfo_NullInfoNullFormat: () => number;
export const TestProxyGetFormatFromInfo_NullInfo: () => number;
export const TestProxyGetFormatFromInfo_NullFormat: () => number;
export const TestProxyGetFormatFromInfo_IndexOutOfRange: () => number;
export const TestProxyGetFormatCountFromInfo_NullInfo: () => number;
export const TestProxyCreateContentEmbedFormat_NullFormat: () => number;
export const TestProxyCreateContentEmbedFormat_Normal: () => number;
export const TestProxyDestroyContentEmbedFormat_NullFormat: () => number;
export const TestProxyDestroyContentEmbedFormat_Normal: () => number;
export const TestProxyGetContentEmbedFormatByOEidAndLocale_NullOEidNullLocaleNullFormat: () => number;
export const TestProxyGetContentEmbedFormatByOEidAndLocale_NullOEid: () => number;
export const TestProxyGetContentEmbedFormatByOEidAndLocale_NullFormat: () => number;
export const TestProxyGetContentEmbedFormatByOEidAndLocale_NullLocale: () => number;
export const TestProxyGetContentEmbedFormatByOEidAndLocale_EmptyOEid: () => number;
export const TestProxyGetContentEmbedFormatByOEidAndLocale_EmptyLocale: () => number;
export const TestProxyGetOEidFromFormat_NullFormatNullOEid: () => number;
export const TestProxyGetOEidFromFormat_NullOEid: () => number;
export const TestProxyGetOEidFromFormat_NullFormat: () => number;
export const TestProxyGetOEidFromFormat_Normal: () => number;
export const TestProxyGetNameAndDescriptionFromFormat_NullFormatNullNameNullDescription: () => number;
export const TestProxyGetNameAndDescriptionFromFormat_NullName: () => number;
export const TestProxyGetNameAndDescriptionFromFormat_NullFormat: () => number;
export const TestProxyGetNameAndDescriptionFromFormat_NullDescription: () => number;
export const TestProxyGetNameAndDescriptionFromFormat_Normal: () => number;
export const TestProxyGetIconFromFormat_NullFormatNullIcon: () => number;
export const TestProxyGetIconFromFormat_NullIcon: () => number;
export const TestProxyGetIconFromFormat_NullFormat: () => number;
export const TestProxyGetIconFromFormat_EmptyFormat: () => number;
export const TestProxyGetFileNameExtensionsFromFormat_NullFormatNullCount: () => number;
export const TestProxyGetFileNameExtensionsFromFormat_NullFormat: () => number;
export const TestProxyGetFileNameExtensionsFromFormat_NullCount: () => number;
export const TestProxyGetFileNameExtensionsFromFormat_Normal: () => number;
export const TestProxyCreateExtensionProxy_NullDocumentNullProxyNullContext: () => number;
export const TestProxyCreateExtensionProxy_NullDocument: () => number;
export const TestProxyCreateExtensionProxy_NullProxy: () => number;
export const TestProxyCreateExtensionProxy_NullContext: () => number;
export const TestProxyCreateExtensionProxy_Normal: () => number;
export const TestProxyDestroyExtensionProxy_NullProxy: () => number;
export const TestProxyDestroyExtensionProxy_Normal: () => number;
export const TestProxyRegisterOnUpdateFunc_NullProxyNullCallback: () => number;
export const TestProxyRegisterOnUpdateFunc_NullCallback: () => number;
export const TestProxyRegisterOnUpdateFunc_NullProxy: () => number;
export const TestProxyRegisterOnUpdateFunc_Normal: () => number;
export const TestProxyRegisterOnErrorFunc_NullProxyNullCallback: () => number;
export const TestProxyRegisterOnErrorFunc_NullCallback: () => number;
export const TestProxyRegisterOnErrorFunc_NullProxy: () => number;
export const TestProxyRegisterOnErrorFunc_Normal: () => number;
export const TestProxyRegisterOnEditingFinishedFunc_NullProxyNullCallback: () => number;
export const TestProxyRegisterOnEditingFinishedFunc_NullCallback: () => number;
export const TestProxyRegisterOnEditingFinishedFunc_NullProxy: () => number;
export const TestProxyRegisterOnEditingFinishedFunc_Normal: () => number;
export const TestProxyRegisterOnExtensionStoppedFunc_NullProxyNullCallback: () => number;
export const TestProxyRegisterOnExtensionStoppedFunc_NullCallback: () => number;
export const TestProxyRegisterOnExtensionStoppedFunc_NullProxy: () => number;
export const TestProxyRegisterOnExtensionStoppedFunc_Normal: () => number;
export const TestProxyStartWork_NullProxy: () => number;
export const TestProxyStartWork_ProxyCallbackUnregister: () => number;
export const TestProxyStartWork_ConnectFailed: () => number;
export const TestProxyStopWork_NullProxy: () => number;
export const TestProxyStopWork_DisConnectFailed: () => number;
export const TestProxyGetSnapshot_NullProxyNullSnapshot: () => number;
export const TestProxyGetSnapshot_NullSnapshot: () => number;
export const TestProxyGetSnapshot_NullProxy: () => number;
export const TestProxyDoEdit_NullProxy: () => number;
export const TestProxyGetEditStatus_NullProxyNullIsEditingNullIsModified: () => number;
export const TestProxyGetEditStatus_NullIsEditing: () => number;
export const TestProxyGetEditStatus_NullIsModified: () => number;
export const TestProxyGetEditStatus_NullProxy: () => number;
export const TestProxyGetCapability_NullProxyNullBitmask: () => number;
export const TestProxyGetCapability_NullBitmask: () => number;
export const TestProxyGetCapability_NullProxy: () => number;
export const TestProxyGetDocument_NullProxyNullDocument: () => number;
export const TestProxyGetDocument_NullDocument: () => number;
export const TestProxyGetDocument_NullProxy: () => number;
export const TestProxyGetDocument_Normal: () => number;
