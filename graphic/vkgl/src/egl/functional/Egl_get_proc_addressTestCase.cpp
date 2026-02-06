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

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002413, "dEQP-EGL.functional.get_proc_addre",
    "ss.extension.egl_adnroid_blob_cache");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002414, "dEQP-EGL.functional.get_proc_address.extens",
    "ion.egl_adnroid_create_native_client_buffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002415, "dEQP-EGL.functional.get_proc_address.exte",
    "nsion.egl_adnroid_get_native_client_buffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002416, "dEQP-EGL.functional.get_proc_address.e",
    "xtension.egl_adnroid_native_fence_sync");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002417, "dEQP-EGL.functional.get_proc_address.e",
    "xtension.egl_adnroid_presentation_time");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002418, "dEQP-EGL.functional.get_proc_address.ex",
    "tension.egl_adnroid_get_frame_timestamps");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002419, "dEQP-EGL.functional.get_proc_address.ex",
    "tension.egl_angle_query_sur""face_pointer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002420, "dEQP-EGL.functional.get_proc_addr",
    "ess.extension.egl_ext_client_sync");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002421, "dEQP-EGL.functional.get_proc_addr",
    "ess.extension.egl_ext_device_base");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002422, "dEQP-EGL.functional.get_proc_address",
    ".extension.egl_ext_device_enumeration");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002423, "dEQP-EGL.functional.get_proc_addr",
    "ess.extension.egl_ext_device_query");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002424, "dEQP-EGL.functional.get_proc_address.exten",
    "sion.egl_ext_image_dma_buf_import_modifiers");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002425, "dEQP-EGL.functional.get_proc_addr",
    "ess.extension.egl_ext_output_base");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002426, "dEQP-EGL.functional.get_proc_addre",
    "ss.extension.egl_ext_platform_base");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002427, "dEQP-EGL.functional.get_proc_address.ext",
    "ension.egl_ext_stream_consumer_egloutput");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002428, "dEQP-EGL.functional.get_proc_address.ex",
    "tension.egl_ext_swap_buffers_with_damage");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002429, "dEQP-EGL.functional.get_proc_add",
    "ress.extension.egl_ext_sync_reuse");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002430, "dEQP-EGL.functional.get_proc_addr",
    "ess.extension.egl_hi_clientpixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002431, "dEQP-EGL.functional.get_proc_add",
    "ress.extension.egl_khr_cl_event2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002432, "dEQP-EGL.functional.get_proc_a",
    "ddress.extension.egl_khr_debug");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002433, "dEQP-EGL.functional.get_proc_address",
    ".extension.egl_khr_display_reference");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002434, "dEQP-EGL.functional.get_proc_add",
    "ress.extension.egl_khr_fence_sync");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002435, "dEQP-EGL.functional.get_proc_a",
    "ddress.extension.egl_khr_image");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002436, "dEQP-EGL.functional.get_proc_add",
    "ress.extension.egl_khr_image_base");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002437, "dEQP-EGL.functional.get_proc_addr",
    "ess.extension.egl_khr_lock_sur""face");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002438, "dEQP-EGL.functional.get_proc_addre",
    "ss.extension.egl_khr_lock_sur""face3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002439, "dEQP-EGL.functional.get_proc_addre",
    "ss.extension.egl_khr_partial_update");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002440, "dEQP-EGL.functional.get_proc_addre",
    "ss.extension.egl_khr_reusable_sync");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002441, "dEQP-EGL.functional.get_proc_a",
    "ddress.extension.egl_khr_stream");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002442, "dEQP-EGL.functional.get_proc_addre",
    "ss.extension.egl_khr_stream_attrib");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002443, "dEQP-EGL.functional.get_proc_address.ext",
    "ension.egl_khr_stream_consumer_gltexture");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002444, "dEQP-EGL.functional.get_proc_address.ex",
    "tension.egl_khr_stream_cross_process_fd");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002445, "dEQP-EGL.functional.get_proc_addr",
    "ess.extension.egl_khr_stream_fifo");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002446, "dEQP-EGL.functional.get_proc_address.ext",
    "ension.egl_khr_stream_producer_eglsur""face");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002447, "dEQP-EGL.functional.get_proc_address.ex",
    "tension.egl_khr_swap_buffers_with_damage");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002448, "dEQP-EGL.functional.get_proc_add",
    "ress.extension.egl_khr_wait_sync");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002449, "dEQP-EGL.functional.get_proc_add",
    "ress.extension.egl_mesa_drm_image");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002450, "dEQP-EGL.functional.get_proc_address.e",
    "xtension.egl_mesa_image_dma_buf_export");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002451, "dEQP-EGL.functional.get_proc_addr",
    "ess.extension.egl_nok_swap_region");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002452, "dEQP-EGL.functional.get_proc_addr",
    "ess.extension.egl_nok_swap_region2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002453, "dEQP-EGL.functional.get_proc_addr",
    "ess.extension.egl_nv_native_query");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002454, "dEQP-EGL.functional.get_proc_addre",
    "ss.extension.egl_nv_post_sub_buffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002455, "dEQP-EGL.functional.get_proc_address.exte",
    "nsion.egl_nv_stream_consumer_gltexture_yuv");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002456, "dEQP-EGL.functional.get_proc_addr",
    "ess.extension.egl_nv_stream_flush");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002457, "dEQP-EGL.functional.get_proc_addre",
    "ss.extension.egl_nv_stream_metadata");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002458, "dEQP-EGL.functional.get_proc_addr",
    "ess.extension.egl_nv_stream_reset");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002459, "dEQP-EGL.functional.get_proc_add",
    "ress.extension.egl_nv_stream_sync");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002460, "dEQP-EGL.functional.get_proc_address.ext",
    "nsion.egl_nv_sync");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002461, "dEQP-EGL.functional.get_proc_add",
    "ress.extension.egl_nv_system_time");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002462, "dEQP-EGL.functional.get_proc_add",
    "ress.extension.egl_ext_compositor");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002463, "dEQP-EGL.functional.get_proc_address.",
    "extension.gl_apple_copy_texture_levels");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002464, "dEQP-EGL.functional.get_proc_address.ex",
    "tension.gl_apple_framebuffer_multisample");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002465, "dEQP-EGL.functional.get_proc_a",
    "ddress.extension.gl_apple_sync");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002466, "dEQP-EGL.functional.get_proc_addr",
    "ess.extension.gl_ext_debug_marker");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002467, "dEQP-EGL.functional.get_proc_address",
    ".extension.gl_ext_discard_framebuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002468, "dEQP-EGL.functional.get_proc_addres",
    "s.extension.gl_ext_map_buffer_range");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002469, "dEQP-EGL.functional.get_proc_addres",
    "s.extension.gl_ext_multi_draw_arrays");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002470, "dEQP-EGL.functional.get_proc_address.exten",
    "sion.gl_ext_multisampled_render_to_texture");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002471, "dEQP-EGL.functional.get_proc_add",
    "ress.extension.gl_ext_robustness");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002472, "dEQP-EGL.functional.get_proc_addre",
    "ss.extension.gl_ext_texture_storage");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002473, "dEQP-EGL.functional.get_proc_address.exten",
    "sion.gl_img_multisampled_render_to_texture");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002474, "dEQP-EGL.functional.get_proc_addre",
    "ss.extension.gl_img_user_clip_plane");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002475, "dEQP-EGL.functional.get_proc_address.exte",
    "nsion.gl_nv_fence");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002476, "dEQP-EGL.functional.get_proc_ad",
    "dress.extension.gl_oes_egl_image");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002477, "dEQP-EGL.functional.get_proc_address.e",
    "xtension.gl_oes_blend_equation_separate");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002478, "dEQP-EGL.functional.get_proc_address",
    ".extension.gl_oes_blend_func_separate");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002479, "dEQP-EGL.functional.get_proc_addre",
    "ss.extension.gl_oes_blend_subtract");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002480, "dEQP-EGL.functional.get_proc_addr",
    "ess.extension.gl_oes_draw_texture");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002481, "dEQP-EGL.functional.get_proc_add",
    "ress.extension.gl_oes_fixed_point");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002482, "dEQP-EGL.functional.get_proc_address",
    ".extension.gl_oes_framebuffer_object");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002483, "dEQP-EGL.functional.get_proc_ad",
    "dress.extension.gl_oes_mapbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002484, "dEQP-EGL.functional.get_proc_addre",
    "ss.extension.gl_oes_matrix_palette");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002485, "dEQP-EGL.functional.get_proc_addres",
    "s.extension.gl_oes_point_size_array");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002486, "dEQP-EGL.functional.get_proc_addr",
    "ess.extension.gl_oes_query_matrix");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002487, "dEQP-EGL.functional.get_proc_addres",
    "s.extension.gl_oes_single_precision");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002488, "dEQP-EGL.functional.get_proc_addres",
    "s.extension.gl_oes_texture_cube_map");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002489, "dEQP-EGL.functional.get_proc_address",
    ".extension.gl_oes_vertex_array_object");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002490, "dEQP-EGL.functional.get_proc_addre",
    "ss.extension.gl_qcom_driver_control");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002491, "dEQP-EGL.functional.get_proc_addr",
    "ess.extension.gl_qcom_extended_get");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002492, "dEQP-EGL.functional.get_proc_addre",
    "ss.extension.gl_qcom_extended_get2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002493, "dEQP-EGL.functional.get_proc_addres",
    "s.extension.gl_qcom_tiled_rendering");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002494, "dEQP-EGL.functional.get_proc_address.extens",
    "ion.gl_amd_framebuffer_multisample_advanced");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002495, "dEQP-EGL.functional.get_proc_address",
    ".extension.gl_amd_performance_monitor");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002496, "dEQP-EGL.functional.get_proc_address",
    ".extension.gl_angle_framebuffer_blit");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002497, "dEQP-EGL.functional.get_proc_address.ex",
    "tension.gl_angle_framebuffer_multisample");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002498, "dEQP-EGL.functional.get_proc_address",
    ".extension.gl_angle_instanced_arrays");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002499, "dEQP-EGL.functional.get_proc_address.ext",
    "ension.gl_angle_translated_shader_source");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002500, "dEQP-EGL.functional.get_proc_addres",
    "s.extension.gl_ext_egl_image_storage");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002501, "dEQP-EGL.functional.get_proc_addr",
    "ess.extension.gl_ext_base_instance");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002502, "dEQP-EGL.functional.get_proc_address",
    ".extension.gl_ext_blend_func_extended");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002503, "dEQP-EGL.functional.get_proc_addre",
    "ss.extension.gl_ext_buffer_storage");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002504, "dEQP-EGL.functional.get_proc_addr",
    "ess.extension.gl_ext_clear_texture");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002505, "dEQP-EGL.functional.get_proc_addr",
    "ess.extension.gl_ext_clip_control");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002506, "dEQP-EGL.functional.get_proc_add",
    "ress.extension.gl_ext_copy_image");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002507, "dEQP-EGL.functional.get_proc_add",
    "ress.extension.gl_ext_debug_label");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002508, "dEQP-EGL.functional.get_proc_address.",
    "extension.gl_ext_disjoint_timer_query");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002509, "dEQP-EGL.functional.get_proc_addr",
    "ess.extension.gl_ext_draw_buffers");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002510, "dEQP-EGL.functional.get_proc_address.",
    "extension.gl_ext_draw_buffers_indexed");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002511, "dEQP-EGL.functional.get_proc_address.ex",
    "tension.gl_ext_draw_elements_base_vertex");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002512, "dEQP-EGL.functional.get_proc_addre",
    "ss.extension.gl_ext_draw_instanced");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002513, "dEQP-EGL.functional.get_proc_address.e",
    "xtension.gl_ext_draw_transform_feedback");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002514, "dEQP-EGL.functional.get_proc_addre",
    "ss.extension.gl_ext_external_buffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002515, "dEQP-EGL.functional.get_proc_addre",
    "ss.extension.gl_ext_geometry_shader");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002516, "dEQP-EGL.functional.get_proc_addres",
    "s.extension.gl_ext_instanced_arrays");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002517, "dEQP-EGL.functional.get_proc_addr",
    "ess.extension.gl_ext_memory_object");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002518, "dEQP-EGL.functional.get_proc_addres",
    "s.extension.gl_ext_memory_object_fd");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002519, "dEQP-EGL.functional.get_proc_address",
    ".extension.gl_ext_memory_object_win32");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002520, "dEQP-EGL.functional.get_proc_address",
    ".extension.gl_ext_multi_draw_indirect");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002521, "dEQP-EGL.functional.get_proc_address.e",
    "xtension.gl_ext_multiview_draw_buffers");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002522, "dEQP-EGL.functional.get_proc_address.e",
    "xtension.gl_ext_occlusion_query_boolean");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002523, "dEQP-EGL.functional.get_proc_address.",
    "extension.gl_ext_polygon_offset_clamp");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002524, "dEQP-EGL.functional.get_proc_address.e",
    "xtension.gl_ext_primitive_bounding_box");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002525, "dEQP-EGL.functional.get_proc_address",
    ".extension.gl_ext_raster_multisample");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002526, "dEQP-EGL.functional.get_proc_ad",
    "dress.extension.gl_ext_semaphore");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002527, "dEQP-EGL.functional.get_proc_addr",
    "ess.extension.gl_ext_semaphore_fd");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002528, "dEQP-EGL.functional.get_proc_addre",
    "ss.extension.gl_ext_semaphore_win32");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002529, "dEQP-EGL.functional.get_proc_address.e",
    "xtension.gl_ext_separate_shader_objects");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002530, "dEQP-EGL.functional.get_proc_address.extensio",
    "n.gl_ext_shader_framebuffer_fetch_non_coherent");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002531, "dEQP-EGL.functional.get_proc_address.ext",
    "ension.gl_ext_shader_pixel_local_storage2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002532, "dEQP-EGL.functional.get_proc_addre",
    "ss.extension.gl_ext_sparse_texture");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002533, "dEQP-EGL.functional.get_proc_address",
    ".extension.gl_ext_tessellation_shader");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002534, "dEQP-EGL.functional.get_proc_address.",
    "extension.gl_ext_texture_border_clamp");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002535, "dEQP-EGL.functional.get_proc_addre",
    "ss.extension.gl_ext_texture_buffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002536, "dEQP-EGL.functional.get_proc_addr",
    "ess.extension.gl_ext_texture_view");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002537, "dEQP-EGL.functional.get_proc_addres",
    "s.extension.gl_ext_win32_keyed_mutex");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002538, "dEQP-EGL.functional.get_proc_addres",
    "s.extension.gl_ext_window_rectangles");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002539, "dEQP-EGL.functional.get_proc_addres",
    "s.extension.gl_img_bindless_texture");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002540, "dEQP-EGL.functional.get_proc_address.e",
    "xtension.gl_img_framebuffer_downsample");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002541, "dEQP-EGL.functional.get_proc_address",
    ".extension.gl_intel_framebuffer_cmaa");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002542, "dEQP-EGL.functional.get_proc_address",
    ".extension.gl_intel_performance_query");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002543, "dEQP-EGL.functional.get_proc_address.e",
    "xtension.gl_khr_blend_equation_advanced");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002544, "dEQP-EGL.functional.get_proc_address.exte",
    "nsion.gl_khr_debug");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002545, "dEQP-EGL.functional.get_proc_add",
    "ress.extension.gl_khr_robustness");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002546, "dEQP-EGL.functional.get_proc_address.e",
    "xtension.gl_khr_parallel_shader_compile");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002547, "dEQP-EGL.functional.get_proc_addre",
    "ss.extension.gl_nv_bindless_texture");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002548, "dEQP-EGL.functional.get_proc_address.e",
    "xtension.gl_nv_blend_equation_advanced");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002549, "dEQP-EGL.functional.get_proc_address",
    ".extension.gl_nv_clip_space_w_scaling");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002550, "dEQP-EGL.functional.get_proc_addres",
    "s.extension.gl_nv_conditional_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002551, "dEQP-EGL.functional.get_proc_address",
    ".extension.gl_nv_conservative_raster");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002552, "dEQP-EGL.functional.get_proc_address.extensio",
    "n.gl_nv_conservative_raster_pre_snap_triangles");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002553, "dEQP-EGL.functional.get_proc_add",
    "ress.extension.gl_nv_copy_buffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002554, "dEQP-EGL.functional.get_proc_addre",
    "ss.extension.gl_nv_coverage_sample");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002555, "dEQP-EGL.functional.get_proc_add",
    "ress.extension.gl_nv_draw_buffers");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002556, "dEQP-EGL.functional.get_proc_addr",
    "ess.extension.gl_nv_draw_instanced");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002557, "dEQP-EGL.functional.get_proc_addres",
    "s.extension.gl_nv_draw_vulkan_image");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002558, "dEQP-EGL.functional.get_proc_address.ex",
    "tension.gl_nv_fragment_coverage_to_color");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002559, "dEQP-EGL.functional.get_proc_addre",
    "ss.extension.gl_nv_framebuffer_blit");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002560, "dEQP-EGL.functional.get_proc_address.ex",
    "tension.gl_nv_framebuffer_mixed_samples");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002561, "dEQP-EGL.functional.get_proc_address.e",
    "xtension.gl_nv_framebuffer_multisample");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002562, "dEQP-EGL.functional.get_proc_add",
    "ress.extension.gl_nv_gpu_shader5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002563, "dEQP-EGL.functional.get_proc_addre",
    "ss.extension.gl_nv_instanced_arrays");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002564, "dEQP-EGL.functional.get_proc_address.ext",
    "ension.gl_nv_internalformat_sample_query");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002565, "dEQP-EGL.functional.get_proc_addres",
    "s.extension.gl_nv_memory_attachment");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002566, "dEQP-EGL.functional.get_proc_add",
    "ress.extension.gl_nv_mesh_shader");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002567, "dEQP-EGL.functional.get_proc_address",
    ".extension.gl_nv_non_square_matrices");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002568, "dEQP-EGL.functional.get_proc_addr",
    "ess.extension.gl_nv_path_rendering");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002569, "dEQP-EGL.functional.get_proc_add",
    "ress.extension.gl_nv_polygon_mode");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002570, "dEQP-EGL.functional.get_proc_add",
    "ress.extension.gl_nv_read_buffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002571, "dEQP-EGL.functional.get_proc_addre",
    "ss.extension.gl_nv_sample_locations");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002572, "dEQP-EGL.functional.get_proc_addres",
    "s.extension.gl_nv_scissor_exclusive");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002573, "dEQP-EGL.functional.get_proc_addres",
    "s.extension.gl_nv_shading_rate_image");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002574, "dEQP-EGL.functional.get_proc_addr",
    "ess.extension.gl_nv_viewport_array");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002575, "dEQP-EGL.functional.get_proc_addre",
    "ss.extension.gl_nv_viewport_swizzle");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002576, "dEQP-EGL.functional.get_proc_add",
    "ress.extension.gl_oes_copy_image");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002577, "dEQP-EGL.functional.get_proc_address.",
    "extension.gl_oes_draw_buffers_indexed");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002578, "dEQP-EGL.functional.get_proc_address.ex",
    "tension.gl_oes_draw_elements_base_vertex");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002579, "dEQP-EGL.functional.get_proc_addre",
    "ss.extension.gl_oes_geometry_shader");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002580, "dEQP-EGL.functional.get_proc_address",
    ".extension.gl_oes_get_program_binary");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002581, "dEQP-EGL.functional.get_proc_address.e",
    "xtension.gl_oes_primitive_bounding_box");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002582, "dEQP-EGL.functional.get_proc_addre",
    "ss.extension.gl_oes_sample_shading");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002583, "dEQP-EGL.functional.get_proc_address",
    ".extension.gl_oes_tessellation_shader");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002584, "dEQP-EGL.functional.get_proc_add",
    "ress.extension.gl_oes_texture_3d");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002585, "dEQP-EGL.functional.get_proc_address.",
    "extension.gl_oes_texture_border_clamp");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002586, "dEQP-EGL.functional.get_proc_addre",
    "ss.extension.gl_oes_texture_buffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002587, "dEQP-EGL.functional.get_proc_address.extensio",
    "n.gl_oes_texture_storage_multisample_2d_array");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002588, "dEQP-EGL.functional.get_proc_addr",
    "ess.extension.gl_oes_texture_view");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002589, "dEQP-EGL.functional.get_proc_addre",
    "ss.extension.gl_oes_viewport_array");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002590, "dEQP-EGL.functional.get_proc_ad",
    "dress.extension.gl_ovr_multiview");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002591, "dEQP-EGL.functional.get_proc_address.extension.",
    "gl_ovr_multiview_multisampled_render_to_texture");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002592, "dEQP-EGL.functional.get_proc_add",
    "ress.extension.gl_qcom_alpha_test");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002593, "dEQP-EGL.functional.get_proc_address.",
    "extension.gl_qcom_framebuffer_foveated");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002594, "dEQP-EGL.functional.get_proc_addres",
    "s.extension.gl_qcom_texture_foveated");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002595, "dEQP-EGL.functional.get_proc_address.extensio",
    "n.gl_qcom_shader_framebuffer_fetch_noncoherent");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002596, "dEQP-EGL.functional.get_proc_add",
    "ress.core.egl");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002597, "dEQP-EGL.functional.get_proc_addr",
    "ess.core.egl15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002598, "dEQP-EGL.functional.get_proc_addr",
    "ess.core.gles");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002599, "dEQP-EGL.functional.get_proc_addr",
    "ess.core.gles2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002600, "dEQP-EGL.functional.get_proc_addr",
    "ess.core.gles3");
