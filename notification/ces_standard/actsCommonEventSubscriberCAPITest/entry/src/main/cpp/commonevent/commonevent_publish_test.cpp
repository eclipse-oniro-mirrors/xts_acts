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

#include "napi/native_api.h"
#include "oh_commonevent.h"
#include "common.h"
#include "commonevent_publish_test.h"

namespace CesCapiTest {
 napi_value CommonEventPublishTest::TestCommonEventPublish001(napi_env env, napi_callback_info info)
{
    const char* event = COMMON_EVENT_TEST;
    ASSERT_EQ(OH_CommonEvent_Publish(event), COMMONEVENT_ERR_OK);
    NAPI_END;
}

 napi_value CommonEventPublishTest::TestCommonEventPublish002(napi_env env, napi_callback_info info)
{
    const char* event = "event";
    ASSERT_EQ(OH_CommonEvent_Publish(event), COMMONEVENT_ERR_OK);
    NAPI_END;
}

 napi_value CommonEventPublishTest::TestCommonEventPublish003(napi_env env, napi_callback_info info)
{
    const char* event = nullptr;
    ASSERT_EQ(OH_CommonEvent_Publish(event), COMMONEVENT_ERR_INVALID_PARAMETER);
    NAPI_END;
}

 napi_value CommonEventPublishTest::TestCommonEventPublishWithInfo001(napi_env env, napi_callback_info info)
{
    const char* event = COMMON_EVENT_TEST;
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    ASSERT_EQ(OH_CommonEvent_PublishWithInfo(event, publishInfo), COMMONEVENT_ERR_OK);
    if (publishInfo != nullptr) {
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
    }
    publishInfo = nullptr;
    NAPI_END;
}

 napi_value CommonEventPublishTest::TestCommonEventPublishWithInfo002(napi_env env, napi_callback_info info)
{
    const char* event = COMMON_EVENT_TEST;
    bool ordered = false;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    ASSERT_EQ(OH_CommonEvent_PublishWithInfo(event, publishInfo), COMMONEVENT_ERR_OK);
    if (publishInfo != nullptr) {
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
    }
    publishInfo = nullptr;
    NAPI_END;
}

 napi_value CommonEventPublishTest::TestCommonEventPublishWithInfo003(napi_env env, napi_callback_info info)
{
    const char* event = COMMON_EVENT_TEST;
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    ASSERT_EQ(OH_CommonEvent_PublishWithInfo(nullptr, publishInfo), COMMONEVENT_ERR_INVALID_PARAMETER);
    if (publishInfo != nullptr) {
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
    }
    publishInfo = nullptr;
    NAPI_END;
}

 napi_value CommonEventPublishTest::TestCommonEventPublishWithInfo004(napi_env env, napi_callback_info info)
{
    const char* event = COMMON_EVENT_TEST;
    bool ordered = true;
    auto publishInfo = OH_CommonEvent_CreatePublishInfo(ordered);
    ASSERT_EQ(OH_CommonEvent_PublishWithInfo(event, nullptr), COMMONEVENT_ERR_INVALID_PARAMETER);
    if (publishInfo != nullptr) {
        OH_CommonEvent_DestroyPublishInfo(publishInfo);
    }
    publishInfo = nullptr;
    NAPI_END;
}
} // namespace CesCapiTest