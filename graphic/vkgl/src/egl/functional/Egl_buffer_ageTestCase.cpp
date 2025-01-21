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

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003363, "dEQP-EGL.functional.buffer_age.pre",
    "serve.no_resize.odd_none_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003364, "dEQP-EGL.functional.buffer_age.pre",
    "serve.no_resize.odd_clear_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003365, "dEQP-EGL.functional.buffer_age.pres",
    "erve.no_resize.odd_render_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003366, "dEQP-EGL.functional.buffer_age.preser",
    "ve.no_resize.odd_clear_clear_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003367, "dEQP-EGL.functional.buffer_age.preserv",
    "e.no_resize.odd_render_render_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003368, "dEQP-EGL.functional.buffer_age.preserv",
    "e.no_resize.odd_clear_render_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003369, "dEQP-EGL.functional.buffer_age.preserv",
    "e.no_resize.odd_render_clear_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003370, "dEQP-EGL.functional.buffer_age.pres",
    "erve.no_resize.odd_clear_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003371, "dEQP-EGL.functional.buffer_age.pres",
    "erve.no_resize.odd_render_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003372, "dEQP-EGL.functional.buffer_age.preserv",
    "e.no_resize.odd_clear_clear_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003373, "dEQP-EGL.functional.buffer_age.preserve",
    ".no_resize.odd_render_render_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003374, "dEQP-EGL.functional.buffer_age.preserv",
    "e.no_resize.odd_clear_render_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003375, "dEQP-EGL.functional.buffer_age.preserv",
    "e.no_resize.odd_render_clear_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003376, "dEQP-EGL.functional.buffer_age.prese",
    "rve.no_resize.odd_render_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003377, "dEQP-EGL.functional.buffer_age.preserv",
    "e.no_resize.odd_clear_clear_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003378, "dEQP-EGL.functional.buffer_age.preserve",
    ".no_resize.odd_render_render_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003379, "dEQP-EGL.functional.buffer_age.preserve",
    ".no_resize.odd_clear_render_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003380, "dEQP-EGL.functional.buffer_age.preserve",
    ".no_resize.odd_render_clear_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003381, "dEQP-EGL.functional.buffer_age.preserve.n",
    "o_resize.odd_clear_clear_even_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003382, "dEQP-EGL.functional.buffer_age.preserve.no",
    "_resize.odd_render_render_even_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003383, "dEQP-EGL.functional.buffer_age.preserve.n",
    "o_resize.odd_clear_render_even_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003384, "dEQP-EGL.functional.buffer_age.preserve.n",
    "o_resize.odd_render_clear_even_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003385, "dEQP-EGL.functional.buffer_age.preserve.no_",
    "resize.odd_render_render_even_render_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003386, "dEQP-EGL.functional.buffer_age.preserve.no",
    "_resize.odd_clear_render_even_render_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003387, "dEQP-EGL.functional.buffer_age.preserve.no",
    "_resize.odd_render_clear_even_render_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003388, "dEQP-EGL.functional.buffer_age.preserve.no",
    "_resize.odd_clear_render_even_clear_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003389, "dEQP-EGL.functional.buffer_age.preserve.no",
    "_resize.odd_render_clear_even_clear_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003390, "dEQP-EGL.functional.buffer_age.preserve.no",
    "_resize.odd_render_clear_even_render_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003391, "dEQP-EGL.functional.buffer_age.preserv",
    "e.resize_before_swap.odd_none_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003392, "dEQP-EGL.functional.buffer_age.preserve",
    ".resize_before_swap.odd_clear_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003393, "dEQP-EGL.functional.buffer_age.preserve",
    ".resize_before_swap.odd_render_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003394, "dEQP-EGL.functional.buffer_age.preserve.re",
    "size_before_swap.odd_clear_clear_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003395, "dEQP-EGL.functional.buffer_age.preserve.res",
    "ize_before_swap.odd_render_render_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003396, "dEQP-EGL.functional.buffer_age.preserve.re",
    "size_before_swap.odd_clear_render_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003397, "dEQP-EGL.functional.buffer_age.preserve.re",
    "size_before_swap.odd_render_clear_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003398, "dEQP-EGL.functional.buffer_age.preserve",
    ".resize_before_swap.odd_clear_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003399, "dEQP-EGL.functional.buffer_age.preserve.",
    "resize_before_swap.odd_render_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003400, "dEQP-EGL.functional.buffer_age.preserve.re",
    "size_before_swap.odd_clear_clear_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003401, "dEQP-EGL.functional.buffer_age.preserve.res",
    "ize_before_swap.odd_render_render_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003402, "dEQP-EGL.functional.buffer_age.preserve.res",
    "ize_before_swap.odd_clear_render_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003403, "dEQP-EGL.functional.buffer_age.preserve.res",
    "ize_before_swap.odd_render_clear_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003404, "dEQP-EGL.functional.buffer_age.preserve.",
    "resize_before_swap.odd_render_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003405, "dEQP-EGL.functional.buffer_age.preserve.res",
    "ize_before_swap.odd_clear_clear_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003406, "dEQP-EGL.functional.buffer_age.preserve.resi",
    "ze_before_swap.odd_render_render_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003407, "dEQP-EGL.functional.buffer_age.preserve.res",
    "ize_before_swap.odd_clear_render_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003408, "dEQP-EGL.functional.buffer_age.preserve.res",
    "ize_before_swap.odd_render_clear_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003409, "dEQP-EGL.functional.buffer_age.preserve.resiz",
    "e_before_swap.odd_clear_clear_even_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003410, "dEQP-EGL.functional.buffer_age.preserve.resize",
    "_before_swap.odd_render_render_even_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003411, "dEQP-EGL.functional.buffer_age.preserve.resize",
    "_before_swap.odd_clear_render_even_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003412, "dEQP-EGL.functional.buffer_age.preserve.resize",
    "_before_swap.odd_render_clear_even_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003413, "dEQP-EGL.functional.buffer_age.preserve.resize_",
    "before_swap.odd_render_render_even_render_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003414, "dEQP-EGL.functional.buffer_age.preserve.resize_",
    "before_swap.odd_clear_render_even_render_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003415, "dEQP-EGL.functional.buffer_age.preserve.resize_",
    "before_swap.odd_render_clear_even_render_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003416, "dEQP-EGL.functional.buffer_age.preserve.resize",
    "_before_swap.odd_clear_render_even_clear_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003417, "dEQP-EGL.functional.buffer_age.preserve.resize",
    "_before_swap.odd_render_clear_even_clear_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003418, "dEQP-EGL.functional.buffer_age.preserve.resize",
    "_before_swap.odd_render_clear_even_render_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003419, "dEQP-EGL.functional.buffer_age.preserv",
    "e.resize_after_swap.odd_none_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003420, "dEQP-EGL.functional.buffer_age.preserv",
    "e.resize_after_swap.odd_clear_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003421, "dEQP-EGL.functional.buffer_age.preserve",
    ".resize_after_swap.odd_render_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003422, "dEQP-EGL.functional.buffer_age.preserve.r",
    "esize_after_swap.odd_clear_clear_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003423, "dEQP-EGL.functional.buffer_age.preserve.re",
    "size_after_swap.odd_render_render_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003424, "dEQP-EGL.functional.buffer_age.preserve.re",
    "size_after_swap.odd_clear_render_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003425, "dEQP-EGL.functional.buffer_age.preserve.re",
    "size_after_swap.odd_render_clear_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003426, "dEQP-EGL.functional.buffer_age.preserve",
    ".resize_after_swap.odd_clear_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003427, "dEQP-EGL.functional.buffer_age.preserve",
    ".resize_after_swap.odd_render_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003428, "dEQP-EGL.functional.buffer_age.preserve.re",
    "size_after_swap.odd_clear_clear_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003429, "dEQP-EGL.functional.buffer_age.preserve.res",
    "ize_after_swap.odd_render_render_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003430, "dEQP-EGL.functional.buffer_age.preserve.re",
    "size_after_swap.odd_clear_render_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003431, "dEQP-EGL.functional.buffer_age.preserve.re",
    "size_after_swap.odd_render_clear_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003432, "dEQP-EGL.functional.buffer_age.preserve.",
    "resize_after_swap.odd_render_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003433, "dEQP-EGL.functional.buffer_age.preserve.re",
    "size_after_swap.odd_clear_clear_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003434, "dEQP-EGL.functional.buffer_age.preserve.res",
    "ize_after_swap.odd_render_render_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003435, "dEQP-EGL.functional.buffer_age.preserve.res",
    "ize_after_swap.odd_clear_render_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003436, "dEQP-EGL.functional.buffer_age.preserve.res",
    "ize_after_swap.odd_render_clear_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003437, "dEQP-EGL.functional.buffer_age.preserve.resiz",
    "e_after_swap.odd_clear_clear_even_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003438, "dEQP-EGL.functional.buffer_age.preserve.resize",
    "_after_swap.odd_render_render_even_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003439, "dEQP-EGL.functional.buffer_age.preserve.resiz",
    "e_after_swap.odd_clear_render_even_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003440, "dEQP-EGL.functional.buffer_age.preserve.resiz",
    "e_after_swap.odd_render_clear_even_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003441, "dEQP-EGL.functional.buffer_age.preserve.resize_",
    "after_swap.odd_render_render_even_render_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003442, "dEQP-EGL.functional.buffer_age.preserve.resize",
    "_after_swap.odd_clear_render_even_render_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003443, "dEQP-EGL.functional.buffer_age.preserve.resize",
    "_after_swap.odd_render_clear_even_render_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003444, "dEQP-EGL.functional.buffer_age.preserve.resize",
    "_after_swap.odd_clear_render_even_clear_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003445, "dEQP-EGL.functional.buffer_age.preserve.resize",
    "_after_swap.odd_render_clear_even_clear_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003446, "dEQP-EGL.functional.buffer_age.preserve.resize",
    "_after_swap.odd_render_clear_even_render_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003447, "dEQP-EGL.functional.buffer_age.no_p",
    "reserve.no_resize.odd_none_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003448, "dEQP-EGL.functional.buffer_age.no_pr",
    "eserve.no_resize.odd_clear_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003449, "dEQP-EGL.functional.buffer_age.no_pr",
    "eserve.no_resize.odd_render_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003450, "dEQP-EGL.functional.buffer_age.no_prese",
    "rve.no_resize.odd_clear_clear_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003451, "dEQP-EGL.functional.buffer_age.no_preser",
    "ve.no_resize.odd_render_render_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003452, "dEQP-EGL.functional.buffer_age.no_prese",
    "rve.no_resize.odd_clear_render_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003453, "dEQP-EGL.functional.buffer_age.no_prese",
    "rve.no_resize.odd_render_clear_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003454, "dEQP-EGL.functional.buffer_age.no_pr",
    "eserve.no_resize.odd_clear_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003455, "dEQP-EGL.functional.buffer_age.no_pre",
    "serve.no_resize.odd_render_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003456, "dEQP-EGL.functional.buffer_age.no_prese",
    "rve.no_resize.odd_clear_clear_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003457, "dEQP-EGL.functional.buffer_age.no_preser",
    "ve.no_resize.odd_render_render_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003458, "dEQP-EGL.functional.buffer_age.no_preser",
    "ve.no_resize.odd_clear_render_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003459, "dEQP-EGL.functional.buffer_age.no_preser",
    "ve.no_resize.odd_render_clear_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003460, "dEQP-EGL.functional.buffer_age.no_pre",
    "serve.no_resize.odd_render_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003461, "dEQP-EGL.functional.buffer_age.no_preser",
    "ve.no_resize.odd_clear_clear_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003462, "dEQP-EGL.functional.buffer_age.no_preserv",
    "e.no_resize.odd_render_render_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003463, "dEQP-EGL.functional.buffer_age.no_preser",
    "ve.no_resize.odd_clear_render_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003464, "dEQP-EGL.functional.buffer_age.no_preser",
    "ve.no_resize.odd_render_clear_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003465, "dEQP-EGL.functional.buffer_age.no_preserve",
    ".no_resize.odd_clear_clear_even_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003466, "dEQP-EGL.functional.buffer_age.no_preserve.",
    "no_resize.odd_render_render_even_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003467, "dEQP-EGL.functional.buffer_age.no_preserve.",
    "no_resize.odd_clear_render_even_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003468, "dEQP-EGL.functional.buffer_age.no_preserve.",
    "no_resize.odd_render_clear_even_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003469, "dEQP-EGL.functional.buffer_age.no_preserve.n",
    "o_resize.odd_render_render_even_render_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003470, "dEQP-EGL.functional.buffer_age.no_preserve.n",
    "o_resize.odd_clear_render_even_render_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003471, "dEQP-EGL.functional.buffer_age.no_preserve.n",
    "o_resize.odd_render_clear_even_render_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003472, "dEQP-EGL.functional.buffer_age.no_preserve.",
    "no_resize.odd_clear_render_even_clear_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003473, "dEQP-EGL.functional.buffer_age.no_preserve.",
    "no_resize.odd_render_clear_even_clear_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003474, "dEQP-EGL.functional.buffer_age.no_preserve.",
    "no_resize.odd_render_clear_even_render_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003475, "dEQP-EGL.functional.buffer_age.no_preser",
    "ve.resize_before_swap.odd_none_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003476, "dEQP-EGL.functional.buffer_age.no_preser",
    "ve.resize_before_swap.odd_clear_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003477, "dEQP-EGL.functional.buffer_age.no_preserv",
    "e.resize_before_swap.odd_render_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003478, "dEQP-EGL.functional.buffer_age.no_preserve.",
    "resize_before_swap.odd_clear_clear_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003479, "dEQP-EGL.functional.buffer_age.no_preserve.r",
    "esize_before_swap.odd_render_render_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003480, "dEQP-EGL.functional.buffer_age.no_preserve.r",
    "esize_before_swap.odd_clear_render_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003481, "dEQP-EGL.functional.buffer_age.no_preserve.r",
    "esize_before_swap.odd_render_clear_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003482, "dEQP-EGL.functional.buffer_age.no_preserv",
    "e.resize_before_swap.odd_clear_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003483, "dEQP-EGL.functional.buffer_age.no_preserv",
    "e.resize_before_swap.odd_render_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003484, "dEQP-EGL.functional.buffer_age.no_preserve.r",
    "esize_before_swap.odd_clear_clear_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003485, "dEQP-EGL.functional.buffer_age.no_preserve.re",
    "size_before_swap.odd_render_render_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003486, "dEQP-EGL.functional.buffer_age.no_preserve.r",
    "esize_before_swap.odd_clear_render_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003487, "dEQP-EGL.functional.buffer_age.no_preserve.r",
    "esize_before_swap.odd_render_clear_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003488, "dEQP-EGL.functional.buffer_age.no_preserve",
    ".resize_before_swap.odd_render_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003489, "dEQP-EGL.functional.buffer_age.no_preserve.r",
    "esize_before_swap.odd_clear_clear_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003490, "dEQP-EGL.functional.buffer_age.no_preserve.re",
    "size_before_swap.odd_render_render_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003491, "dEQP-EGL.functional.buffer_age.no_preserve.re",
    "size_before_swap.odd_clear_render_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003492, "dEQP-EGL.functional.buffer_age.no_preserve.re",
    "size_before_swap.odd_render_clear_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003493, "dEQP-EGL.functional.buffer_age.no_preserve.resi",
    "ze_before_swap.odd_clear_clear_even_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003494, "dEQP-EGL.functional.buffer_age.no_preserve.resiz",
    "e_before_swap.odd_render_render_even_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003495, "dEQP-EGL.functional.buffer_age.no_preserve.resi",
    "ze_before_swap.odd_clear_render_even_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003496, "dEQP-EGL.functional.buffer_age.no_preserve.resi",
    "ze_before_swap.odd_render_clear_even_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003497, "dEQP-EGL.functional.buffer_age.no_preserve.resize",
    "_before_swap.odd_render_render_even_render_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003498, "dEQP-EGL.functional.buffer_age.no_preserve.resiz",
    "e_before_swap.odd_clear_render_even_render_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003499, "dEQP-EGL.functional.buffer_age.no_preserve.resiz",
    "e_before_swap.odd_render_clear_even_render_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003500, "dEQP-EGL.functional.buffer_age.no_preserve.resiz",
    "e_before_swap.odd_clear_render_even_clear_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003501, "dEQP-EGL.functional.buffer_age.no_preserve.resiz",
    "e_before_swap.odd_render_clear_even_clear_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003502, "dEQP-EGL.functional.buffer_age.no_preserve.resiz",
    "e_before_swap.odd_render_clear_even_render_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003503, "dEQP-EGL.functional.buffer_age.no_prese",
    "rve.resize_after_swap.odd_none_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003504, "dEQP-EGL.functional.buffer_age.no_preser",
    "ve.resize_after_swap.odd_clear_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003505, "dEQP-EGL.functional.buffer_age.no_preser",
    "ve.resize_after_swap.odd_render_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003506, "dEQP-EGL.functional.buffer_age.no_preserve.",
    "resize_after_swap.odd_clear_clear_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003507, "dEQP-EGL.functional.buffer_age.no_preserve.r",
    "esize_after_swap.odd_render_render_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003508, "dEQP-EGL.functional.buffer_age.no_preserve.",
    "resize_after_swap.odd_clear_render_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003509, "dEQP-EGL.functional.buffer_age.no_preserve.",
    "resize_after_swap.odd_render_clear_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003510, "dEQP-EGL.functional.buffer_age.no_preser",
    "ve.resize_after_swap.odd_clear_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003511, "dEQP-EGL.functional.buffer_age.no_preserv",
    "e.resize_after_swap.odd_render_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003512, "dEQP-EGL.functional.buffer_age.no_preserve.",
    "resize_after_swap.odd_clear_clear_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003513, "dEQP-EGL.functional.buffer_age.no_preserve.r",
    "esize_after_swap.odd_render_render_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003514, "dEQP-EGL.functional.buffer_age.no_preserve.r",
    "esize_after_swap.odd_clear_render_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003515, "dEQP-EGL.functional.buffer_age.no_preserve.r",
    "esize_after_swap.odd_render_clear_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003516, "dEQP-EGL.functional.buffer_age.no_preserv",
    "e.resize_after_swap.odd_render_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003517, "dEQP-EGL.functional.buffer_age.no_preserve.r",
    "esize_after_swap.odd_clear_clear_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003518, "dEQP-EGL.functional.buffer_age.no_preserve.re",
    "size_after_swap.odd_render_render_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003519, "dEQP-EGL.functional.buffer_age.no_preserve.r",
    "esize_after_swap.odd_clear_render_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003520, "dEQP-EGL.functional.buffer_age.no_preserve.r",
    "esize_after_swap.odd_render_clear_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003521, "dEQP-EGL.functional.buffer_age.no_preserve.res",
    "ize_after_swap.odd_clear_clear_even_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003522, "dEQP-EGL.functional.buffer_age.no_preserve.resi",
    "ze_after_swap.odd_render_render_even_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003523, "dEQP-EGL.functional.buffer_age.no_preserve.resi",
    "ze_after_swap.odd_clear_render_even_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003524, "dEQP-EGL.functional.buffer_age.no_preserve.resi",
    "ze_after_swap.odd_render_clear_even_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003525, "dEQP-EGL.functional.buffer_age.no_preserve.resiz",
    "e_after_swap.odd_render_render_even_render_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003526, "dEQP-EGL.functional.buffer_age.no_preserve.resiz",
    "e_after_swap.odd_clear_render_even_render_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003527, "dEQP-EGL.functional.buffer_age.no_preserve.resiz",
    "e_after_swap.odd_render_clear_even_render_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003528, "dEQP-EGL.functional.buffer_age.no_preserve.resi",
    "ze_after_swap.odd_clear_render_even_clear_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003529, "dEQP-EGL.functional.buffer_age.no_preserve.resi",
    "ze_after_swap.odd_render_clear_even_clear_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003530, "dEQP-EGL.functional.buffer_age.no_preserve.resi",
    "ze_after_swap.odd_render_clear_even_render_clear");
