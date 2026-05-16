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

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000240, "dEQP-EGL.functional.query_sur""face.sim",
    "ple.window.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000241, "dEQP-EGL.functional.query_sur""face.s",
    "imple.window.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000242, "dEQP-EGL.functional.query_sur""face.s",
    "imple.window.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000243, "dEQP-EGL.functional.query_sur""face.",
    "simple.window.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000244, "dEQP-EGL.functional.query_sur""face.sim",
    "ple.window.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000245, "dEQP-EGL.functional.query_sur""face.s",
    "imple.window.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000246, "dEQP-EGL.functional.query_sur""face.s",
    "imple.window.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000247, "dEQP-EGL.functional.query_sur""face.",
    "simple.window.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000248, "dEQP-EGL.functional.query_sur""face.simp",
    "le.window.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000249, "dEQP-EGL.functional.query_sur""face.si",
    "mple.window.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000250, "dEQP-EGL.functional.query_sur""face.si",
    "mple.window.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000251, "dEQP-EGL.functional.query_sur""face.s",
    "imple.window.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000252, "dEQP-EGL.functional.query_sur""face.simp",
    "le.window.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000253, "dEQP-EGL.functional.query_sur""face.si",
    "mple.window.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000254, "dEQP-EGL.functional.query_sur""face.si",
    "mple.window.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000255, "dEQP-EGL.functional.query_sur""face.s",
    "imple.window.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000256, "dEQP-EGL.functional.query_sur""face.simp",
    "le.window.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000257, "dEQP-EGL.functional.query_sur""face.si",
    "mple.window.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000258, "dEQP-EGL.functional.query_sur""face.si",
    "mple.window.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000259, "dEQP-EGL.functional.query_sur""face.s",
    "imple.window.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000260, "dEQP-EGL.functional.query_sur""face.si",
    "mple.window.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000261, "dEQP-EGL.functional.query_sur""face.sim",
    "ple.pixmap.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000262, "dEQP-EGL.functional.query_sur""face.s",
    "imple.pixmap.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000263, "dEQP-EGL.functional.query_sur""face.s",
    "imple.pixmap.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000264, "dEQP-EGL.functional.query_sur""face.",
    "simple.pixmap.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000265, "dEQP-EGL.functional.query_sur""face.sim",
    "ple.pixmap.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000266, "dEQP-EGL.functional.query_sur""face.s",
    "imple.pixmap.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000267, "dEQP-EGL.functional.query_sur""face.s",
    "imple.pixmap.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000268, "dEQP-EGL.functional.query_sur""face.",
    "simple.pixmap.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000269, "dEQP-EGL.functional.query_sur""face.simp",
    "le.pixmap.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000270, "dEQP-EGL.functional.query_sur""face.si",
    "mple.pixmap.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000271, "dEQP-EGL.functional.query_sur""face.si",
    "mple.pixmap.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000272, "dEQP-EGL.functional.query_sur""face.s",
    "imple.pixmap.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000273, "dEQP-EGL.functional.query_sur""face.simp",
    "le.pixmap.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000274, "dEQP-EGL.functional.query_sur""face.si",
    "mple.pixmap.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000275, "dEQP-EGL.functional.query_sur""face.si",
    "mple.pixmap.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000276, "dEQP-EGL.functional.query_sur""face.s",
    "imple.pixmap.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000277, "dEQP-EGL.functional.query_sur""face.simp",
    "le.pixmap.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000278, "dEQP-EGL.functional.query_sur""face.si",
    "mple.pixmap.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000279, "dEQP-EGL.functional.query_sur""face.si",
    "mple.pixmap.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000280, "dEQP-EGL.functional.query_sur""face.s",
    "imple.pixmap.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000281, "dEQP-EGL.functional.query_sur""face.sim",
    "ple.pixmap.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000282, "dEQP-EGL.functional.query_sur""face.sim",
    "ple.pbuffer.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000283, "dEQP-EGL.functional.query_sur""face.si",
    "mple.pbuffer.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000284, "dEQP-EGL.functional.query_sur""face.si",
    "mple.pbuffer.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000285, "dEQP-EGL.functional.query_sur""face.",
    "simple.pbuffer.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000286, "dEQP-EGL.functional.query_sur""face.sim",
    "ple.pbuffer.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000287, "dEQP-EGL.functional.query_sur""face.si",
    "mple.pbuffer.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000288, "dEQP-EGL.functional.query_sur""face.si",
    "mple.pbuffer.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000289, "dEQP-EGL.functional.query_sur""face.",
    "simple.pbuffer.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000290, "dEQP-EGL.functional.query_sur""face.simp",
    "le.pbuffer.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000291, "dEQP-EGL.functional.query_sur""face.sim",
    "ple.pbuffer.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000292, "dEQP-EGL.functional.query_sur""face.sim",
    "ple.pbuffer.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000293, "dEQP-EGL.functional.query_sur""face.s",
    "imple.pbuffer.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000294, "dEQP-EGL.functional.query_sur""face.simp",
    "le.pbuffer.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000295, "dEQP-EGL.functional.query_sur""face.sim",
    "ple.pbuffer.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000296, "dEQP-EGL.functional.query_sur""face.sim",
    "ple.pbuffer.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000297, "dEQP-EGL.functional.query_sur""face.s",
    "imple.pbuffer.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000298, "dEQP-EGL.functional.query_sur""face.simp",
    "le.pbuffer.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000299, "dEQP-EGL.functional.query_sur""face.sim",
    "ple.pbuffer.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000300, "dEQP-EGL.functional.query_sur""face.sim",
    "ple.pbuffer.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000301, "dEQP-EGL.functional.query_sur""face.s",
    "imple.pbuffer.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000302, "dEQP-EGL.functional.query_sur""face.simple",
    ".pbuffer.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000303, "dEQP-EGL.functional.query_sur""face.set_at",
    "tribute.window.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000304, "dEQP-EGL.functional.query_sur""face.set_a",
    "ttribute.window.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000305, "dEQP-EGL.functional.query_sur""face.set_a",
    "ttribute.window.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000306, "dEQP-EGL.functional.query_sur""face.set",
    "_attribute.window.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000307, "dEQP-EGL.functional.query_sur""face.set_at",
    "tribute.window.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000308, "dEQP-EGL.functional.query_sur""face.set_a",
    "ttribute.window.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000309, "dEQP-EGL.functional.query_sur""face.set_a",
    "ttribute.window.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000310, "dEQP-EGL.functional.query_sur""face.set",
    "_attribute.window.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000311, "dEQP-EGL.functional.query_sur""face.set_att",
    "ribute.window.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000312, "dEQP-EGL.functional.query_sur""face.set_at",
    "tribute.window.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000313, "dEQP-EGL.functional.query_sur""face.set_at",
    "tribute.window.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000314, "dEQP-EGL.functional.query_sur""face.set_",
    "attribute.window.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000315, "dEQP-EGL.functional.query_sur""face.set_att",
    "ribute.window.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000316, "dEQP-EGL.functional.query_sur""face.set_at",
    "tribute.window.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000317, "dEQP-EGL.functional.query_sur""face.set_at",
    "tribute.window.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000318, "dEQP-EGL.functional.query_sur""face.set_",
    "attribute.window.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000319, "dEQP-EGL.functional.query_sur""face.set_att",
    "ribute.window.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000320, "dEQP-EGL.functional.query_sur""face.set_at",
    "tribute.window.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000321, "dEQP-EGL.functional.query_sur""face.set_at",
    "tribute.window.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000322, "dEQP-EGL.functional.query_sur""face.set_",
    "attribute.window.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000323, "dEQP-EGL.functional.query_surf",
    "ace.set_attribute.window.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000324, "dEQP-EGL.functional.query_sur""face.set_at",
    "tribute.pixmap.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000325, "dEQP-EGL.functional.query_sur""face.set_a",
    "ttribute.pixmap.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000326, "dEQP-EGL.functional.query_sur""face.set_a",
    "ttribute.pixmap.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000327, "dEQP-EGL.functional.query_sur""face.set",
    "_attribute.pixmap.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000328, "dEQP-EGL.functional.query_sur""face.set_at",
    "tribute.pixmap.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000329, "dEQP-EGL.functional.query_sur""face.set_a",
    "ttribute.pixmap.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000330, "dEQP-EGL.functional.query_sur""face.set_a",
    "ttribute.pixmap.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000331, "dEQP-EGL.functional.query_sur""face.set",
    "_attribute.pixmap.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000332, "dEQP-EGL.functional.query_sur""face.set_att",
    "ribute.pixmap.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000333, "dEQP-EGL.functional.query_sur""face.set_at",
    "tribute.pixmap.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000334, "dEQP-EGL.functional.query_sur""face.set_at",
    "tribute.pixmap.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000335, "dEQP-EGL.functional.query_sur""face.set_",
    "attribute.pixmap.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000336, "dEQP-EGL.functional.query_sur""face.set_att",
    "ribute.pixmap.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000337, "dEQP-EGL.functional.query_sur""face.set_at",
    "tribute.pixmap.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000338, "dEQP-EGL.functional.query_sur""face.set_at",
    "tribute.pixmap.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000339, "dEQP-EGL.functional.query_sur""face.set_",
    "attribute.pixmap.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000340, "dEQP-EGL.functional.query_sur""face.set_att",
    "ribute.pixmap.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000341, "dEQP-EGL.functional.query_sur""face.set_at",
    "tribute.pixmap.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000342, "dEQP-EGL.functional.query_sur""face.set_at",
    "tribute.pixmap.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000343, "dEQP-EGL.functional.query_sur""face.set_",
    "attribute.pixmap.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000344, "dEQP-EGL.functional.query_surf",
    "ace.set_attribute.pixmap.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000345, "dEQP-EGL.functional.query_sur""face.set_att",
    "ribute.pbuffer.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000346, "dEQP-EGL.functional.query_sur""face.set_a",
    "ttribute.pbuffer.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000347, "dEQP-EGL.functional.query_sur""face.set_a",
    "ttribute.pbuffer.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000348, "dEQP-EGL.functional.query_sur""face.set_",
    "attribute.pbuffer.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000349, "dEQP-EGL.functional.query_sur""face.set_att",
    "ribute.pbuffer.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000350, "dEQP-EGL.functional.query_sur""face.set_a",
    "ttribute.pbuffer.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000351, "dEQP-EGL.functional.query_sur""face.set_a",
    "ttribute.pbuffer.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000352, "dEQP-EGL.functional.query_sur""face.set_",
    "attribute.pbuffer.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000353, "dEQP-EGL.functional.query_sur""face.set_attr",
    "ibute.pbuffer.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000354, "dEQP-EGL.functional.query_sur""face.set_at",
    "tribute.pbuffer.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000355, "dEQP-EGL.functional.query_sur""face.set_at",
    "tribute.pbuffer.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000356, "dEQP-EGL.functional.query_sur""face.set_a",
    "ttribute.pbuffer.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000357, "dEQP-EGL.functional.query_sur""face.set_attr",
    "ibute.pbuffer.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000358, "dEQP-EGL.functional.query_sur""face.set_at",
    "tribute.pbuffer.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000359, "dEQP-EGL.functional.query_sur""face.set_at",
    "tribute.pbuffer.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000360, "dEQP-EGL.functional.query_sur""face.set_a",
    "ttribute.pbuffer.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000361, "dEQP-EGL.functional.query_sur""face.set_attr",
    "ibute.pbuffer.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000362, "dEQP-EGL.functional.query_sur""face.set_at",
    "tribute.pbuffer.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000363, "dEQP-EGL.functional.query_sur""face.set_at",
    "tribute.pbuffer.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000364, "dEQP-EGL.functional.query_sur""face.set_a",
    "ttribute.pbuffer.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000365, "dEQP-EGL.functional.query_surf",
    "ace.set_attribute.pbuffer.other");
