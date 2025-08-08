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

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001080, "dEQP-EGL.functional.sharing.gles2.con",
    "text.create_destroy");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001081, "dEQP-EGL.functional.sharing.gle",
    "s2.context.create_destroy_mixed");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001082, "dEQP-EGL.functional.sharing.gles2.buff",
    "er.create_delete");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001083, "dEQP-EGL.functional.sharing.gl",
    "es2.buffer.create_delete_mixed");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001084, "dEQP-EGL.functional.sharing.gles2.buff",
    "er.render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001085, "dEQP-EGL.functional.sharing.gles2.text",
    "ure.create_delete");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001086, "dEQP-EGL.functional.sharing.gl",
    "es2.texture.create_delete_mixed");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001087, "dEQP-EGL.functional.sharing.gles2.text",
    "ure.render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001088, "dEQP-EGL.functional.sharing.gl",
    "es2.texture.render_sample_mixed");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001089, "dEQP-EGL.functional.sharing.gles2.progr",
    "am.create_delete");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001090, "dEQP-EGL.functional.sharing.gl",
    "es2.program.create_delete_mixed");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001091, "dEQP-EGL.functional.sharing.gles2.prog",
    "ram.render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001092, "dEQP-EGL.functional.sharing.gles2.shade",
    "r.create_delete_vert");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001093, "dEQP-EGL.functional.sharing.gles",
    "2.shader.create_delete_mixed_vert");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001094, "dEQP-EGL.functional.sharing.gles2.shad",
    "er.render_vert");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001095, "dEQP-EGL.functional.sharing.gles2.shad",
    "er.create_delete_frag");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001096, "dEQP-EGL.functional.sharing.gles",
    "2.shader.create_delete_mixed_frag");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001097, "dEQP-EGL.functional.sharing.gles2.sha",
    "der.render_frag");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001098, "dEQP-EGL.functional.sharing.gles2.m",
    "ultithread.simple.buffers.gen_delete");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001099, "dEQP-EGL.functional.sharing.gles2.m",
    "ultithread.simple.buffers.bufferdata");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001100, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.simple.buffers.buffersubdata");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001101, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.simple.buffers.bufferdata_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001102, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.simple.buffers.buffersubdata_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001103, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.simple.textures.gen_delete");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001104, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.simple.textures.teximage2d");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001105, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.simple.textures.teximage2d_texsubimage2d");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001106, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".simple.textures.teximage2d_copytexsubimage2d");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001107, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.simple.textures.teximage2d_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001108, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "simple.textures.teximage2d_texsubimage2d_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001109, "dEQP-EGL.functional.sharing.gles2.multithread.si",
    "mple.textures.teximage2d_copytexsubimage2d_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001110, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.simple.textures.copyteximage2d");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001111, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".simple.textures.copyteximage2d_texsubimage2d");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001112, "dEQP-EGL.functional.sharing.gles2.multithread.s",
    "imple.textures.copyteximage2d_copytexsubimage2d");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001113, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.simple.textures.copyteximage2d_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001114, "dEQP-EGL.functional.sharing.gles2.multithread.si",
    "mple.textures.copyteximage2d_texsubimage2d_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001115, "dEQP-EGL.functional.sharing.gles2.multithread.simp",
    "le.textures.copyteximage2d_copytexsubimage2d_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001116, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.simple.shaders.vtx_create_destroy");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001117, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.simple.shaders.vtx_shadersource");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001118, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.simple.shaders.vtx_compile");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001119, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.simple.shaders.frag_create_destroy");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001120, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.simple.shaders.frag_shadersource");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001121, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.simple.shaders.frag_compile");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001122, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.simple.programs.create_destroy");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001123, "dEQP-EGL.functional.sharing.gles2.",
    "multithread.simple.programs.attach");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001124, "dEQP-EGL.functional.sharing.gles2",
    ".multithread.simple.programs.link");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001125, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.simple.images.texture_source.create_destroy");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001126, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.simple.images.texture_source.create_texture");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001127, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.simple.images.texture_source.texsubimage2d");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001128, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "simple.images.texture_source.copytexsubimage2d");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001129, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.simple.images.texture_source.teximage2d");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001130, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.simple.images.texture_source.copyteximage2d");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001131, "dEQP-EGL.functional.sharing.gles2.multithread.si",
    "mple.images.texture_source.create_texture_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001132, "dEQP-EGL.functional.sharing.gles2.multithread.s",
    "imple.images.texture_source.texsubimage2d_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001133, "dEQP-EGL.functional.sharing.gles2.multithread.sim",
    "ple.images.texture_source.copytexsubimage2d_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001134, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "simple.images.texture_source.teximage2d_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001135, "dEQP-EGL.functional.sharing.gles2.multithread.si",
    "mple.images.texture_source.copyteximage2d_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001136, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.gen_delete.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001137, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.gen_delete.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001138, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.gen_delete.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001139, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.gen_delete.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001140, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.gen_delete.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001141, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.gen_delete.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001142, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.gen_delete.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001143, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.gen_delete.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001144, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.gen_delete.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001145, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.gen_delete.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001146, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.gen_delete.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001147, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.gen_delete.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001148, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.gen_delete.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001149, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.gen_delete.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001150, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.gen_delete.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001151, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.gen_delete.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001152, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.gen_delete.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001153, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.gen_delete.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001154, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.gen_delete.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001155, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.gen_delete.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001156, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.teximage2d.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001157, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.teximage2d.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001158, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.teximage2d.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001159, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.teximage2d.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001160, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.teximage2d.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001161, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.teximage2d.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001162, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.teximage2d.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001163, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.teximage2d.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001164, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.teximage2d.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001165, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.teximage2d.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001166, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.teximage2d.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001167, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.teximage2d.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001168, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.teximage2d.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001169, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.teximage2d.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001170, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.teximage2d.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001171, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.teximage2d.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001172, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.teximage2d.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001173, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.teximage2d.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001174, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.teximage2d.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001175, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.textures.teximage2d.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001176, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.textures.texsubimage2d.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001177, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.textures.texsubimage2d.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001178, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.textures.texsubimage2d.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001179, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.textures.texsubimage2d.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001180, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.textures.texsubimage2d.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001181, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.textures.texsubimage2d.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001182, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.textures.texsubimage2d.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001183, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.textures.texsubimage2d.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001184, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.textures.texsubimage2d.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001185, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.textures.texsubimage2d.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001186, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.textures.texsubimage2d.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001187, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.textures.texsubimage2d.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001188, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.textures.texsubimage2d.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001189, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.textures.texsubimage2d.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001190, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.textures.texsubimage2d.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001191, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.textures.texsubimage2d.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001192, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.textures.texsubimage2d.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001193, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.textures.texsubimage2d.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001194, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.textures.texsubimage2d.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001195, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.textures.texsubimage2d.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001196, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.textures.copyteximage2d.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001197, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.textures.copyteximage2d.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001198, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.textures.copyteximage2d.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001199, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.textures.copyteximage2d.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001200, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.textures.copyteximage2d.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001201, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.textures.copyteximage2d.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001202, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.textures.copyteximage2d.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001203, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.textures.copyteximage2d.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001204, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.textures.copyteximage2d.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001205, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.textures.copyteximage2d.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001206, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.textures.copyteximage2d.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001207, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.textures.copyteximage2d.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001208, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.textures.copyteximage2d.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001209, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.textures.copyteximage2d.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001210, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.textures.copyteximage2d.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001211, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.textures.copyteximage2d.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001212, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.textures.copyteximage2d.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001213, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.textures.copyteximage2d.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001214, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.textures.copyteximage2d.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001215, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.textures.copyteximage2d.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001216, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random.textures.copytexsubimage2d.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001217, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random.textures.copytexsubimage2d.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001218, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random.textures.copytexsubimage2d.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001219, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random.textures.copytexsubimage2d.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001220, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random.textures.copytexsubimage2d.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001221, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random.textures.copytexsubimage2d.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001222, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random.textures.copytexsubimage2d.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001223, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random.textures.copytexsubimage2d.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001224, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random.textures.copytexsubimage2d.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001225, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random.textures.copytexsubimage2d.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001226, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random.textures.copytexsubimage2d.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001227, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random.textures.copytexsubimage2d.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001228, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random.textures.copytexsubimage2d.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001229, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random.textures.copytexsubimage2d.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001230, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random.textures.copytexsubimage2d.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001231, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random.textures.copytexsubimage2d.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001232, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random.textures.copytexsubimage2d.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001233, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random.textures.copytexsubimage2d.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001234, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random.textures.copytexsubimage2d.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001235, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random.textures.copytexsubimage2d.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001236, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.buffers.gen_delete.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001237, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.buffers.gen_delete.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001238, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.buffers.gen_delete.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001239, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.buffers.gen_delete.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001240, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.buffers.gen_delete.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001241, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.buffers.gen_delete.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001242, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.buffers.gen_delete.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001243, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.buffers.gen_delete.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001244, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.buffers.gen_delete.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001245, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.buffers.gen_delete.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001246, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.buffers.gen_delete.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001247, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.buffers.gen_delete.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001248, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.buffers.gen_delete.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001249, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.buffers.gen_delete.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001250, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.buffers.gen_delete.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001251, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.buffers.gen_delete.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001252, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.buffers.gen_delete.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001253, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.buffers.gen_delete.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001254, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.buffers.gen_delete.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001255, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.buffers.gen_delete.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001256, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.buffers.bufferdata.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001257, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.buffers.bufferdata.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001258, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.buffers.bufferdata.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001259, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.buffers.bufferdata.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001260, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.buffers.bufferdata.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001261, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.buffers.bufferdata.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001262, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.buffers.bufferdata.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001263, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.buffers.bufferdata.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001264, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.buffers.bufferdata.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001265, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.buffers.bufferdata.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001266, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.buffers.bufferdata.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001267, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.buffers.bufferdata.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001268, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.buffers.bufferdata.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001269, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.buffers.bufferdata.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001270, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.buffers.bufferdata.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001271, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.buffers.bufferdata.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001272, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.buffers.bufferdata.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001273, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.buffers.bufferdata.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001274, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.buffers.bufferdata.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001275, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.buffers.bufferdata.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001276, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.buffers.buffersubdata.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001277, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.buffers.buffersubdata.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001278, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.buffers.buffersubdata.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001279, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.buffers.buffersubdata.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001280, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.buffers.buffersubdata.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001281, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.buffers.buffersubdata.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001282, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.buffers.buffersubdata.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001283, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.buffers.buffersubdata.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001284, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.buffers.buffersubdata.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001285, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.buffers.buffersubdata.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001286, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.buffers.buffersubdata.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001287, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.buffers.buffersubdata.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001288, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.buffers.buffersubdata.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001289, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.buffers.buffersubdata.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001290, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.buffers.buffersubdata.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001291, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.buffers.buffersubdata.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001292, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.buffers.buffersubdata.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001293, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.buffers.buffersubdata.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001294, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.buffers.buffersubdata.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001295, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.buffers.buffersubdata.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001296, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.shaders.create_destroy.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001297, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.shaders.create_destroy.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001298, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.shaders.create_destroy.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001299, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.shaders.create_destroy.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001300, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.shaders.create_destroy.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001301, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.shaders.create_destroy.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001302, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.shaders.create_destroy.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001303, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.shaders.create_destroy.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001304, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.shaders.create_destroy.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001305, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.shaders.create_destroy.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001306, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.shaders.create_destroy.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001307, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.shaders.create_destroy.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001308, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.shaders.create_destroy.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001309, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.shaders.create_destroy.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001310, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.shaders.create_destroy.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001311, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.shaders.create_destroy.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001312, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.shaders.create_destroy.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001313, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.shaders.create_destroy.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001314, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.shaders.create_destroy.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001315, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.shaders.create_destroy.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001316, "dEQP-EGL.functional.sharing.gles2.",
    "multithread.random.shaders.source.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001317, "dEQP-EGL.functional.sharing.gles2.",
    "multithread.random.shaders.source.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001318, "dEQP-EGL.functional.sharing.gles2.",
    "multithread.random.shaders.source.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001319, "dEQP-EGL.functional.sharing.gles2.",
    "multithread.random.shaders.source.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001320, "dEQP-EGL.functional.sharing.gles2.",
    "multithread.random.shaders.source.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001321, "dEQP-EGL.functional.sharing.gles2.",
    "multithread.random.shaders.source.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001322, "dEQP-EGL.functional.sharing.gles2.",
    "multithread.random.shaders.source.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001323, "dEQP-EGL.functional.sharing.gles2.",
    "multithread.random.shaders.source.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001324, "dEQP-EGL.functional.sharing.gles2.",
    "multithread.random.shaders.source.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001325, "dEQP-EGL.functional.sharing.gles2.",
    "multithread.random.shaders.source.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001326, "dEQP-EGL.functional.sharing.gles2.m",
    "ultithread.random.shaders.source.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001327, "dEQP-EGL.functional.sharing.gles2.m",
    "ultithread.random.shaders.source.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001328, "dEQP-EGL.functional.sharing.gles2.m",
    "ultithread.random.shaders.source.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001329, "dEQP-EGL.functional.sharing.gles2.m",
    "ultithread.random.shaders.source.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001330, "dEQP-EGL.functional.sharing.gles2.m",
    "ultithread.random.shaders.source.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001331, "dEQP-EGL.functional.sharing.gles2.m",
    "ultithread.random.shaders.source.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001332, "dEQP-EGL.functional.sharing.gles2.m",
    "ultithread.random.shaders.source.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001333, "dEQP-EGL.functional.sharing.gles2.m",
    "ultithread.random.shaders.source.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001334, "dEQP-EGL.functional.sharing.gles2.m",
    "ultithread.random.shaders.source.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001335, "dEQP-EGL.functional.sharing.gles2.m",
    "ultithread.random.shaders.source.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001336, "dEQP-EGL.functional.sharing.gles2.m",
    "ultithread.random.shaders.compile.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001337, "dEQP-EGL.functional.sharing.gles2.m",
    "ultithread.random.shaders.compile.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001338, "dEQP-EGL.functional.sharing.gles2.m",
    "ultithread.random.shaders.compile.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001339, "dEQP-EGL.functional.sharing.gles2.m",
    "ultithread.random.shaders.compile.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001340, "dEQP-EGL.functional.sharing.gles2.m",
    "ultithread.random.shaders.compile.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001341, "dEQP-EGL.functional.sharing.gles2.m",
    "ultithread.random.shaders.compile.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001342, "dEQP-EGL.functional.sharing.gles2.m",
    "ultithread.random.shaders.compile.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001343, "dEQP-EGL.functional.sharing.gles2.m",
    "ultithread.random.shaders.compile.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001344, "dEQP-EGL.functional.sharing.gles2.m",
    "ultithread.random.shaders.compile.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001345, "dEQP-EGL.functional.sharing.gles2.m",
    "ultithread.random.shaders.compile.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001346, "dEQP-EGL.functional.sharing.gles2.m",
    "ultithread.random.shaders.compile.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001347, "dEQP-EGL.functional.sharing.gles2.m",
    "ultithread.random.shaders.compile.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001348, "dEQP-EGL.functional.sharing.gles2.m",
    "ultithread.random.shaders.compile.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001349, "dEQP-EGL.functional.sharing.gles2.m",
    "ultithread.random.shaders.compile.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001350, "dEQP-EGL.functional.sharing.gles2.m",
    "ultithread.random.shaders.compile.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001351, "dEQP-EGL.functional.sharing.gles2.m",
    "ultithread.random.shaders.compile.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001352, "dEQP-EGL.functional.sharing.gles2.m",
    "ultithread.random.shaders.compile.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001353, "dEQP-EGL.functional.sharing.gles2.m",
    "ultithread.random.shaders.compile.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001354, "dEQP-EGL.functional.sharing.gles2.m",
    "ultithread.random.shaders.compile.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001355, "dEQP-EGL.functional.sharing.gles2.m",
    "ultithread.random.shaders.compile.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001356, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.programs.create_destroy.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001357, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.programs.create_destroy.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001358, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.programs.create_destroy.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001359, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.programs.create_destroy.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001360, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.programs.create_destroy.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001361, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.programs.create_destroy.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001362, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.programs.create_destroy.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001363, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.programs.create_destroy.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001364, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.programs.create_destroy.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001365, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.programs.create_destroy.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001366, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.programs.create_destroy.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001367, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.programs.create_destroy.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001368, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.programs.create_destroy.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001369, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.programs.create_destroy.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001370, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.programs.create_destroy.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001371, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.programs.create_destroy.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001372, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.programs.create_destroy.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001373, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.programs.create_destroy.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001374, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.programs.create_destroy.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001375, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.programs.create_destroy.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001376, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.programs.attach_detach.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001377, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.programs.attach_detach.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001378, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.programs.attach_detach.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001379, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.programs.attach_detach.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001380, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.programs.attach_detach.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001381, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.programs.attach_detach.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001382, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.programs.attach_detach.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001383, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.programs.attach_detach.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001384, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.programs.attach_detach.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001385, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.programs.attach_detach.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001386, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.programs.attach_detach.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001387, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.programs.attach_detach.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001388, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.programs.attach_detach.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001389, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.programs.attach_detach.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001390, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.programs.attach_detach.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001391, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.programs.attach_detach.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001392, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.programs.attach_detach.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001393, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.programs.attach_detach.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001394, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.programs.attach_detach.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001395, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.programs.attach_detach.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001396, "dEQP-EGL.functional.sharing.gles2.",
    "multithread.random.programs.link.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001397, "dEQP-EGL.functional.sharing.gles2.",
    "multithread.random.programs.link.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001398, "dEQP-EGL.functional.sharing.gles2.",
    "multithread.random.programs.link.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001399, "dEQP-EGL.functional.sharing.gles2.",
    "multithread.random.programs.link.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001400, "dEQP-EGL.functional.sharing.gles2.",
    "multithread.random.programs.link.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001401, "dEQP-EGL.functional.sharing.gles2.",
    "multithread.random.programs.link.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001402, "dEQP-EGL.functional.sharing.gles2.",
    "multithread.random.programs.link.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001403, "dEQP-EGL.functional.sharing.gles2.",
    "multithread.random.programs.link.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001404, "dEQP-EGL.functional.sharing.gles2.",
    "multithread.random.programs.link.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001405, "dEQP-EGL.functional.sharing.gles2.",
    "multithread.random.programs.link.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001406, "dEQP-EGL.functional.sharing.gles2.",
    "multithread.random.programs.link.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001407, "dEQP-EGL.functional.sharing.gles2.",
    "multithread.random.programs.link.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001408, "dEQP-EGL.functional.sharing.gles2.",
    "multithread.random.programs.link.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001409, "dEQP-EGL.functional.sharing.gles2.",
    "multithread.random.programs.link.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001410, "dEQP-EGL.functional.sharing.gles2.",
    "multithread.random.programs.link.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001411, "dEQP-EGL.functional.sharing.gles2.",
    "multithread.random.programs.link.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001412, "dEQP-EGL.functional.sharing.gles2.",
    "multithread.random.programs.link.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001413, "dEQP-EGL.functional.sharing.gles2.",
    "multithread.random.programs.link.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001414, "dEQP-EGL.functional.sharing.gles2.",
    "multithread.random.programs.link.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001415, "dEQP-EGL.functional.sharing.gles2.",
    "multithread.random.programs.link.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001416, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.create_destroy.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001417, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.create_destroy.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001418, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.create_destroy.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001419, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.create_destroy.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001420, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.create_destroy.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001421, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.create_destroy.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001422, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.create_destroy.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001423, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.create_destroy.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001424, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.create_destroy.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001425, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.create_destroy.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001426, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.create_destroy.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001427, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.create_destroy.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001428, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.create_destroy.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001429, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.create_destroy.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001430, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.create_destroy.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001431, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.create_destroy.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001432, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.create_destroy.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001433, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.create_destroy.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001434, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.create_destroy.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001435, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.create_destroy.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001436, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.images.teximage2d.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001437, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.images.teximage2d.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001438, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.images.teximage2d.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001439, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.images.teximage2d.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001440, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.images.teximage2d.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001441, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.images.teximage2d.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001442, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.images.teximage2d.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001443, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.images.teximage2d.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001444, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.images.teximage2d.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001445, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.images.teximage2d.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001446, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.images.teximage2d.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001447, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.images.teximage2d.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001448, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.images.teximage2d.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001449, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.images.teximage2d.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001450, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.images.teximage2d.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001451, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.images.teximage2d.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001452, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.images.teximage2d.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001453, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.images.teximage2d.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001454, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.images.teximage2d.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001455, "dEQP-EGL.functional.sharing.gles2.mu",
    "ltithread.random.images.teximage2d.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001456, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.images.texsubimage2d.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001457, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.images.texsubimage2d.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001458, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.images.texsubimage2d.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001459, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.images.texsubimage2d.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001460, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.images.texsubimage2d.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001461, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.images.texsubimage2d.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001462, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.images.texsubimage2d.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001463, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.images.texsubimage2d.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001464, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.images.texsubimage2d.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001465, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.random.images.texsubimage2d.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001466, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.texsubimage2d.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001467, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.texsubimage2d.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001468, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.texsubimage2d.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001469, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.texsubimage2d.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001470, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.texsubimage2d.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001471, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.texsubimage2d.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001472, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.texsubimage2d.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001473, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.texsubimage2d.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001474, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.texsubimage2d.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001475, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.texsubimage2d.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001476, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.copyteximage2d.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001477, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.copyteximage2d.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001478, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.copyteximage2d.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001479, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.copyteximage2d.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001480, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.copyteximage2d.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001481, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.copyteximage2d.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001482, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.copyteximage2d.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001483, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.copyteximage2d.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001484, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.copyteximage2d.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001485, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.copyteximage2d.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001486, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.copyteximage2d.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001487, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.copyteximage2d.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001488, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.copyteximage2d.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001489, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.copyteximage2d.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001490, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.copyteximage2d.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001491, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.copyteximage2d.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001492, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.copyteximage2d.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001493, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.copyteximage2d.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001494, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.copyteximage2d.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001495, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random.images.copyteximage2d.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001496, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.images.copytexsubimage2d.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001497, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.images.copytexsubimage2d.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001498, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.images.copytexsubimage2d.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001499, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.images.copytexsubimage2d.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001500, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.images.copytexsubimage2d.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001501, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.images.copytexsubimage2d.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001502, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.images.copytexsubimage2d.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001503, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.images.copytexsubimage2d.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001504, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.images.copytexsubimage2d.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001505, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random.images.copytexsubimage2d.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001506, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random.images.copytexsubimage2d.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001507, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random.images.copytexsubimage2d.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001508, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random.images.copytexsubimage2d.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001509, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random.images.copytexsubimage2d.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001510, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random.images.copytexsubimage2d.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001511, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random.images.copytexsubimage2d.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001512, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random.images.copytexsubimage2d.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001513, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random.images.copytexsubimage2d.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001514, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random.images.copytexsubimage2d.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001515, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random.images.copytexsubimage2d.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001516, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.simple_egl_sync.buffers.gen_delete");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001517, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.simple_egl_sync.buffers.bufferdata");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001518, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.simple_egl_sync.buffers.buffersubdata");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001519, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.simple_egl_sync.buffers.bufferdata_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001520, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".simple_egl_sync.buffers.buffersubdata_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001521, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.simple_egl_sync.textures.gen_delete");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001522, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.simple_egl_sync.textures.teximage2d");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001523, "dEQP-EGL.functional.sharing.gles2.multithread.s",
    "imple_egl_sync.textures.teximage2d_texsubimage2d");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001524, "dEQP-EGL.functional.sharing.gles2.multithread.sim",
    "ple_egl_sync.textures.teximage2d_copytexsubimage2d");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001525, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.simple_egl_sync.textures.teximage2d_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001526, "dEQP-EGL.functional.sharing.gles2.multithread.simpl",
    "e_egl_sync.textures.teximage2d_texsubimage2d_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001527, "dEQP-EGL.functional.sharing.gles2.multithread.simple_",
    "egl_sync.textures.teximage2d_copytexsubimage2d_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001528, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.simple_egl_sync.textures.copyteximage2d");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001529, "dEQP-EGL.functional.sharing.gles2.multithread.sim",
    "ple_egl_sync.textures.copyteximage2d_texsubimage2d");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001530, "dEQP-EGL.functional.sharing.gles2.multithread.simpl",
    "e_egl_sync.textures.copyteximage2d_copytexsubimage2d");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001531, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "simple_egl_sync.textures.copyteximage2d_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001532, "dEQP-EGL.functional.sharing.gles2.multithread.simple_",
    "egl_sync.textures.copyteximage2d_texsubimage2d_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001533, "dEQP-EGL.functional.sharing.gles2.multithread.simple_eg",
    "l_sync.textures.copyteximage2d_copytexsubimage2d_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001534, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.simple_egl_sync.shaders.vtx_create_destroy");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001535, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.simple_egl_sync.shaders.vtx_shadersource");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001536, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.simple_egl_sync.shaders.vtx_compile");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001537, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.simple_egl_sync.shaders.frag_create_destroy");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001538, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.simple_egl_sync.shaders.frag_shadersource");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001539, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.simple_egl_sync.shaders.frag_compile");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001540, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.simple_egl_sync.programs.create_destroy");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001541, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.simple_egl_sync.programs.attach");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001542, "dEQP-EGL.functional.sharing.gles2.mul",
    "tithread.simple_egl_sync.programs.link");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001543, "dEQP-EGL.functional.sharing.gles2.multithread.sim",
    "ple_egl_sync.images.texture_source.create_destroy");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001544, "dEQP-EGL.functional.sharing.gles2.multithread.sim",
    "ple_egl_sync.images.texture_source.create_texture");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001545, "dEQP-EGL.functional.sharing.gles2.multithread.si",
    "mple_egl_sync.images.texture_source.texsubimage2d");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001546, "dEQP-EGL.functional.sharing.gles2.multithread.simp",
    "le_egl_sync.images.texture_source.copytexsubimage2d");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001547, "dEQP-EGL.functional.sharing.gles2.multithread.s",
    "imple_egl_sync.images.texture_source.teximage2d");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001548, "dEQP-EGL.functional.sharing.gles2.multithread.sim",
    "ple_egl_sync.images.texture_source.copyteximage2d");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001549, "dEQP-EGL.functional.sharing.gles2.multithread.simple",
    "_egl_sync.images.texture_source.create_texture_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001550, "dEQP-EGL.functional.sharing.gles2.multithread.simple",
    "_egl_sync.images.texture_source.texsubimage2d_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001551, "dEQP-EGL.functional.sharing.gles2.multithread.simple_e",
    "gl_sync.images.texture_source.copytexsubimage2d_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001552, "dEQP-EGL.functional.sharing.gles2.multithread.simp",
    "le_egl_sync.images.texture_source.teximage2d_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001553, "dEQP-EGL.functional.sharing.gles2.multithread.simple",
    "_egl_sync.images.texture_source.copyteximage2d_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001554, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.textures.gen_delete.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001555, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.textures.gen_delete.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001556, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.textures.gen_delete.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001557, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.textures.gen_delete.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001558, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.textures.gen_delete.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001559, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.textures.gen_delete.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001560, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.textures.gen_delete.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001561, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.textures.gen_delete.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001562, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.textures.gen_delete.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001563, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.textures.gen_delete.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001564, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.textures.gen_delete.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001565, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.textures.gen_delete.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001566, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.textures.gen_delete.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001567, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.textures.gen_delete.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001568, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.textures.gen_delete.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001569, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.textures.gen_delete.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001570, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.textures.gen_delete.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001571, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.textures.gen_delete.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001572, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.textures.gen_delete.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001573, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.textures.gen_delete.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001574, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.textures.teximage2d.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001575, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.textures.teximage2d.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001576, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.textures.teximage2d.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001577, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.textures.teximage2d.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001578, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.textures.teximage2d.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001579, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.textures.teximage2d.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001580, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.textures.teximage2d.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001581, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.textures.teximage2d.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001582, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.textures.teximage2d.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001583, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.textures.teximage2d.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001584, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.textures.teximage2d.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001585, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.textures.teximage2d.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001586, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.textures.teximage2d.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001587, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.textures.teximage2d.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001588, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.textures.teximage2d.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001589, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.textures.teximage2d.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001590, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.textures.teximage2d.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001591, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.textures.teximage2d.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001592, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.textures.teximage2d.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001593, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.textures.teximage2d.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001594, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.textures.texsubimage2d.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001595, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.textures.texsubimage2d.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001596, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.textures.texsubimage2d.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001597, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.textures.texsubimage2d.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001598, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.textures.texsubimage2d.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001599, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.textures.texsubimage2d.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001600, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.textures.texsubimage2d.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001601, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.textures.texsubimage2d.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001602, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.textures.texsubimage2d.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001603, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.textures.texsubimage2d.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001604, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.textures.texsubimage2d.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001605, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.textures.texsubimage2d.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001606, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.textures.texsubimage2d.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001607, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.textures.texsubimage2d.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001608, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.textures.texsubimage2d.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001609, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.textures.texsubimage2d.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001610, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.textures.texsubimage2d.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001611, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.textures.texsubimage2d.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001612, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.textures.texsubimage2d.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001613, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.textures.texsubimage2d.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001614, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.textures.copyteximage2d.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001615, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.textures.copyteximage2d.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001616, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.textures.copyteximage2d.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001617, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.textures.copyteximage2d.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001618, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.textures.copyteximage2d.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001619, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.textures.copyteximage2d.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001620, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.textures.copyteximage2d.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001621, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.textures.copyteximage2d.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001622, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.textures.copyteximage2d.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001623, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.textures.copyteximage2d.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001624, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.textures.copyteximage2d.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001625, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.textures.copyteximage2d.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001626, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.textures.copyteximage2d.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001627, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.textures.copyteximage2d.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001628, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.textures.copyteximage2d.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001629, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.textures.copyteximage2d.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001630, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.textures.copyteximage2d.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001631, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.textures.copyteximage2d.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001632, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.textures.copyteximage2d.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001633, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.textures.copyteximage2d.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001634, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_sync.textures.copytexsubimage2d.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001635, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_sync.textures.copytexsubimage2d.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001636, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_sync.textures.copytexsubimage2d.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001637, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_sync.textures.copytexsubimage2d.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001638, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_sync.textures.copytexsubimage2d.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001639, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_sync.textures.copytexsubimage2d.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001640, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_sync.textures.copytexsubimage2d.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001641, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_sync.textures.copytexsubimage2d.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001642, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_sync.textures.copytexsubimage2d.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001643, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_sync.textures.copytexsubimage2d.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001644, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_sync.textures.copytexsubimage2d.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001645, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_sync.textures.copytexsubimage2d.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001646, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_sync.textures.copytexsubimage2d.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001647, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_sync.textures.copytexsubimage2d.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001648, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_sync.textures.copytexsubimage2d.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001649, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_sync.textures.copytexsubimage2d.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001650, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_sync.textures.copytexsubimage2d.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001651, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_sync.textures.copytexsubimage2d.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001652, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_sync.textures.copytexsubimage2d.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001653, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_sync.textures.copytexsubimage2d.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001654, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.gen_delete.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001655, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.gen_delete.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001656, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.gen_delete.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001657, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.gen_delete.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001658, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.gen_delete.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001659, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.gen_delete.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001660, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.gen_delete.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001661, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.gen_delete.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001662, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.gen_delete.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001663, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.gen_delete.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001664, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.gen_delete.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001665, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.gen_delete.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001666, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.gen_delete.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001667, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.gen_delete.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001668, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.gen_delete.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001669, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.gen_delete.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001670, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.gen_delete.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001671, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.gen_delete.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001672, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.gen_delete.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001673, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.gen_delete.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001674, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.bufferdata.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001675, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.bufferdata.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001676, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.bufferdata.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001677, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.bufferdata.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001678, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.bufferdata.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001679, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.bufferdata.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001680, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.bufferdata.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001681, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.bufferdata.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001682, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.bufferdata.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001683, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.bufferdata.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001684, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.bufferdata.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001685, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.bufferdata.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001686, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.bufferdata.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001687, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.bufferdata.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001688, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.bufferdata.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001689, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.bufferdata.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001690, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.bufferdata.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001691, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.bufferdata.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001692, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.bufferdata.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001693, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.buffers.bufferdata.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001694, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.buffers.buffersubdata.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001695, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.buffers.buffersubdata.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001696, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.buffers.buffersubdata.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001697, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.buffers.buffersubdata.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001698, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.buffers.buffersubdata.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001699, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.buffers.buffersubdata.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001700, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.buffers.buffersubdata.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001701, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.buffers.buffersubdata.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001702, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.buffers.buffersubdata.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001703, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.buffers.buffersubdata.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001704, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.buffers.buffersubdata.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001705, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.buffers.buffersubdata.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001706, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.buffers.buffersubdata.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001707, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.buffers.buffersubdata.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001708, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.buffers.buffersubdata.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001709, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.buffers.buffersubdata.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001710, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.buffers.buffersubdata.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001711, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.buffers.buffersubdata.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001712, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.buffers.buffersubdata.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001713, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.buffers.buffersubdata.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001714, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.shaders.create_destroy.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001715, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.shaders.create_destroy.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001716, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.shaders.create_destroy.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001717, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.shaders.create_destroy.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001718, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.shaders.create_destroy.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001719, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.shaders.create_destroy.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001720, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.shaders.create_destroy.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001721, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.shaders.create_destroy.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001722, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.shaders.create_destroy.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001723, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.shaders.create_destroy.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001724, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.shaders.create_destroy.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001725, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.shaders.create_destroy.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001726, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.shaders.create_destroy.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001727, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.shaders.create_destroy.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001728, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.shaders.create_destroy.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001729, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.shaders.create_destroy.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001730, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.shaders.create_destroy.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001731, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.shaders.create_destroy.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001732, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.shaders.create_destroy.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001733, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.shaders.create_destroy.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001734, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.shaders.source.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001735, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.shaders.source.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001736, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.shaders.source.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001737, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.shaders.source.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001738, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.shaders.source.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001739, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.shaders.source.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001740, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.shaders.source.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001741, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.shaders.source.7");