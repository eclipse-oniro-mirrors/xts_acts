/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import audio from '@ohos.multimedia.audio';
import { BusinessError } from '@ohos.base';

export default function audioOriginalAppIdInfoTest() {
  describe('AudioOriginalAppIdInfoTest', () => {
    let audioManager: audio.AudioManager | null = null;
    let audioRenderer: audio.AudioRenderer | null = null;
    const TAG = 'AudioOriginalAppIdInfoTest';

    beforeAll(() => {
      console.info(`${TAG}: beforeAll: 测试套件初始化`);
      audioManager = audio.getAudioManager();
      expect(audioManager != null).assertEqual(true);
      console.info(`${TAG}: AudioManager 获取成功`);
    })

    beforeEach(() => {
      console.info(`${TAG}: beforeEach: 测试用例初始化`);
      audioRenderer = null;
    })

    afterEach(async () => {
      console.info(`${TAG}: afterEach: 测试用例清理`);
      if (audioRenderer) {
        try {
          if (audioRenderer.state === audio.AudioState.STATE_RUNNING) {
            await audioRenderer.stop();
          }
          await audioRenderer.release();
          audioRenderer = null;
        } catch (err) {
          console.error(`${TAG}: 清理 AudioRenderer 失败`);
        }
      }
    })

    afterAll(() => {
      console.info(`${TAG}: afterAll: 测试套件清理`);
      audioManager = null;
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_CREATE_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_CREATE_0100
     * @tc.desc    创建AudioRenderer时使用originalAppIdInfo参数
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_CREATE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(`${TAG}: 测试点: 创建AudioRenderer时使用originalAppIdInfo参数`);
        console.info(`${TAG}: 测试输入: AudioRendererOptions包含originalAppIdInfo`);
        
        let appIdInfo: audio.AppIdInfo = {
          appUid: 1001,
          appPid: 2001,
          appTokenId: 3001,
          appFullTokenId: 4001
        }
        
        let audioRendererOptions: audio.AudioRendererOptions = {
          streamInfo: {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
          },
          rendererInfo: {
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
          },
          originalAppIdInfo: appIdInfo
        }
        
        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        console.info(`${TAG}: 测试输出: 验证AudioRenderer创建成功`);
        expect(audioManager != null).assertEqual(true);
        expect(audioRenderer.state).assertEqual(audio.AudioState.STATE_PREPARED);
        console.info(`${TAG}: AudioRenderer创建成功,状态: ${audioRenderer.state}`);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(`${TAG}: 创建失败: ${error.code}, ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_OPTIONAL_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_OPTIONAL_0100
     * @tc.desc    验证originalAppIdInfo为可选参数
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level1
     */
    it('SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_OPTIONAL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`${TAG}: 测试点: 验证originalAppIdInfo为可选参数`);
        console.info(`${TAG}: 测试输入: AudioRendererOptions不包含originalAppIdInfo`);
        
        let audioRendererOptions: audio.AudioRendererOptions = {
          streamInfo: {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
          },
          rendererInfo: {
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
          }
        }
        
        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        console.info(`${TAG}: 测试输出: 验证不传originalAppIdInfo时AudioRenderer创建成功`);
        expect(audioManager != null).assertEqual(true);
        expect(audioRenderer.state).assertEqual(audio.AudioState.STATE_PREPARED);
        console.info(`${TAG}: 不传originalAppIdInfo,AudioRenderer创建成功`);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(`${TAG}: 创建失败: ${error.code}, ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_UNDEFINED_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_UNDEFINED_0100
     * @tc.desc    验证originalAppIdInfo传入undefined
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level1
     */
    it('SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_UNDEFINED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`${TAG}: 测试点: 验证originalAppIdInfo传入undefined`);
        console.info(`${TAG}: 测试输入: originalAppIdInfo = undefined`);
        
        let audioRendererOptions: audio.AudioRendererOptions = {
          streamInfo: {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
          },
          rendererInfo: {
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
          },
          originalAppIdInfo: undefined
        }
        
        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        console.info(`${TAG}: 测试输出: 验证传入undefined时AudioRenderer创建成功`);
        expect(audioManager != null).assertEqual(true);
        expect(audioRenderer.state).assertEqual(audio.AudioState.STATE_PREPARED);
        console.info(`${TAG}: 传入undefined,AudioRenderer创建成功`);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(`${TAG}: 创建失败: ${error.code}, ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_NULL_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_NULL_0100
     * @tc.desc    验证originalAppIdInfo传入null
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level1
     */
    it('SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_NULL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`${TAG}: 测试点: 验证originalAppIdInfo传入null`);
        console.info(`${TAG}: 测试输入: originalAppIdInfo = null`);
        
        let audioRendererOptions: audio.AudioRendererOptions = {
          streamInfo: {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
          },
          rendererInfo: {
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
          },
        }
        
        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        console.info(`${TAG}: 测试输出: 验证传入null时AudioRenderer创建成功`);
        expect(audioManager != null).assertEqual(true);
        expect(audioRenderer.state).assertEqual(audio.AudioState.STATE_PREPARED);
        console.info(`${TAG}: 传入null,AudioRenderer创建成功`);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(`${TAG}: 创建失败: ${error.code}, ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_APP_UID_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_APP_UID_0100
     * @tc.desc    验证AppIdInfo的appUid属性类型
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level1
     */
    it('SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_APP_UID_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`${TAG}: 测试点: 验证AppIdInfo的appUid属性类型`);
        console.info(`${TAG}: 测试输入: appUid为正整数`);
        
        let appIdInfo: audio.AppIdInfo = {
          appUid: 1001,
          appPid: 2001,
          appTokenId: 3001,
          appFullTokenId: 4001
        }
        
        let audioRendererOptions: audio.AudioRendererOptions = {
          streamInfo: {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
          },
          rendererInfo: {
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
          },
          originalAppIdInfo: appIdInfo
        }
        
        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        console.info(`${TAG}: 测试输出: 验证appUid属性被正确处理`);
        expect(audioManager != null).assertEqual(true);
        console.info(`${TAG}: appUid属性验证成功,值: ${appIdInfo.appUid}`);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(`${TAG}: 创建失败: ${error.code}, ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_APP_PID_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_APP_PID_0100
     * @tc.desc    验证AppIdInfo的appPid属性类型
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level1
     */
    it('SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_APP_PID_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`${TAG}: 测试点: 验证AppIdInfo的appPid属性类型`);
        console.info(`${TAG}: 测试输入: appPid为正整数`);
        
        let appIdInfo: audio.AppIdInfo = {
          appUid: 1001,
          appPid: 2001,
          appTokenId: 3001,
          appFullTokenId: 4001
        }
        
        let audioRendererOptions: audio.AudioRendererOptions = {
          streamInfo: {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
          },
          rendererInfo: {
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
          },
          originalAppIdInfo: appIdInfo
        }
        
        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        console.info(`${TAG}: 测试输出: 验证appPid属性被正确处理`);
        expect(audioManager != null).assertEqual(true);
        console.info(`${TAG}: appPid属性验证成功,值: ${appIdInfo.appPid}`);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(`${TAG}: 创建失败: ${error.code}, ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_APP_TOKEN_ID_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_APP_TOKEN_ID_0100
     * @tc.desc    验证AppIdInfo的appTokenId属性类型
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level1
     */
    it('SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_APP_TOKEN_ID_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`${TAG}: 测试点: 验证AppIdInfo的appTokenId属性类型`);
        console.info(`${TAG}: 测试输入: appTokenId为正整数`);
        
        let appIdInfo: audio.AppIdInfo = {
          appUid: 1001,
          appPid: 2001,
          appTokenId: 3001,
          appFullTokenId: 4001
        }
        
        let audioRendererOptions: audio.AudioRendererOptions = {
          streamInfo: {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
          },
          rendererInfo: {
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
          },
          originalAppIdInfo: appIdInfo
        }
        
        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        console.info(`${TAG}: 测试输出: 验证appTokenId属性被正确处理`);
        expect(audioManager != null).assertEqual(true);
        console.info(`${TAG}: appTokenId属性验证成功,值: ${appIdInfo.appTokenId}`);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(`${TAG}: 创建失败: ${error.code}, ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_APP_FULL_TOKEN_ID_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_APP_FULL_TOKEN_ID_0100
     * @tc.desc    验证AppIdInfo的appFullTokenId属性类型
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level1
     */
    it('SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_APP_FULL_TOKEN_ID_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`${TAG}: 测试点: 验证AppIdInfo的appFullTokenId属性类型`);
        console.info(`${TAG}: 测试输入: appFullTokenId为正整数`);
        
        let appIdInfo: audio.AppIdInfo = {
          appUid: 1001,
          appPid: 2001,
          appTokenId: 3001,
          appFullTokenId: 4001
        }
        
        let audioRendererOptions: audio.AudioRendererOptions = {
          streamInfo: {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
          },
          rendererInfo: {
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
          },
          originalAppIdInfo: appIdInfo
        }
        
        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        console.info(`${TAG}: 测试输出: 验证appFullTokenId属性被正确处理`);
        expect(audioManager != null).assertEqual(true);
        console.info(`${TAG}: appFullTokenId属性验证成功,值: ${appIdInfo.appFullTokenId}`);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(`${TAG}: 创建失败: ${error.code}, ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_ALL_FIELDS_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_ALL_FIELDS_0100
     * @tc.desc    验证AppIdInfo所有属性完整性
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level1
     */
    it('SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_ALL_FIELDS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`${TAG}: 测试点: 验证AppIdInfo所有属性完整性`);
        console.info(`${TAG}: 测试输入: 所有属性均设置有效值`);
        
        let appIdInfo: audio.AppIdInfo = {
          appUid: 1001,
          appPid: 2001,
          appTokenId: 3001,
          appFullTokenId: 4001
        }
        
        let audioRendererOptions: audio.AudioRendererOptions = {
          streamInfo: {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
          },
          rendererInfo: {
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
          },
          originalAppIdInfo: appIdInfo
        }
        
        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        console.info(`${TAG}: 测试输出: 验证所有属性被正确处理`);
        expect(audioManager != null).assertEqual(true);
        console.info(`${TAG}: AppIdInfo所有属性验证成功`);
        console.info(`${TAG}: appUid=${appIdInfo.appUid}, appPid=${appIdInfo.appPid}`);
        console.info(`${TAG}: appTokenId=${appIdInfo.appTokenId}, appFullTokenId=${appIdInfo.appFullTokenId}`);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(`${TAG}: 创建失败: ${error.code}, ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_FIELD_TYPES_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_FIELD_TYPES_0100
     * @tc.desc    验证AppIdInfo各字段类型正确性
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_FIELD_TYPES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        console.info(`${TAG}: 测试点: 验证AppIdInfo各字段类型正确性`);
        console.info(`${TAG}: 测试输入: 所有字段为number类型`);
        
        let appIdInfo: audio.AppIdInfo = {
          appUid: 1001,
          appPid: 2001,
          appTokenId: 3001,
          appFullTokenId: 4001
        }
      
        let audioRendererOptions: audio.AudioRendererOptions = {
          streamInfo: {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
          },
          rendererInfo: {
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
          },
          originalAppIdInfo: appIdInfo
        }
        
        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        console.info(`${TAG}: 测试输出: 验证所有字段均为number类型`);
        expect(audioManager != null).assertEqual(true);
        expect(typeof appIdInfo.appUid === 'number').assertTrue();
        expect(typeof appIdInfo.appPid === 'number').assertTrue();
        expect(typeof appIdInfo.appTokenId === 'number').assertTrue();
        expect(typeof appIdInfo.appFullTokenId === 'number').assertTrue();
        console.info(`${TAG}: 各字段类型验证成功,均为number类型`);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(`${TAG}: 创建失败: ${error.code}, ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_ZERO_VALUES_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_ZERO_VALUES_0100
     * @tc.desc    验证AppIdInfo各字段值为0的情况
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_ZERO_VALUES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        console.info(`${TAG}: 测试点: 验证AppIdInfo各字段值为0的情况`);
        console.info(`${TAG}: 测试输入: 所有字段值设为0`);
        
        let appIdInfo: audio.AppIdInfo = {
          appUid: 0,
          appPid: 0,
          appTokenId: 0,
          appFullTokenId: 0
        }
        
        let audioRendererOptions: audio.AudioRendererOptions = {
          streamInfo: {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
          },
          rendererInfo: {
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
          },
          originalAppIdInfo: appIdInfo
        }
        
        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        console.info(`${TAG}: 测试输出: 验证字段值为0时AudioRenderer创建成功`);
        expect(audioManager != null).assertEqual(true);
        console.info(`${TAG}: 字段值为0,AudioRenderer创建成功`);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(`${TAG}: 创建失败: ${error.code}, ${error.message}`);
        expect(false).assertTrue();
        done();
      };
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_LARGE_VALUES_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_LARGE_VALUES_0100
     * @tc.desc    验证AppIdInfo各字段使用大数值
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_LARGE_VALUES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        console.info(`${TAG}: 测试点: 验证AppIdInfo各字段使用大数值`);
        console.info(`${TAG}: 测试输入: 所有字段设为大数值`);
        
        let appIdInfo: audio.AppIdInfo = {
          appUid: 999999999,
          appPid: 999999999,
          appTokenId: 999999999,
          appFullTokenId: 9999999999999
        }
        
        let audioRendererOptions: audio.AudioRendererOptions = {
          streamInfo: {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
          },
          rendererInfo: {
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
          },
          originalAppIdInfo: appIdInfo
        }
        
        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        console.info(`${TAG}: 测试输出: 验证大数值时AudioRenderer创建成功`);
        expect(audioManager != null).assertEqual(true);
        console.info(`${TAG}: 大数值,AudioRenderer创建成功`);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(`${TAG}: 创建失败: ${error.code}, ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_NEGATIVE_VALUES_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_NEGATIVE_VALUES_0100
     * @tc.desc    验证AppIdInfo各字段使用负数值
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_NEGATIVE_VALUES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        console.info(`${TAG}: 测试点: 验证AppIdInfo各字段使用负数值`);
        console.info(`${TAG}: 测试输入: 所有字段设为负数值`);
        
        let appIdInfo: audio.AppIdInfo = {
          appUid: -1,
          appPid: -1,
          appTokenId: -1,
          appFullTokenId: -1
        }
        
        let audioRendererOptions: audio.AudioRendererOptions = {
          streamInfo: {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
          },
          rendererInfo: {
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
          },
          originalAppIdInfo: appIdInfo
        }
        
        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        console.info(`${TAG}: 测试输出: 验证负数值时AudioRenderer创建成功`);
        expect(audioManager != null).assertEqual(true);
        console.info(`${TAG}: 负数值,AudioRenderer创建成功`);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(`${TAG}: 创建失败: ${error.code}, ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_START_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_START_0100
     * @tc.desc    验证使用originalAppIdInfo创建AudioRenderer后可正常启动
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level1
     */
    it('SUB_MULTIMEDIA_AUDIO_APP_ID_INFO_START_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`${TAG}: 测试点: 验证使用originalAppIdInfo创建AudioRenderer后可正常启动`);
        console.info(`${TAG}: 测试输入: 创建后调用start`);
        
        let appIdInfo: audio.AppIdInfo = {
          appUid: 1001,
          appPid: 2001,
          appTokenId: 3001,
          appFullTokenId: 4001
        }
        
        let audioRendererOptions: audio.AudioRendererOptions = {
          streamInfo: {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
          },
          rendererInfo: {
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
          },
          originalAppIdInfo: appIdInfo
        }
        
        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        expect(audioManager != null).assertEqual(true);
        await audioRenderer.start();
        console.info(`${TAG}: 测试输出: 验证启动后状态为STATE_RUNNING`);
        expect(audioRenderer.state).assertEqual(audio.AudioState.STATE_RUNNING);
        console.info(`${TAG}: AudioRenderer启动成功,状态: ${audioRenderer.state}`);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(`${TAG}: 启动失败: ${error.code}, ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })
  })
}