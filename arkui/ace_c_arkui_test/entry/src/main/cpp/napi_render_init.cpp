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
#include "list/list_event_test.h"
#include "list/list_scroll_offset_test.h"
#include "list/list_scroll_page_test.h"
#include "list/list_scroll_by_test.h"
#include "list/list_close_all_action_test.h"
#include "list/list_nested_scroll_event_test.h"
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
#include "scroll/scroll_page_test.h"
#include "scroll/scroll_onscrollstop_test.h"
#include "scroll/scroll_scrolledge_test.h"
#include "scroll/scroll_scrollto_test.h"
#include "scroll/scroll_currentoffset_test.h"
#include "stack/stack_hittestbehavior_test.h"
#include "stack/stack_onareachange_test.h"
#include "stack/stack_ontouch_test.h"
#include "text/text_enabled_test.h"
#include "manager/plugin_manager.h"
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
#include "checkbox/checkbox_enabled_test.h"
#include "datepicker/datepicker_enabled_test.h"
#include "slider/slider_enabled_test.h"
#include "refresh/refresh_onrefreshing_test.h"
#include "refresh/refresh_onstatechange_test.h"
#include "refresh/refresh_onOffsetChange_test.h"
#include "textarea/textarea_onfocus_test.h"
#include "textarea/textarea_onblur_test.h"
#include "textarea/textarea_key_test.h"
#include "textinput/textinput_key_test.h"
#include "textarea/textarea_onchange_test.h"

#include "slider/slider_onchange_test.h"
#include "textinput/textinput_onblur_test.h"
#include "textinput/textinput_onfocus_test.h"
#include "textinput/textinput_onsubmit_test.h"
#include "gesture/gesture_test.h"
#include "gestureScroll/gesture_interfaceTest.h"
#include "gesture/gesture_creategesture_test.h"
#include "gesture/gesture_gestureinterrupter_test.h"
#include "gesture/gesture_gestureinfo_test.h"
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
#include "animation/animator_event_test.h"
#include "animation/animation_event_test.h"
#include "inputevent/input_event_test.h"
#include "swiper/swiper_onChange_test.h"
#include "swiper/swiper_onAnimationStart_test.h"
#include "swiper/swiper_onAnimationEnd_test.h"
#include "swiper/swiper_adapter_test.h"
#include "swiper/swiper_onContentDidScroll_test.h"
#include "swiper/swiper_onGestureSwipe_test.h"
#include "swiper/swiper_nestedscrollEvent_test.h"
#include "imageAnimator/imageAnimator_event_test.h"
#include "radio/radio_onChange_test.h"
#include "textarea/textarea_ontextselectionchange_test.h"
#include "textarea/textarea_oncontentscroll_test.h"
#include "textarea/textarea_oncontentdidchange_test.h"
#include "textarea/textarea_oneditchange_test.h"
#include "textarea/textarea_oninsert_test.h"
#include "textarea/textarea_ondelete_test.h"
#include "textarea/textarea_onsubmit_test.h"
#include "textinput/textinput_ontextselectionchange_test.h"
#include "textinput/textinput_oncontentscroll_test.h"
#include "textinput/textinput_oncontentdidchange_test.h"
#include "textinput/textinput_oneditchange_test.h"
#include "textinput/textinput_oninsert_test.h"
#include "textinput/textinput_ondelete_test.h"
#include "image/image_onfinish_test.h"
#include "image/image_downprogress_test.h"
#include "image/image_draggableEvent_test.h"
#include "imagespan/imagespan_onclick_test.h"
#include "span/span_onclick_test.h"
#include "commonattrs/commonattrs_focusstatus_test.h"
#include "commonattrs/commonattrs_touchable_test.h"
#include "commonattrs/commonattrs_focusontouch_test.h"
#include "eventcallback/event_callback_test.h"
#include "nodetree/node_tree_xcomponent_test.h"
#include "commonevent/commonevent_event_test.h"
#include "customdialog/customdialog_test.h"
#include "grid/grid_nodeadapter_test.h"
#include "refresh/refresh_offsetEvent_test.h"
#include "hybird/hybird_getnodehandle_test.h"
#include "requirement/requirement_pangesture_test.h"
#include "customcomponent/customcomponent_measurenode_test.h"
#include "customcomponent/customcomponent_getcontextdrawcanvas_test.h"
#include "customcomponent/customcomponent_drawcontextgetsize_test.h"
#include "customcomponent/customcomponent_eventondraw_test.h"
#include "customcomponent/customcomponent_registernodecustomevent_test.h"
#include "customcomponent/customcomponent_unregisternodecustomevent_test.h"
#include "lazyforeach/lazyforeach_test.h"
#include "textarea/textarea_selectionmenuhidden_test.h"
#include "textarea/textarea_inputfilter_test.h"
#include "scroll/scroll_scroll_event_test.h"
#include "button/button_label_test.h"
#include "xcomponent/xcomponent_id_test.h"
#include "waterFlower/waterflow_event_test.h"
#include "waterFlower/waterflow_nested_scroll_test.h"
#include "waterFlower/waterflow_scroll_by_test.h"
#include "waterFlower/waterflow_scroll_page_test.h"
#include "waterFlower/waterflow_scrolloffset_test.h"

#include "textinput/textinput_selectionmenuhidden_test.h"
#include "textinput/textinput_inputfilter_test.h"
#include "textinput/textinput_ontextselectionallchange_test.h"
#include "customcomponent/customcomponent_secondarylayout_test.h"
#include "requirement/requirement_routerpagestate_test.h"
#include "resourcenapivalue/resourcenapivalue_test.h"

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
        { "listOnScrollTest", nullptr, ListEventTest::CreateNativeNodeOnScroll, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listOnScrollFrameBeginTest", nullptr, ListEventTest::CreateNativeNodeOnScrollFrameBegin, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "listOnScrollStartTest", nullptr, ListEventTest::CreateNativeNodeOnScrollStart, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listOnScrollStopTest", nullptr, ListEventTest::CreateNativeNodeOnScrollStop, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listOnWillScrollTest", nullptr, ListEventTest::CreateNativeNodeOnWillScroll, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listOnDidScrollTest", nullptr, ListEventTest::CreateNativeNodeOnDidScroll, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listOnWillDidScrollTest", nullptr, ListEventTest::CreateNativeNodeOnWillDidScroll, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "listScrollToIndexTest", nullptr, ListEventTest::CreateNativeNodeScrollToIndex, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listOnReachStartTest", nullptr, ListEventTest::CreateNativeNodeOnReachStart, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listOnReachEndTest", nullptr, ListEventTest::CreateNativeNodeOnReachEnd, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listOnScrollIndexTest", nullptr, ListEventTest::CreateNativeNodeOnScrollIndex, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listGetOnWillScrollData", nullptr, ListEventTest::GetOnWillScrollData, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listGetOnDidScrollData", nullptr, ListEventTest::GetOnDidScrollData, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listGetOnWillDidScrollData", nullptr, ListEventTest::GetOnWillDidScrollData, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listGetOnScrollIndexData", nullptr, ListEventTest::GetOnScrollIndexData, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listGetOnScrollData", nullptr, ListEventTest::GetOnScrollData, nullptr, nullptr, nullptr, napi_default,
            nullptr },
        { "listScrollOffset001Test", nullptr, ListScrollOffsetTest::TestListScrollOffset001, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listScrollOffset002Test", nullptr, ListScrollOffsetTest::TestListScrollOffset002, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listScrollOffset003Test", nullptr, ListScrollOffsetTest::TestListScrollOffset003, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listScrollOffset004Test", nullptr, ListScrollOffsetTest::TestListScrollOffset004, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listScrollOffset005Test", nullptr, ListScrollOffsetTest::TestListScrollOffset005, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listScrollOffset006Test", nullptr, ListScrollOffsetTest::TestListScrollOffset006, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listScrollOffset007Test", nullptr, ListScrollOffsetTest::TestListScrollOffset007, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listScrollOffset008Test", nullptr, ListScrollOffsetTest::TestListScrollOffset008, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listScrollOffset009Test", nullptr, ListScrollOffsetTest::TestListScrollOffset009, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listScrollOffset010Test", nullptr, ListScrollOffsetTest::TestListScrollOffset010, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listScrollOffset011Test", nullptr, ListScrollOffsetTest::TestListScrollOffset011, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listScrollOffset012Test", nullptr, ListScrollOffsetTest::TestListScrollOffset012, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listScrollOffset013Test", nullptr, ListScrollOffsetTest::TestListScrollOffset013, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listScrollOffset014Test", nullptr, ListScrollOffsetTest::TestListScrollOffset014, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listScrollOffset015Test", nullptr, ListScrollOffsetTest::TestListScrollOffset015, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listScrollOffset016Test", nullptr, ListScrollOffsetTest::TestListScrollOffset016, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listScrollOffset017Test", nullptr, ListScrollOffsetTest::TestListScrollOffset017, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listScrollOffset018Test", nullptr, ListScrollOffsetTest::TestListScrollOffset018, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listScrollOffset019Test", nullptr, ListScrollOffsetTest::TestListScrollOffset019, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listScrollOffset020Test", nullptr, ListScrollOffsetTest::TestListScrollOffset020, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listScrollOffset021Test", nullptr, ListScrollOffsetTest::TestListScrollOffset021, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listScrollOffset022Test", nullptr, ListScrollOffsetTest::TestListScrollOffset022, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listGetScrollOffsetData", nullptr, ListScrollOffsetTest::GetScrollOffsetData, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listScrollPageTest", nullptr, ListScrollPageTest::TestListScrollPage, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listGetScrollPageData", nullptr, ListScrollPageTest::GetScrollPageData, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listScrollBy001Test", nullptr, ListScrollByTest::TestListScrollBy001, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listScrollBy002Test", nullptr, ListScrollByTest::TestListScrollBy002, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listScrollBy003Test", nullptr, ListScrollByTest::TestListScrollBy003, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listScrollBy004Test", nullptr, ListScrollByTest::TestListScrollBy004, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listGetScrollByData", nullptr, ListScrollByTest::GetScrollByData, nullptr, nullptr, nullptr, napi_default,
            nullptr },
        { "listCloseAllActionTest", nullptr, ListCloseAllTest::CreateNativeNodeCloseAll, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listGetCloseAllActionRetData", nullptr, ListCloseAllTest::GetRetData, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listNestedScroll001Test", nullptr, ListNestedScrollTest::CreateNativeNode, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listNestedScroll002Test", nullptr, ListNestedScrollTest::CreateNativeNodeSmall, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listNestedScroll003Test", nullptr, ListNestedScrollTest::CreateNativeNodeReset, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "listGetNestedScrollRetData", nullptr, ListNestedScrollTest::ListGetNestedScrollData, nullptr, nullptr,
            nullptr, napi_default, nullptr },
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
        {"scrollPageTest", nullptr, ScrollPageTest::CreateNativeNode, nullptr, nullptr, nullptr,
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
        {"refreshOnOffsetChangeTest", nullptr, RefreshOnOffsetChangeTest::CreateNativeNode, nullptr, nullptr, nullptr,
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
        {"scrollScrollToCanOverScrollTest", nullptr, ScrollScrollToTest::CreateNativeNodeCanOverScroll, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"scrollScrollToCanOverScrollOffTest", nullptr, ScrollScrollToTest::CreateNativeNodeCanOverScrollOff, nullptr,
         nullptr, nullptr, napi_default, nullptr},
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
        {"gestureCreateGestureTest", nullptr, GestureCreateGestureTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"gestureCreateGesture1Test", nullptr, GestureCreateGestureTest::CreateNativeNode1, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"gestureCreateGesture2Test", nullptr, GestureCreateGestureTest::CreateNativeNode2, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"gestureCreateGesture3Test", nullptr, GestureCreateGestureTest::CreateNativeNode3, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"gestureCreateGesture4Test", nullptr, GestureCreateGestureTest::CreateNativeNode4, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"gestureGestureInterrupterTest", nullptr, GestureGestureInterrupterTest::CreateNativeNode, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"gestureGestureInfoTest", nullptr, GestureGestureInfoTest::CreateNativeNode, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"getGestureData", nullptr, GestureGestureInfoTest::GetGestureData, nullptr, nullptr,
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
        {"testKeyframeRegisterOnFinish", nullptr, AnimatorEventTest::testKeyframeRegisterOnFinish_001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testKeyframeRegisterOnEvent", nullptr, AnimatorEventTest::testKeyframeRegisterOnEvent_002,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testAnimatorRegisterOnFrame", nullptr, AnimatorEventTest::testAnimatorRegisterOnFrame_003,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testAnimatorRegisterOnFinish", nullptr, AnimatorEventTest::testAnimatorRegisterOnFinish_004,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testAnimatorRegisterOnCancel", nullptr, AnimatorEventTest::testAnimatorRegisterOnCancel_005,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testAnimatorRegisterOnRepeat", nullptr, AnimatorEventTest::testAnimatorRegisterOnRepeat_006,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"animateToTest", nullptr, AnimationEventTest::TestAnimateOption001, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"keyframeRegisterOnFinishTest", nullptr, AnimationEventTest::TestKeyframeAnimateOption012, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"keyframeRegisterOnEventTest", nullptr, AnimationEventTest::TestKeyframeAnimateOption023, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"animatorRegisterOnFrameTest", nullptr, AnimationEventTest::TestAnimatorOption047, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"animatorRegisterOnFinishTest", nullptr, AnimationEventTest::TestAnimatorOption050, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"animatorRegisterOnCancelTest", nullptr, AnimationEventTest::TestAnimatorOption053, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"animatorRegisterOnRepeatTest", nullptr, AnimationEventTest::TestAnimatorOption056, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"animatorReverseTest", nullptr, AnimationEventTest::TestAnimatorOption062, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"swiperOnChangeTest", nullptr, SwiperOnChangeTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"swiperSwipeToIndexTest", nullptr, SwiperOnChangeTest::CreateNativeNodeSwipeToIndex, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"swiperOnAnimationStartTest", nullptr, SwiperOnAnimationStartTest::CreateNativeNode, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"swiperOnAnimationEndTest", nullptr, SwiperOnAnimationEndTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"swiperAdapterTest", nullptr, SwiperAdapterTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"swiperOnContentDidScrollTest", nullptr, SwiperOnContentDidScrollTest::CreateNativeNode, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"swiperOnGestureSwipeTest", nullptr, SwiperOnGestureSwipeTest::CreateNativeNode, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"swiperNestedScrollTest", nullptr, SwiperNestedScrollTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"swiperNestedScrollChildTest", nullptr, SwiperNestedScrollTest::CreateNativeNodeChild, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"imageAnimatorOnCancelTest", nullptr, ImageAnimatorEventTest::ImageAnimatorOnCancel,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"imageAnimatorOnPauseTest", nullptr, ImageAnimatorEventTest::ImageAnimatorOnPause,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"imageAnimatorOnRepeatTest", nullptr, ImageAnimatorEventTest::ImageAnimatorOnRepeat,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"imageAnimatorOnFinishTest", nullptr, ImageAnimatorEventTest::ImageAnimatorOnFinish,
         nullptr, nullptr, nullptr, napi_default, nullptr},

        {"radioOnChangeTest", nullptr, RadioOnChangeTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"radioOnChangeCheckedTest", nullptr, RadioOnChangeTest::CreateNativeNodeChecked, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"textAreaOnTextSelectionChangeTest", nullptr, TextAreaOnTextSelectionChangeTest::CreateNativeNode, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"getTextAreaData", nullptr, TextAreaOnTextSelectionChangeTest::GetTextAreaData, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"textAreaOnContentScrollTest", nullptr, TextAreaOnContentScrollTest::CreateNativeNode, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"textAreaOnContentDidChangeTest", nullptr, TextAreaOnContentDidChangeTest::CreateNativeNode, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"getTextAreaContentDidData", nullptr, TextAreaOnContentDidChangeTest::GetTextAreaContentDidData, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"textAreaOnEditChangeTest", nullptr, TextAreaOnEditChangeTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"getTextAreaEditChangeData", nullptr, TextAreaOnEditChangeTest::GetTextAreaEditChangeData, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"textAreaOnInsertTest", nullptr, TextAreaOnInsertTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"getTextAreaInsertData", nullptr, TextAreaOnInsertTest::GetTextAreaInsertData, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"textAreaOnDeleteTest", nullptr, TextAreaOnDeleteTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"getTextAreaDeleteData", nullptr, TextAreaOnDeleteTest::GetTextAreaDeleteData, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"textAreaOnSubmitTest", nullptr, TextAreaOnSubmitTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"gridAdapterTest", nullptr, GridAdapterTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"refreshOffsetTest", nullptr, RefreshOffsetTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"refreshOffsetLessThanOffsetTest", nullptr, RefreshOffsetTest::CreateNativeNodeLessThanOffset, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"getTextAreaSubmitData", nullptr, TextAreaOnSubmitTest::GetTextAreaSubmitData, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"textInputOnTextSelectionChangeTest", nullptr, TextInputOnTextSelectionChangeTest::CreateNativeNode,
         nullptr, nullptr, nullptr, napi_default, nullptr },
        {"getTextInputData", nullptr, TextInputOnTextSelectionChangeTest::GetTextInputData,
         nullptr, nullptr, nullptr, napi_default, nullptr },
        {"textInputOnContentScrollTest", nullptr, TextInputOnContentScrollTest::CreateNativeNode, nullptr, nullptr,
         nullptr, napi_default, nullptr },
        {"textInputOnContentDidChangeTest", nullptr, TextInputOnContentDidChangeTest::CreateNativeNode, nullptr,
         nullptr, nullptr, napi_default, nullptr },
        {"getTextInputContentDidData", nullptr, TextInputOnContentDidChangeTest::GetTextInputContentDidData, nullptr,
         nullptr, nullptr, napi_default, nullptr },
        {"textInputOnEditChangeTest", nullptr, TextInputOnEditChangeTest::CreateNativeNode, nullptr, nullptr,
         nullptr, napi_default, nullptr },
        {"getTextInputEditChangeData", nullptr, TextInputOnEditChangeTest::GetTextInputEditChangeData,
         nullptr, nullptr, nullptr, napi_default, nullptr },
        {"textInputOnInsertTest", nullptr, TextInputOnInsertTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr },
        {"getTextInputInsertData", nullptr, TextInputOnInsertTest::GetTextInputInsertData, nullptr, nullptr, nullptr,
         napi_default, nullptr },
        {"textInputOnDeleteTest", nullptr, TextInputOnDeleteTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr },
        {"getTextInputDeleteData", nullptr, TextInputOnDeleteTest::GetTextInputDeleteData, nullptr, nullptr, nullptr,
         napi_default, nullptr },
        {"imageOnfinishTest", nullptr, ImageOnFinishTest::CreateNativeNode, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"imageDownProgressTest", nullptr, ImageDownProgressTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"imageDraggableEventTest", nullptr, ImageDraggableTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"imageSpanOnClickTest", nullptr, ImagespanOnClickTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"spanOnClickTest", nullptr, SpanOnClickTest::CreateNativeNode, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"commonAttrsFocusStatusTest", nullptr, CommonAttrsFocusStatusTest::CreateNativeNode,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"commonAttrsTouchableTest", nullptr, CommonAttrsTouchableTest::CreateNativeNode,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"commonAttrsFocusOnTouchTest", nullptr, CommonAttrsFocusOnTouchTest::CreateNativeNode,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eventCallbackAddReceiverTest", nullptr, EventCallbackTest::CreateNativeNodeAddReceiver,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eventCallbackRemoveReceiverTest", nullptr, EventCallbackTest::CreateNativeNodeRemoveReceiver,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eventCallbackRegisterEventTest", nullptr, EventCallbackTest::CreateNativeNodeRegisterEvent,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eventCallbackUnregisterEventTest", nullptr, EventCallbackTest::CreateNativeNodeUnregisterEvent,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eventCallbackRegisterReceiverTest", nullptr, EventCallbackTest::CreateNativeNodeRegisterReceiver,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eventCallbackUnregisterReceiverTest", nullptr, EventCallbackTest::CreateNativeNodeUnregisterReceiver,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eventCallbackAddReceiver401Test", nullptr, EventCallbackTest::CreateNativeNodeAddReceiver401,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eventCallbackRemoveReceiver401Test", nullptr, EventCallbackTest::CreateNativeNodeRemoveReceiver401,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eventCallbackRegisterEvent401Test", nullptr, EventCallbackTest::CreateNativeNodeRegisterEvent401,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eventCallbackRegisterEvent001Test", nullptr, EventCallbackTest::CreateNativeNodeRegisterEvent001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eventCallbackRegisterEvent002Test", nullptr, EventCallbackTest::CreateNativeNodeRegisterEvent002,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"commonEventOnHoverTest", nullptr, CommonEventEventTest::CreateNativeNodeOnHover,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"commonEventOnMouseTest", nullptr, CommonEventEventTest::CreateNativeNodeOnMouse,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"commonEventOnDisappearTest", nullptr, CommonEventEventTest::CreateNativeNodeOnDisappear,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"commonEventOnVisibleAreaChangeTest", nullptr, CommonEventEventTest::CreateNativeNodeOnVisibleAreaChange,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"commonEventOnTouchPropagationTest", nullptr, CommonEventEventTest::CreateNativeNodeOnTouchPropagation,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"commonEventOnTouchInterceptDefaultTest", nullptr,
         CommonEventEventTest::CreateNativeNodeOnTouchInterceptDefault, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"commonEventOnTouchInterceptBlockTest", nullptr, CommonEventEventTest::CreateNativeNodeOnTouchInterceptBlock,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"commonEventOnTouchInterceptTransparentTest", nullptr,
         CommonEventEventTest::CreateNativeNodeOnTouchInterceptTransparent, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"commonEventOnTouchInterceptNoneTest", nullptr, CommonEventEventTest::CreateNativeNodeOnTouchInterceptNone,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nodeTreeXComponentTest", nullptr, NodeTreeXComponentTest::CreateNativeNodeXComponent,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nodeTreeXComponentDetach002Test", nullptr, NodeTreeXComponentTest::CreateNativeNodeXComponentDetach002,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nodeTreeXComponentDetach001Test", nullptr, NodeTreeXComponentTest::CreateNativeNodeXComponentDetach001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nodeTreeXComponent401Test", nullptr, NodeTreeXComponentTest::CreateNativeNodeXComponent401,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nodeTreeXComponentDetach401Test", nullptr, NodeTreeXComponentTest::CreateNativeNodeXComponentDetach401,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hybirdGetNodeHandleTest", nullptr, HybirdGetNodeHandleTest::CreateNativeNode,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"requirementPanGestureTest", nullptr, RequirementPanGestureTest::CreateNativeNode, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"customComponentMeasureNodeTest", nullptr, CustomComponentMeasureNodeTest::CreateNativeNode,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getMeasureNodeData", nullptr, CustomComponentMeasureNodeTest::GetMeasureNodeData,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"customComponentGetContextDrawCanvasTest", nullptr, CustomComponentGetContextDrawCanvasTest::CreateNativeNode,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"customComponentDrawContextGetSizeTest", nullptr, CustomComponentDrawContextGetSizeTest::CreateNativeNode,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"customComponentEventOnDrawTest", nullptr, CustomComponentEventOnDrawTest::CreateNativeNode,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"customComponentRegisterNodeCustomEventTest", nullptr,
         CustomComponentRegisterNodeCustomEventTest::CreateNativeNode, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"customComponentUnregisterNodeCustomEventTest", nullptr,
         CustomComponentUnregisterNodeCustomEventTest::CreateNativeNode, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"customDialogSetAutoCancelTest", nullptr, CustomDialogTest::CreateNativeNodeSetAutoCancel,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"customDialogRegisterOnWillDismissTest", nullptr, CustomDialogTest::CreateNativeNodeRegisterOnWillDismiss,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"lazyForEachGetHostNodeTest", nullptr, LazyForEachTest::CreateNativeNodeHostNode, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"lazyForEachSetNodeIdTest", nullptr, LazyForEachTest::CreateNativeNodeNodeId, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"lazyForEachReloadAllItemsTest", nullptr, LazyForEachTest::CreateNativeNodeReloadAllItems, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"lazyForEachGetAllItemsTest", nullptr, LazyForEachTest::CreateNativeNodeGetAllItems, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"lazyForEachReloadItemTest", nullptr, LazyForEachTest::CreateNativeNodeReloadItem, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"lazyForEachInsertItemTest", nullptr, LazyForEachTest::CreateNativeNodeInsertItem, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"lazyForEachMoveItemTest", nullptr, LazyForEachTest::CreateNativeNodeMoveItem, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"lazyForEachRemoveItemTest", nullptr, LazyForEachTest::CreateNativeNodeRemoveItem, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"lazyForEachGetUserDataTest", nullptr, LazyForEachTest::CreateNativeNodeGetUserData, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"lazyForEachGetTypeTest", nullptr, LazyForEachTest::CreateNativeNodeGetType, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"lazyForEachGetRemovedNodeTest", nullptr, LazyForEachTest::CreateNativeNodeGetRemovedNode, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"lazyForEachGetItemIndexTest", nullptr, LazyForEachTest::CreateNativeNodeItemIndex, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"lazyForEachSetItemTest", nullptr, LazyForEachTest::CreateNativeNodeSetItem, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"textAreaSelectionMenuHiddenTest", nullptr, TextAreaSelectionMenuHiddenTest::CreateNativeNode,
         nullptr, nullptr, nullptr, napi_default, nullptr },
        {"textAreaInputFilterTest", nullptr, TextAreaInputFilterTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr },
        {"scrollScrollEventOnWillScrollTest", nullptr, ScrollScrollEventTest::CreateNativeNodeOnWillScroll,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scrollScrollEventOnDidScrollTest", nullptr, ScrollScrollEventTest::CreateNativeNodeOnDidScroll,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scrollScrollEventOnWillDidScrollTest", nullptr, ScrollScrollEventTest::CreateNativeNodeOnWillDidScroll,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scrollScrollEventOnReachStartTest", nullptr, ScrollScrollEventTest::CreateNativeNodeOnReachStart,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scrollScrollEventOnReachEndTest", nullptr, ScrollScrollEventTest::CreateNativeNodeOnReachEnd,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scrollScrollEventScrollBy001Test", nullptr, ScrollScrollEventTest::CreateNativeNodeScrollBy001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scrollScrollEventScrollBy002Test", nullptr, ScrollScrollEventTest::CreateNativeNodeScrollBy002,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scrollScrollEventScrollBy003Test", nullptr, ScrollScrollEventTest::CreateNativeNodeScrollBy003,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scrollScrollEventScrollBy004Test", nullptr, ScrollScrollEventTest::CreateNativeNodeScrollBy004,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scrollScrollEventScrollBy005Test", nullptr, ScrollScrollEventTest::CreateNativeNodeScrollBy005,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scrollScrollEventScrollBy006Test", nullptr, ScrollScrollEventTest::CreateNativeNodeScrollBy006,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getOnWillDidDataTest", nullptr, ScrollScrollEventTest::GetOnWillDidData,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scrollScrollTo001Test", nullptr, ScrollScrollToTest::CreateNativeNodeScrollTo001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"scrollScrollTo002Test", nullptr, ScrollScrollToTest::CreateNativeNodeScrollTo002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"scrollScrollTo003Test", nullptr, ScrollScrollToTest::CreateNativeNodeScrollTo003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"scrollScrollTo004Test", nullptr, ScrollScrollToTest::CreateNativeNodeScrollTo004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"scrollScrollTo005Test", nullptr, ScrollScrollToTest::CreateNativeNodeScrollTo005, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"scrollScrollTo006Test", nullptr, ScrollScrollToTest::CreateNativeNodeScrollTo006, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"scrollScrollTo007Test", nullptr, ScrollScrollToTest::CreateNativeNodeScrollTo007, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"buttonLabel001Test", nullptr, ButtonLabelTest::CreateNativeNodeButtonLabel001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"buttonLabel002Test", nullptr, ButtonLabelTest::CreateNativeNodeButtonLabel002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"buttonLabel003Test", nullptr, ButtonLabelTest::CreateNativeNodeButtonLabel003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"buttonLabel004Test", nullptr, ButtonLabelTest::CreateNativeNodeButtonLabel004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"xComponentId001Test", nullptr, XComponentIdTest::CreateNativeNodeXComponentId001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"xComponentId002Test", nullptr, XComponentIdTest::CreateNativeNodeXComponentId002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"xComponentId003Test", nullptr, XComponentIdTest::CreateNativeNodeXComponentId003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"xComponentId004Test", nullptr, XComponentIdTest::CreateNativeNodeXComponentId004, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"scrollScrollEdge001Test", nullptr, ScrollScrollEdgeTest::CreateNativeNodeScrollEdge001, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"scrollScrollEdge002Test", nullptr, ScrollScrollEdgeTest::CreateNativeNodeScrollEdge002, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"scrollScrollEdge003Test", nullptr, ScrollScrollEdgeTest::CreateNativeNodeScrollEdge003, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        { "waterFlowOnReachStartTest", nullptr, WaterFlowEventTest::CreateNativeNodeReachStart, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "waterFlowOnReachEndTest", nullptr, WaterFlowEventTest::CreateNativeNodeReachEnd, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "waterFlowOnScrollStopTest", nullptr, WaterFlowEventTest::CreateNativeNodeScrollStop, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "waterFlowOnWillDidScrollTest", nullptr, WaterFlowEventTest::CreateNativeNodeOnWillDidScroll, nullptr,
            nullptr, nullptr, napi_default, nullptr },
        { "getOnWillDidScrollData", nullptr, WaterFlowEventTest::GetOnWillDidScrollData, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "waterFlowOnScrollIndexTest", nullptr, WaterFlowEventTest::CreateNativeNodeOnScrollIndex, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "getOnScrollIndexData", nullptr, WaterFlowEventTest::GetOnScrollIndexData, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "waterFlowOnScrollFrameBeginTest", nullptr, WaterFlowEventTest::CreateNativeNodeOnScrollFrameBegin, nullptr,
            nullptr, nullptr, napi_default, nullptr },
        { "waterFlowScrollToIndexTest", nullptr, WaterFlowEventTest::CreateNativeNodeScrollToIndex, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "waterFlowScrollOffsetTest", nullptr, WaterFlowScrollOffsetTest::CreateNativeNode, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "waterFlowScrollOffsetData", nullptr, WaterFlowScrollOffsetTest::WaterFlowScrollOffsetData, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "waterFlowScrollPageTest", nullptr, WaterFlowScrollPageTest::TestWaterFlowScrollPage, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "waterFlowGetScrollPageData", nullptr, WaterFlowScrollPageTest::WaterFlowGetScrollPageData, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "waterFlowScrollBy001Test", nullptr, WaterFlowScrollByTest::TestWaterFlowScrollBy001, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "waterFlowScrollBy002Test", nullptr, WaterFlowScrollByTest::TestWaterFlowScrollBy002, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "waterFlowScrollBy003Test", nullptr, WaterFlowScrollByTest::TestWaterFlowScrollBy003, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "waterFlowScrollBy004Test", nullptr, WaterFlowScrollByTest::TestWaterFlowScrollBy004, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "waterFlowGetScrollByData", nullptr, WaterFlowScrollByTest::WaterFlowGetScrollByData, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "waterFlowNestedScroll1Test", nullptr, WaterFlowNestedScrollTest::CreateNativeNode, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "waterFlowNestedScroll2Test", nullptr, WaterFlowNestedScrollTest::CreateNativeNodeSmall, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "waterFlowNestedScroll3Test", nullptr, WaterFlowNestedScrollTest::CreateNativeNodeReset, nullptr, nullptr,
            nullptr, napi_default, nullptr },
        { "waterFlowGetNestedScrollData", nullptr, WaterFlowNestedScrollTest::WaterFlowGetNestedScrollData, nullptr,
            nullptr, nullptr, napi_default, nullptr },
        {"textInputSelectionMenuHiddenTest", nullptr, TextInputSelectionMenuHiddenTest::CreateNativeNode,
         nullptr, nullptr, nullptr, napi_default, nullptr },
        {"textInputInputFilterTest", nullptr, TextInputInputFilterTest::CreateNativeNode,
         nullptr, nullptr, nullptr, napi_default, nullptr },
        {"textInputOnTextSelectionAllChangeTest", nullptr, TextInputOnTextSelectionAllChangeTest::CreateNativeNode,
         nullptr, nullptr, nullptr, napi_default, nullptr },
        {"getTextInputSelectAllData", nullptr, TextInputOnTextSelectionAllChangeTest::GetTextInputSelectAllData,
         nullptr, nullptr, nullptr, napi_default, nullptr },
        {"customComponentSecondaryLayoutTest", nullptr, CustomComponentSecondaryLayoutTest::CreateNativeNode,
         nullptr, nullptr, nullptr, napi_default, nullptr },
        {"getSecondaryLayoutData", nullptr, CustomComponentSecondaryLayoutTest::GetSecondaryLayoutData,
         nullptr, nullptr, nullptr, napi_default, nullptr },
        {"requirementRouterPageStateTest", nullptr, RequirementRouterPageStateTest::CreateNativeNode, nullptr,
         nullptr, nullptr, napi_default, nullptr },
        {"getRouterData", nullptr, RequirementRouterPageStateTest::GetRouterData, nullptr, nullptr,
         nullptr, napi_default, nullptr },
        {"resourceNapiValueTest", nullptr, ResourceNapiValueTest::CreateNativeNode, nullptr, nullptr, nullptr,
         napi_default, nullptr },

         {"swipeAxisGestureTest", nullptr, GestureTest::CreateSwipeAxisNativeNode, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"GetGestureDataAxis", nullptr, GestureTest::GetGestureDataAxis, nullptr, nullptr,
         nullptr, napi_default, nullptr },
    };
    if (napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "napi_define_properties failed");
        return nullptr;
    }

    // Input Event
    napi_property_descriptor inputEvent_desc[] = {
        { "inputEventTest", nullptr, InputEventTest::CreateNativeNode, nullptr, nullptr, nullptr, napi_default,
            nullptr },
        { "inputEventMouseTest", nullptr, InputEventTest::CreateNativeNodeForMouse, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "inputEventAxisTest", nullptr, InputEventTest::CreateNativeNodeForAxis, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "getEventState", nullptr, InputEventTest::GetEventState, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "setFuncName", nullptr, InputEventTest::SetFuncName, nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    if (napi_define_properties(env, exports, sizeof(inputEvent_desc) / sizeof(inputEvent_desc[0]), inputEvent_desc) !=
        napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "napi_define_properties inputEvent_desc failed");
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