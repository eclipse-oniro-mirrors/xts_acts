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

#include "common/common.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_animate.h>
#include <arkui/native_type.h>
#define res ((int)-2)
#define res2 ((int)-1)
#define res3 ((int)401)
#define res4 ((int)0)
#define res5 ((int)1)


namespace ArkUICapiTest {

static napi_value testArkUI001(napi_env env, napi_callback_info info)
{
    auto ret = OH_NativeXComponent_SetNeedSoftKeyboard(nullptr, false);
    ASSERT_EQ(ret, res);
    NAPI_END;
}

static napi_value testArkUI002(napi_env env, napi_callback_info info)
{
    auto ret = OH_NativeXComponent_RegisterSurfaceShowCallback(nullptr, nullptr);
    ASSERT_EQ(ret, res);
    NAPI_END;
}

static napi_value testArkUI003(napi_env env, napi_callback_info info)
{
    auto ret = OH_NativeXComponent_RegisterSurfaceHideCallback(nullptr, nullptr);
    ASSERT_EQ(ret, res);
    NAPI_END;
}

static napi_value testArkUI004(napi_env env, napi_callback_info info)
{
    auto ret = OH_NativeXComponent_RegisterOnTouchInterceptCallback (nullptr, nullptr);
    ASSERT_EQ(ret, res3);
    NAPI_END;
}

static napi_value testArkUI005(napi_env env, napi_callback_info info)
{
    auto ret = OH_NativeXComponent_GetTouchEventSourceType (nullptr, -1, nullptr);
    ASSERT_EQ(ret, OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER);
    NAPI_END;
}


static napi_value testArkUI006(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_LayoutConstraint_Copy(nullptr);
    if (ret == nullptr) {
        NAPI_END;
    }
}

static napi_value testArkUI007(napi_env env, napi_callback_info info) {
    auto layoutContraint = OH_ArkUI_LayoutConstraint_Create();
    auto disposeValue = OH_ArkUI_LayoutConstraint_Dispose(layoutContraint);
    auto copyValue = OH_ArkUI_LayoutConstraint_Copy(nullptr);
    if (copyValue == nullptr) {
        NAPI_END;
    }
}

static napi_value testArkUI008(napi_env env, napi_callback_info info) {
    auto layoutContraint = OH_ArkUI_LayoutConstraint_Create();
    auto copyValue = OH_ArkUI_LayoutConstraint_Copy(layoutContraint);
    auto disposeValue = OH_ArkUI_LayoutConstraint_Dispose(nullptr);
    if (disposeValue == nullptr) {
        NAPI_END;
    }
}

static napi_value testArkUI009(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_NodeCustomEvent_GetLayoutConstraintInMeasure(nullptr);
    if (ret == nullptr) {
        NAPI_END;
    } else {
        return nullptr;
    }
}

static napi_value testArkUI010(napi_env env, napi_callback_info info) {
    auto getPosition = OH_ArkUI_NodeCustomEvent_GetPositionInLayout(nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","CreateNativeNode yc-state %{public}f", getPosition);
    napi_value result = nullptr;
    napi_create_int32(env, 0, &result);                                                                                 
    return result;
}

static napi_value testArkUI011(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_NodeCustomEvent_GetDrawContextInDraw(nullptr);
    if (ret == nullptr) {
        NAPI_END;
    } else {
        return nullptr;
    }
}

static napi_value testArkUI012(napi_env env, napi_callback_info info) {
    auto guide = OH_ArkUI_GuidelineOption_Create(0);
    OH_ArkUI_GuidelineOption_SetId(guide, "guide", 0);
    auto getId = OH_ArkUI_GuidelineOption_GetId(guide, 0);
    if (getId == nullptr) {
        NAPI_END;
    }
    napi_value result = nullptr;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value testArkUI013(napi_env env, napi_callback_info info) {
    auto guide = OH_ArkUI_GuidelineOption_Create(0);
    OH_ArkUI_GuidelineOption_SetDirection(guide, ARKUI_AXIS_HORIZONTAL, 0);
    auto getDirection =  OH_ArkUI_GuidelineOption_GetDirection(guide, 0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","CreateNativeNode yc-state %{public}f", getDirection);
    napi_value result = nullptr;
    napi_create_int32(env, 0, &result);
    ASSERT_EQ(getDirection, res2);
    NAPI_END;
}

static napi_value testArkUI014(napi_env env, napi_callback_info info) {
    auto guide = OH_ArkUI_GuidelineOption_Create(0);
    OH_ArkUI_GuidelineOption_SetPositionStart(guide, 0.0f, 0);
    auto getPositionStart = OH_ArkUI_GuidelineOption_GetPositionStart(guide, 0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","CreateNativeNode yc-state %{public}f", getPositionStart);
    napi_value result = nullptr;
    napi_create_int32(env, 0, &result);
    ASSERT_EQ(getPositionStart, 0.0f);
    NAPI_END;
}

static napi_value testArkUI015(napi_env env, napi_callback_info info) {
    auto guide = OH_ArkUI_GuidelineOption_Create(0);
    OH_ArkUI_GuidelineOption_SetPositionEnd(guide, 0.0f, 0);
    auto getPositionEnd = OH_ArkUI_GuidelineOption_GetPositionEnd(guide, 0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","CreateNativeNode yc-state %{public}f", getPositionEnd);
    napi_value result = nullptr;
    napi_create_int32(env, 0, &result);
    ASSERT_EQ(getPositionEnd, 0.0f);
    OH_ArkUI_GuidelineOption_Dispose(guide);
    NAPI_END;
}

static napi_value testArkUI016(napi_env env, napi_callback_info info) {

    ArkUI_NodeContentHandle contentHandle = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, nullptr, &contentHandle);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "testArkUI016-Handle %{public}p", contentHandle);
    ASSERT_OBJ(contentHandle, nullptr);
    
    NAPI_END;
}

static napi_value testArkUI017(napi_env env, napi_callback_info info) {
    int testData1 = 10;
        
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "test17 start");

    int32_t ret = OH_ArkUI_NodeContent_SetUserData(nullptr, &testData1);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "testArkUI017-ret %{public}d", ret);
    ASSERT_NE(ret, res4);
        
    int *userData = reinterpret_cast<int *>(OH_ArkUI_NodeContent_GetUserData(nullptr));
    ASSERT_OBJ(userData, nullptr);

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "test17 end");
    NAPI_END;
}

static napi_value testArkUI018(napi_env env, napi_callback_info info) {
    
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "test18 start");

    ArkUI_NodeContentHandle handle = OH_ArkUI_NodeContentEvent_GetNodeContentHandle(nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "testArkUI018-handle %{public}p", handle);
    ASSERT_OBJ(handle, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "test18 end");
    NAPI_END;
}

static napi_value testArkUI019(napi_env env, napi_callback_info info) {
    auto ret = OH_NativeXComponent_GetTouchPointWindowX(nullptr,0,nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI019-ret %{public}d", ret);
    ASSERT_EQ(ret,res);
    NAPI_END;
}

static napi_value testArkUI020(napi_env env, napi_callback_info info) {
    auto ret = OH_NativeXComponent_GetTouchPointWindowY(nullptr,0,nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI020-ret %{public}d", ret);
    ASSERT_EQ(ret,res);
    NAPI_END;
}

static napi_value testArkUI021(napi_env env, napi_callback_info info) {
    auto ret = OH_NativeXComponent_GetTouchPointDisplayX(nullptr,0,nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI021-ret %{public}d", ret);
    ASSERT_EQ(ret,res);
    NAPI_END;
}

static napi_value testArkUI022(napi_env env, napi_callback_info info) {
    auto ret = OH_NativeXComponent_GetTouchPointDisplayY(nullptr,0,nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI022-ret %{public}d", ret);
    ASSERT_EQ(ret,res);
    NAPI_END;
}

static napi_value testArkUI024(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_PointerEvent_SetStopPropagation(nullptr,true);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI024-ret %{public}d", ret);
    ASSERT_EQ(ret,res3);
    NAPI_END;
}

static napi_value testArkUI025(napi_env env, napi_callback_info info) {
    OH_ArkUI_AnimateOption_SetICurve(nullptr,0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI025-end");
    NAPI_END;
}

static napi_value testArkUI026(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_AnimateOption_GetICurve(nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI026-ret %{public}p", ret);
    ASSERT_OBJ(ret,nullptr);
    NAPI_END;
}

static napi_value testArkUI028(napi_env env, napi_callback_info info) {
    OH_ArkUI_KeyframeAnimateOption_Dispose(nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI028-end");
    NAPI_END;
}

static napi_value testArkUI029(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_KeyframeAnimateOption_SetDelay(nullptr,0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI029-ret %{public}d", ret);
    ASSERT_EQ(ret,res3);
    NAPI_END;
}

static napi_value testArkUI030(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_KeyframeAnimateOption_SetIterations(nullptr,0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI030-ret %{public}d", ret);
    ASSERT_EQ(ret,res3);
    NAPI_END;
}

static napi_value testArkUI031(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_KeyframeAnimateOption_RegisterOnFinishCallback(nullptr,nullptr,nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI031-ret %{public}d", ret);
    ASSERT_EQ(ret,res3);
    NAPI_END;
}

static napi_value testArkUI032(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_KeyframeAnimateOption_SetDuration(nullptr,0,0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI032-ret %{public}d", ret);
    ASSERT_EQ(ret,res3);
    NAPI_END;
}

static napi_value testArkUI033(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_KeyframeAnimateOption_SetCurve(nullptr,0,0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI033-ret %{public}d", ret);
    ASSERT_EQ(ret,res3);
    NAPI_END;
}

static napi_value testArkUI034(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_KeyframeAnimateOption_RegisterOnEventCallback(nullptr,nullptr,nullptr,0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI034-ret %{public}d", ret);
    ASSERT_EQ(ret,res3);
    NAPI_END;
}

static napi_value testArkUI035(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_KeyframeAnimateOption_GetDelay(nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI035-ret %{public}d", ret);
    ASSERT_EQ(ret,res4);
    NAPI_END;
}

static napi_value testArkUI036(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_KeyframeAnimateOption_GetIterations(nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI036-ret %{public}d", ret);
    ASSERT_EQ(ret,res5);
    NAPI_END;
}

static napi_value testArkUI037(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_KeyframeAnimateOption_GetDuration(nullptr,0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI037-ret %{public}d", ret);
    ASSERT_EQ(ret,res4);
    NAPI_END;
}

static napi_value testArkUI038(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_KeyframeAnimateOption_GetCurve(nullptr,0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI038-ret %{public}p", ret);
    ASSERT_OBJ(ret,nullptr);
    NAPI_END;
}

static napi_value testArkUI039(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_SwiperIndicator_SetMaxDisplayCount(nullptr,0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI039-ret %{public}d", ret);
    ASSERT_EQ(ret,res3);
    NAPI_END;
}

static napi_value testArkUI040(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_SwiperIndicator_GetMaxDisplayCount(nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI040-ret %{public}d", ret);
    ASSERT_EQ(ret,res4);
    NAPI_END;
}

static napi_value testArkUI041(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_AnimatorOption_Create(0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI041-ret %{public}p", ret);
    if(ret == nullptr){
        napi_value result = nullptr;
        napi_create_int32(env,1,&result);
        return result;
    }
    NAPI_END;
}

static napi_value testArkUI042(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_AnimatorOption_Create(0);
    OH_ArkUI_AnimatorOption_Dispose(ret);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI042-ret %{public}p", ret);
    NAPI_END;
}

static napi_value testArkUI043(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_AnimatorOption_Create(0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI043-ret %{public}p", ret);
    int32_t ret1 = OH_ArkUI_AnimatorOption_SetDuration(ret,1);
    int32_t ret2 = OH_ArkUI_AnimatorOption_GetDuration(ret);
    ASSERT_EQ(ret2,res5);
    NAPI_END;
}

static napi_value testArkUI044(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_AnimatorOption_Create(0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI044-ret %{public}p", ret);
    int32_t ret1 = OH_ArkUI_AnimatorOption_SetDelay(ret,1);
    int32_t ret2 = OH_ArkUI_AnimatorOption_GetDelay(ret);
    ASSERT_EQ(ret2,res5);
    NAPI_END;
}

static napi_value testArkUI045(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_AnimatorOption_Create(0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI045-ret %{public}p", ret);
    int32_t ret1 = OH_ArkUI_AnimatorOption_SetIterations(ret,1);
    int32_t ret2 = OH_ArkUI_AnimatorOption_GetIterations(ret);
    ASSERT_EQ(ret2,res5);
    NAPI_END;
}

static napi_value testArkUI046(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_AnimatorOption_Create(0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI046-ret %{public}p", ret);
    int32_t ret1 = OH_ArkUI_AnimatorOption_SetFill(ret,ARKUI_ANIMATION_FILL_MODE_NONE);
    ArkUI_AnimationFillMode ret2 = OH_ArkUI_AnimatorOption_GetFill(ret);
    ASSERT_EQ(ret2,ARKUI_ANIMATION_FILL_MODE_NONE);
    NAPI_END;
}

static napi_value testArkUI047(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_AnimatorOption_Create(0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI047-ret %{public}p", ret);
    int32_t ret1 = OH_ArkUI_AnimatorOption_SetDirection(ret,ARKUI_ANIMATION_DIRECTION_NORMAL);
    ArkUI_AnimationDirection ret2 = OH_ArkUI_AnimatorOption_GetDirection(ret);
    ASSERT_EQ(ret2,ARKUI_ANIMATION_DIRECTION_NORMAL);
    NAPI_END;
}

static napi_value testArkUI048(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_AnimatorOption_Create(0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI048-ret %{public}p", ret);
    int32_t ret1 = OH_ArkUI_AnimatorOption_SetCurve(ret,nullptr);
    auto ret2 = OH_ArkUI_AnimatorOption_GetCurve(ret);
    ASSERT_OBJ(ret2,nullptr);
    NAPI_END;
}

static napi_value testArkUI049(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_AnimatorOption_Create(0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI049-ret %{public}p", ret);
    int32_t ret1 = OH_ArkUI_AnimatorOption_SetBegin(ret,0);
    int32_t ret2 = OH_ArkUI_AnimatorOption_GetBegin(ret);
    ASSERT_EQ(ret2,res4);
    NAPI_END;
}

static napi_value testArkUI050(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_AnimatorOption_Create(0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI050-ret %{public}p", ret);
    int32_t ret1 = OH_ArkUI_AnimatorOption_SetEnd(ret,1);
    int32_t ret2 = OH_ArkUI_AnimatorOption_GetEnd(ret);
    ASSERT_EQ(ret2,res5);
    NAPI_END;
}

static napi_value testArkUI051(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_AnimatorOption_Create(0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI051-ret %{public}p", ret);
    int32_t ret1 = OH_ArkUI_AnimatorOption_SetExpectedFrameRateRange(ret,nullptr);
    ASSERT_EQ(ret1,res3);
    NAPI_END;
}

static napi_value testArkUI054(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_AnimatorOption_Create(0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI054-ret %{public}p", ret);
    int32_t ret1 = OH_ArkUI_AnimatorOption_SetKeyframeCurve(ret,nullptr,1);
    auto ret2 = OH_ArkUI_AnimatorOption_GetKeyframeCurve(ret,1);
    ASSERT_OBJ(ret2,nullptr);
    NAPI_END;
}

static napi_value testArkUI055(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_AnimatorEvent_GetUserData(nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI055-ret %{public}p", ret);
    
    ASSERT_OBJ(ret,nullptr);
    NAPI_END;
}

static napi_value testArkUI056(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_AnimatorOnFrameEvent_GetUserData(nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI056-ret %{public}p", ret);
    
    ASSERT_OBJ(ret,nullptr);
    NAPI_END;
}

static napi_value testArkUI057(napi_env env, napi_callback_info info) {
    float t=0.0f;
    auto ret = OH_ArkUI_AnimatorOnFrameEvent_GetValue(nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI057-ret %{public}f", ret);
    
    ASSERT_EQ(ret,t);
    NAPI_END;
}

static napi_value testArkUI058(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_AnimatorOption_RegisterOnFrameCallback(nullptr,nullptr,nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI058-ret %{public}d", ret);
    
    ASSERT_EQ(ret,res3);
    NAPI_END;
}

static napi_value testArkUI059(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_AnimatorOption_RegisterOnFinishCallback(nullptr,nullptr,nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI059-ret %{public}d", ret);
    
    ASSERT_EQ(ret,res3);
    NAPI_END;
}

static napi_value testArkUI060(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_AnimatorOption_RegisterOnCancelCallback(nullptr,nullptr,nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI060-ret %{public}d", ret);
    
    ASSERT_EQ(ret,res3);
    NAPI_END;
}

static napi_value testArkUI061(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_AnimatorOption_RegisterOnRepeatCallback(nullptr,nullptr,nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI061-ret %{public}d", ret);
    
    ASSERT_EQ(ret,res3);
    NAPI_END;
}

static napi_value testArkUI062(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_Animator_ResetAnimatorOption(nullptr,nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI062-ret %{public}d", ret);
    
    ASSERT_EQ(ret,res3);
    NAPI_END;
}

static napi_value testArkUI063(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_Animator_Play(nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI063-ret %{public}d", ret);
    
    ASSERT_EQ(ret,res3);
    NAPI_END;
}

static napi_value testArkUI064(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_Animator_Finish(nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI064-ret %{public}d", ret);
    
    ASSERT_EQ(ret,res3);
    NAPI_END;
}

static napi_value testArkUI065(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_Animator_Pause(nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI065-ret %{public}d", ret);
    
    ASSERT_EQ(ret,res3);
    NAPI_END;
}

static napi_value testArkUI066(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_Animator_Cancel(nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI066-ret %{public}d", ret);
    
    ASSERT_EQ(ret,res3);
    NAPI_END;
}

static napi_value testArkUI067(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_CreateOpacityTransitionEffect(1.0f);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI067-ret %{public}p", ret);
    
    if(ret == nullptr){
        napi_value result = nullptr;
        napi_create_int32(env,1,&result);
        return result;
    }
    NAPI_END;
}

static napi_value testArkUI068(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_CreateTranslationTransitionEffect(nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI068-ret %{public}p", ret);
    
    ASSERT_OBJ(ret,nullptr);
    NAPI_END;
}

static napi_value testArkUI069(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_CreateScaleTransitionEffect(nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI069-ret %{public}p", ret);
    
    ASSERT_OBJ(ret,nullptr);
    NAPI_END;
}

static napi_value testArkUI070(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_CreateRotationTransitionEffect(nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI070-ret %{public}p", ret);
    
    ASSERT_OBJ(ret,nullptr);
    NAPI_END;
}

static napi_value testArkUI071(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_CreateMovementTransitionEffect(ARKUI_TRANSITION_EDGE_START);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI071-ret %{public}p", ret);
    
    if(ret == nullptr){
        napi_value result = nullptr;
        napi_create_int32(env,1,&result);
        return result;
    }
    NAPI_END;
}

static napi_value testArkUI072(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_CreateAsymmetricTransitionEffect(nullptr,nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI072-ret %{public}p", ret);
    
    ASSERT_OBJ(ret,nullptr);
    NAPI_END;
}

static napi_value testArkUI073(napi_env env, napi_callback_info info) {
    OH_ArkUI_TransitionEffect_Dispose(nullptr);
    NAPI_END;
}

static napi_value testArkUI074(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_TransitionEffect_Combine(nullptr,nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI074-ret %{public}d", ret);
    
    ASSERT_EQ(ret,res3);
    NAPI_END;
}

static napi_value testArkUI075(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_TransitionEffect_SetAnimation(nullptr,nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI075-ret %{public}d", ret);
    
    ASSERT_EQ(ret,res3);
    NAPI_END;
}

static napi_value testArkUI076(napi_env env, napi_callback_info info) {
    OH_ArkUI_ListItemSwipeActionItem_SetOnStateChangeWithUserData(nullptr,nullptr,nullptr);
    NAPI_END;
}

static napi_value testArkUI077(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_Animator_Reverse(nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI077-ret %{public}d", ret);
    
    ASSERT_EQ(ret,res3);
    NAPI_END;
}

static napi_value testArkUI078(napi_env env, napi_callback_info info) {
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1");
    auto ret = OH_ArkUI_Curve_CreateCurveByType(ARKUI_CURVE_LINEAR);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "testArkUI078-ret %{public}p", ret);
    
    if (ret == nullptr) {
        napi_value result = nullptr;
        napi_create_int32(env, 1, &result);
        return result;
    }
    NAPI_END;
}

static napi_value testArkUI079(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_Curve_CreateStepsCurve(1,true);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI079-ret %{public}p", ret);
    
    if (ret == nullptr) {
        napi_value result = nullptr;
        napi_create_int32(env, 1, &result);
        return result;
    }
    NAPI_END;
}

static napi_value testArkUI080(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_Curve_CreateCubicBezierCurve(0.0f,0.1f,0.0f,0.1f);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI080-ret %{public}p", ret);
    
    if (ret == nullptr) {
        napi_value result = nullptr;
        napi_create_int32(env, 1, &result);
        return result;
    }
    NAPI_END;
}

static napi_value testArkUI081(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_Curve_CreateSpringCurve(1.0f,1.0f,1.0f,1.0f);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI081-ret %{public}p", ret);
    
    if (ret == nullptr) {
        napi_value result = nullptr;
        napi_create_int32(env, 1, &result);
        return result;
    }
    NAPI_END;
}

static napi_value testArkUI082(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_Curve_CreateSpringMotion(1.0f,1.0f,1.0f);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI082-ret %{public}p", ret);
    
    if (ret == nullptr) {
        napi_value result = nullptr;
        napi_create_int32(env, 1, &result);
        return result;
    }
    NAPI_END;
}

static napi_value testArkUI083(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_Curve_CreateResponsiveSpringMotion(1.0f,1.0f,1.0f);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI083-ret %{public}p", ret);
    
    if (ret == nullptr) {
        napi_value result = nullptr;
        napi_create_int32(env, 1, &result);
        return result;
    }
    NAPI_END;
}

static napi_value testArkUI084(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_Curve_CreateInterpolatingSpring(1.0f,1.0f,1.0f,1.0f);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI084-ret %{public}p", ret);
    
    if (ret == nullptr) {
        napi_value result = nullptr;
        napi_create_int32(env, 1, &result);
        return result;
    }
    NAPI_END;
}

static napi_value testArkUI085(napi_env env, napi_callback_info info) {
    auto ret = OH_ArkUI_Curve_CreateCustomCurve(nullptr,nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager","testArkUI085-ret %{public}p", ret);
    
    if (ret == nullptr) {
        napi_value result = nullptr;
        napi_create_int32(env, 1, &result);
        return result;
    }
    NAPI_END;
}

static napi_value testArkUI086(napi_env env, napi_callback_info info) {
    OH_ArkUI_Curve_DisposeCurve(nullptr);
    NAPI_END;
}

static napi_value testArkUI089(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_AnimatorOption_GetExpectedFrameRateRange(nullptr);
    ASSERT_OBJ(ret, nullptr);
    NAPI_END;
}

} // namespace ArkUICapiTest

