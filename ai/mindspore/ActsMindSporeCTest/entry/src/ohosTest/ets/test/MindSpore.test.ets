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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import libMindSpore from 'libmindspore.so';
import Utils, { Log } from './Utils.test';

const fileArr = [
  "aiy_vision_classifier_plants_V1_3.ms",
  "aiy_vision_classifier_plants_V1_3_offline_model.ms",
  "aiy_vision_classifier_plants_V1_3.input",
  "aiy_vision_classifier_plants_V1_3_0.input",
  "aiy_vision_classifier_plants_V1_30.output",
  "ml_face_isface.ms",
  "ml_face_isface_r13.ms",
  "ml_face_isface_offline_model.ms",
  "ml_face_isface.input",
  "ml_face_isface_0.input",
  "ml_face_isface0.output",
  "ml_Hand_deploy.ms",
  "ml_Hand_deploy_0.input",
  "ml_Hand_deploy0.output",
  "ml_ocr_cn.ms",
  "ml_ocr_cn_offline_model.ms",
  "ml_ocr_cn_0.input",
  "ml_ocr_cn0.output",
  "ml_headpose_pb2tflite.ms",
  "ml_headpose_pb2tflite_offline_model.ms",
  "ml_headpose_pb2tflite_0.input",
  "ml_headpose_pb2tflite_1.input",
  "ml_headpose_pb2tflite_2.input",
  "ml_headpose_pb2tflite0.output",
  "tinynet.om.ms",
  "lenet_train.ms",
  "lenet_train_0.input",
  "lenet_train_1.input",
  "lenet_train_infer_0.input",
  "lenet_train_infer_1.input",
  "lenet_train_infer0.output",
  "lenet_train_train_0.input",
  "lenet_train_train_1.input",
  "xiaoyi_train_codegen.ms",
  "test_model_0.input",
  "test_model0.output",
  "test_model.om.ms",
  "test_model_param",
  "ml_face_isface.om.ms",
  "ml_face_isface_quant_0.input",
  "ml_face_isface_quant0.output",
  "ml_face_isface_quant.ms",
  "invalid_content.config",
  "ml_face_isface.config",
  "two_add_operators.ms",
  "two_add_operators_0.input",
  "two_add_operators_1.input",
  "two_add_operators_config.json",
  "two_add_operators_config_error.json"
]


export default function MindSporeTest() {
  describe('ActsMindSporeTest', () => {
    beforeAll(async () => {
      let context = getContext()
      for (let i = 0; i < fileArr.length; i++) {
        const fileName = fileArr[i];
        Utils.copyRawfileToFilesDirSync(fileName, context);
      }
      Log.info(`[rawfile_copy_to_sandbox] sandbox path: ${context.filesDir}/`);
      await Utils.sleep(500)
    })

    beforeEach(async () => {
      let context = getContext()
      for (let i = 0; i < fileArr.length; i++) {
        const fileName = fileArr[i];
        if (Utils.fileCheckSync(fileName, context)) {
          Log.info(`MindSporeDemo ${fileName} file exists`);
        } else {
          Log.info(`MindSporeDemo ${fileName} file does not exists!`);
        }
      }
      await Utils.sleep(500)
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
     * @tc.name   SUB_AI_MindSpore_Train_UpdateWeights_0001
     * @tc.number SUB_AI_MindSpore_Train_UpdateWeights_0001
     * @tc.desc   SUB_AI_MindSpore_Train_UpdateWeights_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_UpdateWeights_0001', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_UpdateWeights(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_UpdateWeights_0002
     * @tc.number SUB_AI_MindSpore_Train_UpdateWeights_0002
     * @tc.desc   SUB_AI_MindSpore_Train_UpdateWeights_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_UpdateWeights_0002', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_UpdateWeights(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_UpdateWeights_0003
     * @tc.number SUB_AI_MindSpore_Train_UpdateWeights_0003
     * @tc.desc   SUB_AI_MindSpore_Train_UpdateWeights_0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_UpdateWeights_0003', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_UpdateWeights(2);
      expect(result).assertEqual(0);
    })
    /**
     * @tc.name   SUB_AI_MindSpore_Train_UpdateWeights_0004
     * @tc.number SUB_AI_MindSpore_Train_UpdateWeights_0004
     * @tc.desc   SUB_AI_MindSpore_Train_UpdateWeights_0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_UpdateWeights_0004', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_UpdateWeights(3);
      expect(result).assertEqual(0);
    })
    /**
     * @tc.name   SUB_AI_MindSpore_Train_UpdateWeights_0005
     * @tc.number SUB_AI_MindSpore_Train_UpdateWeights_0005
     * @tc.desc   SUB_AI_MindSpore_Train_UpdateWeights_0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_UpdateWeights_0005', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_UpdateWeights(4);
      expect(result).assertEqual(0);
    })
    /**
     * @tc.name   SUB_AI_MindSpore_Train_UpdateWeights_0006
     * @tc.number SUB_AI_MindSpore_Train_UpdateWeights_0006
     * @tc.desc   SUB_AI_MindSpore_Train_UpdateWeights_0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_UpdateWeights_0006', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_UpdateWeights(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_SetLearningRate_0001
     * @tc.number SUB_AI_MindSpore_Train_SetLearningRate_0001
     * @tc.desc   SUB_AI_MindSpore_Train_SetLearningRate_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_SetLearningRate_0001', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_SetLearningRate(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_SetLearningRate_0002
     * @tc.number SUB_AI_MindSpore_Train_SetLearningRate_0002
     * @tc.desc   SUB_AI_MindSpore_Train_SetLearningRate_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_SetLearningRate_0002', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_SetLearningRate(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_SetupVirtualBatch_0001
     * @tc.number SUB_AI_MindSpore_Train_SetupVirtualBatch_0001
     * @tc.desc   SUB_AI_MindSpore_Train_SetupVirtualBatch_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_SetupVirtualBatch_0001', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_SetupVirtualBatch(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_SetOptimizationLevel_0001
     * @tc.number SUB_AI_MindSpore_Train_SetOptimizationLevel_0001
     * @tc.desc   SUB_AI_MindSpore_Train_SetOptimizationLevel_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_SetOptimizationLevel_0001', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_SetOptimizationLevel(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_TrainCfg_0001
     * @tc.number SUB_AI_MindSpore_Train_TrainCfg_0001
     * @tc.desc   SUB_AI_MindSpore_Train_TrainCfg_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_TrainCfg_0001', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_TrainCfg(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_TrainCfg_0002
     * @tc.number SUB_AI_MindSpore_Train_TrainCfg_0002
     * @tc.desc   SUB_AI_MindSpore_Train_TrainCfg_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_TrainCfg_0002', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_TrainCfg(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_TrainCfg_0003
     * @tc.number SUB_AI_MindSpore_Train_TrainCfg_0003
     * @tc.desc   SUB_AI_MindSpore_Train_TrainCfg_0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_TrainCfg_0003', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_TrainCfg(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_TrainCfg_0004
     * @tc.number SUB_AI_MindSpore_Train_TrainCfg_0004
     * @tc.desc   SUB_AI_MindSpore_Train_TrainCfg_0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_TrainCfg_0004', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_TrainCfg(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ModelBuild_0001
     * @tc.number SUB_AI_MindSpore_Train_ModelBuild_0001
     * @tc.desc   SUB_AI_MindSpore_Train_ModelBuild_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ModelBuild_0001', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ModelBuild(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ModelBuild_0002
     * @tc.number SUB_AI_MindSpore_Train_ModelBuild_0002
     * @tc.desc   SUB_AI_MindSpore_Train_ModelBuild_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ModelBuild_0002', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ModelBuild(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ModelBuild_0003
     * @tc.number SUB_AI_MindSpore_Train_ModelBuild_0003
     * @tc.desc   SUB_AI_MindSpore_Train_ModelBuild_0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ModelBuild_0003', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ModelBuild(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ModelBuild_0004
     * @tc.number SUB_AI_MindSpore_Train_ModelBuild_0004
     * @tc.desc   SUB_AI_MindSpore_Train_ModelBuild_0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ModelBuild_0004', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ModelBuild(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ModelBuild_0005
     * @tc.number SUB_AI_MindSpore_Train_ModelBuild_0005
     * @tc.desc   SUB_AI_MindSpore_Train_ModelBuild_0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ModelBuild_0005', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ModelBuild(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportModel_0001
     * @tc.number SUB_AI_MindSpore_Train_ExportModel_0001
     * @tc.desc   SUB_AI_MindSpore_Train_ExportModel_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportModel_0001', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportModel(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportModel_0002
     * @tc.number SUB_AI_MindSpore_Train_ExportModel_0002
     * @tc.desc   SUB_AI_MindSpore_Train_ExportModel_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportModel_0002', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportModel(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportModel_0003
     * @tc.number SUB_AI_MindSpore_Train_ExportModel_0003
     * @tc.desc   SUB_AI_MindSpore_Train_ExportModel_0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportModel_0003', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportModel(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportModel_0004
     * @tc.number SUB_AI_MindSpore_Train_ExportModel_0004
     * @tc.desc   SUB_AI_MindSpore_Train_ExportModel_0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportModel_0004', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportModel(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportModel_0005
     * @tc.number SUB_AI_MindSpore_Train_ExportModel_0005
     * @tc.desc   SUB_AI_MindSpore_Train_ExportModel_0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportModel_0005', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportModel(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportModel_0006
     * @tc.number SUB_AI_MindSpore_Train_ExportModel_0006
     * @tc.desc   SUB_AI_MindSpore_Train_ExportModel_0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportModel_0006', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportModel(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportModel_0007
     * @tc.number SUB_AI_MindSpore_Train_ExportModel_0007
     * @tc.desc   SUB_AI_MindSpore_Train_ExportModel_0007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportModel_0007', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportModel(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportModel_0008
     * @tc.number SUB_AI_MindSpore_Train_ExportModel_0008
     * @tc.desc   SUB_AI_MindSpore_Train_ExportModel_0008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportModel_0008', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportModel(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportModel_0009
     * @tc.number SUB_AI_MindSpore_Train_ExportModel_0009
     * @tc.desc   SUB_AI_MindSpore_Train_ExportModel_0009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportModel_0009', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportModel(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportModel_0010
     * @tc.number SUB_AI_MindSpore_Train_ExportModel_0010
     * @tc.desc   SUB_AI_MindSpore_Train_ExportModel_0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportModel_0010', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportModel(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportModel_0011
     * @tc.number SUB_AI_MindSpore_Train_ExportModel_0011
     * @tc.desc   SUB_AI_MindSpore_Train_ExportModel_0011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportModel_0011', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportModel(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportModel_0012
     * @tc.number SUB_AI_MindSpore_Train_ExportModel_0012
     * @tc.desc   SUB_AI_MindSpore_Train_ExportModel_0012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportModel_0012', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportModel(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportModel_0013
     * @tc.number SUB_AI_MindSpore_Train_ExportModel_0013
     * @tc.desc   SUB_AI_MindSpore_Train_ExportModel_0013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportModel_0013', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportModel(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportModel_0014
     * @tc.number SUB_AI_MindSpore_Train_ExportModel_0014
     * @tc.desc   SUB_AI_MindSpore_Train_ExportModel_0014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportModel_0014', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportModel(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportWeights_0001
     * @tc.number SUB_AI_MindSpore_Train_ExportWeights_0001
     * @tc.desc   SUB_AI_MindSpore_Train_ExportWeights_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportWeights_0001', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportWeights(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportWeights_0002
     * @tc.number SUB_AI_MindSpore_Train_ExportWeights_0002
     * @tc.desc   SUB_AI_MindSpore_Train_ExportWeights_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportWeights_0002', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportWeights(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportWeights_0003
     * @tc.number SUB_AI_MindSpore_Train_ExportWeights_0003
     * @tc.desc   SUB_AI_MindSpore_Train_ExportWeights_0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportWeights_0003', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportWeights(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportWeights_0004
     * @tc.number SUB_AI_MindSpore_Train_ExportWeights_0004
     * @tc.desc   SUB_AI_MindSpore_Train_ExportWeights_0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportWeights_0004', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportWeights(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportWeights_0005
     * @tc.number SUB_AI_MindSpore_Train_ExportWeights_0005
     * @tc.desc   SUB_AI_MindSpore_Train_ExportWeights_0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportWeights_0005', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportWeights(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_Train_ExportWeights_0006
     * @tc.number SUB_AI_MindSpore_Train_ExportWeights_0006
     * @tc.desc   SUB_AI_MindSpore_Train_ExportWeights_0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Train_ExportWeights_0006', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Train_ExportWeights(5);
      expect(result).assertEqual(0);
    })

    // Context related test cases
    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0001
     * @tc.number SUB_AI_MindSpore_ContextCreate_0001
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0001', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0002
     * @tc.number SUB_AI_MindSpore_ContextCreate_0002
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0002', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0003
     * @tc.number SUB_AI_MindSpore_ContextCreate_0003
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0003', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0004
     * @tc.number SUB_AI_MindSpore_ContextCreate_0004
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0004', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0005
     * @tc.number SUB_AI_MindSpore_ContextCreate_0005
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0005', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0006
     * @tc.number SUB_AI_MindSpore_ContextCreate_0006
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0006', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0007
     * @tc.number SUB_AI_MindSpore_ContextCreate_0007
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0007', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0008
     * @tc.number SUB_AI_MindSpore_ContextCreate_0008
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0008', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0009
     * @tc.number SUB_AI_MindSpore_ContextCreate_0009
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0009', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0010
     * @tc.number SUB_AI_MindSpore_ContextCreate_0010
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0010', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0011
     * @tc.number SUB_AI_MindSpore_ContextCreate_0011
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0011', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0012
     * @tc.number SUB_AI_MindSpore_ContextCreate_0012
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0012', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0013
     * @tc.number SUB_AI_MindSpore_ContextCreate_0013
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0013', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0014
     * @tc.number SUB_AI_MindSpore_ContextCreate_0014
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0014', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0015
     * @tc.number SUB_AI_MindSpore_ContextCreate_0015
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0015
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0015', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0016
     * @tc.number SUB_AI_MindSpore_ContextCreate_0016
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0016', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0017
     * @tc.number SUB_AI_MindSpore_ContextCreate_0017
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0017
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0017', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0018
     * @tc.number SUB_AI_MindSpore_ContextCreate_0018
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0018', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0019
     * @tc.number SUB_AI_MindSpore_ContextCreate_0019
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0019
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0019', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(18);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0020
     * @tc.number SUB_AI_MindSpore_ContextCreate_0020
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0020', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(19);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0021
     * @tc.number SUB_AI_MindSpore_ContextCreate_0021
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0021
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0021', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(20);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0022
     * @tc.number SUB_AI_MindSpore_ContextCreate_0022
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0022
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0022', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(21);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0023
     * @tc.number SUB_AI_MindSpore_ContextCreate_0023
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0023
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0023', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(22);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0024
     * @tc.number SUB_AI_MindSpore_ContextCreate_0024
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0024
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0024', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(23);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0025
     * @tc.number SUB_AI_MindSpore_ContextCreate_0025
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0025
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0025', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(24);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0026
     * @tc.number SUB_AI_MindSpore_ContextCreate_0026
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0026
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0026', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(25);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0027
     * @tc.number SUB_AI_MindSpore_ContextCreate_0027
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0027
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0027', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(26);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0028
     * @tc.number SUB_AI_MindSpore_ContextCreate_0028
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0028
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0028', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(27);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0029
     * @tc.number SUB_AI_MindSpore_ContextCreate_0029
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0029
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0029', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(28);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0030
     * @tc.number SUB_AI_MindSpore_ContextCreate_0030
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0030
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0030', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(29);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0031
     * @tc.number SUB_AI_MindSpore_ContextCreate_0031
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0031
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0031', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(30);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0032
     * @tc.number SUB_AI_MindSpore_ContextCreate_0032
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0032
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0032', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(31);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0033
     * @tc.number SUB_AI_MindSpore_ContextCreate_0033
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0033
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0033', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(32);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0034
     * @tc.number SUB_AI_MindSpore_ContextCreate_0034
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0034
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0034', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(33);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0035
     * @tc.number SUB_AI_MindSpore_ContextCreate_0035
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0035
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0035', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(34);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0036
     * @tc.number SUB_AI_MindSpore_ContextCreate_0036
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0036
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0036', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(35);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0037
     * @tc.number SUB_AI_MindSpore_ContextCreate_0037
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0037
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0037', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(36);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0038
     * @tc.number SUB_AI_MindSpore_ContextCreate_0038
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0038
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0038', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(37);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0039
     * @tc.number SUB_AI_MindSpore_ContextCreate_0039
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0039
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0039', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(38);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0040
     * @tc.number SUB_AI_MindSpore_ContextCreate_0040
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0040
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0040', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(39);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0041
     * @tc.number SUB_AI_MindSpore_ContextCreate_0041
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0041
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0041', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(40);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0042
     * @tc.number SUB_AI_MindSpore_ContextCreate_0042
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0042
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0042', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(41);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0043
     * @tc.number SUB_AI_MindSpore_ContextCreate_0043
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0043
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0043', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(42);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0044
     * @tc.number SUB_AI_MindSpore_ContextCreate_0044
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0044
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0044', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(43);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0045
     * @tc.number SUB_AI_MindSpore_ContextCreate_0045
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0045
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0045', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(44);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0046
     * @tc.number SUB_AI_MindSpore_ContextCreate_0046
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0046
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0046', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(45);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0047
     * @tc.number SUB_AI_MindSpore_ContextCreate_0047
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0047', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(46);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0048
     * @tc.number SUB_AI_MindSpore_ContextCreate_0048
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0048', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(47);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0049
     * @tc.number SUB_AI_MindSpore_ContextCreate_0049
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0049
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0049', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(48);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0050
     * @tc.number SUB_AI_MindSpore_ContextCreate_0050
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0050', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(49);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0051
     * @tc.number SUB_AI_MindSpore_ContextCreate_0051
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0051
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0051', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(50);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0052
     * @tc.number SUB_AI_MindSpore_ContextCreate_0052
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0052
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0052', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(51);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0053
     * @tc.number SUB_AI_MindSpore_ContextCreate_0053
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0053
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0053', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(52);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0054
     * @tc.number SUB_AI_MindSpore_ContextCreate_0054
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0054
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0054', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(53);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0055
     * @tc.number SUB_AI_MindSpore_ContextCreate_0055
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0055
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0055', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(54);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0056
     * @tc.number SUB_AI_MindSpore_ContextCreate_0056
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0056
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0056', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(55);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0057
     * @tc.number SUB_AI_MindSpore_ContextCreate_0057
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0057
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0057', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(56);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0058
     * @tc.number SUB_AI_MindSpore_ContextCreate_0058
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0058
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0058', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(57);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0059
     * @tc.number SUB_AI_MindSpore_ContextCreate_0059
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0059
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0059', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(58);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0060
     * @tc.number SUB_AI_MindSpore_ContextCreate_0060
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0060
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0060', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(59);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0061
     * @tc.number SUB_AI_MindSpore_ContextCreate_0061
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0061
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0061', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(60);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0062
     * @tc.number SUB_AI_MindSpore_ContextCreate_0062
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0062
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0062', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(61);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0063
     * @tc.number SUB_AI_MindSpore_ContextCreate_0063
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0063
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0063', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(62);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0064
     * @tc.number SUB_AI_MindSpore_ContextCreate_0064
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0064
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0064', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(63);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0065
     * @tc.number SUB_AI_MindSpore_ContextCreate_0065
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0065
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0065', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(64);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextCreate_0066
     * @tc.number SUB_AI_MindSpore_ContextCreate_0066
     * @tc.desc   SUB_AI_MindSpore_ContextCreate_0066
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextCreate_0066', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextCreate(65);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextDestroy_0001
     * @tc.number SUB_AI_MindSpore_ContextDestroy_0001
     * @tc.desc   SUB_AI_MindSpore_ContextDestroy_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextDestroy_0001', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextDestroy(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ContextDestroy_0002
     * @tc.number SUB_AI_MindSpore_ContextDestroy_0002
     * @tc.desc   SUB_AI_MindSpore_ContextDestroy_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ContextDestroy_0002', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ContextDestroy(1);
      expect(result).assertEqual(0);
    })

    // Model related test cases
    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0001
     * @tc.number SUB_AI_MindSpore_ModelCreate_0001
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0001', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0002
     * @tc.number SUB_AI_MindSpore_ModelCreate_0002
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0002', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0003
     * @tc.number SUB_AI_MindSpore_ModelCreate_0003
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0003', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0005
     * @tc.number SUB_AI_MindSpore_ModelCreate_0005
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0005', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0006
     * @tc.number SUB_AI_MindSpore_ModelCreate_0006
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0006', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0007
     * @tc.number SUB_AI_MindSpore_ModelCreate_0007
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0007', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0008
     * @tc.number SUB_AI_MindSpore_ModelCreate_0008
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0008', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0009
     * @tc.number SUB_AI_MindSpore_ModelCreate_0009
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0009', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0010
     * @tc.number SUB_AI_MindSpore_ModelCreate_0010
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0010', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0011
     * @tc.number SUB_AI_MindSpore_ModelCreate_0011
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0011', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0012
     * @tc.number SUB_AI_MindSpore_ModelCreate_0012
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0012', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0013
     * @tc.number SUB_AI_MindSpore_ModelCreate_0013
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0013', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0014
     * @tc.number SUB_AI_MindSpore_ModelCreate_0014
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0014', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0015
     * @tc.number SUB_AI_MindSpore_ModelCreate_0015
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0015
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0015', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0016
     * @tc.number SUB_AI_MindSpore_ModelCreate_0016
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0016', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0017
     * @tc.number SUB_AI_MindSpore_ModelCreate_0017
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0017
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0017', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0018
     * @tc.number SUB_AI_MindSpore_ModelCreate_0018
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0018', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0019
     * @tc.number SUB_AI_MindSpore_ModelCreate_0019
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0019
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0019', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0020
     * @tc.number SUB_AI_MindSpore_ModelCreate_0020
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0020', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(18);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0021
     * @tc.number SUB_AI_MindSpore_ModelCreate_0021
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0021
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0021', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(19);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0022
     * @tc.number SUB_AI_MindSpore_ModelCreate_0022
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0022
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0022', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(20);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0027
     * @tc.number SUB_AI_MindSpore_ModelCreate_0027
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0027
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0027', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(21);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0028
     * @tc.number SUB_AI_MindSpore_ModelCreate_0028
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0028
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0028', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(22);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0029
     * @tc.number SUB_AI_MindSpore_ModelCreate_0029
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0029
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0029', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(23);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0030
     * @tc.number SUB_AI_MindSpore_ModelCreate_0030
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0030
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0030', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(24);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0031
     * @tc.number SUB_AI_MindSpore_ModelCreate_0031
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0031
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0031', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(25);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0032
     * @tc.number SUB_AI_MindSpore_ModelCreate_0032
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0032
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0032', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(26);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0033
     * @tc.number SUB_AI_MindSpore_ModelCreate_0033
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0033
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0033', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(27);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0034
     * @tc.number SUB_AI_MindSpore_ModelCreate_0034
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0034
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0034', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(28);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0035
     * @tc.number SUB_AI_MindSpore_ModelCreate_0035
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0035
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0035', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(29);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0036
     * @tc.number SUB_AI_MindSpore_ModelCreate_0036
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0036
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0036', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(30);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0037
     * @tc.number SUB_AI_MindSpore_ModelCreate_0037
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0037
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0037', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(31);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0038
     * @tc.number SUB_AI_MindSpore_ModelCreate_0038
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0038
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0038', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(32);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0039
     * @tc.number SUB_AI_MindSpore_ModelCreate_0039
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0039
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0039', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(33);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0040
     * @tc.number SUB_AI_MindSpore_ModelCreate_0040
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0040
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0040', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(34);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0041
     * @tc.number SUB_AI_MindSpore_ModelCreate_0041
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0041
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0041', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(35);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelCreate_0042
     * @tc.number SUB_AI_MindSpore_ModelCreate_0042
     * @tc.desc   SUB_AI_MindSpore_ModelCreate_0042
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelCreate_0042', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelCreate(36);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelLoadConfig_0001
     * @tc.number SUB_AI_MindSpore_ModelLoadConfig_0001
     * @tc.desc   SUB_AI_MindSpore_ModelLoadConfig_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelLoadConfig_0001', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelLoadConfig(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelLoadConfig_0002
     * @tc.number SUB_AI_MindSpore_ModelLoadConfig_0002
     * @tc.desc   SUB_AI_MindSpore_ModelLoadConfig_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelLoadConfig_0002', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelLoadConfig(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelLoadConfig_0003
     * @tc.number SUB_AI_MindSpore_ModelLoadConfig_0003
     * @tc.desc   SUB_AI_MindSpore_ModelLoadConfig_0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelLoadConfig_0003', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelLoadConfig(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_ModelLoadConfig_0004
     * @tc.number SUB_AI_MindSpore_ModelLoadConfig_0004
     * @tc.desc   SUB_AI_MindSpore_ModelLoadConfig_0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_ModelLoadConfig_0004', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_ModelLoadConfig(3);
      expect(result).assertEqual(0);
    })

    // Other
    /**
     * @tc.name   SUB_AI_MindSpore_Covered_0001
     * @tc.number SUB_AI_MindSpore_Covered_0001
     * @tc.desc   SUB_AI_MindSpore_Covered_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_Covered_0001', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_Covered(0);
      expect(result).assertEqual(0);
    })

    // NNRT copy_free related test cases
    /**
     * @tc.name   SUB_AI_MindSpore_NNRT_copy_free_0001
     * @tc.number SUB_AI_MindSpore_NNRT_copy_free_0001
     * @tc.desc   SUB_AI_MindSpore_NNRT_copy_free_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_NNRT_copy_free_0001', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_NNRT_copy_free(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_NNRT_copy_free_0002
     * @tc.number SUB_AI_MindSpore_NNRT_copy_free_0002
     * @tc.desc   SUB_AI_MindSpore_NNRT_copy_free_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_NNRT_copy_free_0002', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_NNRT_copy_free(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_NNRT_copy_free_0003
     * @tc.number SUB_AI_MindSpore_NNRT_copy_free_0003
     * @tc.desc   SUB_AI_MindSpore_NNRT_copy_free_0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_NNRT_copy_free_0003', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_NNRT_copy_free(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_NNRT_copy_free_0004
     * @tc.number SUB_AI_MindSpore_NNRT_copy_free_0004
     * @tc.desc   SUB_AI_MindSpore_NNRT_copy_free_0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_NNRT_copy_free_0004', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_NNRT_copy_free(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_NNRT_copy_free_0005
     * @tc.number SUB_AI_MindSpore_NNRT_copy_free_0005
     * @tc.desc   SUB_AI_MindSpore_NNRT_copy_free_0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_NNRT_copy_free_0005', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_NNRT_copy_free(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_NNRT_copy_free_0006
     * @tc.number SUB_AI_MindSpore_NNRT_copy_free_0006
     * @tc.desc   SUB_AI_MindSpore_NNRT_copy_free_0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_NNRT_copy_free_0006', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_NNRT_copy_free(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_NNRT_copy_free_0007
     * @tc.number SUB_AI_MindSpore_NNRT_copy_free_0007
     * @tc.desc   SUB_AI_MindSpore_NNRT_copy_free_0007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_NNRT_copy_free_0007', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_NNRT_copy_free(6);
      expect(result).assertEqual(0);
    })

    // CPU copy_free related test cases
    /**
     * @tc.name   SUB_AI_MindSpore_CPU_copy_free_0001
     * @tc.number SUB_AI_MindSpore_CPU_copy_free_0001
     * @tc.desc   SUB_AI_MindSpore_CPU_copy_free_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_CPU_copy_free_0001', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_CPU_copy_free(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_CPU_copy_free_0002
     * @tc.number SUB_AI_MindSpore_CPU_copy_free_0002
     * @tc.desc   SUB_AI_MindSpore_CPU_copy_free_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_CPU_copy_free_0002', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_CPU_copy_free(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_CPU_copy_free_0003
     * @tc.number SUB_AI_MindSpore_CPU_copy_free_0003
     * @tc.desc   SUB_AI_MindSpore_CPU_copy_free_0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_CPU_copy_free_0003', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_CPU_copy_free(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_CPU_copy_free_0004
     * @tc.number SUB_AI_MindSpore_CPU_copy_free_0004
     * @tc.desc   SUB_AI_MindSpore_CPU_copy_free_0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_CPU_copy_free_0004', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_CPU_copy_free(3);
      expect(result).assertEqual(0);
    })

    // HIAI OfflineModel related test cases
    /**
     * @tc.name   SUB_AI_MindSpore_HIAI_OfflineModel_0004
     * @tc.number SUB_AI_MindSpore_HIAI_OfflineModel_0004
     * @tc.desc   SUB_AI_MindSpore_HIAI_OfflineModel_0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_HIAI_OfflineModel_0004', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_HIAI_OfflineModel(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_HIAI_OfflineModel_0005
     * @tc.number SUB_AI_MindSpore_HIAI_OfflineModel_0005
     * @tc.desc   SUB_AI_MindSpore_HIAI_OfflineModel_0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_HIAI_OfflineModel_0005', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_HIAI_OfflineModel(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_HIAI_OfflineModel_0006
     * @tc.number SUB_AI_MindSpore_HIAI_OfflineModel_0006
     * @tc.desc   SUB_AI_MindSpore_HIAI_OfflineModel_0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_HIAI_OfflineModel_0006', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_HIAI_OfflineModel(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_HIAI_OfflineModel_0007
     * @tc.number SUB_AI_MindSpore_HIAI_OfflineModel_0007
     * @tc.desc   SUB_AI_MindSpore_HIAI_OfflineModel_0007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_HIAI_OfflineModel_0007', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_HIAI_OfflineModel(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_HIAI_OfflineModel_0008
     * @tc.number SUB_AI_MindSpore_HIAI_OfflineModel_0008
     * @tc.desc   SUB_AI_MindSpore_HIAI_OfflineModel_0008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_HIAI_OfflineModel_0008', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_HIAI_OfflineModel(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_HIAI_OfflineModel_0009
     * @tc.number SUB_AI_MindSpore_HIAI_OfflineModel_0009
     * @tc.desc   SUB_AI_MindSpore_HIAI_OfflineModel_0009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_HIAI_OfflineModel_0009', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_HIAI_OfflineModel(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_HIAI_OfflineModel_0010
     * @tc.number SUB_AI_MindSpore_HIAI_OfflineModel_0010
     * @tc.desc   SUB_AI_MindSpore_HIAI_OfflineModel_0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_HIAI_OfflineModel_0010', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_HIAI_OfflineModel(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_HIAI_OfflineModel_0011
     * @tc.number SUB_AI_MindSpore_HIAI_OfflineModel_0011
     * @tc.desc   SUB_AI_MindSpore_HIAI_OfflineModel_0011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_HIAI_OfflineModel_0011', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_HIAI_OfflineModel(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_HIAI_OfflineModel_0012
     * @tc.number SUB_AI_MindSpore_HIAI_OfflineModel_0012
     * @tc.desc   SUB_AI_MindSpore_HIAI_OfflineModel_0012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_HIAI_OfflineModel_0012', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_HIAI_OfflineModel(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_HIAI_OfflineModel_0013
     * @tc.number SUB_AI_MindSpore_HIAI_OfflineModel_0013
     * @tc.desc   SUB_AI_MindSpore_HIAI_OfflineModel_0013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_HIAI_OfflineModel_0013', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_HIAI_OfflineModel(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_HIAI_OfflineModel_0014
     * @tc.number SUB_AI_MindSpore_HIAI_OfflineModel_0014
     * @tc.desc   SUB_AI_MindSpore_HIAI_OfflineModel_0014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_HIAI_OfflineModel_0014', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_HIAI_OfflineModel(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_HIAI_OfflineModel_0015
     * @tc.number SUB_AI_MindSpore_HIAI_OfflineModel_0015
     * @tc.desc   SUB_AI_MindSpore_HIAI_OfflineModel_0015
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_HIAI_OfflineModel_0015', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_HIAI_OfflineModel(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_HIAI_OfflineModel_0016
     * @tc.number SUB_AI_MindSpore_HIAI_OfflineModel_0016
     * @tc.desc   SUB_AI_MindSpore_HIAI_OfflineModel_0016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_HIAI_OfflineModel_0016', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_HIAI_OfflineModel(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_HIAI_OfflineModel_0017
     * @tc.number SUB_AI_MindSpore_HIAI_OfflineModel_0017
     * @tc.desc   SUB_AI_MindSpore_HIAI_OfflineModel_0017
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_HIAI_OfflineModel_0017', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_HIAI_OfflineModel(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_HIAI_OfflineModel_0018
     * @tc.number SUB_AI_MindSpore_HIAI_OfflineModel_0018
     * @tc.desc   SUB_AI_MindSpore_HIAI_OfflineModel_0018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_HIAI_OfflineModel_0018', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_HIAI_OfflineModel(14);
      expect(result).assertEqual(0);
    })

    // OHOS NNRT
    /**
     * @tc.name   OHOS_NNRT_0001
     * @tc.number OHOS_NNRT_0001
     * @tc.desc   OHOS_NNRT_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_NNRT_0001', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_NNRT(0)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_NNRT_0002
     * @tc.number OHOS_NNRT_0002
     * @tc.desc   OHOS_NNRT_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_NNRT_0002', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_NNRT(1)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_NNRT_0003
     * @tc.number OHOS_NNRT_0003
     * @tc.desc   OHOS_NNRT_0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_NNRT_0003', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_NNRT(2)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_NNRT_0005
     * @tc.number OHOS_NNRT_0005
     * @tc.desc   OHOS_NNRT_0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_NNRT_0005', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_NNRT(3)).assertEqual(0);
    })

    // OHOS NNRT QUANT
    /**
     * @tc.name   OHOS_NNRT_QUANT_0001
     * @tc.number OHOS_NNRT_QUANT_0001
     * @tc.desc   OHOS_NNRT_QUANT_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_NNRT_QUANT_0001', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_NNRT_QUANT(0)).assertEqual(0);
    })

    // Tensor related test cases
    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0001
     * @tc.number SUB_AI_MindSpore_TensorCreate_0001
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0001', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0002
     * @tc.number SUB_AI_MindSpore_TensorCreate_0002
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0002', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0003
     * @tc.number SUB_AI_MindSpore_TensorCreate_0003
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0003', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0004
     * @tc.number SUB_AI_MindSpore_TensorCreate_0004
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0004', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0005
     * @tc.number SUB_AI_MindSpore_TensorCreate_0005
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0005', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0006
     * @tc.number SUB_AI_MindSpore_TensorCreate_0006
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0006', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0007
     * @tc.number SUB_AI_MindSpore_TensorCreate_0007
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0007', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0008
     * @tc.number SUB_AI_MindSpore_TensorCreate_0008
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0008', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0009
     * @tc.number SUB_AI_MindSpore_TensorCreate_0009
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0009', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0010
     * @tc.number SUB_AI_MindSpore_TensorCreate_0010
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0010', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0011
     * @tc.number SUB_AI_MindSpore_TensorCreate_0011
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0011', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0012
     * @tc.number SUB_AI_MindSpore_TensorCreate_0012
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0012', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0013
     * @tc.number SUB_AI_MindSpore_TensorCreate_0013
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0013', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0014
     * @tc.number SUB_AI_MindSpore_TensorCreate_0014
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0014', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0015
     * @tc.number SUB_AI_MindSpore_TensorCreate_0015
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0015
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0015', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0016
     * @tc.number SUB_AI_MindSpore_TensorCreate_0016
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0016', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0017
     * @tc.number SUB_AI_MindSpore_TensorCreate_0017
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0017
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0017', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0018
     * @tc.number SUB_AI_MindSpore_TensorCreate_0018
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0018', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0019
     * @tc.number SUB_AI_MindSpore_TensorCreate_0019
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0019
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0019', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(18);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0020
     * @tc.number SUB_AI_MindSpore_TensorCreate_0020
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0020', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(19);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0021
     * @tc.number SUB_AI_MindSpore_TensorCreate_0021
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0021
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0021', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(20);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0022
     * @tc.number SUB_AI_MindSpore_TensorCreate_0022
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0022
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0022', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(21);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0023
     * @tc.number SUB_AI_MindSpore_TensorCreate_0023
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0023
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0023', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(22);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0024
     * @tc.number SUB_AI_MindSpore_TensorCreate_0024
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0024
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0024', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(23);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0025
     * @tc.number SUB_AI_MindSpore_TensorCreate_0025
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0025
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0025', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(24);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0026
     * @tc.number SUB_AI_MindSpore_TensorCreate_0026
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0026
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0026', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(25);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0027
     * @tc.number SUB_AI_MindSpore_TensorCreate_0027
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0027
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0027', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(26);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0028
     * @tc.number SUB_AI_MindSpore_TensorCreate_0028
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0028
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0028', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(27);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0029
     * @tc.number SUB_AI_MindSpore_TensorCreate_0029
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0029
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0029', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(28);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0030
     * @tc.number SUB_AI_MindSpore_TensorCreate_0030
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0030
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0030', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(29);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0031
     * @tc.number SUB_AI_MindSpore_TensorCreate_0031
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0031
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0031', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(30);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0032
     * @tc.number SUB_AI_MindSpore_TensorCreate_0032
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0032
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0032', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(31);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0033
     * @tc.number SUB_AI_MindSpore_TensorCreate_0033
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0033
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0033', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(32);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0034
     * @tc.number SUB_AI_MindSpore_TensorCreate_0034
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0034
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0034', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(33);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0035
     * @tc.number SUB_AI_MindSpore_TensorCreate_0035
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0035
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0035', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(34);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0036
     * @tc.number SUB_AI_MindSpore_TensorCreate_0036
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0036
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0036', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(35);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0037
     * @tc.number SUB_AI_MindSpore_TensorCreate_0037
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0037
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0037', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(36);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0038
     * @tc.number SUB_AI_MindSpore_TensorCreate_0038
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0038
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0038', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(37);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0039
     * @tc.number SUB_AI_MindSpore_TensorCreate_0039
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0039
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0039', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(38);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0040
     * @tc.number SUB_AI_MindSpore_TensorCreate_0040
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0040
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0040', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(39);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0041
     * @tc.number SUB_AI_MindSpore_TensorCreate_0041
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0041
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0041', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(40);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0042
     * @tc.number SUB_AI_MindSpore_TensorCreate_0042
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0042
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0042', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(41);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0043
     * @tc.number SUB_AI_MindSpore_TensorCreate_0043
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0043
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0043', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(42);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0044
     * @tc.number SUB_AI_MindSpore_TensorCreate_0044
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0044
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0044', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(43);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0045
     * @tc.number SUB_AI_MindSpore_TensorCreate_0045
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0045
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0045', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(44);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0046
     * @tc.number SUB_AI_MindSpore_TensorCreate_0046
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0046
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0046', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(45);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0047
     * @tc.number SUB_AI_MindSpore_TensorCreate_0047
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0047', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(46);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0048
     * @tc.number SUB_AI_MindSpore_TensorCreate_0048
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0048', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(47);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0049
     * @tc.number SUB_AI_MindSpore_TensorCreate_0049
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0049
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0049', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(48);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_TensorCreate_0050
     * @tc.number SUB_AI_MindSpore_TensorCreate_0050
     * @tc.desc   SUB_AI_MindSpore_TensorCreate_0050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_TensorCreate_0050', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_TensorCreate(49);
      expect(result).assertEqual(0);
    })

    // NNRT Cache related test cases
    /**
     * @tc.name   SUB_AI_MindSpore_NNRT_Cache_0001
     * @tc.number SUB_AI_MindSpore_NNRT_Cache_0001
     * @tc.desc   SUB_AI_MindSpore_NNRT_Cache_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_NNRT_Cache_0001', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_NNRT_Cache(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_NNRT_Cache_0002
     * @tc.number SUB_AI_MindSpore_NNRT_Cache_0002
     * @tc.desc   SUB_AI_MindSpore_NNRT_Cache_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_NNRT_Cache_0002', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_NNRT_Cache(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_NNRT_Cache_0003
     * @tc.number SUB_AI_MindSpore_NNRT_Cache_0003
     * @tc.desc   SUB_AI_MindSpore_NNRT_Cache_0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_NNRT_Cache_0003', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_NNRT_Cache(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_NNRT_Cache_0004
     * @tc.number SUB_AI_MindSpore_NNRT_Cache_0004
     * @tc.desc   SUB_AI_MindSpore_NNRT_Cache_0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_NNRT_Cache_0004', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_NNRT_Cache(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_NNRT_Cache_0005
     * @tc.number SUB_AI_MindSpore_NNRT_Cache_0005
     * @tc.desc   SUB_AI_MindSpore_NNRT_Cache_0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_NNRT_Cache_0005', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_NNRT_Cache(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_MindSpore_NNRT_Cache_0006
     * @tc.number SUB_AI_MindSpore_NNRT_Cache_0006
     * @tc.desc   SUB_AI_MindSpore_NNRT_Cache_0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_NNRT_Cache_0006', Level.LEVEL0, () => {
      const result = libMindSpore.SUB_AI_MindSpore_NNRT_Cache(5);
      expect(result).assertEqual(0);
    })

    // OHOS Context CPU
    /**
     * @tc.name   OHOS_Context_CPU_0001
     * @tc.number OHOS_Context_CPU_0001
     * @tc.desc   OHOS_Context_CPU_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Context_CPU_0001', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Context_CPU(0)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Context_CPU_0002
     * @tc.number OHOS_Context_CPU_0002
     * @tc.desc   OHOS_Context_CPU_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Context_CPU_0002', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Context_CPU(1)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Context_CPU_0003
     * @tc.number OHOS_Context_CPU_0003
     * @tc.desc   OHOS_Context_CPU_0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Context_CPU_0003', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Context_CPU(2)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Context_CPU_0004
     * @tc.number OHOS_Context_CPU_0004
     * @tc.desc   OHOS_Context_CPU_0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Context_CPU_0004', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Context_CPU(3)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Context_CPU_0005
     * @tc.number OHOS_Context_CPU_0005
     * @tc.desc   OHOS_Context_CPU_0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Context_CPU_0005', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Context_CPU(4)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Context_CPU_0006
     * @tc.number OHOS_Context_CPU_0006
     * @tc.desc   OHOS_Context_CPU_0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Context_CPU_0006', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Context_CPU(5)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Context_CPU_0007
     * @tc.number OHOS_Context_CPU_0007
     * @tc.desc   OHOS_Context_CPU_0007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Context_CPU_0007', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Context_CPU(6)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Context_CPU_0008
     * @tc.number OHOS_Context_CPU_0008
     * @tc.desc   OHOS_Context_CPU_0008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Context_CPU_0008', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Context_CPU(7)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Context_CPU_0009
     * @tc.number OHOS_Context_CPU_0009
     * @tc.desc   OHOS_Context_CPU_0009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Context_CPU_0009', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Context_CPU(8)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Context_CPU_0010
     * @tc.number OHOS_Context_CPU_0010
     * @tc.desc   OHOS_Context_CPU_0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Context_CPU_0010', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Context_CPU(9)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Context_CPU_0011
     * @tc.number OHOS_Context_CPU_0011
     * @tc.desc   OHOS_Context_CPU_0011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Context_CPU_0011', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Context_CPU(10)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Context_CPU_0012
     * @tc.number OHOS_Context_CPU_0012
     * @tc.desc   OHOS_Context_CPU_0012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Context_CPU_0012', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Context_CPU(11)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Context_CPU_0013
     * @tc.number OHOS_Context_CPU_0013
     * @tc.desc   OHOS_Context_CPU_0013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Context_CPU_0013', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Context_CPU(12)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Context_CPU_0014
     * @tc.number OHOS_Context_CPU_0014
     * @tc.desc   OHOS_Context_CPU_0014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Context_CPU_0014', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Context_CPU(13)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Context_CPU_0015
     * @tc.number OHOS_Context_CPU_0015
     * @tc.desc   OHOS_Context_CPU_0015
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Context_CPU_0015', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Context_CPU(14)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Context_CPU_0016
     * @tc.number OHOS_Context_CPU_0016
     * @tc.desc   OHOS_Context_CPU_0016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Context_CPU_0016', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Context_CPU(15)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Context_CPU_0017
     * @tc.number OHOS_Context_CPU_0017
     * @tc.desc   OHOS_Context_CPU_0017
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Context_CPU_0017', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Context_CPU(16)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Context_CPU_0018
     * @tc.number OHOS_Context_CPU_0018
     * @tc.desc   OHOS_Context_CPU_0018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Context_CPU_0018', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Context_CPU(17)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Context_CPU_0019
     * @tc.number OHOS_Context_CPU_0019
     * @tc.desc   OHOS_Context_CPU_0019
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Context_CPU_0019', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Context_CPU(18)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Context_CPU_0020
     * @tc.number OHOS_Context_CPU_0020
     * @tc.desc   OHOS_Context_CPU_0020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Context_CPU_0020', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Context_CPU(19)).assertEqual(0);
    })

    // OHOS Context NPU
    /**
     * @tc.name   OHOS_Context_NPU_0002
     * @tc.number OHOS_Context_NPU_0002
     * @tc.desc   OHOS_Context_NPU_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Context_NPU_0002', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Context_NPU(0)).assertEqual(0);
    })

    // OHOS Model Build
    /**
     * @tc.name   OHOS_Model_Build_0001
     * @tc.number OHOS_Model_Build_0001
     * @tc.desc   OHOS_Model_Build_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Model_Build_0001', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Model_Build(0)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Model_Build_0002
     * @tc.number OHOS_Model_Build_0002
     * @tc.desc   OHOS_Model_Build_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Model_Build_0002', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Model_Build(1)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Model_Build_0003
     * @tc.number OHOS_Model_Build_0003
     * @tc.desc   OHOS_Model_Build_0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Model_Build_0003', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Model_Build(2)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Model_Build_0004
     * @tc.number OHOS_Model_Build_0004
     * @tc.desc   OHOS_Model_Build_0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Model_Build_0004', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Model_Build(3)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Model_Build_0005
     * @tc.number OHOS_Model_Build_0005
     * @tc.desc   OHOS_Model_Build_0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Model_Build_0005', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Model_Build(4)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Model_Build_0006
     * @tc.number OHOS_Model_Build_0006
     * @tc.desc   OHOS_Model_Build_0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Model_Build_0006', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Model_Build(5)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Model_Build_0007
     * @tc.number OHOS_Model_Build_0007
     * @tc.desc   OHOS_Model_Build_0007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Model_Build_0007', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Model_Build(6)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Model_Build_0008
     * @tc.number OHOS_Model_Build_0008
     * @tc.desc   OHOS_Model_Build_0008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Model_Build_0008', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Model_Build(7)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Model_Build_0009
     * @tc.number OHOS_Model_Build_0009
     * @tc.desc   OHOS_Model_Build_0009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Model_Build_0009', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Model_Build(8)).assertEqual(0);
    })

    // OHOS Model Resize
    /**
     * @tc.name   OHOS_Model_Resize_0001
     * @tc.number OHOS_Model_Resize_0001
     * @tc.desc   OHOS_Model_Resize_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Model_Resize_0001', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Model_Resize(0)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Model_Resize_0002
     * @tc.number OHOS_Model_Resize_0002
     * @tc.desc   OHOS_Model_Resize_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Model_Resize_0002', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Model_Resize(1)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Model_Resize_0003
     * @tc.number OHOS_Model_Resize_0003
     * @tc.desc   OHOS_Model_Resize_0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Model_Resize_0003', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Model_Resize(2)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Model_Resize_0004
     * @tc.number OHOS_Model_Resize_0004
     * @tc.desc   OHOS_Model_Resize_0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Model_Resize_0004', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Model_Resize(3)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Model_Resize_0005
     * @tc.number OHOS_Model_Resize_0005
     * @tc.desc   OHOS_Model_Resize_0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Model_Resize_0005', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Model_Resize(4)).assertEqual(0);
    })

    // OHOS Model Predict
    /**
     * @tc.name   OHOS_Model_Predict_0001
     * @tc.number OHOS_Model_Predict_0001
     * @tc.desc   OHOS_Model_Predict_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Model_Predict_0001', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Model_Predict(0)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Model_Predict_0002
     * @tc.number OHOS_Model_Predict_0002
     * @tc.desc   OHOS_Model_Predict_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Model_Predict_0002', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Model_Predict(1)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Model_Predict_0003
     * @tc.number OHOS_Model_Predict_0003
     * @tc.desc   OHOS_Model_Predict_0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Model_Predict_0003', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Model_Predict(2)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Model_Predict_0004
     * @tc.number OHOS_Model_Predict_0004
     * @tc.desc   OHOS_Model_Predict_0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Model_Predict_0004', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Model_Predict(3)).assertEqual(0);
    })

    // OHOS Model GetInputByTensorName
    /**
     * @tc.name   OHOS_Model_GetInputByTensorName_0001
     * @tc.number OHOS_Model_GetInputByTensorName_0001
     * @tc.desc   OHOS_Model_GetInputByTensorName_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Model_GetInputByTensorName_0001', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Model_GetInputByTensorName(0)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Model_GetInputByTensorName_0002
     * @tc.number OHOS_Model_GetInputByTensorName_0002
     * @tc.desc   OHOS_Model_GetInputByTensorName_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Model_GetInputByTensorName_0002', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Model_GetInputByTensorName(1)).assertEqual(0);
    })

    // OHOS Model GetOutputByTensorName
    /**
     * @tc.name   OHOS_Model_GetOutputByTensorName_0001
     * @tc.number OHOS_Model_GetOutputByTensorName_0001
     * @tc.desc   OHOS_Model_GetOutputByTensorName_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Model_GetOutputByTensorName_0001', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Model_GetOutputByTensorName(0)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Model_GetOutputByTensorName_0002
     * @tc.number OHOS_Model_GetOutputByTensorName_0002
     * @tc.desc   OHOS_Model_GetOutputByTensorName_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Model_GetOutputByTensorName_0002', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Model_GetOutputByTensorName(1)).assertEqual(0);
    })

    // OHOS Tensor Create
    /**
     * @tc.name   OHOS_Tensor_Create_0001
     * @tc.number OHOS_Tensor_Create_0001
     * @tc.desc   OHOS_Tensor_Create_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Tensor_Create_0001', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Tensor_Create(0)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Tensor_Create_0002
     * @tc.number OHOS_Tensor_Create_0002
     * @tc.desc   OHOS_Tensor_Create_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Tensor_Create_0002', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Tensor_Create(1)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Tensor_Create_0003
     * @tc.number OHOS_Tensor_Create_0003
     * @tc.desc   OHOS_Tensor_Create_0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Tensor_Create_0003', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Tensor_Create(2)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Tensor_Create_0004
     * @tc.number OHOS_Tensor_Create_0004
     * @tc.desc   OHOS_Tensor_Create_0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Tensor_Create_0004', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Tensor_Create(3)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Tensor_Create_0005
     * @tc.number OHOS_Tensor_Create_0005
     * @tc.desc   OHOS_Tensor_Create_0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Tensor_Create_0005', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Tensor_Create(4)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Tensor_Create_0006
     * @tc.number OHOS_Tensor_Create_0006
     * @tc.desc   OHOS_Tensor_Create_0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Tensor_Create_0006', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Tensor_Create(5)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Tensor_Create_0007
     * @tc.number OHOS_Tensor_Create_0007
     * @tc.desc   OHOS_Tensor_Create_0007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Tensor_Create_0007', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Tensor_Create(6)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Tensor_Create_0008
     * @tc.number OHOS_Tensor_Create_0008
     * @tc.desc   OHOS_Tensor_Create_0008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Tensor_Create_0008', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Tensor_Create(7)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Tensor_Create_0009
     * @tc.number OHOS_Tensor_Create_0009
     * @tc.desc   OHOS_Tensor_Create_0009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Tensor_Create_0009', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Tensor_Create(8)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Tensor_Create_0010
     * @tc.number OHOS_Tensor_Create_0010
     * @tc.desc   OHOS_Tensor_Create_0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Tensor_Create_0010', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Tensor_Create(9)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Tensor_Create_0011
     * @tc.number OHOS_Tensor_Create_0011
     * @tc.desc   OHOS_Tensor_Create_0011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Tensor_Create_0011', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Tensor_Create(10)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Tensor_Create_0012
     * @tc.number OHOS_Tensor_Create_0012
     * @tc.desc   OHOS_Tensor_Create_0012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Tensor_Create_0012', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Tensor_Create(11)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Tensor_Create_0013
     * @tc.number OHOS_Tensor_Create_0013
     * @tc.desc   OHOS_Tensor_Create_0013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Tensor_Create_0013', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Tensor_Create(12)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Tensor_Create_0014
     * @tc.number OHOS_Tensor_Create_0014
     * @tc.desc   OHOS_Tensor_Create_0014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Tensor_Create_0014', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Tensor_Create(13)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Tensor_Create_0015
     * @tc.number OHOS_Tensor_Create_0015
     * @tc.desc   OHOS_Tensor_Create_0015
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Tensor_Create_0015', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Tensor_Create(14)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Tensor_Create_0016
     * @tc.number OHOS_Tensor_Create_0016
     * @tc.desc   OHOS_Tensor_Create_0016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Tensor_Create_0016', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Tensor_Create(15)).assertEqual(0);
    })

    // OHOS Input
    /**
     * @tc.name   OHOS_Input_0001
     * @tc.number OHOS_Input_0001
     * @tc.desc   OHOS_Input_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Input_0001', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Input(0)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Input_0002
     * @tc.number OHOS_Input_0002
     * @tc.desc   OHOS_Input_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Input_0002', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Input(1)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Input_0003
     * @tc.number OHOS_Input_0003
     * @tc.desc   OHOS_Input_0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Input_0003', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Input(2)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Input_0004
     * @tc.number OHOS_Input_0004
     * @tc.desc   OHOS_Input_0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Input_0004', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Input(3)).assertEqual(0);
    })

    // OHOS Multiple
    /**
     * @tc.name   OHOS_Multiple_0001
     * @tc.number OHOS_Multiple_0001
     * @tc.desc   OHOS_Multiple_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Multiple_0001', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Multiple(0)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Multiple_0002
     * @tc.number OHOS_Multiple_0002
     * @tc.desc   OHOS_Multiple_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Multiple_0002', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Multiple(1)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Multiple_0003
     * @tc.number OHOS_Multiple_0003
     * @tc.desc   OHOS_Multiple_0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Multiple_0003', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Multiple(2)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Multiple_0004
     * @tc.number OHOS_Multiple_0004
     * @tc.desc   OHOS_Multiple_0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Multiple_0004', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Multiple(3)).assertEqual(0);
    })

    // OHOS Parallel
    /**
     * @tc.name   OHOS_Parallel_0001
     * @tc.number OHOS_Parallel_0001
     * @tc.desc   OHOS_Parallel_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Parallel_0001', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Parallel(0)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Parallel_0002
     * @tc.number OHOS_Parallel_0002
     * @tc.desc   OHOS_Parallel_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Parallel_0002', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Parallel(1)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_Parallel_0003
     * @tc.number OHOS_Parallel_0003
     * @tc.desc   OHOS_Parallel_0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Parallel_0003', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Parallel(2)).assertEqual(0);
    })

    // OHOS Compatible
    /**
     * @tc.name   OHOS_Compatible_0001
     * @tc.number OHOS_Compatible_0001
     * @tc.desc   OHOS_Compatible_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_Compatible_0001', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_Compatible(0)).assertEqual(0);
    })

    // OHOS OfflineModel
    /**
     * @tc.name   OHOS_OfflineModel_0001
     * @tc.number OHOS_OfflineModel_0001
     * @tc.desc   OHOS_OfflineModel_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_OfflineModel_0001', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_OfflineModel(0)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_OfflineModel_0002
     * @tc.number OHOS_OfflineModel_0002
     * @tc.desc   OHOS_OfflineModel_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_OfflineModel_0002', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_OfflineModel(1)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_OfflineModel_0004
     * @tc.number OHOS_OfflineModel_0004
     * @tc.desc   OHOS_OfflineModel_0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_OfflineModel_0004', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_OfflineModel(2)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_OfflineModel_0005
     * @tc.number OHOS_OfflineModel_0005
     * @tc.desc   OHOS_OfflineModel_0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_OfflineModel_0005', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_OfflineModel(3)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_OfflineModel_0006
     * @tc.number OHOS_OfflineModel_0006
     * @tc.desc   OHOS_OfflineModel_0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_OfflineModel_0006', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_OfflineModel(4)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_OfflineModel_0007
     * @tc.number OHOS_OfflineModel_0007
     * @tc.desc   OHOS_OfflineModel_0007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_OfflineModel_0007', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_OfflineModel(5)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_OfflineModel_0008
     * @tc.number OHOS_OfflineModel_0008
     * @tc.desc   OHOS_OfflineModel_0008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_OfflineModel_0008', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_OfflineModel(6)).assertEqual(0);
    })
    /**
     * @tc.name   OHOS_OfflineModel_0009
     * @tc.number OHOS_OfflineModel_0009
     * @tc.desc   OHOS_OfflineModel_0009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OHOS_OfflineModel_0009', Level.LEVEL0, () => {
      expect(libMindSpore.OHOS_OfflineModel(7)).assertEqual(0);
    })
    /**
     * @tc.name   SUB_AI_MindSpore_AIPP_0001
     * @tc.number SUB_AI_MindSpore_AIPP_0001
     * @tc.desc   SUB_AI_MindSpore_AIPP_0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_AIPP_0001', Level.LEVEL0, () => {
      expect(libMindSpore.SUB_AI_MindSpore_AIPP(0)).assertEqual(0);
    })
    /**
     * @tc.name   SUB_AI_MindSpore_AIPP_0002
     * @tc.number SUB_AI_MindSpore_AIPP_0002
     * @tc.desc   SUB_AI_MindSpore_AIPP_0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_AIPP_0002', Level.LEVEL0, () => {
      expect(libMindSpore.SUB_AI_MindSpore_AIPP(1)).assertEqual(0);
    })
    /**
     * @tc.name   SUB_AI_MindSpore_AIPP_0003
     * @tc.number SUB_AI_MindSpore_AIPP_0003
     * @tc.desc   SUB_AI_MindSpore_AIPP_0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_AIPP_0003', Level.LEVEL0, () => {
      expect(libMindSpore.SUB_AI_MindSpore_AIPP(2)).assertEqual(0);
    })
    /**
     * @tc.name   SUB_AI_MindSpore_AIPP_0004
     * @tc.number SUB_AI_MindSpore_AIPP_0004
     * @tc.desc   SUB_AI_MindSpore_AIPP_0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_AIPP_0004', Level.LEVEL0, () => {
      expect(libMindSpore.SUB_AI_MindSpore_AIPP(3)).assertEqual(0);
    })
    /**
     * @tc.name   SUB_AI_MindSpore_AIPP_0005
     * @tc.number SUB_AI_MindSpore_AIPP_0005
     * @tc.desc   SUB_AI_MindSpore_AIPP_0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_AIPP_0005', Level.LEVEL0, () => {
      expect(libMindSpore.SUB_AI_MindSpore_AIPP(4)).assertEqual(0);
    })
    /**
     * @tc.name   SUB_AI_MindSpore_AIPP_0006
     * @tc.number SUB_AI_MindSpore_AIPP_0006
     * @tc.desc   SUB_AI_MindSpore_AIPP_0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_AIPP_0006', Level.LEVEL0, () => {
      expect(libMindSpore.SUB_AI_MindSpore_AIPP(5)).assertEqual(0);
    })
    /**
     * @tc.name   SUB_AI_MindSpore_AIPP_0007
     * @tc.number SUB_AI_MindSpore_AIPP_0007
     * @tc.desc   SUB_AI_MindSpore_AIPP_0007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_AIPP_0007', Level.LEVEL0, () => {
      expect(libMindSpore.SUB_AI_MindSpore_AIPP(6)).assertEqual(0);
    })
    /**
     * @tc.name   SUB_AI_MindSpore_AIPP_0008
     * @tc.number SUB_AI_MindSpore_AIPP_0008
     * @tc.desc   SUB_AI_MindSpore_AIPP_0008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_AIPP_0008', Level.LEVEL0, () => {
      expect(libMindSpore.SUB_AI_MindSpore_AIPP(7)).assertEqual(0);
    })
    /**
     * @tc.name   SUB_AI_MindSpore_AIPP_0009
     * @tc.number SUB_AI_MindSpore_AIPP_0009
     * @tc.desc   SUB_AI_MindSpore_AIPP_0009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_AIPP_0009', Level.LEVEL0, () => {
      expect(libMindSpore.SUB_AI_MindSpore_AIPP(8)).assertEqual(0);
    })
    /**
     * @tc.name   SUB_AI_MindSpore_AIPP_0010
     * @tc.number SUB_AI_MindSpore_AIPP_0010
     * @tc.desc   SUB_AI_MindSpore_AIPP_0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_MindSpore_AIPP_0010', Level.LEVEL0, () => {
      expect(libMindSpore.SUB_AI_MindSpore_AIPP(9)).assertEqual(0);
    })

  })
}