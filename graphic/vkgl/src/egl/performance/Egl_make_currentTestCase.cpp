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

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003753, "dEQP-EGL.performance.make_current.sim",
    "ple.context_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003754, "dEQP-EGL.performance.make_curren",
    "t.simple.context_pbuffer_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003755, "dEQP-EGL.performance.make_current.sim",
    "ple.context_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003756, "dEQP-EGL.performance.make_curre",
    "nt.simple.context_pixmap_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003757, "dEQP-EGL.performance.make_current.sim",
    "ple.context_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003758, "dEQP-EGL.performance.make_curre",
    "nt.simple.context_window_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003759, "dEQP-EGL.performance.make_current",
    ".multi_context.contexts_10_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003760, "dEQP-EGL.performance.make_current.mul",
    "ti_context.contexts_10_pbuffer_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003761, "dEQP-EGL.performance.make_current",
    ".multi_context.contexts_10_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003762, "dEQP-EGL.performance.make_current.mul",
    "ti_context.contexts_10_pixmap_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003763, "dEQP-EGL.performance.make_current",
    ".multi_context.contexts_10_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003764, "dEQP-EGL.performance.make_current.mul",
    "ti_context.contexts_10_window_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003765, "dEQP-EGL.performance.make_current.",
    "multi_context.contexts_100_pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003766, "dEQP-EGL.performance.make_current.mult",
    "i_context.contexts_100_pbuffer_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003767, "dEQP-EGL.performance.make_current",
    ".multi_context.contexts_100_pixmap");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003768, "dEQP-EGL.performance.make_current.mul",
    "ti_context.contexts_100_pixmap_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003769, "dEQP-EGL.performance.make_current",
    ".multi_context.contexts_100_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003770, "dEQP-EGL.performance.make_current.mul",
    "ti_context.contexts_100_window_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003771, "dEQP-EGL.performance.make_current",
    ".multi_sur""face.context_pbuffers_10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003772, "dEQP-EGL.performance.make_current.mul",
    "ti_sur""face.context_pbuffers_10_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003773, "dEQP-EGL.performance.make_current",
    ".multi_sur""face.context_pixmaps_10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003774, "dEQP-EGL.performance.make_current.mul",
    "ti_sur""face.context_pixmaps_10_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003775, "dEQP-EGL.performance.make_current",
    ".multi_sur""face.context_windows_10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003776, "dEQP-EGL.performance.make_current.mul",
    "ti_sur""face.context_windows_10_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003777, "dEQP-EGL.performance.make_current.mul",
    "ti_sur""face.context_pixmaps_pbuffers_10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003778, "dEQP-EGL.performance.make_current.multi_s",
    "urface.context_pixmaps_pbuffers_10_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003779, "dEQP-EGL.performance.make_current.mul",
    "ti_sur""face.context_windows_pbuffers_10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003780, "dEQP-EGL.performance.make_current.multi_s",
    "urface.context_windows_pbuffers_10_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003781, "dEQP-EGL.performance.make_current.mul",
    "ti_sur""face.context_windows_pixmaps_10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003782, "dEQP-EGL.performance.make_current.multi_s",
    "urface.context_windows_pixmaps_10_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003783, "dEQP-EGL.performance.make_current.multi_s",
    "urface.context_windows_pixmaps_pbuffers_10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003784, "dEQP-EGL.performance.make_current.multi_surfa",
    "ce.context_windows_pixmaps_pbuffers_10_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003785, "dEQP-EGL.performance.make_current.",
    "multi_sur""face.context_pbuffers_100");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003786, "dEQP-EGL.performance.make_current.mult",
    "i_sur""face.context_pbuffers_100_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003787, "dEQP-EGL.performance.make_current",
    ".multi_sur""face.context_pixmaps_100");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003788, "dEQP-EGL.performance.make_current.mul",
    "ti_sur""face.context_pixmaps_100_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003789, "dEQP-EGL.performance.make_current",
    ".multi_sur""face.context_windows_100");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003790, "dEQP-EGL.performance.make_current.mul",
    "ti_sur""face.context_windows_100_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003791, "dEQP-EGL.performance.make_current.mult",
    "i_sur""face.context_pixmaps_pbuffers_100");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003792, "dEQP-EGL.performance.make_current.multi_su",
    "rface.context_pixmaps_pbuffers_100_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003793, "dEQP-EGL.performance.make_current.mult",
    "i_sur""face.context_windows_pbuffers_100");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003794, "dEQP-EGL.performance.make_current.multi_su",
    "rface.context_windows_pbuffers_100_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003795, "dEQP-EGL.performance.make_current.mul",
    "ti_sur""face.context_windows_pixmaps_100");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003796, "dEQP-EGL.performance.make_current.multi_s",
    "urface.context_windows_pixmaps_100_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003797, "dEQP-EGL.performance.make_current.multi_su",
    "rface.context_windows_pixmaps_pbuffers_100");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003798, "dEQP-EGL.performance.make_current.multi_surfac",
    "e.context_windows_pixmaps_pbuffers_100_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003799, "dEQP-EGL.performance.make_curren",
    "t.complex.contexts_10_pbuffers_10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003800, "dEQP-EGL.performance.make_current.co",
    "mplex.contexts_10_pbuffers_10_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003801, "dEQP-EGL.performance.make_curren",
    "t.complex.contexts_10_pixmaps_10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003802, "dEQP-EGL.performance.make_current.co",
    "mplex.contexts_10_pixmaps_10_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003803, "dEQP-EGL.performance.make_curren",
    "t.complex.contexts_10_windows_10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003804, "dEQP-EGL.performance.make_current.co",
    "mplex.contexts_10_windows_10_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003805, "dEQP-EGL.performance.make_current.co",
    "mplex.contexts_10_pixmaps_pbuffers_10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003806, "dEQP-EGL.performance.make_current.comple",
    "x.contexts_10_pixmaps_pbuffers_10_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003807, "dEQP-EGL.performance.make_current.co",
    "mplex.contexts_10_windows_pbuffers_10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003808, "dEQP-EGL.performance.make_current.comple",
    "x.contexts_10_windows_pbuffers_10_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003809, "dEQP-EGL.performance.make_current.co",
    "mplex.contexts_10_windows_pixmaps_10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003810, "dEQP-EGL.performance.make_current.comple",
    "x.contexts_10_windows_pixmaps_10_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003811, "dEQP-EGL.performance.make_current.comple",
    "x.contexts_10_windows_pixmaps_pbuffers_10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003812, "dEQP-EGL.performance.make_current.complex.co",
    "ntexts_10_windows_pixmaps_pbuffers_10_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003813, "dEQP-EGL.performance.make_current",
    ".complex.contexts_100_pbuffers_10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003814, "dEQP-EGL.performance.make_current.com",
    "plex.contexts_100_pbuffers_10_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003815, "dEQP-EGL.performance.make_curren",
    "t.complex.contexts_100_pixmaps_10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003816, "dEQP-EGL.performance.make_current.co",
    "mplex.contexts_100_pixmaps_10_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003817, "dEQP-EGL.performance.make_curren",
    "t.complex.contexts_100_windows_10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003818, "dEQP-EGL.performance.make_current.co",
    "mplex.contexts_100_windows_10_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003819, "dEQP-EGL.performance.make_current.com",
    "plex.contexts_100_pixmaps_pbuffers_10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003820, "dEQP-EGL.performance.make_current.complex",
    ".contexts_100_pixmaps_pbuffers_10_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003821, "dEQP-EGL.performance.make_current.com",
    "plex.contexts_100_windows_pbuffers_10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003822, "dEQP-EGL.performance.make_current.complex",
    ".contexts_100_windows_pbuffers_10_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003823, "dEQP-EGL.performance.make_current.co",
    "mplex.contexts_100_windows_pixmaps_10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003824, "dEQP-EGL.performance.make_current.comple",
    "x.contexts_100_windows_pixmaps_10_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003825, "dEQP-EGL.performance.make_current.complex",
    ".contexts_100_windows_pixmaps_pbuffers_10");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003826, "dEQP-EGL.performance.make_current.complex.con",
    "texts_100_windows_pixmaps_pbuffers_10_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003827, "dEQP-EGL.performance.make_current",
    ".complex.contexts_10_pbuffers_100");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003828, "dEQP-EGL.performance.make_current.com",
    "plex.contexts_10_pbuffers_100_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003829, "dEQP-EGL.performance.make_curren",
    "t.complex.contexts_10_pixmaps_100");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003830, "dEQP-EGL.performance.make_current.co",
    "mplex.contexts_10_pixmaps_100_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003831, "dEQP-EGL.performance.make_curren",
    "t.complex.contexts_10_windows_100");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003832, "dEQP-EGL.performance.make_current.co",
    "mplex.contexts_10_windows_100_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003833, "dEQP-EGL.performance.make_current.com",
    "plex.contexts_10_pixmaps_pbuffers_100");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003834, "dEQP-EGL.performance.make_current.complex",
    ".contexts_10_pixmaps_pbuffers_100_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003835, "dEQP-EGL.performance.make_current.com",
    "plex.contexts_10_windows_pbuffers_100");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003836, "dEQP-EGL.performance.make_current.complex",
    ".contexts_10_windows_pbuffers_100_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003837, "dEQP-EGL.performance.make_current.co",
    "mplex.contexts_10_windows_pixmaps_100");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003838, "dEQP-EGL.performance.make_current.comple",
    "x.contexts_10_windows_pixmaps_100_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003839, "dEQP-EGL.performance.make_current.complex",
    ".contexts_10_windows_pixmaps_pbuffers_100");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003840, "dEQP-EGL.performance.make_current.complex.con",
    "texts_10_windows_pixmaps_pbuffers_100_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003841, "dEQP-EGL.performance.make_current",
    ".complex.contexts_100_pbuffers_100");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003842, "dEQP-EGL.performance.make_current.com",
    "plex.contexts_100_pbuffers_100_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003843, "dEQP-EGL.performance.make_current",
    ".complex.contexts_100_pixmaps_100");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003844, "dEQP-EGL.performance.make_current.com",
    "plex.contexts_100_pixmaps_100_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003845, "dEQP-EGL.performance.make_current",
    ".complex.contexts_100_windows_100");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003846, "dEQP-EGL.performance.make_current.com",
    "plex.contexts_100_windows_100_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003847, "dEQP-EGL.performance.make_current.com",
    "plex.contexts_100_pixmaps_pbuffers_100");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003848, "dEQP-EGL.performance.make_current.complex",
    ".contexts_100_pixmaps_pbuffers_100_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003849, "dEQP-EGL.performance.make_current.com",
    "plex.contexts_100_windows_pbuffers_100");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003850, "dEQP-EGL.performance.make_current.complex",
    ".contexts_100_windows_pbuffers_100_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003851, "dEQP-EGL.performance.make_current.com",
    "plex.contexts_100_windows_pixmaps_100");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003852, "dEQP-EGL.performance.make_current.complex",
    ".contexts_100_windows_pixmaps_100_release");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003853, "dEQP-EGL.performance.make_current.complex",
    ".contexts_100_windows_pixmaps_pbuffers_100");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003854, "dEQP-EGL.performance.make_current.complex.con",
    "texts_100_windows_pixmaps_pbuffers_100_release");
