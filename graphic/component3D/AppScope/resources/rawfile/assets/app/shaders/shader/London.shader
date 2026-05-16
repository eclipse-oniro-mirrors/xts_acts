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
{
	"compatibility_info": { "version": "22.00", "type" : "shader" },
	"vert": "shaders://shader/London.vert.spv",
	"frag": "shaders://shader/London.frag.spv",
	"state": {
		"colorBlendState": {
			"colorAttachments": [
				{
					"colorWriteMask": "r_bit|g_bit|b_bit|a_bit"
				}
			]
		}
	}
}