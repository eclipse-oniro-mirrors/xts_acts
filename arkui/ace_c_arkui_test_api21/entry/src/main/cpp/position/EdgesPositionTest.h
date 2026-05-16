/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#ifndef ARKUI_CAPI_XTS_EDGES_POSITION_TEST_H
#define ARKUI_CAPI_XTS_EDGES_POSITION_TEST_H

#include "../common/common.h"
#include <ace/xcomponent/native_interface_xcomponent.h>

namespace ArkUICapiTest {

class EdgesPositionTest {
public:
    ~EdgesPositionTest();
    static napi_value CreatePositionEdgesNativeRoot(napi_env env, napi_callback_info info);
    static napi_value setPositionEdgesIllegal_1(napi_env env, napi_callback_info info);
    static napi_value setPositionEdgesIllegal_2(napi_env env, napi_callback_info info);
    static napi_value setPositionEdgesIllegal_3(napi_env env, napi_callback_info info);
    static napi_value setPositionEdges_top(napi_env env, napi_callback_info info);
    static napi_value setPositionEdges_left(napi_env env, napi_callback_info info);
    static napi_value setPositionEdges_bottom(napi_env env, napi_callback_info info);
    static napi_value setPositionEdges_right(napi_env env, napi_callback_info info);
    static napi_value setPositionEdges_top_negative(napi_env env, napi_callback_info info);
    static napi_value setPositionEdges_left_negative(napi_env env, napi_callback_info info);
    static napi_value setPositionEdges_bottom_negative(napi_env env, napi_callback_info info);
    static napi_value setPositionEdges_right_negative(napi_env env, napi_callback_info info);
    static napi_value setPositionEdges_top_left(napi_env env, napi_callback_info info);
    static napi_value setPositionEdges_top_right(napi_env env, napi_callback_info info);
    static napi_value setPositionEdges_top_bottom(napi_env env, napi_callback_info info);
    static napi_value setPositionEdges_left_bottom(napi_env env, napi_callback_info info);
    static napi_value setPositionEdges_left_right(napi_env env, napi_callback_info info);
    static napi_value setPositionEdges_bottom_right(napi_env env, napi_callback_info info);
    static napi_value setPositionEdges_top_left_bottom(napi_env env, napi_callback_info info);
    static napi_value setPositionEdges_top_left_right(napi_env env, napi_callback_info info);
    static napi_value setPositionEdges_top_bottom_right(napi_env env, napi_callback_info info);
    static napi_value setPositionEdges_left_bottom_right(napi_env env, napi_callback_info info);
    static napi_value setPositionEdges_top_left_bottom_right(napi_env env, napi_callback_info info);
    static napi_value getPositionEdges(napi_env env, napi_callback_info info);
    static napi_value reSetPositionEdges(napi_env env, napi_callback_info info);
    static napi_value copyPositionEdges(napi_env env, napi_callback_info info);

    static napi_value TestPositionEdgesGetTopErrorCode_001(napi_env env, napi_callback_info info);
    static napi_value TestPositionEdgesGetTopErrorCode_002(napi_env env, napi_callback_info info);
    static napi_value TestPositionEdgesGetLeftErrorCode_001(napi_env env, napi_callback_info info);
    static napi_value TestPositionEdgesGetLeftErrorCode_002(napi_env env, napi_callback_info info);
    static napi_value TestPositionEdgesGetBottomErrorCode_001(napi_env env, napi_callback_info info);
    static napi_value TestPositionEdgesGetBottomErrorCode_002(napi_env env, napi_callback_info info);
    static napi_value TestPositionEdgesGetRightErrorCode_001(napi_env env, napi_callback_info info);
    static napi_value TestPositionEdgesGetRightErrorCode_002(napi_env env, napi_callback_info info);
    static napi_value TestPositionEdgesCopyReturnNullptr(napi_env env, napi_callback_info info);
    static napi_value TestPositionEdgesCreateReturnNoNullptr(napi_env env, napi_callback_info info);
};
} // namespace ArkUICapiTest
#endif // ARKUI_CAPI_XTS_EDGES_POSITION_TEST_H