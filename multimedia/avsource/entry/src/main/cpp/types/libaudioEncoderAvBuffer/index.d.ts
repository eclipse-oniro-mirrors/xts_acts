/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
export const OH_AudioCodec_CreateByMime: () => number;
export const OH_AudioCodec_CreateByName: () => number;
export const OH_AudioCodec_Destroy: () => number;
export const OH_AudioCodec_RegisterCallback: () => number;
export const OH_AudioCodec_Configure: () => number;
export const OH_AudioCodec_Prepare: () => number;
export const OH_AudioCodec_Start: () => number;
export const OH_AudioCodec_Stop: () => number;
export const OH_AudioCodec_Flush: () => number;
export const OH_AudioCodec_Reset: () => number;
export const OH_AudioCodec_GetOutputDescription: () => number;
export const OH_AudioCodec_SetParameter: () => number;
export const OH_AudioCodec_PushInputData: () => number;
export const OH_AudioCodec_FreeOutputData: () => number;
export const OH_AudioCodec_IsValid: () => number;