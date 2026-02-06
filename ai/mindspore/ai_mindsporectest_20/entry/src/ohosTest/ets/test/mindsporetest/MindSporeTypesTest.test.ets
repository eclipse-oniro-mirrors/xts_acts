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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach } from '@ohos/hypium'
import mindsporendk from 'libmindsporendk.so'
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import Utils from '../common/Utils';
import { BusinessError } from '@ohos.base';

const ARKUI_ERROR_CODE_NO_ERROR = 0;
const ARKUI_ERROR_CODE_ERROR = 1;

function getContext(): Context {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let context = abilityDelegator.getAppContext();
  return context;
}

export default function MindSporeTypesTest() {
  describe('MindSporeTypesTest', () => {
    beforeAll(async (done: Function) => {
      let context = getContext()
      let dir = context.filesDir + "/";
      try {
        let ml_face_model_file = dir + "lenet_train.ms";
        let ml_face_model_file1 = dir + "ml_face_isface.input";
        context.resourceManager.getRawFileContent("lenet_train.ms", (error, model_buffer) => {
          if (error) {
            console.log(
              `[rawfile_copy_to_sandbox] lenet_train.ms is
            copy failed:${error.code}, message: ${error.message}.`);
          } else {
            let file = fs.openSync(ml_face_model_file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
            fs.writeSync(file.fd, model_buffer.buffer);
            fs.closeSync(file);
            console.log("[rawfile_copy_to_sandbox] lenet_train.ms is copy success");
          }
        });
        context.resourceManager.getRawFileContent("ml_face_isface.input", (error, model_buffer) => {
          let file1 = fs.openSync(ml_face_model_file1, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          fs.writeSync(file1.fd, model_buffer.buffer);
          fs.closeSync(file1);
        });
      } catch (error) {
        console.info("[rawfile_copy_to_sandbox] getRawFileDescriptor api run failed" + error);
      }
      console.info("[rawfile_copy_to_sandbox] sandbox path:" + dir);
      await Utils.sleep(500)
    });

    beforeEach(async () => {
      let dir = getContext().filesDir + "/";

      let ml_face_model = dir + "lenet_train.ms";
      let ml_face_model_input = dir + "ml_face_isface.input";
      await fs.stat(ml_face_model).then(async (res) => {
        if (res) {
          console.info("MindSporeDemo lenet_train.ms file exists");
          console.info(`MindSporeDemo lenet_train.ms size:${res.size}`);
        }
      }).catch((err: BusinessError) => {
        console.info("MindSporeDemo lenet_train.ms file does not exists! access failed with error message: " +
        err.message + ", error code: " + err.code);
      });
      await Utils.sleep(500)
      await fs.stat(ml_face_model_input).then(async (res) => {
        if (res) {
          console.info("MindSporeDemo ml_face_isface.input file exists");
          console.info(`MindSporeDemo ml_face_isface.input size:${res.size}`);
        }
      }).catch((err: BusinessError) => {
        console.info("MindSporeDemo ml_face_isface.input file does not exists! access failed with error message: " +
        err.message + ", error code: " + err.code);
      });
    })
    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_DEVICETYPE_GPU_0100
       * @tc.name       : testOH_AI_DEVICETYPE_GPU0100
       * @tc.desc       : testing OH_AI_DEVICETYPE_GPU interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_DEVICETYPE_GPU0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_DEVICETYPE_GPU0100 start====");
          let result: number = mindsporendk.DeviceTypeTest_001();
          console.info(`====>testOH_AI_DEVICETYPE_GPU0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_DEVICETYPE_GPU0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_MODELTYPE_INVALID_0100
       * @tc.name       : testOH_AI_MODELTYPE_INVALID0100
       * @tc.desc       : testing OH_AI_MODELTYPE_INVALID interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_MODELTYPE_INVALID0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_MODELTYPE_INVALID0100 start====");
          let result: number = mindsporendk.ModelTypetest_001();
          console.info(`====>testOH_AI_MODELTYPE_INVALID0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_MODELTYPE_INVALID0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_NNRTDEVICE_OTHERS_0100
       * @tc.name       : testOH_AI_NNRTDEVICE_OTHERS0100
       * @tc.desc       : testing OH_AI_NNRTDEVICE_OTHERS interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_NNRTDEVICE_OTHERS0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_NNRTDEVICE_OTHERS0100 start====");
          let result: number = mindsporendk.NNRTDeviceTypetest_001(0);
          console.info(`====>testOH_AI_NNRTDEVICE_OTHERS0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_NNRTDEVICE_OTHERS0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_NNRTDEVICE_CPU_0100
       * @tc.name       : testOH_AI_NNRTDEVICE_CPU0100
       * @tc.desc       : testing OH_AI_NNRTDEVICE_CPU interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_NNRTDEVICE_CPU0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_NNRTDEVICE_CPU0100 start====");
          let result: number = mindsporendk.NNRTDeviceTypetest_001(1);
          console.info(`====>testOH_AI_NNRTDEVICE_CPU0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_NNRTDEVICE_CPU0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_NNRTDEVICE_GPU_0100
       * @tc.name       : testOH_AI_NNRTDEVICE_GPU0100
       * @tc.desc       : testing OH_AI_NNRTDEVICE_GPU interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_NNRTDEVICE_GPU0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_NNRTDEVICE_GPU0100 start====");
          let result: number = mindsporendk.NNRTDeviceTypetest_001(2);
          console.info(`====>testOH_AI_NNRTDEVICE_GPU0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_NNRTDEVICE_GPU0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_NNRTDEVICE_ACCELERATOR_0100
       * @tc.name       : testOH_AI_NNRTDEVICE_ACCELERATOR0100
       * @tc.desc       : testing OH_AI_NNRTDEVICE_ACCELERATOR interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_NNRTDEVICE_ACCELERATOR0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_NNRTDEVICE_ACCELERATOR0100 start====");
          let result: number = mindsporendk.NNRTDeviceTypetest_001(3);
          console.info(`====>testOH_AI_NNRTDEVICE_ACCELERATOR0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_NNRTDEVICE_ACCELERATOR0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_KO0_0100
       * @tc.name       : testOH_AI_KO00100
       * @tc.desc       : testing OH_AI_KO0 interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_KO00100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_KO00100 start====");
          let result: number = mindsporendk.OptimizationLevelTest_001();
          console.info(`====>testOH_AI_KO00100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_KO00100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_KO2_0100
       * @tc.name       : testOH_AI_KO20100
       * @tc.desc       : testing OH_AI_KO2 interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_KO20100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_KO20100 start====");
          let result: number = mindsporendk.OptimizationLevelTest_002();
          console.info(`====>testOH_AI_KO20100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_KO20100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_KO3_0100
       * @tc.name       : testOH_AI_KO30100
       * @tc.desc       : testing OH_AI_KO3 interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_KO30100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_KO30100 start====");
          let result: number = mindsporendk.OptimizationLevelTest_003();
          console.info(`====>testOH_AI_KO30100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_KO30100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_KAUTO_0100
       * @tc.name       : testOH_AI_KAUTO0100
       * @tc.desc       : testing OH_AI_KAUTO interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_KAUTO0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_KAUTO0100 start====");
          let result: number = mindsporendk.OptimizationLevelTest_004();
          console.info(`====>testOH_AI_KAUTO0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_KAUTO0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_KOPTIMIZATIONTYPE_0100
       * @tc.name       : testOH_AI_KOPTIMIZATIONTYPE0100
       * @tc.desc       : testing OH_AI_KOPTIMIZATIONTYPE interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_KOPTIMIZATIONTYPE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_KOPTIMIZATIONTYPE0100 start====");
          let result: number = mindsporendk.OptimizationLevelTest_005();
          console.info(`====>testOH_AI_KOPTIMIZATIONTYPE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_KOPTIMIZATIONTYPE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_NO_QUANT_0100
       * @tc.name       : testOH_AI_NO_QUANT0100
       * @tc.desc       : testing OH_AI_NO_QUANT interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_NO_QUANT0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_NO_QUANT0100 start====");
          let result: number = mindsporendk.QuantizationTypeTest_001();
          console.info(`====>testOH_AI_NO_QUANT0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_NO_QUANT0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_WEIGHT_QUANT_0100
       * @tc.name       : testOH_AI_WEIGHT_QUANT0100
       * @tc.desc       : testing OH_AI_WEIGHT_QUANT interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_WEIGHT_QUANT0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_WEIGHT_QUANT0100 start====");
          let result: number = mindsporendk.QuantizationTypeTest_002();
          console.info(`====>testOH_AI_WEIGHT_QUANT0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_WEIGHT_QUANT0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_FULL_QUANT_0100
       * @tc.name       : testOH_AI_FULL_QUANT0100
       * @tc.desc       : testing OH_AI_FULL_QUANT interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_FULL_QUANT0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_FULL_QUANT0100 start====");
          let result: number = mindsporendk.QuantizationTypeTest_003();
          console.info(`====>testOH_AI_FULL_QUANT0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_FULL_QUANT0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_UNKNOWN_QUANT_TYPE_0100
       * @tc.name       : testOH_AI_UNKNOWN_QUANT_TYPE0100
       * @tc.desc       : testing OH_AI_UNKNOWN_QUANT_TYPE interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_UNKNOWN_QUANT_TYPE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_UNKNOWN_QUANT_TYPE0100 start====");
          let result: number = mindsporendk.QuantizationTypeTest_003();
          console.info(`====>testOH_AI_UNKNOWN_QUANT_TYPE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_UNKNOWN_QUANT_TYPE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

  })
}