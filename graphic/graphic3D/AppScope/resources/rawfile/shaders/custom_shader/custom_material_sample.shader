/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the License);
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an AS IS BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
{
    "compatibility_info" : { "version" : "22.00", "type" : "shader" },
    "vert": "3dshaders://shader/core3d_dm_fw.vert.spv",
    "frag": "appshaders://custom_shader/custom_material_sample.frag.spv",
    "vertexInputDeclaration": "3dvertexinputdeclarations://core3d_dm_fw.shadervid",
    "state": {
        "rasterizationState": {
            "enableDepthClamp": false,
            "enableDepthBias": false,
            "enableRasterizerDiscard": false,
            "polygonMode": "fill",
            "cullModeFlags": "back",
            "frontFace": "counter_clockwise"
        },
        "depthStencilState": {
            "enableDepthTest": true,
            "enableDepthWrite": true,
            "enableDepthBoundsTest": false,
            "enableStencilTest": false,
            "depthCompareOp": "less_or_equal"
        },
        "colorBlendState": {
            "colorAttachments": [
                {
                    "enableBlend": true,
                    "colorWriteMask": "r_bit|g_bit|b_bit|a_bit",
                    "srcColorBlendFactor": "one",
                    "dstColorBlendFactor": "one_minus_src_alpha",
                    "colorBlendOp": "add",
                    "srcAlphaBlendFactor": "one",
                    "dstAlphaBlendFactor": "one_minus_src_alpha",
                    "alphaBlendOp": "add"
                }
            ]
        }
    },
    "materialMetadata": [
        {
            "name": "MaterialComponent",
            "customProperties": [
                {
                    "data": [
                        {
                            "name": "vec_1",
                            "displayName": "Color",
                            "type": "vec4",
                            "value" : [1.0,1.0,1.0,1.0]
                        },
                        {
                            "name": "time",
                            "displayName": "Time",
                            "type": "float",
                            "value": 0.0
                        },
                        {
                            "name": "dof",
                            "displayName": "Dof",
                            "type": "int",
                            "value": 1
                        },
                        {
                            "name": "motionblur",
                            "displayName": "MotionBlur",
                            "type": "int",
                            "value": 1
                        }
                    ]
                }
            ]
        }
    ]
}