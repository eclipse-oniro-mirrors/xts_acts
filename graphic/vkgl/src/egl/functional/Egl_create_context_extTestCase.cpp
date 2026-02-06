/*
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include <climits>
#include <gtest/gtest.h>
#include "../EglBaseFunc.h"
#include "../ActsEgl0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002634, "dEQP-EGL.functional.create_context_e",
    "xt.gles_20.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002635, "dEQP-EGL.functional.create_context_",
    "ext.gles_20.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002636, "dEQP-EGL.functional.create_context_",
    "ext.gles_20.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002637, "dEQP-EGL.functional.create_contex",
    "t_ext.gles_20.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002638, "dEQP-EGL.functional.create_context_e",
    "xt.gles_20.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002639, "dEQP-EGL.functional.create_context_",
    "ext.gles_20.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002640, "dEQP-EGL.functional.create_context_",
    "ext.gles_20.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002641, "dEQP-EGL.functional.create_contex",
    "t_ext.gles_20.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002642, "dEQP-EGL.functional.create_context_ex",
    "t.gles_20.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002643, "dEQP-EGL.functional.create_context_e",
    "xt.gles_20.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002644, "dEQP-EGL.functional.create_context_e",
    "xt.gles_20.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002645, "dEQP-EGL.functional.create_context",
    "_ext.gles_20.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002646, "dEQP-EGL.functional.create_context_ex",
    "t.gles_20.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002647, "dEQP-EGL.functional.create_context_e",
    "xt.gles_20.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002648, "dEQP-EGL.functional.create_context_e",
    "xt.gles_20.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002649, "dEQP-EGL.functional.create_context",
    "_ext.gles_20.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002650, "dEQP-EGL.functional.create_context_ex",
    "t.gles_20.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002651, "dEQP-EGL.functional.create_context_e",
    "xt.gles_20.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002652, "dEQP-EGL.functional.create_context_e",
    "xt.gles_20.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002653, "dEQP-EGL.functional.create_context",
    "_ext.gles_20.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002654, "dEQP-EGL.functional.create_context_e",
    "xt.gles_30.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002655, "dEQP-EGL.functional.create_context_",
    "ext.gles_30.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002656, "dEQP-EGL.functional.create_context_",
    "ext.gles_30.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002657, "dEQP-EGL.functional.create_contex",
    "t_ext.gles_30.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002658, "dEQP-EGL.functional.create_context_e",
    "xt.gles_30.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002659, "dEQP-EGL.functional.create_context_",
    "ext.gles_30.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002660, "dEQP-EGL.functional.create_context_",
    "ext.gles_30.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002661, "dEQP-EGL.functional.create_contex",
    "t_ext.gles_30.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002662, "dEQP-EGL.functional.create_context_ex",
    "t.gles_30.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002663, "dEQP-EGL.functional.create_context_e",
    "xt.gles_30.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002664, "dEQP-EGL.functional.create_context_e",
    "xt.gles_30.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002665, "dEQP-EGL.functional.create_context",
    "_ext.gles_30.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002666, "dEQP-EGL.functional.create_context_ex",
    "t.gles_30.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002667, "dEQP-EGL.functional.create_context_e",
    "xt.gles_30.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002668, "dEQP-EGL.functional.create_context_e",
    "xt.gles_30.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002669, "dEQP-EGL.functional.create_context",
    "_ext.gles_30.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002670, "dEQP-EGL.functional.create_context_ex",
    "t.gles_30.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002671, "dEQP-EGL.functional.create_context_e",
    "xt.gles_30.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002672, "dEQP-EGL.functional.create_context_e",
    "xt.gles_30.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002673, "dEQP-EGL.functional.create_context",
    "_ext.gles_30.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002674, "dEQP-EGL.functional.create_context_",
    "ext.gl_30.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002675, "dEQP-EGL.functional.create_context",
    "_ext.gl_30.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002676, "dEQP-EGL.functional.create_context",
    "_ext.gl_30.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002677, "dEQP-EGL.functional.create_conte",
    "xt_ext.gl_30.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002678, "dEQP-EGL.functional.create_context_",
    "ext.gl_30.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002679, "dEQP-EGL.functional.create_context",
    "_ext.gl_30.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002680, "dEQP-EGL.functional.create_context",
    "_ext.gl_30.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002681, "dEQP-EGL.functional.create_conte",
    "xt_ext.gl_30.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002682, "dEQP-EGL.functional.create_context_e",
    "xt.gl_30.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002683, "dEQP-EGL.functional.create_context_",
    "ext.gl_30.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002684, "dEQP-EGL.functional.create_context_",
    "ext.gl_30.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002685, "dEQP-EGL.functional.create_contex",
    "t_ext.gl_30.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002686, "dEQP-EGL.functional.create_context_e",
    "xt.gl_30.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002687, "dEQP-EGL.functional.create_context_",
    "ext.gl_30.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002688, "dEQP-EGL.functional.create_context_",
    "ext.gl_30.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002689, "dEQP-EGL.functional.create_contex",
    "t_ext.gl_30.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002690, "dEQP-EGL.functional.create_context_e",
    "xt.gl_30.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002691, "dEQP-EGL.functional.create_context_",
    "ext.gl_30.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002692, "dEQP-EGL.functional.create_context_",
    "ext.gl_30.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002693, "dEQP-EGL.functional.create_contex",
    "t_ext.gl_30.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002694, "dEQP-EGL.functional.create_context_ext.",
    "robust_gl_30.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002695, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_30.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002696, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_30.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002697, "dEQP-EGL.functional.create_context_e",
    "xt.robust_gl_30.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002698, "dEQP-EGL.functional.create_context_ext.",
    "robust_gl_30.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002699, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_30.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002700, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_30.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002701, "dEQP-EGL.functional.create_context_e",
    "xt.robust_gl_30.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002702, "dEQP-EGL.functional.create_context_ext.r",
    "obust_gl_30.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002703, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_30.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002704, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_30.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002705, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_30.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002706, "dEQP-EGL.functional.create_context_ext.r",
    "obust_gl_30.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002707, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_30.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002708, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_30.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002709, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_30.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002710, "dEQP-EGL.functional.create_context_ext.r",
    "obust_gl_30.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002711, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_30.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002712, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_30.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002713, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_30.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002714, "dEQP-EGL.functional.create_context_",
    "ext.gl_31.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002715, "dEQP-EGL.functional.create_context",
    "_ext.gl_31.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002716, "dEQP-EGL.functional.create_context",
    "_ext.gl_31.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002717, "dEQP-EGL.functional.create_conte",
    "xt_ext.gl_31.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002718, "dEQP-EGL.functional.create_context_",
    "ext.gl_31.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002719, "dEQP-EGL.functional.create_context",
    "_ext.gl_31.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002720, "dEQP-EGL.functional.create_context",
    "_ext.gl_31.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002721, "dEQP-EGL.functional.create_conte",
    "xt_ext.gl_31.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002722, "dEQP-EGL.functional.create_context_e",
    "xt.gl_31.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002723, "dEQP-EGL.functional.create_context_",
    "ext.gl_31.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002724, "dEQP-EGL.functional.create_context_",
    "ext.gl_31.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002725, "dEQP-EGL.functional.create_contex",
    "t_ext.gl_31.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002726, "dEQP-EGL.functional.create_context_e",
    "xt.gl_31.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002727, "dEQP-EGL.functional.create_context_",
    "ext.gl_31.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002728, "dEQP-EGL.functional.create_context_",
    "ext.gl_31.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002729, "dEQP-EGL.functional.create_contex",
    "t_ext.gl_31.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002730, "dEQP-EGL.functional.create_context_e",
    "xt.gl_31.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002731, "dEQP-EGL.functional.create_context_",
    "ext.gl_31.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002732, "dEQP-EGL.functional.create_context_",
    "ext.gl_31.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002733, "dEQP-EGL.functional.create_contex",
    "t_ext.gl_31.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002734, "dEQP-EGL.functional.create_context_ext.",
    "robust_gl_31.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002735, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_31.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002736, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_31.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002737, "dEQP-EGL.functional.create_context_e",
    "xt.robust_gl_31.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002738, "dEQP-EGL.functional.create_context_ext.",
    "robust_gl_31.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002739, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_31.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002740, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_31.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002741, "dEQP-EGL.functional.create_context_e",
    "xt.robust_gl_31.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002742, "dEQP-EGL.functional.create_context_ext.r",
    "obust_gl_31.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002743, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_31.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002744, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_31.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002745, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_31.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002746, "dEQP-EGL.functional.create_context_ext.r",
    "obust_gl_31.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002747, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_31.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002748, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_31.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002749, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_31.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002750, "dEQP-EGL.functional.create_context_ext.r",
    "obust_gl_31.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002751, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_31.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002752, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_31.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002753, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_31.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002754, "dEQP-EGL.functional.create_context_",
    "ext.gl_32.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002755, "dEQP-EGL.functional.create_context",
    "_ext.gl_32.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002756, "dEQP-EGL.functional.create_context",
    "_ext.gl_32.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002757, "dEQP-EGL.functional.create_conte",
    "xt_ext.gl_32.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002758, "dEQP-EGL.functional.create_context_",
    "ext.gl_32.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002759, "dEQP-EGL.functional.create_context",
    "_ext.gl_32.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002760, "dEQP-EGL.functional.create_context",
    "_ext.gl_32.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002761, "dEQP-EGL.functional.create_conte",
    "xt_ext.gl_32.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002762, "dEQP-EGL.functional.create_context_e",
    "xt.gl_32.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002763, "dEQP-EGL.functional.create_context_",
    "ext.gl_32.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002764, "dEQP-EGL.functional.create_context_",
    "ext.gl_32.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002765, "dEQP-EGL.functional.create_contex",
    "t_ext.gl_32.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002766, "dEQP-EGL.functional.create_context_e",
    "xt.gl_32.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002767, "dEQP-EGL.functional.create_context_",
    "ext.gl_32.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002768, "dEQP-EGL.functional.create_context_",
    "ext.gl_32.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002769, "dEQP-EGL.functional.create_contex",
    "t_ext.gl_32.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002770, "dEQP-EGL.functional.create_context_e",
    "xt.gl_32.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002771, "dEQP-EGL.functional.create_context_",
    "ext.gl_32.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002772, "dEQP-EGL.functional.create_context_",
    "ext.gl_32.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002773, "dEQP-EGL.functional.create_contex",
    "t_ext.gl_32.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002774, "dEQP-EGL.functional.create_context_ext.",
    "robust_gl_32.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002775, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_32.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002776, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_32.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002777, "dEQP-EGL.functional.create_context_e",
    "xt.robust_gl_32.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002778, "dEQP-EGL.functional.create_context_ext.",
    "robust_gl_32.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002779, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_32.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002780, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_32.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002781, "dEQP-EGL.functional.create_context_e",
    "xt.robust_gl_32.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002782, "dEQP-EGL.functional.create_context_ext.r",
    "obust_gl_32.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002783, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_32.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002784, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_32.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002785, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_32.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002786, "dEQP-EGL.functional.create_context_ext.r",
    "obust_gl_32.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002787, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_32.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002788, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_32.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002789, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_32.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002790, "dEQP-EGL.functional.create_context_ext.r",
    "obust_gl_32.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002791, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_32.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002792, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_32.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002793, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_32.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002794, "dEQP-EGL.functional.create_context_",
    "ext.gl_33.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002795, "dEQP-EGL.functional.create_context",
    "_ext.gl_33.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002796, "dEQP-EGL.functional.create_context",
    "_ext.gl_33.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002797, "dEQP-EGL.functional.create_conte",
    "xt_ext.gl_33.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002798, "dEQP-EGL.functional.create_context_",
    "ext.gl_33.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002799, "dEQP-EGL.functional.create_context",
    "_ext.gl_33.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002800, "dEQP-EGL.functional.create_context",
    "_ext.gl_33.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002801, "dEQP-EGL.functional.create_conte",
    "xt_ext.gl_33.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002802, "dEQP-EGL.functional.create_context_e",
    "xt.gl_33.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002803, "dEQP-EGL.functional.create_context_",
    "ext.gl_33.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002804, "dEQP-EGL.functional.create_context_",
    "ext.gl_33.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002805, "dEQP-EGL.functional.create_contex",
    "t_ext.gl_33.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002806, "dEQP-EGL.functional.create_context_e",
    "xt.gl_33.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002807, "dEQP-EGL.functional.create_context_",
    "ext.gl_33.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002808, "dEQP-EGL.functional.create_context_",
    "ext.gl_33.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002809, "dEQP-EGL.functional.create_contex",
    "t_ext.gl_33.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002810, "dEQP-EGL.functional.create_context_e",
    "xt.gl_33.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002811, "dEQP-EGL.functional.create_context_",
    "ext.gl_33.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002812, "dEQP-EGL.functional.create_context_",
    "ext.gl_33.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002813, "dEQP-EGL.functional.create_contex",
    "t_ext.gl_33.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002814, "dEQP-EGL.functional.create_context_ext.",
    "robust_gl_33.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002815, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_33.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002816, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_33.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002817, "dEQP-EGL.functional.create_context_e",
    "xt.robust_gl_33.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002818, "dEQP-EGL.functional.create_context_ext.",
    "robust_gl_33.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002819, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_33.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002820, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_33.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002821, "dEQP-EGL.functional.create_context_e",
    "xt.robust_gl_33.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002822, "dEQP-EGL.functional.create_context_ext.r",
    "obust_gl_33.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002823, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_33.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002824, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_33.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002825, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_33.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002826, "dEQP-EGL.functional.create_context_ext.r",
    "obust_gl_33.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002827, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_33.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002828, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_33.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002829, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_33.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002830, "dEQP-EGL.functional.create_context_ext.r",
    "obust_gl_33.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002831, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_33.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002832, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_33.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002833, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_33.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002834, "dEQP-EGL.functional.create_context_",
    "ext.gl_40.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002835, "dEQP-EGL.functional.create_context",
    "_ext.gl_40.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002836, "dEQP-EGL.functional.create_context",
    "_ext.gl_40.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002837, "dEQP-EGL.functional.create_conte",
    "xt_ext.gl_40.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002838, "dEQP-EGL.functional.create_context_",
    "ext.gl_40.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002839, "dEQP-EGL.functional.create_context",
    "_ext.gl_40.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002840, "dEQP-EGL.functional.create_context",
    "_ext.gl_40.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002841, "dEQP-EGL.functional.create_conte",
    "xt_ext.gl_40.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002842, "dEQP-EGL.functional.create_context_e",
    "xt.gl_40.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002843, "dEQP-EGL.functional.create_context_",
    "ext.gl_40.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002844, "dEQP-EGL.functional.create_context_",
    "ext.gl_40.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002845, "dEQP-EGL.functional.create_contex",
    "t_ext.gl_40.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002846, "dEQP-EGL.functional.create_context_e",
    "xt.gl_40.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002847, "dEQP-EGL.functional.create_context_",
    "ext.gl_40.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002848, "dEQP-EGL.functional.create_context_",
    "ext.gl_40.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002849, "dEQP-EGL.functional.create_contex",
    "t_ext.gl_40.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002850, "dEQP-EGL.functional.create_context_e",
    "xt.gl_40.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002851, "dEQP-EGL.functional.create_context_",
    "ext.gl_40.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002852, "dEQP-EGL.functional.create_context_",
    "ext.gl_40.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002853, "dEQP-EGL.functional.create_contex",
    "t_ext.gl_40.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002854, "dEQP-EGL.functional.create_context_ext.",
    "robust_gl_40.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002855, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_40.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002856, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_40.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002857, "dEQP-EGL.functional.create_context_e",
    "xt.robust_gl_40.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002858, "dEQP-EGL.functional.create_context_ext.",
    "robust_gl_40.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002859, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_40.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002860, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_40.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002861, "dEQP-EGL.functional.create_context_e",
    "xt.robust_gl_40.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002862, "dEQP-EGL.functional.create_context_ext.r",
    "obust_gl_40.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002863, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_40.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002864, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_40.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002865, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_40.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002866, "dEQP-EGL.functional.create_context_ext.r",
    "obust_gl_40.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002867, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_40.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002868, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_40.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002869, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_40.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002870, "dEQP-EGL.functional.create_context_ext.r",
    "obust_gl_40.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002871, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_40.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002872, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_40.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002873, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_40.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002874, "dEQP-EGL.functional.create_context_",
    "ext.gl_41.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002875, "dEQP-EGL.functional.create_context",
    "_ext.gl_41.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002876, "dEQP-EGL.functional.create_context",
    "_ext.gl_41.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002877, "dEQP-EGL.functional.create_conte",
    "xt_ext.gl_41.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002878, "dEQP-EGL.functional.create_context_",
    "ext.gl_41.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002879, "dEQP-EGL.functional.create_context",
    "_ext.gl_41.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002880, "dEQP-EGL.functional.create_context",
    "_ext.gl_41.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002881, "dEQP-EGL.functional.create_conte",
    "xt_ext.gl_41.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002882, "dEQP-EGL.functional.create_context_e",
    "xt.gl_41.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002883, "dEQP-EGL.functional.create_context_",
    "ext.gl_41.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002884, "dEQP-EGL.functional.create_context_",
    "ext.gl_41.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002885, "dEQP-EGL.functional.create_contex",
    "t_ext.gl_41.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002886, "dEQP-EGL.functional.create_context_e",
    "xt.gl_41.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002887, "dEQP-EGL.functional.create_context_",
    "ext.gl_41.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002888, "dEQP-EGL.functional.create_context_",
    "ext.gl_41.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002889, "dEQP-EGL.functional.create_contex",
    "t_ext.gl_41.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002890, "dEQP-EGL.functional.create_context_e",
    "xt.gl_41.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002891, "dEQP-EGL.functional.create_context_",
    "ext.gl_41.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002892, "dEQP-EGL.functional.create_context_",
    "ext.gl_41.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002893, "dEQP-EGL.functional.create_contex",
    "t_ext.gl_41.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002894, "dEQP-EGL.functional.create_context_ext.",
    "robust_gl_41.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002895, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_41.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002896, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_41.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002897, "dEQP-EGL.functional.create_context_e",
    "xt.robust_gl_41.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002898, "dEQP-EGL.functional.create_context_ext.",
    "robust_gl_41.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002899, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_41.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002900, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_41.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002901, "dEQP-EGL.functional.create_context_e",
    "xt.robust_gl_41.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002902, "dEQP-EGL.functional.create_context_ext.r",
    "obust_gl_41.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002903, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_41.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002904, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_41.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002905, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_41.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002906, "dEQP-EGL.functional.create_context_ext.r",
    "obust_gl_41.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002907, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_41.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002908, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_41.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002909, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_41.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002910, "dEQP-EGL.functional.create_context_ext.r",
    "obust_gl_41.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002911, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_41.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002912, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_41.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002913, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_41.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002914, "dEQP-EGL.functional.create_context_",
    "ext.gl_42.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002915, "dEQP-EGL.functional.create_context",
    "_ext.gl_42.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002916, "dEQP-EGL.functional.create_context",
    "_ext.gl_42.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002917, "dEQP-EGL.functional.create_conte",
    "xt_ext.gl_42.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002918, "dEQP-EGL.functional.create_context_",
    "ext.gl_42.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002919, "dEQP-EGL.functional.create_context",
    "_ext.gl_42.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002920, "dEQP-EGL.functional.create_context",
    "_ext.gl_42.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002921, "dEQP-EGL.functional.create_conte",
    "xt_ext.gl_42.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002922, "dEQP-EGL.functional.create_context_e",
    "xt.gl_42.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002923, "dEQP-EGL.functional.create_context_",
    "ext.gl_42.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002924, "dEQP-EGL.functional.create_context_",
    "ext.gl_42.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002925, "dEQP-EGL.functional.create_contex",
    "t_ext.gl_42.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002926, "dEQP-EGL.functional.create_context_e",
    "xt.gl_42.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002927, "dEQP-EGL.functional.create_context_",
    "ext.gl_42.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002928, "dEQP-EGL.functional.create_context_",
    "ext.gl_42.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002929, "dEQP-EGL.functional.create_contex",
    "t_ext.gl_42.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002930, "dEQP-EGL.functional.create_context_e",
    "xt.gl_42.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002931, "dEQP-EGL.functional.create_context_",
    "ext.gl_42.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002932, "dEQP-EGL.functional.create_context_",
    "ext.gl_42.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002933, "dEQP-EGL.functional.create_contex",
    "t_ext.gl_42.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002934, "dEQP-EGL.functional.create_context_ext.",
    "robust_gl_42.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002935, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_42.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002936, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_42.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002937, "dEQP-EGL.functional.create_context_e",
    "xt.robust_gl_42.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002938, "dEQP-EGL.functional.create_context_ext.",
    "robust_gl_42.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002939, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_42.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002940, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_42.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002941, "dEQP-EGL.functional.create_context_e",
    "xt.robust_gl_42.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002942, "dEQP-EGL.functional.create_context_ext.r",
    "obust_gl_42.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002943, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_42.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002944, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_42.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002945, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_42.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002946, "dEQP-EGL.functional.create_context_ext.r",
    "obust_gl_42.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002947, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_42.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002948, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_42.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002949, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_42.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002950, "dEQP-EGL.functional.create_context_ext.r",
    "obust_gl_42.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002951, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_42.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002952, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_42.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002953, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_42.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002954, "dEQP-EGL.functional.create_context_",
    "ext.gl_43.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002955, "dEQP-EGL.functional.create_context",
    "_ext.gl_43.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002956, "dEQP-EGL.functional.create_context",
    "_ext.gl_43.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002957, "dEQP-EGL.functional.create_conte",
    "xt_ext.gl_43.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002958, "dEQP-EGL.functional.create_context_",
    "ext.gl_43.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002959, "dEQP-EGL.functional.create_context",
    "_ext.gl_43.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002960, "dEQP-EGL.functional.create_context",
    "_ext.gl_43.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002961, "dEQP-EGL.functional.create_conte",
    "xt_ext.gl_43.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002962, "dEQP-EGL.functional.create_context_e",
    "xt.gl_43.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002963, "dEQP-EGL.functional.create_context_",
    "ext.gl_43.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002964, "dEQP-EGL.functional.create_context_",
    "ext.gl_43.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002965, "dEQP-EGL.functional.create_contex",
    "t_ext.gl_43.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002966, "dEQP-EGL.functional.create_context_e",
    "xt.gl_43.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002967, "dEQP-EGL.functional.create_context_",
    "ext.gl_43.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002968, "dEQP-EGL.functional.create_context_",
    "ext.gl_43.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002969, "dEQP-EGL.functional.create_contex",
    "t_ext.gl_43.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002970, "dEQP-EGL.functional.create_context_e",
    "xt.gl_43.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002971, "dEQP-EGL.functional.create_context_",
    "ext.gl_43.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002972, "dEQP-EGL.functional.create_context_",
    "ext.gl_43.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002973, "dEQP-EGL.functional.create_contex",
    "t_ext.gl_43.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002974, "dEQP-EGL.functional.create_context_ext.",
    "robust_gl_43.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002975, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_43.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002976, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_43.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002977, "dEQP-EGL.functional.create_context_e",
    "xt.robust_gl_43.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002978, "dEQP-EGL.functional.create_context_ext.",
    "robust_gl_43.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002979, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_43.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002980, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_43.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002981, "dEQP-EGL.functional.create_context_e",
    "xt.robust_gl_43.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002982, "dEQP-EGL.functional.create_context_ext.r",
    "obust_gl_43.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002983, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_43.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002984, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_43.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002985, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_43.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002986, "dEQP-EGL.functional.create_context_ext.r",
    "obust_gl_43.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002987, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_43.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002988, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_43.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002989, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_43.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002990, "dEQP-EGL.functional.create_context_ext.r",
    "obust_gl_43.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002991, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_43.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002992, "dEQP-EGL.functional.create_context_ext",
    ".robust_gl_43.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002993, "dEQP-EGL.functional.create_context_ex",
    "t.robust_gl_43.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002994, "dEQP-EGL.functional.create_context_ext.ro",
    "bust_gles_2_ext.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002995, "dEQP-EGL.functional.create_context_ext.r",
    "obust_gles_2_ext.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002996, "dEQP-EGL.functional.create_context_ext.r",
    "obust_gles_2_ext.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002997, "dEQP-EGL.functional.create_context_ext",
    ".robust_gles_2_ext.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002998, "dEQP-EGL.functional.create_context_ext.ro",
    "bust_gles_2_ext.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002999, "dEQP-EGL.functional.create_context_ext.r",
    "obust_gles_2_ext.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003000, "dEQP-EGL.functional.create_context_ext.r",
    "obust_gles_2_ext.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003001, "dEQP-EGL.functional.create_context_ext",
    ".robust_gles_2_ext.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003002, "dEQP-EGL.functional.create_context_ext.rob",
    "ust_gles_2_ext.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003003, "dEQP-EGL.functional.create_context_ext.ro",
    "bust_gles_2_ext.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003004, "dEQP-EGL.functional.create_context_ext.ro",
    "bust_gles_2_ext.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003005, "dEQP-EGL.functional.create_context_ext.",
    "robust_gles_2_ext.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003006, "dEQP-EGL.functional.create_context_ext.rob",
    "ust_gles_2_ext.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003007, "dEQP-EGL.functional.create_context_ext.ro",
    "bust_gles_2_ext.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003008, "dEQP-EGL.functional.create_context_ext.ro",
    "bust_gles_2_ext.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003009, "dEQP-EGL.functional.create_context_ext.",
    "robust_gles_2_ext.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003010, "dEQP-EGL.functional.create_context_ext.rob",
    "ust_gles_2_ext.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003011, "dEQP-EGL.functional.create_context_ext.ro",
    "bust_gles_2_ext.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003012, "dEQP-EGL.functional.create_context_ext.ro",
    "bust_gles_2_ext.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003013, "dEQP-EGL.functional.create_context_ext.",
    "robust_gles_2_ext.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003014, "dEQP-EGL.functional.create_context_ext.ro",
    "bust_gles_3_ext.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003015, "dEQP-EGL.functional.create_context_ext.r",
    "obust_gles_3_ext.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003016, "dEQP-EGL.functional.create_context_ext.r",
    "obust_gles_3_ext.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003017, "dEQP-EGL.functional.create_context_ext",
    ".robust_gles_3_ext.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003018, "dEQP-EGL.functional.create_context_ext.ro",
    "bust_gles_3_ext.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003019, "dEQP-EGL.functional.create_context_ext.r",
    "obust_gles_3_ext.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003020, "dEQP-EGL.functional.create_context_ext.r",
    "obust_gles_3_ext.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003021, "dEQP-EGL.functional.create_context_ext",
    ".robust_gles_3_ext.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003022, "dEQP-EGL.functional.create_context_ext.rob",
    "ust_gles_3_ext.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003023, "dEQP-EGL.functional.create_context_ext.ro",
    "bust_gles_3_ext.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003024, "dEQP-EGL.functional.create_context_ext.ro",
    "bust_gles_3_ext.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003025, "dEQP-EGL.functional.create_context_ext.",
    "robust_gles_3_ext.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003026, "dEQP-EGL.functional.create_context_ext.rob",
    "ust_gles_3_ext.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003027, "dEQP-EGL.functional.create_context_ext.ro",
    "bust_gles_3_ext.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003028, "dEQP-EGL.functional.create_context_ext.ro",
    "bust_gles_3_ext.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003029, "dEQP-EGL.functional.create_context_ext.",
    "robust_gles_3_ext.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003030, "dEQP-EGL.functional.create_context_ext.rob",
    "ust_gles_3_ext.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003031, "dEQP-EGL.functional.create_context_ext.ro",
    "bust_gles_3_ext.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003032, "dEQP-EGL.functional.create_context_ext.ro",
    "bust_gles_3_ext.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003033, "dEQP-EGL.functional.create_context_ext.",
    "robust_gles_3_ext.rgba8888_depth_stencil");
