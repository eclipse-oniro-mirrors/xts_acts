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
#include "../Renderpass2BaseFunc.h"
#include "../ActsRenderpass20025TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsRenderpass20025TS, TC1viewRenderDivisibledensitysize1sample, "dEQP-VK.renderpass2.fragment_density_map.1_view.render.divisible_density_size.1_sample*");
static SHRINK_HWTEST_F(ActsRenderpass20025TS, TC1viewRenderDivisibledensitysize2samples, "dEQP-VK.renderpass2.fragment_density_map.1_view.render.divisible_density_size.2_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20025TS, TC1viewRenderDivisibledensitysize4samples, "dEQP-VK.renderpass2.fragment_density_map.1_view.render.divisible_density_size.4_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20025TS, TC1viewRenderDivisibledensitysize8samples, "dEQP-VK.renderpass2.fragment_density_map.1_view.render.divisible_density_size.8_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20025TS, TC1viewRenderNondivisibledensitysize1sample, "dEQP-VK.renderpass2.fragment_density_map.1_view.render.non_divisible_density_size.1_sample*");
static SHRINK_HWTEST_F(ActsRenderpass20025TS, TC1viewRenderNondivisibledensitysize2samples, "dEQP-VK.renderpass2.fragment_density_map.1_view.render.non_divisible_density_size.2_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20025TS, TC1viewRenderNondivisibledensitysize4samples, "dEQP-VK.renderpass2.fragment_density_map.1_view.render.non_divisible_density_size.4_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20025TS, TC1viewRenderNondivisibledensitysize8samples, "dEQP-VK.renderpass2.fragment_density_map.1_view.render.non_divisible_density_size.8_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20025TS, TC1viewRendercopyDivisibledensitysize1sample, "dEQP-VK.renderpass2.fragment_density_map.1_view.render_copy.divisible_density_size.1_sample*");
static SHRINK_HWTEST_F(ActsRenderpass20025TS, TC1viewRendercopyDivisibledensitysize2samples, "dEQP-VK.renderpass2.fragment_density_map.1_view.render_copy.divisible_density_size.2_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20025TS, TC1viewRendercopyDivisibledensitysize4samples, "dEQP-VK.renderpass2.fragment_density_map.1_view.render_copy.divisible_density_size.4_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20025TS, TC1viewRendercopyDivisibledensitysize8samples, "dEQP-VK.renderpass2.fragment_density_map.1_view.render_copy.divisible_density_size.8_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20025TS, TC1viewRendercopyNondivisibledensitysize1sample, "dEQP-VK.renderpass2.fragment_density_map.1_view.render_copy.non_divisible_density_size.1_sample*");
static SHRINK_HWTEST_F(ActsRenderpass20025TS, TC1viewRendercopyNondivisibledensitysize2samples, "dEQP-VK.renderpass2.fragment_density_map.1_view.render_copy.non_divisible_density_size.2_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20025TS, TC1viewRendercopyNondivisibledensitysize4samples, "dEQP-VK.renderpass2.fragment_density_map.1_view.render_copy.non_divisible_density_size.4_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20025TS, TC1viewRendercopyNondivisibledensitysize8samples, "dEQP-VK.renderpass2.fragment_density_map.1_view.render_copy.non_divisible_density_size.8_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20025TS, TC2viewsRenderDivisibledensitysize1sample, "dEQP-VK.renderpass2.fragment_density_map.2_views.render.divisible_density_size.1_sample*");
static SHRINK_HWTEST_F(ActsRenderpass20025TS, TC2viewsRenderDivisibledensitysize2samples, "dEQP-VK.renderpass2.fragment_density_map.2_views.render.divisible_density_size.2_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20025TS, TC2viewsRenderDivisibledensitysize4samples, "dEQP-VK.renderpass2.fragment_density_map.2_views.render.divisible_density_size.4_samples*");