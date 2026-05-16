/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#version 460 core
#extension GL_ARB_separate_shader_objects : enable
#extension GL_ARB_shading_language_420pack : enable

// From Core:
#include "render/shaders/common/render_color_conversion_common.h"
// From 3D:
#include "3d/shaders/common/3d_dm_indirect_lighting_common.h"

layout(push_constant, std430) uniform uPushConstant
{
	float unused;
};

layout(set = 0, binding = 1, std140) uniform uDeltaTime
{
	vec2 time; 
};

layout(set = 0, binding = 2, std140) uniform uInputResolution
{
	vec2 inputResolution;
};

layout(set = 1, binding = 0) uniform sampler uSampler;
layout(set = 1, binding = 1) uniform texture2D uLondon

layout (location = 0) in vec2 inUv;
layout (location = 0) out vec4 outColor;


void main(void)
{
	outColor = vec4(sin(time.x), 0.0f, 0.0f, 1.0f);
}