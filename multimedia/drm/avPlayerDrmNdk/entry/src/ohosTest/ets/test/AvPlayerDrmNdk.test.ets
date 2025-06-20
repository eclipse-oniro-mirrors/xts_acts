/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import avplayer from 'libentry.so'

import fs from '@ohos.file.fs';
import environment from '@ohos.file.environment';

export default function AVPlayerNdkTest() {
    describe('AVPlayerDrmTest', () => {
      // Defines a test suite. Two parameters are supported: test suite name and test suite function.
      beforeAll(() => {
        // Presets an action, which is performed only once before all test cases of the test suite start.
        // This API supports only one parameter: preset action function.
      })
      beforeEach(() => {
        // Presets an action, which is performed before each unit test case starts.
        // The number of execution times is the same as the number of test cases defined by **it**.
        // This API supports only one parameter: preset action function.
      })
      afterEach(() => {
        // Presets a clear action, which is performed after each unit test case ends.
        // The number of execution times is the same as the number of test cases defined by **it**.
        // This API supports only one parameter: clear action function.
      })
      afterAll(() => {
        // Presets a clear action, which is performed after all test cases of the test suite end.
        // This API supports only one parameter: clear action function.
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_DRM_0100
     * @tc.name       : Test_AVPlayer_SetMediaKeySystemInfoCallback
     * @tc.desc       : test OH_AVPlayer_SetMediaKeySystemInfoCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEIDA_AVPLAYER_DRM_0100', 0, async (done: Function) => {
      let filePath= "/data/storage/el2/base/haps/entry/files/ChinaDRMLab_Promo_210525-264-30-1080P-10000K.sm4c.ts";
      let res = fs.accessSync(filePath);
      if(res){
        console.info("XX ret file exists");
      } else {
        console.info("XX ret file not exists");
      }
      let result: number = avplayer.Test_AVPlayer_SetMediaKeySystemInfoCallback("ptr", "ptr");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_DRM_0200
     * @tc.name       : Test_AVPlayer_GetMediaKeySystemInfoCallback
     * @tc.desc       : test OH_AVPlayer_GetMediaKeySystemInfoCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEIDA_AVPLAYER_DRM_0200', 0, async (done: Function) => {
      let filePath= "/data/storage/el2/base/haps/entry/files/ChinaDRMLab_Promo_210525-264-30-1080P-10000K.sm4c.ts";
      let res = fs.accessSync(filePath);
      if(res){
        console.info("XX ret file exists");
      } else {
        console.info("XX ret file not exists");
      }
      let result: number = avplayer.Test_AVPlayer_GetMediaKeySystemInfo("ptr", "ptr");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_DRM_0300
     * @tc.name       : Test_AVPlayer_SetDecryptionConfig
     * @tc.desc       : test OH_AVPlayer_SetDecryptionConfig
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEIDA_AVPLAYER_DRM_0300', 0, async (done: Function) => {
      let filePath= "/data/storage/el2/base/haps/entry/files/ChinaDRMLab_Promo_210525-264-30-1080P-10000K.sm4c.ts";
      let res = fs.accessSync(filePath);
      if(res){
        console.info("XX ret file exists");
      } else {
        console.info("XX ret file not exists");
      }
      let result: number = avplayer.Test_AVPlayer_SetDecryptionConfig();
      expect(result).assertEqual(0);
      done();
    });
      /**
       * @tc.number     : SUB_MULTIMEIDA_AUDIOCODEC_DRM_0100
       * @tc.name       : test OH_AudioCodec_SetDecryptionConfig
       * @tc.desc       : test Test_AudioCodec_SetDecryptionConfig
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 0
       */
      it('SUB_MULTIMEIDA_AUDIOCODEC_DRM_0100', 0, async (done: Function) => {
        let result: number = avplayer.Test_AudioCodec_SetDecryptionConfig("ptr", "ptr", 0);
        expect(result).assertEqual(0);
        done();
      });
      /**
       * @tc.number     : SUB_MULTIMEIDA_VIDEOCODEC_DRM_0100
       * @tc.name       : test Test_VideoDecoder_SetDecryptionConfig
       * @tc.desc       : handle: string;  buff: string
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 0
       */
      it('SUB_MULTIMEIDA_VIDEOCODEC_DRM_0100', 0, async (done: Function) => {
        let result: number = avplayer.Test_VideoDecoder_SetDecryptionConfig("ptr", "ptr", 0);
        expect(result).assertEqual(0);
        done();
      });
      /**
       * @tc.number     : SUB_MULTIMEIDA_AVDEMUXER_0100
       * @tc.name       : test AVDemuxer_SetMediaKeySystemInfoCallback
       * @tc.desc       : test OH_AVDemuxer_SetMediaKeySystemInfoCallback
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 0
       */
      it('SUB_MULTIMEIDA_AVDEMUXER_0100', 0, async (done: Function) => {
        let result: number = avplayer.TestAVDemuxer_SetMediaKeySystemInfoCallback("ptr", "ptr");
        expect(result).assertEqual(0);
        done();
      });
      /**
       * @tc.number     : SUB_MULTIMEIDA_AVDEMUXER_0200
       * @tc.name       : test AVDemuxer_SetDemuxerMediaKeySystemInfoCallback
       * @tc.desc       : test OH_AVDemuxer_SetDemuxerMediaKeySystemInfoCallback
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 0
       */
      it('SUB_MULTIMEIDA_AVDEMUXER_0200', 0, async (done: Function) => {
        let result: number = avplayer.TestAVDemuxer_SetDemuxerMediaKeySystemInfoCallback("ptr", "ptr");
        expect(result).assertEqual(0);
        done();
      });
      /**
       * @tc.number     : SUB_MULTIMEIDA_AVDEMUXER_0300
       * @tc.name       : test OH_AVDemuxer_GetMediaKeySystemInfo
       * @tc.desc       : test TestAVDemuxer_GetMediaKeySystemInfo
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 0
       */
      it('SUB_MULTIMEIDA_AVDEMUXER_0300', 0, async (done: Function) => {
        let result: number = avplayer.TestAVDemuxer_GetMediaKeySystemInfo("ptr", "ptr");
        expect(result).assertEqual(0);
        done();
      });
  })
}