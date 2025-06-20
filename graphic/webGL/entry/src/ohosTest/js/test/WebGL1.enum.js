/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';

import {checkError, createProgram, getColorUint8Array} from './WebGL1';


export default function webgl1_enum() {
    
	describe('webgl1_enum', function () {
        let gl = global.gl;

        // Defines a test suite. Two parameters are supported: test suite name and test suite function.
        beforeAll(function () {
            hilog.info(0x0000, 'testTag', '%{public}s', 'webgl1_test_01 start');
            // Presets an action, which is performed only once before all test cases of the test suite start.
            // This API supports only one parameter: preset action function.
        })
        beforeEach(function () {
            // Presets an action, which is performed before each unit test case starts.
            // The number of execution times is the same as the number of test cases defined by **it**.
            // This API supports only one parameter: preset action function.
            checkError(gl);
        })
        afterEach(function () {
            // Presets a clear action, which is performed after each unit test case ends.
            // The number of execution times is the same as the number of test cases defined by **it**.
            // This API supports only one parameter: clear action function.
            checkError(gl);
        })
        afterAll(function () {
            // Presets a clear action, which is performed after all test cases of the test suite end.
            // This API supports only one parameter: clear action function.
            hilog.info(0x0000, 'testTag', '%{public}s', 'webgl1_test_01 end');
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_ENUM_0001
         * @tc.name webgl_test_enum
         * @tc.desc Test enum.
         */
        it('webgl_test_enum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("webgltest [webgl_test_enum] enum");
            /* ClearBufferMask */
            console.info("webgltest gl.DEPTH_BUFFER_BIT = 0x00000100");
            expect(gl.DEPTH_BUFFER_BIT).assertEqual(0x00000100);
            console.info("webgltest gl.STENCIL_BUFFER_BIT = 0x00000400");
            expect(gl.STENCIL_BUFFER_BIT).assertEqual(0x00000400);
            console.info("webgltest gl.COLOR_BUFFER_BIT = 0x00004000");
            expect(gl.COLOR_BUFFER_BIT).assertEqual(0x00004000);

            /* BeginMode */
            console.info("webgltest gl.POINTS = 0x0000");
            expect(gl.POINTS).assertEqual(0x0000);
            console.info("webgltest gl.LINES = 0x0001");
            expect(gl.LINES).assertEqual(0x0001);
            console.info("webgltest gl.LINE_LOOP = 0x0002");
            expect(gl.LINE_LOOP).assertEqual(0x0002);
            console.info("webgltest gl.LINE_STRIP = 0x0003");
            expect(gl.LINE_STRIP).assertEqual(0x0003);
            console.info("webgltest gl.TRIANGLES = 0x0004");
            expect(gl.TRIANGLES).assertEqual(0x0004);
            console.info("webgltest gl.TRIANGLE_STRIP = 0x0005");
            expect(gl.TRIANGLE_STRIP).assertEqual(0x0005);
            console.info("webgltest gl.TRIANGLE_FAN = 0x0006");
            expect(gl.TRIANGLE_FAN).assertEqual(0x0006);

            /* AlphaFunction (not supported in ES20) */
            /*      NEVER */
            /*      LESS */
            /*      EQUAL */
            /*      LEQUAL */
            /*      GREATER */
            /*      NOTEQUAL */
            /*      GEQUAL */
            /*      ALWAYS */

            /* BlendingFactorDest */
            console.info("webgltest gl.ZERO = 0");
            expect(gl.ZERO).assertEqual(0);
            console.info("webgltest gl.ONE = 1");
            expect(gl.ONE).assertEqual(1);
            console.info("webgltest gl.SRC_COLOR = 0x0300");
            expect(gl.SRC_COLOR).assertEqual(0x0300);
            console.info("webgltest gl.ONE_MINUS_SRC_COLOR = 0x0301");
            expect(gl.ONE_MINUS_SRC_COLOR).assertEqual(0x0301);
            console.info("webgltest gl.SRC_ALPHA = 0x0302");
            expect(gl.SRC_ALPHA).assertEqual(0x0302);
            console.info("webgltest gl.ONE_MINUS_SRC_ALPHA = 0x0303");
            expect(gl.ONE_MINUS_SRC_ALPHA).assertEqual(0x0303);
            console.info("webgltest gl.DST_ALPHA = 0x0304");
            expect(gl.DST_ALPHA).assertEqual(0x0304);
            console.info("webgltest gl.ONE_MINUS_DST_ALPHA = 0x0305");
            expect(gl.ONE_MINUS_DST_ALPHA).assertEqual(0x0305);

            /* BlendingFactorSrc */
            /*      ZERO */
            /*      ONE */
            console.info("webgltest gl.DST_COLOR = 0x0306");
            expect(gl.DST_COLOR).assertEqual(0x0306);
            console.info("webgltest gl.ONE_MINUS_DST_COLOR = 0x0307");
            expect(gl.ONE_MINUS_DST_COLOR).assertEqual(0x0307);
            console.info("webgltest gl.SRC_ALPHA_SATURATE = 0x0308");
            expect(gl.SRC_ALPHA_SATURATE).assertEqual(0x0308);
            /*      SRC_ALPHA */
            /*      ONE_MINUS_SRC_ALPHA */
            /*      DST_ALPHA */
            /*      ONE_MINUS_DST_ALPHA */

            /* BlendEquationSeparate */
            console.info("webgltest gl.FUNC_ADD = 0x8006");
            expect(gl.FUNC_ADD).assertEqual(0x8006);
            console.info("webgltest gl.BLEND_EQUATION = 0x8009");
            expect(gl.BLEND_EQUATION).assertEqual(0x8009);
            console.info("webgltest gl.BLEND_EQUATION_RGB = 0x8009");
            expect(gl.BLEND_EQUATION_RGB).assertEqual(0x8009);   /* same as BLEND_EQUATION */
            console.info("webgltest gl.BLEND_EQUATION_ALPHA = 0x883D");
            expect(gl.BLEND_EQUATION_ALPHA).assertEqual(0x883D);

            /* BlendSubtract */
            console.info("webgltest gl.FUNC_SUBTRACT = 0x800A");
            expect(gl.FUNC_SUBTRACT).assertEqual(0x800A);
            console.info("webgltest gl.FUNC_REVERSE_SUBTRACT = 0x800B");
            expect(gl.FUNC_REVERSE_SUBTRACT).assertEqual(0x800B);

            /* Separate Blend Functions */
            console.info("webgltest gl.BLEND_DST_RGB = 0x80C8");
            expect(gl.BLEND_DST_RGB).assertEqual(0x80C8);
            console.info("webgltest gl.BLEND_SRC_RGB = 0x80C9");
            expect(gl.BLEND_SRC_RGB).assertEqual(0x80C9);
            console.info("webgltest gl.BLEND_DST_ALPHA = 0x80CA");
            expect(gl.BLEND_DST_ALPHA).assertEqual(0x80CA);
            console.info("webgltest gl.BLEND_SRC_ALPHA = 0x80CB");
            expect(gl.BLEND_SRC_ALPHA).assertEqual(0x80CB);
            console.info("webgltest gl.CONSTANT_COLOR = 0x8001");
            expect(gl.CONSTANT_COLOR).assertEqual(0x8001);
            console.info("webgltest gl.ONE_MINUS_CONSTANT_COLOR = 0x8002");
            expect(gl.ONE_MINUS_CONSTANT_COLOR).assertEqual(0x8002);
            console.info("webgltest gl.CONSTANT_ALPHA = 0x8003");
            expect(gl.CONSTANT_ALPHA).assertEqual(0x8003);
            console.info("webgltest gl.ONE_MINUS_CONSTANT_ALPHA = 0x8004");
            expect(gl.ONE_MINUS_CONSTANT_ALPHA).assertEqual(0x8004);
            console.info("webgltest gl.BLEND_COLOR = 0x8005");
            expect(gl.BLEND_COLOR).assertEqual(0x8005);

            /* Buffer Objects */
            console.info("webgltest gl.ARRAY_BUFFER = 0x8892");
            expect(gl.ARRAY_BUFFER).assertEqual(0x8892);
            console.info("webgltest gl.ELEMENT_ARRAY_BUFFER = 0x8893");
            expect(gl.ELEMENT_ARRAY_BUFFER).assertEqual(0x8893);
            console.info("webgltest gl.ARRAY_BUFFER_BINDING = 0x8894");
            expect(gl.ARRAY_BUFFER_BINDING).assertEqual(0x8894);
            console.info("webgltest gl.ELEMENT_ARRAY_BUFFER_BINDING = 0x8895");
            expect(gl.ELEMENT_ARRAY_BUFFER_BINDING).assertEqual(0x8895);

            console.info("webgltest gl.STREAM_DRAW = 0x88E0");
            expect(gl.STREAM_DRAW).assertEqual(0x88E0);
            console.info("webgltest gl.STATIC_DRAW = 0x88E4");
            expect(gl.STATIC_DRAW).assertEqual(0x88E4);
            console.info("webgltest gl.DYNAMIC_DRAW = 0x88E8");
            expect(gl.DYNAMIC_DRAW).assertEqual(0x88E8);

            console.info("webgltest gl.BUFFER_SIZE = 0x8764");
            expect(gl.BUFFER_SIZE).assertEqual(0x8764);
            console.info("webgltest gl.BUFFER_USAGE = 0x8765");
            expect(gl.BUFFER_USAGE).assertEqual(0x8765);
            console.info("webgltest gl.CURRENT_VERTEX_ATTRIB = 0x8626");
            expect(gl.CURRENT_VERTEX_ATTRIB).assertEqual(0x8626);

            /* CullFaceMode */
            console.info("webgltest gl.FRONT = 0x0404");
            expect(gl.FRONT).assertEqual(0x0404);
            console.info("webgltest gl.BACK = 0x0405");
            expect(gl.BACK).assertEqual(0x0405);
            console.info("webgltest gl.FRONT_AND_BACK = 0x0408");
            expect(gl.FRONT_AND_BACK).assertEqual(0x0408);

            /* DepthFunction */
            /*      NEVER */
            /*      LESS */
            /*      EQUAL */
            /*      LEQUAL */
            /*      GREATER */
            /*      NOTEQUAL */
            /*      GEQUAL */
            /*      ALWAYS */

            /* EnableCap */
            /* TEXTURE_2D */
            console.info("webgltest gl.CULL_FACE = 0x0B44");
            expect(gl.CULL_FACE).assertEqual(0x0B44);
            console.info("webgltest gl.BLEND = 0x0BE2");
            expect(gl.BLEND).assertEqual(0x0BE2);
            console.info("webgltest gl.DITHER = 0x0BD0");
            expect(gl.DITHER).assertEqual(0x0BD0);
            console.info("webgltest gl.STENCIL_TEST = 0x0B90");
            expect(gl.STENCIL_TEST).assertEqual(0x0B90);
            console.info("webgltest gl.DEPTH_TEST = 0x0B71");
            expect(gl.DEPTH_TEST).assertEqual(0x0B71);
            console.info("webgltest gl.SCISSOR_TEST = 0x0C11");
            expect(gl.SCISSOR_TEST).assertEqual(0x0C11);
            console.info("webgltest gl.POLYGON_OFFSET_FILL = 0x8037");
            expect(gl.POLYGON_OFFSET_FILL).assertEqual(0x8037);
            console.info("webgltest gl.SAMPLE_ALPHA_TO_COVERAGE = 0x809E");
            expect(gl.SAMPLE_ALPHA_TO_COVERAGE).assertEqual(0x809E);
            console.info("webgltest gl.SAMPLE_COVERAGE = 0x80A0");
            expect(gl.SAMPLE_COVERAGE).assertEqual(0x80A0);

            /* ErrorCode */
            console.info("webgltest gl.NO_ERROR = 0");
            expect(gl.NO_ERROR).assertEqual(0);
            console.info("webgltest gl.INVALID_ENUM = 0x0500");
            expect(gl.INVALID_ENUM).assertEqual(0x0500);
            console.info("webgltest gl.INVALID_VALUE = 0x0501");
            expect(gl.INVALID_VALUE).assertEqual(0x0501);
            console.info("webgltest gl.INVALID_OPERATION = 0x0502");
            expect(gl.INVALID_OPERATION).assertEqual(0x0502);
            console.info("webgltest gl.OUT_OF_MEMORY = 0x0505");
            expect(gl.OUT_OF_MEMORY).assertEqual(0x0505);

            /* FrontFaceDirection */
            console.info("webgltest gl.CW = 0x0900");
            expect(gl.CW).assertEqual(0x0900);
            console.info("webgltest gl.CCW = 0x0901");
            expect(gl.CCW).assertEqual(0x0901);

            /* GetPName */
            console.info("webgltest gl.LINE_WIDTH = 0x0B21");
            expect(gl.LINE_WIDTH).assertEqual(0x0B21);
            console.info("webgltest gl.ALIASED_POINT_SIZE_RANGE = 0x846D");
            expect(gl.ALIASED_POINT_SIZE_RANGE).assertEqual(0x846D);
            console.info("webgltest gl.ALIASED_LINE_WIDTH_RANGE = 0x846E");
            expect(gl.ALIASED_LINE_WIDTH_RANGE).assertEqual(0x846E);
            console.info("webgltest gl.CULL_FACE_MODE = 0x0B45");
            expect(gl.CULL_FACE_MODE).assertEqual(0x0B45);
            console.info("webgltest gl.FRONT_FACE = 0x0B46");
            expect(gl.FRONT_FACE).assertEqual(0x0B46);
            console.info("webgltest gl.DEPTH_RANGE = 0x0B70");
            expect(gl.DEPTH_RANGE).assertEqual(0x0B70);
            console.info("webgltest gl.DEPTH_WRITEMASK = 0x0B72");
            expect(gl.DEPTH_WRITEMASK).assertEqual(0x0B72);
            console.info("webgltest gl.DEPTH_CLEAR_VALUE = 0x0B73");
            expect(gl.DEPTH_CLEAR_VALUE).assertEqual(0x0B73);
            console.info("webgltest gl.DEPTH_FUNC = 0x0B74");
            expect(gl.DEPTH_FUNC).assertEqual(0x0B74);
            console.info("webgltest gl.STENCIL_CLEAR_VALUE = 0x0B91");
            expect(gl.STENCIL_CLEAR_VALUE).assertEqual(0x0B91);
            console.info("webgltest gl.STENCIL_FUNC = 0x0B92");
            expect(gl.STENCIL_FUNC).assertEqual(0x0B92);
            console.info("webgltest gl.STENCIL_FAIL = 0x0B94");
            expect(gl.STENCIL_FAIL).assertEqual(0x0B94);
            console.info("webgltest gl.STENCIL_PASS_DEPTH_FAIL = 0x0B95");
            expect(gl.STENCIL_PASS_DEPTH_FAIL).assertEqual(0x0B95);
            console.info("webgltest gl.STENCIL_PASS_DEPTH_PASS = 0x0B96");
            expect(gl.STENCIL_PASS_DEPTH_PASS).assertEqual(0x0B96);
            console.info("webgltest gl.STENCIL_REF = 0x0B97");
            expect(gl.STENCIL_REF).assertEqual(0x0B97);
            console.info("webgltest gl.STENCIL_VALUE_MASK = 0x0B93");
            expect(gl.STENCIL_VALUE_MASK).assertEqual(0x0B93);
            console.info("webgltest gl.STENCIL_WRITEMASK = 0x0B98");
            expect(gl.STENCIL_WRITEMASK).assertEqual(0x0B98);
            console.info("webgltest gl.STENCIL_BACK_FUNC = 0x8800");
            expect(gl.STENCIL_BACK_FUNC).assertEqual(0x8800);
            console.info("webgltest gl.STENCIL_BACK_FAIL = 0x8801");
            expect(gl.STENCIL_BACK_FAIL).assertEqual(0x8801);
            console.info("webgltest gl.STENCIL_BACK_PASS_DEPTH_FAIL = 0x8802");
            expect(gl.STENCIL_BACK_PASS_DEPTH_FAIL).assertEqual(0x8802);
            console.info("webgltest gl.STENCIL_BACK_PASS_DEPTH_PASS = 0x8803");
            expect(gl.STENCIL_BACK_PASS_DEPTH_PASS).assertEqual(0x8803);
            console.info("webgltest gl.STENCIL_BACK_REF = 0x8CA3");
            expect(gl.STENCIL_BACK_REF).assertEqual(0x8CA3);
            console.info("webgltest gl.STENCIL_BACK_VALUE_MASK = 0x8CA4");
            expect(gl.STENCIL_BACK_VALUE_MASK).assertEqual(0x8CA4);
            console.info("webgltest gl.STENCIL_BACK_WRITEMASK = 0x8CA5");
            expect(gl.STENCIL_BACK_WRITEMASK).assertEqual(0x8CA5);
            console.info("webgltest gl.VIEWPORT = 0x0BA2");
            expect(gl.VIEWPORT).assertEqual(0x0BA2);
            console.info("webgltest gl.SCISSOR_BOX = 0x0C10");
            expect(gl.SCISSOR_BOX).assertEqual(0x0C10);
            /*      SCISSOR_TEST */
            console.info("webgltest gl.COLOR_CLEAR_VALUE = 0x0C22");
            expect(gl.COLOR_CLEAR_VALUE).assertEqual(0x0C22);
            console.info("webgltest gl.COLOR_WRITEMASK = 0x0C23");
            expect(gl.COLOR_WRITEMASK).assertEqual(0x0C23);
            console.info("webgltest gl.UNPACK_ALIGNMENT = 0x0CF5");
            expect(gl.UNPACK_ALIGNMENT).assertEqual(0x0CF5);
            console.info("webgltest gl.PACK_ALIGNMENT = 0x0D05");
            expect(gl.PACK_ALIGNMENT).assertEqual(0x0D05);
            console.info("webgltest gl.MAX_TEXTURE_SIZE = 0x0D33");
            expect(gl.MAX_TEXTURE_SIZE).assertEqual(0x0D33);
            console.info("webgltest gl.MAX_VIEWPORT_DIMS = 0x0D3A");
            expect(gl.MAX_VIEWPORT_DIMS).assertEqual(0x0D3A);
            console.info("webgltest gl.SUBPIXEL_BITS = 0x0D50");
            expect(gl.SUBPIXEL_BITS).assertEqual(0x0D50);
            console.info("webgltest gl.RED_BITS = 0x0D52");
            expect(gl.RED_BITS).assertEqual(0x0D52);
            console.info("webgltest gl.GREEN_BITS = 0x0D53");
            expect(gl.GREEN_BITS).assertEqual(0x0D53);
            console.info("webgltest gl.BLUE_BITS = 0x0D54");
            expect(gl.BLUE_BITS).assertEqual(0x0D54);
            console.info("webgltest gl.ALPHA_BITS = 0x0D55");
            expect(gl.ALPHA_BITS).assertEqual(0x0D55);
            console.info("webgltest gl.DEPTH_BITS = 0x0D56");
            expect(gl.DEPTH_BITS).assertEqual(0x0D56);
            console.info("webgltest gl.STENCIL_BITS = 0x0D57");
            expect(gl.STENCIL_BITS).assertEqual(0x0D57);
            console.info("webgltest gl.POLYGON_OFFSET_UNITS = 0x2A00");
            expect(gl.POLYGON_OFFSET_UNITS).assertEqual(0x2A00);
            /*      POLYGON_OFFSET_FILL */
            console.info("webgltest gl.POLYGON_OFFSET_FACTOR = 0x8038");
            expect(gl.POLYGON_OFFSET_FACTOR).assertEqual(0x8038);
            console.info("webgltest gl.TEXTURE_BINDING_2D = 0x8069");
            expect(gl.TEXTURE_BINDING_2D).assertEqual(0x8069);
            console.info("webgltest gl.SAMPLE_BUFFERS = 0x80A8");
            expect(gl.SAMPLE_BUFFERS).assertEqual(0x80A8);
            console.info("webgltest gl.SAMPLES = 0x80A9");
            expect(gl.SAMPLES).assertEqual(0x80A9);
            console.info("webgltest gl.SAMPLE_COVERAGE_VALUE = 0x80AA");
            expect(gl.SAMPLE_COVERAGE_VALUE).assertEqual(0x80AA);
            console.info("webgltest gl.SAMPLE_COVERAGE_INVERT = 0x80AB");
            expect(gl.SAMPLE_COVERAGE_INVERT).assertEqual(0x80AB);

            /* GetTextureParameter */
            /*      TEXTURE_MAG_FILTER */
            /*      TEXTURE_MIN_FILTER */
            /*      TEXTURE_WRAP_S */
            /*      TEXTURE_WRAP_T */
            console.info("webgltest gl.COMPRESSED_TEXTURE_FORMATS = 0x86A3");
            expect(gl.COMPRESSED_TEXTURE_FORMATS).assertEqual(0x86A3);

            /* HintMode */
            console.info("webgltest gl.DONT_CARE = 0x1100");
            expect(gl.DONT_CARE).assertEqual(0x1100);
            console.info("webgltest gl.FASTEST = 0x1101");
            expect(gl.FASTEST).assertEqual(0x1101);
            console.info("webgltest gl.NICEST = 0x1102");
            expect(gl.NICEST).assertEqual(0x1102);

            /* HintTarget */
            console.info("webgltest gl.GENERATE_MIPMAP_HINT = 0x8192");
            expect(gl.GENERATE_MIPMAP_HINT).assertEqual(0x8192);

            /* DataType */
            console.info("webgltest gl.BYTE = 0x1400");
            expect(gl.BYTE).assertEqual(0x1400);
            console.info("webgltest gl.UNSIGNED_BYTE = 0x1401");
            expect(gl.UNSIGNED_BYTE).assertEqual(0x1401);
            console.info("webgltest gl.SHORT = 0x1402");
            expect(gl.SHORT).assertEqual(0x1402);
            console.info("webgltest gl.UNSIGNED_SHORT = 0x1403");
            expect(gl.UNSIGNED_SHORT).assertEqual(0x1403);
            console.info("webgltest gl.INT = 0x1404");
            expect(gl.INT).assertEqual(0x1404);
            console.info("webgltest gl.UNSIGNED_INT = 0x1405");
            expect(gl.UNSIGNED_INT).assertEqual(0x1405);
            console.info("webgltest gl.FLOAT = 0x1406");
            expect(gl.FLOAT).assertEqual(0x1406);

            /* PixelFormat */
            console.info("webgltest gl.DEPTH_COMPONENT = 0x1902");
            expect(gl.DEPTH_COMPONENT).assertEqual(0x1902);
            console.info("webgltest gl.ALPHA = 0x1906");
            expect(gl.ALPHA).assertEqual(0x1906);
            console.info("webgltest gl.RGB = 0x1907");
            expect(gl.RGB).assertEqual(0x1907);
            console.info("webgltest gl.RGBA = 0x1908");
            expect(gl.RGBA).assertEqual(0x1908);
            console.info("webgltest gl.LUMINANCE = 0x1909");
            expect(gl.LUMINANCE).assertEqual(0x1909);
            console.info("webgltest gl.LUMINANCE_ALPHA = 0x190A");
            expect(gl.LUMINANCE_ALPHA).assertEqual(0x190A);

            /* PixelType */
            /*      UNSIGNED_BYTE */
            console.info("webgltest gl.UNSIGNED_SHORT_4_4_4_4 = 0x8033");
            expect(gl.UNSIGNED_SHORT_4_4_4_4).assertEqual(0x8033);
            console.info("webgltest gl.UNSIGNED_SHORT_5_5_5_1 = 0x8034");
            expect(gl.UNSIGNED_SHORT_5_5_5_1).assertEqual(0x8034);
            console.info("webgltest gl.UNSIGNED_SHORT_5_6_5 = 0x8363");
            expect(gl.UNSIGNED_SHORT_5_6_5).assertEqual(0x8363);

            /* Shaders */
            console.info("webgltest gl.FRAGMENT_SHADER = 0x8B30");
            expect(gl.FRAGMENT_SHADER).assertEqual(0x8B30);
            console.info("webgltest gl.VERTEX_SHADER = 0x8B31");
            expect(gl.VERTEX_SHADER).assertEqual(0x8B31);
            console.info("webgltest gl.MAX_VERTEX_ATTRIBS = 0x8869");
            expect(gl.MAX_VERTEX_ATTRIBS).assertEqual(0x8869);
            console.info("webgltest gl.MAX_VERTEX_UNIFORM_VECTORS = 0x8DFB");
            expect(gl.MAX_VERTEX_UNIFORM_VECTORS).assertEqual(0x8DFB);
            console.info("webgltest gl.MAX_VARYING_VECTORS = 0x8DFC");
            expect(gl.MAX_VARYING_VECTORS).assertEqual(0x8DFC);
            console.info("webgltest gl.MAX_COMBINED_TEXTURE_IMAGE_UNITS = 0x8B4D");
            expect(gl.MAX_COMBINED_TEXTURE_IMAGE_UNITS).assertEqual(0x8B4D);
            console.info("webgltest gl.MAX_VERTEX_TEXTURE_IMAGE_UNITS = 0x8B4C");
            expect(gl.MAX_VERTEX_TEXTURE_IMAGE_UNITS).assertEqual(0x8B4C);
            console.info("webgltest gl.MAX_TEXTURE_IMAGE_UNITS = 0x8872");
            expect(gl.MAX_TEXTURE_IMAGE_UNITS).assertEqual(0x8872);
            console.info("webgltest gl.MAX_FRAGMENT_UNIFORM_VECTORS = 0x8DFD");
            expect(gl.MAX_FRAGMENT_UNIFORM_VECTORS).assertEqual(0x8DFD);
            console.info("webgltest gl.SHADER_TYPE = 0x8B4F");
            expect(gl.SHADER_TYPE).assertEqual(0x8B4F);
            console.info("webgltest gl.DELETE_STATUS = 0x8B80");
            expect(gl.DELETE_STATUS).assertEqual(0x8B80);
            console.info("webgltest gl.LINK_STATUS = 0x8B82");
            expect(gl.LINK_STATUS).assertEqual(0x8B82);
            console.info("webgltest gl.VALIDATE_STATUS = 0x8B83");
            expect(gl.VALIDATE_STATUS).assertEqual(0x8B83);
            console.info("webgltest gl.ATTACHED_SHADERS = 0x8B85");
            expect(gl.ATTACHED_SHADERS).assertEqual(0x8B85);
            console.info("webgltest gl.ACTIVE_UNIFORMS = 0x8B86");
            expect(gl.ACTIVE_UNIFORMS).assertEqual(0x8B86);
            console.info("webgltest gl.ACTIVE_ATTRIBUTES = 0x8B89");
            expect(gl.ACTIVE_ATTRIBUTES).assertEqual(0x8B89);
            console.info("webgltest gl.SHADING_LANGUAGE_VERSION = 0x8B8C");
            expect(gl.SHADING_LANGUAGE_VERSION).assertEqual(0x8B8C);
            console.info("webgltest gl.CURRENT_PROGRAM = 0x8B8D");
            expect(gl.CURRENT_PROGRAM).assertEqual(0x8B8D);

            /* StencilFunction */
            console.info("webgltest gl.NEVER = 0x0200");
            expect(gl.NEVER).assertEqual(0x0200);
            console.info("webgltest gl.LESS = 0x0201");
            expect(gl.LESS).assertEqual(0x0201);
            console.info("webgltest gl.EQUAL = 0x0202");
            expect(gl.EQUAL).assertEqual(0x0202);
            console.info("webgltest gl.LEQUAL = 0x0203");
            expect(gl.LEQUAL).assertEqual(0x0203);
            console.info("webgltest gl.GREATER = 0x0204");
            expect(gl.GREATER).assertEqual(0x0204);
            console.info("webgltest gl.NOTEQUAL = 0x0205");
            expect(gl.NOTEQUAL).assertEqual(0x0205);
            console.info("webgltest gl.GEQUAL = 0x0206");
            expect(gl.GEQUAL).assertEqual(0x0206);
            console.info("webgltest gl.ALWAYS = 0x0207");
            expect(gl.ALWAYS).assertEqual(0x0207);

            /* StencilOp */
            /*      ZERO */
            console.info("webgltest gl.KEEP = 0x1E00");
            expect(gl.KEEP).assertEqual(0x1E00);
            console.info("webgltest gl.REPLACE = 0x1E01");
            expect(gl.REPLACE).assertEqual(0x1E01);
            console.info("webgltest gl.INCR = 0x1E02");
            expect(gl.INCR).assertEqual(0x1E02);
            console.info("webgltest gl.DECR = 0x1E03");
            expect(gl.DECR).assertEqual(0x1E03);
            console.info("webgltest gl.INVERT = 0x150A");
            expect(gl.INVERT).assertEqual(0x150A);
            console.info("webgltest gl.INCR_WRAP = 0x8507");
            expect(gl.INCR_WRAP).assertEqual(0x8507);
            console.info("webgltest gl.DECR_WRAP = 0x8508");
            expect(gl.DECR_WRAP).assertEqual(0x8508);

            /* StringName */
            console.info("webgltest gl.VENDOR = 0x1F00");
            expect(gl.VENDOR).assertEqual(0x1F00);
            console.info("webgltest gl.RENDERER = 0x1F01");
            expect(gl.RENDERER).assertEqual(0x1F01);
            console.info("webgltest gl.VERSION = 0x1F02");
            expect(gl.VERSION).assertEqual(0x1F02);

            /* TextureMagFilter */
            console.info("webgltest gl.NEAREST = 0x2600");
            expect(gl.NEAREST).assertEqual(0x2600);
            console.info("webgltest gl.LINEAR = 0x2601");
            expect(gl.LINEAR).assertEqual(0x2601);

            /* TextureMinFilter */
            /*      NEAREST */
            /*      LINEAR */
            console.info("webgltest gl.NEAREST_MIPMAP_NEAREST = 0x2700");
            expect(gl.NEAREST_MIPMAP_NEAREST).assertEqual(0x2700);
            console.info("webgltest gl.LINEAR_MIPMAP_NEAREST = 0x2701");
            expect(gl.LINEAR_MIPMAP_NEAREST).assertEqual(0x2701);
            console.info("webgltest gl.NEAREST_MIPMAP_LINEAR = 0x2702");
            expect(gl.NEAREST_MIPMAP_LINEAR).assertEqual(0x2702);
            console.info("webgltest gl.LINEAR_MIPMAP_LINEAR = 0x2703");
            expect(gl.LINEAR_MIPMAP_LINEAR).assertEqual(0x2703);

            /* TextureParameterName */
            console.info("webgltest gl.TEXTURE_MAG_FILTER = 0x2800");
            expect(gl.TEXTURE_MAG_FILTER).assertEqual(0x2800);
            console.info("webgltest gl.TEXTURE_MIN_FILTER = 0x2801");
            expect(gl.TEXTURE_MIN_FILTER).assertEqual(0x2801);
            console.info("webgltest gl.TEXTURE_WRAP_S = 0x2802");
            expect(gl.TEXTURE_WRAP_S).assertEqual(0x2802);
            console.info("webgltest gl.TEXTURE_WRAP_T = 0x2803");
            expect(gl.TEXTURE_WRAP_T).assertEqual(0x2803);

            /* TextureTarget */
            console.info("webgltest gl.TEXTURE_2D = 0x0DE1");
            expect(gl.TEXTURE_2D).assertEqual(0x0DE1);
            console.info("webgltest gl.TEXTURE = 0x1702");
            expect(gl.TEXTURE).assertEqual(0x1702);
            console.info("webgltest gl.TEXTURE_CUBE_MAP = 0x8513");
            expect(gl.TEXTURE_CUBE_MAP).assertEqual(0x8513);
            console.info("webgltest gl.TEXTURE_BINDING_CUBE_MAP = 0x8514");
            expect(gl.TEXTURE_BINDING_CUBE_MAP).assertEqual(0x8514);
            console.info("webgltest gl.TEXTURE_CUBE_MAP_POSITIVE_X = 0x8515");
            expect(gl.TEXTURE_CUBE_MAP_POSITIVE_X).assertEqual(0x8515);
            console.info("webgltest gl.TEXTURE_CUBE_MAP_NEGATIVE_X = 0x8516");
            expect(gl.TEXTURE_CUBE_MAP_NEGATIVE_X).assertEqual(0x8516);
            console.info("webgltest gl.TEXTURE_CUBE_MAP_POSITIVE_Y = 0x8517");
            expect(gl.TEXTURE_CUBE_MAP_POSITIVE_Y).assertEqual(0x8517);
            console.info("webgltest gl.TEXTURE_CUBE_MAP_NEGATIVE_Y = 0x8518");
            expect(gl.TEXTURE_CUBE_MAP_NEGATIVE_Y).assertEqual(0x8518);
            console.info("webgltest gl.TEXTURE_CUBE_MAP_POSITIVE_Z = 0x8519");
            expect(gl.TEXTURE_CUBE_MAP_POSITIVE_Z).assertEqual(0x8519);
            console.info("webgltest gl.TEXTURE_CUBE_MAP_NEGATIVE_Z = 0x851A");
            expect(gl.TEXTURE_CUBE_MAP_NEGATIVE_Z).assertEqual(0x851A);
            console.info("webgltest gl.MAX_CUBE_MAP_TEXTURE_SIZE = 0x851C");
            expect(gl.MAX_CUBE_MAP_TEXTURE_SIZE).assertEqual(0x851C);

            /* TextureUnit */
            console.info("webgltest gl.TEXTURE0 = 0x84C0");
            expect(gl.TEXTURE0).assertEqual(0x84C0);
            console.info("webgltest gl.TEXTURE1 = 0x84C1");
            expect(gl.TEXTURE1).assertEqual(0x84C1);
            console.info("webgltest gl.TEXTURE2 = 0x84C2");
            expect(gl.TEXTURE2).assertEqual(0x84C2);
            console.info("webgltest gl.TEXTURE3 = 0x84C3");
            expect(gl.TEXTURE3).assertEqual(0x84C3);
            console.info("webgltest gl.TEXTURE4 = 0x84C4");
            expect(gl.TEXTURE4).assertEqual(0x84C4);
            console.info("webgltest gl.TEXTURE5 = 0x84C5");
            expect(gl.TEXTURE5).assertEqual(0x84C5);
            console.info("webgltest gl.TEXTURE6 = 0x84C6");
            expect(gl.TEXTURE6).assertEqual(0x84C6);
            console.info("webgltest gl.TEXTURE7 = 0x84C7");
            expect(gl.TEXTURE7).assertEqual(0x84C7);
            console.info("webgltest gl.TEXTURE8 = 0x84C8");
            expect(gl.TEXTURE8).assertEqual(0x84C8);
            console.info("webgltest gl.TEXTURE9 = 0x84C9");
            expect(gl.TEXTURE9).assertEqual(0x84C9);
            console.info("webgltest gl.TEXTURE10 = 0x84CA");
            expect(gl.TEXTURE10).assertEqual(0x84CA);
            console.info("webgltest gl.TEXTURE11 = 0x84CB");
            expect(gl.TEXTURE11).assertEqual(0x84CB);
            console.info("webgltest gl.TEXTURE12 = 0x84CC");
            expect(gl.TEXTURE12).assertEqual(0x84CC);
            console.info("webgltest gl.TEXTURE13 = 0x84CD");
            expect(gl.TEXTURE13).assertEqual(0x84CD);
            console.info("webgltest gl.TEXTURE14 = 0x84CE");
            expect(gl.TEXTURE14).assertEqual(0x84CE);
            console.info("webgltest gl.TEXTURE15 = 0x84CF");
            expect(gl.TEXTURE15).assertEqual(0x84CF);
            console.info("webgltest gl.TEXTURE16 = 0x84D0");
            expect(gl.TEXTURE16).assertEqual(0x84D0);
            console.info("webgltest gl.TEXTURE17 = 0x84D1");
            expect(gl.TEXTURE17).assertEqual(0x84D1);
            console.info("webgltest gl.TEXTURE18 = 0x84D2");
            expect(gl.TEXTURE18).assertEqual(0x84D2);
            console.info("webgltest gl.TEXTURE19 = 0x84D3");
            expect(gl.TEXTURE19).assertEqual(0x84D3);
            console.info("webgltest gl.TEXTURE20 = 0x84D4");
            expect(gl.TEXTURE20).assertEqual(0x84D4);
            console.info("webgltest gl.TEXTURE21 = 0x84D5");
            expect(gl.TEXTURE21).assertEqual(0x84D5);
            console.info("webgltest gl.TEXTURE22 = 0x84D6");
            expect(gl.TEXTURE22).assertEqual(0x84D6);
            console.info("webgltest gl.TEXTURE23 = 0x84D7");
            expect(gl.TEXTURE23).assertEqual(0x84D7);
            console.info("webgltest gl.TEXTURE24 = 0x84D8");
            expect(gl.TEXTURE24).assertEqual(0x84D8);
            console.info("webgltest gl.TEXTURE25 = 0x84D9");
            expect(gl.TEXTURE25).assertEqual(0x84D9);
            console.info("webgltest gl.TEXTURE26 = 0x84DA");
            expect(gl.TEXTURE26).assertEqual(0x84DA);
            console.info("webgltest gl.TEXTURE27 = 0x84DB");
            expect(gl.TEXTURE27).assertEqual(0x84DB);
            console.info("webgltest gl.TEXTURE28 = 0x84DC");
            expect(gl.TEXTURE28).assertEqual(0x84DC);
            console.info("webgltest gl.TEXTURE29 = 0x84DD");
            expect(gl.TEXTURE29).assertEqual(0x84DD);
            console.info("webgltest gl.TEXTURE30 = 0x84DE");
            expect(gl.TEXTURE30).assertEqual(0x84DE);
            console.info("webgltest gl.TEXTURE31 = 0x84DF");
            expect(gl.TEXTURE31).assertEqual(0x84DF);
            console.info("webgltest gl.ACTIVE_TEXTURE = 0x84E0");
            expect(gl.ACTIVE_TEXTURE).assertEqual(0x84E0);

            /* TextureWrapMode */
            console.info("webgltest gl.REPEAT = 0x2901");
            expect(gl.REPEAT).assertEqual(0x2901);
            console.info("webgltest gl.CLAMP_TO_EDGE = 0x812F");
            expect(gl.CLAMP_TO_EDGE).assertEqual(0x812F);
            console.info("webgltest gl.MIRRORED_REPEAT = 0x8370");
            expect(gl.MIRRORED_REPEAT).assertEqual(0x8370);

            /* Uniform Types */
            console.info("webgltest gl.FLOAT_VEC2 = 0x8B50");
            expect(gl.FLOAT_VEC2).assertEqual(0x8B50);
            console.info("webgltest gl.FLOAT_VEC3 = 0x8B51");
            expect(gl.FLOAT_VEC3).assertEqual(0x8B51);
            console.info("webgltest gl.FLOAT_VEC4 = 0x8B52");
            expect(gl.FLOAT_VEC4).assertEqual(0x8B52);
            console.info("webgltest gl.INT_VEC2 = 0x8B53");
            expect(gl.INT_VEC2).assertEqual(0x8B53);
            console.info("webgltest gl.INT_VEC3 = 0x8B54");
            expect(gl.INT_VEC3).assertEqual(0x8B54);
            console.info("webgltest gl.INT_VEC4 = 0x8B55");
            expect(gl.INT_VEC4).assertEqual(0x8B55);
            console.info("webgltest gl.BOOL = 0x8B56");
            expect(gl.BOOL).assertEqual(0x8B56);
            console.info("webgltest gl.BOOL_VEC2 = 0x8B57");
            expect(gl.BOOL_VEC2).assertEqual(0x8B57);
            console.info("webgltest gl.BOOL_VEC3 = 0x8B58");
            expect(gl.BOOL_VEC3).assertEqual(0x8B58);
            console.info("webgltest gl.BOOL_VEC4 = 0x8B59");
            expect(gl.BOOL_VEC4).assertEqual(0x8B59);
            console.info("webgltest gl.FLOAT_MAT2 = 0x8B5A");
            expect(gl.FLOAT_MAT2).assertEqual(0x8B5A);
            console.info("webgltest gl.FLOAT_MAT3 = 0x8B5B");
            expect(gl.FLOAT_MAT3).assertEqual(0x8B5B);
            console.info("webgltest gl.FLOAT_MAT4 = 0x8B5C");
            expect(gl.FLOAT_MAT4).assertEqual(0x8B5C);
            console.info("webgltest gl.SAMPLER_2D = 0x8B5E");
            expect(gl.SAMPLER_2D).assertEqual(0x8B5E);
            console.info("webgltest gl.SAMPLER_CUBE = 0x8B60");
            expect(gl.SAMPLER_CUBE).assertEqual(0x8B60);

            /* Vertex Arrays */
            console.info("webgltest gl.VERTEX_ATTRIB_ARRAY_ENABLED = 0x8622");
            expect(gl.VERTEX_ATTRIB_ARRAY_ENABLED).assertEqual(0x8622);
            console.info("webgltest gl.VERTEX_ATTRIB_ARRAY_SIZE = 0x8623");
            expect(gl.VERTEX_ATTRIB_ARRAY_SIZE).assertEqual(0x8623);
            console.info("webgltest gl.VERTEX_ATTRIB_ARRAY_STRIDE = 0x8624");
            expect(gl.VERTEX_ATTRIB_ARRAY_STRIDE).assertEqual(0x8624);
            console.info("webgltest gl.VERTEX_ATTRIB_ARRAY_TYPE = 0x8625");
            expect(gl.VERTEX_ATTRIB_ARRAY_TYPE).assertEqual(0x8625);
            console.info("webgltest gl.VERTEX_ATTRIB_ARRAY_NORMALIZED = 0x886A");
            expect(gl.VERTEX_ATTRIB_ARRAY_NORMALIZED).assertEqual(0x886A);
            console.info("webgltest gl.VERTEX_ATTRIB_ARRAY_POINTER = 0x8645");
            expect(gl.VERTEX_ATTRIB_ARRAY_POINTER).assertEqual(0x8645);
            console.info("webgltest gl.VERTEX_ATTRIB_ARRAY_BUFFER_BINDING = 0x889F");
            expect(gl.VERTEX_ATTRIB_ARRAY_BUFFER_BINDING).assertEqual(0x889F);

            /* Read Format */
            console.info("webgltest gl.IMPLEMENTATION_COLOR_READ_TYPE = 0x8B9A");
            expect(gl.IMPLEMENTATION_COLOR_READ_TYPE).assertEqual(0x8B9A);
            console.info("webgltest gl.IMPLEMENTATION_COLOR_READ_FORMAT = 0x8B9B");
            expect(gl.IMPLEMENTATION_COLOR_READ_FORMAT).assertEqual(0x8B9B);

            /* Shader Source */
            console.info("webgltest gl.COMPILE_STATUS = 0x8B81");
            expect(gl.COMPILE_STATUS).assertEqual(0x8B81);

            /* Shader Precision-Specified Types */
            console.info("webgltest gl.LOW_FLOAT = 0x8DF0");
            expect(gl.LOW_FLOAT).assertEqual(0x8DF0);
            console.info("webgltest gl.MEDIUM_FLOAT = 0x8DF1");
            expect(gl.MEDIUM_FLOAT).assertEqual(0x8DF1);
            console.info("webgltest gl.HIGH_FLOAT = 0x8DF2");
            expect(gl.HIGH_FLOAT).assertEqual(0x8DF2);
            console.info("webgltest gl.LOW_INT = 0x8DF3");
            expect(gl.LOW_INT).assertEqual(0x8DF3);
            console.info("webgltest gl.MEDIUM_INT = 0x8DF4");
            expect(gl.MEDIUM_INT).assertEqual(0x8DF4);
            console.info("webgltest gl.HIGH_INT = 0x8DF5");
            expect(gl.HIGH_INT).assertEqual(0x8DF5);

            /* Framebuffer Object. */
            console.info("webgltest gl.FRAMEBUFFER = 0x8D40");
            expect(gl.FRAMEBUFFER).assertEqual(0x8D40);
            console.info("webgltest gl.RENDERBUFFER = 0x8D41");
            expect(gl.RENDERBUFFER).assertEqual(0x8D41);
            console.info("webgltest gl.RGBA4 = 0x8056");
            expect(gl.RGBA4).assertEqual(0x8056);
            console.info("webgltest gl.RGB5_A1 = 0x8057");
            expect(gl.RGB5_A1).assertEqual(0x8057);
            console.info("webgltest gl.RGB565 = 0x8D62");
            expect(gl.RGB565).assertEqual(0x8D62);
            console.info("webgltest gl.DEPTH_COMPONENT16 = 0x81A5");
            expect(gl.DEPTH_COMPONENT16).assertEqual(0x81A5);
            console.info("webgltest gl.STENCIL_INDEX8 = 0x8D48");
            expect(gl.STENCIL_INDEX8).assertEqual(0x8D48);
            console.info("webgltest gl.DEPTH_STENCIL = 0x84F9");
            expect(gl.DEPTH_STENCIL).assertEqual(0x84F9);
            console.info("webgltest gl.RENDERBUFFER_WIDTH = 0x8D42");
            expect(gl.RENDERBUFFER_WIDTH).assertEqual(0x8D42);
            console.info("webgltest gl.RENDERBUFFER_HEIGHT = 0x8D43");
            expect(gl.RENDERBUFFER_HEIGHT).assertEqual(0x8D43);
            console.info("webgltest gl.RENDERBUFFER_INTERNAL_FORMAT = 0x8D44");
            expect(gl.RENDERBUFFER_INTERNAL_FORMAT).assertEqual(0x8D44);
            console.info("webgltest gl.RENDERBUFFER_RED_SIZE = 0x8D50");
            expect(gl.RENDERBUFFER_RED_SIZE).assertEqual(0x8D50);
            console.info("webgltest gl.RENDERBUFFER_GREEN_SIZE = 0x8D51");
            expect(gl.RENDERBUFFER_GREEN_SIZE).assertEqual(0x8D51);
            console.info("webgltest gl.RENDERBUFFER_BLUE_SIZE = 0x8D52");
            expect(gl.RENDERBUFFER_BLUE_SIZE).assertEqual(0x8D52);
            console.info("webgltest gl.RENDERBUFFER_ALPHA_SIZE = 0x8D53");
            expect(gl.RENDERBUFFER_ALPHA_SIZE).assertEqual(0x8D53);
            console.info("webgltest gl.RENDERBUFFER_DEPTH_SIZE = 0x8D54");
            expect(gl.RENDERBUFFER_DEPTH_SIZE).assertEqual(0x8D54);
            console.info("webgltest gl.RENDERBUFFER_STENCIL_SIZE = 0x8D55");
            expect(gl.RENDERBUFFER_STENCIL_SIZE).assertEqual(0x8D55);

            console.info("webgltest gl.FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE = 0x8CD0");
            expect(gl.FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE).assertEqual(0x8CD0);
            console.info("webgltest gl.FRAMEBUFFER_ATTACHMENT_OBJECT_NAME = 0x8CD1");
            expect(gl.FRAMEBUFFER_ATTACHMENT_OBJECT_NAME).assertEqual(0x8CD1);
            console.info("webgltest gl.FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL = 0x8CD2");
            expect(gl.FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL).assertEqual(0x8CD2);
            console.info("webgltest gl.FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE = 0x8CD3");
            expect(gl.FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE).assertEqual(0x8CD3);
            console.info("webgltest gl.COLOR_ATTACHMENT0 = 0x8CE0");
            expect(gl.COLOR_ATTACHMENT0).assertEqual(0x8CE0);
            console.info("webgltest gl.DEPTH_ATTACHMENT = 0x8D00");
            expect(gl.DEPTH_ATTACHMENT).assertEqual(0x8D00);
            console.info("webgltest gl.STENCIL_ATTACHMENT = 0x8D20");
            expect(gl.STENCIL_ATTACHMENT).assertEqual(0x8D20);
            console.info("webgltest gl.DEPTH_STENCIL_ATTACHMENT = 0x821A");
            expect(gl.DEPTH_STENCIL_ATTACHMENT).assertEqual(0x821A);

            console.info("webgltest gl.NONE = 0");
            expect(gl.NONE).assertEqual(0);

            console.info("webgltest gl.FRAMEBUFFER_COMPLETE = 0x8CD5");
            expect(gl.FRAMEBUFFER_COMPLETE).assertEqual(0x8CD5);
            console.info("webgltest gl.FRAMEBUFFER_INCOMPLETE_ATTACHMENT = 0x8CD6");
            expect(gl.FRAMEBUFFER_INCOMPLETE_ATTACHMENT).assertEqual(0x8CD6);
            console.info("webgltest gl.FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT = 0x8CD7");
            expect(gl.FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT).assertEqual(0x8CD7);
            console.info("webgltest gl.FRAMEBUFFER_INCOMPLETE_DIMENSIONS = 0x8CD9");
            expect(gl.FRAMEBUFFER_INCOMPLETE_DIMENSIONS).assertEqual(0x8CD9);
            console.info("webgltest gl.FRAMEBUFFER_UNSUPPORTED = 0x8CDD");
            expect(gl.FRAMEBUFFER_UNSUPPORTED).assertEqual(0x8CDD);

            console.info("webgltest gl.FRAMEBUFFER_BINDING = 0x8CA6");
            expect(gl.FRAMEBUFFER_BINDING).assertEqual(0x8CA6);
            console.info("webgltest gl.RENDERBUFFER_BINDING = 0x8CA7");
            expect(gl.RENDERBUFFER_BINDING).assertEqual(0x8CA7);
            console.info("webgltest gl.MAX_RENDERBUFFER_SIZE = 0x84E8");
            expect(gl.MAX_RENDERBUFFER_SIZE).assertEqual(0x84E8);

            console.info("webgltest gl.INVALID_FRAMEBUFFER_OPERATION = 0x0506");
            expect(gl.INVALID_FRAMEBUFFER_OPERATION).assertEqual(0x0506);

            /* WebGL-specific enums */
            console.info("webgltest gl.UNPACK_FLIP_Y_WEBGL = 0x9240");
            expect(gl.UNPACK_FLIP_Y_WEBGL).assertEqual(0x9240);
            console.info("webgltest gl.UNPACK_PREMULTIPLY_ALPHA_WEBGL = 0x9241");
            expect(gl.UNPACK_PREMULTIPLY_ALPHA_WEBGL).assertEqual(0x9241);
            console.info("webgltest gl.CONTEXT_LOST_WEBGL = 0x9242");
            expect(gl.CONTEXT_LOST_WEBGL).assertEqual(0x9242);
            console.info("webgltest gl.UNPACK_COLORSPACE_CONVERSION_WEBGL = 0x9243");
            expect(gl.UNPACK_COLORSPACE_CONVERSION_WEBGL).assertEqual(0x9243);
            console.info("webgltest gl.BROWSER_DEFAULT_WEBGL = 0x9244");
            expect(gl.BROWSER_DEFAULT_WEBGL).assertEqual(0x9244);
            done();
        })
    })
}
