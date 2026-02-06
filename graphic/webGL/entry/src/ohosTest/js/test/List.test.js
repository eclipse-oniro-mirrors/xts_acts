/*
 * Copyright (C) 2021-2023 Huawei Device Co., Ltd.
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

import webgl1_attribute from './WebGL1.attribute.js'
import webgl1_buffer from './WebGL1.buffer.js'
import webgl1_common from './WebGL1.common.js'
import webgl1_enum from './WebGL1.enum.js'
import webgl1_program from './WebGL1.program.js'
import webgl1_shader from './WebGL1.shader.js'
import webgl1_texture from './WebGL1.texture.js'
import webgl1_uniform from './WebGL1.uniform.js'

import webgl2_enum from './WebGL2.enum.js'
import webgl2_buffer from './WebGL2.buffer.js'
import webgl2_query from './WebGL2.query.js'
import webgl2_sampler from './WebGL2.sampler.js'
import webgl2_sync from './WebGL2.sync.js'
import webgl2_texture from './WebGL2.texture.js'
import webgl2_transform from './WebGL2.transform.js'
import webgl2_uniform from './WebGL2.uniform.js'
import webgl2_vertex from './WebGL2.vertex.js'

export default function testsuite() {
    webgl1_attribute()
    webgl1_enum()
    webgl1_program()
    webgl1_shader()
    webgl1_uniform()
    webgl1_texture()
    webgl1_buffer()
    webgl1_common()
    webgl2_enum()
    webgl2_buffer()
    webgl2_query()
    webgl2_sampler()
    webgl2_sync()
    webgl2_texture()
    webgl2_transform()
    webgl2_uniform()
    webgl2_vertex()
}
