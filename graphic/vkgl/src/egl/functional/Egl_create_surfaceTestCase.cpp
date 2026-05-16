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

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000093, "dEQP-EGL.functional.create_sur""face",
    ".window.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000094, "dEQP-EGL.functional.create_surfa",
    "ce.window.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000095, "dEQP-EGL.functional.create_surfa",
    "ce.window.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000096, "dEQP-EGL.functional.create_surf",
    "ace.window.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000097, "dEQP-EGL.functional.create_sur""face",
    ".window.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000098, "dEQP-EGL.functional.create_surfa",
    "ce.window.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000099, "dEQP-EGL.functional.create_surfa",
    "ce.window.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000100, "dEQP-EGL.functional.create_surf",
    "ace.window.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000101, "dEQP-EGL.functional.create_sur""face.",
    "window.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000102, "dEQP-EGL.functional.create_surfac",
    "e.window.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000103, "dEQP-EGL.functional.create_surfac",
    "e.window.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000104, "dEQP-EGL.functional.create_surfa",
    "ce.window.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000105, "dEQP-EGL.functional.create_sur""face.",
    "window.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000106, "dEQP-EGL.functional.create_surfac",
    "e.window.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000107, "dEQP-EGL.functional.create_surfac",
    "e.window.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000108, "dEQP-EGL.functional.create_surfa",
    "ce.window.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000109, "dEQP-EGL.functional.create_sur""face.",
    "window.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000110, "dEQP-EGL.functional.create_surfac",
    "e.window.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000111, "dEQP-EGL.functional.create_surfac",
    "e.window.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000112, "dEQP-EGL.functional.create_surfa",
    "ce.window.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000113, "dEQP-EGL.functional.create_sur",
    "face.window.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000114, "dEQP-EGL.functional.create_sur""face",
    ".pixmap.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000115, "dEQP-EGL.functional.create_surfa",
    "ce.pixmap.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000116, "dEQP-EGL.functional.create_surfa",
    "ce.pixmap.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000117, "dEQP-EGL.functional.create_surf",
    "ace.pixmap.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000118, "dEQP-EGL.functional.create_sur""face",
    ".pixmap.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000119, "dEQP-EGL.functional.create_surfa",
    "ce.pixmap.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000120, "dEQP-EGL.functional.create_surfa",
    "ce.pixmap.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000121, "dEQP-EGL.functional.create_surf",
    "ace.pixmap.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000122, "dEQP-EGL.functional.create_sur""face.",
    "pixmap.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000123, "dEQP-EGL.functional.create_surfac",
    "e.pixmap.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000124, "dEQP-EGL.functional.create_surfac",
    "e.pixmap.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000125, "dEQP-EGL.functional.create_surfa",
    "ce.pixmap.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000126, "dEQP-EGL.functional.create_sur""face.",
    "pixmap.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000127, "dEQP-EGL.functional.create_surfac",
    "e.pixmap.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000128, "dEQP-EGL.functional.create_surfac",
    "e.pixmap.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000129, "dEQP-EGL.functional.create_surfa",
    "ce.pixmap.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000130, "dEQP-EGL.functional.create_sur""face.",
    "pixmap.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000131, "dEQP-EGL.functional.create_surfac",
    "e.pixmap.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000132, "dEQP-EGL.functional.create_surfac",
    "e.pixmap.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000133, "dEQP-EGL.functional.create_surfa",
    "ce.pixmap.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000134, "dEQP-EGL.functional.create_sur",
    "face.pixmap.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000135, "dEQP-EGL.functional.create_sur""face",
    ".pbuffer.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000136, "dEQP-EGL.functional.create_surfac",
    "e.pbuffer.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000137, "dEQP-EGL.functional.create_surfac",
    "e.pbuffer.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000138, "dEQP-EGL.functional.create_surf",
    "ace.pbuffer.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000139, "dEQP-EGL.functional.create_sur""face",
    ".pbuffer.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000140, "dEQP-EGL.functional.create_surfac",
    "e.pbuffer.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000141, "dEQP-EGL.functional.create_surfac",
    "e.pbuffer.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000142, "dEQP-EGL.functional.create_surf",
    "ace.pbuffer.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000143, "dEQP-EGL.functional.create_sur""face.",
    "pbuffer.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000144, "dEQP-EGL.functional.create_sur""face",
    ".pbuffer.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000145, "dEQP-EGL.functional.create_sur""face",
    ".pbuffer.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000146, "dEQP-EGL.functional.create_surfa",
    "ce.pbuffer.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000147, "dEQP-EGL.functional.create_sur""face.",
    "pbuffer.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000148, "dEQP-EGL.functional.create_sur""face",
    ".pbuffer.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000149, "dEQP-EGL.functional.create_sur""face",
    ".pbuffer.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000150, "dEQP-EGL.functional.create_surfa",
    "ce.pbuffer.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000151, "dEQP-EGL.functional.create_sur""face.",
    "pbuffer.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000152, "dEQP-EGL.functional.create_sur""face",
    ".pbuffer.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000153, "dEQP-EGL.functional.create_sur""face",
    ".pbuffer.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000154, "dEQP-EGL.functional.create_surfa",
    "ce.pbuffer.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000155, "dEQP-EGL.functional.create_sur",
    "face.pbuffer.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000156, "dEQP-EGL.functional.create_sur""face.platf",
    "orm_ext_window.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000157, "dEQP-EGL.functional.create_sur""face.plat",
    "form_ext_window.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000158, "dEQP-EGL.functional.create_sur""face.plat",
    "form_ext_window.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000159, "dEQP-EGL.functional.create_sur""face.pl",
    "atform_ext_window.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000160, "dEQP-EGL.functional.create_sur""face.platf",
    "orm_ext_window.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000161, "dEQP-EGL.functional.create_sur""face.plat",
    "form_ext_window.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000162, "dEQP-EGL.functional.create_sur""face.plat",
    "form_ext_window.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000163, "dEQP-EGL.functional.create_sur""face.pl",
    "atform_ext_window.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000164, "dEQP-EGL.functional.create_sur""face.platfo",
    "rm_ext_window.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000165, "dEQP-EGL.functional.create_sur""face.platf",
    "orm_ext_window.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000166, "dEQP-EGL.functional.create_sur""face.platf",
    "orm_ext_window.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000167, "dEQP-EGL.functional.create_sur""face.pla",
    "tform_ext_window.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000168, "dEQP-EGL.functional.create_sur""face.platfo",
    "rm_ext_window.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000169, "dEQP-EGL.functional.create_sur""face.platf",
    "orm_ext_window.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000170, "dEQP-EGL.functional.create_sur""face.platf",
    "orm_ext_window.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000171, "dEQP-EGL.functional.create_sur""face.pla",
    "tform_ext_window.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000172, "dEQP-EGL.functional.create_sur""face.platfo",
    "rm_ext_window.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000173, "dEQP-EGL.functional.create_sur""face.platf",
    "orm_ext_window.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000174, "dEQP-EGL.functional.create_sur""face.platf",
    "orm_ext_window.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000175, "dEQP-EGL.functional.create_sur""face.pla",
    "tform_ext_window.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000176, "dEQP-EGL.functional.create_sur",
    "face.platform_ext_window.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000177, "dEQP-EGL.functional.create_sur""face.platf",
    "orm_ext_pixmap.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000178, "dEQP-EGL.functional.create_sur""face.plat",
    "form_ext_pixmap.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000179, "dEQP-EGL.functional.create_sur""face.plat",
    "form_ext_pixmap.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000180, "dEQP-EGL.functional.create_sur""face.pl",
    "atform_ext_pixmap.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000181, "dEQP-EGL.functional.create_sur""face.platf",
    "orm_ext_pixmap.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000182, "dEQP-EGL.functional.create_sur""face.plat",
    "form_ext_pixmap.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000183, "dEQP-EGL.functional.create_sur""face.plat",
    "form_ext_pixmap.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000184, "dEQP-EGL.functional.create_sur""face.pl",
    "atform_ext_pixmap.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000185, "dEQP-EGL.functional.create_sur""face.platfo",
    "rm_ext_pixmap.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000186, "dEQP-EGL.functional.create_sur""face.platf",
    "orm_ext_pixmap.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000187, "dEQP-EGL.functional.create_sur""face.platf",
    "orm_ext_pixmap.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000188, "dEQP-EGL.functional.create_sur""face.pla",
    "tform_ext_pixmap.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000189, "dEQP-EGL.functional.create_sur""face.platfo",
    "rm_ext_pixmap.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000190, "dEQP-EGL.functional.create_sur""face.platf",
    "orm_ext_pixmap.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000191, "dEQP-EGL.functional.create_sur""face.platf",
    "orm_ext_pixmap.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000192, "dEQP-EGL.functional.create_sur""face.pla",
    "tform_ext_pixmap.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000193, "dEQP-EGL.functional.create_sur""face.platfo",
    "rm_ext_pixmap.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000194, "dEQP-EGL.functional.create_sur""face.platf",
    "orm_ext_pixmap.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000195, "dEQP-EGL.functional.create_sur""face.platf",
    "orm_ext_pixmap.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000196, "dEQP-EGL.functional.create_sur""face.pla",
    "tform_ext_pixmap.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000197, "dEQP-EGL.functional.create_sur",
    "face.platform_ext_pixmap.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000198, "dEQP-EGL.functional.create_sur""face.pla",
    "tform_window.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000199, "dEQP-EGL.functional.create_sur""face.pl",
    "atform_window.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000200, "dEQP-EGL.functional.create_sur""face.pl",
    "atform_window.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000201, "dEQP-EGL.functional.create_sur""face.",
    "platform_window.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000202, "dEQP-EGL.functional.create_sur""face.pla",
    "tform_window.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000203, "dEQP-EGL.functional.create_sur""face.pl",
    "atform_window.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000204, "dEQP-EGL.functional.create_sur""face.pl",
    "atform_window.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000205, "dEQP-EGL.functional.create_sur""face.",
    "platform_window.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000206, "dEQP-EGL.functional.create_sur""face.plat",
    "form_window.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000207, "dEQP-EGL.functional.create_sur""face.pla",
    "tform_window.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000208, "dEQP-EGL.functional.create_sur""face.pla",
    "tform_window.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000209, "dEQP-EGL.functional.create_sur""face.p",
    "latform_window.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000210, "dEQP-EGL.functional.create_sur""face.plat",
    "form_window.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000211, "dEQP-EGL.functional.create_sur""face.pla",
    "tform_window.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000212, "dEQP-EGL.functional.create_sur""face.pla",
    "tform_window.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000213, "dEQP-EGL.functional.create_sur""face.p",
    "latform_window.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000214, "dEQP-EGL.functional.create_sur""face.plat",
    "form_window.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000215, "dEQP-EGL.functional.create_sur""face.pla",
    "tform_window.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000216, "dEQP-EGL.functional.create_sur""face.pla",
    "tform_window.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000217, "dEQP-EGL.functional.create_sur""face.p",
    "latform_window.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000218, "dEQP-EGL.functional.create_sur""face.platf",
    "orm_window.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000219, "dEQP-EGL.functional.create_sur""face.pla",
    "tform_pixmap.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000220, "dEQP-EGL.functional.create_sur""face.pl",
    "atform_pixmap.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000221, "dEQP-EGL.functional.create_sur""face.pl",
    "atform_pixmap.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000222, "dEQP-EGL.functional.create_sur""face.",
    "platform_pixmap.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000223, "dEQP-EGL.functional.create_sur""face.pla",
    "tform_pixmap.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000224, "dEQP-EGL.functional.create_sur""face.pl",
    "atform_pixmap.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000225, "dEQP-EGL.functional.create_sur""face.pl",
    "atform_pixmap.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000226, "dEQP-EGL.functional.create_sur""face.",
    "platform_pixmap.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000227, "dEQP-EGL.functional.create_sur""face.plat",
    "form_pixmap.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000228, "dEQP-EGL.functional.create_sur""face.pla",
    "tform_pixmap.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000229, "dEQP-EGL.functional.create_sur""face.pla",
    "tform_pixmap.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000230, "dEQP-EGL.functional.create_sur""face.p",
    "latform_pixmap.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000231, "dEQP-EGL.functional.create_sur""face.plat",
    "form_pixmap.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000232, "dEQP-EGL.functional.create_sur""face.pla",
    "tform_pixmap.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000233, "dEQP-EGL.functional.create_sur""face.pla",
    "tform_pixmap.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000234, "dEQP-EGL.functional.create_sur""face.p",
    "latform_pixmap.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000235, "dEQP-EGL.functional.create_sur""face.plat",
    "form_pixmap.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000236, "dEQP-EGL.functional.create_sur""face.pla",
    "tform_pixmap.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000237, "dEQP-EGL.functional.create_sur""face.pla",
    "tform_pixmap.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000238, "dEQP-EGL.functional.create_sur""face.p",
    "latform_pixmap.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000239, "dEQP-EGL.functional.create_sur""face.platf",
    "orm_pixmap.other");
