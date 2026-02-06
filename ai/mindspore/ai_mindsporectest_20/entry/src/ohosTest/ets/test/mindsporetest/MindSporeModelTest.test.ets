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

export default function MindSporeModelTest() {
  describe('MindSporeModelTest', () => {
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
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_TRAINCFGCREATE_0100
       * @tc.name       : testOH_AI_TrainCfgCreate0100
       * @tc.desc       : testing OH_AI_TrainCfgCreate interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_TrainCfgCreate0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_TrainCfgCreate0100 start====");
          let result: number = mindsporendk.TrainCfgCreateTest_001();
          console.info(`====>testOH_AI_TrainCfgCreate0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_TrainCfgCreate0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_TRAINCFGDESTROY_0100
       * @tc.name       : testOH_AI_TrainCfgDestroy0100
       * @tc.desc       : testing OH_AI_TrainCfgDestroy interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_TrainCfgDestroy0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_TrainCfgDestroy0100 start====");
          let result: number = mindsporendk.TrainCfgDestroyTest_001();
          console.info(`====>testOH_AI_TrainCfgDestroy0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_TrainCfgDestroy0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_TRAINCFGGETLOSSNAME_0100
       * @tc.name       : testOH_AI_TrainCfgGetLossName0100
       * @tc.desc       : testing OH_AI_TrainCfgGetLossName interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_TrainCfgGetLossName0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_TrainCfgGetLossName0100 start====");
          let result: number = mindsporendk.TrainCfgGetLossNameTest_001();
          console.info(`====>testOH_AI_TrainCfgGetLossName0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_TrainCfgGetLossName0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_TRAINCFGGETLOSSNAME_0200
       * @tc.name       : testOH_AI_TrainCfgGetLossName0200
       * @tc.desc       : testing OH_AI_TrainCfgGetLossName interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_TrainCfgGetLossName0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_TrainCfgGetLossName0200 start====");
          let result: number = mindsporendk.TrainCfgGetLossNameTest_002();
          console.info(`====>testOH_AI_TrainCfgGetLossName0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_TrainCfgGetLossName0200 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_TRAINCFGGETLOSSNAME_0300
       * @tc.name       : testOH_AI_TrainCfgGetLossName0300
       * @tc.desc       : testing OH_AI_TrainCfgGetLossName interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_TrainCfgGetLossName0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_TrainCfgGetLossName0300 start====");
          let result: number = mindsporendk.TrainCfgGetLossNameTest_003();
          console.info(`====>testOH_AI_TrainCfgGetLossName0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_TrainCfgGetLossName0300 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_TRAINCFGSETLOSSNAME_0100
       * @tc.name       : testOH_AI_TrainCfgSetLossName0100
       * @tc.desc       : testing OH_AI_TrainCfgSetLossName interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_TrainCfgSetLossName0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_TrainCfgSetLossName0100 start====");
          let result: number = mindsporendk.TrainCfgSetLossNameTest_001();
          console.info(`====>testOH_AI_TrainCfgSetLossName0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_TrainCfgSetLossName0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_TRAINCFGGETOPTIMIZATIONLEVEL_0100
       * @tc.name       : testOH_AI_TrainCfgGetOptimizationLevel0100
       * @tc.desc       : testing OH_AI_TrainCfgGetOptimizationLevel interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_TrainCfgGetOptimizationLevel0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_TrainCfgGetOptimizationLevel0100 start====");
          let result: number = mindsporendk.TrainCfgGetOptimizationLevelTest_001();
          console.info(`====>testOH_AI_TrainCfgGetOptimizationLevel0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_TrainCfgGetOptimizationLevel0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_TRAINCFGGETOPTIMIZATIONLEVEL_0200
       * @tc.name       : testOH_AI_TrainCfgGetOptimizationLevel0200
       * @tc.desc       : testing OH_AI_TrainCfgGetOptimizationLevel interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_TrainCfgGetOptimizationLevel0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_TrainCfgGetOptimizationLevel0200 start====");
          let result: number = mindsporendk.TrainCfgGetOptimizationLevelTest_002();
          console.info(`====>testOH_AI_TrainCfgGetOptimizationLevel0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_TrainCfgGetOptimizationLevel0200 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_TRAINCFGSETOPTIMIZATIONLEVEL_0100
       * @tc.name       : testOH_AI_TrainCfgSetOptimizationLevel0100
       * @tc.desc       : testing OH_AI_TrainCfgSetOptimizationLevel interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_TrainCfgSetOptimizationLevel0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_TrainCfgSetOptimizationLevel0100 start====");
          let result: number = mindsporendk.TrainCfgSetOptimizationLevelTest_001();
          console.info(`====>testOH_AI_TrainCfgSetOptimizationLevel0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_TrainCfgSetOptimizationLevel0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_TRAINCFGSETOPTIMIZATIONLEVEL_0200
       * @tc.name       : testOH_AI_TrainCfgSetOptimizationLevel0200
       * @tc.desc       : testing OH_AI_TrainCfgSetOptimizationLevel interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_TrainCfgSetOptimizationLevel0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_TrainCfgSetOptimizationLevel0200 start====");
          let result: number = mindsporendk.TrainCfgSetOptimizationLevelTest_002();
          console.info(`====>testOH_AI_TrainCfgSetOptimizationLevel0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_TrainCfgSetOptimizationLevel0200 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_TRAINMODELBUILD_0100
       * @tc.name       : testOH_AI_TrainModelBuild0100
       * @tc.desc       : testing OH_AI_TrainModelBuild interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_TrainModelBuild0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_TrainModelBuild0100 start====");
          let result: number = mindsporendk.TrainModelBuildTest_001();
          console.info(`====>testOH_AI_TrainModelBuild0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_TrainModelBuild0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_TRAINMODELBUILDFROMFILE_0100
       * @tc.name       : testOH_AI_TrainModelBuildFromFile0100
       * @tc.desc       : testing OH_AI_TrainModelBuildFromFile interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_TrainModelBuildFromFile0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_TrainModelBuildFromFile0100 start====");
          let result: number = mindsporendk.TrainModelBuildFromFileTest_001();
          console.info(`====>testOH_AI_TrainModelBuildFromFile0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_TrainModelBuildFromFile0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_RUNSTEP_0100
       * @tc.name       : testOH_AI_RunStep0100
       * @tc.desc       : testing OH_AI_RunStep interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_RunStep0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_RunStep0100 start====");
          let result: number = mindsporendk.RunStepTest_001();
          console.info(`====>testOH_AI_RunStep0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_RunStep0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_ModelSetLearningRate_0100
       * @tc.name       : testOH_AI_ModelSetLearningRate0100
       * @tc.desc       : testing OH_AI_ModelSetLearningRate interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_ModelSetLearningRate0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        // let file = fs.openSync("/data/test/lenet_train.ms",fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE)
        // fs.writeSync(file.fd, 'Try to write str.');
        try {
          console.info("====>testOH_AI_ModelSetLearningRate0100 start====");
          let result: number = mindsporendk.ModelSetLearningRateTest_001();
          console.info(`====>testOH_AI_ModelSetLearningRate0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_ModelSetLearningRate0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_ModelGetLearningRate_0100
       * @tc.name       : testOH_AI_ModelGetLearningRate0100
       * @tc.desc       : testing OH_AI_ModelGetLearningRate interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_ModelGetLearningRate0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_ModelGetLearningRate0100 start====");
          let result: number = mindsporendk.ModelGetLearningRateTest_001();
          console.info(`====>testOH_AI_ModelGetLearningRate0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_ModelGetLearningRate0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_ModelGetWeights_0100
       * @tc.name       : testOH_AI_ModelGetWeights0100
       * @tc.desc       : testing OH_AI_ModelGetWeights interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_ModelGetWeights0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_ModelGetWeights0100 start====");
          let result: number = mindsporendk.ModelGetWeightsTest_001();
          console.info(`====>testOH_AI_ModelGetWeights0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_ModelGetWeights0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_ModelUpdateWeights_0100
       * @tc.name       : testOH_AI_ModelUpdateWeights0100
       * @tc.desc       : testing OH_AI_ModelUpdateWeights interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_ModelUpdateWeights0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_ModelUpdateWeights0100 start====");
          let result: number = mindsporendk.ModelUpdateWeightsTest_001();
          console.info(`====>testOH_AI_ModelUpdateWeights0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_ModelUpdateWeights0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_ModelGetTrainMode_0100
       * @tc.name       : testOH_AI_ModelGetTrainMode0100
       * @tc.desc       : testing OH_AI_ModelGetTrainMode interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_ModelGetTrainMode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_ModelGetTrainMode0100 start====");
          let result: number = mindsporendk.ModelGetTrainModeTest_001();
          console.info(`====>testOH_AI_ModelGetTrainMode0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_ModelGetTrainMode0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_ModelSetTrainMode_0100
       * @tc.name       : testOH_AI_ModelSetTrainMode0100
       * @tc.desc       : testing OH_AI_ModelSetTrainMode interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_ModelSetTrainMode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_ModelSetTrainMode0100 start====");
          let result: number = mindsporendk.ModelSetTrainModeTest_001();
          console.info(`====>testOH_AI_ModelSetTrainMode0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_ModelSetTrainMode0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_ModelSetupVirtualBatch_0100
       * @tc.name       : testOH_AI_ModelSetupVirtualBatch0100
       * @tc.desc       : testing OH_AI_ModelSetupVirtualBatch interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_ModelSetupVirtualBatch0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_ModelSetupVirtualBatch0100 start====");
          let result: number = mindsporendk.ModelSetupVirtualBatchTest_001();
          console.info(`====>testOH_AI_ModelSetupVirtualBatch0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_ModelSetupVirtualBatch0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_ExportModel_0100
       * @tc.name       : testOH_AI_ExportModel0100
       * @tc.desc       : testing OH_AI_ExportModel interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_ExportModel0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let file1 = fs.openSync("/data/storage/el2/base/files/lenet_train_infer.ms", fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        try {
          console.info("====>testOH_AI_ExportModel0100 start====");
          let result: number = mindsporendk.ExportModelTest_001();
          console.info(`====>testOH_AI_ExportModel0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_ExportModel0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_ExportModelBuffer_0100
       * @tc.name       : testOH_AI_ExportModelBuffer0100
       * @tc.desc       : testing OH_AI_ExportModelBuffer interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_ExportModelBuffer0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_ExportModelBuffer0100 start====");
          let result: number = mindsporendk.ExportModelBufferTest_001();
          console.info(`====>testOH_AI_ExportModelBuffer0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_ExportModelBuffer0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_ExportWeightsCollaborateWithMicro_0100
       * @tc.name       : testOH_AI_ExportWeightsCollaborateWithMicro0100
       * @tc.desc       : testing OH_AI_ExportWeightsCollaborateWithMicro interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_ExportWeightsCollaborateWithMicro0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        let file = fs.openSync("/data/storage/el2/base/files/xiaoyi_train_codegen_net1.bin", fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        try {
          console.info("====>testOH_AI_ExportWeightsCollaborateWithMicro0100 start====");
          let result: number = mindsporendk.ExportWeightsCollaborateTest_001();
          console.info(`====>testOH_AI_ExportWeightsCollaborateWithMicro0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_ExportWeightsCollaborateWithMicro0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_AI_MINDSPORE_OH_AI_ModelLoadConfig_0100
       * @tc.name       : testOH_AI_ModelLoadConfig0100
       * @tc.desc       : testing OH_AI_ModelLoadConfig interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOH_AI_ModelLoadConfig0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      let file = fs.openSync("/data/storage/el2/base/files/ml_face_isface.config", fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.writeSync(file.fd, 'sssss');
        try {
          console.info("====>testOH_AI_ModelLoadConfig0100 start====");
          let result: number = mindsporendk.ModelLoadConfigTest_001();
          console.info(`====>testOH_AI_ModelLoadConfig0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_ModelLoadConfig0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

  })
}