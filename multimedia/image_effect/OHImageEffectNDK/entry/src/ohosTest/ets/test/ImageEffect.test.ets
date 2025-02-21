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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
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
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOCREATE_0100
     * @tc.name   : testOHEffectBufferInfoCreate001
     * @tc.desc   : Create an OH-EffectBufferInfo instance and call OH-EffectBufferInfo-Release to release resources.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoCreate001', 0, () => {
      console.info(`testOHEffectBufferInfoCreate001 test start `);

      let result: number = testNapi.OHEffectBufferInfoCreate();
      expect(result).assertEqual(EFFECT_SUCCESS);

      console.info(`testOHEffectBufferInfoCreate001 test end `);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETADDR_0100
     * @tc.name   : testOHEffectBufferInfoSetAddr001
     * @tc.desc   : Set the image memory address.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoSetAddr001', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetAddr(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETADDR_0200
     * @tc.name   : testOHEffectBufferInfoSetAddr002
     * @tc.desc   : Set the image memory address.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoSetAddr002', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetAddr(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETADDR_0300
     * @tc.name   : testOHEffectBufferInfoSetAddr003
     * @tc.desc   : Set the image memory address.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoSetAddr003', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetAddr(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETADDR_0400
     * @tc.name   : testOHEffectBufferInfoSetAddr004
     * @tc.desc   : Set the image memory address.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoSetAddr004', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetAddr(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETADDR_0100
     * @tc.name   : testOHEffectBufferInfoGetAddr001
     * @tc.desc   : Obtain the image memory address.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoGetAddr001', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetAddr(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETADDR_0200
     * @tc.name   : testOHEffectBufferInfoGetAddr002
     * @tc.desc   : Obtain the image memory address.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoGetAddr002', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetAddr(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETADDR_0300
     * @tc.name   : testOHEffectBufferInfoGetAddr003
     * @tc.desc   : Obtain the image memory address.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoGetAddr003', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetAddr(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETEFFECTFORMAT_0100
     * @tc.name   : testOHEffectBufferInfoSetEffectFormat001
     * @tc.desc   : Set the pixel format of the image.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoSetEffectFormat001', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetEffectFormat(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETEFFECTFORMAT_0200
     * @tc.name   : testOHEffectBufferInfoSetEffectFormat002
     * @tc.desc   : Set the pixel format of the image.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoSetEffectFormat002', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetEffectFormat(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETEFFECTFORMAT_0300
     * @tc.name   : testOHEffectBufferInfoSetEffectFormat003
     * @tc.desc   : Set the pixel format of the image.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoSetEffectFormat003', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetEffectFormat(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETEFFECTFORMAT_0400
     * @tc.name   : testOHEffectBufferInfoSetEffectFormat004
     * @tc.desc   : Set the pixel format of the image.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoSetEffectFormat004', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetEffectFormat(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETEFFECTFORMAT_0500
     * @tc.name   : testOHEffectBufferInfoSetEffectFormat005
     * @tc.desc   : Set the pixel format of the image.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoSetEffectFormat005', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetEffectFormat(CASE_INDEX_5);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETEFFECTFORMAT_0600
     * @tc.name   : testOHEffectBufferInfoSetEffectFormat006
     * @tc.desc   : Set the pixel format of the image.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoSetEffectFormat006', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetEffectFormat(CASE_INDEX_6);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETEFFECTFORMAT_0700
     * @tc.name   : testOHEffectBufferInfoSetEffectFormat007
     * @tc.desc   : Set the pixel format of the image.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoSetEffectFormat007', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetEffectFormat(CASE_INDEX_7);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETEFFECTFORMAT_0800
     * @tc.name   : testOHEffectBufferInfoSetEffectFormat008
     * @tc.desc   : Set the pixel format of the image.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoSetEffectFormat008', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetEffectFormat(CASE_INDEX_8);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETEFFECTFORMAT_0100
     * @tc.name   : testOHEffectBufferInfoGetEffectFormat001
     * @tc.desc   : Obtain the pixel format of the image.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoGetEffectFormat001', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetEffectFormat(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETEFFECTFORMAT_0200
     * @tc.name   : testOHEffectBufferInfoGetEffectFormat002
     * @tc.desc   : Obtain the pixel format of the image.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoGetEffectFormat002', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetEffectFormat(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETEFFECTFORMAT_0300
     * @tc.name   : testOHEffectBufferInfoGetEffectFormat003
     * @tc.desc   : Obtain the pixel format of the image.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoGetEffectFormat003', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetEffectFormat(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETEFFECTFORMAT_0400
     * @tc.name   : testOHEffectBufferInfoGetEffectFormat004
     * @tc.desc   : Obtain the pixel format of the image.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoGetEffectFormat004', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetEffectFormat(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETEFFECTFORMAT_0500
     * @tc.name   : testOHEffectBufferInfoGetEffectFormat005
     * @tc.desc   : Obtain the pixel format of the image.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoGetEffectFormat005', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetEffectFormat(CASE_INDEX_5);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETHEIGHT_0100
     * @tc.name   : testOHEffectBufferInfoSetHeight001
     * @tc.desc   : Set the image height.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoSetHeight001', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetHeight(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETHEIGHT_0200
     * @tc.name   : testOHEffectBufferInfoSetHeight002
     * @tc.desc   : Set the image height.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoSetHeight002', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetHeight(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETHEIGHT_0300
     * @tc.name   : testOHEffectBufferInfoSetHeight003
     * @tc.desc   : Set the image height.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoSetHeight003', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetHeight(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETHEIGHT_0400
     * @tc.name   : testOHEffectBufferInfoSetHeight004
     * @tc.desc   : Set the image height.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoSetHeight004', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetHeight(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETHEIGHT_0100
     * @tc.name   : testOHEffectBufferInfoGetHeight001
     * @tc.desc   : Obtain image height.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoGetHeight001', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetHeight(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETHEIGHT_0200
     * @tc.name   : testOHEffectBufferInfoGetHeight002
     * @tc.desc   : Obtain image height.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoGetHeight002', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetHeight(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETHEIGHT_0300
     * @tc.name   : testOHEffectBufferInfoGetHeight003
     * @tc.desc   : Obtain image height.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoGetHeight003', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetHeight(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETHEIGHT_0400
     * @tc.name   : testOHEffectBufferInfoGetHeight004
     * @tc.desc   : Obtain image height.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoGetHeight004', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetHeight(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETROWSIZE_0100
     * @tc.name   : testOHEffectBufferInfoSetRowSize001
     * @tc.desc   : Set the number of bytes per line of the image.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoSetRowSize001', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetRowSize(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETROWSIZE_0200
     * @tc.name   : testOHEffectBufferInfoSetRowSize002
     * @tc.desc   : Set the number of bytes per line of the image.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoSetRowSize002', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetRowSize(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETROWSIZE_0300
     * @tc.name   : testOHEffectBufferInfoSetRowSize003
     * @tc.desc   : Set the number of bytes per line of the image.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoSetRowSize003', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetRowSize(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETROWSIZE_0400
     * @tc.name   : testOHEffectBufferInfoSetRowSize004
     * @tc.desc   : Set the number of bytes per line of the image.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoSetRowSize004', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetRowSize(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETROWSIZE_0100
     * @tc.name   : testOHEffectBufferInfoGetRowSize001
     * @tc.desc   : Obtain the number of bytes per row of the image.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoGetRowSize001', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetRowSize(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETROWSIZE_0200
     * @tc.name   : testOHEffectBufferInfoGetRowSize002
     * @tc.desc   : Obtain the number of bytes per row of the image.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoGetRowSize002', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetRowSize(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETROWSIZE_0300
     * @tc.name   : testOHEffectBufferInfoGetRowSize003
     * @tc.desc   : Obtain the number of bytes per row of the image.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoGetRowSize003', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetRowSize(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETROWSIZE_0400
     * @tc.name   : testOHEffectBufferInfoGetRowSize004
     * @tc.desc   : Obtain the number of bytes per row of the image.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoGetRowSize004', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetRowSize(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETWIDTH_0100
     * @tc.name   : testOHEffectBufferInfoSetWidth001
     * @tc.desc   : Set the image width.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoSetWidth001', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetWidth(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETWIDTH_0200
     * @tc.name   : testOHEffectBufferInfoSetWidth002
     * @tc.desc   : Set the image width.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoSetWidth002', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetWidth(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETWIDTH_0300
     * @tc.name   : testOHEffectBufferInfoSetWidth003
     * @tc.desc   : Set the image width.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoSetWidth003', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetWidth(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETWIDTH_0400
     * @tc.name   : testOHEffectBufferInfoSetWidth004
     * @tc.desc   : Set the image width.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoSetWidth004', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetWidth(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETWIDTH_0100
     * @tc.name   : testOHEffectBufferInfoGetWidth001
     * @tc.desc   : Obtain image width.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoGetWidth001', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetWidth(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETWIDTH_0200
     * @tc.name   : testOHEffectBufferInfoGetWidth002
     * @tc.desc   : Obtain image width.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoGetWidth002', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetWidth(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETWIDTH_0300
     * @tc.name   : testOHEffectBufferInfoGetWidth003
     * @tc.desc   : Obtain image width.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoGetWidth003', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetWidth(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETWIDTH_0400
     * @tc.name   : testOHEffectBufferInfoGetWidth004
     * @tc.desc   : Obtain image width.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoGetWidth004', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetWidth(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETTIMESTAMP_0100
     * @tc.name   : testOHEffectBufferInfoSetTimestamp001
     * @tc.desc   : Set the image timestamp.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoSetTimestamp001', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetTimestamp(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETTIMESTAMP_0200
     * @tc.name   : testOHEffectBufferInfoSetTimestamp002
     * @tc.desc   : Set the image timestamp.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoSetTimestamp002', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetTimestamp(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOSETTIMESTAMP_0300
     * @tc.name   : testOHEffectBufferInfoSetTimestamp003
     * @tc.desc   : Set the image timestamp.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoSetTimestamp003', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoSetTimestamp(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETTIMESTAMP_0100
     * @tc.name   : testOHEffectBufferInfoGetTimestamp001
     * @tc.desc   : Obtain image timestamp.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoGetTimestamp001', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetTimestamp(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETTIMESTAMP_0200
     * @tc.name   : testOHEffectBufferInfoGetTimestamp002
     * @tc.desc   : Obtain image timestamp.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoGetTimestamp002', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetTimestamp(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFOGETTIMESTAMP_0300
     * @tc.name   : testOHEffectBufferInfoGetTimestamp003
     * @tc.desc   : Obtain image timestamp.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoGetTimestamp003', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoGetTimestamp(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFORELEASE_0100
     * @tc.name   : testOHEffectBufferInfoRelease001
     * @tc.desc   : Destroy the OH-EffectBufferInfo instance.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoRelease001', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoRelease(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTBUFFERINFORELEASE_0200
     * @tc.name   : testOHEffectBufferInfoRelease002
     * @tc.desc   : Destroy the OH-EffectBufferInfo instance.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectBufferInfoRelease002', 0, () => {
      let result: number = testNapi.OHEffectBufferInfoRelease(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOCREATE_0100
     * @tc.name   : testOHEffectFilterInfoCreate001
     * @tc.desc   : Create an OH-EffectFilterInfo instance and call OH-EffectFilterInfo-Release to release resources.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterInfoCreate001', 0, () => {
      let result: number = testNapi.OHEffectFilterInfoCreate();
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOSETFILTERNAME_0100
     * @tc.name   : testOHEffectFilterInfoSetFilterName001
     * @tc.desc   : Set the filter name.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterInfoSetFilterName001', 0, () => {
      let result: number = testNapi.OHEffectFilterInfoSetFilterName(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOSETFILTERNAME_0200
     * @tc.name   : testOHEffectFilterInfoSetFilterName002
     * @tc.desc   : Set the filter name.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterInfoSetFilterName002', 0, () => {
      let result: number = testNapi.OHEffectFilterInfoSetFilterName(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOSETFILTERNAME_0300
     * @tc.name   : testOHEffectFilterInfoSetFilterName003
     * @tc.desc   : Set the filter name.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterInfoSetFilterName003', 0, () => {
      let result: number = testNapi.OHEffectFilterInfoSetFilterName(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOGETFILTERNAME_0100
     * @tc.name   : testOHEffectFilterInfoGetFilterName001
     * @tc.desc   : Get the filter name.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterInfoGetFilterName001', 0, () => {
      let result: number = testNapi.OHEffectFilterInfoGetFilterName(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOGETFILTERNAME_0200
     * @tc.name   : testOHEffectFilterInfoGetFilterName002
     * @tc.desc   : Get the filter name.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterInfoGetFilterName002', 0, () => {
      let result: number = testNapi.OHEffectFilterInfoGetFilterName(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOGETFILTERNAME_0300
     * @tc.name   : testOHEffectFilterInfoGetFilterName003
     * @tc.desc   : Get the filter name.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterInfoGetFilterName003', 0, () => {
      let result: number = testNapi.OHEffectFilterInfoGetFilterName(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOSETSUPPORTEDBUFFERTYPES_0100
     * @tc.name   : testOHEffectFilterInfoSetSupportedBufferTypes001
     * @tc.desc   : Set the memory types supported by the filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterInfoSetSupportedBufferTypes001', 0, () => {
      let result: number = testNapi.OHEffectFilterInfoSetSupportedBufferTypes(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOSETSUPPORTEDBUFFERTYPES_0200
     * @tc.name   : testOHEffectFilterInfoSetSupportedBufferTypes002
     * @tc.desc   : Set the memory types supported by the filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterInfoSetSupportedBufferTypes002', 0, () => {
      let result: number = testNapi.OHEffectFilterInfoSetSupportedBufferTypes(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOSETSUPPORTEDBUFFERTYPES_0300
     * @tc.name   : testOHEffectFilterInfoSetSupportedBufferTypes003
     * @tc.desc   : Set the memory types supported by the filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterInfoSetSupportedBufferTypes003', 0, () => {
      let result: number = testNapi.OHEffectFilterInfoSetSupportedBufferTypes(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOGETSUPPORTEDBUFFERTYPES_0100
     * @tc.name   : testOHEffectFilterInfoGetSupportedBufferTypes001
     * @tc.desc   : Obtain the memory types supported by the filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterInfoGetSupportedBufferTypes001', 0, () => {
      let result: number = testNapi.OHEffectFilterInfoGetSupportedBufferTypes(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOGETSUPPORTEDBUFFERTYPES_0200
     * @tc.name   : testOHEffectFilterInfoGetSupportedBufferTypes002
     * @tc.desc   : Obtain the memory types supported by the filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterInfoGetSupportedBufferTypes002', 0, () => {
      let result: number = testNapi.OHEffectFilterInfoGetSupportedBufferTypes(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOGETSUPPORTEDBUFFERTYPES_0300
     * @tc.name   : testOHEffectFilterInfoGetSupportedBufferTypes003
     * @tc.desc   : Obtain the memory types supported by the filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterInfoGetSupportedBufferTypes003', 0, () => {
      let result: number = testNapi.OHEffectFilterInfoGetSupportedBufferTypes(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOSETSUPPORTEDFORMATS_0100
     * @tc.name   : testOHEffectFilterInfoSetSupportedFormats001
     * @tc.desc   : Set the pixel format supported by the filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterInfoSetSupportedFormats001', 0, () => {
      let result: number = testNapi.OHEffectFilterInfoSetSupportedFormats(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOSETSUPPORTEDFORMATS_0200
     * @tc.name   : testOHEffectFilterInfoSetSupportedFormats002
     * @tc.desc   : Set the pixel format supported by the filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterInfoSetSupportedFormats002', 0, () => {
      let result: number = testNapi.OHEffectFilterInfoSetSupportedFormats(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOSETSUPPORTEDFORMATS_0300
     * @tc.name   : testOHEffectFilterInfoSetSupportedFormats003
     * @tc.desc   : Set the pixel format supported by the filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterInfoSetSupportedFormats003', 0, () => {
      let result: number = testNapi.OHEffectFilterInfoSetSupportedFormats(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOGETSUPPORTEDFORMATS_0100
     * @tc.name   : testOHEffectFilterInfoGetSupportedFormats001
     * @tc.desc   : Obtain the pixel formats supported by the filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterInfoGetSupportedFormats001', 0, () => {
      let result: number = testNapi.OHEffectFilterInfoGetSupportedFormats(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOGETSUPPORTEDFORMATS_0200
     * @tc.name   : testOHEffectFilterInfoGetSupportedFormats002
     * @tc.desc   : Obtain the pixel formats supported by the filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterInfoGetSupportedFormats002', 0, () => {
      let result: number = testNapi.OHEffectFilterInfoGetSupportedFormats(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOGETSUPPORTEDFORMATS_0300
     * @tc.name   : testOHEffectFilterInfoGetSupportedFormats003
     * @tc.desc   : Obtain the pixel formats supported by the filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterInfoGetSupportedFormats003', 0, () => {
      let result: number = testNapi.OHEffectFilterInfoGetSupportedFormats(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOGETSUPPORTEDFORMATS_0400
     * @tc.name   : testOHEffectFilterInfoGetSupportedFormats004
     * @tc.desc   : Obtain the pixel formats supported by the filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterInfoGetSupportedFormats004', 0, () => {
      let result: number = testNapi.OHEffectFilterInfoGetSupportedFormats(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOGETSUPPORTEDFORMATS_0500
     * @tc.name   : testOHEffectFilterInfoGetSupportedFormats005
     * @tc.desc   : Obtain the pixel formats supported by the filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterInfoGetSupportedFormats005', 0, () => {
      let result: number = testNapi.OHEffectFilterInfoGetSupportedFormats(CASE_INDEX_5);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFOGETSUPPORTEDFORMATS_0600
     * @tc.name   : testOHEffectFilterInfoGetSupportedFormats006
     * @tc.desc   : Obtain the pixel formats supported by the filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterInfoGetSupportedFormats006', 0, () => {
      let result: number = testNapi.OHEffectFilterInfoGetSupportedFormats(CASE_INDEX_6);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFORELEASE_0100
     * @tc.name   : testOHEffectFilterInfoRelease001
     * @tc.desc   : Destroy the OH-EffectFilterInfo instance.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterInfoRelease001', 0, () => {
      let result: number = testNapi.OHEffectFilterInfoRelease(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERINFORELEASE_0200
     * @tc.name   : testOHEffectFilterInfoRelease002
     * @tc.desc   : Destroy the OH-EffectFilterInfo instance.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterInfoRelease002', 0, () => {
      let result: number = testNapi.OHEffectFilterInfoRelease(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERCREATE_0100
     * @tc.name   : testOHEffectFilterCreate001
     * @tc.desc   : Create an OH-EffectFilter instance and call OH-EffectFilter-Release to release resources.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterCreate001', 0, () => {
      let result: number = testNapi.OHEffectFilterCreate(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERCREATE_0200
     * @tc.name   : testOHEffectFilterCreate002
     * @tc.desc   : Create an OH-EffectFilter instance and call OH-EffectFilter-Release to release resources.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterCreate002', 0, () => {
      let result: number = testNapi.OHEffectFilterCreate(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERSETVALUE_0100
     * @tc.name   : testOHEffectFilterSetValue001
     * @tc.desc   : Set filter parameters.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterSetValue001', 0, () => {
      let result: number = testNapi.OHEffectFilterSetValue(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERSETVALUE_0200
     * @tc.name   : testOHEffectFilterSetValue002
     * @tc.desc   : Set filter parameters.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterSetValue002', 0, () => {
      let result: number = testNapi.OHEffectFilterSetValue(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_29000122);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERSETVALUE_0300
     * @tc.name   : testOHEffectFilterSetValue003
     * @tc.desc   : Set filter parameters.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterSetValue003', 0, () => {
      let result: number = testNapi.OHEffectFilterSetValue(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERSETVALUE_0400
     * @tc.name   : testOHEffectFilterSetValue004
     * @tc.desc   : Set filter parameters.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterSetValue004', 0, () => {
      let result: number = testNapi.OHEffectFilterSetValue(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERSETVALUE_0500
     * @tc.name   : testOHEffectFilterSetValue005
     * @tc.desc   : Set filter parameters.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterSetValue005', 0, () => {
      let result: number = testNapi.OHEffectFilterSetValue(CASE_INDEX_5);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERGETVALUE_0100
     * @tc.name   : testOHEffectFilterGetValue001
     * @tc.desc   : Obtain filter parameters.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterGetValue001', 0, () => {
      let result: number = testNapi.OHEffectFilterGetValue(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERGETVALUE_0200
     * @tc.name   : testOHEffectFilterGetValue002
     * @tc.desc   : Obtain filter parameters.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterGetValue002', 0, () => {
      let result: number = testNapi.OHEffectFilterGetValue(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_29000122);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERGETVALUE_0300
     * @tc.name   : testOHEffectFilterGetValue003
     * @tc.desc   : Obtain filter parameters.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterGetValue003', 0, () => {
      let result: number = testNapi.OHEffectFilterGetValue(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERGETVALUE_0400
     * @tc.name   : testOHEffectFilterGetValue004
     * @tc.desc   : Obtain filter parameters.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterGetValue004', 0, () => {
      let result: number = testNapi.OHEffectFilterGetValue(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERGETVALUE_0500
     * @tc.name   : testOHEffectFilterGetValue005
     * @tc.desc   : Obtain filter parameters.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterGetValue005', 0, () => {
      let result: number = testNapi.OHEffectFilterGetValue(CASE_INDEX_5);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERLOOKUPFILTERINFO_0100
     * @tc.name   : testOHEffectFilterLookupFilterInfo001
     * @tc.desc   : Query filter information.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterLookupFilterInfo001', 0, () => {
      let result: number = testNapi.OHEffectFilterLookupFilterInfo(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERLOOKUPFILTERINFO_0200
     * @tc.name   : testOHEffectFilterLookupFilterInfo002
     * @tc.desc   : Query filter information.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterLookupFilterInfo002', 0, () => {
      let result: number = testNapi.OHEffectFilterLookupFilterInfo(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERLOOKUPFILTERINFO_0300
     * @tc.name   : testOHEffectFilterLookupFilterInfo003
     * @tc.desc   : Query filter information.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterLookupFilterInfo003', 0, () => {
      let result: number = testNapi.OHEffectFilterLookupFilterInfo(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERLOOKUPFILTERS_0100
     * @tc.name   : testOHEffectFilterLookupFilters001
     * @tc.desc   : Search for filters that meet the criteria.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterLookupFilters001', 0, () => {
      let result: number = testNapi.OHEffectFilterLookupFilters(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERLOOKUPFILTERS_0200
     * @tc.name   : testOHEffectFilterLookupFilters002
     * @tc.desc   : Search for filters that meet the criteria.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterLookupFilters002', 0, () => {
      let result: number = testNapi.OHEffectFilterLookupFilters(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERLOOKUPFILTERS_0300
     * @tc.name   : testOHEffectFilterLookupFilters003
     * @tc.desc   : Search for filters that meet the criteria.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterLookupFilters003', 0, () => {
      let result: number = testNapi.OHEffectFilterLookupFilters(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERLOOKUPFILTERS_0400
     * @tc.name   : testOHEffectFilterLookupFilters004
     * @tc.desc   : Search for filters that meet the criteria.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterLookupFilters004', 0, () => {
      let result: number = testNapi.OHEffectFilterLookupFilters(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERLOOKUPFILTERS_0500
     * @tc.name   : testOHEffectFilterLookupFilters005
     * @tc.desc   : Search for filters that meet the criteria.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterLookupFilters005', 0, () => {
      let result: number = testNapi.OHEffectFilterLookupFilters(CASE_INDEX_5);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERREGISTER_0100
     * @tc.name   : testOHEffectFilterRegister001
     * @tc.desc   : Register custom filters.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterRegister001', 0, () => {
      let result: number = testNapi.OHEffectFilterRegister(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERREGISTER_0200
     * @tc.name   : testOHEffectFilterRegister002
     * @tc.desc   : Register custom filters.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterRegister002', 0, () => {
      let result: number = testNapi.OHEffectFilterRegister(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERREGISTER_0300
     * @tc.name   : testOHEffectFilterRegister003
     * @tc.desc   : Register custom filters.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterRegister003', 0, () => {
      let result: number = testNapi.OHEffectFilterRegister(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERRELEASE_0100
     * @tc.name   : testOHEffectFilterRelease001
     * @tc.desc   : Destroy the OH-EffectFilter instance.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterRelease001', 0, () => {
      let result: number = testNapi.OHEffectFilterRelease(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERRELEASE_0200
     * @tc.name   : testOHEffectFilterRelease002
     * @tc.desc   : Destroy the OH-EffectFilter instance.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterRelease002', 0, () => {
      let result: number = testNapi.OHEffectFilterRelease(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERRELEASEFILTERNAMES_0100
     * @tc.name   : testOHEffectFilterReleaseFilterNames001
     * @tc.desc   : Release filter name memory resources.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterReleaseFilterNames001', 0, () => {
      let result: number = testNapi.OHEffectFilterReleaseFilterNames(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERRELEASEFILTERNAMES_0200
     * @tc.name   : testOHEffectFilterReleaseFilterNames002
     * @tc.desc   : Release filter name memory resources.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterReleaseFilterNames002', 0, () => {
      let result: number = testNapi.OHEffectFilterReleaseFilterNames(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERRENDER_0100
     * @tc.name   : testOHEffectFilterRender001
     * @tc.desc   : Perform image rendering.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterRender001', 0, () => {
      let result: number = testNapi.OHEffectFilterRender(CASE_INDEX_1);
      console.log(`test render1${result}`);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERRENDER_0200
     * @tc.name   : testOHEffectFilterRender002
     * @tc.desc   : Perform image rendering.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterRender002', 0, () => {
      let result: number = testNapi.OHEffectFilterRender(CASE_INDEX_2);
      console.log(`test render2${result}`);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERRENDER_0300
     * @tc.name   : testOHEffectFilterRender003
     * @tc.desc   : Perform image rendering.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEffectFilterRender003', 0, () => {
      let result: number = testNapi.OHEffectFilterRender(CASE_INDEX_3);
      console.log(`test render3${result}`);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTCREATE_0100
     * @tc.name   : testOHImageEffectCreate001
     * @tc.desc   : Create an OH-Image Effect instance and call OH-Image Effect Release to release resources.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectCreate001', 0, () => {
      let result: number = testNapi.OHImageEffectCreate(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTCREATE_0200
     * @tc.name   : testOHImageEffectCreate002
     * @tc.desc   : Create an OH-Image Effect instance and call OH-Image Effect Release to release resources.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectCreate002', 0, () => {
      let result: number = testNapi.OHImageEffectCreate(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTCONFIGURE_0100
     * @tc.name   : testOHImageEffectConfigure001
     * @tc.desc   : Set configuration information.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectConfigure001', 0, () => {
      let result: number = testNapi.OHImageEffectConfigure(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTCONFIGURE_0200
     * @tc.name   : testOHImageEffectConfigure002
     * @tc.desc   : Set configuration information.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectConfigure002', 0, () => {
      let result: number = testNapi.OHImageEffectConfigure(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_29000121);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTCONFIGURE_0300
     * @tc.name   : testOHImageEffectConfigure003
     * @tc.desc   : Set configuration information.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectConfigure003', 0, () => {
      let result: number = testNapi.OHImageEffectConfigure(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTCONFIGURE_0400
     * @tc.name   : testOHImageEffectConfigure004
     * @tc.desc   : Set configuration information.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectConfigure004', 0, () => {
      let result: number = testNapi.OHImageEffectConfigure(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTCONFIGURE_0500
     * @tc.name   : testOHImageEffectConfigure005
     * @tc.desc   : Set configuration information.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectConfigure005', 0, () => {
      let result: number = testNapi.OHImageEffectConfigure(CASE_INDEX_5);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTADDFILTER_0100
     * @tc.name   : testOHImageEffectAddFilter001
     * @tc.desc   : Add filters.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectAddFilter001', 0, () => {
      let result: number = testNapi.OHImageEffectAddFilter(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTADDFILTER_0200
     * @tc.name   : testOHImageEffectAddFilter002
     * @tc.desc   : Add filters.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectAddFilter002', 0, () => {
      let result: number = testNapi.OHImageEffectAddFilter(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTADDFILTER_0300
     * @tc.name   : testOHImageEffectAddFilter003
     * @tc.desc   : Add filters.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectAddFilter003', 0, () => {
      let result: number = testNapi.OHImageEffectAddFilter(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTADDFILTERBYFILTER_0100
     * @tc.name   : testOHImageEffectAddFilterByFilter001
     * @tc.desc   : Add filters.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectAddFilterByFilter001', 0, () => {
      let result: number = testNapi.OHImageEffectAddFilterByFilter(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTADDFILTERBYFILTER_0200
     * @tc.name   : testOHImageEffectAddFilterByFilter002
     * @tc.desc   : Add filters.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectAddFilterByFilter002', 0, () => {
      let result: number = testNapi.OHImageEffectAddFilterByFilter(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTADDFILTERBYFILTER_0300
     * @tc.name   : testOHImageEffectAddFilterByFilter003
     * @tc.desc   : Add filters.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectAddFilterByFilter003', 0, () => {
      let result: number = testNapi.OHImageEffectAddFilterByFilter(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTGETFILTER_0100
     * @tc.name   : testOHImageEffectGetFilter001
     * @tc.desc   : Filter has been added to the query.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectGetFilter001', 0, () => {
      let result: number = testNapi.OHImageEffectGetFilter(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTGETFILTER_0200
     * @tc.name   : testOHImageEffectGetFilter002
     * @tc.desc   : Filter has been added to the query.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectGetFilter002', 0, () => {
      let result: number = testNapi.OHImageEffectGetFilter(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTGETFILTERCOUNT_0100
     * @tc.name   : testOHImageEffectGetFilterCount001
     * @tc.desc   : Query the number of filters added.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectGetFilterCount001', 0, () => {
      let result: number = testNapi.OHImageEffectGetFilterCount(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTGETFILTERCOUNT_0200
     * @tc.name   : testOHImageEffectGetFilterCount002
     * @tc.desc   : Query the number of filters added.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectGetFilterCount002', 0, () => {
      let result: number = testNapi.OHImageEffectGetFilterCount(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTGETFILTERCOUNT_0300
     * @tc.name   : testOHImageEffectGetFilterCount003
     * @tc.desc   : Query the number of filters added.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectGetFilterCount003', 0, () => {
      let result: number = testNapi.OHImageEffectGetFilterCount(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTGETFILTERCOUNT_0400
     * @tc.name   : testOHImageEffectGetFilterCount004
     * @tc.desc   : Query the number of filters added.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectGetFilterCount004', 0, () => {
      let result: number = testNapi.OHImageEffectGetFilterCount(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTGETINPUTSURFACE_0100
     * @tc.name   : testOHImageEffectGetInputSurface001
     * @tc.desc   : Get input Surface.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectGetInputSurface001', 0, () => {
      let result: number = testNapi.OHImageEffectGetInputSurface(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTGETINPUTSURFACE_0200
     * @tc.name   : testOHImageEffectGetInputSurface002
     * @tc.desc   : Get input Surface.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectGetInputSurface002', 0, () => {
      let result: number = testNapi.OHImageEffectGetInputSurface(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTINSERTFILTER_0100
     * @tc.name   : testOHImageEffectInsertFilter001
     * @tc.desc   : Insert the filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectInsertFilter001', 0, () => {
      let result: number = testNapi.OHImageEffectInsertFilter(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTINSERTFILTER_0200
     * @tc.name   : testOHImageEffectInsertFilter002
     * @tc.desc   : Insert the filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectInsertFilter002', 0, () => {
      let result: number = testNapi.OHImageEffectInsertFilter(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTINSERTFILTER_0300
     * @tc.name   : testOHImageEffectInsertFilter003
     * @tc.desc   : Insert the filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectInsertFilter003', 0, () => {
      let result: number = testNapi.OHImageEffectInsertFilter(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTINSERTFILTER_0400
     * @tc.name   : testOHImageEffectInsertFilter004
     * @tc.desc   : Insert the filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectInsertFilter004', 0, () => {
      let result: number = testNapi.OHImageEffectInsertFilter(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTINSERTFILTERBYFILTER_0100
     * @tc.name   : testOHImageEffectInsertFilterByFilter001
     * @tc.desc   : Insert the filter by filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectInsertFilterByFilter001', 0, () => {
      let result: number = testNapi.OHImageEffectInsertFilterByFilter(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTINSERTFILTERRBYFILTER_0200
     * @tc.name   : testOHImageEffectInsertFilterByFilter002
     * @tc.desc   : Insert the filter by filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectInsertFilterByFilter002', 0, () => {
      let result: number = testNapi.OHImageEffectInsertFilterByFilter(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTINSERTFILTERRBYFILTER_0300
     * @tc.name   : testOHImageEffectInsertFilterByFilter003
     * @tc.desc   : Insert the filter by filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectInsertFilterByFilter003', 0, () => {
      let result: number = testNapi.OHImageEffectInsertFilterByFilter(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTINSERTFILTERRBYINDEX_0400
     * @tc.name   : testOHImageEffectInsertFilterByFilter004
     * @tc.desc   : Insert the filter by filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectInsertFilterByFilter004', 0, () => {
      let result: number = testNapi.OHImageEffectInsertFilterByFilter(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTREPLACEFILTER_0100
     * @tc.name   : testOHImageEffectReplaceFilter001
     * @tc.desc   : Replace the filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectReplaceFilter001', 0, () => {
      let result: number = testNapi.OHImageEffectReplaceFilter(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTREPLACEFILTER_0200
     * @tc.name   : testOHImageEffectReplaceFilter002
     * @tc.desc   : Replace the filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectReplaceFilter002', 0, () => {
      let result: number = testNapi.OHImageEffectReplaceFilter(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTREPLACEFILTER_0300
     * @tc.name   : testOHImageEffectReplaceFilter003
     * @tc.desc   : Replace the filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectReplaceFilter003', 0, () => {
      let result: number = testNapi.OHImageEffectReplaceFilter(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTREPLACEFILTER_0400
     * @tc.name   : testOHImageEffectReplaceFilter004
     * @tc.desc   : Replace the filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectReplaceFilter004', 0, () => {
      let result: number = testNapi.OHImageEffectReplaceFilter(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTREPLACEFILTERBYFILTER_0100
     * @tc.name   : testOHImageEffectReplaceFilterByFilter001
     * @tc.desc   : Replace the filter by filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectReplaceFilterByFilter001', 0, () => {
      let result: number = testNapi.OHImageEffectReplaceFilterByFilter(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTREPLACEFILTERRBYFILTER_0200
     * @tc.name   : testOHImageEffectReplaceFilterByFilter002
     * @tc.desc   : Replace the filter by filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectReplaceFilterByFilter002', 0, () => {
      let result: number = testNapi.OHImageEffectReplaceFilterByFilter(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTREPLACEFILTERRBYFILTER_0300
     * @tc.name   : testOHImageEffectReplaceFilterByFilter003
     * @tc.desc   : Replace the filter by filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectReplaceFilterByFilter003', 0, () => {
      let result: number = testNapi.OHImageEffectReplaceFilterByFilter(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTREPLACEFILTERRBYINDEX_0400
     * @tc.name   : testOHImageEffectReplaceFilterByFilter004
     * @tc.desc   : Replace the filter by filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectReplaceFilterByFilter004', 0, () => {
      let result: number = testNapi.OHImageEffectReplaceFilterByFilter(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTRELEASE_0100
     * @tc.name   : testOHImageEffectRelease001
     * @tc.desc   : Release OH-ImageEffect instance resources.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectRelease_001', 0, () => {
      let result: number = testNapi.OHImageEffectRelease(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTRELEASE_0200
     * @tc.name   : testOHImageEffectRelease002
     * @tc.desc   : Release OH-ImageEffect instance resources.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectRelease002', 0, () => {
      let result: number = testNapi.OHImageEffectRelease(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTREMOVEFILTER_0100
     * @tc.name   : testOHImageEffectRemoveFilter001
     * @tc.desc   : Remove the filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectRemoveFilter001', 0, () => {
      let result: number = testNapi.OHImageEffectRemoveFilter(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTREMOVEFILTER_0200
     * @tc.name   : testOHImageEffectRemoveFilter002
     * @tc.desc   : Remove the filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectRemoveFilter002', 0, () => {
      let result: number = testNapi.OHImageEffectRemoveFilter(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTREMOVEFILTER_0300
     * @tc.name   : testOHImageEffectRemoveFilter003
     * @tc.desc   : Remove the filter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectRemoveFilter003', 0, () => {
      let result: number = testNapi.OHImageEffectRemoveFilter(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTREMOVEFILTERBYINDEX_0100
     * @tc.name   : testOHImageEffectRemoveFilterByIndex001
     * @tc.desc   : Remove the filter by index.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectRemoveFilterByIndex001', 0, () => {
      let result: number = testNapi.OHImageEffectRemoveFilterByIndex(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTREMOVEFILTERBYINDEX_0200
     * @tc.name   : testOHImageEffectRemoveFilterByIndex002
     * @tc.desc   : Remove the filter by index.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectRemoveFilterByIndex002', 0, () => {
      let result: number = testNapi.OHImageEffectRemoveFilterByIndex(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTREMOVEFILTERBYINDEX_0300
     * @tc.name   : testOHImageEffectRemoveFilterByIndex003
     * @tc.desc   : Remove the filter by index.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectRemoveFilterByIndex003', 0, () => {
      let result: number = testNapi.OHImageEffectRemoveFilterByIndex(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSAVE_0100
     * @tc.name   : testOHImageEffectSave001
     * @tc.desc   : Serialization Effector.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSave001', 0, () => {
      let result: number = testNapi.OHImageEffectSave(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSAVE_0200
     * @tc.name   : testOHImageEffectSave002
     * @tc.desc   : Serialization Effector.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSave002', 0, () => {
      let result: number = testNapi.OHImageEffectSave(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSAVE_0300
     * @tc.name   : testOHImageEffectSave003
     * @tc.desc   : Serialization Effector.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSave003', 0, () => {
      let result: number = testNapi.OHImageEffectSave(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTRESTORE_0100
     * @tc.name   : testOHImageEffectRestore001
     * @tc.desc   : Deserialize Effector.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectRestore001', 0, () => {
      let result: number = testNapi.OHImageEffectRestore(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTRESTORE_0200
     * @tc.name   : testOHImageEffectRestore002
     * @tc.desc   : Deserialize Effector.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectRestore002', 0, () => {
      let result: number = testNapi.OHImageEffectRestore(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTRESTORE_0300
     * @tc.name   : testOHImageEffectRestore003
     * @tc.desc   : Deserialize Effector.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectRestore003', 0, () => {
      let result: number = testNapi.OHImageEffectRestore(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETINPUTNATIVEBUFFER_0100
     * @tc.name   : testOHImageEffectSetInputNativeBuffer001
     * @tc.desc   : Set the NativeBuffer for input.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetInputNativeBuffer001', 0, () => {
      let result: number = testNapi.OHImageEffectSetInputNativeBuffer();
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETINPUTPIXELMAP_0100
     * @tc.name   : testOHImageEffectSetInputPixelmap001
     * @tc.desc   : Set the Pixelmap for input.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetInputPixelmap001', 0, () => {
      let result: number = testNapi.OHImageEffectSetInputPixelmap(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETINPUTPIXELMAP_0200
     * @tc.name   : testOHImageEffectSetInputPixelmap002
     * @tc.desc   : Set the Pixelmap for input.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetInputPixelmap002', 0, () => {
      let result: number = testNapi.OHImageEffectSetInputPixelmap(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETINPUTPIXELMAP_0300
     * @tc.name   : testOHImageEffectSetInputPixelmap003
     * @tc.desc   : Set the Pixelmap for input.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetInputPixelmap003', 0, () => {
      let result: number = testNapi.OHImageEffectSetInputPixelmap(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETINPUTURI_0100
     * @tc.name   : testOHImageEffectSetInputUri001
     * @tc.desc   : Set the input URI.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetInputUri001', 0, () => {
      let result: number = testNapi.OHImageEffectSetInputUri(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETINPUTURI_0200
     * @tc.name   : testOHImageEffectSetInputUri002
     * @tc.desc   : Set the input URI.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetInputUri002', 0, () => {
      let result: number = testNapi.OHImageEffectSetInputUri(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETINPUTURI_0300
     * @tc.name   : testOHImageEffectSetInputUri003
     * @tc.desc   : Set the input URI.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetInputUri003', 0, () => {
      let result: number = testNapi.OHImageEffectSetInputUri(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETINPUTURI_0400
     * @tc.name   : testOHImageEffectSetInputUri004
     * @tc.desc   : Set the input URI.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetInputUri004', 0, () => {
      let result: number = testNapi.OHImageEffectSetInputUri(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETINPUTURI_0500
     * @tc.name   : testOHImageEffectSetInputUri005
     * @tc.desc   : Set the input URI.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetInputUri005', 0, () => {
      let result: number = testNapi.OHImageEffectSetInputUri(CASE_INDEX_5);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETINPUTURI_0600
     * @tc.name   : testOHImageEffectSetInputUri006
     * @tc.desc   : Set the input URI.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetInputUri006', 0, () => {
      let result: number = testNapi.OHImageEffectSetInputUri(CASE_INDEX_6);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETINPUTURI_0700
     * @tc.name   : testOHImageEffectSetInputUri007
     * @tc.desc   : Set the input URI.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetInputUri007', 0, () => {
      let result: number = testNapi.OHImageEffectSetInputUri(CASE_INDEX_7);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETINPUTURI_0800
     * @tc.name   : testOHImageEffectSetInputUri008
     * @tc.desc   : Set the input URI.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetInputUri008', 0, () => {
      let result: number = testNapi.OHImageEffectSetInputUri(CASE_INDEX_8);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETINPUTURI_0900
     * @tc.name   : testOHImageEffectSetInputUri009
     * @tc.desc   : Set the input URI.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetInputUri009', 0, () => {
      let result: number = testNapi.OHImageEffectSetInputUri(CASE_INDEX_9);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETINPUTURI_1000
     * @tc.name   : testOHImageEffectSetInputUri010
     * @tc.desc   : Set the input URI.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetInputUri010', 0, () => {
      let result: number = testNapi.OHImageEffectSetInputUri(CASE_INDEX_10);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETINPUTURI_1100
     * @tc.name   : testOHImageEffectSetInputUri011
     * @tc.desc   : Set the input URI.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetInputUri011', 0, () => {
      let result: number = testNapi.OHImageEffectSetInputUri(CASE_INDEX_11);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTNATIVEBUFFER_0100
     * @tc.name   : testOHImageEffectSetOutputNativeBuffer001
     * @tc.desc   : Set the NativeBuffer for the output.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetOutputNativeBuffer001', 0, () => {
      let result: number = testNapi.OHImageEffectSetOutputNativeBuffer();
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTPIXELMAP_0100
     * @tc.name   : testOHImageEffectSetOutputPixelmap001
     * @tc.desc   : Set the Pixelmap for output.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetOutputPixelmap001', 0, () => {
      let result: number = testNapi.OHImageEffectSetOutputPixelmap(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTPIXELMAP_0200
     * @tc.name   : testOHImageEffectSetOutputPixelmap002
     * @tc.desc   : Set the Pixelmap for output.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetOutputPixelmap002', 0, () => {
      let result: number = testNapi.OHImageEffectSetOutputPixelmap(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTPIXELMAP_0300
     * @tc.name   : testOHImageEffectSetOutputPixelmap003
     * @tc.desc   : Set the Pixelmap for output.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetOutputPixelmap003', 0, () => {
      let result: number = testNapi.OHImageEffectSetOutputPixelmap(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTSURFACE_0100
     * @tc.name   : testOHImageEffectSetOutputSurface001
     * @tc.desc   : This is setting the output surface.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetOutputSurface001', 0, () => {
      let result: number = testNapi.OHImageEffectSetOutputSurface(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTSURFACE_0200
     * @tc.name   : testOHImageEffectSetOutputSurface002
     * @tc.desc   : This is setting the output surface.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetOutputSurface002', 0, () => {
      let result: number = testNapi.OHImageEffectSetOutputSurface(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTURI_0100
     * @tc.name   : testOHImageEffectSetOutputUri001
     * @tc.desc   : Set the output URI.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetOutputUri001', 0, () => {
      let result: number = testNapi.OHImageEffectSetOutputUri(CASE_INDEX_1);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTURI_0200
     * @tc.name   : testOHImageEffectSetOutputUri002
     * @tc.desc   : Set the output URI.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetOutputUri002', 0, () => {
      let result: number = testNapi.OHImageEffectSetOutputUri(CASE_INDEX_2);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTURI_0300
     * @tc.name   : testOHImageEffectSetOutputUri003
     * @tc.desc   : Set the output URI.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetOutputUri003', 0, () => {
      let result: number = testNapi.OHImageEffectSetOutputUri(CASE_INDEX_3);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTURI_0400
     * @tc.name   : testOHImageEffectSetOutputUri004
     * @tc.desc   : Set the output URI.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetOutputUri004', 0, () => {
      let result: number = testNapi.OHImageEffectSetOutputUri(CASE_INDEX_4);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTURI_0500
     * @tc.name   : testOHImageEffectSetOutputUri005
     * @tc.desc   : Set the output URI.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetOutputUri005', 0, () => {
      let result: number = testNapi.OHImageEffectSetOutputUri(CASE_INDEX_5);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTURI_0600
     * @tc.name   : testOHImageEffectSetOutputUri006
     * @tc.desc   : Set the output URI.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetOutputUri006', 0, () => {
      let result: number = testNapi.OHImageEffectSetOutputUri(CASE_INDEX_6);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTURI_0700
     * @tc.name   : testOHImageEffectSetOutputUri007
     * @tc.desc   : Set the output URI.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetOutputUri007', 0, () => {
      let result: number = testNapi.OHImageEffectSetOutputUri(CASE_INDEX_7);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTURI_0800
     * @tc.name   : testOHImageEffectSetOutputUri008
     * @tc.desc   : Set the output URI.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetOutputUri008', 0, () => {
      let result: number = testNapi.OHImageEffectSetOutputUri(CASE_INDEX_8);
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTURI_0900
     * @tc.name   : testOHImageEffectSetOutputUri009
     * @tc.desc   : Set the output URI.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetOutputUri009', 0, () => {
      let result: number = testNapi.OHImageEffectSetOutputUri(CASE_INDEX_9);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTURI_1000
     * @tc.name   : testOHImageEffectSetOutputUri010
     * @tc.desc   : Set the output URI.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetOutputUri010', 0, () => {
      let result: number = testNapi.OHImageEffectSetOutputUri(CASE_INDEX_10);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTURI_1100
     * @tc.name   : testOHImageEffectSetOutputUri011
     * @tc.desc   : Set the output URI.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetOutputUri011', 0, () => {
      let result: number = testNapi.OHImageEffectSetOutputUri(CASE_INDEX_11);
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHImageEffectStart_0100
     * @tc.name   : testOHImageEffectStart001
     * @tc.desc   : Start the Effector.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectStart001', 0, () => {
      let result: number = testNapi.OHImageEffectStart();
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSTOP_0100
     * @tc.name   : testOHImageEffectStop001
     * @tc.desc   : Start the Effector.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectStop001', 0, () => {
      let result: number = testNapi.OHImageEffectStop();
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHImageEffectSetInputPicture_0100
     * @tc.name   : testOHImageEffectSetInputPicture001
     * @tc.desc   : Start the Effector.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetInputPicture001', 0, () => {
      let result: number = testNapi.OHImageEffectSetInputPicture();
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
    
    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHImageEffectSetOutputPicture_0100
     * @tc.name   : testOHImageEffectSetOutputPicture001
     * @tc.desc   : Start the Effector.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHImageEffectSetOutputPicture001', 0, () => {
      let result: number = testNapi.OHImageEffectSetOutputPicture();
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

  });
}