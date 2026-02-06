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
import testNapi from 'libentry.so'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs';
import common from '@ohos.app.ability.common';

// 用例预期结果
const EXPEXTED_RESULT = 0;

const EFFECT_KEY_ERROR  = 1;
const EFFECT_PARAM_ERROR  = 2;
const EFFECT_ERROR_PARAM_INVALID  = 4;


export default function imageEffectErrorCodeTest() {


  describe('imageEffectErrorCodeTest', () => {
    let testContext: common.UIAbilityContext;
    let filePath: string;
    let fileFd: number;
    let filesDir: string | undefined

    beforeAll(async (done: Function) => {
      testContext = AppStorage.get<common.UIAbilityContext>('thisContext') as common.UIAbilityContext;
      filesDir = AppStorage.get('pathDir');
      done();
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    const getFd = async (fileName: string) => {
      filePath = filesDir + '/' + fileName;
      console.log('filePath:', filePath)

      //resfile下面文件 只有只读权限 copy到沙箱下面在操作.注意:测试图片放到resfile下，不要放到rawfile下。
      if(!fs.accessSync(filePath)){
        let srcPath = testContext.resourceDir + '/';
        let desPath = testContext.filesDir + '/';
        if (!fs.accessSync(desPath)) {
          fs.mkdirSync(desPath)
        }
        fs.copyDirSync(srcPath, desPath, 0);
      }
      let file = fs.openSync(filePath, fs.OpenMode.READ_WRITE );
      fileFd = file.fd;
      console.log('fileFd is:', fileFd)

    }

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTINSERTFILTERBYFILTER_0500
     * @tc.name   : testOHImageEffectInsertFilterByFilter005
     * @tc.desc   : OH_ImageEffect_InsertFilterByFilter return IMAGE_SUCCESS
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testOHImageEffectInsertFilterByFilter005', Level.LEVEL3, () => {
      let result: number = testNapi.OHImageEffectInsertFilterByFilterEffectSuccess();
      expect(result).assertEqual(EXPEXTED_RESULT);
    });



    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTCONFIGURE_0700
     * @tc.name   : testOHImageEffectConfigure007
     * @tc.desc   : SOH_ImageEffect_Configure  return EFFECT_PARAM_ERROR
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testOHImageEffectConfigure007', Level.LEVEL3, () => {
      let result: number = testNapi.OHImageEffectConfigureEffectParamError();
      expect(result).assertEqual(EXPEXTED_RESULT);
    });


    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETINPUTNATIVEBUFFER_0200
     * @tc.name   : testOHImageEffectSetInputNativeBuffer002
     * @tc.desc   : OH_ImageEffect_SetInputNativeBuffer return EFFECT_ERROR_PARAM_INVALID
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testOHImageEffectSetInputNativeBuffer002', Level.LEVEL3, () => {
      let result: number = testNapi.OHImageEffectSetInputNativeBufferErrorCode();
      expect(result).assertEqual(EXPEXTED_RESULT);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSETOUTPUTNATIVEBUFFER_0200
     * @tc.name   : testOHImageEffectSetOutputNativeBuffer002
     * @tc.desc   : OH_ImageEffect_SetOutputNativeBuffer return EFFECT_ERROR_PARAM_INVALID
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testOHImageEffectSetOutputNativeBuffer002', Level.LEVEL3, () => {
      let result: number = testNapi.OHImageEffectSetOutputNativeBufferErrorCode();
      expect(result).assertEqual(EXPEXTED_RESULT);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHImageEffectSetInputPicture_0200
     * @tc.name   : testOHImageEffectSetInputPicture002
     * @tc.desc   : OH_ImageEffect_SetInputPicture return EFFECT_SUCCESS
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testOHImageEffectSetInputPicture002', Level.LEVEL3, async (done: Function) => {
      await getFd("test51.jpg");
      let result: number = testNapi.OHImageEffectSetInputPictureErrorCode(filePath);
      expect(result).assertEqual(EXPEXTED_RESULT);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHImageEffectSetOutputPicture_0200
     * @tc.name   : testOHImageEffectSetOutputPicture002
     * @tc.desc   : OH_ImageEffect_SetOutputPicture return EFFECT_ERROR_PARAM_INVALID
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testOHImageEffectSetOutputPicture002', Level.LEVEL3, () => {
      let result: number = testNapi.OHImageEffectSetOutputPictureErrorCode();
      expect(result).assertEqual(EXPEXTED_RESULT);
    });


    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHImageEffectStart_0500
     * @tc.name   : testOHImageEffectStart005
     * @tc.desc   : OH_ImageEffect_Start return EFFECT_ERROR_PARAM_INVALID
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testOHImageEffectStart005', Level.LEVEL3, () => {
      let result: number = testNapi.OHImageEffectStartErrorCode();
      expect(result).assertEqual(EXPEXTED_RESULT);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHIMAGEEFFECTSTOP_0200
     * @tc.name   : testOHImageEffectStop002
     * @tc.desc   : OH_ImageEffect_Stop return EFFECT_ERROR_PARAM_INVALID
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testOHImageEffectStop002', Level.LEVEL3, () => {
      let result: number = testNapi.OHImageEffectStopErrorCode();
      expect(result).assertEqual(EXPEXTED_RESULT);
    });


    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_ERRORPARAMINVALID_0100
     * @tc.name   : testOHImageEffectErrorParamInvalid001
     * @tc.desc   : OH_ImageEffect_SetOutputPicture return EFFECT_ERROR_PARAM_INVALID
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testOHImageEffectErrorParamInvalid001', Level.LEVEL3, () => {
      let result: number = testNapi.ImageEffectErrorCodeErrorParamInvalid();
      expect(result).assertEqual(EXPEXTED_RESULT);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_PARAMERROR_0100
     * @tc.name   : testOHImageEffectErrorParamError001
     * @tc.desc   : OH_ImageEffect_Configure return EFFECT_PARAM_ERROR
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testOHImageEffectErrorParamError001', Level.LEVEL3, () => {
      let result: number = testNapi.ImageEffectErrorCodeParamError();
      expect(result).assertEqual(EXPEXTED_RESULT);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_KEYERROR_0100
     * @tc.name   : testOHImageEffectErrorKeyError001
     * @tc.desc   : OH_EffectFilter_SetValue return EFFECT_KEY_ERROR
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testOHImageEffectErrorKeyError001', Level.LEVEL3, () => {
      let result: number = testNapi.ImageEffectErrorCodeKeyError();
      expect(result).assertEqual(EXPEXTED_RESULT);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_DATATYPEUNKNOWN_0100
     * @tc.name   : testOHImageEffectDataTypeUnknown001
     * @tc.desc   : Test the EFFECT_DATA_TYPE_UNKNOWN in the enumeration ImageEffect_DataType.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testOHImageEffectDataTypeUnknown001', Level.LEVEL3, () => {
      let result: number = testNapi.ImageEffectDataTypeUnknown();
      expect(result).assertEqual(EXPEXTED_RESULT);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_BUFFERTYPEUNKNOWN_0100
     * @tc.name   : testOHImageEffectBufferTypeUnknown001
     * @tc.desc   : Test the EFFECT_BUFFER_TYPE_UNKNOWN in the enumeration ImageEffect_BufferType.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testOHImageEffectBufferTypeUnknown001', Level.LEVEL3, () => {
      let result: number = testNapi.ImageEffectBufferTypeUnknown();
      expect(result).assertEqual(EXPEXTED_RESULT);
    });


    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERSETVALUE_0300
     * @tc.name   : testOHEffectFilterSetValue003
     * @tc.desc   : OH_EffectFilter_SetValue return EFFECT_KEY_ERROR
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testOHEffectFilterSetValue003', Level.LEVEL3, () => {
      let result: number = testNapi.OHEffectFilterSetValueErrorCode();
      expect(result).assertEqual(EXPEXTED_RESULT);
    });


    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_OHEFFECTFILTERGETVALUE_0600
     * @tc.name   : testOHEffectFilterGetValue006
     * @tc.desc   : OH_EffectFilter_GetValue return EFFECT_KEY_ERROR
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testOHEffectFilterGetValue006', Level.LEVEL3, () => {
      let result: number = testNapi.OHEffectFilterGetValueErrorCode();
      expect(result).assertEqual(EXPEXTED_RESULT);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_IMAGEEFFECTREGION_0100
     * @tc.name   : testOHEffectFilterImageEffectRegion001
     * @tc.desc   : The purpose of the test is to cover the ImageEffect_Region structure
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testOHEffectFilterImageEffectRegion001', Level.LEVEL3, () => {
      let result: number = testNapi.OHImageEffectImageEffectRegion();
      expect(result).assertEqual(EXPEXTED_RESULT);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_IMAGEEFFECTREGION_0200
     * @tc.name   : testOHEffectFilterImageEffectRegion002
     * @tc.desc   : The purpose of the test is to cover the ImageEffect_Region X0 structure
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testOHEffectFilterImageEffectRegion002', Level.LEVEL3, () => {
      let result: number = testNapi.OHImageEffectImageEffectRegion();
      expect(result).assertEqual(EXPEXTED_RESULT);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_IMAGEEFFECTREGION_0300
     * @tc.name   : testOHEffectFilterImageEffectRegion003
     * @tc.desc   :The purpose of the test is to cover the ImageEffect_Region y0 structure
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testOHEffectFilterImageEffectRegion003', Level.LEVEL3, () => {
      let result: number = testNapi.OHImageEffectImageEffectRegion();
      expect(result).assertEqual(EXPEXTED_RESULT);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_IMAGEEFFECTREGION_0400
     * @tc.name   : testOHEffectFilterImageEffectRegion004
     * @tc.desc   : The purpose of the test is to cover the ImageEffect_Region x1 structure
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testOHEffectFilterImageEffectRegion004', Level.LEVEL3, () => {
      let result: number = testNapi.OHImageEffectImageEffectRegion();
      expect(result).assertEqual(EXPEXTED_RESULT);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_IMAGEEFFECTREGION_0500
     * @tc.name   : testOHEffectFilterImageEffectRegion005
     * @tc.desc   : The purpose of the test is to cover the ImageEffect_Region y1 structure
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testOHEffectFilterImageEffectRegion005', Level.LEVEL3, () => {
      let result: number = testNapi.OHImageEffectImageEffectRegion();
      expect(result).assertEqual(EXPEXTED_RESULT);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_IMAGEEFFECTSIZE_0100
     * @tc.name   : testOHEffectFilterImageEffectSize001
     * @tc.desc   : The purpose of the test is to cover the ImageEffect_Size structure
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testOHEffectFilterImageEffectSize001', Level.LEVEL3, () => {
      let result: number = testNapi.OHImageEffectImageEffectSize();
      expect(result).assertEqual(EXPEXTED_RESULT);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_IMAGEEFFECTSIZE_0200
     * @tc.name   : testOHEffectFilterImageEffectSize002
     * @tc.desc   : The purpose of the test is to cover the ImageEffect_Size width structure
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testOHEffectFilterImageEffectSize002', Level.LEVEL3, () => {
      let result: number = testNapi.OHImageEffectImageEffectSize();
      expect(result).assertEqual(EXPEXTED_RESULT);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_IMAGEEFFECTSIZE_0300
     * @tc.name   : testOHEffectFilterImageEffectSize003
     * @tc.desc   : The purpose of the test is to cover the ImageEffect_Size height structure
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testOHEffectFilterImageEffectSize003', Level.LEVEL3, () => {
      let result: number = testNapi.OHImageEffectImageEffectSize();
      expect(result).assertEqual(EXPEXTED_RESULT);
    });


    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_FILTERNAMES_0100
     * @tc.name   : testOHEffectFilterImageImageEffectFilterNames001
     * @tc.desc   : The purpose of the test is to cover the ImageEffect_FilterNames size structure
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testOHEffectFilterImageImageEffectFilterNames001', Level.LEVEL3, () => {
      let result: number = testNapi.OHEffectFilterLookupFiltersFilterNames();
      expect(result).assertEqual(EXPEXTED_RESULT);
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_IMAGE_IMAGEEFFECT_FILTERNAMES_0200
     * @tc.name   : testOHEffectFilterImageImageEffectFilterNames002
     * @tc.desc   : he purpose of the test is to cover the ImageEffect_FilterNames nameList structure
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testOHEffectFilterImageImageEffectFilterNames002', Level.LEVEL3, () => {
      let result: number = testNapi.OHEffectFilterLookupFiltersFilterNames();
      expect(result).assertEqual(EXPEXTED_RESULT);
    });

  });
}