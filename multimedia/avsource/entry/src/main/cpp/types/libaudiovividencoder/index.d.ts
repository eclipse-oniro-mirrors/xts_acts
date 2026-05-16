/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
export const MonoModeSampleRateCheck: () => number;
export const MonoModeSampleFormatCheck: () => number;
export const MonoModeBitrateCheck: () => number;
export const StereoModeSampleRateCheck: () => number;
export const StereoModeSampleFormatCheck: () => number;
export const StereoModeBitrateCheck: () => number;
export const MCModeSampleRateCheck: () => number;
export const MCModeSampleFormatCheck: () => number;
export const MCModeChannelLayoutCheck: () => number;
export const MCModeBitrateCheck: () => number;
export const MixModeSampleRateCheck: () => number;
export const MixModeSampleFormatCheck: () => number;
export const MixModeChannelLayoutCheck: () => number;
export const MixModeBitrateCheck: () => number;
export const MixModeObjNumCheck: () => number;
export const MixModeObjBitrateCheck: () => number;
export const CreateMonoMode: () => number;
export const CreateStereoMode: () => number;
export const CreateMCMode: () => number;
export const CreateMixMode: () => number;
export const CreateObjNumCheck: () => number;
export const UpdateObjectPosIndexCheck: () => number;
export const UpdateObjectPosXCheck: () => number;
export const UpdateObjectPosYCheck: () => number;
export const UpdateObjectPosZCheck: () => number;
export const UpdateObjectPosAzimuthCheck: () => number;
export const UpdateObjectPosElevationCheck: () => number;
export const UpdateObjectPosDistanceCheck: () => number;
export const UpdateObjectGainIndexCheck: () => number;
export const UpdateObjectGainGainCheck: () => number;
export const CreateBuilderNullCheck: () => number;
export const CreateFormatNullCheck: () => number;
export const UpdateObjectPosBuilderNullCheck: () => number;
export const UpdateObjectGainBuilderNullCheck: () => number;
export const GetMetaLenBuilderNullCheck: () => number;
export const GetMetaLenLenNullCheck: () => number;
export const GetMetaBuilderNullCheck: () => number;
export const GetMetaBufferNullCheck: () => number;
export const DestroyBuilderNullCheck: () => number;