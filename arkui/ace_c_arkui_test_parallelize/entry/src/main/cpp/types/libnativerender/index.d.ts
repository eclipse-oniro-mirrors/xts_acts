/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

// swiper
export const testSwiper: (content: NodeContent, context: UIContext, withReset: boolean) => void;
// publicAttirbute
export const CreateNativeNodePublic: (content: NodeContent, uicontext: UIContext) => void;
export const DisposeNativeNodePublic: (content: NodeContent) => void;
// XComponent
export const XComponentCreateNativeNode: (a: Content, b: UIContext) => void;
export const XComponentDisposeNativeNode: (a: Content) => void;
export const XComponentTextureCreateNativeNode: (a: Content, b: UIContext) => void;
export const XComponentTextureDisposeNativeNode: (a: Content) => void;