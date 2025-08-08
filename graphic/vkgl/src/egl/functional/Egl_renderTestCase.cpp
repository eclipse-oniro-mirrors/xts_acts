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

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000825, "dEQP-EGL.functional.render.sin",
    "gle_context.gles2.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000826, "dEQP-EGL.functional.render.sin",
    "gle_context.gles2.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000827, "dEQP-EGL.functional.render.sing",
    "le_context.gles2.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000828, "dEQP-EGL.functional.render.sin",
    "gle_context.gles2.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000829, "dEQP-EGL.functional.render.sin",
    "gle_context.gles2.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000830, "dEQP-EGL.functional.render.sing",
    "le_context.gles2.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000831, "dEQP-EGL.functional.render.sing",
    "le_context.gles2.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000832, "dEQP-EGL.functional.render.sing",
    "le_context.gles2.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000833, "dEQP-EGL.functional.render.singl",
    "e_context.gles2.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000834, "dEQP-EGL.functional.render.sing",
    "le_context.gles2.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000835, "dEQP-EGL.functional.render.sing",
    "le_context.gles2.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000836, "dEQP-EGL.functional.render.singl",
    "e_context.gles2.rgba5551_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000837, "dEQP-EGL.functional.render.sing",
    "le_context.gles2.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000838, "dEQP-EGL.functional.render.sing",
    "le_context.gles2.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000839, "dEQP-EGL.functional.render.singl",
    "e_context.gles2.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000840, "dEQP-EGL.functional.render.sing",
    "le_context.gles2.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000841, "dEQP-EGL.functional.render.sin",
    "gle_context.gles3.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000842, "dEQP-EGL.functional.render.sin",
    "gle_context.gles3.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000843, "dEQP-EGL.functional.render.sing",
    "le_context.gles3.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000844, "dEQP-EGL.functional.render.sin",
    "gle_context.gles3.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000845, "dEQP-EGL.functional.render.sin",
    "gle_context.gles3.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000846, "dEQP-EGL.functional.render.sing",
    "le_context.gles3.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000847, "dEQP-EGL.functional.render.sing",
    "le_context.gles3.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000848, "dEQP-EGL.functional.render.sing",
    "le_context.gles3.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000849, "dEQP-EGL.functional.render.singl",
    "e_context.gles3.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000850, "dEQP-EGL.functional.render.sing",
    "le_context.gles3.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000851, "dEQP-EGL.functional.render.sing",
    "le_context.gles3.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000852, "dEQP-EGL.functional.render.singl",
    "e_context.gles3.rgba5551_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000853, "dEQP-EGL.functional.render.sing",
    "le_context.gles3.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000854, "dEQP-EGL.functional.render.sing",
    "le_context.gles3.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000855, "dEQP-EGL.functional.render.singl",
    "e_context.gles3.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000856, "dEQP-EGL.functional.render.sing",
    "le_context.gles3.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000857, "dEQP-EGL.functional.render.mul",
    "ti_context.gles2.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000858, "dEQP-EGL.functional.render.mul",
    "ti_context.gles2.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000859, "dEQP-EGL.functional.render.mul",
    "ti_context.gles2.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000860, "dEQP-EGL.functional.render.mul",
    "ti_context.gles2.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000861, "dEQP-EGL.functional.render.mul",
    "ti_context.gles2.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000862, "dEQP-EGL.functional.render.mul",
    "ti_context.gles2.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000863, "dEQP-EGL.functional.render.mult",
    "i_context.gles2.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000864, "dEQP-EGL.functional.render.mult",
    "i_context.gles2.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000865, "dEQP-EGL.functional.render.mult",
    "i_context.gles2.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000866, "dEQP-EGL.functional.render.mult",
    "i_context.gles2.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000867, "dEQP-EGL.functional.render.mult",
    "i_context.gles2.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000868, "dEQP-EGL.functional.render.mult",
    "i_context.gles2.rgba5551_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000869, "dEQP-EGL.functional.render.mult",
    "i_context.gles2.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000870, "dEQP-EGL.functional.render.mult",
    "i_context.gles2.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000871, "dEQP-EGL.functional.render.mult",
    "i_context.gles2.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000872, "dEQP-EGL.functional.render.mult",
    "i_context.gles2.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000873, "dEQP-EGL.functional.render.mul",
    "ti_context.gles3.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000874, "dEQP-EGL.functional.render.mul",
    "ti_context.gles3.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000875, "dEQP-EGL.functional.render.mul",
    "ti_context.gles3.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000876, "dEQP-EGL.functional.render.mul",
    "ti_context.gles3.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000877, "dEQP-EGL.functional.render.mul",
    "ti_context.gles3.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000878, "dEQP-EGL.functional.render.mul",
    "ti_context.gles3.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000879, "dEQP-EGL.functional.render.mult",
    "i_context.gles3.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000880, "dEQP-EGL.functional.render.mult",
    "i_context.gles3.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000881, "dEQP-EGL.functional.render.mult",
    "i_context.gles3.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000882, "dEQP-EGL.functional.render.mult",
    "i_context.gles3.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000883, "dEQP-EGL.functional.render.mult",
    "i_context.gles3.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000884, "dEQP-EGL.functional.render.mult",
    "i_context.gles3.rgba5551_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000885, "dEQP-EGL.functional.render.mult",
    "i_context.gles3.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000886, "dEQP-EGL.functional.render.mult",
    "i_context.gles3.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000887, "dEQP-EGL.functional.render.mult",
    "i_context.gles3.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000888, "dEQP-EGL.functional.render.multi_",
    "context.gles3.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000889, "dEQP-EGL.functional.render.multi_",
    "context.gles2_gles3.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000890, "dEQP-EGL.functional.render.multi_",
    "context.gles2_gles3.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000891, "dEQP-EGL.functional.render.multi_",
    "context.gles2_gles3.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000892, "dEQP-EGL.functional.render.multi_",
    "context.gles2_gles3.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000893, "dEQP-EGL.functional.render.multi_",
    "context.gles2_gles3.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000894, "dEQP-EGL.functional.render.multi_",
    "context.gles2_gles3.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000895, "dEQP-EGL.functional.render.multi_c",
    "ontext.gles2_gles3.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000896, "dEQP-EGL.functional.render.multi_c",
    "ontext.gles2_gles3.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000897, "dEQP-EGL.functional.render.multi_c",
    "ontext.gles2_gles3.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000898, "dEQP-EGL.functional.render.multi_c",
    "ontext.gles2_gles3.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000899, "dEQP-EGL.functional.render.multi_c",
    "ontext.gles2_gles3.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000900, "dEQP-EGL.functional.render.multi_c",
    "ontext.gles2_gles3.rgba5551_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000901, "dEQP-EGL.functional.render.multi_c",
    "ontext.gles2_gles3.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000902, "dEQP-EGL.functional.render.multi_c",
    "ontext.gles2_gles3.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000903, "dEQP-EGL.functional.render.multi_c",
    "ontext.gles2_gles3.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000904, "dEQP-EGL.functional.render.multi_c",
    "ontext.gles2_gles3.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000905, "dEQP-EGL.functional.render.multi_th",
    "read.gles2.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000906, "dEQP-EGL.functional.render.multi_th",
    "read.gles2.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000907, "dEQP-EGL.functional.render.mul",
    "ti_thread.gles2.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000908, "dEQP-EGL.functional.render.multi_thr",
    "ead.gles2.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000909, "dEQP-EGL.functional.render.multi_thr",
    "ead.gles2.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000910, "dEQP-EGL.functional.render.mul",
    "ti_thread.gles2.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000911, "dEQP-EGL.functional.render.mul",
    "ti_thread.gles2.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000912, "dEQP-EGL.functional.render.mul",
    "ti_thread.gles2.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000913, "dEQP-EGL.functional.render.mult",
    "i_thread.gles2.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000914, "dEQP-EGL.functional.render.mul",
    "ti_thread.gles2.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000915, "dEQP-EGL.functional.render.mul",
    "ti_thread.gles2.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000916, "dEQP-EGL.functional.render.mult",
    "i_thread.gles2.rgba5551_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000917, "dEQP-EGL.functional.render.mul",
    "ti_thread.gles2.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000918, "dEQP-EGL.functional.render.mul",
    "ti_thread.gles2.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000919, "dEQP-EGL.functional.render.mult",
    "i_thread.gles2.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000920, "dEQP-EGL.functional.render.multi_thre",
    "ad.gles2.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000921, "dEQP-EGL.functional.render.multi_thre",
    "ad.gles3.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000922, "dEQP-EGL.functional.render.multi_thre",
    "ad.gles3.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000923, "dEQP-EGL.functional.render.mul",
    "ti_thread.gles3.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000924, "dEQP-EGL.functional.render.multi_thre",
    "ad.gles3.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000925, "dEQP-EGL.functional.render.multi_thre",
    "ad.gles3.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000926, "dEQP-EGL.functional.render.mul",
    "ti_thread.gles3.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000927, "dEQP-EGL.functional.render.mul",
    "ti_thread.gles3.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000928, "dEQP-EGL.functional.render.mul",
    "ti_thread.gles3.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000929, "dEQP-EGL.functional.render.mult",
    "i_thread.gles3.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000930, "dEQP-EGL.functional.render.mul",
    "ti_thread.gles3.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000931, "dEQP-EGL.functional.render.mul",
    "ti_thread.gles3.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000932, "dEQP-EGL.functional.render.mult",
    "i_thread.gles3.rgba5551_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000933, "dEQP-EGL.functional.render.mul",
    "ti_thread.gles3.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000934, "dEQP-EGL.functional.render.mul",
    "ti_thread.gles3.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000935, "dEQP-EGL.functional.render.mult",
    "i_thread.gles3.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000936, "dEQP-EGL.functional.render.multi_thre",
    "ad.gles3.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000937, "dEQP-EGL.functional.render.multi",
    "_thread.gles2_gles3.rgb565_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000938, "dEQP-EGL.functional.render.multi",
    "_thread.gles2_gles3.rgb565_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000939, "dEQP-EGL.functional.render.multi_",
    "thread.gles2_gles3.rgb565_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000940, "dEQP-EGL.functional.render.multi",
    "_thread.gles2_gles3.rgb888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000941, "dEQP-EGL.functional.render.multi",
    "_thread.gles2_gles3.rgb888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000942, "dEQP-EGL.functional.render.multi_",
    "thread.gles2_gles3.rgb888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000943, "dEQP-EGL.functional.render.multi_",
    "thread.gles2_gles3.rgba4444_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000944, "dEQP-EGL.functional.render.multi_",
    "thread.gles2_gles3.rgba4444_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000945, "dEQP-EGL.functional.render.multi_t",
    "hread.gles2_gles3.rgba4444_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000946, "dEQP-EGL.functional.render.multi_",
    "thread.gles2_gles3.rgba5551_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000947, "dEQP-EGL.functional.render.multi_",
    "thread.gles2_gles3.rgba5551_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000948, "dEQP-EGL.functional.render.multi_t",
    "hread.gles2_gles3.rgba5551_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000949, "dEQP-EGL.functional.render.multi_",
    "thread.gles2_gles3.rgba8888_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000950, "dEQP-EGL.functional.render.multi_",
    "thread.gles2_gles3.rgba8888_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000951, "dEQP-EGL.functional.render.multi_t",
    "hread.gles2_gles3.rgba8888_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000952, "dEQP-EGL.functional.render.multi_thre",
    "ad.gles2_gles3.other");
