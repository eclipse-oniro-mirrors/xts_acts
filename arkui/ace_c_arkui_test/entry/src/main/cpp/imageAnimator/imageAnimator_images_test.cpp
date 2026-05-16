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

namespace ArkUICapiTest {

static napi_value TestImageAnimatorImages001(napi_env env, napi_callback_info info)
{
    NAPI_START(imageAnimator, ARKUI_NODE_IMAGE_ANIMATOR);
    ArkUI_ImageAnimatorFrameInfo *frameInfoArray[PARAM_5];
    char* imageUrls1[] = {
        "./resources/base/media/icon.png",
        "./resources/base/media/background_green.png",
        "./resources/base/media/background_red.png",
        "./resources/base/media/background_yellow.png",
        "./resources/base/media/background_blue.png",
    };
    for (int i = 0; i < PARAM_5; ++i) {
        frameInfoArray[i] = OH_ArkUI_ImageAnimatorFrameInfo_CreateFromString(const_cast<char *>(imageUrls1[i]));
    }
    ArkUI_AttributeItem image_attribute_item = {.object = frameInfoArray, .size = PARAM_5};

    auto ret = nodeAPI->setAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_IMAGES, &image_attribute_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_OBJ(nodeAPI->getAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_IMAGES)->object, frameInfoArray);
    NAPI_END;
}

static napi_value TestImageAnimatorImages002(napi_env env, napi_callback_info info)
{
    NAPI_START(imageAnimator, ARKUI_NODE_IMAGE_ANIMATOR);
    ArkUI_NumberValue value[] = {};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_IMAGES, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestImageAnimatorImages003(napi_env env, napi_callback_info info)
{
    NAPI_START(imageAnimator, ARKUI_NODE_IMAGE_ANIMATOR);
    auto ret = nodeAPI->setAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_IMAGES, nullptr);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestImageAnimatorImages004(napi_env env, napi_callback_info info)
{
    NAPI_START(imageAnimator, ARKUI_NODE_IMAGE_ANIMATOR);
    ArkUI_ImageAnimatorFrameInfo *frameInfoArray[PARAM_5];
    char* imageUrls1[] = {
        "./resources/base/media/icon.png",
        "./resources/base/media/background_green.png",
        "./resources/base/media/background_red.png",
        "./resources/base/media/background_yellow.png",
        "./resources/base/media/background_blue.png",
    };
    for (int i = 0; i < PARAM_5; ++i) {
        frameInfoArray[i] = OH_ArkUI_ImageAnimatorFrameInfo_CreateFromString(const_cast<char *>(imageUrls1[i]));
    }
    ArkUI_AttributeItem image_attribute_item = {.object = frameInfoArray, .size = PARAM_5};

    auto ret = nodeAPI->setAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_IMAGES, &image_attribute_item);
    ASSERT_EQ(ret, SUCCESS);
    auto ret1 = nodeAPI->resetAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_IMAGES);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_IMAGES)->size, 0);
    NAPI_END;
}

static napi_value TestImageAnimatorImages005(napi_env env, napi_callback_info info)
{
    NAPI_START(imageAnimator, ARKUI_NODE_IMAGE_ANIMATOR);
    ArkUI_ImageAnimatorFrameInfo *frameInfoArray[PARAM_5];
    char* imageUrls1[] = {
        "./resources/base/media/background_green1.jpg",
        "./resources/base/media/background_red1.jpg",
        "./resources/base/media/background_yellow1.jpg",
        "./resources/base/media/background_blue1.jpg",
    };
    for (int i = 0; i < PARAM_5; ++i) {
        frameInfoArray[i] = OH_ArkUI_ImageAnimatorFrameInfo_CreateFromString(const_cast<char *>(imageUrls1[i]));
    }
    ArkUI_AttributeItem image_attribute_item = {.object = frameInfoArray, .size = PARAM_5};

    auto ret = nodeAPI->setAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_IMAGES, &image_attribute_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_OBJ(nodeAPI->getAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_IMAGES)->object, frameInfoArray);
    NAPI_END;
}

static napi_value TestImageAnimatorImages006(napi_env env, napi_callback_info info)
{
    NAPI_START(imageAnimator, ARKUI_NODE_IMAGE_ANIMATOR);
    ArkUI_ImageAnimatorFrameInfo *frameInfoArray[PARAM_5];
    char* imageUrls1[] = {
        "./resources/base/media/background_green2.bmp",
        "./resources/base/media/background_red2.bmp",
        "./resources/base/media/background_yellow2.bmp",
        "./resources/base/media/background_blue2.bmp",
    };
    for (int i = 0; i < PARAM_5; ++i) {
        frameInfoArray[i] = OH_ArkUI_ImageAnimatorFrameInfo_CreateFromString(const_cast<char *>(imageUrls1[i]));
    }
    ArkUI_AttributeItem image_attribute_item = {.object = frameInfoArray, .size = PARAM_5};

    auto ret = nodeAPI->setAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_IMAGES, &image_attribute_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_OBJ(nodeAPI->getAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_IMAGES)->object, frameInfoArray);
    NAPI_END;
}
} // namespace ArkUICapiTest