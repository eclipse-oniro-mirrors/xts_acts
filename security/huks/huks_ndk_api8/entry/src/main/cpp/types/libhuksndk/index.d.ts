/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
export const oHHuksGetSdkVersion: () => number;
export const oHHuksGetSdkVersionErr: () => number;
export const oHHuksGenerateKeyItem: () => number;
export const oHHuksGenerateKeyItemErr: () => number;
export const oHHuksExportPublicKeyItemErr: () => number;
export const oHHuksImportKeyItemErr: () => number;
export const oHHuksDeleteKeyItem: () => number;
export const oHHuksDeleteKeyItemErr: () => number;
export const oHHuksIsKeyItemExist: () => number;
export const oHHuksIsKeyItemExistErr: () => number;
export const oHHuksInitSession: () => number;
export const oHHuksInitSessionErr: () => number;
export const oHHuksAttestKeyItem: () => number;
export const oHHuksAttestKeyItemErr: () => number;
export const oHHuksInitParamSet: () => number;
export const oHHuksInitParamSetErr: () => number;
export const oHHuksAddParams: () => number;
export const oHHuksAddParamsErr: () => number;
export const oHHuksBuildParamSet: () => number;
export const oHHuksBuildParamSetErr: () => number;
export const oHHuksFreeParamSet: () => number;
export const oHHuksIsParamSetValid: () => number;
export const oHHuksIsParamSetValidErr: () => number;
export const oHHuksIsParamSetTagValid: () => number;
export const oHHuksIsParamSetTagValidErr: () => number;
export const oHHuksCheckParamMatch: () => number;
export const oHHuksCheckParamMatchErr: () => number;
export const oHHuksFreshParamSet: () => number;
export const oHHuksFreshParamSetErr: () => number;
export const oHHuksGetParam: () => number;
export const oHHuksGetParamErr: () => number;
export const oHHuksCopyParamSet: () => number;
export const oHHuksCopyParamSetErr: () => number;
export const oHHuksUpdateSession: () => number;
export const oHHuksUpdateSessionErr: () => number;
export const oHHuksFinishSession: () => number;
export const oHHuksFinishSessionErr: () => number;
export const oHHuksAbortSession: () => number;
export const oHHuksAbortSessionErr: () => number;
export const oHHuksGetKeyItemParamSet: () => number;
export const oHHuksGetKeyItemParamSetErr: () => number;
export const oHHuksImportWrappedKeyItemErr: () => number;
export const oHHuksImportWrappedKeyItem: () => number;
export const oHHuksImportKeyItem: () => Promise<number>;
export const oHHuksExportPublicKeyItem: () => Promise<number>;
export const oHHuksAnonAttestKeyItem: () => number;
export const oHHuksListAliases: () => number;
export const oHHuksFreeKeyAliasSet: () => number;
export const oHHuksWrapKey: () => number;
export const oHHuksUnwrapKey: () => number;
export const huksNativeApi22Type0300: () => number;
export const huksNativeApi22Type0400: () => number;
export const huksNativeApi22Type0500: () => number;
export const huksNativeApi22Type0600: () => number;