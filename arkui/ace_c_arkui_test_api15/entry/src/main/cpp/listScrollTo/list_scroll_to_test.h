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
#ifndef ARKUI_CAPI_XTS_LIST_SCROLL_TO_TEST_H
#define ARKUI_CAPI_XTS_LIST_SCROLL_TO_TEST_H

#include "../common/common.h"
#include <ace/xcomponent/native_interface_xcomponent.h>

namespace ArkUICapiTest {

class ListScrollToTest {
public:
    ~ListScrollToTest();
    static napi_value ListScrollToIndexTest(napi_env env, napi_callback_info info);
private:
    static ArkUI_NodeHandle CreateButton(ArkUI_NativeNodeAPI_1 *nodeAPI, std::string buttonName, int eventId);
    static void ProcessEvent(ArkUI_NativeNodeAPI_1 *nodeAPI, int eventId);
    static void AddListItem(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list);
    static void AddListItemGroup(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list2);
    static void AddListItemGroup1(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &list);
    static ArkUI_NodeHandle CreateChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI);
};
} // namespace ArkUICapiTest
#endif // ARKUI_CAPI_XTS_LIST_SCROLL_TO_TEST_H