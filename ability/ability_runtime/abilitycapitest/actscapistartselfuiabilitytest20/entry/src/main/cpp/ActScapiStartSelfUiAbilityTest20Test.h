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
#ifndef ACTSCAPISTARTSELFUIABILITYTEST20_ACTSCAPISTARTSELFUIABILITYTEST20TEST_H
#define ACTSCAPISTARTSELFUIABILITYTEST20_ACTSCAPISTARTSELFUIABILITYTEST20TEST_H

#include "napi/native_api.h"
#include <js_native_api_types.h>

napi_value DestroyChildProcessConfigsParamInvalid(napi_env env, napi_callback_info info);
napi_value DestroyChildProcessConfigsNoError(napi_env env, napi_callback_info info);
napi_value ChildProcessConfigsSetIsolationModeInvalidParam(napi_env env, napi_callback_info info);
napi_value ChildProcessConfigsSetIsolationModeNoError(napi_env env, napi_callback_info info);
napi_value ChildProcessConfigsSetProcessNameInvalidParam(napi_env env, napi_callback_info info);
napi_value ChildProcessConfigsSetProcessNameNoError(napi_env env, napi_callback_info info);
napi_value RegisterNativeChildProcessExitCallbackNoError(napi_env env, napi_callback_info info);
napi_value RegisterNativeChildProcessExitCallbackInvPar(napi_env env, napi_callback_info info);
napi_value UnregisterNativeChildProcessExitCallbackNoError(napi_env env, napi_callback_info info);
napi_value UnregisterNativeChildProcessExitCallbackInvPar(napi_env env, napi_callback_info info);
napi_value UnregisterNativeChildProcessExitCallbackNotExist(napi_env env, napi_callback_info info);
napi_value DestroyWantNoError(napi_env env, napi_callback_info info);
napi_value SetWantElementNoError(napi_env env, napi_callback_info info);
napi_value GetWantElementNoError(napi_env env, napi_callback_info info);
napi_value SetWantCharParamNoError(napi_env env, napi_callback_info info);
napi_value GetWantCharParamNoError(napi_env env, napi_callback_info info);
napi_value AddWantFdNoError(napi_env env, napi_callback_info info);
napi_value SetWantUriNoError(napi_env env, napi_callback_info info);
napi_value GetWantUriNoError(napi_env env, napi_callback_info info);
napi_value SetWantInt32ParamNoError(napi_env env, napi_callback_info info);
napi_value GetWantInt32ParamNoError(napi_env env, napi_callback_info info);
napi_value SetWantBoolParamNoError(napi_env env, napi_callback_info info);
napi_value GetWantBoolParamNoError(napi_env env, napi_callback_info info);
napi_value SetWantDoubleParamNoError(napi_env env, napi_callback_info info);
napi_value GetWantDoubleParamNoError(napi_env env, napi_callback_info info);
napi_value AbilityRuntimeAreaModeEl2Code(napi_env env, napi_callback_info info);
napi_value AbilityRuntimeAreaModeEl3Code(napi_env env, napi_callback_info info);
napi_value AbilityRuntimeAreaModeEl4Code(napi_env env, napi_callback_info info);
napi_value AbilityRuntimeAreaModeEl5Code(napi_env env, napi_callback_info info);
napi_value AbilityRuntimeHideUponStartCode(napi_env env, napi_callback_info info);
napi_value DestroyStartOptionsNoError(napi_env env, napi_callback_info info);
napi_value SetStartOptionsWindowModeNoError(napi_env env, napi_callback_info info);
napi_value GetStartOptionsWindowModeNoError(napi_env env, napi_callback_info info);
napi_value SetStartOptionsDisplayIdNoError(napi_env env, napi_callback_info info);
napi_value SetStartOptionsDisplayIdParamInvalid(napi_env env, napi_callback_info info);
napi_value GetStartOptionsDisplayIdNoError(napi_env env, napi_callback_info info);
napi_value SetStartOptionsWithAnimationNoError(napi_env env, napi_callback_info info);
napi_value GetStartOptionsWithAnimationNoError(napi_env env, napi_callback_info info);
napi_value SetStartOptionsWindowLeftNoError(napi_env env, napi_callback_info info);
napi_value GetStartOptionsWindowLeftNoError(napi_env env, napi_callback_info info);
napi_value SetStartOptionsWindowTopNoError(napi_env env, napi_callback_info info);
napi_value GetStartOptionsWindowTopNoError(napi_env env, napi_callback_info info);
napi_value SetStartOptionsWindowHeightNoError(napi_env env, napi_callback_info info);
napi_value GetStartOptionsWindowHeightNoError(napi_env env, napi_callback_info info);
napi_value SetStartOptionsWindowWidthNoError(napi_env env, napi_callback_info info);
napi_value GetStartOptionsWindowWidthNoError(napi_env env, napi_callback_info info);
napi_value SetStartOptionsStartVisibilityNoError(napi_env env, napi_callback_info info);
napi_value GetStartOptionsStartVisibilityNoError(napi_env env, napi_callback_info info);
napi_value SetStartOptionsStartWindowIconNoError(napi_env env, napi_callback_info info);
napi_value GetStartOptionsStartWindowIconNoError(napi_env env, napi_callback_info info);
napi_value SetStartOptionsStartWindowBackgroundColorNoError(napi_env env, napi_callback_info info);
napi_value GetStartOptionsStartWindowBackgroundColorNoError(napi_env env, napi_callback_info info);
napi_value SetStartOptionsSupportedWindowModesNoError(napi_env env, napi_callback_info info);
napi_value GetStartOptionsSupportedWindowModesNoError(napi_env env, napi_callback_info info);
napi_value SetStartOptionsMinWindowWidthNoError(napi_env env, napi_callback_info info);
napi_value GetStartOptionsMinWindowWidthNoError(napi_env env, napi_callback_info info);
napi_value SetStartOptionsMaxWindowWidthNoError(napi_env env, napi_callback_info info);
napi_value GetStartOptionsMaxWindowWidthNoError(napi_env env, napi_callback_info info);
napi_value SetStartOptionsMinWindowHeightNoError(napi_env env, napi_callback_info info);
napi_value GetStartOptionsMinWindowHeightNoError(napi_env env, napi_callback_info info);
napi_value GetStartOptionsMinWindowHeightParamInvalid(napi_env env, napi_callback_info info);
napi_value SetStartOptionsMaxWindowHeightNoError(napi_env env, napi_callback_info info);
napi_value GetStartOptionsMaxWindowHeightNoError(napi_env env, napi_callback_info info);
napi_value CreateNativeChildProcessNoError(napi_env env, napi_callback_info info);
napi_value CreateNativeChildProcessInvalidParam(napi_env env, napi_callback_info info);
napi_value CreateNativeChildProcessLibLoadingFailed(napi_env env, napi_callback_info info);
napi_value CreateNativeChildProcessWithConfigsNoError(napi_env env, napi_callback_info info);
napi_value CreateNativeChildProcessWithConfigsInvalidParam(napi_env env, napi_callback_info info);
napi_value StartNativeChildProcessNoError(napi_env env, napi_callback_info info);
napi_value StartNativeChildProcessInvalidParam(napi_env env, napi_callback_info info);
napi_value StartNativeChildProcessWithConfigsNoError(napi_env env, napi_callback_info info);
napi_value StartNativeChildProcessWithConfigsInvalidParam(napi_env env, napi_callback_info info);
napi_value StartNativeChildProcessWithConfigsServiceError(napi_env env, napi_callback_info info);
napi_value StartSelfUIAbilityInstanceKeyNotSupport(napi_env env, napi_callback_info info);
napi_value StartSelfUIAbilityNoError(napi_env env, napi_callback_info info);
napi_value StartSelfUIAbilityUpperLimitReached(napi_env env, napi_callback_info info);
napi_value StartSelfUIAbilityWithStartOptionsInstanceKeyNotSupport(napi_env env, napi_callback_info info);
napi_value StartSelfUIAbilityWithStartOptionsNoError(napi_env env, napi_callback_info info);
napi_value StartSelfUIAbilityWithStartOptionsUpperLimitReached(napi_env env, napi_callback_info info);
napi_value StartSelfUIAbilityWithStartOptionsNoSuchAbility(napi_env env, napi_callback_info info);
napi_value StartSelfUIAbilityWithStartOptionsCodeCrossApp(napi_env env, napi_callback_info info);
napi_value StartSelfUIAbilityWithStartOptionsCodeInternal(napi_env env, napi_callback_info info);
napi_value StartSelfUIAbilityWithStartOptionsInvalidAppInstanceKey(napi_env env, napi_callback_info info);
napi_value StartSelfUIAbilityWithStartOptionsVisibilitySettingDisabled(napi_env env, napi_callback_info info);
napi_value ApplicationContextGetCacheDirNoError(napi_env env, napi_callback_info info);
napi_value ApplicationContextGetCacheDirInvPar(napi_env env, napi_callback_info info);
napi_value ApplicationContextGetAreaModeNoError(napi_env env, napi_callback_info info);
napi_value ApplicationContextGetAreaModeInvPar(napi_env env, napi_callback_info info);
napi_value ApplicationContextGetBundleNameNoError(napi_env env, napi_callback_info info);
napi_value ApplicationContextGetBundleNameInvPar(napi_env env, napi_callback_info info);
napi_value ApplicationContextGetTempDirNoError(napi_env env, napi_callback_info info);
napi_value ApplicationContextGetTempDirInvPar(napi_env env, napi_callback_info info);
napi_value ApplicationContextGetFilesDirNoError(napi_env env, napi_callback_info info);
napi_value ApplicationContextGetFilesDirInvPar(napi_env env, napi_callback_info info);
napi_value ApplicationContextGetDatabaseDirNoError(napi_env env, napi_callback_info info);
napi_value ApplicationContextGetDatabaseDirInvPar(napi_env env, napi_callback_info info);
napi_value ApplicationContextGetPreferencesDirNoError(napi_env env, napi_callback_info info);
napi_value ApplicationContextGetPreferencesDirInvPar(napi_env env, napi_callback_info info);
napi_value ApplicationContextGetBundleCodeDirNoError(napi_env env, napi_callback_info info);
napi_value ApplicationContextGetBundleCodeDirInvPar(napi_env env, napi_callback_info info);
napi_value ApplicationContextGetDistributedFilesDirNoError(napi_env env, napi_callback_info info);
napi_value ApplicationContextGetDistributedFilesDirInvPar(napi_env env, napi_callback_info info);
napi_value ApplicationContextGetCloudFileDirNoError(napi_env env, napi_callback_info info);
napi_value ApplicationContextGetCloudFileDirInvPar(napi_env env, napi_callback_info info);
napi_value ApplicationContextGetResourceDirNoError(napi_env env, napi_callback_info info);
napi_value NcpErrorInvalidParamCode(napi_env env, napi_callback_info info);
napi_value NcpErrorServiceErrorCode(napi_env env, napi_callback_info info);
napi_value NcpErrorLibLoadingFailedCode(napi_env env, napi_callback_info info);
napi_value NcpErrCallBackNotExistCode(napi_env env, napi_callback_info info);
napi_value AbilityBaseErrorCodeNoErrorCode(napi_env env, napi_callback_info info);
napi_value AbilityBaseErrorCodeParamInvalidCode(napi_env env, napi_callback_info info);
napi_value AbilityRuntimeErrorCodeNoSuchAbilityCode(napi_env env, napi_callback_info info);
napi_value AbilityRuntimeErrorCodeCrossAppCode(napi_env env, napi_callback_info info);
napi_value AbilityRuntimeErrorCodeInternalCode(napi_env env, napi_callback_info info);
napi_value AbilityRuntimeErrorVisibilitySettingDisabledCode(napi_env env, napi_callback_info info);
napi_value AbilityRuntimeErrorCodeInvalidAppInstanceKeyCode(napi_env env, napi_callback_info info);
napi_value AbilityRuntimeErrorCodeUpperLimitReachedCode(napi_env env, napi_callback_info info);
napi_value AbilityRuntimeErrorAppInstanceKeyNotSupportCode(napi_env env, napi_callback_info info);

#endif //ACTSCAPISTARTSELFUIABILITYTEST20_ACTSCAPISTARTSELFUIABILITYTEST20TEST_H
