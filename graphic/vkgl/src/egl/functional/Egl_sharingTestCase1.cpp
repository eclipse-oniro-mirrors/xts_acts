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

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001742, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.shaders.source.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001743, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.shaders.source.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001744, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.shaders.source.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001745, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.shaders.source.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001746, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.shaders.source.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001747, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.shaders.source.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001748, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.shaders.source.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001749, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.shaders.source.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001750, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.shaders.source.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001751, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.shaders.source.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001752, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.shaders.source.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001753, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.shaders.source.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001754, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.shaders.compile.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001755, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.shaders.compile.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001756, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.shaders.compile.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001757, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.shaders.compile.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001758, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.shaders.compile.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001759, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.shaders.compile.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001760, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.shaders.compile.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001761, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.shaders.compile.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001762, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.shaders.compile.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001763, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.shaders.compile.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001764, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random_egl_sync.shaders.compile.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001765, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random_egl_sync.shaders.compile.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001766, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random_egl_sync.shaders.compile.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001767, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random_egl_sync.shaders.compile.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001768, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random_egl_sync.shaders.compile.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001769, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random_egl_sync.shaders.compile.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001770, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random_egl_sync.shaders.compile.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001771, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random_egl_sync.shaders.compile.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001772, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random_egl_sync.shaders.compile.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001773, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random_egl_sync.shaders.compile.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001774, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.programs.create_destroy.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001775, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.programs.create_destroy.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001776, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.programs.create_destroy.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001777, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.programs.create_destroy.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001778, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.programs.create_destroy.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001779, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.programs.create_destroy.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001780, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.programs.create_destroy.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001781, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.programs.create_destroy.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001782, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.programs.create_destroy.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001783, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.programs.create_destroy.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001784, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.programs.create_destroy.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001785, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.programs.create_destroy.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001786, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.programs.create_destroy.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001787, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.programs.create_destroy.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001788, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.programs.create_destroy.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001789, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.programs.create_destroy.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001790, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.programs.create_destroy.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001791, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.programs.create_destroy.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001792, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.programs.create_destroy.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001793, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.programs.create_destroy.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001794, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.programs.attach_detach.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001795, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.programs.attach_detach.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001796, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.programs.attach_detach.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001797, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.programs.attach_detach.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001798, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.programs.attach_detach.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001799, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.programs.attach_detach.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001800, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.programs.attach_detach.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001801, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.programs.attach_detach.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001802, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.programs.attach_detach.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001803, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.programs.attach_detach.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001804, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.programs.attach_detach.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001805, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.programs.attach_detach.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001806, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.programs.attach_detach.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001807, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.programs.attach_detach.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001808, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.programs.attach_detach.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001809, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.programs.attach_detach.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001810, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.programs.attach_detach.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001811, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.programs.attach_detach.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001812, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.programs.attach_detach.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001813, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.programs.attach_detach.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001814, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random_egl_sync.programs.link.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001815, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random_egl_sync.programs.link.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001816, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random_egl_sync.programs.link.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001817, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random_egl_sync.programs.link.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001818, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random_egl_sync.programs.link.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001819, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random_egl_sync.programs.link.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001820, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random_egl_sync.programs.link.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001821, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random_egl_sync.programs.link.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001822, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random_egl_sync.programs.link.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001823, "dEQP-EGL.functional.sharing.gles2.mult",
    "ithread.random_egl_sync.programs.link.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001824, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.programs.link.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001825, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.programs.link.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001826, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.programs.link.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001827, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.programs.link.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001828, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.programs.link.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001829, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.programs.link.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001830, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.programs.link.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001831, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.programs.link.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001832, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.programs.link.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001833, "dEQP-EGL.functional.sharing.gles2.multi",
    "thread.random_egl_sync.programs.link.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001834, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.create_destroy.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001835, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.create_destroy.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001836, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.create_destroy.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001837, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.create_destroy.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001838, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.create_destroy.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001839, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.create_destroy.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001840, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.create_destroy.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001841, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.create_destroy.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001842, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.create_destroy.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001843, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.create_destroy.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001844, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.images.create_destroy.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001845, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.images.create_destroy.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001846, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.images.create_destroy.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001847, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.images.create_destroy.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001848, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.images.create_destroy.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001849, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.images.create_destroy.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001850, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.images.create_destroy.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001851, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.images.create_destroy.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001852, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.images.create_destroy.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001853, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.images.create_destroy.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001854, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random_egl_sync.images.teximage2d.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001855, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random_egl_sync.images.teximage2d.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001856, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random_egl_sync.images.teximage2d.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001857, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random_egl_sync.images.teximage2d.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001858, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random_egl_sync.images.teximage2d.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001859, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random_egl_sync.images.teximage2d.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001860, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random_egl_sync.images.teximage2d.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001861, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random_egl_sync.images.teximage2d.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001862, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random_egl_sync.images.teximage2d.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001863, "dEQP-EGL.functional.sharing.gles2.multit",
    "hread.random_egl_sync.images.teximage2d.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001864, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.images.teximage2d.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001865, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.images.teximage2d.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001866, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.images.teximage2d.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001867, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.images.teximage2d.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001868, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.images.teximage2d.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001869, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.images.teximage2d.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001870, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.images.teximage2d.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001871, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.images.teximage2d.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001872, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.images.teximage2d.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001873, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.random_egl_sync.images.teximage2d.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001874, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.texsubimage2d.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001875, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.texsubimage2d.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001876, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.texsubimage2d.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001877, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.texsubimage2d.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001878, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.texsubimage2d.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001879, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.texsubimage2d.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001880, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.texsubimage2d.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001881, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.texsubimage2d.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001882, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.texsubimage2d.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001883, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.texsubimage2d.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001884, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.texsubimage2d.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001885, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.texsubimage2d.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001886, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.texsubimage2d.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001887, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.texsubimage2d.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001888, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.texsubimage2d.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001889, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.texsubimage2d.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001890, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.texsubimage2d.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001891, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.texsubimage2d.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001892, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.texsubimage2d.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001893, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.texsubimage2d.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001894, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.copyteximage2d.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001895, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.copyteximage2d.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001896, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.copyteximage2d.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001897, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.copyteximage2d.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001898, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.copyteximage2d.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001899, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.copyteximage2d.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001900, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.copyteximage2d.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001901, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.copyteximage2d.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001902, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.copyteximage2d.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001903, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_sync.images.copyteximage2d.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001904, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.images.copyteximage2d.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001905, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.images.copyteximage2d.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001906, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.images.copyteximage2d.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001907, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.images.copyteximage2d.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001908, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.images.copyteximage2d.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001909, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.images.copyteximage2d.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001910, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.images.copyteximage2d.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001911, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.images.copyteximage2d.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001912, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.images.copyteximage2d.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001913, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_sync.images.copyteximage2d.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001914, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.images.copytexsubimage2d.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001915, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.images.copytexsubimage2d.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001916, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.images.copytexsubimage2d.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001917, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.images.copytexsubimage2d.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001918, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.images.copytexsubimage2d.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001919, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.images.copytexsubimage2d.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001920, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.images.copytexsubimage2d.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001921, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.images.copytexsubimage2d.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001922, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.images.copytexsubimage2d.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001923, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.images.copytexsubimage2d.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001924, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.images.copytexsubimage2d.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001925, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.images.copytexsubimage2d.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001926, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.images.copytexsubimage2d.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001927, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.images.copytexsubimage2d.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001928, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.images.copytexsubimage2d.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001929, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.images.copytexsubimage2d.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001930, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.images.copytexsubimage2d.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001931, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.images.copytexsubimage2d.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001932, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.images.copytexsubimage2d.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001933, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_sync.images.copytexsubimage2d.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001934, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.simple_egl_server_sync.buffers.gen_delete");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001935, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.simple_egl_server_sync.buffers.bufferdata");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001936, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".simple_egl_server_sync.buffers.buffersubdata");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001937, "dEQP-EGL.functional.sharing.gles2.multithread.s",
    "imple_egl_server_sync.buffers.bufferdata_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001938, "dEQP-EGL.functional.sharing.gles2.multithread.si",
    "mple_egl_server_sync.buffers.buffersubdata_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001939, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.simple_egl_server_sync.textures.gen_delete");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001940, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.simple_egl_server_sync.textures.teximage2d");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001941, "dEQP-EGL.functional.sharing.gles2.multithread.simpl",
    "e_egl_server_sync.textures.teximage2d_texsubimage2d");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001942, "dEQP-EGL.functional.sharing.gles2.multithread.simple_",
    "egl_server_sync.textures.teximage2d_copytexsubimage2d");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001943, "dEQP-EGL.functional.sharing.gles2.multithread.s",
    "imple_egl_server_sync.textures.teximage2d_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001944, "dEQP-EGL.functional.sharing.gles2.multithread.simple_e",
    "gl_server_sync.textures.teximage2d_texsubimage2d_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001945, "dEQP-EGL.functional.sharing.gles2.multithread.simple_egl",
    "_server_sync.textures.teximage2d_copytexsubimage2d_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001946, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "simple_egl_server_sync.textures.copyteximage2d");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001947, "dEQP-EGL.functional.sharing.gles2.multithread.simple_",
    "egl_server_sync.textures.copyteximage2d_texsubimage2d");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001948, "dEQP-EGL.functional.sharing.gles2.multithread.simple_eg",
    "l_server_sync.textures.copyteximage2d_copytexsubimage2d");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001949, "dEQP-EGL.functional.sharing.gles2.multithread.sim",
    "ple_egl_server_sync.textures.copyteximage2d_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001950, "dEQP-EGL.functional.sharing.gles2.multithread.simple_egl",
    "_server_sync.textures.copyteximage2d_texsubimage2d_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001951, "dEQP-EGL.functional.sharing.gles2.multithread.simple_egl_s",
    "erver_sync.textures.copyteximage2d_copytexsubimage2d_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001952, "dEQP-EGL.functional.sharing.gles2.multithread.s",
    "imple_egl_server_sync.shaders.vtx_create_destroy");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001953, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "simple_egl_server_sync.shaders.vtx_shadersource");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001954, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.simple_egl_server_sync.shaders.vtx_compile");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001955, "dEQP-EGL.functional.sharing.gles2.multithread.si",
    "mple_egl_server_sync.shaders.frag_create_destroy");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001956, "dEQP-EGL.functional.sharing.gles2.multithread.s",
    "imple_egl_server_sync.shaders.frag_shadersource");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001957, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.simple_egl_server_sync.shaders.frag_compile");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001958, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "simple_egl_server_sync.programs.create_destroy");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001959, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.simple_egl_server_sync.programs.attach");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001960, "dEQP-EGL.functional.sharing.gles2.multith",
    "read.simple_egl_server_sync.programs.link");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001961, "dEQP-EGL.functional.sharing.gles2.multithread.simple",
    "_egl_server_sync.images.texture_source.create_destroy");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001962, "dEQP-EGL.functional.sharing.gles2.multithread.simple",
    "_egl_server_sync.images.texture_source.create_texture");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001963, "dEQP-EGL.functional.sharing.gles2.multithread.simple",
    "_egl_server_sync.images.texture_source.texsubimage2d");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001964, "dEQP-EGL.functional.sharing.gles2.multithread.simple_e",
    "gl_server_sync.images.texture_source.copytexsubimage2d");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001965, "dEQP-EGL.functional.sharing.gles2.multithread.simp",
    "le_egl_server_sync.images.texture_source.teximage2d");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001966, "dEQP-EGL.functional.sharing.gles2.multithread.simple",
    "_egl_server_sync.images.texture_source.copyteximage2d");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001967, "dEQP-EGL.functional.sharing.gles2.multithread.simple_egl",
    "_server_sync.images.texture_source.create_texture_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001968, "dEQP-EGL.functional.sharing.gles2.multithread.simple_eg",
    "l_server_sync.images.texture_source.texsubimage2d_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001969, "dEQP-EGL.functional.sharing.gles2.multithread.simple_egl_",
    "server_sync.images.texture_source.copytexsubimage2d_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001970, "dEQP-EGL.functional.sharing.gles2.multithread.simple_e",
    "gl_server_sync.images.texture_source.teximage2d_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001971, "dEQP-EGL.functional.sharing.gles2.multithread.simple_egl",
    "_server_sync.images.texture_source.copyteximage2d_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001972, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.gen_delete.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001973, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.gen_delete.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001974, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.gen_delete.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001975, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.gen_delete.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001976, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.gen_delete.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001977, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.gen_delete.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001978, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.gen_delete.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001979, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.gen_delete.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001980, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.gen_delete.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001981, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.gen_delete.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001982, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.gen_delete.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001983, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.gen_delete.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001984, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.gen_delete.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001985, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.gen_delete.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001986, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.gen_delete.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001987, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.gen_delete.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001988, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.gen_delete.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001989, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.gen_delete.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001990, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.gen_delete.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001991, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.gen_delete.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001992, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.teximage2d.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001993, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.teximage2d.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001994, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.teximage2d.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001995, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.teximage2d.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001996, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.teximage2d.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001997, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.teximage2d.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001998, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.teximage2d.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC001999, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.teximage2d.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002000, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.teximage2d.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002001, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.teximage2d.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002002, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.teximage2d.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002003, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.teximage2d.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002004, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.teximage2d.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002005, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.teximage2d.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002006, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.teximage2d.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002007, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.teximage2d.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002008, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.teximage2d.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002009, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.teximage2d.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002010, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.teximage2d.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002011, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.textures.teximage2d.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002012, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.textures.texsubimage2d.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002013, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.textures.texsubimage2d.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002014, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.textures.texsubimage2d.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002015, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.textures.texsubimage2d.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002016, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.textures.texsubimage2d.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002017, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.textures.texsubimage2d.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002018, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.textures.texsubimage2d.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002019, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.textures.texsubimage2d.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002020, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.textures.texsubimage2d.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002021, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.textures.texsubimage2d.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002022, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.textures.texsubimage2d.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002023, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.textures.texsubimage2d.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002024, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.textures.texsubimage2d.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002025, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.textures.texsubimage2d.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002026, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.textures.texsubimage2d.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002027, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.textures.texsubimage2d.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002028, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.textures.texsubimage2d.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002029, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.textures.texsubimage2d.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002030, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.textures.texsubimage2d.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002031, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.textures.texsubimage2d.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002032, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.textures.copyteximage2d.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002033, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.textures.copyteximage2d.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002034, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.textures.copyteximage2d.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002035, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.textures.copyteximage2d.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002036, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.textures.copyteximage2d.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002037, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.textures.copyteximage2d.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002038, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.textures.copyteximage2d.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002039, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.textures.copyteximage2d.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002040, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.textures.copyteximage2d.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002041, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.textures.copyteximage2d.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002042, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.textures.copyteximage2d.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002043, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.textures.copyteximage2d.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002044, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.textures.copyteximage2d.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002045, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.textures.copyteximage2d.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002046, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.textures.copyteximage2d.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002047, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.textures.copyteximage2d.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002048, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.textures.copyteximage2d.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002049, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.textures.copyteximage2d.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002050, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.textures.copyteximage2d.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002051, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.textures.copyteximage2d.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002052, "dEQP-EGL.functional.sharing.gles2.multithread.ra",
    "ndom_egl_server_sync.textures.copytexsubimage2d.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002053, "dEQP-EGL.functional.sharing.gles2.multithread.ra",
    "ndom_egl_server_sync.textures.copytexsubimage2d.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002054, "dEQP-EGL.functional.sharing.gles2.multithread.ra",
    "ndom_egl_server_sync.textures.copytexsubimage2d.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002055, "dEQP-EGL.functional.sharing.gles2.multithread.ra",
    "ndom_egl_server_sync.textures.copytexsubimage2d.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002056, "dEQP-EGL.functional.sharing.gles2.multithread.ra",
    "ndom_egl_server_sync.textures.copytexsubimage2d.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002057, "dEQP-EGL.functional.sharing.gles2.multithread.ra",
    "ndom_egl_server_sync.textures.copytexsubimage2d.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002058, "dEQP-EGL.functional.sharing.gles2.multithread.ra",
    "ndom_egl_server_sync.textures.copytexsubimage2d.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002059, "dEQP-EGL.functional.sharing.gles2.multithread.ra",
    "ndom_egl_server_sync.textures.copytexsubimage2d.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002060, "dEQP-EGL.functional.sharing.gles2.multithread.ra",
    "ndom_egl_server_sync.textures.copytexsubimage2d.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002061, "dEQP-EGL.functional.sharing.gles2.multithread.ra",
    "ndom_egl_server_sync.textures.copytexsubimage2d.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002062, "dEQP-EGL.functional.sharing.gles2.multithread.ran",
    "dom_egl_server_sync.textures.copytexsubimage2d.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002063, "dEQP-EGL.functional.sharing.gles2.multithread.ran",
    "dom_egl_server_sync.textures.copytexsubimage2d.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002064, "dEQP-EGL.functional.sharing.gles2.multithread.ran",
    "dom_egl_server_sync.textures.copytexsubimage2d.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002065, "dEQP-EGL.functional.sharing.gles2.multithread.ran",
    "dom_egl_server_sync.textures.copytexsubimage2d.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002066, "dEQP-EGL.functional.sharing.gles2.multithread.ran",
    "dom_egl_server_sync.textures.copytexsubimage2d.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002067, "dEQP-EGL.functional.sharing.gles2.multithread.ran",
    "dom_egl_server_sync.textures.copytexsubimage2d.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002068, "dEQP-EGL.functional.sharing.gles2.multithread.ran",
    "dom_egl_server_sync.textures.copytexsubimage2d.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002069, "dEQP-EGL.functional.sharing.gles2.multithread.ran",
    "dom_egl_server_sync.textures.copytexsubimage2d.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002070, "dEQP-EGL.functional.sharing.gles2.multithread.ran",
    "dom_egl_server_sync.textures.copytexsubimage2d.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002071, "dEQP-EGL.functional.sharing.gles2.multithread.ran",
    "dom_egl_server_sync.textures.copytexsubimage2d.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002072, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.buffers.gen_delete.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002073, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.buffers.gen_delete.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002074, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.buffers.gen_delete.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002075, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.buffers.gen_delete.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002076, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.buffers.gen_delete.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002077, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.buffers.gen_delete.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002078, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.buffers.gen_delete.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002079, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.buffers.gen_delete.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002080, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.buffers.gen_delete.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002081, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.buffers.gen_delete.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002082, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.buffers.gen_delete.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002083, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.buffers.gen_delete.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002084, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.buffers.gen_delete.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002085, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.buffers.gen_delete.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002086, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.buffers.gen_delete.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002087, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.buffers.gen_delete.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002088, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.buffers.gen_delete.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002089, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.buffers.gen_delete.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002090, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.buffers.gen_delete.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002091, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.buffers.gen_delete.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002092, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.buffers.bufferdata.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002093, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.buffers.bufferdata.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002094, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.buffers.bufferdata.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002095, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.buffers.bufferdata.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002096, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.buffers.bufferdata.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002097, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.buffers.bufferdata.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002098, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.buffers.bufferdata.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002099, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.buffers.bufferdata.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002100, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.buffers.bufferdata.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002101, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.buffers.bufferdata.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002102, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.buffers.bufferdata.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002103, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.buffers.bufferdata.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002104, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.buffers.bufferdata.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002105, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.buffers.bufferdata.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002106, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.buffers.bufferdata.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002107, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.buffers.bufferdata.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002108, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.buffers.bufferdata.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002109, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.buffers.bufferdata.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002110, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.buffers.bufferdata.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002111, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.buffers.bufferdata.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002112, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.buffers.buffersubdata.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002113, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.buffers.buffersubdata.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002114, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.buffers.buffersubdata.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002115, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.buffers.buffersubdata.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002116, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.buffers.buffersubdata.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002117, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.buffers.buffersubdata.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002118, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.buffers.buffersubdata.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002119, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.buffers.buffersubdata.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002120, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.buffers.buffersubdata.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002121, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.buffers.buffersubdata.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002122, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.buffers.buffersubdata.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002123, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.buffers.buffersubdata.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002124, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.buffers.buffersubdata.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002125, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.buffers.buffersubdata.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002126, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.buffers.buffersubdata.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002127, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.buffers.buffersubdata.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002128, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.buffers.buffersubdata.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002129, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.buffers.buffersubdata.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002130, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.buffers.buffersubdata.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002131, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.buffers.buffersubdata.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002132, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.shaders.create_destroy.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002133, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.shaders.create_destroy.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002134, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.shaders.create_destroy.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002135, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.shaders.create_destroy.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002136, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.shaders.create_destroy.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002137, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.shaders.create_destroy.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002138, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.shaders.create_destroy.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002139, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.shaders.create_destroy.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002140, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.shaders.create_destroy.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002141, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.shaders.create_destroy.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002142, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.shaders.create_destroy.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002143, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.shaders.create_destroy.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002144, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.shaders.create_destroy.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002145, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.shaders.create_destroy.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002146, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.shaders.create_destroy.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002147, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.shaders.create_destroy.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002148, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.shaders.create_destroy.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002149, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.shaders.create_destroy.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002150, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.shaders.create_destroy.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002151, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.shaders.create_destroy.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002152, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_server_sync.shaders.source.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002153, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_server_sync.shaders.source.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002154, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_server_sync.shaders.source.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002155, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_server_sync.shaders.source.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002156, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_server_sync.shaders.source.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002157, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_server_sync.shaders.source.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002158, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_server_sync.shaders.source.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002159, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_server_sync.shaders.source.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002160, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_server_sync.shaders.source.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002161, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_server_sync.shaders.source.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002162, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_server_sync.shaders.source.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002163, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_server_sync.shaders.source.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002164, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_server_sync.shaders.source.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002165, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_server_sync.shaders.source.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002166, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_server_sync.shaders.source.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002167, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_server_sync.shaders.source.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002168, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_server_sync.shaders.source.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002169, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_server_sync.shaders.source.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002170, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_server_sync.shaders.source.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002171, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_server_sync.shaders.source.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002172, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_server_sync.shaders.compile.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002173, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_server_sync.shaders.compile.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002174, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_server_sync.shaders.compile.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002175, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_server_sync.shaders.compile.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002176, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_server_sync.shaders.compile.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002177, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_server_sync.shaders.compile.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002178, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_server_sync.shaders.compile.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002179, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_server_sync.shaders.compile.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002180, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_server_sync.shaders.compile.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002181, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_server_sync.shaders.compile.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002182, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_server_sync.shaders.compile.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002183, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_server_sync.shaders.compile.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002184, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_server_sync.shaders.compile.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002185, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_server_sync.shaders.compile.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002186, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_server_sync.shaders.compile.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002187, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_server_sync.shaders.compile.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002188, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_server_sync.shaders.compile.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002189, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_server_sync.shaders.compile.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002190, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_server_sync.shaders.compile.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002191, "dEQP-EGL.functional.sharing.gles2.multithre",
    "ad.random_egl_server_sync.shaders.compile.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002192, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.programs.create_destroy.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002193, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.programs.create_destroy.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002194, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.programs.create_destroy.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002195, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.programs.create_destroy.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002196, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.programs.create_destroy.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002197, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.programs.create_destroy.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002198, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.programs.create_destroy.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002199, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.programs.create_destroy.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002200, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.programs.create_destroy.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002201, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.programs.create_destroy.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002202, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.programs.create_destroy.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002203, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.programs.create_destroy.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002204, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.programs.create_destroy.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002205, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.programs.create_destroy.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002206, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.programs.create_destroy.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002207, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.programs.create_destroy.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002208, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.programs.create_destroy.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002209, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.programs.create_destroy.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002210, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.programs.create_destroy.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002211, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.programs.create_destroy.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002212, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.programs.attach_detach.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002213, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.programs.attach_detach.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002214, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.programs.attach_detach.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002215, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.programs.attach_detach.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002216, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.programs.attach_detach.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002217, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.programs.attach_detach.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002218, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.programs.attach_detach.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002219, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.programs.attach_detach.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002220, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.programs.attach_detach.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002221, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.programs.attach_detach.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002222, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.programs.attach_detach.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002223, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.programs.attach_detach.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002224, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.programs.attach_detach.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002225, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.programs.attach_detach.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002226, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.programs.attach_detach.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002227, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.programs.attach_detach.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002228, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.programs.attach_detach.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002229, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.programs.attach_detach.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002230, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.programs.attach_detach.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002231, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.programs.attach_detach.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002232, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_server_sync.programs.link.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002233, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_server_sync.programs.link.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002234, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_server_sync.programs.link.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002235, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_server_sync.programs.link.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002236, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_server_sync.programs.link.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002237, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_server_sync.programs.link.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002238, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_server_sync.programs.link.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002239, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_server_sync.programs.link.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002240, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_server_sync.programs.link.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002241, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_server_sync.programs.link.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002242, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_server_sync.programs.link.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002243, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_server_sync.programs.link.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002244, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_server_sync.programs.link.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002245, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_server_sync.programs.link.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002246, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_server_sync.programs.link.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002247, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_server_sync.programs.link.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002248, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_server_sync.programs.link.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002249, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_server_sync.programs.link.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002250, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_server_sync.programs.link.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002251, "dEQP-EGL.functional.sharing.gles2.multithr",
    "ead.random_egl_server_sync.programs.link.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002252, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.create_destroy.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002253, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.create_destroy.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002254, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.create_destroy.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002255, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.create_destroy.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002256, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.create_destroy.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002257, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.create_destroy.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002258, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.create_destroy.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002259, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.create_destroy.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002260, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.create_destroy.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002261, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.create_destroy.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002262, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.create_destroy.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002263, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.create_destroy.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002264, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.create_destroy.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002265, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.create_destroy.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002266, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.create_destroy.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002267, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.create_destroy.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002268, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.create_destroy.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002269, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.create_destroy.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002270, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.create_destroy.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002271, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.create_destroy.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002272, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.images.teximage2d.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002273, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.images.teximage2d.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002274, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.images.teximage2d.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002275, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.images.teximage2d.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002276, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.images.teximage2d.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002277, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.images.teximage2d.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002278, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.images.teximage2d.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002279, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.images.teximage2d.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002280, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.images.teximage2d.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002281, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.images.teximage2d.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002282, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.images.teximage2d.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002283, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.images.teximage2d.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002284, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.images.teximage2d.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002285, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.images.teximage2d.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002286, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.images.teximage2d.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002287, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.images.teximage2d.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002288, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.images.teximage2d.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002289, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.images.teximage2d.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002290, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.images.teximage2d.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002291, "dEQP-EGL.functional.sharing.gles2.multithrea",
    "d.random_egl_server_sync.images.teximage2d.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002292, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.images.texsubimage2d.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002293, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.images.texsubimage2d.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002294, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.images.texsubimage2d.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002295, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.images.texsubimage2d.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002296, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.images.texsubimage2d.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002297, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.images.texsubimage2d.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002298, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.images.texsubimage2d.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002299, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.images.texsubimage2d.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002300, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.images.texsubimage2d.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002301, "dEQP-EGL.functional.sharing.gles2.multithread",
    ".random_egl_server_sync.images.texsubimage2d.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002302, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.texsubimage2d.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002303, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.texsubimage2d.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002304, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.texsubimage2d.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002305, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.texsubimage2d.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002306, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.texsubimage2d.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002307, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.texsubimage2d.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002308, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.texsubimage2d.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002309, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.texsubimage2d.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002310, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.texsubimage2d.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002311, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.texsubimage2d.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002312, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.copyteximage2d.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002313, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.copyteximage2d.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002314, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.copyteximage2d.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002315, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.copyteximage2d.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002316, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.copyteximage2d.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002317, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.copyteximage2d.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002318, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.copyteximage2d.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002319, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.copyteximage2d.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002320, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.copyteximage2d.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002321, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.copyteximage2d.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002322, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.copyteximage2d.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002323, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.copyteximage2d.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002324, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.copyteximage2d.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002325, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.copyteximage2d.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002326, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.copyteximage2d.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002327, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.copyteximage2d.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002328, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.copyteximage2d.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002329, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.copyteximage2d.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002330, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.copyteximage2d.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002331, "dEQP-EGL.functional.sharing.gles2.multithread.",
    "random_egl_server_sync.images.copyteximage2d.19");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002332, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.images.copytexsubimage2d.0");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002333, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.images.copytexsubimage2d.1");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002334, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.images.copytexsubimage2d.2");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002335, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.images.copytexsubimage2d.3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002336, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.images.copytexsubimage2d.4");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002337, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.images.copytexsubimage2d.5");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002338, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.images.copytexsubimage2d.6");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002339, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.images.copytexsubimage2d.7");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002340, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.images.copytexsubimage2d.8");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002341, "dEQP-EGL.functional.sharing.gles2.multithread.r",
    "andom_egl_server_sync.images.copytexsubimage2d.9");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002342, "dEQP-EGL.functional.sharing.gles2.multithread.ra",
    "ndom_egl_server_sync.images.copytexsubimage2d.10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002343, "dEQP-EGL.functional.sharing.gles2.multithread.ra",
    "ndom_egl_server_sync.images.copytexsubimage2d.11");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002344, "dEQP-EGL.functional.sharing.gles2.multithread.ra",
    "ndom_egl_server_sync.images.copytexsubimage2d.12");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002345, "dEQP-EGL.functional.sharing.gles2.multithread.ra",
    "ndom_egl_server_sync.images.copytexsubimage2d.13");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002346, "dEQP-EGL.functional.sharing.gles2.multithread.ra",
    "ndom_egl_server_sync.images.copytexsubimage2d.14");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002347, "dEQP-EGL.functional.sharing.gles2.multithread.ra",
    "ndom_egl_server_sync.images.copytexsubimage2d.15");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002348, "dEQP-EGL.functional.sharing.gles2.multithread.ra",
    "ndom_egl_server_sync.images.copytexsubimage2d.16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002349, "dEQP-EGL.functional.sharing.gles2.multithread.ra",
    "ndom_egl_server_sync.images.copytexsubimage2d.17");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002350, "dEQP-EGL.functional.sharing.gles2.multithread.ra",
    "ndom_egl_server_sync.images.copytexsubimage2d.18");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002351, "dEQP-EGL.functional.sharing.gles2.multithread.ra",
    "ndom_egl_server_sync.images.copytexsubimage2d.19");
