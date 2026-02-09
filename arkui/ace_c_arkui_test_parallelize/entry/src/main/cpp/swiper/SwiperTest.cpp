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
#include "../common/common.h"
#include "manager/PluginManagerTest.h"
#include <arkui/native_node.h>
#include <arkui/native_type.h>
#include <arkui/native_animate.h>
#include <arkui/native_gesture.h>
#include <arkui/native_node_napi.h>
#include <napi/native_api.h>
#include <hilog/log.h>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include "arkui/native_interface.h"
#include <thread>
#include <sstream>
#include <string>
#include "SwiperTest.h"

const int PARAM_1000 = 1000;
const char* MY_LOG_TAG = "nativeTestSwiper";
constexpr int SWIPER_COUNT_PER_THREAD = 5;
constexpr int ASYNC_TASK_COUNT = 20;



static std::string GetThreadId() {
    std::stringstream ss;
    ss << std::this_thread::get_id();
    return ss.str();
}

/**
 * NODE_SWIPER_LOOP = MAX_NODE_SCOPE_NUM * ARKUI_NODE_SWIPER,
NODE_SWIPER_AUTO_PLAY,
NODE_SWIPER_SHOW_INDICATOR,
NODE_SWIPER_INTERVAL,
NODE_SWIPER_VERTICAL,
NODE_SWIPER_DURATION,
NODE_SWIPER_CURVE,
NODE_SWIPER_ITEM_SPACE,
NODE_SWIPER_INDEX,
NODE_SWIPER_DISPLAY_COUNT,
NODE_SWIPER_DISABLE_SWIPE,
NODE_SWIPER_SHOW_DISPLAY_ARROW,
NODE_SWIPER_EDGE_EFFECT_MODE,
NODE_SWIPER_NODE_ADAPTER,
NODE_SWIPER_CACHED_COUNT,
NODE_SWIPER_PREV_MARGIN,
NODE_SWIPER_NEXT_MARGIN,
NODE_SWIPER_INDICATOR,
NODE_SWIPER_NESTED_SCROLL,
NODE_SWIPER_SWIPE_TO_INDEX,
NODE_SWIPER_INDICATOR_INTERACTIVE,
NODE_SWIPER_PAGE_FLIP_MODE,
NODE_SWIPER_AUTO_FILL,
NODE_SWIPER_MAINTAIN_VISIBLE_CONTENT_POSITION = 1001023,
NODE_SWIPER_ITEMFILLPOLICY = 1001024,

 * */

static std::map<ArkUI_NodeAttributeType, std::string> ATTR_NAME_MAP = {
    { NODE_SWIPER_LOOP, "NODE_SWIPER_LOOP" },
    { NODE_SWIPER_AUTO_PLAY, "NODE_SWIPER_AUTO_PLAY" },
    { NODE_SWIPER_SHOW_INDICATOR, "NODE_SWIPER_SHOW_INDICATOR"},
    { NODE_SWIPER_INTERVAL, "NODE_SWIPER_INTERVAL"},
    { NODE_SWIPER_VERTICAL, "NODE_SWIPER_VERTICAL"},
    { NODE_SWIPER_DURATION, "NODE_SWIPER_DURATION"},
    { NODE_SWIPER_CURVE, "NODE_SWIPER_CURVE"},
    { NODE_SWIPER_ITEM_SPACE, "NODE_SWIPER_ITEM_SPACE"},
    { NODE_SWIPER_INDEX, "NODE_SWIPER_INDEX"},
    { NODE_SWIPER_DISPLAY_COUNT, "NODE_SWIPER_DISPLAY_COUNT"},
    { NODE_SWIPER_DISABLE_SWIPE, "NODE_SWIPER_DISABLE_SWIPE"},
    { NODE_SWIPER_SHOW_DISPLAY_ARROW, "NODE_SWIPER_SHOW_DISPLAY_ARROW"},
    { NODE_SWIPER_EDGE_EFFECT_MODE, "NODE_SWIPER_EDGE_EFFECT_MODE"},
    { NODE_SWIPER_NODE_ADAPTER, "NODE_SWIPER_NODE_ADAPTER"},
    { NODE_SWIPER_CACHED_COUNT, "NODE_SWIPER_CACHED_COUNT"},
    { NODE_SWIPER_PREV_MARGIN, "NODE_SWIPER_PREV_MARGIN"},
    { NODE_SWIPER_NEXT_MARGIN, "NODE_SWIPER_NEXT_MARGIN"},
    { NODE_SWIPER_INDICATOR, "NODE_SWIPER_INDICATOR"},
    { NODE_SWIPER_NESTED_SCROLL, "NODE_SWIPER_NESTED_SCROLL"},
    { NODE_SWIPER_SWIPE_TO_INDEX, "NODE_SWIPER_SWIPE_TO_INDEX"},
    { NODE_SWIPER_INDICATOR_INTERACTIVE, "NODE_SWIPER_INDICATOR_INTERACTIVE"},
    { NODE_SWIPER_PAGE_FLIP_MODE, "NODE_SWIPER_PAGE_FLIP_MODE"},
    { NODE_SWIPER_AUTO_FILL, "NODE_SWIPER_AUTO_FILL"},
    { NODE_SWIPER_MAINTAIN_VISIBLE_CONTENT_POSITION, "NODE_SWIPER_MAINTAIN_VISIBLE_CONTENT_POSITION"},
    { NODE_SWIPER_ITEMFILLPOLICY, "NODE_SWIPER_ITEMFILLPOLICY"},
    
    { NODE_TRANSLATE, "NODE_TRANSLATE" },
    { NODE_SCALE, "NODE_SCALE" },
    { NODE_ROTATE, "NODE_ROTATE"},
    { NODE_BRIGHTNESS, "NODE_BRIGHTNESS"},
    { NODE_SATURATION, "NODE_SATURATION"},
    { NODE_BLUR, "NODE_BLUR"},
    { NODE_LINEAR_GRADIENT, "NODE_LINEAR_GRADIENT"},
    { NODE_OPACITY, "NODE_OPACITY"},
    { NODE_CLIP, "NODE_CLIP"},
    { NODE_CLIP_SHAPE, "NODE_CLIP_SHAPE"},
    { NODE_TRANSFORM, "NODE_TRANSFORM"},
    { NODE_SHADOW, "NODE_SHADOW"},
    { NODE_CUSTOM_SHADOW, "NODE_CUSTOM_SHADOW"},
    { NODE_TRANSFORM_CENTER, "NODE_TRANSFORM_CENTER"},
    { NODE_OPACITY_TRANSITION, "NODE_OPACITY_TRANSITION"},
    { NODE_ROTATE_TRANSITION, "NODE_ROTATE_TRANSITION"},
    { NODE_SCALE_TRANSITION, "NODE_SCALE_TRANSITION"},
    { NODE_TRANSLATE_TRANSITION, "NODE_TRANSLATE_TRANSITION"},
    { NODE_MOVE_TRANSITION, "NODE_MOVE_TRANSITION"},
    { NODE_SWEEP_GRADIENT, "NODE_SWEEP_GRADIENT"},
    { NODE_RADIAL_GRADIENT, "NODE_RADIAL_GRADIENT"},
    { NODE_MASK, "NODE_MASK"},
    { NODE_BLEND_MODE, "NODE_BLEND_MODE"},
    { NODE_GRAY_SCALE, "NODE_GRAY_SCALE"},
    { NODE_INVERT, "NODE_INVERT"},
    { NODE_SEPIA, "NODE_SEPIA"},
    { NODE_CONTRAST, "NODE_CONTRAST"},
    { NODE_FOREGROUND_COLOR, "NODE_FOREGROUND_COLOR"},
    { NODE_OUTLINE_WIDTH, "NODE_OUTLINE_WIDTH"},
    { NODE_GEOMETRY_TRANSITION, "NODE_GEOMETRY_TRANSITION"},
    { NODE_RENDER_FIT, "NODE_RENDER_FIT"},
    { NODE_OUTLINE_COLOR, "NODE_OUTLINE_COLOR"},
    { NODE_RENDER_GROUP, "NODE_RENDER_GROUP"},
    { NODE_COLOR_BLEND, "NODE_COLOR_BLEND"},
    { NODE_FOREGROUND_BLUR_STYLE, "NODE_FOREGROUND_BLUR_STYLE"},
    { NODE_TRANSITION, "NODE_TRANSITION"},
    { NODE_BACKDROP_BLUR, "NODE_BACKDROP_BLUR"},
    { NODE_TRANSLATE_WITH_PERCENT, "NODE_TRANSLATE_WITH_PERCENT"},
    { NODE_ROTATE_ANGLE, "NODE_ROTATE_ANGLE"},
};

namespace ArkUICapiTest {
// 校验属性
static void CheckSwiperAttr(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle node, ArkUI_NodeAttributeType type, const ArkUI_AttributeItem* expectAttr,
    bool testObj = false, std::function<bool(const void* realObj, const void* expectObj)> compareFunc = nullptr) {
    auto it = ATTR_NAME_MAP.find(type);
    const auto parent = nodeAPI->getParent(node);
    if (it == ATTR_NAME_MAP.end()) {
        nodeAPI->removeAllChildren(parent);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", "CheckSwiperAttr failed, invalid attrType: %{public}d", (int32_t)type);
        return;
    }
    const auto& name = it->second;
    const auto* attribute = nodeAPI->getAttribute(node, type);
    if (!attribute) {
        nodeAPI->removeAllChildren(parent);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", "CheckSwiperAttr failed, failed to get attr[%{public}s]", name.c_str());
        return;
    }
    
    if (testObj) {
        if (compareFunc != nullptr) {
           if (!compareFunc(attribute->object, expectAttr->object)) {
                nodeAPI->removeAllChildren(parent);
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", "CheckSwiperAttr failed, has compare func, attr[%{public}s] object mismatch expect:%{public}p, real:%{public}p",
                    name.c_str(), expectAttr->object, attribute->object);
                return;
            }
        } else {
            if (attribute->object != expectAttr->object) {
                nodeAPI->removeAllChildren(parent);
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", "CheckSwiperAttr failed, attr[%{public}s] object mismatch expect:%{public}p, real:%{public}p",
                    name.c_str(), expectAttr->object, attribute->object);
                return;
            }
        }
    } else {
        for (int32_t i = 0; i < attribute->size && i < expectAttr->size; ++i) {
            int32_t value_i32 = (int32_t)(expectAttr->value[i].i32);
            if (value_i32 < PARAM_1000) {
                if (attribute->value[i].i32 != expectAttr->value[i].i32) {
                    nodeAPI->removeAllChildren(parent);
                    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", "CheckVisualAttr failed, attr[%{public}s] value[%{public}d] mismatch expect:%{public}d, real:%{public}d",
                        name.c_str(), i, expectAttr->value[i].i32, attribute->value[i].i32);
                }
            }
        }
    }
    
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperTest", "CheckSwiperAttr attr[%{public}s] test pass", name.c_str());
}

// 校验属性
static void CheckSwiperAttrForMainThread(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle node, ArkUI_NodeAttributeType type, const ArkUI_AttributeItem* expectAttr,
    bool testObj = false, std::function<bool(const void* realObj, const void* expectObj)> compareFunc = nullptr) {

    const auto* attribute = nodeAPI->getAttribute(node, type);
    const auto parent = nodeAPI->getParent(node);
    auto it = ATTR_NAME_MAP.find(type);
    if (it == ATTR_NAME_MAP.end()) {
        nodeAPI->removeAllChildren(parent);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", "CheckSwiperAttr failed, invalid attrType: %{public}d", (int32_t)type);
        return;
    }
    const auto& name = it->second;
    if (!attribute) {
        nodeAPI->removeAllChildren(parent);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", "CheckSwiperAttr failed, failed to get attr[%{public}s]", name.c_str());
        return;
    }
    if (testObj) {
        if (compareFunc != nullptr) {
            if (!compareFunc(attribute->object, expectAttr->object)) {
                nodeAPI->removeAllChildren(parent);
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", "CheckSwiperAttrForMainThread failed has compare func, attr[%{public}s] object mismatch expect:%{public}p, real:%{public}p",
                    name.c_str(), expectAttr->object, attribute->object);
                return;
            }
        } else {
            if (attribute->object != expectAttr->object) {
                nodeAPI->removeAllChildren(parent);
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", "CheckSwiperAttrForMainThread failed, attr[%{public}s] object mismatch expect:%{public}p, real:%{public}p",
                    name.c_str(), expectAttr->object, attribute->object);
                return;
            }
        }
    } else {
        for (int32_t i = 0; i < attribute->size && i < expectAttr->size; ++i) {
            int32_t value_i32 = (int32_t)(expectAttr->value[i].i32);
            if (value_i32 < PARAM_1000) {
                if (attribute->value[i].i32 != expectAttr->value[i].i32) {
                    nodeAPI->removeAllChildren(parent);
                    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", "CheckVisualAttrForMainThread failed, attr[%{public}s] value[%{public}d] mismatch expect:%{public}d, real:%{public}d",
                        name.c_str(), i, value_i32, attribute->value[i].i32);
                }
            }
        }
    }
    
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperTest", "CheckSwiperAttrForMainThread attr[%{public}s] test pass", name.c_str());
}

static void CheckAttributeOnMainThread(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle item, bool withReset)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " CheckAttributeOnMainThread 1");

    // Swiper组件属性--loop （是否开启循环）
    
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " CheckAttributeOnMainThread 3");
    if (withReset) {
        ArkUI_NumberValue loop_value[] = { { .i32 = true } };
        ArkUI_AttributeItem loop_item = { loop_value, sizeof(loop_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_LOOP, &loop_item);
    } else {
        ArkUI_NumberValue loop_value[] = { { .i32 = false } };
        ArkUI_AttributeItem loop_item = { loop_value, sizeof(loop_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_LOOP, &loop_item);
    }

    // Swiper组件属性--autoPlay （子组件是否自动播放）
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " CheckAttributeOnMainThread 4");
    if (withReset) {
        ArkUI_NumberValue expectAutoPlayValue[] = { { .i32 = false }, { .i32 = true } };
        ArkUI_AttributeItem expecteAutoPlayItem = { expectAutoPlayValue, 2 };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_AUTO_PLAY, &expecteAutoPlayItem);
    } else {
        ArkUI_NumberValue expectAutoPlayValue[] = { { .i32 = true }, { .i32 = true } };
        ArkUI_AttributeItem expecteAutoPlayItem = { expectAutoPlayValue, 2 };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_AUTO_PLAY, &expecteAutoPlayItem);
    }

    // Swiper组件属性--showIndicator (是否开启导航点指示器)
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " CheckAttributeOnMainThread 5");
    if (withReset) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " CheckAttributeOnMainThread 5-0");
        ArkUI_NumberValue showIndicator_value[] = { { .i32 = 1 } };
        ArkUI_AttributeItem showIndicator_item = { showIndicator_value,
                                               sizeof(showIndicator_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_SHOW_INDICATOR, &showIndicator_item);
    } else {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " CheckAttributeOnMainThread 5-1");
        ArkUI_NumberValue showIndicator_value[] = { { .i32 = 1 } };
        ArkUI_AttributeItem showIndicator_item = { showIndicator_value,
                                               sizeof(showIndicator_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_SHOW_INDICATOR, &showIndicator_item);
    }

    // Swiper组件属性--interval （设置使用自动播放时播放的时间间隔）
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " CheckAttributeOnMainThread 6");
    if (withReset) {
        ArkUI_NumberValue interval_value[] = { 3000 };
        ArkUI_AttributeItem interval_item = { interval_value, sizeof(interval_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_INTERVAL, &interval_item);
    } else {
        ArkUI_NumberValue interval_value[] = { 2000 };
        ArkUI_AttributeItem interval_item = { interval_value, sizeof(interval_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_INTERVAL, &interval_item);
    }

    // Swiper组件属性--vertical （设置是否为纵向滑动）
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " CheckAttributeOnMainThread 7");
    if (withReset) {
        ArkUI_NumberValue vertical_value[] = { { .i32 = 0 } };
        ArkUI_AttributeItem vertical_item = { vertical_value, sizeof(vertical_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_VERTICAL, &vertical_item);
    } else {
        ArkUI_NumberValue vertical_value[] = { { .i32 = 1 } };
        ArkUI_AttributeItem vertical_item = { vertical_value, sizeof(vertical_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_VERTICAL, &vertical_item);
    }

    // Swiper组件属性--duration （子组件切换的动画时长）
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " CheckAttributeOnMainThread 8");
    if (withReset) {
        ArkUI_NumberValue duration_value[] = { 400 };
        ArkUI_AttributeItem duration_item = { duration_value, sizeof(duration_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_DURATION, &duration_item);
    } else {
        ArkUI_NumberValue duration_value[] = { 700 };
        ArkUI_AttributeItem duration_item = { duration_value, sizeof(duration_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_DURATION, &duration_item);
    }

    // Swiper组件属性--curve （动画曲线）
    
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " CheckAttributeOnMainThread 9");
    if (withReset) {
        ArkUI_NumberValue curve_value[] = { { .i32 = ARKUI_CURVE_LINEAR } };
        ArkUI_AttributeItem curve_item = { curve_value, sizeof(curve_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_CURVE, &curve_item);
    } else {
        ArkUI_NumberValue curve_value[] = { { .i32 = ARKUI_CURVE_EASE } };
        ArkUI_AttributeItem curve_item = { curve_value, sizeof(curve_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_CURVE, &curve_item);
    }

    // Swiper组件属性--itemSpace （子组件间的间隙）
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " CheckAttributeOnMainThread 10");
    if (withReset) {
        ArkUI_NumberValue expect_itemSpace_value[] = { 0 };
        ArkUI_AttributeItem expect_itemSpace_item = { expect_itemSpace_value, sizeof(expect_itemSpace_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_ITEM_SPACE, &expect_itemSpace_item);
    } else {
        ArkUI_NumberValue itemSpace_value[] = { 5 };
        ArkUI_AttributeItem itemSpace_item = { itemSpace_value, sizeof(itemSpace_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_ITEM_SPACE, &itemSpace_item);
    }

    // Swiper组件属性--index （设置当前在容器中显示的子组件的索引值）
    if (withReset) {
        ArkUI_NumberValue expect_index_value[] = { { .i32 = 0 } };
        ArkUI_AttributeItem expect_index_item = { expect_index_value, sizeof(expect_index_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_INDEX, &expect_index_item);
    } else {
        ArkUI_NumberValue index_value[] = { { .i32 = 1 } };
        ArkUI_AttributeItem index_item = { index_value, sizeof(index_value) / sizeof(ArkUI_NumberValue) };
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " CheckAttributeOnMainThread 11");
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_INDEX, &index_item);
    }

    // Swiper组件属性--displayCount （视窗内显示的子元素个数）
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " CheckAttributeOnMainThread 12");
    if (withReset) {
        ArkUI_NumberValue expectDisplayCountValue[] = { { .i32 = 1 }, { .i32 = 0 } };
        ArkUI_AttributeItem expectDisplayCount_item = { expectDisplayCountValue, 2 };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_DISPLAY_COUNT, &expectDisplayCount_item);
    } else {
        ArkUI_NumberValue expectDisplayCountValue[] = { { .i32 = 2 }, { .i32 = 1 } };
        ArkUI_AttributeItem expectDisplayCount_item = { expectDisplayCountValue, 2 };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_DISPLAY_COUNT, &expectDisplayCount_item);
    }

    // Swiper组件属性--disableSwipe （是否禁用组件滑动切换动能）
    
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " CheckAttributeOnMainThread 13");
    if (withReset) {
        ArkUI_NumberValue disableSwipe_value[] = { { .i32 = false } };
        ArkUI_AttributeItem disableSwipe_item = { disableSwipe_value,
                                              sizeof(disableSwipe_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_DISABLE_SWIPE, &disableSwipe_item);
    } else {
        ArkUI_NumberValue disableSwipe_value[] = { { .i32 = true } };
        ArkUI_AttributeItem disableSwipe_item = { disableSwipe_value,
                                              sizeof(disableSwipe_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_DISABLE_SWIPE, &disableSwipe_item);
    }

    // Swiper组件属性--showDisplayArrow （设置导航点箭头样式）
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " CheckAttributeOnMainThread 14");
    if (withReset) {
        ArkUI_NumberValue showDisplayArrow_value[] = { { .i32 = ARKUI_SWIPER_ARROW_HIDE } };
        ArkUI_AttributeItem showDisplayArrow_item = { showDisplayArrow_value,
                                                  sizeof(showDisplayArrow_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_SHOW_DISPLAY_ARROW, &showDisplayArrow_item);
    } else {
        ArkUI_NumberValue showDisplayArrow_value[] = { { .i32 = ARKUI_SWIPER_ARROW_SHOW } };
        ArkUI_AttributeItem showDisplayArrow_item = { showDisplayArrow_value,
                                                  sizeof(showDisplayArrow_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_SHOW_DISPLAY_ARROW, &showDisplayArrow_item);
    }

    // Swiper组件属性--effectMode （边缘滑动效果）
    
    if (withReset) {
        ArkUI_NumberValue effectMode_value[] = { { .i32 = ARKUI_EDGE_EFFECT_SPRING } };
        ArkUI_AttributeItem effectMode_item = { effectMode_value, sizeof(effectMode_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_EDGE_EFFECT_MODE, &effectMode_item);
    } else {
        ArkUI_NumberValue effectMode_value[] = { { .i32 = ARKUI_EDGE_EFFECT_FADE } };
        ArkUI_AttributeItem effectMode_item = { effectMode_value, sizeof(effectMode_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_EDGE_EFFECT_MODE, &effectMode_item);
    }

    // Swiper组件属性--NodeAdapter

    // Swiper组件属性--cachedCount （预加载子组件个数）
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " CheckAttributeOnMainThread 16");
    if (withReset) {
        ArkUI_NumberValue cachedCount_value[] = { { .i32 = 1 } };
        ArkUI_AttributeItem cachedCount_item = { cachedCount_value, sizeof(cachedCount_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_CACHED_COUNT, &cachedCount_item);
    } else {
        ArkUI_NumberValue cachedCount_value[] = { { .i32 = 2 } };
        ArkUI_AttributeItem cachedCount_item = { cachedCount_value, sizeof(cachedCount_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_CACHED_COUNT, &cachedCount_item);
    }

    // Swiper组件属性--prevMargin （设置前边距）
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " CheckAttributeOnMainThread 17");
    if (withReset) {
        ArkUI_NumberValue prevMargin_value[] = { { .f32 = 0.0 }, { .i32 = 0 } };
        ArkUI_AttributeItem prevMargin_item = { prevMargin_value, sizeof(prevMargin_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_PREV_MARGIN, &prevMargin_item);
    } else {
        ArkUI_NumberValue prevMargin_value[] = { { .f32 = 1.0 }, { .i32 = 0 } };
        ArkUI_AttributeItem prevMargin_item = { prevMargin_value, sizeof(prevMargin_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_PREV_MARGIN, &prevMargin_item);
    }

    // Swiper组件属性--nextMargin （设置后边距）
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " CheckAttributeOnMainThread 18");
    if (withReset) {
        ArkUI_NumberValue nextMargin_value[] = { { .f32 = 0.0 }, { .i32 = 0 } };
        ArkUI_AttributeItem nextMargin_item = { nextMargin_value, sizeof(nextMargin_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_NEXT_MARGIN, &nextMargin_item);
    } else {
        ArkUI_NumberValue nextMargin_value[] = { { .f32 = 1.0 }, { .i32 = 0 } };
        ArkUI_AttributeItem nextMargin_item = { nextMargin_value, sizeof(nextMargin_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_NEXT_MARGIN, &nextMargin_item);
    }

    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " CheckAttributeOnMainThread 19");
    if (!withReset) {
        ArkUI_NumberValue value[] = { 0 };
        ArkUI_AttributeItem expect_item_1 = { value, 1 };
        expect_item_1.object = nullptr;
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " CheckAttributeOnMainThread 19-0");
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_INDICATOR, &expect_item_1, true, [](const void* realObj, const void* expectObj) -> bool {
            return realObj != nullptr;
        });
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " CheckAttributeOnMainThread 19-1");
    }

    // Swiper组件属性--nestedScroll （设置swiper和父组件的嵌套滚动模式）
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " CheckAttributeOnMainThread 42");
    if (withReset) {
        ArkUI_NumberValue nestedScroll_value[] = { { .i32 = ARKUI_SWIPER_NESTED_SRCOLL_SELF_ONLY } };
        ArkUI_AttributeItem nestedScroll_item = { nestedScroll_value,
                                                sizeof(nestedScroll_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_NESTED_SCROLL, &nestedScroll_item);
    } else {
        ArkUI_NumberValue nestedScroll_value[] = { { .i32 = ARKUI_SWIPER_NESTED_SRCOLL_SELF_FIRST } };
        ArkUI_AttributeItem nestedScroll_item = { nestedScroll_value,
                                                sizeof(nestedScroll_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_NESTED_SCROLL, &nestedScroll_item);
    }

    // Swiper组件属性--indicatorInteractive （设置导航点是否可交互）
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " CheckAttributeOnMainThread 44");
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_SWIPER_INDICATOR_INTERACTIVE);
        // 默认可交互
        ArkUI_NumberValue expect_indicatorInteractive_value[] = { { .i32 = true } };
        ArkUI_AttributeItem expect_indicatorInteractive_item = { expect_indicatorInteractive_value,
                                                      sizeof(expect_indicatorInteractive_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_INDICATOR_INTERACTIVE, &expect_indicatorInteractive_item);
    } else {
        ArkUI_NumberValue indicatorInteractive_value[] = { { .i32 = false } };
        ArkUI_AttributeItem indicatorInteractive_item = { indicatorInteractive_value,
                                                        sizeof(indicatorInteractive_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_INDICATOR_INTERACTIVE, &indicatorInteractive_item);
    }

    // Swiper组件属性--pageFlipMode （设置鼠标滚轮翻页模式）
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " CheckAttributeOnMainThread 45");
    if (withReset) {
        ArkUI_NumberValue expect_pageFlipModeValue[] = { { .i32 = ARKUI_PAGE_FLIP_MODE_CONTINUOUS } };
        ArkUI_AttributeItem expect_pageFlipModeValue_item = { expect_pageFlipModeValue,
                                                      sizeof(expect_pageFlipModeValue) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_PAGE_FLIP_MODE, &expect_pageFlipModeValue_item);
    } else {
        ArkUI_NumberValue pageFlipModeValue[] = { { .i32 = ARKUI_PAGE_FLIP_MODE_SINGLE } };
        ArkUI_AttributeItem pageFlipModeValueItem = { pageFlipModeValue,
                                                  sizeof(pageFlipModeValue) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_PAGE_FLIP_MODE, &pageFlipModeValueItem);
    }

    // Swiper组件属性--autoFill （设置swiper一页内元素显示个数根据元素最小宽度自适应） 该属性收到别的属性影响，先屏蔽

    // Swiper组件属性--设置 swiper 显示区域外插入或者删除数据是否保持可见内容位置不变
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " CheckAttributeOnMainThread 47");
    if (withReset) {
        // 默认值是 0
        ArkUI_NumberValue contentPositionValue[] = { { .i32 = 0 } };
        ArkUI_AttributeItem contentPositionValueItem = { contentPositionValue,
                                                      sizeof(contentPositionValue) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_MAINTAIN_VISIBLE_CONTENT_POSITION, &contentPositionValueItem);
    } else {
        ArkUI_NumberValue contentPositionValue[] = { { .i32 = 1 } };
        ArkUI_AttributeItem contentPositionValueItem = { contentPositionValue,
                                                  sizeof(contentPositionValue) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWIPER_MAINTAIN_VISIBLE_CONTENT_POSITION, &contentPositionValueItem);
    }

    // Swiper组件属性--设置响应式列数布局策略，影响别的属性，先屏蔽。
    
    // 视效属性 NODE_TRANSLATE
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NODE_TRANSLATE", " CheckAttributeOnMainThread 45");
    if (withReset) {
        ArkUI_NumberValue column_translate_value[] = { { .f32 = 0.0f }, { .f32 =  0.0f }, { .f32 =  0.0f } };
        ArkUI_AttributeItem column_translate_item = { column_translate_value,
                                                       sizeof(column_translate_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_TRANSLATE, &column_translate_item);
    } else {
        ArkUI_NumberValue column_translate_value[] = { { .f32 = 1.0f }, { .f32 = 1.0f }, { .f32 = 1.0f } };
        ArkUI_AttributeItem column_translate_item = { column_translate_value,
                                                       sizeof(column_translate_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_TRANSLATE, &column_translate_item);
    }
    
    // 视效属性 NODE_SCALE
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NODE_SCALE", " CheckAttributeOnMainThread 46");
    if (withReset) {
        ArkUI_NumberValue column_translate_value[] =  { { .f32 = 1.0f }, { .f32 = 1.0f } };
        ArkUI_AttributeItem column_translate_item = { column_translate_value,
                                                       sizeof(column_translate_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SCALE, &column_translate_item);
    } else {
        ArkUI_NumberValue column_translate_value[] = { { .f32 = 2 }, { .f32 = 2 }};
        ArkUI_AttributeItem column_translate_item = { column_translate_value,
                                                       sizeof(column_translate_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SCALE, &column_translate_item);
    }
    
    // 视效属性 NODE_SCALE
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NODE_ROTATE", " CheckAttributeOnMainThread 48");
    if (withReset) {
        ArkUI_NumberValue column_rotate_value[] = { { .f32 = 0.0f }, { .f32 = 0.0f }, { .f32 = 0.0f }, { .f32 = 0.0f }, { .f32 = 0.0f } };
        ArkUI_AttributeItem column_rotate_item = { column_rotate_value,
                                                       sizeof(column_rotate_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_ROTATE, &column_rotate_item);
    } else {
        ArkUI_NumberValue column_rotate_value[] = { { .f32 = 1.0f }, { .f32 = 1.0f }, { .f32 = 1.0f }, { .f32 = 1.0f }, { .f32 = 1.0f } };
        ArkUI_AttributeItem column_rotate_item = { column_rotate_value,
                                                       sizeof(column_rotate_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_ROTATE, &column_rotate_item);
    }
    
    // 视效属性  NODE_BRIGHTNESS
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, " NODE_BRIGHTNESS", " CheckAttributeOnMainThread 49");
    if (withReset) {
        ArkUI_NumberValue column_brightness_value[] = { { .f32 = 1.0f } };
        ArkUI_AttributeItem column_brightness_item = { column_brightness_value,
                                                       sizeof(column_brightness_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item,  NODE_BRIGHTNESS, &column_brightness_item);
    } else {
        ArkUI_NumberValue column_brightness_value[] = { { .f32 = 2 } };
        ArkUI_AttributeItem column_brightness_item = { column_brightness_value,
                                                       sizeof(column_brightness_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item,  NODE_BRIGHTNESS, &column_brightness_item);
    }
    
     // 视效属性  NODE_SATURATION
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, " NODE_SATURATION", " CheckAttributeOnMainThread 49");
    if (withReset) {
        ArkUI_NumberValue column_saturation_value[] = { { .f32 = 1.0f } };
        ArkUI_AttributeItem column_saturation_item = { column_saturation_value,
                                               sizeof(column_saturation_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item,  NODE_SATURATION, &column_saturation_item);
    } else {
        ArkUI_NumberValue column_saturation_value[] = { { .f32 = 2 } };
        ArkUI_AttributeItem column_saturation_item = { column_saturation_value,
                                               sizeof(column_saturation_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item,  NODE_SATURATION, &column_saturation_item);
    }

    // 视效属性  NODE_BLUR
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, " NODE_BLUR", " CheckAttributeOnMainThread 50");
    if (withReset) {
        ArkUI_NumberValue column_blur_value[] = { { .f32 = 0.0f } };
        ArkUI_AttributeItem column_blur_item = { column_blur_value,
                                                       sizeof(column_blur_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item,  NODE_BLUR, &column_blur_item);
    } else {
        ArkUI_NumberValue column_blur_value[] = { { .f32 = 1.0 } };
        ArkUI_AttributeItem column_blur_item = { column_blur_value,
                                                       sizeof(column_blur_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item,  NODE_BLUR, &column_blur_item);
    }

    // 视效属性  NODE_OPACITY
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NODE_OPACITY", " CheckAttributeOnMainThread 51");
    if (withReset) {

    } else {
        ArkUI_NumberValue column_opacity_value[] = { { .f32 = 0.5 } };
        ArkUI_AttributeItem column_opacity_item = { column_opacity_value,
                                                       sizeof(column_opacity_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_OPACITY, &column_opacity_item);
    }

    // 视效属性  NODE_CLIP
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NODE_CLIP", " CheckAttributeOnMainThread 52");
    if (withReset) {
        ArkUI_NumberValue column_clip_value[] = { { .i32 = 0 } };
        ArkUI_AttributeItem column_clip_item = { column_clip_value,
                                                       sizeof(column_clip_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_CLIP, &column_clip_item);
    } else {
        ArkUI_NumberValue column_clip_value[] = { { .i32 = 1 } };
        ArkUI_AttributeItem column_clip_item = { column_clip_value,
                                                       sizeof(column_clip_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_CLIP, &column_clip_item);
    }

    // 视效属性  NODE_CLIP_SHAPE
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NODE_CLIP_SHAPE", " CheckAttributeOnMainThread 53");

    // 视效属性  NODE_TRANSFORM
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NODE_TRANSFORM", " CheckAttributeOnMainThread 53");

    // 视效属性  NODE_SHADOW
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NODE_SHADOW", " CheckAttributeOnMainThread 54");
    if (withReset) {
        ArkUI_NumberValue column_shadow_value[] = { { .i32 = 6 } };
        ArkUI_AttributeItem column_shadow_item = { column_shadow_value,
                                                       sizeof(column_shadow_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SHADOW, &column_shadow_item);
    } else {
        ArkUI_NumberValue column_shadow_value[] = { { .i32 = 1 } };
        ArkUI_AttributeItem column_shadow_item = { column_shadow_value,
                                                       sizeof(column_shadow_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SHADOW, &column_shadow_item);
    }

    // 视效属性  NODE_CUSTOM_SHADOW
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NODE_CUSTOM_SHADOW", " CheckAttributeOnMainThread 55");
    if (withReset) {
        ArkUI_NumberValue column_customShadow_value[] = { { .f32 = 0.0f }, { .i32 = 0 }, { .f32 = 0.0f }, { .f32 = 0.0f },
                                                          { .i32 = 0 }, { .u32 = 0 }, { .u32 = 0 } };
        ArkUI_AttributeItem column_customShadow_item = { column_customShadow_value,
                                                       sizeof(column_customShadow_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_CUSTOM_SHADOW, &column_customShadow_item);
    } else {
        ArkUI_NumberValue column_customShadow_value[] = { { .f32 = 1.0 }, { .i32 = 1 }, { .f32 = 1.0 }, { .f32 = 1.0 },
                                                          { .i32 = 1 }, { .u32 = 1 }, { .u32 = 1 } };
        ArkUI_AttributeItem column_customShadow_item = { column_customShadow_value,
                                                       sizeof(column_customShadow_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_CUSTOM_SHADOW, &column_customShadow_item);
    }

    // 视效属性  NODE_TRANSFORM_CENTER
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NODE_TRANSFORM_CENTER", " CheckAttributeOnMainThread 55");
    if (withReset) {
        ArkUI_NumberValue column_transformCenter_value[] = { { .f32 = 0.0f }, { .f32 = 0.0f }, { .f32 = 0.0f },
                                                             { .f32 = 0.5f }, { .f32 = 0.5f }, { .f32 = 0.5f } };
        ArkUI_AttributeItem column_transformCenter_item = { column_transformCenter_value,
                                                       sizeof(column_transformCenter_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_TRANSFORM_CENTER, &column_transformCenter_item);
    } else {
        ArkUI_NumberValue column_transformCenter_value[] = { { .f32 = 1.0 }, { .f32 = 1.0 }, { .f32 = 1.0 },
                                                             { .f32 = 1.0 }, { .f32 = 1.0 }, { .f32 = 1.0 } };
        ArkUI_AttributeItem column_transformCenter_item = { column_transformCenter_value,
                                                       sizeof(column_transformCenter_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_TRANSFORM_CENTER, &column_transformCenter_item);
    }

    // 视效属性  NODE_OPACITY_TRANSITION
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NODE_OPACITY_TRANSITION", " CheckAttributeOnMainThread 56");
    ArkUI_NumberValue column_opacityTransition_value[] = { { .f32 = 1.0 }, { .f32 = 1.0 }, { .f32 = 1.0 }, { .f32 = 1.0 },
                                                           { .f32 = 1.0 }, { .f32 = 1.0 }, { .f32 = 1.0 } };
    ArkUI_AttributeItem column_opacityTransition_item = { column_opacityTransition_value,
                                                   sizeof(column_opacityTransition_value) / sizeof(ArkUI_NumberValue) };
    CheckSwiperAttrForMainThread(nodeAPI, item, NODE_OPACITY_TRANSITION, &column_opacityTransition_item);

    
    // 视效属性  NODE_ROTATE_TRANSITION
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NODE_ROTATE_TRANSITION", " CheckAttributeOnMainThread 57");
    if (withReset) {
        ArkUI_NumberValue column_rotateTransition_value[] = { { .f32 = 0.0f }, { .f32 = 0.0f }, { .f32 = 0.0f }, { .f32 = 0.0f }, { .f32 = 0.0f }, 
                                                              { .i32 = 1000 }, { .i32 = 0}, { .i32 = 0 }, { .i32 = 1 }, { .i32 = 0 }, 
                                                              { .f32 = 1.0f } };
        ArkUI_AttributeItem column_rotateTransition_item = { column_rotateTransition_value,
                                                       sizeof(column_rotateTransition_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_ROTATE_TRANSITION, &column_rotateTransition_item);
    } else {
        ArkUI_NumberValue column_rotateTransition_value[] = { { .f32 = 1.0 }, { .f32 = 1.0 }, { .f32 = 1.0 }, { .f32 = 1.0 }, { .f32 = 1.0 }, 
                                                              { .i32 = 1 }, { .i32 = 1 }, { .i32 = 1 }, { .i32 = 1 }, { .i32 = 1 }, 
                                                              { .f32 = 1.0 } };
        ArkUI_AttributeItem column_rotateTransition_item = { column_rotateTransition_value,
                                                       sizeof(column_rotateTransition_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_ROTATE_TRANSITION, &column_rotateTransition_item);
    }

    // 视效属性  NODE_SCALE_TRANSITION
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NODE_SCALE_TRANSITION", " CheckAttributeOnMainThread 58");
    if (withReset) {
        ArkUI_NumberValue column_scaleTransition_value[] = { { .f32 = 1.0f }, { .f32 = 1.0f }, { .f32 = 1.0f },
                                                             { .i32 = 1000 }, { .i32 = ARKUI_CURVE_LINEAR }, { .i32 = 0 }, 
                                                             { .i32 = 1 }, { .i32 = ARKUI_ANIMATION_PLAY_MODE_NORMAL }};
        ArkUI_AttributeItem column_scaleTransition_item = { column_scaleTransition_value,
                                                       sizeof(column_scaleTransition_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SCALE_TRANSITION, &column_scaleTransition_item);
    } else {
        ArkUI_NumberValue column_scaleTransition_value[] = { { .f32 = 1.0 }, { .f32 = 1.0 }, { .f32 = 1.0 },
                                                             { .i32 = 1 }, { .i32 = 1 }, { .i32 = 1 }, 
                                                             { .i32 = 1 }, { .i32 = 1 } };
        ArkUI_AttributeItem column_scaleTransition_item = { column_scaleTransition_value,
                                                       sizeof(column_scaleTransition_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SCALE_TRANSITION, &column_scaleTransition_item);
    }


    // 视效属性  NODE_TRANSLATE_TRANSITION
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NODE_TRANSLATE_TRANSITION", " CheckAttributeOnMainThread 59");
    if (withReset) {
        ArkUI_NumberValue column_translateTransition_value[] = { { .f32 = 0.0f }, { .f32 = 0.0f }, { .f32 = 0.0f },
                                                             { .i32 = 0 }, { .i32 = ARKUI_CURVE_LINEAR }, { .i32 = 0 }, 
                                                             { .i32 = 0 }, { .f32 = ARKUI_ANIMATION_PLAY_MODE_NORMAL }, { .f32 = 0.0f } };
        ArkUI_AttributeItem column_translateTransition_item = { column_translateTransition_value,
                                                       sizeof(column_translateTransition_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_TRANSLATE_TRANSITION, &column_translateTransition_item);
    } else {
        ArkUI_NumberValue column_translateTransition_value[] = { { .f32 = 1.0 }, { .f32 = 1.0 }, { .f32 = 1.0 },
                                                             { .i32 = 1 }, { .i32 = 1 }, { .i32 = 1 }, 
                                                             { .i32 = 1 }, { .f32 = 1.0 }, { .f32 = 1.0 } };
        ArkUI_AttributeItem column_translateTransition_item = { column_translateTransition_value,
                                                       sizeof(column_translateTransition_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_TRANSLATE_TRANSITION, &column_translateTransition_item);
    }

    // 视效属性  NODE_MOVE_TRANSITION

    // 视效属性  NODE_SWEEP_GRADIENT
    if (withReset) {
        ArkUI_NumberValue column_sweepGradient_value[] = {  { .f32 = 1.0 }, { .f32 = 1.0 }, { .f32 = 1.0 },
                                                             { .f32 = 1.0 }, { .f32 = 1.0 } };
        ArkUI_AttributeItem column_sweepGradient_item = { column_sweepGradient_value,
                                                       sizeof(column_sweepGradient_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWEEP_GRADIENT, &column_sweepGradient_item);
    } else {
        ArkUI_NumberValue column_sweepGradient_value[] = {  { .f32 = 1.0 }, { .f32 = 1.0 }, { .f32 = 1.0 },
                                                             { .f32 = 1.0 }, { .f32 = 1.0 } };
        ArkUI_AttributeItem column_sweepGradient_item = { column_sweepGradient_value,
                                                       sizeof(column_sweepGradient_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SWEEP_GRADIENT, &column_sweepGradient_item);
    }

    // 视效属性  NODE_RADIAL_GRADIENT

    if (withReset) {
        ArkUI_NumberValue column_radialGradient_value[] = { { .f32 = 0.0f }, { .f32 =  0.0f}, { .f32 = 0.0f }, { .i32 = 0 } };
        ArkUI_AttributeItem column_radialGradient_item = { column_radialGradient_value,
                                                        sizeof(column_radialGradient_value) / sizeof(ArkUI_NumberValue) };
    CheckSwiperAttrForMainThread(nodeAPI, item, NODE_RADIAL_GRADIENT, &column_radialGradient_item);
    } else {
        ArkUI_NumberValue column_radialGradient_value[] = { { .f32 = 1.0 }, { .f32 = 1.0 }, { .f32 = 1.0 }, { .i32 = 1 } };
        ArkUI_AttributeItem column_radialGradient_item = { column_radialGradient_value,
                                                       sizeof(column_radialGradient_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_RADIAL_GRADIENT, &column_radialGradient_item);
    }

    // 视效属性  NODE_MASK

    // 视效属性  NODE_BLEND_MODE
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NODE_BLEND_MODE", " CheckAttributeOnMainThread 60");
    if (withReset) {
        ArkUI_NumberValue column_blend_value[] = { { .i32 = ARKUI_BLEND_MODE_NONE }, { .i32 = BLEND_APPLY_TYPE_FAST } };
        ArkUI_AttributeItem column_blend_item = { column_blend_value,
                                                       sizeof(column_blend_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_BLEND_MODE, &column_blend_item);
    } else {
        ArkUI_NumberValue column_blend_value[] = { { .i32 = ARKUI_BLEND_MODE_NONE }, { .i32 = BLEND_APPLY_TYPE_FAST } };
        ArkUI_AttributeItem column_blend_item = { column_blend_value,
                                                       sizeof(column_blend_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_BLEND_MODE, &column_blend_item);
    }

    // 视效属性  NODE_GRAY_SCALE
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NODE_GRAY_SCALE", " CheckAttributeOnMainThread 61");
    if (withReset) {
        ArkUI_NumberValue column_grayScale_value[] = { { .f32 = 0.5f } };
        ArkUI_AttributeItem column_grayScale_item = { column_grayScale_value,
                                                       sizeof(column_grayScale_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_GRAY_SCALE, &column_grayScale_item);
    } else {
        ArkUI_NumberValue column_grayScale_value[] = { { .f32 = 1.0 } };
        ArkUI_AttributeItem column_grayScale_item = { column_grayScale_value,
                                                       sizeof(column_grayScale_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_GRAY_SCALE, &column_grayScale_item);
    }

    // 视效属性  NODE_INVERT
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NODE_INVERT", " CheckAttributeOnMainThread 62");
    if (withReset) {
        ArkUI_NumberValue column_invert_value[] = { { .f32 = 0.5f } };
        ArkUI_AttributeItem column_invert_item = { column_invert_value,
                                                       sizeof(column_invert_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_INVERT, &column_invert_item);
    } else {
        ArkUI_NumberValue column_invert_value[] = { { .f32 = 1.0 } };
        ArkUI_AttributeItem column_invert_item = { column_invert_value,
                                                       sizeof(column_invert_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_INVERT, &column_invert_item);
    }

    // 视效属性  NODE_SEPIA
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NODE_SEPIA", " CheckAttributeOnMainThread 63");
    if (withReset) {
        ArkUI_NumberValue column_sepia_value[] = { { .f32 = 0.5f } };
        ArkUI_AttributeItem column_sepia_item = { column_sepia_value,
                                                       sizeof(column_sepia_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SEPIA, &column_sepia_item);
    } else {
        ArkUI_NumberValue column_sepia_value[] = { { .f32 = 1.0 } };
        ArkUI_AttributeItem column_sepia_item = { column_sepia_value,
                                                       sizeof(column_sepia_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_SEPIA, &column_sepia_item);
    }

    // 视效属性  NODE_CONTRAST
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NODE_CONTRAST", " CheckAttributeOnMainThread 64");
    if (withReset) {
        ArkUI_NumberValue column_contrast_value[] = { { .f32 = 1.0f } };
        ArkUI_AttributeItem column_contrast_item = { column_contrast_value,
                                                       sizeof(column_contrast_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_CONTRAST, &column_contrast_item);
    } else {
        ArkUI_NumberValue column_contrast_value[] = { { .f32 = 1.0 } };
        ArkUI_AttributeItem column_contrast_item = { column_contrast_value,
                                                       sizeof(column_contrast_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_CONTRAST, &column_contrast_item);
    }

    // 视效属性  NODE_FOREGROUND_COLOR
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NODE_FOREGROUND_COLOR", " CheckAttributeOnMainThread 65");
    ArkUI_NumberValue column_foregroundColor_value[] = { { .u32 = 0xffff0000 } };
    ArkUI_AttributeItem column_foregroundColor_item = { column_foregroundColor_value,
                                                   sizeof(column_foregroundColor_value) / sizeof(ArkUI_NumberValue) };
    CheckSwiperAttrForMainThread(nodeAPI, item, NODE_FOREGROUND_COLOR, &column_foregroundColor_item);

    // 视效属性  NODE_OUTLINE_WIDTH

    // 视效属性  NODE_RENDER_GROUP
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NODE_RENDER_GROUP", " CheckAttributeOnMainThread 66");
    if (withReset) {
        ArkUI_NumberValue column_geometryTransition_value[] = { { .i32 = 0 } };
        ArkUI_AttributeItem column_geometryTransition_item = { column_geometryTransition_value,
                                                       sizeof(column_geometryTransition_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_RENDER_GROUP, &column_geometryTransition_item);
    } else {
        ArkUI_NumberValue column_geometryTransition_value[] = { { .i32 = 0 } };
        ArkUI_AttributeItem column_geometryTransition_item = { column_geometryTransition_value,
                                                       sizeof(column_geometryTransition_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_RENDER_GROUP, &column_geometryTransition_item);
    }

    // 视效属性  NODE_RENDER_FIT
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NODE_RENDER_FIT", " CheckAttributeOnMainThread 67");
    if (withReset) {
        ArkUI_NumberValue column_renderFit_value[] = { { .i32 = 5 } };
        ArkUI_AttributeItem column_renderFit_item = { column_renderFit_value,
                                                       sizeof(column_renderFit_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_RENDER_FIT, &column_renderFit_item);
    } else {
        ArkUI_NumberValue column_renderFit_value[] = { { .i32 = 0 } };
        ArkUI_AttributeItem column_renderFit_item = { column_renderFit_value,
                                                       sizeof(column_renderFit_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_RENDER_FIT, &column_renderFit_item);
    }

    // 视效属性  NODE_OUTLINE_COLOR
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NODE_OUTLINE_COLOR", " CheckAttributeOnMainThread 68");
    if (withReset) {
        ArkUI_NumberValue column_outlineColor_value[] = { };
        ArkUI_AttributeItem column_outlineColor_item = { column_outlineColor_value,
                                                       sizeof(column_outlineColor_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_OUTLINE_COLOR, &column_outlineColor_item);
    } else {
        ArkUI_NumberValue column_outlineColor_value[] = { };
        ArkUI_AttributeItem column_outlineColor_item = { column_outlineColor_value,
                                                       sizeof(column_outlineColor_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_OUTLINE_COLOR, &column_outlineColor_item);
    }

    // 视效属性  NODE_RENDER_GROUP
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NODE_RENDER_GROUP", " CheckAttributeOnMainThread 69");
    if (withReset) {
        ArkUI_NumberValue column_outlineColor_value[] = { { .u32 = 0 }, { .u32 = 0 }, { .u32 = 0 }, { .u32 = 0 } };
        ArkUI_AttributeItem column_outlineColor_item = { column_outlineColor_value,
                                                       sizeof(column_outlineColor_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_RENDER_GROUP, &column_outlineColor_item);
    } else {
        ArkUI_NumberValue column_outlineColor_value[] = { { .u32 = 1 }, { .u32 = 1 }, { .u32 = 1 }, { .u32 = 1 } };
        ArkUI_AttributeItem column_outlineColor_item = { column_outlineColor_value,
                                                       sizeof(column_outlineColor_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_RENDER_GROUP, &column_outlineColor_item);
    }

    // 视效属性  NODE_COLOR_BLEND
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NODE_COLOR_BLEND", " CheckAttributeOnMainThread 70");
    if (withReset) {
        ArkUI_NumberValue column_colorBlend_value[] = { { .u32 = 0x00000000 } };
        ArkUI_AttributeItem column_colorBlend_item = { column_colorBlend_value,
                                                       sizeof(column_colorBlend_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_COLOR_BLEND, &column_colorBlend_item);
    } else {
        ArkUI_NumberValue column_colorBlend_value[] = { { .u32 = 0xffff0000 } };
        ArkUI_AttributeItem column_colorBlend_item = { column_colorBlend_value,
                                                       sizeof(column_colorBlend_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_COLOR_BLEND, &column_colorBlend_item);
    }

    // 视效属性  NODE_FOREGROUND_BLUR_STYLE

    // 视效属性  NODE_BACKDROP_BLUR
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NODE_BACKDROP_BLUR", " CheckAttributeOnMainThread 71");
    if (withReset) {
        ArkUI_NumberValue column_backdropBlur_value[] = { { .f32 = 0.0f } };
        ArkUI_AttributeItem column_backdropBlur_item = { column_backdropBlur_value,
                                                       sizeof(column_backdropBlur_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_BACKDROP_BLUR, &column_backdropBlur_item);
    } else {
        ArkUI_NumberValue column_backdropBlur_value[] = { { .f32 = 1.0f }, { .f32 = 1.0f }, { .f32 = 1.0f } };
        ArkUI_AttributeItem column_backdropBlur_item = { column_backdropBlur_value,
                                                       sizeof(column_backdropBlur_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_BACKDROP_BLUR, &column_backdropBlur_item);
    }

    // 视效属性  NODE_TRANSLATE_WITH_PERCENT

    // 视效属性  NODE_ROTATE_ANGLE
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NODE_ROTATE_ANGLE", " CheckAttributeOnMainThread 72");
    if (withReset) {
        ArkUI_NumberValue column_rotateAngle_value[] = { { .f32 = 0.0f }, { .f32 = 0.0f }, { .f32 = 0.0f }, { .f32 = 0.0f } };
        ArkUI_AttributeItem column_rotateAngle_item = { column_rotateAngle_value,
                                                       sizeof(column_rotateAngle_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_ROTATE_ANGLE, &column_rotateAngle_item);
    } else {
        ArkUI_NumberValue column_rotateAngle_value[] = { { .f32 = 1.0f }, { .f32 = 1.0f }, { .f32 = 1.0f }, { .f32 = 1.0f } };
        ArkUI_AttributeItem column_rotateAngle_item = { column_rotateAngle_value,
                                                       sizeof(column_rotateAngle_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttrForMainThread(nodeAPI, item, NODE_ROTATE_ANGLE, &column_rotateAngle_item);
    }
}

void OnCreateAsyncDone(void *asyncUITaskData) {
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_MULTI_THREAD_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    if (!nodeAPI) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", "get ArkUI_AsyncNativeNodeAPI_1 failed");
        return;
    }
    if (!asyncUITaskData) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", "invalid async UI task data");
        return;
    }
    auto* asyncData = static_cast<AsyncData *>(asyncUITaskData);
    auto& childList = asyncData->childList;
    auto parent = asyncData->parent;

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperTest", "OnCreateAsyncDone OK");
    for (const auto& node : childList) {
        int32_t ret1 = nodeAPI->addChild(parent, node);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperTest", "OnCreateAsyncDone ret:%{public}d withReset:%{public}d",
                        ret1, asyncData->withReset);
        CheckAttributeOnMainThread(nodeAPI, node, asyncData->withReset);
    }
    delete asyncUITaskData;
}

/*
NODE_SWIPER_EVENT_ON_CHANGE = MAX_NODE_SCOPE_NUM * ARKUI_NODE_SWIPER,
NODE_SWIPER_EVENT_ON_ANIMATION_START,
NODE_SWIPER_EVENT_ON_ANIMATION_END,
NODE_SWIPER_EVENT_ON_GESTURE_SWIPE,
NODE_SWIPER_EVENT_ON_CONTENT_DID_SCROLL,
NODE_SWIPER_EVENT_ON_CONTENT_WILL_SCROLL = 1001007,
NODE_SWIPER_EVENT_ON_SELECTED = 1001005,
NODE_SWIPER_EVENT_ON_UNSELECTED = 1001006,
NODE_SWIPER_EVENT_ON_SCROLL_STATE_CHANGED = 1001008,
NODE_ON_BLUR
*/
static void RegisterEvent(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle child, bool withReset)
{
    const char *tag = "EventTest_swiper";
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, tag, "RegisterEvent 1");
    //当前显示的子组件索引变化
    nodeAPI->registerNodeEvent(child, NODE_SWIPER_EVENT_ON_CHANGE, NODE_SWIPER_EVENT_ON_CHANGE, nullptr);
    //切换动画开始时
    nodeAPI->registerNodeEvent(child, NODE_SWIPER_EVENT_ON_ANIMATION_START, NODE_SWIPER_EVENT_ON_ANIMATION_START,
                               nullptr);
    //切换动画结束
    nodeAPI->registerNodeEvent(child, NODE_SWIPER_EVENT_ON_ANIMATION_END, NODE_SWIPER_EVENT_ON_ANIMATION_END, nullptr);
    //页面跟手滑动
    nodeAPI->registerNodeEvent(child, NODE_SWIPER_EVENT_ON_GESTURE_SWIPE, NODE_SWIPER_EVENT_ON_GESTURE_SWIPE, nullptr);
    //监听swiper滑动
    nodeAPI->registerNodeEvent(child, NODE_SWIPER_EVENT_ON_CONTENT_DID_SCROLL, NODE_SWIPER_EVENT_ON_CONTENT_DID_SCROLL,
                               nullptr);
    //页面滚动
    nodeAPI->registerNodeEvent(child, NODE_SWIPER_EVENT_ON_CONTENT_WILL_SCROLL,
                               NODE_SWIPER_EVENT_ON_CONTENT_WILL_SCROLL, nullptr);
    
    nodeAPI->registerNodeEvent(child, NODE_SWIPER_EVENT_ON_SELECTED,
                               NODE_SWIPER_EVENT_ON_SELECTED, nullptr);
    
    nodeAPI->registerNodeEvent(child, NODE_SWIPER_EVENT_ON_UNSELECTED,
                               NODE_SWIPER_EVENT_ON_UNSELECTED, nullptr);
    
    nodeAPI->registerNodeEvent(child, NODE_SWIPER_EVENT_ON_SCROLL_STATE_CHANGED,
                               NODE_SWIPER_EVENT_ON_SCROLL_STATE_CHANGED, nullptr);
    nodeAPI->registerNodeEvent(child, NODE_ON_BLUR,
                           NODE_ON_BLUR, nullptr);
    
    nodeAPI->addNodeEventReceiver(child, [](ArkUI_NodeEvent *event) {
        const char *commonTag = "EventTest_swiper common ";
        const char *swiperTag = "EventTest_swiper swiper ";
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, commonTag, "RegisterEvent 2");
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_SWIPER_EVENT_ON_CHANGE) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, swiperTag, "RegisterEvent 2 swiper NODE_SWIPER_EVENT_ON_CHANGE");
        }
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_SWIPER_EVENT_ON_ANIMATION_START) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, swiperTag, "RegisterEvent 2 swiper NODE_SWIPER_EVENT_ON_ANIMATION_START");
        }
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_SWIPER_EVENT_ON_ANIMATION_END) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, swiperTag, "RegisterEvent 2 swiper NODE_SWIPER_EVENT_ON_ANIMATION_END");
        }
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_SWIPER_EVENT_ON_GESTURE_SWIPE) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, swiperTag, "RegisterEvent 2 swiper NODE_SWIPER_EVENT_ON_GESTURE_SWIPE");
        }
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_SWIPER_EVENT_ON_CONTENT_DID_SCROLL) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, swiperTag, "RegisterEvent 2 swiper NODE_SWIPER_EVENT_ON_CONTENT_DID_SCROLL");
        }
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_SWIPER_EVENT_ON_CONTENT_WILL_SCROLL) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, swiperTag, "RegisterEvent 2 swiper NODE_SWIPER_EVENT_ON_CONTENT_WILL_SCROLL");
        }
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_SWIPER_EVENT_ON_SELECTED) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, swiperTag, "RegisterEvent 2 swiper NODE_SWIPER_EVENT_ON_SELECTED");
        }
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_SWIPER_EVENT_ON_UNSELECTED) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, swiperTag, "RegisterEvent 2 swiper NODE_SWIPER_EVENT_ON_UNSELECTED");
        }
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_SWIPER_EVENT_ON_SCROLL_STATE_CHANGED) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, swiperTag, "RegisterEvent 2 swiper NODE_SWIPER_EVENT_ON_SCROLL_STATE_CHANGED");
        }
        //视效
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == NODE_ON_BLUR) {
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, commonTag, "RegisterEvent 2 swiper NODE_ON_BLUR");
        }
    });
    
    if (withReset) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, tag, "RegisterEvent 3");
        nodeAPI->unregisterNodeEvent(child, NODE_SWIPER_EVENT_ON_CHANGE);
        nodeAPI->unregisterNodeEvent(child, NODE_SWIPER_EVENT_ON_ANIMATION_START);
        //切换动画结束
        nodeAPI->unregisterNodeEvent(child, NODE_SWIPER_EVENT_ON_ANIMATION_END);
        //页面跟手滑动
        nodeAPI->unregisterNodeEvent(child, NODE_SWIPER_EVENT_ON_GESTURE_SWIPE);
        //监听swiper滑动
        nodeAPI->unregisterNodeEvent(child, NODE_SWIPER_EVENT_ON_CONTENT_DID_SCROLL);
        //页面滚动
        nodeAPI->unregisterNodeEvent(child, NODE_SWIPER_EVENT_ON_CONTENT_WILL_SCROLL);
        nodeAPI->unregisterNodeEvent(child, NODE_SWIPER_EVENT_ON_SELECTED);
        nodeAPI->unregisterNodeEvent(child, NODE_SWIPER_EVENT_ON_UNSELECTED);
        nodeAPI->unregisterNodeEvent(child, NODE_SWIPER_EVENT_ON_SCROLL_STATE_CHANGED);
        //视效
        nodeAPI->unregisterNodeEvent(child, NODE_ON_BLUR);
    }
}

static void SetAttribute(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle item, bool withReset, bool isSync, int i)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " SetAttribute 1");
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " SetAttribute 2");
    
    // Swiper组件属性--loop （是否开启循环）
    ArkUI_NumberValue loop_value[] = { { .i32 = false } };
    ArkUI_AttributeItem loop_item = { loop_value, sizeof(loop_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_SWIPER_LOOP, &loop_item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " SetAttribute 3");
    CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_LOOP, &loop_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_SWIPER_LOOP);
        ArkUI_NumberValue loop_value[] = { { .i32 = true } };
        ArkUI_AttributeItem loop_item = { loop_value, sizeof(loop_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_LOOP, &loop_item);
    }

    // Swiper组件属性--autoPlay （子组件是否自动播放）
    ArkUI_NumberValue autoPlay_value[] = { { .i32 = true } };
    ArkUI_AttributeItem autoPlay_item = { autoPlay_value, sizeof(autoPlay_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_SWIPER_AUTO_PLAY, &autoPlay_item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " SetAttribute 4");
    ArkUI_NumberValue expectAutoPlayValue[] = { { .i32 = true }, { .i32 = true } };
    ArkUI_AttributeItem expecteAutoPlayItem = { expectAutoPlayValue, 2 };
    CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_AUTO_PLAY, &expecteAutoPlayItem);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_SWIPER_AUTO_PLAY);
        ArkUI_NumberValue expectAutoPlayValue[] = { { .i32 = false }, { .i32 = true } };
        ArkUI_AttributeItem expecteAutoPlayItem = { expectAutoPlayValue, 2 };
        CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_AUTO_PLAY, &expecteAutoPlayItem);
    }

    // Swiper组件属性--interval （设置使用自动播放时播放的时间间隔）
    ArkUI_NumberValue interval_value[] = { 2000 };
    ArkUI_AttributeItem interval_item = { interval_value, sizeof(interval_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_SWIPER_INTERVAL, &interval_item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " SetAttribute 6");
    CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_INTERVAL, &interval_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_SWIPER_INTERVAL);
        ArkUI_NumberValue interval_value[] = { 3000 };
        ArkUI_AttributeItem interval_item = { interval_value, sizeof(interval_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_INTERVAL, &interval_item);
    }

    // Swiper组件属性--vertical （设置是否为纵向滑动）
    ArkUI_NumberValue vertical_value[] = { { .i32 = 1 } };
    ArkUI_AttributeItem vertical_item = { vertical_value, sizeof(vertical_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_SWIPER_VERTICAL, &vertical_item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " SetAttribute 7");
    CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_VERTICAL, &vertical_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_SWIPER_VERTICAL);
        ArkUI_NumberValue vertical_value[] = { { .i32 = 0 } };
        ArkUI_AttributeItem vertical_item = { vertical_value, sizeof(vertical_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_VERTICAL, &vertical_item);
    }

    // Swiper组件属性--duration （子组件切换的动画时长）
    ArkUI_NumberValue duration_value[] = { 700 };
    ArkUI_AttributeItem duration_item = { duration_value, sizeof(duration_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_SWIPER_DURATION, &duration_item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " SetAttribute 8");
    CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_DURATION, &duration_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_SWIPER_DURATION);
        ArkUI_NumberValue duration_value[] = { 400 };
        ArkUI_AttributeItem duration_item = { duration_value, sizeof(duration_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_DURATION, &duration_item);
    }

    // Swiper组件属性--curve （动画曲线）
    ArkUI_NumberValue curve_value[] = { { .i32 = ARKUI_CURVE_EASE } };
    ArkUI_AttributeItem curve_item = { curve_value, sizeof(curve_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_SWIPER_CURVE, &curve_item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " SetAttribute 9");
    CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_CURVE, &curve_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_SWIPER_CURVE);
        ArkUI_NumberValue curve_value[] = { { .i32 = ARKUI_CURVE_LINEAR } };
        ArkUI_AttributeItem curve_item = { curve_value, sizeof(curve_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_CURVE, &curve_item);
    }

    // Swiper组件属性--itemSpace （子组件间的间隙）
    ArkUI_NumberValue itemSpace_value[] = { 5 };
    ArkUI_AttributeItem itemSpace_item = { itemSpace_value, sizeof(itemSpace_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_SWIPER_ITEM_SPACE, &itemSpace_item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " SetAttribute 10");
    CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_ITEM_SPACE, &itemSpace_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_SWIPER_ITEM_SPACE);
        ArkUI_NumberValue expect_itemSpace_value[] = { 0 };
        ArkUI_AttributeItem expect_itemSpace_item = { expect_itemSpace_value, sizeof(expect_itemSpace_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_ITEM_SPACE, &expect_itemSpace_item);
    }

    // Swiper组件属性--index （设置当前在容器中显示的子组件的索引值）
    ArkUI_NumberValue index_value[] = { { .i32 = 1 } };
    ArkUI_AttributeItem index_item = { index_value, sizeof(index_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_SWIPER_INDEX, &index_item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " SetAttribute 11");
    CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_INDEX, &index_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_SWIPER_INDEX);
        ArkUI_NumberValue expect_index_value[] = { { .i32 = 0 } };
        ArkUI_AttributeItem expect_index_item = { expect_index_value, sizeof(expect_index_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_INDEX, &expect_index_item);
    }

    // Swiper组件属性--displayCount （视窗内显示的子元素个数）
    ArkUI_NumberValue displayCount_value[] = { { .i32 = 2 }, { .i32 = 1 } };
    ArkUI_AttributeItem displayCount_item = { displayCount_value,
                                              sizeof(displayCount_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_SWIPER_DISPLAY_COUNT, &displayCount_item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " SetAttribute 12");
    CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_DISPLAY_COUNT, &displayCount_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_SWIPER_DISPLAY_COUNT);
        ArkUI_NumberValue expectDisplayCountValue[] = { { .i32 = 1 }, { .i32 = 0 } };
        ArkUI_AttributeItem expectDisplayCount_item = { expectDisplayCountValue, 2 };
        CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_DISPLAY_COUNT, &expectDisplayCount_item);
    }

    // Swiper组件属性--disableSwipe （是否禁用组件滑动切换动能）
    ArkUI_NumberValue disableSwipe_value[] = { { .i32 = true } };
    ArkUI_AttributeItem disableSwipe_item = { disableSwipe_value,
                                              sizeof(disableSwipe_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_SWIPER_DISABLE_SWIPE, &disableSwipe_item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " SetAttribute 13");
    CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_DISABLE_SWIPE, &disableSwipe_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_SWIPER_DISABLE_SWIPE);
        ArkUI_NumberValue disableSwipe_value[] = { { .i32 = false } };
        ArkUI_AttributeItem disableSwipe_item = { disableSwipe_value,
                                              sizeof(disableSwipe_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_DISABLE_SWIPE, &disableSwipe_item);
    }

    // Swiper组件属性--showDisplayArrow （设置导航点箭头样式）
    ArkUI_NumberValue showDisplayArrow_value[] = { { .i32 = ARKUI_SWIPER_ARROW_SHOW } };
    ArkUI_AttributeItem showDisplayArrow_item = { showDisplayArrow_value,
                                                  sizeof(showDisplayArrow_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_SWIPER_SHOW_DISPLAY_ARROW, &showDisplayArrow_item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " SetAttribute 14");
    CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_SHOW_DISPLAY_ARROW, &showDisplayArrow_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_SWIPER_SHOW_DISPLAY_ARROW);
        ArkUI_NumberValue showDisplayArrow_value[] = { { .i32 = ARKUI_SWIPER_ARROW_HIDE } };
        ArkUI_AttributeItem showDisplayArrow_item = { showDisplayArrow_value,
                                                  sizeof(showDisplayArrow_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_SHOW_DISPLAY_ARROW, &showDisplayArrow_item);
    }

    // Swiper组件属性--effectMode （边缘滑动效果）
    ArkUI_NumberValue effectMode_value[] = { { .i32 = ARKUI_EDGE_EFFECT_FADE } };
    ArkUI_AttributeItem effectMode_item = { effectMode_value, sizeof(effectMode_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_SWIPER_EDGE_EFFECT_MODE, &effectMode_item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " SetAttribute 15");
    CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_EDGE_EFFECT_MODE, &effectMode_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_SWIPER_EDGE_EFFECT_MODE);
        ArkUI_NumberValue effectMode_value[] = { { .i32 = ARKUI_EDGE_EFFECT_SPRING } };
        ArkUI_AttributeItem effectMode_item = { effectMode_value, sizeof(effectMode_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_EDGE_EFFECT_MODE, &effectMode_item);
    }

    // Swiper组件属性--NodeAdapter

    // Swiper组件属性--cachedCount （预加载子组件个数）
    ArkUI_NumberValue cachedCount_value[] = { { .i32 = 2 } };
    ArkUI_AttributeItem cachedCount_item = { cachedCount_value, sizeof(cachedCount_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_SWIPER_CACHED_COUNT, &cachedCount_item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " SetAttribute 16");
    CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_CACHED_COUNT, &cachedCount_item);
    if (withReset) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " SetAttribute 16-0");
        nodeAPI->resetAttribute(item, NODE_SWIPER_CACHED_COUNT);
        ArkUI_NumberValue cachedCount_value[] = { { .i32 = 1 } };
        ArkUI_AttributeItem cachedCount_item = { cachedCount_value, sizeof(cachedCount_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_CACHED_COUNT, &cachedCount_item);
    }

    // Swiper组件属性--prevMargin （设置前边距）
    ArkUI_NumberValue prevMargin_value[] = { { .f32 = 1.0 }, { .i32 = 0 } };
    ArkUI_AttributeItem prevMargin_item = { prevMargin_value, sizeof(prevMargin_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_SWIPER_PREV_MARGIN, &prevMargin_item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " SetAttribute 17");
    CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_PREV_MARGIN, &prevMargin_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_SWIPER_PREV_MARGIN);
        ArkUI_NumberValue prevMargin_value[] = { { .f32 = 0.0 }, { .i32 = 0 } };
        ArkUI_AttributeItem prevMargin_item = { prevMargin_value, sizeof(prevMargin_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_PREV_MARGIN, &prevMargin_item);
    }

    // Swiper组件属性--nextMargin （设置后边距）
    ArkUI_NumberValue nextMargin_value[] = { { .f32 = 1.0 }, { .i32 = 0 } };
    ArkUI_AttributeItem nextMargin_item = { nextMargin_value, sizeof(nextMargin_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_SWIPER_NEXT_MARGIN, &nextMargin_item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " SetAttribute 18");
    CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_NEXT_MARGIN, &nextMargin_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_SWIPER_NEXT_MARGIN);
        ArkUI_NumberValue nextMargin_value[] = { { .f32 = 0.0 }, { .i32 = 0 } };
        ArkUI_AttributeItem nextMargin_item = { nextMargin_value, sizeof(nextMargin_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_NEXT_MARGIN, &nextMargin_item);
    }

    // Swiper组件属性--showIndicator (是否开启导航点指示器)
    ArkUI_NumberValue showIndicator_value[] = { { .i32 = 0 } };
    ArkUI_AttributeItem showIndicator_item = { showIndicator_value,
                                               sizeof(showIndicator_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_SWIPER_SHOW_INDICATOR, &showIndicator_item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " SetAttribute 5");
    CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_SHOW_INDICATOR, &showIndicator_item);
    if (withReset) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " SetAttribute 5-0");
        nodeAPI->resetAttribute(item, NODE_SWIPER_SHOW_INDICATOR);
        ArkUI_NumberValue showIndicator_value[] = { { .i32 = 1 } };
        ArkUI_AttributeItem showIndicator_item = { showIndicator_value,
                                               sizeof(showIndicator_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_SHOW_INDICATOR, &showIndicator_item);
    }

    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " SetAttribute 19");

    // Swiper组件属性--INDICATOR （导航器样式）
    auto indicator = OH_ArkUI_SwiperIndicator_Create(ARKUI_SWIPER_INDICATOR_TYPE_DOT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " SetAttribute 20");
    OH_ArkUI_SwiperIndicator_SetTopPosition(indicator, 1.0f);
    OH_ArkUI_SwiperIndicator_SetBottomPosition(indicator, 1.0f);
    OH_ArkUI_SwiperIndicator_SetItemWidth(indicator, 1.0f);
    OH_ArkUI_SwiperIndicator_SetItemHeight(indicator, 1.0f);
    OH_ArkUI_SwiperIndicator_SetSelectedItemWidth(indicator, 1.0f);
    OH_ArkUI_SwiperIndicator_SetSelectedItemHeight(indicator, 1.0f);
    OH_ArkUI_SwiperIndicator_SetMask(indicator, 1);
    OH_ArkUI_SwiperIndicator_SetColor(indicator, 0xFF000000);
    OH_ArkUI_SwiperIndicator_SetSelectedColor(indicator, 0xFF000000);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " SetAttribute 40");
    ArkUI_NumberValue value[] = { ARKUI_SWIPER_INDICATOR_TYPE_DOT };
    ArkUI_AttributeItem item_1 = { value, 1 };
    item_1.object = indicator;
    nodeAPI->setAttribute(item, NODE_SWIPER_INDICATOR, &item_1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " SetAttribute 41 obj:%{public}p", item_1.object);
    ArkUI_NumberValue expect_value[] = { 0 };
    ArkUI_AttributeItem expect_item_1 = { expect_value, 1 };
    expect_item_1.object = indicator;
    CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_INDICATOR, &expect_item_1, true);

    // Swiper组件属性--nestedScroll （设置swiper和父组件的嵌套滚动模式）
    ArkUI_NumberValue nestedScroll_value[] = { { .i32 = ARKUI_SWIPER_NESTED_SRCOLL_SELF_FIRST } };
    ArkUI_AttributeItem nestedScroll_item = { nestedScroll_value,
                                              sizeof(nestedScroll_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_SWIPER_NESTED_SCROLL, &nestedScroll_item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " SetAttribute 42");
    CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_NESTED_SCROLL, &nestedScroll_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_SWIPER_NESTED_SCROLL);
        ArkUI_NumberValue nestedScroll_value[] = { { .i32 = ARKUI_SWIPER_NESTED_SRCOLL_SELF_ONLY } };
        ArkUI_AttributeItem nestedScroll_item = { nestedScroll_value,
                                              sizeof(nestedScroll_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_NESTED_SCROLL, &nestedScroll_item);
    }

    // Swiper组件属性--toIndex （设置切换器组件翻页到指定页面）
    ArkUI_NumberValue toIndex_value[2] = {};
    toIndex_value[0].i32 = 1;
    toIndex_value[1].i32 = 1;
    ArkUI_AttributeItem toIndex_item = { toIndex_value, 2 };
    // 该属性没有获取方法
    nodeAPI->setAttribute(item, NODE_SWIPER_SWIPE_TO_INDEX, &toIndex_item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " SetAttribute 43");

    // Swiper组件属性--indicatorInteractive （设置导航点是否可交互）
    ArkUI_NumberValue indicatorInteractive_value[] = { { .i32 = false } };
    ArkUI_AttributeItem indicatorInteractive_item = { indicatorInteractive_value,
                                                      sizeof(indicatorInteractive_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_SWIPER_INDICATOR_INTERACTIVE, &indicatorInteractive_item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " SetAttribute 44");
    CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_INDICATOR_INTERACTIVE, &indicatorInteractive_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_SWIPER_INDICATOR_INTERACTIVE);
        // 默认可交互
        ArkUI_NumberValue expect_indicatorInteractive_value[] = { { .i32 = true } };
        ArkUI_AttributeItem expect_indicatorInteractive_item = { expect_indicatorInteractive_value,
                                                      sizeof(expect_indicatorInteractive_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_INDICATOR_INTERACTIVE, &expect_indicatorInteractive_item);
    }


    // Swiper组件属性--pageFlipMode （设置鼠标滚轮翻页模式）
    ArkUI_NumberValue pageFlipModeValue[] = { { .i32 = ARKUI_PAGE_FLIP_MODE_SINGLE } };
    ArkUI_AttributeItem pageFlipModeValueItem = { pageFlipModeValue,
                                                  sizeof(pageFlipModeValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_SWIPER_PAGE_FLIP_MODE, &pageFlipModeValueItem);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " SetAttribute 45");
    CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_PAGE_FLIP_MODE, &pageFlipModeValueItem);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_SWIPER_PAGE_FLIP_MODE);
        // 默认值？
        ArkUI_NumberValue expect_pageFlipModeValue[] = { { .i32 = ARKUI_PAGE_FLIP_MODE_CONTINUOUS } };
        ArkUI_AttributeItem expect_pageFlipModeValue_item = { expect_pageFlipModeValue,
                                                      sizeof(expect_pageFlipModeValue) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_PAGE_FLIP_MODE, &expect_pageFlipModeValue_item);
    }

    // Swiper组件属性--autoFill （设置swiper一页内元素显示个数根据元素最小宽度自适应） 该属性收到别的属性影响，先屏蔽

    // Swiper组件属性-- 设置 swiper 显示区域外插入或者删除数据是否保持可见内容位置不变
    ArkUI_NumberValue contentPositionValue[] = { { .i32 = 1 } };
    ArkUI_AttributeItem contentPositionValueItem = { contentPositionValue,
                                                  sizeof(contentPositionValue) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_SWIPER_MAINTAIN_VISIBLE_CONTENT_POSITION, &contentPositionValueItem);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " SetAttribute 47");
    CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_MAINTAIN_VISIBLE_CONTENT_POSITION, &contentPositionValueItem);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_SWIPER_MAINTAIN_VISIBLE_CONTENT_POSITION);
        // 默认值是 0
        ArkUI_NumberValue contentPositionValue[] = { { .i32 = 0 } };
        ArkUI_AttributeItem contentPositionValueItem = { contentPositionValue,
                                                      sizeof(contentPositionValue) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_SWIPER_MAINTAIN_VISIBLE_CONTENT_POSITION, &contentPositionValueItem);
    }

    // Swiper组件属性-- 设置响应式列数布局策略，影响别的属性，先屏蔽
    
    // 视效 NODE_TRANSLATE
    ArkUI_NumberValue column_translate_value[] = { { .f32 = 1.0f }, { .f32 = 1.0f }, { .f32 = 1.0f } };
    ArkUI_AttributeItem column_translate_item = { column_translate_value,
                                                   sizeof(column_translate_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_TRANSLATE, &column_translate_item);
    CheckSwiperAttr(nodeAPI, item, NODE_TRANSLATE, &column_translate_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_TRANSLATE);
        ArkUI_NumberValue column_translate_value[] = { { .f32 = 0.0f }, { .f32 = 0.0f }, { .f32 =  0.0f } };
        ArkUI_AttributeItem column_translate_item = { column_translate_value,
                                                       sizeof(column_translate_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_TRANSLATE, &column_translate_item);
    }

    // 视效 NODE_SCALE
    ArkUI_NumberValue column_scale_value[] = { { .f32 = 2 }, { .f32 = 2 } };
    ArkUI_AttributeItem column_scale_item = { column_scale_value,
                                                   sizeof(column_scale_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_SCALE, &column_scale_item);
    CheckSwiperAttr(nodeAPI, item, NODE_SCALE, &column_scale_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_SCALE);
        ArkUI_NumberValue column_scale_value[] = { { .f32 = 1.0f }, { .f32 = 1.0f } };
        ArkUI_AttributeItem column_scale_item = { column_scale_value,
                                                       sizeof(column_scale_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_SCALE, &column_scale_item);
    }

    // 视效 NODE_ROTATE
    ArkUI_NumberValue column_rotate_value[] = { { .f32 = 1.0f }, { .f32 = 1.0f }, { .f32 = 1.0f }, { .f32 = 1.0f }, { .f32 = 1.0f } };
    ArkUI_AttributeItem column_rotate_item = { column_rotate_value,
                                                   sizeof(column_rotate_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_ROTATE, &column_rotate_item);
    CheckSwiperAttr(nodeAPI, item, NODE_ROTATE, &column_rotate_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_ROTATE);
        ArkUI_NumberValue column_rotate_value[] = { { .f32 = 0.0f }, { .f32 = 0.0f }, { .f32 = 0.0f }, { .f32 = 0.0f }, { .f32 = 0.0f } };
        ArkUI_AttributeItem column_rotate_item = { column_rotate_value,
                                                       sizeof(column_rotate_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_ROTATE, &column_rotate_item);
    }

    // 视效 NODE_BRIGHTNESS
    ArkUI_NumberValue column_brightness_value[] = { { .f32 = 2 } };
    ArkUI_AttributeItem column_brightness_item = { column_brightness_value,
                                                   sizeof(column_brightness_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_BRIGHTNESS, &column_brightness_item);
    CheckSwiperAttr(nodeAPI, item, NODE_BRIGHTNESS, &column_brightness_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_BRIGHTNESS);
        ArkUI_NumberValue column_brightness_value[] = { { .f32 = 1.0f } };
        ArkUI_AttributeItem column_brightness_item = { column_brightness_value,
                                                       sizeof(column_brightness_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_BRIGHTNESS, &column_brightness_item);
    }

    // 视效 NODE_SATURATION
    ArkUI_NumberValue column_saturation_value[] = { { .f32 = 2 } };
    ArkUI_AttributeItem column_saturation_item = { column_saturation_value,
                                                   sizeof(column_saturation_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_SATURATION, &column_saturation_item);
    CheckSwiperAttr(nodeAPI, item, NODE_SATURATION, &column_saturation_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_SATURATION);
        ArkUI_NumberValue column_saturation_value[] = { { .f32 = 1.0f } };
        ArkUI_AttributeItem column_saturation_item = { column_saturation_value,
                                                       sizeof(column_saturation_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_SATURATION, &column_saturation_item);
    }

    // 视效 NODE_BLUR
    ArkUI_NumberValue column_blur_value[] = { { .f32 = 1.0f } };
    ArkUI_AttributeItem column_blur_item = { column_blur_value,
                                                   sizeof(column_blur_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_BLUR, &column_blur_item);
    CheckSwiperAttr(nodeAPI, item, NODE_BLUR, &column_blur_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_BLUR);
        ArkUI_NumberValue column_blur_value[] = { { .f32 = 0.0f } };
        ArkUI_AttributeItem column_blur_item = { column_blur_value,
                                                       sizeof(column_blur_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_BLUR, &column_blur_item);
    }

    // 视效 NODE_OPACITY
    ArkUI_NumberValue column_opacity_value[] = { { .f32 = 0.5f } };
    ArkUI_AttributeItem column_opacity_item = { column_opacity_value,
                                                   sizeof(column_opacity_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_OPACITY, &column_opacity_item);
    CheckSwiperAttr(nodeAPI, item, NODE_OPACITY, &column_opacity_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_OPACITY);
        ArkUI_NumberValue column_opacity_value[] = { };
        ArkUI_AttributeItem column_opacity_item = { column_opacity_value,
                                                       sizeof(column_opacity_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_OPACITY, &column_opacity_item);
    }


    // 视效 NODE_CLIP
    ArkUI_NumberValue column_clip_value[] = { { .i32 = 1 } };
    ArkUI_AttributeItem column_clip_item = { column_clip_value,
                                                   sizeof(column_clip_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_CLIP, &column_clip_item);
    CheckSwiperAttr(nodeAPI, item, NODE_CLIP, &column_clip_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_CLIP);
        ArkUI_NumberValue column_clip_value[] = { { .i32 = 0 } };
        ArkUI_AttributeItem column_clip_item = { column_clip_value,
                                                       sizeof(column_clip_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_CLIP, &column_clip_item);
    }
    
    // 视效 NODE_CLIP_SHAPE

    // 视效 NODE_TRANSFORM

    // 视效 NODE_SHADOW
    ArkUI_NumberValue column_shadow_value[] = { { .i32 = 1 }};
    ArkUI_AttributeItem column_shadow_item = { column_shadow_value,
                                                   sizeof(column_shadow_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_SHADOW, &column_shadow_item);

    CheckSwiperAttr(nodeAPI, item, NODE_SHADOW, &column_shadow_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_SHADOW);
        ArkUI_NumberValue column_shadow_value[] = { { .i32 = 6 } };
        ArkUI_AttributeItem column_shadow_item = { column_shadow_value,
                                                       sizeof(column_shadow_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_SHADOW, &column_shadow_item);
    }

    // 视效 NODE_CUSTOM_SHADOW
    ArkUI_NumberValue column_customShadow_value[] = { { .f32 = 1.0f }, { .i32 = 1 }, { .f32 = 1.0f }, { .f32 = 1.0f },
                                                      { .i32 = 1 }, { .u32 = 1 }, { .u32 = 1 } };
    ArkUI_AttributeItem column_customShadow_item = { column_customShadow_value,
                                                   sizeof(column_customShadow_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_CUSTOM_SHADOW, &column_customShadow_item);
    CheckSwiperAttr(nodeAPI, item, NODE_CUSTOM_SHADOW, &column_customShadow_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_CUSTOM_SHADOW);
        ArkUI_NumberValue column_customShadow_value[] = { { .f32 = 0.0f }, { .i32 = 0 }, { .f32 = 0.0f }, { .f32 = 0.0f },
                                                      { .i32 = ARKUI_SHADOW_TYPE_COLOR }, { .u32 = 0 }, { .u32 = 0 } };
        ArkUI_AttributeItem column_customShadow_item = { column_customShadow_value,
                                                   sizeof(column_customShadow_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_CUSTOM_SHADOW, &column_customShadow_item);
    }


    // 视效 NODE_TRANSFORM_CENTER
    ArkUI_NumberValue column_transformCenter_value[] = { { .f32 = 1.0f }, { .f32 = 1.0f }, { .f32 = 1.0f }, 
                                                        { .f32 = 1.0f }, { .f32 = 1.0f }, { .f32 = 1.0f } };

    ArkUI_AttributeItem column_transformCenter_item = { column_transformCenter_value,
                                                   sizeof(column_transformCenter_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_TRANSFORM_CENTER, &column_transformCenter_item);
    CheckSwiperAttr(nodeAPI, item, NODE_TRANSFORM_CENTER, &column_transformCenter_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_TRANSFORM_CENTER);
        ArkUI_NumberValue column_transformCenter_value[] = { { .f32 = 0.0f }, { .f32 = 0.0f }, { .f32 = 0.0f },
                                                         { .f32 = 0.5f }, { .f32 = 0.5f }, { .f32 = 0.5f } };
        ArkUI_AttributeItem column_transformCenter_item = { column_transformCenter_value,
                                                       sizeof(column_transformCenter_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_TRANSFORM_CENTER, &column_transformCenter_item);
    }


    // 视效 NODE_OPACITY_TRANSITION
    ArkUI_NumberValue column_opacityTransition_value[] = { { .f32 = 1.0f }, { .i32 = 1 }, { .i32 = ARKUI_CURVE_EASE }};
    ArkUI_AttributeItem column_opacityTransition_item = { column_opacityTransition_value,
                                                   sizeof(column_opacityTransition_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_OPACITY_TRANSITION, &column_opacityTransition_item);
    CheckSwiperAttr(nodeAPI, item, NODE_OPACITY_TRANSITION, &column_opacityTransition_item);


    // 视效 NODE_ROTATE_TRANSITION
    ArkUI_NumberValue column_rotateTransition_value[] = { { .f32 = 1.0f }, { .f32 = 1.0f }, { .f32 = 1.0f }, { .f32 = 1.0f }, { .f32 = 1.0f }, 
                                                          { .i32 = 1 }, { .i32 = 1 }, { .i32 = 1 }, { .i32 = 1 }, { .i32 = 1 }, 
                                                          { .f32 = 1.0f } };
    ArkUI_AttributeItem column_rotateTransition_item = { column_rotateTransition_value,
                                                   sizeof(column_rotateTransition_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_ROTATE_TRANSITION, &column_rotateTransition_item);
    CheckSwiperAttr(nodeAPI, item, NODE_ROTATE_TRANSITION, &column_rotateTransition_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_ROTATE_TRANSITION);
        ArkUI_NumberValue column_rotateTransition_value[] = { { .f32 = 0.0f }, { .f32 = 0.0f }, { .f32 = 0.0f }, { .f32 = 0.0f }, { .f32 = 0.0f }, 
                                                              { .i32 = 1000 }, { .i32 = 0}, { .i32 = 0 }, { .i32 = 1 }, { .i32 = 0 }, 
                                                              { .f32 = 1.0f } };
        ArkUI_AttributeItem column_rotateTransition_item = { column_rotateTransition_value,
                                                       sizeof(column_rotateTransition_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_ROTATE_TRANSITION, &column_rotateTransition_item);
    }


    // 视效 NODE_SCALE_TRANSITION
    ArkUI_NumberValue column_scaleTransition_value[] = { { .f32 = 1.0f }, { .f32 = 1.0f }, { .f32 = 1.0f },
                                                         { .i32 = 1000 }, { .i32 = 1 } };
    ArkUI_AttributeItem column_scaleTransition_item = { column_scaleTransition_value,
                                                   sizeof(column_scaleTransition_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_SCALE_TRANSITION, &column_scaleTransition_item);
    CheckSwiperAttr(nodeAPI, item, NODE_SCALE_TRANSITION, &column_scaleTransition_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_SCALE_TRANSITION);
        ArkUI_NumberValue column_scaleTransition_value[] = { { .f32 = 1.0f }, { .f32 = 1.0f }, { .f32 = 1.0f },
                                                         { .i32 = 1000 }, { .i32 = 0 } };
        ArkUI_AttributeItem column_scaleTransition_item = { column_scaleTransition_value,
                                                       sizeof(column_scaleTransition_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_SCALE_TRANSITION, &column_scaleTransition_item);
    }


    // 视效 NODE_TRANSLATE_TRANSITION
    ArkUI_NumberValue column_translateTransition_value[] = { { .f32 = 1.0f }, { .f32 = 1.0f }, { .f32 = 1.0f },
                                                         { .i32 = 1 }, { .i32 = 1 }};
    ArkUI_AttributeItem column_translateTransition_item = { column_translateTransition_value,
                                                   sizeof(column_translateTransition_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_TRANSLATE_TRANSITION, &column_translateTransition_item);
    CheckSwiperAttr(nodeAPI, item, NODE_TRANSLATE_TRANSITION, &column_translateTransition_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_TRANSLATE_TRANSITION);
        ArkUI_NumberValue column_translateTransition_value[] = { { .f32 = 0.0f }, { .f32 = 0.0f }, { .f32 = 0.0f },
                                                             { .i32 = 0 }, { .i32 = ARKUI_CURVE_LINEAR }};
        ArkUI_AttributeItem column_translateTransition_item = { column_translateTransition_value,
                                                       sizeof(column_translateTransition_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_TRANSLATE_TRANSITION, &column_translateTransition_item);
    }

    // 视效 NODE_MOVE_TRANSITION

    // 视效 NODE_SWEEP_GRADIENT
    ArkUI_NumberValue column_sweepGradient_value[] = {  { .f32 = 1.0f }, { .f32 = 1.0f }, { .f32 = 1.0f },
                                                         { .f32 = 1.0f }, { .f32 = 1.0f } };
    ArkUI_AttributeItem column_sweepGradient_item = { column_sweepGradient_value,
                                                   sizeof(column_sweepGradient_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_SWEEP_GRADIENT, &column_sweepGradient_item);
    CheckSwiperAttr(nodeAPI, item, NODE_SWEEP_GRADIENT, &column_sweepGradient_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_SWEEP_GRADIENT);
        ArkUI_NumberValue column_sweepGradient_value[] = {  { .f32 = 0.0f }, { .f32 = 0.0f }, { .f32 = 0.0f },
                                                             { .f32 = 0.0f }, { .f32 = 0.0f } };
        ArkUI_AttributeItem column_sweepGradient_item = { column_sweepGradient_value,
                                                       sizeof(column_sweepGradient_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_SWEEP_GRADIENT, &column_sweepGradient_item);
    }

    // 视效 NODE_RADIAL_GRADIENT
    ArkUI_NumberValue column_radialGradient_value[] = { { .f32 = 1.0f }, { .f32 = 1.0f }, { .f32 = 1.0f }, { .i32 = 1 } };
    ArkUI_AttributeItem column_radialGradient_item = { column_radialGradient_value,
                                                   sizeof(column_radialGradient_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_RADIAL_GRADIENT, &column_radialGradient_item);
    CheckSwiperAttr(nodeAPI, item, NODE_RADIAL_GRADIENT, &column_radialGradient_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_RADIAL_GRADIENT);
        ArkUI_NumberValue column_radialGradient_value[] = { { .f32 = 0.0f }, { .f32 = 0.0f }, { .f32 = 0.0f }, { .i32 = 0 } };
        ArkUI_AttributeItem column_radialGradient_item = { column_radialGradient_value,
                                                       sizeof(column_radialGradient_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_RADIAL_GRADIENT, &column_radialGradient_item);
    }

    // 视效 NODE_MASK

    // 视效 NODE_BLEND_MODE
    ArkUI_NumberValue column_blend_value[] = { { .i32 = ARKUI_BLEND_MODE_NONE }, { .i32 = BLEND_APPLY_TYPE_FAST } };
    ArkUI_AttributeItem column_blend_item = { column_blend_value,
                                                   sizeof(column_blend_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_BLEND_MODE, &column_blend_item);
    CheckSwiperAttr(nodeAPI, item, NODE_BLEND_MODE, &column_blend_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_BLEND_MODE);
        ArkUI_NumberValue column_blend_value[] = { { .i32 = ARKUI_BLEND_MODE_NONE }, { .i32 = BLEND_APPLY_TYPE_FAST } };
        ArkUI_AttributeItem column_blend_item = { column_blend_value,
                                                       sizeof(column_blend_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_BLEND_MODE, &column_blend_item);
    }

    // 视效 NODE_GRAY_SCALE
    ArkUI_NumberValue column_grayScale_value[] = { { .f32 = 1.0f } };
    ArkUI_AttributeItem column_grayScale_item = { column_grayScale_value,
                                                   sizeof(column_grayScale_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_GRAY_SCALE, &column_grayScale_item);
    CheckSwiperAttr(nodeAPI, item, NODE_GRAY_SCALE, &column_grayScale_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_GRAY_SCALE);
        ArkUI_NumberValue column_grayScale_value[] = { { .f32 = 0.5f } };
        ArkUI_AttributeItem column_grayScale_item = { column_grayScale_value,
                                                       sizeof(column_grayScale_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_GRAY_SCALE, &column_grayScale_item);
    }

    // 视效 NODE_INVERT
    ArkUI_NumberValue column_invert_value[] = { { .f32 = 1.0f } };
    ArkUI_AttributeItem column_invert_item = { column_invert_value,
                                                   sizeof(column_invert_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_INVERT, &column_invert_item);
    CheckSwiperAttr(nodeAPI, item, NODE_INVERT, &column_invert_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_INVERT);
        ArkUI_NumberValue column_invert_value[] = { { .f32 = 0.5f } };
        ArkUI_AttributeItem column_invert_item = { column_invert_value,
                                                       sizeof(column_invert_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_INVERT, &column_invert_item);
    }

    // 视效 NODE_SEPIA
    ArkUI_NumberValue column_sepia_value[] = { { .f32 = 1.0f } };
    ArkUI_AttributeItem column_sepia_item = { column_sepia_value,
                                                   sizeof(column_sepia_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_SEPIA, &column_sepia_item);
    CheckSwiperAttr(nodeAPI, item, NODE_SEPIA, &column_sepia_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_SEPIA);
        ArkUI_NumberValue column_sepia_value[] = { { .f32 = 0.0f } };
        ArkUI_AttributeItem column_sepia_item = { column_sepia_value,
                                                       sizeof(column_sepia_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_SEPIA, &column_sepia_item);
    }

    // 视效 NODE_CONTRAST
    ArkUI_NumberValue column_contrast_value[] = { { .f32 = 1.0f } };
    ArkUI_AttributeItem column_contrast_item = { column_contrast_value,
                                                   sizeof(column_contrast_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_CONTRAST, &column_contrast_item);
    CheckSwiperAttr(nodeAPI, item, NODE_CONTRAST, &column_contrast_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_CONTRAST);
        ArkUI_NumberValue column_contrast_value[] = { { .f32 = 1.0f } };
        ArkUI_AttributeItem column_contrast_item = { column_contrast_value,
                                                       sizeof(column_contrast_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_CONTRAST, &column_contrast_item);
    }

    // 视效 NODE_FOREGROUND_COLOR 无法重置
    ArkUI_NumberValue column_foregroundColor_value[] = { { .u32 = 0xffff0000 } };
    ArkUI_AttributeItem column_foregroundColor_item = { column_foregroundColor_value,
                                                   sizeof(column_foregroundColor_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_FOREGROUND_COLOR, &column_foregroundColor_item);
    CheckSwiperAttr(nodeAPI, item, NODE_FOREGROUND_COLOR, &column_foregroundColor_item);

    // 视效 NODE_OUTLINE_WIDTH

    // 视效 NODE_GEOMETRY_TRANSITION
    ArkUI_NumberValue column_geometryTransition_value[] = { { .i32 = 0 } };
    ArkUI_AttributeItem column_geometryTransition_item = { column_geometryTransition_value,
                                                   sizeof(column_geometryTransition_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_GEOMETRY_TRANSITION, &column_geometryTransition_item);
    CheckSwiperAttr(nodeAPI, item, NODE_GEOMETRY_TRANSITION, &column_geometryTransition_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_GEOMETRY_TRANSITION);
        ArkUI_NumberValue column_geometryTransition_value[] = { { .i32 = 0 } };
        ArkUI_AttributeItem column_geometryTransition_item = { column_geometryTransition_value,
                                                       sizeof(column_geometryTransition_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_GEOMETRY_TRANSITION, &column_geometryTransition_item);
    }

    // 视效 NODE_RENDER_FIT
    ArkUI_NumberValue column_renderFit_value[] = { { .i32 = 0 } };
    ArkUI_AttributeItem column_renderFit_item = { column_renderFit_value,
                                                   sizeof(column_renderFit_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_RENDER_FIT, &column_renderFit_item);
    CheckSwiperAttr(nodeAPI, item, NODE_RENDER_FIT, &column_renderFit_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_RENDER_FIT);
        ArkUI_NumberValue column_renderFit_value[] = { { .i32 = 5  } };
        ArkUI_AttributeItem column_renderFit_item = { column_renderFit_value,
                                                       sizeof(column_renderFit_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_RENDER_FIT, &column_renderFit_item);
    }

    //  视效 NODE_OUTLINE_COLOR
    ArkUI_NumberValue column_outlineColor_value[] = { { .u32 = 1 }, { .u32 = 1 }, { .u32 = 1 }, { .u32 = 1 } };
    ArkUI_AttributeItem column_outlineColor_item = { column_outlineColor_value,
                                                   sizeof(column_outlineColor_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_OUTLINE_COLOR, &column_outlineColor_item);
    CheckSwiperAttr(nodeAPI, item, NODE_OUTLINE_COLOR, &column_outlineColor_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_OUTLINE_COLOR);
        ArkUI_NumberValue column_outlineColor_value[] = { };
        ArkUI_AttributeItem column_outlineColor_item = { column_outlineColor_value,
                                                       sizeof(column_outlineColor_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_OUTLINE_COLOR, &column_outlineColor_item);
    }

    // 视效 NODE_RENDER_GROUP
    ArkUI_NumberValue column_renderGroup_value[] = { { .i32 = 1 } };
    ArkUI_AttributeItem column_renderGroup_item = { column_renderGroup_value,
                                                   sizeof(column_renderGroup_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_RENDER_GROUP, &column_renderGroup_item);
    CheckSwiperAttr(nodeAPI, item, NODE_RENDER_GROUP, &column_renderGroup_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_RENDER_GROUP);
        ArkUI_NumberValue column_renderGroup_value[] = { { .i32 = 0 } };
        ArkUI_AttributeItem column_renderGroup_item = { column_renderGroup_value,
                                                       sizeof(column_renderGroup_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_RENDER_GROUP, &column_renderGroup_item);
    }

    // 视效 NODE_COLOR_BLEND
    ArkUI_NumberValue column_colorBlend_value[] = { { .u32 = 0xffff0000 } };
    ArkUI_AttributeItem column_colorBlend_item = { column_colorBlend_value,
                                                   sizeof(column_colorBlend_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_COLOR_BLEND, &column_colorBlend_item);
    CheckSwiperAttr(nodeAPI, item, NODE_COLOR_BLEND, &column_colorBlend_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_COLOR_BLEND);
        ArkUI_NumberValue column_colorBlend_value[] = { { .u32 = 0x00000000 } };
        ArkUI_AttributeItem column_colorBlend_item = { column_colorBlend_value,
                                                       sizeof(column_colorBlend_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_COLOR_BLEND, &column_colorBlend_item);
    }

    // 视效 NODE_FOREGROUND_BLUR_STYLE

    // 视效 NODE_BACKDROP_BLUR
    ArkUI_NumberValue column_backdropBlur_value[] = { { .f32 = 1.0f }, { .f32 = 1.0f }, { .f32 = 1.0f } };
    ArkUI_AttributeItem column_backdropBlur_item = { column_backdropBlur_value,
                                                   sizeof(column_backdropBlur_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_BACKDROP_BLUR, &column_backdropBlur_item);
    CheckSwiperAttr(nodeAPI, item, NODE_BACKDROP_BLUR, &column_backdropBlur_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_BACKDROP_BLUR);
        ArkUI_NumberValue column_backdropBlur_value[] = { { .f32 = 0.0f }};
        ArkUI_AttributeItem column_backdropBlur_item = { column_backdropBlur_value,
                                                       sizeof(column_backdropBlur_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_BACKDROP_BLUR, &column_backdropBlur_item);
    }

    // 视效 NODE_TRANSLATE_WITH_PERCENT

    // 视效 NODE_ROTATE_ANGLE
    ArkUI_NumberValue column_rotateAngle_value[] = { { .f32 = 1.0f }, { .f32 = 1.0f }, { .f32 = 1.0f }, { .f32 = 1.0f } };
    ArkUI_AttributeItem column_rotateAngle_item = { column_rotateAngle_value,
                                                   sizeof(column_rotateAngle_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(item, NODE_ROTATE_ANGLE, &column_rotateAngle_item);
    CheckSwiperAttr(nodeAPI, item, NODE_ROTATE_ANGLE, &column_rotateAngle_item);
    if (withReset) {
        nodeAPI->resetAttribute(item, NODE_ROTATE_ANGLE);
        ArkUI_NumberValue column_rotateAngle_value[] = { { .f32 = 0.0f }, { .f32 = 0.0f }, { .f32 = 0.0f }, { .f32 = 0.0f } };
        ArkUI_AttributeItem column_rotateAngle_item = { column_rotateAngle_value,
                                                       sizeof(column_rotateAngle_value) / sizeof(ArkUI_NumberValue) };
        CheckSwiperAttr(nodeAPI, item, NODE_ROTATE_ANGLE, &column_rotateAngle_item);
    }
    
}

static bool CreateOneSwiper(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle& swiperNode, bool withReset, int idx) {
    if (!nodeAPI) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_LOG_TAG, "TestOneSwiper 1");
        return false;
    }
    
    swiperNode = nodeAPI->createNode(ARKUI_NODE_SWIPER);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " CreateSwiperAsync 2");

    auto textNode1 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " CreateSwiperAsync 3");    
    ArkUI_AttributeItem contentItem1 = {};
    std::string textContent1 = "text1-";
    textContent1.append(GetThreadId());
    contentItem1.string = textContent1.c_str();
    nodeAPI->setAttribute(textNode1, NODE_TEXT_CONTENT, &contentItem1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " CreateSwiperAsync 4");

    auto textNode2 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem contentItem2 = {};
    std::string textContent2 = "text2-";
    textContent2.append(GetThreadId());
    contentItem2.string = textContent2.c_str();
    nodeAPI->setAttribute(textNode2, NODE_TEXT_CONTENT, &contentItem2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " CreateSwiperAsync 5");


    auto textNode3 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem contentItem3 = {};
    std::string textContent3 = "text3-";
    textContent3.append(GetThreadId());
    contentItem3.string = textContent3.c_str();
    nodeAPI->setAttribute(textNode3, NODE_TEXT_CONTENT, &contentItem3);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " CreateSwiperAsync 5-0");

    auto textNode4 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem contentItem4 = {};
    std::string textContent4 = "text4-";
    textContent4.append(GetThreadId());
    contentItem4.string = textContent4.c_str();
    nodeAPI->setAttribute(textNode4, NODE_TEXT_CONTENT, &contentItem4);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " CreateSwiperAsync 5-1");

    auto textNode5 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem contentItem5 = {};
    std::string textContent5 = "text5-";
    textContent5.append(GetThreadId());
    contentItem5.string = textContent5.c_str();
    nodeAPI->setAttribute(textNode5, NODE_TEXT_CONTENT, &contentItem5);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " CreateSwiperAsync 5-2");
    
    nodeAPI->addChild(swiperNode, textNode1);
    nodeAPI->addChild(swiperNode, textNode2);
    nodeAPI->addChild(swiperNode, textNode3);
    nodeAPI->addChild(swiperNode, textNode4);
    nodeAPI->addChild(swiperNode, textNode5);
    SetAttribute(nodeAPI, swiperNode, withReset, false, idx);
    RegisterEvent(nodeAPI, swiperNode, withReset);
    return true;
}

void CreateSwiperAsync(void *asyncUITaskData)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_MULTI_THREAD_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    if (!nodeAPI) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", "get ArkUI_AsyncNativeNodeAPI_1 failed");
        return;
    }
    if (!asyncUITaskData) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", "invalid async UI task data");
        return;
    }
    auto* asyncData = static_cast<AsyncData *>(asyncUITaskData);
    auto& childList = asyncData->childList;
    for (int i = 0; i < SWIPER_COUNT_PER_THREAD; i++) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SwiperTest", " CreateSwiperAsync 1");
        ArkUI_NodeHandle node = nullptr;
        CreateOneSwiper(nodeAPI, node, asyncData->withReset, i);
        childList.push_back(node);
    }
}

napi_value SwiperCreateNativeNodeTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_LOG_TAG, "SwiperTestCreateNativeNode 1");

    size_t argc = 3;
    napi_value args[3] = { nullptr, nullptr, nullptr  };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    // 获取NodeContent
    ArkUI_NodeContentHandle contentHandle;
    ArkUI_ContextHandle contextHandle;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &contentHandle);
    OH_ArkUI_GetContextFromNapiValue(env, args[1], &contextHandle);
    bool withReset = false;
    napi_get_value_bool(env, args[PARAM_2], &withReset);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    // 创建column节点组件
    ArkUI_NativeNodeAPI_1 *nodeAPI_async = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI_async);
    auto column = nodeAPI_async->createNode(ARKUI_NODE_COLUMN);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, MY_LOG_TAG, "SwiperTestCreateNativeNode 2 withReset:%{public}d", withReset);
    // 添加Native组件到NodeContent上用于挂载显示
    if (OH_ArkUI_NodeContent_AddNode(contentHandle, column) != 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, MY_LOG_TAG, "SwiperTestCreateNativeNode error failed to create column");
        return nullptr;
    }
    
    for (int i = 0; i < ASYNC_TASK_COUNT; i++) {
        auto *asyncData = new AsyncData();
        asyncData->parent = column;
        asyncData->withReset = withReset;
        OH_ArkUI_PostAsyncUITask(contextHandle, asyncData, CreateSwiperAsync, OnCreateAsyncDone);
    }
    
    for (int i = 0; i < SWIPER_COUNT_PER_THREAD; ++i) {
       ArkUI_NodeHandle swiperNode = nullptr;
       CreateOneSwiper(nodeAPI_async, swiperNode, withReset, i);
       int32_t ret1 = nodeAPI->addChild(column, swiperNode);
    }
    
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
}
