/**
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

#include "ani/ani.h"
#include <array>
#include <iostream>
#include "arkui/native_type.h"
#include "arkui/native_node_ani.h"
#include "hilog/log.h"
#include "accessibilityValue/accessibilityValue.h"
#include "common/common.h"
#include "manager/plugin_manager.h"
#include "calendarPicker/calendarPicker_date_test.h"
#include "dragEndPending/dragEndPending.h"
#include "swiperIndicator/swiperIndicator.h"
#include "pointerEvent/pointerEvent.h"
#include "swiperDigitIndicator/swiperDigitIndicator.h"
#include "getGestureParam/getGestureParam.h"
#include "layoutCallbackOnNodeHandle/layoutCallbackOnNodeHandle.h"
#include "swiperArrowStyle/swiperArrowStyle.h"
#include "arkuiXComponent/arkuiXComponent.h"
#include "surfaceHolder/surfaceHolder.h"
#include "textPickerCascade/textPickerCascade.h"
#include "customDialog/customDialog.h"
#include "slider/slider_test.cpp"

namespace {
    //定义 Native 方法签名，冒号”:“ 左边为方法入参，后边为接口返回值，无返回值则不写。 特殊的类型需要对接口进行反汇编获取具体的类型
    const char *testSignature = ":i";
    //定义 Native 方法数组，内为arkts侧需要用到的C方法。参数1是arkts接口，参数3是映射的对应C接口。
    std::array<ani_native_function, 218> methods = {
        ani_native_function { "testCalendarPickerDate", "C{arkui.Content.Content}:", reinterpret_cast<void *>(ArkUICapiTest::CalendarPickerStartEndTest::CalendarPickerDateTest)},
        ani_native_function {"AccessibilityValueTest_a", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_a)},
        ani_native_function {"AccessibilityValueTest_a1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_a1)},
        ani_native_function {"AccessibilityValueTest_b", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_b)},
        ani_native_function {"AccessibilityValueTest_b1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_b1)},
        ani_native_function {"AccessibilityValueTest_c", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_c)},
        ani_native_function {"AccessibilityValueTest_c1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_c1)},
        ani_native_function {"AccessibilityValueTest_d", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_d)},
        ani_native_function {"AccessibilityValueTest_d1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_d1)},
        ani_native_function {"AccessibilityValueTest_d2", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_d2)},
        ani_native_function {"AccessibilityValueTest_d3", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_d3)},
        ani_native_function {"AccessibilityValueTest_d4", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_d4)},
        ani_native_function {"AccessibilityValueTest_d5", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_d5)},
        ani_native_function {"AccessibilityValueTest_d6", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_d6)},
        ani_native_function {"AccessibilityValueTest_d7", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_d7)},
        ani_native_function {"AccessibilityValueTest_d8", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_d8)},
        ani_native_function {"AccessibilityValueTest_d9", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_d9)},
        ani_native_function {"AccessibilityValueTest_e", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_e)},
        ani_native_function {"AccessibilityValueTest_e1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_e1)},
        ani_native_function {"AccessibilityValueTest_e2", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_e2)},
        ani_native_function {"AccessibilityValueTest_f", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_f)},
        ani_native_function {"AccessibilityValueTest_f1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_f1)},
        ani_native_function {"AccessibilityValueTest_g", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_g)},
        ani_native_function {"AccessibilityValueTest_g1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_g1)},
        ani_native_function {"AccessibilityValueTest_h", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_h)},
        ani_native_function {"AccessibilityValueTest_h1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_h1)},
        ani_native_function {"AccessibilityValueTest_i", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_i)},
        ani_native_function {"AccessibilityValueTest_i1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_i1)},
        ani_native_function {"AccessibilityValueTest_j", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_j)},
        ani_native_function {"AccessibilityValueTest_j1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_j1)},
        ani_native_function {"AccessibilityValueTest_k", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_k)},
        ani_native_function {"AccessibilityValueTest_k1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_k1)},
        ani_native_function {"AccessibilityValueTest_l", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_l)},
        ani_native_function {"AccessibilityValueTest_l1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_l1)},
        ani_native_function {"AccessibilityValueTest_m", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_m)},
        ani_native_function {"AccessibilityValueTest_m1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_m1)},
        ani_native_function {"AccessibilityValueTest_n", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_n)},
        ani_native_function {"AccessibilityValueTest_n1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_n1)},
        ani_native_function {"AccessibilityValueTest_o", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_o)},
        ani_native_function {"AccessibilityValueTest_o1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_o1)},
        ani_native_function {"AccessibilityValueTest_p", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_p)},
        ani_native_function {"AccessibilityValueTest_p1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::AccessibilityValueTest::AccessibilityValueTest_p1)},

        ani_native_function {"ArkuiXComponentTest_a", testSignature, reinterpret_cast<void *>(ArkUICapiTest::ArkuiXComponentTest::ArkuiXComponentTest_a)},
        ani_native_function {"ArkuiXComponentTest_b", testSignature, reinterpret_cast<void *>(ArkUICapiTest::ArkuiXComponentTest::ArkuiXComponentTest_b)},
        ani_native_function {"ArkuiXComponentTest_c", testSignature, reinterpret_cast<void *>(ArkUICapiTest::ArkuiXComponentTest::ArkuiXComponentTest_c)},
        ani_native_function {"ArkuiXComponentTest_d", testSignature, reinterpret_cast<void *>(ArkUICapiTest::ArkuiXComponentTest::ArkuiXComponentTest_d)},
        ani_native_function {"ArkuiXComponentTest_e", testSignature, reinterpret_cast<void *>(ArkUICapiTest::ArkuiXComponentTest::ArkuiXComponentTest_e)},
        ani_native_function {"ArkuiXComponentTest_f", testSignature, reinterpret_cast<void *>(ArkUICapiTest::ArkuiXComponentTest::ArkuiXComponentTest_f)},
        ani_native_function {"ArkuiXComponentTest_g", testSignature, reinterpret_cast<void *>(ArkUICapiTest::ArkuiXComponentTest::ArkuiXComponentTest_g)},
        ani_native_function {"ArkuiXComponentTest_g1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::ArkuiXComponentTest::ArkuiXComponentTest_g1)},
        ani_native_function {"ArkuiXComponentTest_h", testSignature, reinterpret_cast<void *>(ArkUICapiTest::ArkuiXComponentTest::ArkuiXComponentTest_h)},
        ani_native_function {"ArkuiXComponentTest_h1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::ArkuiXComponentTest::ArkuiXComponentTest_h1)},
        ani_native_function {"ArkuiXComponentTest_i", testSignature, reinterpret_cast<void *>(ArkUICapiTest::ArkuiXComponentTest::ArkuiXComponentTest_i)},
        ani_native_function {"ArkuiXComponentTest_j", testSignature, reinterpret_cast<void *>(ArkUICapiTest::ArkuiXComponentTest::ArkuiXComponentTest_j)},
        ani_native_function {"ArkuiXComponentTest_i1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::ArkuiXComponentTest::ArkuiXComponentTest_i1)},
        ani_native_function {"ArkuiXComponentTest_j1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::ArkuiXComponentTest::ArkuiXComponentTest_j1)},


        ani_native_function {"CustomDialogTest_a", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_a)},
        ani_native_function {"CustomDialogTest_a1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_a1)},
        ani_native_function {"CustomDialogTest_b", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_b)},
        ani_native_function {"CustomDialogTest_c", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_c)},
        ani_native_function {"CustomDialogTest_d", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_d)},
        ani_native_function {"CustomDialogTest_b1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_b1)},
        ani_native_function {"CustomDialogTest_c1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_c1)},
        ani_native_function {"CustomDialogTest_d1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_d1)},
        ani_native_function {"CustomDialogTest_e", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_e)},
        ani_native_function {"CustomDialogTest_e1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_e1)},
        ani_native_function {"CustomDialogTest_f", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_f)},
        ani_native_function {"CustomDialogTest_f1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_f1)},
        ani_native_function {"CustomDialogTest_g", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_g)},
        ani_native_function {"CustomDialogTest_g1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_g1)},
        ani_native_function {"CustomDialogTest_h", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_h)},
        ani_native_function {"CustomDialogTest_h1" , testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_h1)},
        ani_native_function {"CustomDialogTest_i", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_i)},
        ani_native_function {"CustomDialogTest_j", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_j)},
        ani_native_function {"CustomDialogTest_k", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_k)},
        ani_native_function {"CustomDialogTest_l", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_l)},
        ani_native_function {"CustomDialogTest_m", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_m)},
        ani_native_function {"CustomDialogTest_n", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_n)},
        ani_native_function {"CustomDialogTest_i1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_i1)},
        ani_native_function {"CustomDialogTest_j1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_j1)},
        ani_native_function {"CustomDialogTest_k1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_k1)},
        ani_native_function {"CustomDialogTest_l1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_l1)},
        ani_native_function {"CustomDialogTest_m1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_m1)},
        ani_native_function {"CustomDialogTest_n1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_n1)},
        ani_native_function {"CustomDialogTest_o", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_o)},
        ani_native_function {"CustomDialogTest_o1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_o1)},
        ani_native_function {"CustomDialogTest_p", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_p)},
        ani_native_function {"CustomDialogTest_p1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_p1)},
        ani_native_function {"CustomDialogTest_q", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_q)},
        ani_native_function {"CustomDialogTest_q1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_q1)},
        ani_native_function {"CustomDialogTest_r", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_r)},
        ani_native_function {"CustomDialogTest_r1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_r1)},
        ani_native_function {"CustomDialogTest_s", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_s)},
        ani_native_function {"CustomDialogTest_t", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_t)},
        ani_native_function {"CustomDialogTest_s1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_s1)},
        ani_native_function {"CustomDialogTest_t1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_t1)},
        ani_native_function {"CustomDialogTest_u", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_u)},
        ani_native_function {"CustomDialogTest_v", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_v)},
        ani_native_function {"CustomDialogTest_w", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_w)},
        ani_native_function {"CustomDialogTest_x", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_x)},
        ani_native_function {"CustomDialogTest_y", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_y)},
        ani_native_function {"CustomDialogTest_z", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_z)},
        ani_native_function {"CustomDialogTest_u1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_u1)},
        ani_native_function {"CustomDialogTest_v1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_v1)},
        ani_native_function {"CustomDialogTest_w1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_w1)},
        ani_native_function {"CustomDialogTest_x1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_x1)},
        ani_native_function {"CustomDialogTest_y1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_y1)},
        ani_native_function {"CustomDialogTest_z1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_z1)},
        ani_native_function {"CustomDialogTest_A", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_A)},
        ani_native_function {"CustomDialogTest_B", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_B)},
        ani_native_function {"CustomDialogTest_C", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_C)},
        ani_native_function {"CustomDialogTest_D", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_D)},
        ani_native_function {"CustomDialogTest_A1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_A1)},
        ani_native_function {"CustomDialogTest_B1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_B1)},
        ani_native_function {"CustomDialogTest_C1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_C1)},
        ani_native_function {"CustomDialogTest_D1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::CustomDialogTest::CustomDialogTest_D1)},

        ani_native_function {"DragEndPendingTest_a", testSignature, reinterpret_cast<void *>(ArkUICapiTest::DragEndPendingTest::DragEndPendingTest_a)},
        ani_native_function {"DragEndPendingTest_a1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::DragEndPendingTest::DragEndPendingTest_a1)},
        ani_native_function {"DragEndPendingTest_b", testSignature, reinterpret_cast<void *>(ArkUICapiTest::DragEndPendingTest::DragEndPendingTest_b)},
        ani_native_function {"DragEndPendingTest_c", testSignature, reinterpret_cast<void *>(ArkUICapiTest::DragEndPendingTest::DragEndPendingTest_c)},

        ani_native_function {"GetGestureParamTest_a", testSignature, reinterpret_cast<void *>(ArkUICapiTest::GetGestureParamTest::GetGestureParamTest_a)},
        ani_native_function {"GetGestureParamTest_a1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::GetGestureParamTest::GetGestureParamTest_a1)},
        ani_native_function {"GetGestureParamTest_b", testSignature, reinterpret_cast<void *>(ArkUICapiTest::GetGestureParamTest::GetGestureParamTest_b)},
        ani_native_function {"GetGestureParamTest_c", testSignature, reinterpret_cast<void *>(ArkUICapiTest::GetGestureParamTest::GetGestureParamTest_c)},
        ani_native_function {"GetGestureParamTest_d", testSignature, reinterpret_cast<void *>(ArkUICapiTest::GetGestureParamTest::GetGestureParamTest_d)},
        ani_native_function {"GetGestureParamTest_e", testSignature, reinterpret_cast<void *>(ArkUICapiTest::GetGestureParamTest::GetGestureParamTest_e)},
        ani_native_function {"GetGestureParamTest_f", testSignature, reinterpret_cast<void *>(ArkUICapiTest::GetGestureParamTest::GetGestureParamTest_f)},
        ani_native_function {"GetGestureParamTest_g", testSignature, reinterpret_cast<void *>(ArkUICapiTest::GetGestureParamTest::GetGestureParamTest_g)},
        ani_native_function {"GetGestureParamTest_h", testSignature, reinterpret_cast<void *>(ArkUICapiTest::GetGestureParamTest::GetGestureParamTest_h)},
        ani_native_function {"GetGestureParamTest_i", testSignature, reinterpret_cast<void *>(ArkUICapiTest::GetGestureParamTest::GetGestureParamTest_i)},
        ani_native_function {"GetGestureParamTest_j", testSignature, reinterpret_cast<void *>(ArkUICapiTest::GetGestureParamTest::GetGestureParamTest_j)},
        ani_native_function {"GetGestureParamTest_j1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::GetGestureParamTest::GetGestureParamTest_j1)},


        ani_native_function {"LayoutCallbackOnNodeHandleTest_a", testSignature, reinterpret_cast<void *>(ArkUICapiTest::LayoutCallbackOnNodeHandleTest::LayoutCallbackOnNodeHandleTest_a)},
        ani_native_function {"LayoutCallbackOnNodeHandleTest_a1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::LayoutCallbackOnNodeHandleTest::LayoutCallbackOnNodeHandleTest_a1)},
        ani_native_function {"LayoutCallbackOnNodeHandleTest_b", testSignature, reinterpret_cast<void *>(ArkUICapiTest::LayoutCallbackOnNodeHandleTest::LayoutCallbackOnNodeHandleTest_b)},
        ani_native_function {"LayoutCallbackOnNodeHandleTest_b1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::LayoutCallbackOnNodeHandleTest::LayoutCallbackOnNodeHandleTest_b1)},
        ani_native_function {"LayoutCallbackOnNodeHandleTest_c", testSignature, reinterpret_cast<void *>(ArkUICapiTest::LayoutCallbackOnNodeHandleTest::LayoutCallbackOnNodeHandleTest_c)},
        ani_native_function {"LayoutCallbackOnNodeHandleTest_d", testSignature, reinterpret_cast<void *>(ArkUICapiTest::LayoutCallbackOnNodeHandleTest::LayoutCallbackOnNodeHandleTest_d)},
        ani_native_function {"LayoutCallbackOnNodeHandleTest_c1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::LayoutCallbackOnNodeHandleTest::LayoutCallbackOnNodeHandleTest_c1)},
        ani_native_function {"LayoutCallbackOnNodeHandleTest_d1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::LayoutCallbackOnNodeHandleTest::LayoutCallbackOnNodeHandleTest_d1)},

        ani_native_function {"PointerEventTest_a", testSignature, reinterpret_cast<void *>(ArkUICapiTest::PointerEventTest::PointerEventTest_a)},
        ani_native_function {"PointerEventTest_b", testSignature, reinterpret_cast<void *>(ArkUICapiTest::PointerEventTest::PointerEventTest_b)},
        ani_native_function {"PointerEventTest_a1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::PointerEventTest::PointerEventTest_a1)},
        ani_native_function {"PointerEventTest_b1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::PointerEventTest::PointerEventTest_b1)},

        ani_native_function {"testSliderEnableHpaticFeedback001", testSignature, reinterpret_cast<void *>(ArkUICapiTest::TestSliderEnableHpaticFeedback001)},
        ani_native_function {"testSliderEnableHpaticFeedback002", testSignature, reinterpret_cast<void *>(ArkUICapiTest::TestSliderEnableHpaticFeedback002)},
        ani_native_function {"testSliderEnableHpaticFeedback003", testSignature, reinterpret_cast<void *>(ArkUICapiTest::TestSliderEnableHpaticFeedback003)},
        ani_native_function {"testSliderEnableHpaticFeedback004", testSignature, reinterpret_cast<void *>(ArkUICapiTest::TestSliderEnableHpaticFeedback004)},
        ani_native_function {"testSliderEnableHpaticFeedback005", testSignature, reinterpret_cast<void *>(ArkUICapiTest::TestSliderEnableHpaticFeedback005)},

        ani_native_function {"SurfaceHolderTest_a", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SurfaceHolderTest::SurfaceHolderTest_a)},
        ani_native_function {"SurfaceHolderTest_a1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SurfaceHolderTest::SurfaceHolderTest_a1)},
        ani_native_function {"SurfaceHolderTest_b", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SurfaceHolderTest::SurfaceHolderTest_b)},
        ani_native_function {"SurfaceHolderTest_c", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SurfaceHolderTest::SurfaceHolderTest_c)},
        ani_native_function {"SurfaceHolderTest_c1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SurfaceHolderTest::SurfaceHolderTest_c1)},
        ani_native_function {"SurfaceHolderTest_d", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SurfaceHolderTest::SurfaceHolderTest_d)},
        ani_native_function {"SurfaceHolderTest_e", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SurfaceHolderTest::SurfaceHolderTest_e)},
        ani_native_function {"SurfaceHolderTest_f", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SurfaceHolderTest::SurfaceHolderTest_f)},
        ani_native_function {"SurfaceHolderTest_e1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SurfaceHolderTest::SurfaceHolderTest_e1)},
        ani_native_function {"SurfaceHolderTest_f1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SurfaceHolderTest::SurfaceHolderTest_f1)},
        ani_native_function {"SurfaceHolderTest_g", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SurfaceHolderTest::SurfaceHolderTest_g)},
        ani_native_function {"SurfaceHolderTest_g1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SurfaceHolderTest::SurfaceHolderTest_g1)},
        ani_native_function {"SurfaceHolderTest_h", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SurfaceHolderTest::SurfaceHolderTest_h)},
        ani_native_function {"SurfaceHolderTest_h1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SurfaceHolderTest::SurfaceHolderTest_h1)},

        ani_native_function {"SwiperArrowStyleTest_a", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SwiperArrowStyleTest::SwiperArrowStyleTest_a)},
        ani_native_function {"SwiperArrowStyleTest_b", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SwiperArrowStyleTest::SwiperArrowStyleTest_b)},
        ani_native_function {"SwiperArrowStyleTest_c", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SwiperArrowStyleTest::SwiperArrowStyleTest_c)},
        ani_native_function {"SwiperArrowStyleTest_c1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SwiperArrowStyleTest::SwiperArrowStyleTest_c1)},
        ani_native_function {"SwiperArrowStyleTest_c2", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SwiperArrowStyleTest::SwiperArrowStyleTest_c2)},
        ani_native_function {"SwiperArrowStyleTest_d", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SwiperArrowStyleTest::SwiperArrowStyleTest_d)},
        ani_native_function {"SwiperArrowStyleTest_d1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SwiperArrowStyleTest::SwiperArrowStyleTest_d1)},
        ani_native_function {"SwiperArrowStyleTest_d2", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SwiperArrowStyleTest::SwiperArrowStyleTest_d2)},
        ani_native_function {"SwiperArrowStyleTest_e", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SwiperArrowStyleTest::SwiperArrowStyleTest_e)},
        ani_native_function {"SwiperArrowStyleTest_e1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SwiperArrowStyleTest::SwiperArrowStyleTest_e1)},
        ani_native_function {"SwiperArrowStyleTest_f", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SwiperArrowStyleTest::SwiperArrowStyleTest_f)},
        ani_native_function {"SwiperArrowStyleTest_f1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SwiperArrowStyleTest::SwiperArrowStyleTest_f1)},
        ani_native_function {"SwiperArrowStyleTest_g", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SwiperArrowStyleTest::SwiperArrowStyleTest_g)},
        ani_native_function {"SwiperArrowStyleTest_g1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SwiperArrowStyleTest::SwiperArrowStyleTest_g1)},
        ani_native_function {"SwiperArrowStyleTest_h", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SwiperArrowStyleTest::SwiperArrowStyleTest_h)},
        ani_native_function {"SwiperArrowStyleTest_h1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SwiperArrowStyleTest::SwiperArrowStyleTest_h1)},

        ani_native_function {"swiperDigitIndicatorTest_a", testSignature, reinterpret_cast<void *>(ArkUICapiTest::swiperDigitIndicatorTest::swiperDigitIndicatorTest_a)},
        ani_native_function {"swiperDigitIndicatorTest_b", testSignature, reinterpret_cast<void *>(ArkUICapiTest::swiperDigitIndicatorTest::swiperDigitIndicatorTest_b)},
        ani_native_function {"swiperDigitIndicatorTest_c", testSignature, reinterpret_cast<void *>(ArkUICapiTest::swiperDigitIndicatorTest::swiperDigitIndicatorTest_c)},
        ani_native_function {"swiperDigitIndicatorTest_d", testSignature, reinterpret_cast<void *>(ArkUICapiTest::swiperDigitIndicatorTest::swiperDigitIndicatorTest_d)},
        ani_native_function {"swiperDigitIndicatorTest_e", testSignature, reinterpret_cast<void *>(ArkUICapiTest::swiperDigitIndicatorTest::swiperDigitIndicatorTest_e)},
        ani_native_function {"swiperDigitIndicatorTest_f", testSignature, reinterpret_cast<void *>(ArkUICapiTest::swiperDigitIndicatorTest::swiperDigitIndicatorTest_f)},
        ani_native_function {"swiperDigitIndicatorTest_g", testSignature, reinterpret_cast<void *>(ArkUICapiTest::swiperDigitIndicatorTest::swiperDigitIndicatorTest_g)},
        ani_native_function {"swiperDigitIndicatorTest_h", testSignature, reinterpret_cast<void *>(ArkUICapiTest::swiperDigitIndicatorTest::swiperDigitIndicatorTest_h)},
        ani_native_function {"swiperDigitIndicatorTest_i", testSignature, reinterpret_cast<void *>(ArkUICapiTest::swiperDigitIndicatorTest::swiperDigitIndicatorTest_i)},
        ani_native_function {"swiperDigitIndicatorTest_j", testSignature, reinterpret_cast<void *>(ArkUICapiTest::swiperDigitIndicatorTest::swiperDigitIndicatorTest_j)},
        ani_native_function {"swiperDigitIndicatorTest_k", testSignature, reinterpret_cast<void *>(ArkUICapiTest::swiperDigitIndicatorTest::swiperDigitIndicatorTest_k)},
        ani_native_function {"swiperDigitIndicatorTest_l", testSignature, reinterpret_cast<void *>(ArkUICapiTest::swiperDigitIndicatorTest::swiperDigitIndicatorTest_l)},
        ani_native_function {"swiperDigitIndicatorTest_b1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::swiperDigitIndicatorTest::swiperDigitIndicatorTest_b1)},
        ani_native_function {"swiperDigitIndicatorTest_c1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::swiperDigitIndicatorTest::swiperDigitIndicatorTest_c1)},
        ani_native_function {"swiperDigitIndicatorTest_d1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::swiperDigitIndicatorTest::swiperDigitIndicatorTest_d1)},
        ani_native_function {"swiperDigitIndicatorTest_e1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::swiperDigitIndicatorTest::swiperDigitIndicatorTest_e1)},
        ani_native_function {"swiperDigitIndicatorTest_f1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::swiperDigitIndicatorTest::swiperDigitIndicatorTest_f1)},
        ani_native_function {"swiperDigitIndicatorTest_g1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::swiperDigitIndicatorTest::swiperDigitIndicatorTest_g1)},
        ani_native_function {"swiperDigitIndicatorTest_h1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::swiperDigitIndicatorTest::swiperDigitIndicatorTest_h1)},
        ani_native_function {"swiperDigitIndicatorTest_i1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::swiperDigitIndicatorTest::swiperDigitIndicatorTest_i1)},
        ani_native_function {"swiperDigitIndicatorTest_j1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::swiperDigitIndicatorTest::swiperDigitIndicatorTest_j1)},
        ani_native_function {"swiperDigitIndicatorTest_k1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::swiperDigitIndicatorTest::swiperDigitIndicatorTest_k1)},
        ani_native_function {"swiperDigitIndicatorTest_l1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::swiperDigitIndicatorTest::swiperDigitIndicatorTest_l1)},

        ani_native_function {"SwiperIndicatorTest_a", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SwiperIndicatorTest::SwiperIndicatorTest_a)},
        ani_native_function {"SwiperIndicatorTest_b", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SwiperIndicatorTest::SwiperIndicatorTest_b)},
        ani_native_function {"SwiperIndicatorTest_a1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SwiperIndicatorTest::SwiperIndicatorTest_a1)},
        ani_native_function {"SwiperIndicatorTest_b1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::SwiperIndicatorTest::SwiperIndicatorTest_b1)},

        ani_native_function {"TextPickerCascadeTest_a", testSignature, reinterpret_cast<void *>(ArkUICapiTest::TextPickerCascadeTest::TextPickerCascadeTest_a)},
        ani_native_function {"TextPickerCascadeTest_a1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::TextPickerCascadeTest::TextPickerCascadeTest_a1)},
        ani_native_function {"TextPickerCascadeTest_b", testSignature, reinterpret_cast<void *>(ArkUICapiTest::TextPickerCascadeTest::TextPickerCascadeTest_b)},
        ani_native_function {"TextPickerCascadeTest_b1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::TextPickerCascadeTest::TextPickerCascadeTest_b1)},
        ani_native_function {"TextPickerCascadeTest_c", testSignature, reinterpret_cast<void *>(ArkUICapiTest::TextPickerCascadeTest::TextPickerCascadeTest_c)},
        ani_native_function {"TextPickerCascadeTest_c1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::TextPickerCascadeTest::TextPickerCascadeTest_c1)},
        ani_native_function {"TextPickerCascadeTest_d", testSignature, reinterpret_cast<void *>(ArkUICapiTest::TextPickerCascadeTest::TextPickerCascadeTest_d)},
        ani_native_function {"TextPickerCascadeTest_d1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::TextPickerCascadeTest::TextPickerCascadeTest_d1)},
        ani_native_function {"TextPickerCascadeTest_e", testSignature, reinterpret_cast<void *>(ArkUICapiTest::TextPickerCascadeTest::TextPickerCascadeTest_e)},
        ani_native_function {"TextPickerCascadeTest_e1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::TextPickerCascadeTest::TextPickerCascadeTest_e1)},
        ani_native_function {"TextPickerCascadeTest_f", testSignature, reinterpret_cast<void *>(ArkUICapiTest::TextPickerCascadeTest::TextPickerCascadeTest_f)},
        ani_native_function {"TextPickerCascadeTest_f1", testSignature, reinterpret_cast<void *>(ArkUICapiTest::TextPickerCascadeTest::TextPickerCascadeTest_f1)},
    };
}

static ani_status bindCase(ani_vm *vm, const char *clsName)
{
    ani_env *env;
    OH_LOG_INFO(LOG_APP, " GetEnv strat -> 44");
    //获取环境变量
    if (ANI_OK != vm->GetEnv(ANI_VERSION_1, &env)) {
        std::cerr << "Unsupported ANI_VERSION_1" << std::endl;
        OH_LOG_INFO(LOG_APP, " GetEnv Failed -> 47");
        return (ani_status)9;
    }
    OH_LOG_INFO(LOG_APP, " GetEnv end -> 50");

    ani_class cls{};
    //根据传入的ets侧绑定类的路径查找C侧的实现
    OH_LOG_INFO(LOG_APP, " FindClass start -> 53");
    if (ANI_OK != env->FindClass(clsName, &cls)) {
        OH_LOG_INFO(LOG_APP, " FindClass Failed -> 55");
        std::cerr << "Not found '" << clsName << "'" << std::endl;
        return (ani_status)2;
    }
    OH_LOG_INFO(LOG_APP, " FindClass end -> 53");

    OH_LOG_INFO(LOG_APP, " Class_BindNativeMethods start -> 61");
    //将查询到的C侧接口实现与ets侧接口进行绑定
    if (ANI_OK != env->Class_BindNativeMethods(cls, methods.data(), methods.size())) {
        OH_LOG_INFO(LOG_APP, " Class_BindNativeMethods Failed -> 63");
        std::cerr << "Cannot bind native methods to '" << clsName << "'" << std::endl;
        return (ani_status)3;
    };
    OH_LOG_INFO(LOG_APP, " Class_BindNativeMethods end -> 67");
    return ANI_OK;
}

ANI_EXPORT ani_status ANI_Constructor(ani_vm *vm, uint32_t *result)
{
    OH_LOG_INFO(LOG_APP, " bindCase strat -> 73");
    std::cout << "testTag : entering libentry.so's ANI_Constructor" << std::endl;
    //触发绑定接口，参数2“entry.src.main.ets.pages.LibUtil.LibUtil” 为ets侧绑定类的路径，需要追踪到类名，中间用"."隔开，不能用“/”
    bindCase(vm, "entry.src.main.ets.pages.LibUtil.LibUtil");
    OH_LOG_INFO(LOG_APP, " bindCase end -> 76");
    *result = ANI_VERSION_1;
    OH_LOG_INFO(LOG_APP, " bindCase end -> 78");
    return ANI_OK;
}