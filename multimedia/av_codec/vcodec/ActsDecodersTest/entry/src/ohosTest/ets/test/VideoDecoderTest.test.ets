/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import testNapi from 'libdecoder_test.so';
import fs from '@ohos.file.fs';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const TAG = 'VideoDecoderTest';
const DOMAIN = 0x0001;
const TEST_SUCCESS = 0;

function getContext(): Context {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let context = abilityDelegator.getAppContext();
  return context;
}

export default function videoDecoderTest() {
  describe('VideoDecoderTest', () => {
    beforeAll(async () => {
      hilog.info(DOMAIN, TAG, 'Video Decoder test suite started');
      
      // 在所有测试开始前，从 rawfile 拷贝视频文件到应用目录
      let context = getContext();
      let dir = context.filesDir + "/";
      
      try {
        // 创建 video 目录
        let videoDir = dir + "video";
        if (!fs.accessSync(videoDir)) {
          fs.mkdirSync(videoDir);
          hilog.info(DOMAIN, TAG, 'Created video directory: %{public}s', videoDir);
        }
        
        // 拷贝视频文件 - test_vc1.avi
        let videoFile1 = videoDir + "/test_vc1.avi";
        await new Promise<void>((resolve, reject) => {
          context.resourceManager.getRawFileContent("test_vc1.avi", (error, model_buffer) => {
            if (error) {
              hilog.error(DOMAIN, TAG, '[rawfile_copy_to_sandbox] test_vc1.avi copy failed: %{public}d, message: %{public}s',
                error.code, error.message);
              reject(error);
            } else {
              let file = fs.openSync(videoFile1, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
              fs.writeSync(file.fd, model_buffer.buffer);
              fs.closeSync(file);
              hilog.info(DOMAIN, TAG, '[rawfile_copy_to_sandbox] test_vc1.avi copy success');
              resolve();
            }
          });
        });
        
        // 拷贝视频文件 - 1920_1080_30.avi
        let videoFile2 = videoDir + "/1920_1080_30.avi";
        await new Promise<void>((resolve, reject) => {
          context.resourceManager.getRawFileContent("1920_1080_30.avi", (error, model_buffer) => {
            if (error) {
              hilog.error(DOMAIN, TAG, '[rawfile_copy_to_sandbox] 1920_1080_30.avi copy failed: %{public}d, message: %{public}s',
                error.code, error.message);
              reject(error);
            } else {
              let file = fs.openSync(videoFile2, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
              fs.writeSync(file.fd, model_buffer.buffer);
              fs.closeSync(file);
              hilog.info(DOMAIN, TAG, '[rawfile_copy_to_sandbox] 1920_1080_30.avi copy success');
              resolve();
            }
          });
        });
        
        // 拷贝视频文件 - msvideo1_720x480.avi
        let videoFile3 = videoDir + "/msvideo1_720x480.avi";
        await new Promise<void>((resolve, reject) => {
          context.resourceManager.getRawFileContent("msvideo1_720x480.avi", (error, model_buffer) => {
            if (error) {
              hilog.error(DOMAIN, TAG, '[rawfile_copy_to_sandbox] msvideo1_720x480.avi copy failed: %{public}d, message: %{public}s',
                error.code, error.message);
              reject(error);
            } else {
              let file = fs.openSync(videoFile3, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
              fs.writeSync(file.fd, model_buffer.buffer);
              fs.closeSync(file);
              hilog.info(DOMAIN, TAG, '[rawfile_copy_to_sandbox] msvideo1_720x480.avi copy success');
              resolve();
            }
          });
        });
        
        hilog.info(DOMAIN, TAG, '[rawfile_copy_to_sandbox] sandbox path: %{public}s', dir);
        hilog.info(DOMAIN, TAG, '[rawfile_copy_to_sandbox] Files ready, tests can start now');
      } catch (error) {
        hilog.error(DOMAIN, TAG, '[rawfile_copy_to_sandbox] getRawFileContent api run failed: %{public}s', JSON.stringify(error));
      }
    });

    afterAll(() => {
      hilog.info(DOMAIN, TAG, 'Video Decoder test suite completed');
    });

    beforeEach(() => {
      hilog.info(DOMAIN, TAG, 'Test case started');
    });

    afterEach(() => {
      hilog.info(DOMAIN, TAG, 'Test case completed');
    });

    /**
     * @tc.number  VIDEO_VC1DEC_CAP_API_0001
     * @tc.name    VIDEO_VC1DEC_CAP_API_0001
     * @tc.desc    Test OH_AVCodec_GetCapability for VC1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level2
     */
    it('VIDEO_VC1DEC_CAP_API_0001', Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_VC1DEC_CAP_API_0001');
      let result = testNapi.videoDecoderTest(0);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_VC1DEC_CAP_API_0002
     * @tc.name    VIDEO_VC1DEC_CAP_API_0002
     * @tc.desc    Test OH_AVCodec_GetCapabilityByCategory
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_VC1DEC_CAP_API_0002', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_VC1DEC_CAP_API_0002');
      let result = testNapi.videoDecoderTest(1);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_VC1DEC_CAP_API_0003
     * @tc.name    VIDEO_VC1DEC_CAP_API_0003
     * @tc.desc    Test OH_AVCapability_GetVideoWidthRange
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_VC1DEC_CAP_API_0003', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_VC1DEC_CAP_API_0003');
      let result = testNapi.videoDecoderTest(2);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_VC1DEC_CAP_API_0004
     * @tc.name    VIDEO_VC1DEC_CAP_API_0004
     * @tc.desc    Test OH_AVCapability_GetVideoSupportedPixelFormats
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level2
     */
    it('VIDEO_VC1DEC_CAP_API_0004', Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_VC1DEC_CAP_API_0004');
      let result = testNapi.videoDecoderTest(3);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_VC1DEC_CAP_API_0005
     * @tc.name    VIDEO_VC1DEC_CAP_API_0005
     * @tc.desc    Test pixel format validation
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_VC1DEC_CAP_API_0005', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_VC1DEC_CAP_API_0005');
      let result = testNapi.videoDecoderTest(4);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_VC1DEC_CAP_API_0006
     * @tc.name    VIDEO_VC1DEC_CAP_API_0006
     * @tc.desc    Test OH_AVCapability_GetSupportedProfiles
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_VC1DEC_CAP_API_0006', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_VC1DEC_CAP_API_0006');
      let result = testNapi.videoDecoderTest(5);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_VC1DEC_CAP_API_0007
     * @tc.name    VIDEO_VC1DEC_CAP_API_0007
     * @tc.desc    Test OH_AVCapability_GetSupportedLevelsForProfile
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_VC1DEC_CAP_API_0007', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_VC1DEC_CAP_API_0007');
      let result = testNapi.videoDecoderTest(6);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_VC1DEC_CAP_API_0008
     * @tc.name    VIDEO_VC1DEC_CAP_API_0008
     * @tc.desc    Test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_VC1DEC_CAP_API_0008', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_VC1DEC_CAP_API_0008');
      let result = testNapi.videoDecoderTest(7);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_MSVIDEO1DEC_CAP_API_0009
     * @tc.name    VIDEO_MSVIDEO1DEC_CAP_API_0009
     * @tc.desc    Test MSVIDEO1 profiles
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_MSVIDEO1DEC_CAP_API_0009', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_MSVIDEO1DEC_CAP_API_0009');
      let result = testNapi.videoDecoderTest(8);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_MSVIDEO1DEC_CAP_API_0010
     * @tc.name    VIDEO_MSVIDEO1DEC_CAP_API_0010
     * @tc.desc    Test WMV3 profiles
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_MSVIDEO1DEC_CAP_API_0010', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_MSVIDEO1DEC_CAP_API_0010');
      let result = testNapi.videoDecoderTest(9);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_MSVIDEO1DEC_CAP_API_0011
     * @tc.name    VIDEO_MSVIDEO1DEC_CAP_API_0011
     * @tc.desc    Test WMV3 levels for profiles
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_MSVIDEO1DEC_CAP_API_0011', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_MSVIDEO1DEC_CAP_API_0011');
      let result = testNapi.videoDecoderTest(10);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_MSVIDEO1DEC_CAP_API_0012
     * @tc.name    VIDEO_MSVIDEO1DEC_CAP_API_0012
     * @tc.desc    Test WMV3 profile and level support
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level1
     */
    it('VIDEO_MSVIDEO1DEC_CAP_API_0012', Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_MSVIDEO1DEC_CAP_API_0012');
      let result = testNapi.videoDecoderTest(11);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_VC1DEC_FUNCTION_0001
     * @tc.name    VIDEO_VC1DEC_FUNCTION_0001
     * @tc.desc    Test VC1 decoder with buffer mode
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('VIDEO_VC1DEC_FUNCTION_0001', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_VC1DEC_FUNCTION_0001');
      let result = testNapi.videoDecoderTest(12);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_VC1DEC_FUNCTION_0002
     * @tc.name    VIDEO_VC1DEC_FUNCTION_0002
     * @tc.desc    Test VC1 decoder with buffer mode (second test)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('VIDEO_VC1DEC_FUNCTION_0002', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_VC1DEC_FUNCTION_0002');
      let result = testNapi.videoDecoderTest(12);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_MJPEGDEC_FUNCTION_0003
     * @tc.name    VIDEO_MJPEGDEC_FUNCTION_0003
     * @tc.desc    Test MJPEG decoder with buffer mode
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('VIDEO_MJPEGDEC_FUNCTION_0003', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_MJPEGDEC_FUNCTION_0003');
      let result = testNapi.videoDecoderTest(13);
      expect(result).assertEqual(TEST_SUCCESS);
    });

    /**
     * @tc.number  VIDEO_MSVIDEO1DEC_FUNCTION_0005
     * @tc.name    VIDEO_MSVIDEO1DEC_FUNCTION_0005
     * @tc.desc    Test MSVIDEO1 decoder with buffer mode
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNC
     * @tc.level   Level0
     */
    it('VIDEO_MSVIDEO1DEC_FUNCTION_0005', Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, 'Test VIDEO_MSVIDEO1DEC_FUNCTION_0005');
      let result = testNapi.videoDecoderTest(14);
      expect(result).assertEqual(TEST_SUCCESS);
    });
  });
}
