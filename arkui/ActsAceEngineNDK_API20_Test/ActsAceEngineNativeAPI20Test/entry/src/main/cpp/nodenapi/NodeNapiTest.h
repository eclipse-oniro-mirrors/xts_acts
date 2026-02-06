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
#ifndef NODE_NAPI_TEST_H
#define NODE_NAPI_TEST_H

#include <napi/native_api.h>
#include <arkui/native_node.h>
#include "common/Common.h"

namespace NodeNapiTest {
    napi_value GetNodeHandleFromNapiValueTest_001(napi_env env, napi_callback_info info);
    napi_value GetNodeHandleFromNapiValueTest_002(napi_env env, napi_callback_info info);
    
    napi_value GetContextFromNapiValueTest_001(napi_env env, napi_callback_info info);
    napi_value GetContextFromNapiValueTest_002(napi_env env, napi_callback_info info);

    napi_value GetNodeContentFromNapiValueTest_001(napi_env env, napi_callback_info info);
    napi_value GetNodeContentFromNapiValueTest_002(napi_env env, napi_callback_info info);
    
    napi_value GetDrawableDescriptorFromNapiValueTest_001(napi_env env, napi_callback_info info);
    napi_value GetDrawableDescriptorFromNapiValueTest_002(napi_env env, napi_callback_info info);

    napi_value GetDrawableDescriptorFromResourceTest_001(napi_env env, napi_callback_info info);
    napi_value GetDrawableDescriptorFromResourceTest_002(napi_env env, napi_callback_info info);

    napi_value CreateFrameNode(napi_env env, napi_callback_info info);
    napi_value GetUIContext(napi_env env, napi_callback_info info);
    napi_value CreateNodeContent(napi_env env, napi_callback_info info);
    napi_value CreateDrawableDescriptor(napi_env env, napi_callback_info info);
    napi_value CreateResource(napi_env env, napi_callback_info info);
    napi_value CreateNavigation(napi_env env, napi_callback_info info);

    napi_value GetNavigationIdTest_001(napi_env env, napi_callback_info info);
    napi_value GetNavigationIdTest_002(napi_env env, napi_callback_info info);
    napi_value GetNavigationIdTest_003(napi_env env, napi_callback_info info);
    napi_value GetNavigationIdTest_004(napi_env env, napi_callback_info info);
    napi_value GetNavigationIdTest_005(napi_env env, napi_callback_info info);
    napi_value GetNavigationIdTest_006(napi_env env, napi_callback_info info);

    napi_value GetNavDestinationNameTest_001(napi_env env, napi_callback_info info);
    napi_value GetNavDestinationNameTest_002(napi_env env, napi_callback_info info);
    napi_value GetNavDestinationNameTest_003(napi_env env, napi_callback_info info);
    napi_value GetNavDestinationNameTest_004(napi_env env, napi_callback_info info);
    napi_value GetNavDestinationNameTest_005(napi_env env, napi_callback_info info);
    napi_value GetNavDestinationNameTest_006(napi_env env, napi_callback_info info);
    napi_value GetNavStackLengthTest_001(napi_env env, napi_callback_info info);
    napi_value GetNavStackLengthTest_002(napi_env env, napi_callback_info info);
    napi_value GetNavStackLengthTest_003(napi_env env, napi_callback_info info);
    napi_value GetNavDestinationNameByIndexTest_001(napi_env env, napi_callback_info info);
    napi_value GetNavDestinationNameByIndexTest_002(napi_env env, napi_callback_info info);
    napi_value GetNavDestinationNameByIndexTest_003(napi_env env, napi_callback_info info);
    napi_value GetNavDestinationNameByIndexTest_004(napi_env env, napi_callback_info info);
    napi_value GetNavDestinationNameByIndexTest_005(napi_env env, napi_callback_info info);
    napi_value GetNavDestinationNameByIndexTest_006(napi_env env, napi_callback_info info);
    napi_value GetNavDestinationNameByIndexTest_007(napi_env env, napi_callback_info info);
    napi_value GetNavDestinationIdTest_001(napi_env env, napi_callback_info info);
    napi_value GetNavDestinationIdTest_002(napi_env env, napi_callback_info info);
    napi_value GetNavDestinationIdTest_003(napi_env env, napi_callback_info info);
    napi_value GetNavDestinationIdTest_004(napi_env env, napi_callback_info info);
    napi_value GetNavDestinationIdTest_005(napi_env env, napi_callback_info info);
    napi_value GetNavDestinationIdTest_006(napi_env env, napi_callback_info info);
    napi_value GetNavDestinationStateTest_001(napi_env env, napi_callback_info info);
    napi_value GetNavDestinationStateTest_002(napi_env env, napi_callback_info info);
    napi_value GetNavDestinationStateTest_003(napi_env env, napi_callback_info info);
    napi_value GetNavDestinationStateTest_004(napi_env env, napi_callback_info info);
    napi_value GetNavDestinationIndexTest_001(napi_env env, napi_callback_info info);
    napi_value GetNavDestinationIndexTest_002(napi_env env, napi_callback_info info);
    napi_value GetNavDestinationIndexTest_003(napi_env env, napi_callback_info info);
    napi_value GetNavDestinationIndexTest_004(napi_env env, napi_callback_info info);
    napi_value GetRouterPageIndexTest_001(napi_env env, napi_callback_info info);
    napi_value GetRouterPageIndexTest_002(napi_env env, napi_callback_info info);
    napi_value GetRouterPageIndexTest_003(napi_env env, napi_callback_info info);
    napi_value GetRouterPageIndexTest_004(napi_env env, napi_callback_info info);
    napi_value GetRouterPageNameTest_001(napi_env env, napi_callback_info info);
    napi_value GetRouterPageNameTest_002(napi_env env, napi_callback_info info);
    napi_value GetRouterPageNameTest_003(napi_env env, napi_callback_info info);
    napi_value GetRouterPageNameTest_004(napi_env env, napi_callback_info info);
    napi_value GetRouterPageNameTest_005(napi_env env, napi_callback_info info);
    napi_value GetRouterPageNameTest_006(napi_env env, napi_callback_info info);
    napi_value GetRouterPagePathTest_001(napi_env env, napi_callback_info info);
    napi_value GetRouterPagePathTest_002(napi_env env, napi_callback_info info);
    napi_value GetRouterPagePathTest_003(napi_env env, napi_callback_info info);
    napi_value GetRouterPagePathTest_004(napi_env env, napi_callback_info info);
    napi_value GetRouterPagePathTest_005(napi_env env, napi_callback_info info);
    napi_value GetRouterPagePathTest_006(napi_env env, napi_callback_info info);
    napi_value GetRouterPageStateTest_001(napi_env env, napi_callback_info info);
    napi_value GetRouterPageStateTest_002(napi_env env, napi_callback_info info);
    napi_value GetRouterPageStateTest_003(napi_env env, napi_callback_info info);
    napi_value GetRouterPageStateTest_004(napi_env env, napi_callback_info info);
    napi_value GetRouterPageIdTest_001(napi_env env, napi_callback_info info);
    napi_value GetRouterPageIdTest_002(napi_env env, napi_callback_info info);
    napi_value GetRouterPageIdTest_003(napi_env env, napi_callback_info info);
    napi_value GetRouterPageIdTest_004(napi_env env, napi_callback_info info);
    napi_value GetRouterPageIdTest_005(napi_env env, napi_callback_info info);
    napi_value GetRouterPageIdTest_006(napi_env env, napi_callback_info info);

    napi_value GetNapiEnv(napi_env env, napi_callback_info info);
    napi_value InitModuleForArkTSEnvTest_001(napi_env env, napi_callback_info info);
    napi_value InitModuleForArkTSEnvTest_002(napi_env env, napi_callback_info info);
    napi_value NotifyArkTSEnvDestroyTest_001(napi_env env, napi_callback_info info);

}

#endif // NODE_NAPI_TEST_H