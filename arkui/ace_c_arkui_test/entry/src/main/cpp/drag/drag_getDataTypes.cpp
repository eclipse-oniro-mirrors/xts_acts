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

#include "dragTest.h"
#define LENGTH 2
#define MAXSTRLEN 128
namespace ArkUICapiTest {

static napi_value drag_getDataTypes_001(napi_env env, napi_callback_info info)
{
    ArkUI_NodeEvent *event = nullptr;
    auto dragEvent = OH_ArkUI_NodeEvent_GetDragEvent(event);
    char stringArray[LENGTH][MAXSTRLEN];
    char *dataTypes[MAXSTRLEN];
    for (int i = 0; i < LENGTH; i++) {
        dataTypes[i] = stringArray[i];
    }
    auto returnValue = OH_ArkUI_DragEvent_GetDataTypes(dragEvent, dataTypes, LENGTH, MAXSTRLEN);
    ASSERT_EQ(returnValue, INVALID_PARAM);
    NAPI_END;
}
}
