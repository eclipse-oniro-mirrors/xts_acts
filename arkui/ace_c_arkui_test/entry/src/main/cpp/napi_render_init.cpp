/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include "button/button_onclick_test.h"
#include "checkbox/checkbox_onchange_test.h"
#include "common/common.h"
#include "commonattrs/commonattrs_enabled_test.h"
#include "commonattrs/commonattrs_focusable_test.h"
#include "commonevent/commonevent_onappear_test.h"
#include "commonevent/commonevent_ontouch_test.h"
#include "commonevent/pointevent_ontouch_test.h"
#include "commonevent/commonevent_onareachange_test.h"
#include "commonevent/commonevent_onblur_test.h"
#include "commonevent/commonevent_onfocus_test.h"
#include "commonevent/commonevent_onclick_test.h"
#include "commonattrs/commonattrs_hittestbehavior_test.h"
#include "commonattrs/commonattrs_id_test.h"
#include "customcomponent/customcomponent_onmeasure_test.h"
#include "customcomponent/customcomponent_onlayout_test.h"
#include "customcomponent/customcomponent_ondraw_test.h"
#include "image/image_hittestbehavior_test.h"
#include "image/image_id_test.h"
#include "image/image_oncomplete_test.h"
#include "image/image_onerror_test.h"
#include "list/list_hittestbehavior_test.h"
#include "listitem/listitem_hittestbehavior_test.h"
#include "manager/plugin_manager.h"
#include "toggle/toggle_onchange_test.h"
#include "toggle/toggle_enabled_test.h"
#include "scroll/scroll_nestedscroll_test.h"
#include "scroll/scroll_hittestbehavior_test.h"
#include "scroll/scroll_onappear_test.h"
#include "scroll/scroll_onscroll_test.h"
#include "scroll/scroll_onscrolledge_test.h"
#include "scroll/scroll_onscrollframebegin_test.h"
#include "scroll/scroll_onscrollstart_test.h"
#include "scroll/scroll_onscrollstop_test.h"
#include "scroll/scroll_scrolledge_test.h"
#include "scroll/scroll_scrollto_test.h"
#include "scroll/scroll_currentoffset_test.h"
#include "stack/stack_hittestbehavior_test.h"
#include "stack/stack_onareachange_test.h"
#include "stack/stack_ontouch_test.h"
#include "text/text_enabled_test.h"
#include "manager/plugin_manager.h"
#include "calendarpicker/calendarpicker_onchange_test.h"
#include "textpicker/textpicker_onchange_test.h"
#include "datepicker/datepicker_ondatechange_test.h"
#include "timepicker/timepicker_onchange_test.h"
#include "customcomponent/customcomponent_enabled_test.h"
#include "customcomponent/customcomponent_focusable_test.h"
#include "customcomponent/customcomponent_onappear_test.h"
#include "customcomponent/customcomponent_ontouch_test.h"
#include "customcomponent/customcomponent_onareachange_test.h"
#include "customcomponent/customcomponent_onblur_test.h"
#include "customcomponent/customcomponent_onfocus_test.h"
#include "customcomponent/customcomponent_onclick_test.h"
#include "customcomponent/customcomponent_hittestbehavior_test.h"
#include "customcomponent/customcomponent_id_test.h"
#include "textarea/textarea_enabled_test.h"
#include "textinput/textinput_enabled_test.h"
#include "textinput/textinput_onchange_test.h"
#include "calendarpicker/calendarpicker_enabled_test.h"
#include "checkbox/checkbox_enabled_test.h"
#include "datepicker/datepicker_enabled_test.h"
#include "slider/slider_enabled_test.h"
#include "refresh/refresh_onrefreshing_test.h"
#include "refresh/refresh_onstatechange_test.h"
#include "textarea/textarea_onfocus_test.h"
#include "textarea/textarea_onblur_test.h"
#include "textarea/textarea_key_test.h"
#include "textinput/textinput_key_test.h"
#include "textarea/textarea_onchange_test.h"
#include "slider/slider_onchange_test.h"
#include "textinput/textinput_onblur_test.h"
#include "textinput/textinput_onfocus_test.h"
#include "textinput/textinput_onsubmit_test.h"
#include "textinput/textinput_oncut_test.h"
#include "textinput/textinput_onpaste_test.h"
#include "gesture/gesture_test.h"
#include "gestureScroll/gesture_interfaceTest.h"
#include "customcomponent/customcomponent_event_test.h"
#include "drag/drag_setSuggestedDropOperation.h"
#include "drag/drag_disableDefaultDropAnimation.h"
#include "drag/drag_getPreDragStatus.h"
#include "drag/drag_setDragResult.h"
#include "drag/drag_getDataTypesCount.h"
#include "drag/drag_getDragResult.h"
#include "drag/drag_getXY.h"
#include "drag/drag_getWidthHeight.h"
#include "drag/drag_getModifierKeyStates.h"
#include "drag/drag_getDropOperation.h"
#include "drag/dragAction_createDragAction.h"
#include "drag/dragAction_setPointerId.h"
#include "drag/dragAction_setDragPreviewOption.h"
#include "drag/dragAction_setTouchPointXY.h"
#include "drag/dragAction_registerStatusListener.h"

namespace ArkUICapiTest {
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Init", "Init begins");
    if ((env == nullptr) || (exports == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "env or exports is null");
        return nullptr;
    }

    napi_property_descriptor desc[] = {
        {"getContext", nullptr, PluginManager::GetContext, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"buttonOnClickTest", nullptr, ButtonOnClickTest::CreateNativeNode, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"checkboxOnChangeTest", nullptr, CheckboxOnChangeTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"commonAttrsEnabledTest", nullptr, CommonAttrsEnabledTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"commonAttrsFocusableTest", nullptr, CommonAttrsFocusableTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"commonEventOnAppearTest", nullptr, CommonEventOnAppearTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"commonEventOnAreaChangeTest", nullptr, CommonEventOnAreaChangeTest::CreateNativeNode, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"commonEventOnTouchTest", nullptr, CommonEventOnTouchTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"pointEventOnTouchTest", nullptr, PointEventOnTouchTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"commonEventOnBlurTest", nullptr, CommonEventOnBlurTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"commonEventOnFocusTest", nullptr, CommonEventOnFocusTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"commonEventOnClickTest", nullptr, CommonEventOnClickTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"commonAttrsHitTestBehaviorTest", nullptr, CommonAttrsHitTestBehaviorTest::CreateNativeNode, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"commonAttrsIdTest", nullptr, CommonAttrsIdTest::CreateNativeNode, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"customComponentOnMeasureTest", nullptr, CustomComponentOnMeasureTest::CreateNativeNode, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"customComponentOnLayoutTest", nullptr, CustomComponentOnLayoutTest::CreateNativeNode, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"customComponentOnDrawTest", nullptr, CustomComponentOnDrawTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"imageHitTestBehaviorTest", nullptr, ImageHitTestBehaviorTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"imageIdTest", nullptr, ImageIdTest::CreateNativeNode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"imageOnCompleteTest", nullptr, ImageOnCompleteTest::CreateNativeNode, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"imageOnErrorTest", nullptr, ImageOnErrorTest::CreateNativeNode, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"listHitTestBehaviorDefaultTest", nullptr, ListHitTestBehaviorTest::CreateNativeNodeDefault, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"listHitTestBehaviorBlockTest", nullptr, ListHitTestBehaviorTest::CreateNativeNodeBlock, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"listHitTestBehaviorTransparentTest", nullptr, ListHitTestBehaviorTest::CreateNativeNodeTransparent, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"listHitTestBehaviorNoneTest", nullptr, ListHitTestBehaviorTest::CreateNativeNodeNone, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"listItemHitTestBehaviorDefaultTest", nullptr, ListItemHitTestBehaviorTest::CreateNativeNodeDefault, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"listItemHitTestBehaviorBlockTest", nullptr, ListItemHitTestBehaviorTest::CreateNativeNodeBlock, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"listItemHitTestBehaviorTransparentTest", nullptr, ListItemHitTestBehaviorTest::CreateNativeNodeTransparent,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"listItemHitTestBehaviorNoneTest", nullptr, ListItemHitTestBehaviorTest::CreateNativeNodeNone, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"toggleOnChangeTest", nullptr, ToggleOnChangeTest::CreateNativeNode, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"toggleEnabledTest", nullptr, ToggleEnabledTest::CreateNativeNode, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"scrollNestedScrollTest", nullptr, ScrollNestedScrollTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"scrollNestedScrollChangeTestType", nullptr, ScrollNestedScrollTest::ChangeTestType, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"scrollOnScrollTest", nullptr, ScrollOnScrollTest::CreateNativeNode, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"scrollOnScrollFrameBeginTest", nullptr, ScrollOnScrollFrameBeginTest::CreateNativeNode, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"scrollOnAppearTest", nullptr, ScrollOnAppearTest::CreateNativeNode, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"scrollOnScrollEdgeTest", nullptr, ScrollOnScrollEdgeTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"scrollScrollEdgeTest", nullptr, ScrollScrollEdgeTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"scrollOnScrollStopTest", nullptr, ScrollOnScrollStopTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"scrollOnScrollStartTest", nullptr, ScrollOnScrollStartTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"scrollHitTestBehaviorDefaultTest", nullptr, ScrollHitTestBehaviorTest::CreateNativeNodeDefault, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"scrollHitTestBehaviorBlockTest", nullptr, ScrollHitTestBehaviorTest::CreateNativeNodeBlock, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"scrollHitTestBehaviorTransparentTest", nullptr, ScrollHitTestBehaviorTest::CreateNativeNodeTransparent,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scrollHitTestBehaviorNoneTest", nullptr, ScrollHitTestBehaviorTest::CreateNativeNodeNone, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"textEnabledTest", nullptr, TextEnabledTest::CreateNativeNode, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"stackHitTestBehaviorTest", nullptr, StackHitTestBehaviorTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"stackOnAreaChangeTest", nullptr, StackOnAreaChangeTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"stackOnTouchTest", nullptr, StackOnTouchTest::CreateNativeNode, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"calendarPickerOnChangeTest", nullptr, CalendarPickerOnChangeTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"textPickerOnChangeTest", nullptr, TextPickerOnChangeTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"datePickerOnDateChangeTest", nullptr, DatePickerOnDateChangeTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"timePickerOnChangeTest", nullptr, TimePickerOnChangeTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"customComponentEnabledTest", nullptr, CustomComponentEnabledTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"customComponentFocusableTest", nullptr, CustomComponentFocusableTest::CreateNativeNode, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"customComponentOnAppearTest", nullptr, CustomComponentOnAppearTest::CreateNativeNode, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"customComponentOnAreaChangeTest", nullptr, CustomComponentOnAreaChangeTest::CreateNativeNode, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"customComponentOnTouchTest", nullptr, CustomComponentOnTouchTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"customComponentOnBlurTest", nullptr, CustomComponentOnBlurTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"customComponentOnFocusTest", nullptr, CustomComponentOnFocusTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"customComponentOnClickTest", nullptr, CustomComponentOnClickTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"customComponentHitTestBehaviorTest", nullptr, CustomComponentHitTestBehaviorTest::CreateNativeNode, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"customComponentIdTest", nullptr, CustomComponentIdTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"textAreaEnabledTest", nullptr, TextAreaEnabledTest::CreateNativeNode, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"textInputEnabledTest", nullptr, TextInputEnabledTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"textInputOnChangeTest", nullptr, TextInputOnChangeTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"calendarPickerEnabledTest", nullptr, CalendarPickerEnabledTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"checkboxEnabledTest", nullptr, CheckboxEnabledTest::CreateNativeNode, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"datePickerEnabledTest", nullptr, DatePickerEnabledTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"sliderEnabledTest", nullptr, SliderEnabledTest::CreateNativeNode, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"refreshOnRefreshingTest", nullptr, RefreshOnRefreshingTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"refreshOnStateChangeTest", nullptr, RefreshOnStateChangeTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"textAreaOnFocusTest", nullptr, TextAreaOnFocusTest::CreateNativeNode, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"textAreaOnBlurTest", nullptr, TextAreaOnBlurTest::CreateNativeNode, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"textAreaKeyTest", nullptr, TextAreaKeyTest::CreateNativeNode, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"textInputKeyTest", nullptr, TextInputKeyTest::CreateNativeNode, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"textAreaOnChangeTest", nullptr, TextAreaOnChangeTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"sliderOnChangeTest", nullptr, SliderOnChangeTest::CreateNativeNode, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"textInputOnFocusTest", nullptr, TextInputOnFocusTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"textInputOnBlurTest", nullptr, TextInputOnBlurTest::CreateNativeNode, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"textInputOnSubmitTest", nullptr, TextInputOnSubmitTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"textInputOnCutTest", nullptr, TextInputOnCutTest::CreateNativeNode, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"textInputOnPasteTest", nullptr, TextInputOnPasteTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"scrollScrollToLinearTest", nullptr, ScrollScrollToTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"scrollScrollToEaseTest", nullptr, ScrollScrollToTest::CreateNativeNodeEase, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"scrollScrollToEaseInOutTest", nullptr, ScrollScrollToTest::CreateNativeNodeEaseInOut, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"scrollScrollToEaseInTest", nullptr, ScrollScrollToTest::CreateNativeNodeEaseIn, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"scrollScrollToEaseOutTest", nullptr, ScrollScrollToTest::CreateNativeNodeEaseOut, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"scrollScrollToExtremeDecelerationTest", nullptr, ScrollScrollToTest::CreateNativeNodeExtremeDeceleration,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scrollScrollToFastOutLinearInTest", nullptr, ScrollScrollToTest::CreateNativeNodeFastOutLinearIn, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"scrollScrollToFastOutSlowInTest", nullptr, ScrollScrollToTest::CreateNativeNodeFastOutSlowIn, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"scrollScrollToFrictionTest", nullptr, ScrollScrollToTest::CreateNativeNodeFriction, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"scrollScrollToLinearOutSlowInTest", nullptr, ScrollScrollToTest::CreateNativeNodeLinearOutSlowIn, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"scrollScrollToRhythmTest", nullptr, ScrollScrollToTest::CreateNativeNodeRhythm, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"scrollScrollToSharpTest", nullptr, ScrollScrollToTest::CreateNativeNodeSharp, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"scrollScrollToSmoothTest", nullptr, ScrollScrollToTest::CreateNativeNodeSmooth, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"scrollCurrentOffsetLinearTest", nullptr, ScrollCurrentOffsetTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"scrollCurrentOffsetEaseTest", nullptr, ScrollCurrentOffsetTest::CreateNativeNodeEase, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"scrollCurrentOffsetEaseInOutTest", nullptr, ScrollCurrentOffsetTest::CreateNativeNodeEaseInOut, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"scrollCurrentOffsetEaseInTest", nullptr, ScrollCurrentOffsetTest::CreateNativeNodeEaseIn, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"scrollCurrentOffsetEaseOutTest", nullptr, ScrollCurrentOffsetTest::CreateNativeNodeEaseOut, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"scrollCurrentOffsetExtremeDecelerationTest", nullptr,
         ScrollCurrentOffsetTest::CreateNativeNodeExtremeDeceleration, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"scrollCurrentOffsetFastOutLinearInTest", nullptr, ScrollCurrentOffsetTest::CreateNativeNodeFastOutLinearIn,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scrollCurrentOffsetFastOutSlowInTest", nullptr, ScrollCurrentOffsetTest::CreateNativeNodeFastOutSlowIn,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scrollCurrentOffsetFrictionTest", nullptr, ScrollCurrentOffsetTest::CreateNativeNodeFriction, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"scrollCurrentOffsetLinearOutSlowInTest", nullptr, ScrollCurrentOffsetTest::CreateNativeNodeLinearOutSlowIn,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scrollCurrentOffsetRhythmTest", nullptr, ScrollCurrentOffsetTest::CreateNativeNodeRhythm, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"scrollCurrentOffsetSharpTest", nullptr, ScrollCurrentOffsetTest::CreateNativeNodeSharp, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"scrollCurrentOffsetSmoothTest", nullptr, ScrollCurrentOffsetTest::CreateNativeNodeSmooth, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"gestureNestScrollTest", nullptr, GestureInterfaceTest::CreateNativeNode, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"longPressGestureTest", nullptr, GestureTest::CreateLongPressNativeNode, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"swipeGestureTest", nullptr, GestureTest::CreateSwipeNativeNode, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"panGestureTest", nullptr, GestureTest::CreatePanNativeNode, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"rotateGestureTest", nullptr, GestureTest::CreateRotateNativeNode, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"pinchGestureTest", nullptr, GestureTest::CreatePinchNativeNode, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"customComponentEventTest", nullptr, CustomComponentEventTest::CreateNativeNode, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"interruptGestureTest", nullptr, GestureTest::CreateInterruptNativeNode, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"disableDefaultDropAnimationTest", nullptr, DisableDefaultDropAnimationTest::CreateNativeNode, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"getPreDragStatusTest", nullptr, GetPreDragStatusTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"setSuggestedDropOperationTest", nullptr, SetSuggestedDropOperationTest::CreateNativeNode, nullptr, nullptr,
		 nullptr, napi_default, nullptr},
        {"setDragResultTest", nullptr, SetDragResultTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"getDataTypesCountTest", nullptr, GetDataTypesCountTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"getDragResultTest", nullptr, GetDragResultTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"getDropOperationTest", nullptr, GetDropOperationTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"getXYTest", nullptr, GetXYTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"getWidthHeightTest", nullptr, GetWidthHeightTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"getModifierKeyStatesTest", nullptr, GetModifierKeyStatesTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"createDragActionTest", nullptr, CreateDragActionTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"setPointerIdTest", nullptr, SetPointerIdTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"setTouchPointXYTest", nullptr, SetTouchPointXYTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"setDragPreviewOptionTest", nullptr, SetDragPreviewOptionTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"registerStatusListenerTest", nullptr, RegisterStatusListenerTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
    };
    if (napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "napi_define_properties failed");
        return nullptr;
    }

    PluginManager::GetInstance()->Export(env, exports);
    return exports;
}
EXTERN_C_END

static napi_module nativerenderModule = {.nm_version = 1,
                                         .nm_flags = 0,
                                         .nm_filename = nullptr,
                                         .nm_register_func = Init,
                                         .nm_modname = "nativerender",
                                         .nm_priv = ((void *)0),
                                         .reserved = {0}};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&nativerenderModule); }
} // namespace ArkUICapiTest
