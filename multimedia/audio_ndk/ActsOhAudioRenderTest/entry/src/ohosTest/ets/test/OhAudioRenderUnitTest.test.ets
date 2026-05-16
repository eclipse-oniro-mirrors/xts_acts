/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libOhAudioRenderOps from 'libohaudiorenderops.so';

export default function OhAudioRenderUnitTest() {
  describe('OhAudioRenderUnitTest', () => {
    beforeAll(() => {
      // Setup before all tests
    })
    beforeEach(() => {
      // Setup before each test
    })
    afterEach(() => {
      // Cleanup after each test
    })
    afterAll(() => {
      // Cleanup after all tests
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GENERATE_0100
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GENERATE_0100
     * @tc.desc   测试音频渲染器创建功能，验证渲染器能正常创建
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GENERATE_0100', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.RendererCreationTest(0);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GENERATE_0200
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GENERATE_0200
     * @tc.desc   测试使用错误类型创建渲染器，验证参数校验功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GENERATE_0200', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.RendererCreationTest(1);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })


    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_START_0100
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_START_0100
     * @tc.desc   测试音频渲染器启动功能，验证渲染器能正常启动
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_START_0100', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.LifecycleControlTest(0);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_START_0200
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_START_0200
     * @tc.desc   测试重复启动渲染器，验证状态异常处理
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_START_0200', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.LifecycleControlTest(1);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_PAUSE_0100
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_PAUSE_0100
     * @tc.desc   测试音频渲染器暂停功能，验证渲染器能正常暂停
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_PAUSE_0100', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.LifecycleControlTest(2);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_PAUSE_0200
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_PAUSE_0200
     * @tc.desc   测试未启动状态下暂停，验证状态异常处理
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_PAUSE_0200', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.LifecycleControlTest(3);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_STOP_0100
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_STOP_0100
     * @tc.desc   测试音频渲染器停止功能，验证渲染器能正常停止
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_STOP_0100', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.LifecycleControlTest(4);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_STOP_0200
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_STOP_0200
     * @tc.desc   测试未启动状态下停止，验证状态异常处理
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_STOP_0200', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.LifecycleControlTest(5);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_FLUSH_0100
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_FLUSH_0100
     * @tc.desc   测试音频渲染器刷新功能，验证缓冲区能正常清空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_FLUSH_0100', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.LifecycleControlTest(6);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_FLUSH_0200
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_FLUSH_0200
     * @tc.desc   测试未启动状态下刷新，验证状态异常处理
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_FLUSH_0200', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.LifecycleControlTest(7);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_RELEASE_0100
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_RELEASE_0100
     * @tc.desc   测试音频渲染器释放功能，验证资源能正常释放
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_RELEASE_0100', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.LifecycleControlTest(8);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_CURRENT_STATE_0100
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_CURRENT_STATE_0100
     * @tc.desc   测试获取PREPARED状态，验证状态查询功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_CURRENT_STATE_0100', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.LifecycleControlTest(9);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_CURRENT_STATE_0200
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_CURRENT_STATE_0200
     * @tc.desc   测试获取RUNNING状态，验证状态查询功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_CURRENT_STATE_0200', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.LifecycleControlTest(10);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_CURRENT_STATE_0300
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_CURRENT_STATE_0300
     * @tc.desc   测试获取PAUSED状态，验证状态查询功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_CURRENT_STATE_0300', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.LifecycleControlTest(11);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_CURRENT_STATE_0400
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_CURRENT_STATE_0400
     * @tc.desc   测试获取STOPPED状态，验证状态查询功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_CURRENT_STATE_0400', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.LifecycleControlTest(12);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

   
    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_PARAMETER_0100
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_PARAMETER_0100
     * @tc.desc   测试获取延迟模式参数，验证参数获取功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_PARAMETER_0100', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.ParameterGetterTest(0);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_PARAMETER_0200
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_PARAMETER_0200
     * @tc.desc   测试获取流ID，验证流标识查询功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_PARAMETER_0200', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.ParameterGetterTest(1);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_SAMPLING_RATE_0100
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_SAMPLING_RATE_0100
     * @tc.desc   测试获取采样率，验证采样率查询功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_SAMPLING_RATE_0100', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.ParameterGetterTest(2);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_SAMPLE_FORMAT_0100
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_SAMPLE_FORMAT_0100
     * @tc.desc   测试获取采样格式，验证格式查询功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_SAMPLE_FORMAT_0100', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.ParameterGetterTest(3);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_ENCODING_TYPE_0100
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_ENCODING_TYPE_0100
     * @tc.desc   测试获取编码类型，验证编码类型查询功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_ENCODING_TYPE_0100', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.ParameterGetterTest(4);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_RENDERER_INFO_0100
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_RENDERER_INFO_0100
     * @tc.desc   测试获取渲染器信息，验证渲染器属性查询功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_RENDERER_INFO_0100', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.ParameterGetterTest(5);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_RENDERER_PRIVACY_0100
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_RENDERER_PRIVACY_0100
     * @tc.desc   测试获取默认隐私类型，验证隐私设置查询功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_RENDERER_PRIVACY_0100', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.ParameterGetterTest(6);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_RENDERER_PRIVACY_0200
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_RENDERER_PRIVACY_0200
     * @tc.desc   测试获取自定义隐私类型，验证隐私设置查询功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_RENDERER_PRIVACY_0200', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.ParameterGetterTest(7);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_CHANNEL_LAYOUT_0100
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_CHANNEL_LAYOUT_0100
     * @tc.desc   测试获取声道布局，验证声道配置查询功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_CHANNEL_LAYOUT_0100', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.ParameterGetterTest(8);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_EFFECT_MODE_0100
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_EFFECT_MODE_0100
     * @tc.desc   测试获取音效模式，验证音效设置查询功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_EFFECT_MODE_0100', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.ParameterGetterTest(9);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_VOLUME_0100
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_VOLUME_0100
     * @tc.desc   测试空指针获取音量，验证参数校验功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_VOLUME_0100', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.VolumeControlTest(0);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_VOLUME_0200
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_VOLUME_0200
     * @tc.desc   测试获取默认音量，验证音量查询功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_VOLUME_0200', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.VolumeControlTest(1);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_VOLUME_0300
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_VOLUME_0300
     * @tc.desc   测试设置并获取音量，验证音量设置和查询功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_VOLUME_0300', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.VolumeControlTest(2);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_VOLUME_0400
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_VOLUME_0400
     * @tc.desc   测试设置无效音量后查询，验证参数校验功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_VOLUME_0400', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.VolumeControlTest(3);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_VOLUME_0100
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_VOLUME_0100
     * @tc.desc   测试空指针设置音量，验证参数校验功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_VOLUME_0100', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.VolumeControlTest(4);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_VOLUME_0200
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_VOLUME_0200
     * @tc.desc   测试设置正常音量，验证音量设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_VOLUME_0200', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.VolumeControlTest(5);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_VOLUME_0300
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_VOLUME_0300
     * @tc.desc   测试设置边界音量值，验证音量范围处理
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_VOLUME_0300', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.VolumeControlTest(6);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_VOLUME_0400
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_VOLUME_0400
     * @tc.desc   测试设置负数音量，验证参数校验功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_VOLUME_0400', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.VolumeControlTest(7);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_VOLUME_WITH_RAMP_0100
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_VOLUME_WITH_RAMP_0100
     * @tc.desc   测试空指针渐变音量，验证参数校验功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_VOLUME_WITH_RAMP_0100', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.VolumeControlTest(8);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_VOLUME_WITH_RAMP_0200
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_VOLUME_WITH_RAMP_0200
     * @tc.desc   测试渐变音量设置，验证音量渐变功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_VOLUME_WITH_RAMP_0200', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.VolumeControlTest(9);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_MARK_POSITION_0100
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_MARK_POSITION_0100
     * @tc.desc   测试空指针设置标记位置，验证参数校验功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_MARK_POSITION_0100', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.MarkPositionTest(0);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_MARK_POSITION_0200
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_MARK_POSITION_0200
     * @tc.desc   测试设置标记位置，验证标记位置设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_MARK_POSITION_0200', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.MarkPositionTest(1);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_MARK_POSITION_0300
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_MARK_POSITION_0300
     * @tc.desc   测试设置无效标记位置，验证参数校验功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_MARK_POSITION_0300', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.MarkPositionTest(2);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_MARK_POSITION_0400
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_MARK_POSITION_0400
     * @tc.desc   测试标记位置回调触发，验证回调功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_MARK_POSITION_0400', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.MarkPositionTest(3);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_MARK_POSITION_0500
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_MARK_POSITION_0500
     * @tc.desc   测试重复设置标记位置，验证覆盖设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_MARK_POSITION_0500', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.MarkPositionTest(4);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_CANCEL_MARK_0100
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_CANCEL_MARK_0100
     * @tc.desc   测试空指针取消标记，验证参数校验功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_CANCEL_MARK_0100', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.MarkPositionTest(5);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_CANCEL_MARK_0200
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_CANCEL_MARK_0200
     * @tc.desc   测试取消标记，验证标记取消功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_CANCEL_MARK_0200', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.MarkPositionTest(6);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_CANCEL_MARK_0300
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_CANCEL_MARK_0300
     * @tc.desc   测试设置后取消标记，验证取消功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_CANCEL_MARK_0300', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.MarkPositionTest(7);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_UNDERFLOW_COUNT_0100
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_UNDERFLOW_COUNT_0100
     * @tc.desc   测试获取下溢计数（延迟触发），验证下溢检测功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_UNDERFLOW_COUNT_0100', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.UnderflowDetectionTest(0);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_UNDERFLOW_COUNT_0200
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_UNDERFLOW_COUNT_0200
     * @tc.desc   测试回调延迟触发下溢，验证下溢检测功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_UNDERFLOW_COUNT_0200', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.UnderflowDetectionTest(1);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_UNDERFLOW_COUNT_0300
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_UNDERFLOW_COUNT_0300
     * @tc.desc   测试正常播放无下溢，验证下溢计数准确性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_UNDERFLOW_COUNT_0300', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.UnderflowDetectionTest(2);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_UNDERFLOW_COUNT_0400
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_UNDERFLOW_COUNT_0400
     * @tc.desc   测试不同延迟下的下溢计数，验证下溢累积功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_UNDERFLOW_COUNT_0400', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.UnderflowDetectionTest(3);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_UNDERFLOW_COUNT_0500
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_UNDERFLOW_COUNT_0500
     * @tc.desc   测试长时间播放无下溢，验证稳定性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDERER_GET_UNDERFLOW_COUNT_0500', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.UnderflowDetectionTest(4);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_WRITE_DATA_CALLBACK_0100
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_WRITE_DATA_CALLBACK_0100
     * @tc.desc   测试返回有效数据的写数据回调，验证回调功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_WRITE_DATA_CALLBACK_0100', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.WriteDataCallbackTest(0);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_WRITE_DATA_CALLBACK_0200
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_WRITE_DATA_CALLBACK_0200
     * @tc.desc   测试返回无效数据的写数据回调，验证回调功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_WRITE_DATA_CALLBACK_0200', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.WriteDataCallbackTest(1);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_WRITE_DATA_CALLBACK_0300
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_WRITE_DATA_CALLBACK_0300
     * @tc.desc   测试新旧回调同时设置（新回调优先），验证回调优先级
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_WRITE_DATA_CALLBACK_0300', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.WriteDataCallbackTest(2);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_WRITE_DATA_CALLBACK_0400
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_WRITE_DATA_CALLBACK_0400
     * @tc.desc   测试新旧回调同时设置（无效数据），验证回调功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_WRITE_DATA_CALLBACK_0400', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.WriteDataCallbackTest(3);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_WRITE_DATA_CALLBACK_0500
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_WRITE_DATA_CALLBACK_0500
     * @tc.desc   测试先设置新回调再设置旧回调，验证回调覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_WRITE_DATA_CALLBACK_0500', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.WriteDataCallbackTest(4);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_WRITE_DATA_CALLBACK_0600
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_WRITE_DATA_CALLBACK_0600
     * @tc.desc   测试先设置新回调再设置旧回调（无效数据），验证回调覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_WRITE_DATA_CALLBACK_0600', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.WriteDataCallbackTest(5);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_0100
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_0100
     * @tc.desc   测试音乐场景设置-90.0f响度增益，验证边界值设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_0100', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.LoudnessGainSetTest(0);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_0200
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_0200
     * @tc.desc   测试音乐场景设置-89.9f响度增益，验证浮点数设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_0200', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.LoudnessGainSetTest(1);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_0300
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_0300
     * @tc.desc   测试电影场景设置24.0f响度增益，验证上限值设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_0300', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.LoudnessGainSetTest(2);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_0400
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_0400
     * @tc.desc   测试有声读物场景设置23.9f响度增益，验证浮点数设置功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_0400', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.LoudnessGainSetTest(3);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_0500
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_0500
     * @tc.desc   测试特殊延迟模式设置响度增益，验证延迟模式兼容性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_0500', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.LoudnessGainSetTest(4);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_0600
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_0600
     * @tc.desc   测试设置超下限响度增益，验证参数校验功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_0600', Level.LEVEL1, async () => {
      try {
        const result = await libOhAudioRenderOps.LoudnessGainSetTest(5);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_0700
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_0700
     * @tc.desc   测试设置超上限响度增益，验证参数校验功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL1
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_0700', Level.LEVEL1, async () => {
      try {
        const result = await libOhAudioRenderOps.LoudnessGainSetTest(6);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_0800
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_0800
     * @tc.desc   测试空指针设置响度增益，验证参数校验功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_0800', Level.LEVEL2, async () => {
      try {
        const result = await libOhAudioRenderOps.LoudnessGainSetTest(7);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_1000
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_1000
     * @tc.desc   测试语音通话场景设置响度增益，验证场景限制
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_1000', Level.LEVEL2, async () => {
      try {
        const result = await libOhAudioRenderOps.LoudnessGainSetTest(8);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_1100
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_1100
     * @tc.desc   测试语音助手场景设置响度增益，验证场景限制
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_1100', Level.LEVEL2, async () => {
      try {
        const result = await libOhAudioRenderOps.LoudnessGainSetTest(9);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_1200
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_1200
     * @tc.desc   测试闹钟场景设置响度增益，验证场景限制
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_1200', Level.LEVEL2, async () => {
      try {
        const result = await libOhAudioRenderOps.LoudnessGainSetTest(10);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_1300
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_1300
     * @tc.desc   测试语音消息场景设置响度增益，验证场景限制
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_1300', Level.LEVEL2, async () => {
      try {
        const result = await libOhAudioRenderOps.LoudnessGainSetTest(11);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_1400
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_1400
     * @tc.desc   测试铃声场景设置响度增益，验证场景限制
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_1400', Level.LEVEL2, async () => {
      try {
        const result = await libOhAudioRenderOps.LoudnessGainSetTest(12);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_1500
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_1500
     * @tc.desc   测试通知场景设置响度增益，验证场景限制
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_1500', Level.LEVEL2, async () => {
      try {
        const result = await libOhAudioRenderOps.LoudnessGainSetTest(13);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_1700
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_1700
     * @tc.desc   测试游戏场景设置响度增益，验证场景限制
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_1700', Level.LEVEL2, async () => {
      try {
        const result = await libOhAudioRenderOps.LoudnessGainSetTest(14);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_1800
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_1800
     * @tc.desc   测试导航场景设置响度增益，验证场景限制
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_1800', Level.LEVEL2, async () => {
      try {
        const result = await libOhAudioRenderOps.LoudnessGainSetTest(15);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_1900
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_1900
     * @tc.desc   测试视频通话场景设置响度增益，验证场景限制
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_1900', Level.LEVEL2, async () => {
      try {
        const result = await libOhAudioRenderOps.LoudnessGainSetTest(16);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_2100
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_2100
     * @tc.desc   测试循环设置响度增益，验证稳定性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL0
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_SET_LOUDNESS_GAIN_2100', Level.LEVEL0, async () => {
      try {
        const result = await libOhAudioRenderOps.LoudnessGainSetTest(17);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_LOUDNESS_GAIN_0100
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_LOUDNESS_GAIN_0100
     * @tc.desc   测试空指针获取响度增益，验证参数校验功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_LOUDNESS_GAIN_0100', Level.LEVEL2, async () => {
      try {
        const result = await libOhAudioRenderOps.LoudnessGainGetTest(0);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_LOUDNESS_GAIN_0200
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_LOUDNESS_GAIN_0200
     * @tc.desc   测试空指针获取响度增益值，验证参数校验功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_OH_AUDIO_RENDER_GET_LOUDNESS_GAIN_0200', Level.LEVEL2, async () => {
      try {
        const result = await libOhAudioRenderOps.LoudnessGainGetTest(1);
      expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_IS_ACOUSTIC_ECHO_CANCELER_SUPPORTED_0100
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_IS_ACOUSTIC_ECHO_CANCELER_SUPPORTED_0100
     * @tc.desc   测试空指针查询回声消除支持，验证参数校验功能
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_IS_ACOUSTIC_ECHO_CANCELER_SUPPORTED_0100', Level.LEVEL2, async () => {
      try {
        const result = await libOhAudioRenderOps.StreamManagerTest(0);
        expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })
    
    /**
     * @tc.name   SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_IS_ACOUSTIC_ECHO_CANCELER_SUPPORTED_0200
     * @tc.number SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_IS_ACOUSTIC_ECHO_CANCELER_SUPPORTED_0200
     * @tc.desc   测试查询回声消除支持，验证功能查询
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL2
     */
    it('SUB_MUlTIMEDIA_AUDIO_FRAMEWORK_IS_ACOUSTIC_ECHO_CANCELER_SUPPORTED_0200', Level.LEVEL2, async () => {
      try {
        const result = await libOhAudioRenderOps.StreamManagerTest(1);
        expect(result).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
    })
  })
}

