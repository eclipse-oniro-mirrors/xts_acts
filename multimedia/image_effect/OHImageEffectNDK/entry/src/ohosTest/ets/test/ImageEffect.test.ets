/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import testNapi from 'libimageEffect.so'
import { ImageUtils } from './ImageUtils';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

// 操作成功;
const EFFECT_SUCCESS = 0;
// 无效参数;
const EFFECT_ERROR_PARAM_INVALID = 401;
// 未知错误;
const EFFECT_ERROR_29000199 = 29000199;
// key 密钥错误;
const EFFECT_ERROR_29000122 = 29000122;
// 参数错误;
const EFFECT_ERROR_29000121 = 29000121;


const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;
const CASE_INDEX_3 = 3;
const CASE_INDEX_4 = 4;
const CASE_INDEX_5 = 5;
const CASE_INDEX_6 = 6;
const CASE_INDEX_7 = 7;
const CASE_INDEX_8 = 8;
const CASE_INDEX_9 = 9;
const CASE_INDEX_10 = 10;
const CASE_INDEX_11 = 11;

export default function imageEffectTest() {

  describe('ImageEffectTest', () => {
    beforeAll(async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filePath = context.filesDir + "/test.jpg";
      await ImageUtils.getInstance().savePixelMap(filePath, $r('app.media.original'));
      testNapi.savePixelMapForPath(filePath);
      let outFilePath = context.filesDir + "/outtest.jpg";
      await ImageUtils.getInstance().savePixelMap(outFilePath, $r('app.media.d23116'));
      testNapi.creatOutPixeMapForPath(outFilePath);
      done();
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.name   testOHEffectBufferInfoCreate001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOCREATE_0100
     * @tc.desc   Create an OH-EffectBufferInfo instance and call OH-EffectBufferInfo-Release to release resources.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoCreate001', Level.LEVEL0, () => {
      console.info(`testOHEffectBufferInfoCreate001 test start `);

      let result: number = testNapi.OHEffectBufferInfoCreate();
      expect(result).assertEqual(EFFECT_SUCCESS);

      console.info(`testOHEffectBufferInfoCreate001 test end `);
    });

    /**
     * @tc.name   testOHEffectBufferInfoSetAddr001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETADDR_0100
     * @tc.desc   Set the image memory address.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoSetAddr001', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetAddr(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoSetAddr002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETADDR_0200
     * @tc.desc   Set the image memory address.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoSetAddr002', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetAddr(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectBufferInfoSetAddr003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETADDR_0300
     * @tc.desc   Set the image memory address.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoSetAddr003', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetAddr(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectBufferInfoSetAddr004
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETADDR_0400
     * @tc.desc   Set the image memory address.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoSetAddr004', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetAddr(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectBufferInfoGetAddr001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETADDR_0100
     * @tc.desc   Obtain the image memory address.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoGetAddr001', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetAddr(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoGetAddr002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETADDR_0200
     * @tc.desc   Obtain the image memory address.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoGetAddr002', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetAddr(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoGetAddr003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETADDR_0300
     * @tc.desc   Obtain the image memory address.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoGetAddr003', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetAddr(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectBufferInfoSetEffectFormat001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETEFFECTFORMAT_0100
     * @tc.desc   Set the pixel format of the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoSetEffectFormat001', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetEffectFormat(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoSetEffectFormat002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETEFFECTFORMAT_0200
     * @tc.desc   Set the pixel format of the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoSetEffectFormat002', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetEffectFormat(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoSetEffectFormat003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETEFFECTFORMAT_0300
     * @tc.desc   Set the pixel format of the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoSetEffectFormat003', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetEffectFormat(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoSetEffectFormat004
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETEFFECTFORMAT_0400
     * @tc.desc   Set the pixel format of the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoSetEffectFormat004', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetEffectFormat(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoSetEffectFormat005
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETEFFECTFORMAT_0500
     * @tc.desc   Set the pixel format of the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoSetEffectFormat005', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetEffectFormat(CASE_INDEX_5);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoSetEffectFormat006
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETEFFECTFORMAT_0600
     * @tc.desc   Set the pixel format of the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoSetEffectFormat006', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetEffectFormat(CASE_INDEX_6);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoSetEffectFormat007
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETEFFECTFORMAT_0700
     * @tc.desc   Set the pixel format of the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoSetEffectFormat007', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetEffectFormat(CASE_INDEX_7);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoSetEffectFormat008
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETEFFECTFORMAT_0800
     * @tc.desc   Set the pixel format of the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoSetEffectFormat008', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetEffectFormat(CASE_INDEX_8);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectBufferInfoGetEffectFormat001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETEFFECTFORMAT_0100
     * @tc.desc   Obtain the pixel format of the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoGetEffectFormat001', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetEffectFormat(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoGetEffectFormat002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETEFFECTFORMAT_0200
     * @tc.desc   Obtain the pixel format of the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoGetEffectFormat002', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetEffectFormat(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoGetEffectFormat003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETEFFECTFORMAT_0300
     * @tc.desc   Obtain the pixel format of the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoGetEffectFormat003', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetEffectFormat(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoGetEffectFormat004
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETEFFECTFORMAT_0400
     * @tc.desc   Obtain the pixel format of the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoGetEffectFormat004', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetEffectFormat(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectBufferInfoGetEffectFormat005
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETEFFECTFORMAT_0500
     * @tc.desc   Obtain the pixel format of the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoGetEffectFormat005', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetEffectFormat(CASE_INDEX_5);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectBufferInfoSetHeight001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETHEIGHT_0100
     * @tc.desc   Set the image height.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoSetHeight001', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetHeight(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoSetHeight002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETHEIGHT_0200
     * @tc.desc   Set the image height.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoSetHeight002', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetHeight(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoSetHeight003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETHEIGHT_0300
     * @tc.desc   Set the image height.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoSetHeight003', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetHeight(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoSetHeight004
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETHEIGHT_0400
     * @tc.desc   Set the image height.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoSetHeight004', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetHeight(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectBufferInfoGetHeight001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETHEIGHT_0100
     * @tc.desc   Obtain image height.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoGetHeight001', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetHeight(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoGetHeight002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETHEIGHT_0200
     * @tc.desc   Obtain image height.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoGetHeight002', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetHeight(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoGetHeight003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETHEIGHT_0300
     * @tc.desc   Obtain image height.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoGetHeight003', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetHeight(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoGetHeight004
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETHEIGHT_0400
     * @tc.desc   Obtain image height.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoGetHeight004', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetHeight(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectBufferInfoSetRowSize001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETROWSIZE_0100
     * @tc.desc   Set the number of bytes per line of the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoSetRowSize001', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetRowSize(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoSetRowSize002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETROWSIZE_0200
     * @tc.desc   Set the number of bytes per line of the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoSetRowSize002', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetRowSize(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoSetRowSize003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETROWSIZE_0300
     * @tc.desc   Set the number of bytes per line of the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoSetRowSize003', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetRowSize(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoSetRowSize004
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETROWSIZE_0400
     * @tc.desc   Set the number of bytes per line of the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoSetRowSize004', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetRowSize(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectBufferInfoGetRowSize001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETROWSIZE_0100
     * @tc.desc   Obtain the number of bytes per row of the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoGetRowSize001', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetRowSize(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoGetRowSize002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETROWSIZE_0200
     * @tc.desc   Obtain the number of bytes per row of the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoGetRowSize002', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetRowSize(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoGetRowSize003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETROWSIZE_0300
     * @tc.desc   Obtain the number of bytes per row of the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoGetRowSize003', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetRowSize(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoGetRowSize004
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETROWSIZE_0400
     * @tc.desc   Obtain the number of bytes per row of the image.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoGetRowSize004', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetRowSize(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectBufferInfoSetWidth001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETWIDTH_0100
     * @tc.desc   Set the image width.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoSetWidth001', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetWidth(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoSetWidth002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETWIDTH_0200
     * @tc.desc   Set the image width.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoSetWidth002', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetWidth(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoSetWidth003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETWIDTH_0300
     * @tc.desc   Set the image width.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoSetWidth003', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetWidth(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoSetWidth004
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETWIDTH_0400
     * @tc.desc   Set the image width.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoSetWidth004', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetWidth(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectBufferInfoGetWidth001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETWIDTH_0100
     * @tc.desc   Obtain image width.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoGetWidth001', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetWidth(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoGetWidth002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETWIDTH_0200
     * @tc.desc   Obtain image width.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoGetWidth002', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetWidth(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoGetWidth003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETWIDTH_0300
     * @tc.desc   Obtain image width.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoGetWidth003', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetWidth(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoGetWidth004
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETWIDTH_0400
     * @tc.desc   Obtain image width.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoGetWidth004', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetWidth(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectBufferInfoSetTimestamp001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETTIMESTAMP_0100
     * @tc.desc   Set the image timestamp.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoSetTimestamp001', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetTimestamp(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoSetTimestamp002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETTIMESTAMP_0200
     * @tc.desc   Set the image timestamp.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoSetTimestamp002', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetTimestamp(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoSetTimestamp003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETTIMESTAMP_0300
     * @tc.desc   Set the image timestamp.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoSetTimestamp003', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetTimestamp(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectBufferInfoGetTimestamp001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETTIMESTAMP_0100
     * @tc.desc   Obtain image timestamp.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoGetTimestamp001', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetTimestamp(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoGetTimestamp002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETTIMESTAMP_0200
     * @tc.desc   Obtain image timestamp.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoGetTimestamp002', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetTimestamp(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoGetTimestamp003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETTIMESTAMP_0300
     * @tc.desc   Obtain image timestamp.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoGetTimestamp003', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetTimestamp(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectBufferInfoSetTextureId001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETTEXTUREID_0100
     * @tc.desc   Set the image textureId.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoSetTextureId001', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetTextureId();
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoGetTextureId001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETTEXTUREID_0100
     * @tc.desc   Obtain image textureId.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoGetTextureId001', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetTextureId();
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoRelease001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFORELEASE_0100
     * @tc.desc   Destroy the OH-EffectBufferInfo instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoRelease001', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoRelease(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectBufferInfoRelease002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFORELEASE_0200
     * @tc.desc   Destroy the OH-EffectBufferInfo instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectBufferInfoRelease002', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectBufferInfoRelease(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectFilterInfoCreate001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOCREATE_0100
     * @tc.desc   Create an OH-EffectFilterInfo instance and call OH-EffectFilterInfo-Release to release resources.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterInfoCreate001', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterInfoCreate();
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectFilterInfoSetFilterName001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOSETFILTERNAME_0100
     * @tc.desc   Set the filter name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterInfoSetFilterName001', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterInfoSetFilterName(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectFilterInfoSetFilterName002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOSETFILTERNAME_0200
     * @tc.desc   Set the filter name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterInfoSetFilterName002', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterInfoSetFilterName(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectFilterInfoSetFilterName003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOSETFILTERNAME_0300
     * @tc.desc   Set the filter name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterInfoSetFilterName003', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterInfoSetFilterName(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectFilterInfoGetFilterName001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOGETFILTERNAME_0100
     * @tc.desc   Get the filter name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterInfoGetFilterName001', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterInfoGetFilterName(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectFilterInfoGetFilterName002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOGETFILTERNAME_0200
     * @tc.desc   Get the filter name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterInfoGetFilterName002', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterInfoGetFilterName(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectFilterInfoGetFilterName003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOGETFILTERNAME_0300
     * @tc.desc   Get the filter name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterInfoGetFilterName003', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterInfoGetFilterName(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectFilterInfoSetSupportedBufferTypes001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOSETSUPPORTEDBUFFERTYPES_0100
     * @tc.desc   Set the memory types supported by the filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterInfoSetSupportedBufferTypes001', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterInfoSetSupportedBufferTypes(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectFilterInfoSetSupportedBufferTypes002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOSETSUPPORTEDBUFFERTYPES_0200
     * @tc.desc   Set the memory types supported by the filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterInfoSetSupportedBufferTypes002', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterInfoSetSupportedBufferTypes(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectFilterInfoSetSupportedBufferTypes003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOSETSUPPORTEDBUFFERTYPES_0300
     * @tc.desc   Set the memory types supported by the filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterInfoSetSupportedBufferTypes003', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterInfoSetSupportedBufferTypes(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectFilterInfoGetSupportedBufferTypes001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOGETSUPPORTEDBUFFERTYPES_0100
     * @tc.desc   Obtain the memory types supported by the filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterInfoGetSupportedBufferTypes001', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterInfoGetSupportedBufferTypes(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectFilterInfoGetSupportedBufferTypes002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOGETSUPPORTEDBUFFERTYPES_0200
     * @tc.desc   Obtain the memory types supported by the filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterInfoGetSupportedBufferTypes002', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterInfoGetSupportedBufferTypes(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectFilterInfoGetSupportedBufferTypes003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOGETSUPPORTEDBUFFERTYPES_0300
     * @tc.desc   Obtain the memory types supported by the filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterInfoGetSupportedBufferTypes003', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterInfoGetSupportedBufferTypes(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectFilterInfoSetSupportedFormats001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOSETSUPPORTEDFORMATS_0100
     * @tc.desc   Set the pixel format supported by the filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterInfoSetSupportedFormats001', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterInfoSetSupportedFormats(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectFilterInfoSetSupportedFormats002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOSETSUPPORTEDFORMATS_0200
     * @tc.desc   Set the pixel format supported by the filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterInfoSetSupportedFormats002', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterInfoSetSupportedFormats(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectFilterInfoSetSupportedFormats003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOSETSUPPORTEDFORMATS_0300
     * @tc.desc   Set the pixel format supported by the filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterInfoSetSupportedFormats003', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterInfoSetSupportedFormats(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectFilterInfoGetSupportedFormats001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOGETSUPPORTEDFORMATS_0100
     * @tc.desc   Obtain the pixel formats supported by the filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterInfoGetSupportedFormats001', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterInfoGetSupportedFormats(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectFilterInfoGetSupportedFormats002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOGETSUPPORTEDFORMATS_0200
     * @tc.desc   Obtain the pixel formats supported by the filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterInfoGetSupportedFormats002', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterInfoGetSupportedFormats(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectFilterInfoGetSupportedFormats003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOGETSUPPORTEDFORMATS_0300
     * @tc.desc   Obtain the pixel formats supported by the filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterInfoGetSupportedFormats003', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterInfoGetSupportedFormats(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectFilterInfoGetSupportedFormats004
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOGETSUPPORTEDFORMATS_0400
     * @tc.desc   Obtain the pixel formats supported by the filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterInfoGetSupportedFormats004', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterInfoGetSupportedFormats(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectFilterInfoGetSupportedFormats005
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOGETSUPPORTEDFORMATS_0500
     * @tc.desc   Obtain the pixel formats supported by the filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterInfoGetSupportedFormats005', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterInfoGetSupportedFormats(CASE_INDEX_5);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectFilterInfoGetSupportedFormats006
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOGETSUPPORTEDFORMATS_0600
     * @tc.desc   Obtain the pixel formats supported by the filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterInfoGetSupportedFormats006', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterInfoGetSupportedFormats(CASE_INDEX_6);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectFilterInfoRelease001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFORELEASE_0100
     * @tc.desc   Destroy the OH-EffectFilterInfo instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterInfoRelease001', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterInfoRelease(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectFilterInfoRelease002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFORELEASE_0200
     * @tc.desc   Destroy the OH-EffectFilterInfo instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterInfoRelease002', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterInfoRelease(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectFilterCreate001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERCREATE_0100
     * @tc.desc   Create an OH-EffectFilter instance and call OH-EffectFilter-Release to release resources.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterCreate001', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterCreate(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectFilterCreate002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERCREATE_0200
     * @tc.desc   Create an OH-EffectFilter instance and call OH-EffectFilter-Release to release resources.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterCreate002', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterCreate(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectFilterSetValue001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERSETVALUE_0100
     * @tc.desc   Set filter parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterSetValue001', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterSetValue(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectFilterSetValue002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERSETVALUE_0200
     * @tc.desc   Set filter parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterSetValue002', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterSetValue(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_29000122);
    });

    /**
     * @tc.name   testOHEffectFilterSetValue003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERSETVALUE_0300
     * @tc.desc   Set filter parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterSetValue003', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterSetValue(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectFilterSetValue004
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERSETVALUE_0400
     * @tc.desc   Set filter parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterSetValue004', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterSetValue(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectFilterSetValue005
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERSETVALUE_0500
     * @tc.desc   Set filter parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterSetValue005', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterSetValue(CASE_INDEX_5);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectFilterGetValue001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERGETVALUE_0100
     * @tc.desc   Obtain filter parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterGetValue001', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterGetValue(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectFilterGetValue002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERGETVALUE_0200
     * @tc.desc   Obtain filter parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterGetValue002', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterGetValue(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_29000122);
    });

    /**
     * @tc.name   testOHEffectFilterGetValue003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERGETVALUE_0300
     * @tc.desc   Obtain filter parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterGetValue003', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterGetValue(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectFilterGetValue004
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERGETVALUE_0400
     * @tc.desc   Obtain filter parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterGetValue004', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterGetValue(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectFilterGetValue005
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERGETVALUE_0500
     * @tc.desc   Obtain filter parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterGetValue005', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterGetValue(CASE_INDEX_5);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectFilterLookupFilterInfo001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERLOOKUPFILTERINFO_0100
     * @tc.desc   Query filter information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterLookupFilterInfo001', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterLookupFilterInfo(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectFilterLookupFilterInfo002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERLOOKUPFILTERINFO_0200
     * @tc.desc   Query filter information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterLookupFilterInfo002', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterLookupFilterInfo(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectFilterLookupFilterInfo003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERLOOKUPFILTERINFO_0300
     * @tc.desc   Query filter information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterLookupFilterInfo003', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterLookupFilterInfo(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectFilterLookupFilters001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERLOOKUPFILTERS_0100
     * @tc.desc   Search for filters that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterLookupFilters001', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterLookupFilters(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectFilterLookupFilters002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERLOOKUPFILTERS_0200
     * @tc.desc   Search for filters that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterLookupFilters002', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterLookupFilters(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectFilterLookupFilters003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERLOOKUPFILTERS_0300
     * @tc.desc   Search for filters that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterLookupFilters003', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterLookupFilters(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectFilterLookupFilters004
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERLOOKUPFILTERS_0400
     * @tc.desc   Search for filters that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterLookupFilters004', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterLookupFilters(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectFilterLookupFilters005
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERLOOKUPFILTERS_0500
     * @tc.desc   Search for filters that meet the criteria.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterLookupFilters005', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterLookupFilters(CASE_INDEX_5);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectFilterRegister001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERREGISTER_0100
     * @tc.desc   Register custom filters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterRegister001', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterRegister(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectFilterRegister002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERREGISTER_0200
     * @tc.desc   Register custom filters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterRegister002', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterRegister(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectFilterRegister003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERREGISTER_0300
     * @tc.desc   Register custom filters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterRegister003', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterRegister(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectFilterRelease001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERRELEASE_0100
     * @tc.desc   Destroy the OH-EffectFilter instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterRelease001', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterRelease(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectFilterRelease002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERRELEASE_0200
     * @tc.desc   Destroy the OH-EffectFilter instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterRelease002', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterRelease(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectFilterReleaseFilterNames001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERRELEASEFILTERNAMES_0100
     * @tc.desc   Release filter name memory resources.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterReleaseFilterNames001', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterReleaseFilterNames(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectFilterReleaseFilterNames002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERRELEASEFILTERNAMES_0200
     * @tc.desc   Release filter name memory resources.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterReleaseFilterNames002', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterReleaseFilterNames(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectFilterRender001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERRENDER_0100
     * @tc.desc   Perform image rendering.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterRender001', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterRender(CASE_INDEX_1);
      console.log(`test render1${result}`);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHEffectFilterRender002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERRENDER_0200
     * @tc.desc   Perform image rendering.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterRender002', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterRender(CASE_INDEX_2);
      console.log(`test render2${result}`);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectFilterRender003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERRENDER_0300
     * @tc.desc   Perform image rendering.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterRender003', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterRender(CASE_INDEX_3);
      console.log(`test render3${result}`);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHEffectFilterRenderWithTextureId001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERRENDERWITHTEXTUREID_0100
     * @tc.desc   Perform image rendering with texture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHEffectFilterRenderWithTextureId001', Level.LEVEL0, () => {
      let result: number = testNapi.OHEffectFilterRenderWithTextureId();
      console.log(`test render with texture1 ${result}`);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectCreate001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTCREATE_0100
     * @tc.desc   Create an OH-Image Effect instance and call OH-Image Effect Release to release resources.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectCreate001', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectCreate(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectCreate002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTCREATE_0200
     * @tc.desc   Create an OH-Image Effect instance and call OH-Image Effect Release to release resources.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectCreate002', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectCreate(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectConfigure001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTCONFIGURE_0100
     * @tc.desc   Set configuration information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectConfigure001', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectConfigure(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectConfigure002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTCONFIGURE_0200
     * @tc.desc   Set configuration information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectConfigure002', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectConfigure(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_29000121);
    });

    /**
     * @tc.name   testOHImageEffectConfigure003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTCONFIGURE_0300
     * @tc.desc   Set configuration information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectConfigure003', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectConfigure(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectConfigure004
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTCONFIGURE_0400
     * @tc.desc   Set configuration information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectConfigure004', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectConfigure(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectConfigure005
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTCONFIGURE_0500
     * @tc.desc   Set configuration information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectConfigure005', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectConfigure(CASE_INDEX_5);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectAddFilter001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTADDFILTER_0100
     * @tc.desc   Add filters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectAddFilter001', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectAddFilter(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectAddFilter002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTADDFILTER_0200
     * @tc.desc   Add filters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectAddFilter002', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectAddFilter(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectAddFilter003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTADDFILTER_0300
     * @tc.desc   Add filters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectAddFilter003', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectAddFilter(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectAddFilterByFilter001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTADDFILTERBYFILTER_0100
     * @tc.desc   Add filters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectAddFilterByFilter001', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectAddFilterByFilter(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectAddFilterByFilter002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTADDFILTERBYFILTER_0200
     * @tc.desc   Add filters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectAddFilterByFilter002', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectAddFilterByFilter(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectAddFilterByFilter003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTADDFILTERBYFILTER_0300
     * @tc.desc   Add filters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectAddFilterByFilter003', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectAddFilterByFilter(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectGetFilter001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTGETFILTER_0100
     * @tc.desc   Filter has been added to the query.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectGetFilter001', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectGetFilter(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectGetFilter002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTGETFILTER_0200
     * @tc.desc   Filter has been added to the query.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectGetFilter002', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectGetFilter(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectGetFilterCount001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTGETFILTERCOUNT_0100
     * @tc.desc   Query the number of filters added.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectGetFilterCount001', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectGetFilterCount(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectGetFilterCount002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTGETFILTERCOUNT_0200
     * @tc.desc   Query the number of filters added.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectGetFilterCount002', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectGetFilterCount(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectGetFilterCount003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTGETFILTERCOUNT_0300
     * @tc.desc   Query the number of filters added.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectGetFilterCount003', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectGetFilterCount(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectGetFilterCount004
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTGETFILTERCOUNT_0400
     * @tc.desc   Query the number of filters added.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectGetFilterCount004', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectGetFilterCount(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectGetInputSurface001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTGETINPUTSURFACE_0100
     * @tc.desc   Get input Surface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectGetInputSurface001', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectGetInputSurface(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectGetInputSurface002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTGETINPUTSURFACE_0200
     * @tc.desc   Get input Surface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectGetInputSurface002', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectGetInputSurface(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectInsertFilter001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTINSERTFILTER_0100
     * @tc.desc   Insert the filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectInsertFilter001', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectInsertFilter(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectInsertFilter002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTINSERTFILTER_0200
     * @tc.desc   Insert the filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectInsertFilter002', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectInsertFilter(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectInsertFilter003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTINSERTFILTER_0300
     * @tc.desc   Insert the filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectInsertFilter003', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectInsertFilter(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectInsertFilter004
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTINSERTFILTER_0400
     * @tc.desc   Insert the filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectInsertFilter004', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectInsertFilter(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectInsertFilterByFilter001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTINSERTFILTERBYFILTER_0100
     * @tc.desc   Insert the filter by filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectInsertFilterByFilter001', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectInsertFilterByFilter(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectInsertFilterByFilter002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTINSERTFILTERRBYFILTER_0200
     * @tc.desc   Insert the filter by filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectInsertFilterByFilter002', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectInsertFilterByFilter(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectInsertFilterByFilter003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTINSERTFILTERRBYFILTER_0300
     * @tc.desc   Insert the filter by filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectInsertFilterByFilter003', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectInsertFilterByFilter(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectInsertFilterByFilter004
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTINSERTFILTERRBYINDEX_0400
     * @tc.desc   Insert the filter by filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectInsertFilterByFilter004', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectInsertFilterByFilter(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectReplaceFilter001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTREPLACEFILTER_0100
     * @tc.desc   Replace the filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectReplaceFilter001', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectReplaceFilter(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectReplaceFilter002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTREPLACEFILTER_0200
     * @tc.desc   Replace the filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectReplaceFilter002', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectReplaceFilter(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectReplaceFilter003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTREPLACEFILTER_0300
     * @tc.desc   Replace the filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectReplaceFilter003', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectReplaceFilter(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectReplaceFilter004
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTREPLACEFILTER_0400
     * @tc.desc   Replace the filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectReplaceFilter004', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectReplaceFilter(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectReplaceFilterByFilter001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTREPLACEFILTERBYFILTER_0100
     * @tc.desc   Replace the filter by filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectReplaceFilterByFilter001', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectReplaceFilterByFilter(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectReplaceFilterByFilter002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTREPLACEFILTERRBYFILTER_0200
     * @tc.desc   Replace the filter by filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectReplaceFilterByFilter002', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectReplaceFilterByFilter(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectReplaceFilterByFilter003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTREPLACEFILTERRBYFILTER_0300
     * @tc.desc   Replace the filter by filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectReplaceFilterByFilter003', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectReplaceFilterByFilter(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectReplaceFilterByFilter004
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTREPLACEFILTERRBYINDEX_0400
     * @tc.desc   Replace the filter by filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectReplaceFilterByFilter004', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectReplaceFilterByFilter(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectRelease_001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTRELEASE_0100
     * @tc.desc   Release OH-ImageEffect instance resources.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectRelease_001', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectRelease(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectRelease002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTRELEASE_0200
     * @tc.desc   Release OH-ImageEffect instance resources.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectRelease002', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectRelease(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectRemoveFilter001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTREMOVEFILTER_0100
     * @tc.desc   Remove the filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectRemoveFilter001', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectRemoveFilter(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectRemoveFilter002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTREMOVEFILTER_0200
     * @tc.desc   Remove the filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectRemoveFilter002', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectRemoveFilter(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectRemoveFilter003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTREMOVEFILTER_0300
     * @tc.desc   Remove the filter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectRemoveFilter003', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectRemoveFilter(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectRemoveFilterByIndex001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTREMOVEFILTERBYINDEX_0100
     * @tc.desc   Remove the filter by index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectRemoveFilterByIndex001', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectRemoveFilterByIndex(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectRemoveFilterByIndex002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTREMOVEFILTERBYINDEX_0200
     * @tc.desc   Remove the filter by index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectRemoveFilterByIndex002', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectRemoveFilterByIndex(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectRemoveFilterByIndex003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTREMOVEFILTERBYINDEX_0300
     * @tc.desc   Remove the filter by index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectRemoveFilterByIndex003', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectRemoveFilterByIndex(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectSave001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSAVE_0100
     * @tc.desc   Serialization Effector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSave001', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSave(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectSave002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSAVE_0200
     * @tc.desc   Serialization Effector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSave002', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSave(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectSave003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSAVE_0300
     * @tc.desc   Serialization Effector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSave003', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSave(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectRestore001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTRESTORE_0100
     * @tc.desc   Deserialize Effector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectRestore001', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectRestore(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectRestore002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTRESTORE_0200
     * @tc.desc   Deserialize Effector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectRestore002', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectRestore(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectRestore003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTRESTORE_0300
     * @tc.desc   Deserialize Effector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectRestore003', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectRestore(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectSetInputNativeBuffer001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETINPUTNATIVEBUFFER_0100
     * @tc.desc   Set the NativeBuffer for input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetInputNativeBuffer001', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetInputNativeBuffer();
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectSetInputPixelmap001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETINPUTPIXELMAP_0100
     * @tc.desc   Set the Pixelmap for input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetInputPixelmap001', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetInputPixelmap(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectSetInputPixelmap002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETINPUTPIXELMAP_0200
     * @tc.desc   Set the Pixelmap for input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetInputPixelmap002', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetInputPixelmap(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectSetInputPixelmap003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETINPUTPIXELMAP_0300
     * @tc.desc   Set the Pixelmap for input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetInputPixelmap003', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetInputPixelmap(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectSetInputUri001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETINPUTURI_0100
     * @tc.desc   Set the input URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetInputUri001', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetInputUri(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectSetInputUri002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETINPUTURI_0200
     * @tc.desc   Set the input URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetInputUri002', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetInputUri(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectSetInputUri003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETINPUTURI_0300
     * @tc.desc   Set the input URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetInputUri003', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetInputUri(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectSetInputUri004
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETINPUTURI_0400
     * @tc.desc   Set the input URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetInputUri004', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetInputUri(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectSetInputUri005
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETINPUTURI_0500
     * @tc.desc   Set the input URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetInputUri005', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetInputUri(CASE_INDEX_5);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectSetInputUri006
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETINPUTURI_0600
     * @tc.desc   Set the input URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetInputUri006', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetInputUri(CASE_INDEX_6);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectSetInputUri007
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETINPUTURI_0700
     * @tc.desc   Set the input URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetInputUri007', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetInputUri(CASE_INDEX_7);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectSetInputUri008
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETINPUTURI_0800
     * @tc.desc   Set the input URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetInputUri008', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetInputUri(CASE_INDEX_8);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectSetInputUri009
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETINPUTURI_0900
     * @tc.desc   Set the input URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetInputUri009', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetInputUri(CASE_INDEX_9);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectSetInputUri010
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETINPUTURI_1000
     * @tc.desc   Set the input URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetInputUri010', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetInputUri(CASE_INDEX_10);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectSetInputUri011
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETINPUTURI_1100
     * @tc.desc   Set the input URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetInputUri011', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetInputUri(CASE_INDEX_11);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectSetOutputNativeBuffer001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTNATIVEBUFFER_0100
     * @tc.desc   Set the NativeBuffer for the output.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetOutputNativeBuffer001', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetOutputNativeBuffer();
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectSetOutputPixelmap001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTPIXELMAP_0100
     * @tc.desc   Set the Pixelmap for output.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetOutputPixelmap001', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetOutputPixelmap(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectSetOutputPixelmap002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTPIXELMAP_0200
     * @tc.desc   Set the Pixelmap for output.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetOutputPixelmap002', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetOutputPixelmap(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectSetOutputPixelmap003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTPIXELMAP_0300
     * @tc.desc   Set the Pixelmap for output.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetOutputPixelmap003', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetOutputPixelmap(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectSetOutputSurface001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTSURFACE_0100
     * @tc.desc   This is setting the output surface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetOutputSurface001', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetOutputSurface(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectSetOutputSurface002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTSURFACE_0200
     * @tc.desc   This is setting the output surface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetOutputSurface002', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetOutputSurface(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectSetOutputUri001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTURI_0100
     * @tc.desc   Set the output URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetOutputUri001', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetOutputUri(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectSetOutputUri002
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTURI_0200
     * @tc.desc   Set the output URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetOutputUri002', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetOutputUri(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectSetOutputUri003
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTURI_0300
     * @tc.desc   Set the output URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetOutputUri003', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetOutputUri(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectSetOutputUri004
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTURI_0400
     * @tc.desc   Set the output URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetOutputUri004', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetOutputUri(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectSetOutputUri005
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTURI_0500
     * @tc.desc   Set the output URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetOutputUri005', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetOutputUri(CASE_INDEX_5);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectSetOutputUri006
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTURI_0600
     * @tc.desc   Set the output URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetOutputUri006', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetOutputUri(CASE_INDEX_6);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectSetOutputUri007
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTURI_0700
     * @tc.desc   Set the output URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetOutputUri007', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetOutputUri(CASE_INDEX_7);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectSetOutputUri008
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTURI_0800
     * @tc.desc   Set the output URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetOutputUri008', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetOutputUri(CASE_INDEX_8);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectSetOutputUri009
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTURI_0900
     * @tc.desc   Set the output URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetOutputUri009', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetOutputUri(CASE_INDEX_9);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectSetOutputUri010
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTURI_1000
     * @tc.desc   Set the output URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetOutputUri010', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetOutputUri(CASE_INDEX_10);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectSetOutputUri011
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTURI_1100
     * @tc.desc   Set the output URI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetOutputUri011', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetOutputUri(CASE_INDEX_11);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.name   testOHImageEffectStart001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHImageEffectStart_0100
     * @tc.desc   Start the Effector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectStart001', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectStart();
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectStop001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSTOP_0100
     * @tc.desc   Start the Effector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectStop001', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectStop();
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectSetInputPicture001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHImageEffectSetInputPicture_0100
     * @tc.desc   Start the Effector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetInputPicture001', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetInputPicture();
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
    
    /**
     * @tc.name   testOHImageEffectSetOutputPicture001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHImageEffectSetOutputPicture_0100
     * @tc.desc   Start the Effector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetOutputPicture001', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetOutputPicture();
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectSetInputTextureId001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHImageEffectSetInputTextureId_0100
     * @tc.desc   Start the Effector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetInputTextureId001', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetInputTexture();
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.name   testOHImageEffectSetOutputTextureId001
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHImageEffectSetOutputTextureId_0100
     * @tc.desc   Start the Effector.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHImageEffectSetOutputTextureId001', Level.LEVEL0, () => {
      let result: number = testNapi.OHImageEffectSetOutputTexture();
      expect(result).assertEqual(EFFECT_SUCCESS);
    });
  });
}