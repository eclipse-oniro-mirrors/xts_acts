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
#include "../ActsEglMainUncover0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000258,
        "dEQP-EGL.functional.get_proc_addre",
        "ss.extension.egl_and1roid_blob_cache");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000259,
        "dEQP-EGL.functional.get_proc_address.extens",
        "ion.egl_and1roid_create_native_client_buffer");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000260,
        "dEQP-EGL.functional.get_proc_address.exte",
        "nsion.egl_and1roid_get_native_client_buffer");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000261,
        "dEQP-EGL.functional.get_proc_address.e",
        "xtension.egl_and1roid_native_fence_sync");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000262,
        "dEQP-EGL.functional.get_proc_address.e",
        "xtension.egl_and1roid_presentation_time");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000263,
        "dEQP-EGL.functional.get_proc_address.ex",
        "tension.egl_and1roid_get_frame_timestamps");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000264,
        "dEQP-EGL.functional.get_proc_address.ex",
        "tension.egl_angle_query_surface_pointer");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000265,
        "dEQP-EGL.functional.get_proc_address.",
        "extension.egl_angle_sync_control_rate");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000266,
        "dEQP-EGL.functional.get_proc_addr",
        "ess.extension.egl_khr_lock_surface");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000267,
        "dEQP-EGL.functional.get_proc_addre",
        "ss.extension.egl_khr_lock_surface3");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000268,
        "dEQP-EGL.functional.get_proc_address.ext",
        "ension.egl_khr_stream_producer_eglsurface");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000269,
        "dEQP-EGL.functional.get_proc_addre",
        "ss.extension.egl_mesa_query_driver");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000270,
        "dEQP-EGL.functional.get_proc_address.ex",
        "tension.egl_nv_stream_consumer_eglimage");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000271,
        "dEQP-EGL.functional.get_proc_",
        "address.extension.egl_nv_sync");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000272,
        "dEQP-EGL.functional.get_proc_address.",
        "extension.egl_ext_surface_compression");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000273,
        "dEQP-EGL.functional.get_proc_address.",
        "extension.egl_wl_bind_wayland_display");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000274,
        "dEQP-EGL.functional.get_proc_address.extens",
        "ion.egl_wl_create_wayland_buffer_from_image");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000275,
        "dEQP-EGL.functional.get_proc_address.",
        "extension.egl_ext_device_persistent_id");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000276,
        "dEQP-EGL.functional.get_proc_address.",
        "extension.gl_ext_fragment_shading_rate");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000277,
        "dEQP-EGL.functional.get_proc_address.ext",
        "ension.gl_ext_texture_storage_compression");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000278,
        "dEQP-EGL.functional.get_proc_addres",
        "s.extension.gl_nv_timeline_semaphore");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000279,
        "dEQP-EGL.functional.get_proc_address",
        ".extension.gl_mesa_framebuffer_flip_y");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000280,
        "dEQP-EGL.functional.get_proc_address",
        ".extension.gl_nv_memory_object_sparse");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000281,
        "dEQP-EGL.functional.get_proc_address",
        ".extension.gl_qcom_motion_estimation");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000282,
        "dEQP-EGL.functional.get_proc_address.",
        "extension.gl_qcom_frame_extrapolation");

static SHRINK_HWTEST_F(ActsEglMainUncover0001TestSuite, TestCase_000283,
        "dEQP-EGL.functional.get_proc_addr",
        "ess.extension.gl_qcom_shading_rate");
