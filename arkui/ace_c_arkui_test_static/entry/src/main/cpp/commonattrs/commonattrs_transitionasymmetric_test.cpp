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

#include "common/common.h"
#include "ani/ani.h"
#include "Dialog/arkoala_api.h"

namespace ArkUIAniTest {

typedef enum {
    ARKUI_TRANSITION_EFFECT_OPACITY = 0,
    ARKUI_TRANSITION_EFFECT_TRANSLATE,
    ARKUI_TRANSITION_EFFECT_SCALE,
    ARKUI_TRANSITION_EFFECT_ROTATE,
    ARKUI_TRANSITION_EFFECT_MOVE,
    ARKUI_TRANSITION_EFFECT_ASYMMETRIC,
} ArkUiTransitionEffectType;

struct ArkUI_TransitionEffect {
    ArkUiTransitionEffectType type;
    float opacity;
    ArkUI_TranslationOptions* translate;
    ArkUI_ScaleOptions* scale;
    ArkUI_RotationOptions* rotate;
    ArkUI_TransitionEdge move;
    ArkUI_TransitionEffect* appear;
    ArkUI_TransitionEffect* disappear;
    ArkUI_TransitionEffect* combine;
    ArkUI_AnimateOption* animation;
    ArkUITransitionEffectOption* toEffectOption;
};

static ani_double TestCommonAttrsTransitionEffectAsymmetric001(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_TransitionEffect* appear = new ArkUI_TransitionEffect{};
    ArkUI_TransitionEffect* disappear = new ArkUI_TransitionEffect{};
    ArkUI_TransitionEffect* option = new ArkUI_TransitionEffect {ARKUI_TRANSITION_EFFECT_ASYMMETRIC};
    option->translate = nullptr;
    option->scale = nullptr;
    option->rotate = nullptr;
    option->combine = nullptr;
    option->animation = nullptr;
    option->appear = appear;
    option->disappear = disappear;

    ArkUI_AttributeItem value_item;
    value_item.object = option;
    auto ret = nodeAPI->setAttribute(column, NODE_TRANSITION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    delete appear;
    appear = nullptr;
    delete disappear;
    disappear = nullptr;
    delete option;
    option = nullptr;
    NAPI_END;
}

} // namespace ArkUIAniTest