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

import { describe, it, expect, Level } from "@ohos/hypium"
import audiovividencoder from 'libaudiovividencoder.so'

export default function audiovividEncoderTest() {
  describe('audiovividEncoderTest', () => {

    /**
     * @tc.name   testMonoModeSampleRateCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_0100
     * @tc.desc   test MonoModeSampleRateCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMonoModeSampleRateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.MonoModeSampleRateCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMonoModeSampleFormatCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_0200
     * @tc.desc   test MonoModeSampleFormatCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMonoModeSampleFormatCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.MonoModeSampleFormatCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMonoModeBitrateCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_0300
     * @tc.desc   test MonoModeBitrateCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMonoModeBitrateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.MonoModeBitrateCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testStereoModeSampleRateCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_0400
     * @tc.desc   test StereoModeSampleRateCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStereoModeSampleRateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.StereoModeSampleRateCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testStereoModeSampleFormatCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_0500
     * @tc.desc   test StereoModeSampleFormatCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStereoModeSampleFormatCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.StereoModeSampleFormatCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testStereoModeBitrateCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_0600
     * @tc.desc   test StereoModeBitrateCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStereoModeBitrateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.StereoModeBitrateCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMCModeSampleRateCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_0700
     * @tc.desc   test MCModeSampleRateCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMCModeSampleRateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.MCModeSampleRateCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMCModeSampleFormatCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_0800
     * @tc.desc   test MCModeSampleFormatCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMCModeSampleFormatCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.MCModeSampleFormatCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMCModeChannelLayoutCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_0900
     * @tc.desc   test MCModeChannelLayoutCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMCModeChannelLayoutCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.MCModeChannelLayoutCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMCModeBitrateCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_1000
     * @tc.desc   test MCModeBitrateCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMCModeBitrateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.MCModeBitrateCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMixModeSampleRateCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_1100
     * @tc.desc   test MixModeSampleRateCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMixModeSampleRateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.MixModeSampleRateCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMixModeSampleFormatCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_1200
     * @tc.desc   test MixModeSampleFormatCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMixModeSampleFormatCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.MixModeSampleFormatCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMixModeChannelLayoutCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_1300
     * @tc.desc   test MixModeChannelLayoutCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMixModeChannelLayoutCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.MixModeChannelLayoutCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMixModeBitrateCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_1400
     * @tc.desc   test MixModeBitrateCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMixModeBitrateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.MixModeBitrateCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMixModeObjNumCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_1500
     * @tc.desc   test MixModeObjNumCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMixModeObjNumCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.MixModeObjNumCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMixModeObjBitrateCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_1600
     * @tc.desc   test MixModeObjNumCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMixModeObjBitrateCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.MixModeObjBitrateCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testCreateMonoMode
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_1700
     * @tc.desc   test CreateMonoMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreateMonoMode', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.CreateMonoMode()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testCreateStereoMode
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_1800
     * @tc.desc   test CreateStereoMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreateStereoMode', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.CreateStereoMode()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testCreateMCMode
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_1900
     * @tc.desc   test CreateMCMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreateMCMode', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.CreateMCMode()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testCreateMixMode
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_2000
     * @tc.desc   test CreateMixMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreateMixMode', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.CreateMixMode()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testCreateObjNumCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_2100
     * @tc.desc   test CreateObjNumCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreateObjNumCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.CreateObjNumCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testUpdateObjectPosIndexCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_2200
     * @tc.desc   test UpdateObjectPosIndexCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUpdateObjectPosIndexCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.UpdateObjectPosIndexCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testUpdateObjectPosXCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_2300
     * @tc.desc   test UpdateObjectPosXCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUpdateObjectPosXCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.UpdateObjectPosXCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testUpdateObjectPosYCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_2400
     * @tc.desc   test UpdateObjectPosYCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUpdateObjectPosYCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.UpdateObjectPosYCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testUpdateObjectPosZCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_2500
     * @tc.desc   test UpdateObjectPosZCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUpdateObjectPosZCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.UpdateObjectPosZCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testUpdateObjectPosAzimuthCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_2600
     * @tc.desc   test UpdateObjectPosAzimuthCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUpdateObjectPosAzimuthCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.UpdateObjectPosAzimuthCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testUpdateObjectPosElevationCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_2700
     * @tc.desc   test UpdateObjectPosElevationCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUpdateObjectPosElevationCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.UpdateObjectPosElevationCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testUpdateObjectPosDistanceCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_2800
     * @tc.desc   test UpdateObjectPosDistanceCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUpdateObjectPosDistanceCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.UpdateObjectPosDistanceCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testUpdateObjectGainIndexCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_2900
     * @tc.desc   test UpdateObjectGainIndexCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUpdateObjectGainIndexCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.UpdateObjectGainIndexCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testUpdateObjectGainGainCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_3000
     * @tc.desc   test UpdateObjectGainGainCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUpdateObjectGainGainCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.UpdateObjectGainGainCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testCreateBuilderNullCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_3100
     * @tc.desc   test CreateBuilderNullCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreateBuilderNullCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.CreateBuilderNullCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testCreateFormatNullCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_3200
     * @tc.desc   test CreateFormatNullCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreateFormatNullCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.CreateFormatNullCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testUpdateObjectPosBuilderNullCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_3300
     * @tc.desc   test UpdateObjectPosBuilderNullCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUpdateObjectPosBuilderNullCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.UpdateObjectPosBuilderNullCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testUpdateObjectGainBuilderNullCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_3400
     * @tc.desc   test UpdateObjectGainBuilderNullCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUpdateObjectGainBuilderNullCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.UpdateObjectGainBuilderNullCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testGetMetaLenBuilderNullCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_3500
     * @tc.desc   test GetMetaLenBuilderNullCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetMetaLenBuilderNullCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.GetMetaLenBuilderNullCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testGetMetaLenLenNullCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_3600
     * @tc.desc   test GetMetaLenLenNullCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetMetaLenLenNullCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.GetMetaLenLenNullCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testGetMetaBuilderNullCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_3700
     * @tc.desc   test GetMetaBuilderNullCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetMetaBuilderNullCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.GetMetaBuilderNullCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testGetMetaBufferNullCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_3800
     * @tc.desc   test GetMetaBufferNullCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetMetaBufferNullCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.GetMetaBufferNullCheck()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testDestroyBuilderNullCheck
     * @tc.number SUB_MULTIMEDIA_AVCODEC_AUDIOVIVID_ENCODER_INTERFACE_TEST_3900
     * @tc.desc   test DestroyBuilderNullCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDestroyBuilderNullCheck', Level.LEVEL2, async (done: Function) => {
      expect(audiovividencoder.DestroyBuilderNullCheck()).assertEqual(0);
      done();
    });
  })
}
