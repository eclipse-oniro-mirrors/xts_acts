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
import avcodec from 'libentry.so'

interface GeneratedObjectLiteralInterface_1 {
  DRM_ALG_CENC_UNENCRYPTED: number;
  DRM_ALG_CENC_AES_CTR: number;
  DRM_ALG_CENC_AES_WV: number;
  DRM_ALG_CENC_AES_CBC: number;
  DRM_ALG_CENC_SM4_CBC: number;
  DRM_ALG_CENC_SM4_CTR: number;
}

let DrmCencAlgo: GeneratedObjectLiteralInterface_1 = {
  DRM_ALG_CENC_UNENCRYPTED : 0,
  DRM_ALG_CENC_AES_CTR : 1,
  DRM_ALG_CENC_AES_WV : 2,
  DRM_ALG_CENC_AES_CBC : 3,
  DRM_ALG_CENC_SM4_CBC :4,
  DRM_ALG_CENC_SM4_CTR :5
}

interface GeneratedObjectLiteralInterface_2 {
  DRM_CENC_INFO_KEY_IV_SUBSAMPLES_SET: number;
  DRM_CENC_INFO_KEY_IV_SUBSAMPLES_NOT_SET: number;
}

let DrmCencInfoMode: GeneratedObjectLiteralInterface_2 = {
  DRM_CENC_INFO_KEY_IV_SUBSAMPLES_SET : 0,
  DRM_CENC_INFO_KEY_IV_SUBSAMPLES_NOT_SET : 1,
}

export default function abilityTest() {
  describe('AVCodecdrmTest', () => {
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
     * @tc.number     : SUB_MULTIMEIDA_AVCODEC_DRM_0100
     * @tc.name       : test CencInfo_Destroy
     * @tc.desc       : test OH_AVCencInfo_Destroy and create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEIDA_AVCODEC_DRM_0100', 0, async (done: Function) => {
      let result: number = avcodec.Test_CencInfo_Destroy("ptr");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEIDA_AVCODEC_DRM_0200
     * @tc.name       : test AVCencInfo_SetAlgorithm
     * @tc.desc       : test OH_AVCencInfo_SetAlgorithm
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEIDA_AVCODEC_DRM_0200', 0, async (done: Function) => {
      let result: number = avcodec.Test_AVCencInfo_SetAlgorithm("ptr", DrmCencAlgo.DRM_ALG_CENC_UNENCRYPTED);
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEIDA_AVCODEC_DRM_0300
     * @tc.name       : test AVCencInfo_SetAlgorithm
     * @tc.desc       : test OH_AVCencInfo_SetAlgorithm
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEIDA_AVCODEC_DRM_0300', 0, async (done: Function) => {
      let result: number = avcodec.Test_AVCencInfo_SetAlgorithm("ptr", DrmCencAlgo.DRM_ALG_CENC_AES_CTR);
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEIDA_AVCODEC_DRM_0400
     * @tc.name       : test AVCencInfo_SetAlgorithm
     * @tc.desc       : test OH_AVCencInfo_SetAlgorithm
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEIDA_AVCODEC_DRM_0400', 0, async (done: Function) => {
      let result: number = avcodec.Test_AVCencInfo_SetAlgorithm("ptr", DrmCencAlgo.DRM_ALG_CENC_AES_WV);
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEIDA_AVCODEC_DRM_0500
     * @tc.name       : test AVCencInfo_SetAlgorithm
     * @tc.desc       : test OH_AVCencInfo_SetAlgorithm
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEIDA_AVCODEC_DRM_0500', 0, async (done: Function) => {
      let result: number = avcodec.Test_AVCencInfo_SetAlgorithm("ptr", DrmCencAlgo.DRM_ALG_CENC_AES_CBC);
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEIDA_AVCODEC_DRM_0600
     * @tc.name       : test AVCencInfo_SetAlgorithm
     * @tc.desc       : test OH_AVCencInfo_SetAlgorithm
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEIDA_AVCODEC_DRM_0600', 0, async (done: Function) => {
      let result: number = avcodec.Test_AVCencInfo_SetAlgorithm("ptr", DrmCencAlgo.DRM_ALG_CENC_SM4_CBC);
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEIDA_AVCODEC_DRM_0700
     * @tc.name       : test AVCencInfo_SetAlgorithm
     * @tc.desc       : test OH_AVCencInfo_SetAlgorithm
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEIDA_AVCODEC_DRM_0700', 0, async (done: Function) => {
      let result: number = avcodec.Test_AVCencInfo_SetAlgorithm("ptr", DrmCencAlgo.DRM_ALG_CENC_SM4_CTR);
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEIDA_AVCODEC_DRM_0800
     * @tc.name       : test AVCencInfo_SetAlgorithm
     * @tc.desc       : test OH_AVCencInfo_SetAlgorithm
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEIDA_AVCODEC_DRM_0800', 0, async (done: Function) => {
      let result: number = avcodec.Test_AVCencInfo_SetAlgorithm("ptr", -1);
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEIDA_AVCODEC_DRM_0900
     * @tc.name       : test OH_AVCencInfo_SetKeyIdAndIv
     * @tc.desc       : handle: string;
     *                  keyid: string; keyidlen: number;
     *                  iv:string, ivlen: number
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEIDA_AVCODEC_DRM_0900', 0, async (done: Function) => {
      let result: number = avcodec.Test_AVCencInfo_SetKeyIdAndIv("ptr", "ptr", 16, "ptr", 16);
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEIDA_AVCODEC_DRM_1000
     * @tc.name       : test OH_AVCencInfo_SetKeyIdAndIv
     * @tc.desc       : handle: string;
     *                  keyid: string; keyidlen: number;
     *                  iv:string, ivlen: number
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEIDA_AVCODEC_DRM_1000', 0, async (done: Function) => {
      let result: number = avcodec.Test_AVCencInfo_SetKeyIdAndIv("ptr", "ptr", 8, "ptr", 16);
      expect(result).assertEqual(3);
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEIDA_AVCODEC_DRM_1100
     * @tc.name       : test OH_AVCencInfo_SetKeyIdAndIv
     * @tc.desc       : handle: string;
     *                  keyid: string; keyidlen: number;
     *                  iv:string, ivlen: number
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEIDA_AVCODEC_DRM_1100', 0, async (done: Function) => {
      let result: number = avcodec.Test_AVCencInfo_SetKeyIdAndIv("ptr", "ptr", 16, "ptr", 7);
      expect(result).assertEqual(3);
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEIDA_AVCODEC_DRM_1200
     * @tc.name       : test AVCencInfo_SetSubsampleInfo
     * @tc.desc       : handle: string;
     *                  enblocknum: number;
     *                  skipblocknum: number;
     *                  fstenoffset:number;
     *                  subsamplenum:number, subsample:string
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEIDA_AVCODEC_DRM_1200', 0, async (done: Function) => {
      let result: number = avcodec.Test_AVCencInfo_SetSubsampleInfo("ptr", 10, 2, 0, 4, "ptr");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEIDA_AVCODEC_DRM_1300
     * @tc.name       : test AVCencInfo_SetMode
     * @tc.desc       : handle: string;  mode: number
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEIDA_AVCODEC_DRM_1300', 0, async (done: Function) => {
      let result: number = avcodec.Test_AVCencInfo_SetMode("ptr", DrmCencInfoMode.DRM_CENC_INFO_KEY_IV_SUBSAMPLES_SET);
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEIDA_AVCODEC_DRM_1400
     * @tc.name       : test AVCencInfo_SetMode
     * @tc.desc       : handle: string;  mode: number
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEIDA_AVCODEC_DRM_1400', 0, async (done: Function) => {
      let result: number = avcodec.Test_AVCencInfo_SetMode("ptr", DrmCencInfoMode.DRM_CENC_INFO_KEY_IV_SUBSAMPLES_NOT_SET);
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEIDA_AVCODEC_DRM_1500
     * @tc.name       : test AVCencInfo_SetAVBuffer
     * @tc.desc       : handle: string;  buff: string
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEIDA_AVCODEC_DRM_1500', 0, async (done: Function) => {
      let result: number = avcodec.Test_AVCencInfo_SetAVBuffer("ptr", "ptr");
      expect(result).assertEqual(0);
      done();
    });

  })
}