/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import mindSporeLite from '@ohos.ai.mindSporeLite';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';




function comparePrecisionAbs(arr1: number[], arr2: number[]): boolean {
  if (arr1.length !== arr2.length) {
    return false;
  }
  const EPSILON = 0.0001; // 定义精度误差
  for (let i = 0; i < arr1.length; i++) {
    if (Math.abs(arr1[i] - arr2[i]) > EPSILON) {
      return false;
    }
  }
  return true;
}

function cosineSimilarity(vec1: number[], vec2: number[]): number {
  if (vec1.length !== vec2.length) {
    throw new Error("Vectors must have the same length");
  }
  let dotProduct = 0;
  let vec1Magnitude = 0;
  let vec2Magnitude = 0;
  for (let i = 0; i < vec1.length; i++) {
    dotProduct += vec1[i] * vec2[i];
    vec1Magnitude += vec1[i] * vec1[i];
    vec2Magnitude += vec2[i] * vec2[i];
  }
  vec1Magnitude = Math.sqrt(vec1Magnitude);
  vec2Magnitude = Math.sqrt(vec2Magnitude);
  return dotProduct / (vec1Magnitude * vec2Magnitude);
}


export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      let dir = globalThis.abilityContext.filesDir + "/";
      try {
        let ml_face_model_file = dir + "ml_face_isface.ms";
        globalThis.context.resourceManager.getRawFileContent("ml_face_isface.ms", (error: BusinessError, model_buffer: Uint8Array) => {
          if (error != null) {
            //getRawFileDescriptor运行失败
            console.log(
              "[rawfile_copy_to_sandbox] ml_face_isface.ms is copy " +
              "failed:${error.code}, message: ${error.message}.");
          } else {
            //getRawFileDescriptor运行成功
            let file = fs.openSync(ml_face_model_file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
            fs.writeSync(file.fd, model_buffer.buffer);
            fs.closeSync(file);
            console.log("[rawfile_copy_to_sandbox] ml_face_isface.ms is copy success");
          }
        });
        let mnet_caffemodel_bin_file = dir + "ml_face_isface_0.input";
        globalThis.context.resourceManager.getRawFileContent("ml_face_isface_0.input", (error: BusinessError, model_buffer: Uint8Array) => {
          if (error != null) {
            //getRawFileDescriptor运行失败
            console.log(
              "[rawfile_copy_to_sandbox] ml_face_isface_0.input is copy " +
              "failed:${error.code}, message: ${error.message}.");
          } else {
            //getRawFileDescriptor运行成功
            let file = fs.openSync(mnet_caffemodel_bin_file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
            fs.writeSync(file.fd, model_buffer.buffer);
            fs.closeSync(file);
            console.log("[rawfile_copy_to_sandbox] ml_face_isface_0.input is copy success");
          }
        });

        let ml_ocr_model_file = dir + "ml_ocr_cn.ms";
        globalThis.context.resourceManager.getRawFileContent("ml_ocr_cn.ms", (error: BusinessError, model_buffer: Uint8Array) => {
          if (error != null) {
            //getRawFileDescriptor运行失败
            console.log(
              "[rawfile_copy_to_sandbox] ml_ocr_cn.ms is copy " +
              "failed:${error.code}, message: ${error.message}.");
          } else {
            //getRawFileDescriptor运行成功
            let file = fs.openSync(ml_ocr_model_file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
            fs.writeSync(file.fd, model_buffer.buffer);
            fs.closeSync(file);
            console.log("[rawfile_copy_to_sandbox] ml_ocr_cn.ms is copy success");
          }
        });

        let lenet_train_model_file = dir + "lenet_train.ms";
        globalThis.context.resourceManager.getRawFileContent("lenet_train.ms", (error: BusinessError, model_buffer: Uint8Array) => {
          if (error != null) {
            //getRawFileDescriptor运行失败
            console.log(
              "[rawfile_copy_to_sandbox] lenet_train.ms is copy " +
              "failed:${error.code}, message: ${error.message}.");
          } else {
            //getRawFileDescriptor运行成功
            let file = fs.openSync(lenet_train_model_file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
            fs.writeSync(file.fd, model_buffer.buffer);
            fs.closeSync(file);
            console.log("[rawfile_copy_to_sandbox] lenet_train.ms is copy success");
          }
        });

      } catch (error) {
        console.info("[rawfile_copy_to_sandbox] getRawFileDescriptor api run failed" + error);
      }

      console.info("[rawfile_copy_to_sandbox] sandbox path:" + dir);
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      let dir = globalThis.abilityContext.filesDir + "/";

      let ml_face_model = dir + "ml_face_isface.ms";
      await fs.access(ml_face_model).then(async (res) => {
        if (res) {
          console.info("ml_face_isface.ms file exists");
        }
      }).catch((err: BusinessError) => {
        console.info("ml_face_isface.ms file does not exists! access failed with error message: " +
        err.message + ", error code: " + err.code);
      });

      let mnet_caffemodel_bin_file = dir + "ml_face_isface_0.input";
      await fs.access(mnet_caffemodel_bin_file).then(async (res) => {
        if (res) {
          console.info("ml_face_isface_0.input file exists");
        }
      }).catch((err: BusinessError) => {
        console.info("ml_face_isface_0.input file does not exist! access failed with error message: " +
        err.message + ", error code: " + err.code);
      });

      let ml_ocr_model = dir + "ml_ocr_cn.ms";
      await fs.access(ml_ocr_model).then(async (res) => {
        if (res) {
          console.info("ml_ocr_cn.ms file exists");
        }
      }).catch((err: BusinessError) => {
        console.info("ml_ocr_cn.ms file does not exists! access failed with error message: " +
        err.message + ", error code: " + err.code);
      });



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


    it('Test_fun',Level.LEVEL0, async (done: Function) => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_is_None_001");

      let x =[0.55,0.55,0.55,0.55,0.55]
      let y =[0.55,0.55,0.55,0.55,0.55]
      let s = cosineSimilarity(x, y)
      let z = comparePrecisionAbs(x, y)
      console.log("==========MSLITE start===========");
      console.log(s.toString())
      console.log(z.toString())
      console.log("==========MSLITE start===========");
      done();
    })

    // loadTrainModelFromFile参数3个
    it('SUB_AI_MindSpore_ArkTS_loadTrainModelFromFile_parameter_0001', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array = await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array = await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let model_file = globalThis.abilityContext.filesDir + '/' + 'lenet_train.ms';
      console.log("==========MSLITE loadModel===========");
      let cfg: mindSporeLite.TrainCfg = {};
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      context.cpu = {};
      context.cpu.threadNum = 1;
      context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
      let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.NO_QUANT, true);
      expect(ret).assertTrue();
      console.log("==========MSLITE loadModelFromFile===========");
      let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
      expect(predictModel !== null).assertTrue();
      predictModel.trainMode = false;
      console.log("==========MSLITE getInputs===========");
      const predictInputs = predictModel.getInputs();
      for (let i = 0; i < predictInputs.length; i++) {
        let printStr = predictInputs[i].name + ", ";
        printStr += predictInputs[i].shape + ", ";
        printStr += predictInputs[i].dtype + ", ";
        printStr += predictInputs[i].dataSize + ", ";
        printStr += predictInputs[i].getData();
        console.log("==========MSLITE predictInputs===========",printStr);
      }
      predictInputs[0].setData(inputBuffer0.buffer);
      console.log("==========MSLITE predict===========");
      let modelOutputs = await predictModel.predict(predictInputs);
      expect(modelOutputs !== null).assertTrue();
      for (let i = 0; i < modelOutputs.length; i++) {
        let printStr = modelOutputs[i].name + ", ";
        printStr += modelOutputs[i].shape + ", ";
        printStr += modelOutputs[i].dtype + ", ";
        printStr += modelOutputs[i].dataSize + ", ";
        printStr += modelOutputs[i].getData();
        console.log("==========MSLITE modelOutputs===========",printStr);
      }
      let output0 = new Float32Array(modelOutputs[0].getData());
      for (let i = 0; i < 20; i++) {
        console.log('output:', output0[i]);
      }
      console.log("==========MSLITE end===========");
    })

    // loadTrainModelFromFile参数2个
    it('SUB_AI_MindSpore_ArkTS_loadTrainModelFromFile_parameter_0002', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array = await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array = await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let model_file = globalThis.abilityContext.filesDir + '/' + 'lenet_train.ms';
      console.log("==========MSLITE loadModel===========");
      let cfg: mindSporeLite.TrainCfg = {};
      let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.NO_QUANT, true);
      expect(ret).assertTrue();
      console.log("==========MSLITE loadModelFromFile===========");
      let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
      expect(predictModel !== null).assertTrue();
      predictModel.trainMode = false;
      console.log("==========MSLITE getInputs===========");
      const predictInputs = predictModel.getInputs();
      for (let i = 0; i < predictInputs.length; i++) {
        let printStr = predictInputs[i].name + ", ";
        printStr += predictInputs[i].shape + ", ";
        printStr += predictInputs[i].dtype + ", ";
        printStr += predictInputs[i].dataSize + ", ";
        printStr += predictInputs[i].getData();
        console.log("==========MSLITE predictInputs===========",printStr);
      }
      predictInputs[0].setData(inputBuffer0.buffer);
      console.log("==========MSLITE predict===========");
      let modelOutputs = await predictModel.predict(predictInputs);
      expect(modelOutputs !== null).assertTrue();
      for (let i = 0; i < modelOutputs.length; i++) {
        let printStr = modelOutputs[i].name + ", ";
        printStr += modelOutputs[i].shape + ", ";
        printStr += modelOutputs[i].dtype + ", ";
        printStr += modelOutputs[i].dataSize + ", ";
        printStr += modelOutputs[i].getData();
        console.log("==========MSLITE modelOutputs===========",printStr);
      }
      let output0 = new Float32Array(modelOutputs[0].getData());
      for (let i = 0; i < 20; i++) {
        console.log('output:', output0[i]);
      }
      console.log("==========MSLITE end===========");
    })

    // loadTrainModelFromBuffer参数3个
    it('SUB_AI_MindSpore_ArkTS_loadTrainModelFromBuffer_parameter_0001', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array = await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array = await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let modelBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent("lenet_train.ms");
      console.log("==========MSLITE loadModel===========");
      let cfg: mindSporeLite.TrainCfg = {};
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      context.cpu = {};
      context.cpu.threadNum = 1;
      context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
      let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer, cfg, context);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.NO_QUANT, true);
      expect(ret).assertTrue();
      console.log("==========MSLITE loadModelFromFile===========");
      let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
      expect(predictModel !== null).assertTrue();
      predictModel.trainMode = false;
      console.log("==========MSLITE getInputs===========");
      const predictInputs = predictModel.getInputs();
      for (let i = 0; i < predictInputs.length; i++) {
        let printStr = predictInputs[i].name + ", ";
        printStr += predictInputs[i].shape + ", ";
        printStr += predictInputs[i].dtype + ", ";
        printStr += predictInputs[i].dataSize + ", ";
        printStr += predictInputs[i].getData();
        console.log("==========MSLITE predictInputs===========",printStr);
      }
      predictInputs[0].setData(inputBuffer0.buffer);
      console.log("==========MSLITE predict===========");
      let modelOutputs = await predictModel.predict(predictInputs);
      expect(modelOutputs !== null).assertTrue();
      for (let i = 0; i < modelOutputs.length; i++) {
        let printStr = modelOutputs[i].name + ", ";
        printStr += modelOutputs[i].shape + ", ";
        printStr += modelOutputs[i].dtype + ", ";
        printStr += modelOutputs[i].dataSize + ", ";
        printStr += modelOutputs[i].getData();
        console.log("==========MSLITE modelOutputs===========",printStr);
      }
      let output0 = new Float32Array(modelOutputs[0].getData());
      for (let i = 0; i < 20; i++) {
        console.log('output:', output0[i]);
      }
      console.log("==========MSLITE end===========");
    })

    // loadTrainModelFromBuffer参数2个
    it('SUB_AI_MindSpore_ArkTS_loadTrainModelFromBuffer_parameter_0002', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array = await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array = await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let modelBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent("lenet_train.ms");
      console.log("==========MSLITE loadModel===========");
      let cfg: mindSporeLite.TrainCfg = {};
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer, cfg);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.NO_QUANT, true);
      expect(ret).assertTrue();
      console.log("==========MSLITE loadModelFromFile===========");
      let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
      expect(predictModel !== null).assertTrue();
      predictModel.trainMode = false;
      console.log("==========MSLITE getInputs===========");
      const predictInputs = predictModel.getInputs();
      for (let i = 0; i < predictInputs.length; i++) {
        let printStr = predictInputs[i].name + ", ";
        printStr += predictInputs[i].shape + ", ";
        printStr += predictInputs[i].dtype + ", ";
        printStr += predictInputs[i].dataSize + ", ";
        printStr += predictInputs[i].getData();
        console.log("==========MSLITE predictInputs===========",printStr);
      }
      predictInputs[0].setData(inputBuffer0.buffer);
      console.log("==========MSLITE predict===========");
      let modelOutputs = await predictModel.predict(predictInputs);
      expect(modelOutputs !== null).assertTrue();
      for (let i = 0; i < modelOutputs.length; i++) {
        let printStr = modelOutputs[i].name + ", ";
        printStr += modelOutputs[i].shape + ", ";
        printStr += modelOutputs[i].dtype + ", ";
        printStr += modelOutputs[i].dataSize + ", ";
        printStr += modelOutputs[i].getData();
        console.log("==========MSLITE modelOutputs===========",printStr);
      }
      let output0 = new Float32Array(modelOutputs[0].getData());
      for (let i = 0; i < 20; i++) {
        console.log('output:', output0[i]);
      }
      console.log("==========MSLITE end===========");
    })
    
    // loadTrainModelFromFd参数3个
    it('SUB_AI_MindSpore_ArkTS_loadTrainModelFromFd_parameter_0001', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array = await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array = await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let model_file = globalThis.abilityContext.filesDir + '/' + 'lenet_train.ms';
      let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
      console.log("==========MSLITE loadModel===========");
      let cfg: mindSporeLite.TrainCfg = {};
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      context.cpu = {};
      context.cpu.threadNum = 1;
      context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
      let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, cfg, context);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.NO_QUANT, true);
      expect(ret).assertTrue();
      console.log("==========MSLITE loadModelFromFile===========");
      let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
      expect(predictModel !== null).assertTrue();
      predictModel.trainMode = false;
      console.log("==========MSLITE getInputs===========");
      const predictInputs = predictModel.getInputs();
      for (let i = 0; i < predictInputs.length; i++) {
        let printStr = predictInputs[i].name + ", ";
        printStr += predictInputs[i].shape + ", ";
        printStr += predictInputs[i].dtype + ", ";
        printStr += predictInputs[i].dataSize + ", ";
        printStr += predictInputs[i].getData();
        console.log("==========MSLITE predictInputs===========",printStr);
      }
      predictInputs[0].setData(inputBuffer0.buffer);
      console.log("==========MSLITE predict===========");
      let modelOutputs = await predictModel.predict(predictInputs);
      expect(modelOutputs !== null).assertTrue();
      for (let i = 0; i < modelOutputs.length; i++) {
        let printStr = modelOutputs[i].name + ", ";
        printStr += modelOutputs[i].shape + ", ";
        printStr += modelOutputs[i].dtype + ", ";
        printStr += modelOutputs[i].dataSize + ", ";
        printStr += modelOutputs[i].getData();
        console.log("==========MSLITE modelOutputs===========",printStr);
      }
      let output0 = new Float32Array(modelOutputs[0].getData());
      for (let i = 0; i < 20; i++) {
        console.log('output:', output0[i]);
      }
      console.log("==========MSLITE end===========");
    })

    // loadTrainModelFromFd参数2个
    it('SUB_AI_MindSpore_ArkTS_loadTrainModelFromFd_parameter_0002', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array = await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array = await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let model_file = globalThis.abilityContext.filesDir + '/' + 'lenet_train.ms';
      let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
      console.log("==========MSLITE loadModel===========");
      let cfg: mindSporeLite.TrainCfg = {};
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, cfg);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.NO_QUANT, true);
      expect(ret).assertTrue();
      console.log("==========MSLITE loadModelFromFile===========");
      let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
      expect(predictModel !== null).assertTrue();
      predictModel.trainMode = false;
      console.log("==========MSLITE getInputs===========");
      const predictInputs = predictModel.getInputs();
      for (let i = 0; i < predictInputs.length; i++) {
        let printStr = predictInputs[i].name + ", ";
        printStr += predictInputs[i].shape + ", ";
        printStr += predictInputs[i].dtype + ", ";
        printStr += predictInputs[i].dataSize + ", ";
        printStr += predictInputs[i].getData();
        console.log("==========MSLITE predictInputs===========",printStr);
      }
      predictInputs[0].setData(inputBuffer0.buffer);
      console.log("==========MSLITE predict===========");
      let modelOutputs = await predictModel.predict(predictInputs);
      expect(modelOutputs !== null).assertTrue();
      for (let i = 0; i < modelOutputs.length; i++) {
        let printStr = modelOutputs[i].name + ", ";
        printStr += modelOutputs[i].shape + ", ";
        printStr += modelOutputs[i].dtype + ", ";
        printStr += modelOutputs[i].dataSize + ", ";
        printStr += modelOutputs[i].getData();
        console.log("==========MSLITE modelOutputs===========",printStr);
      }
      let output0 = new Float32Array(modelOutputs[0].getData());
      for (let i = 0; i < 20; i++) {
        console.log('output:', output0[i]);
      }
      console.log("==========MSLITE end===========");
    })

    // exportModel参数4个
    it('SUB_AI_MindSpore_ArkTS_exportModel_parameter_0001', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let modelBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train.ms");
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      let outputTensorName = ["aaa"]
      ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.NO_QUANT, true, outputTensorName);
      expect(ret).assertFalse();
      console.log("==========MSLITE end===========");
    })

    // exportModel参数2个
    it('SUB_AI_MindSpore_ArkTS_exportModel_parameter_0002', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let modelBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train.ms");
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.NO_QUANT);
      expect(ret).assertTrue();
      console.log("==========MSLITE loadModelFromFile===========");
      let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
      expect(predictModel !== null).assertTrue();
      predictModel.trainMode = false;
      console.log("==========MSLITE getInputs===========");
      const predictInputs = predictModel.getInputs();
      for (let i = 0; i < predictInputs.length; i++) {
        let printStr = predictInputs[i].name + ", ";
        printStr += predictInputs[i].shape + ", ";
        printStr += predictInputs[i].dtype + ", ";
        printStr += predictInputs[i].dataSize + ", ";
        printStr += predictInputs[i].getData();
        console.log("==========MSLITE predictInputs===========",printStr);
      }
      predictInputs[0].setData(inputBuffer0.buffer);
      console.log("==========MSLITE predict===========");
      let modelOutputs = await predictModel.predict(predictInputs);
      expect(modelOutputs !== null).assertTrue();
      for (let i = 0; i < modelOutputs.length; i++) {
        let printStr = modelOutputs[i].name + ", ";
        printStr += modelOutputs[i].shape + ", ";
        printStr += modelOutputs[i].dtype + ", ";
        printStr += modelOutputs[i].dataSize + ", ";
        printStr += modelOutputs[i].getData();
        console.log("==========MSLITE modelOutputs===========",printStr);
      }
      let output0 = new Float32Array(modelOutputs[0].getData());
      for (let i = 0; i < 20; i++) {
        console.log('output:', output0[i]);
      }
      console.log("==========MSLITE end===========");
    })

    // exportModel参数3个
    it('SUB_AI_MindSpore_ArkTS_exportModel_parameter_0003', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let modelBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train.ms");
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.NO_QUANT, true);
      expect(ret).assertTrue();
      console.log("==========MSLITE loadModelFromFile===========");
      let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
      expect(predictModel !== null).assertTrue();
      predictModel.trainMode = false;
      console.log("==========MSLITE getInputs===========");
      const predictInputs = predictModel.getInputs();
      for (let i = 0; i < predictInputs.length; i++) {
        let printStr = predictInputs[i].name + ", ";
        printStr += predictInputs[i].shape + ", ";
        printStr += predictInputs[i].dtype + ", ";
        printStr += predictInputs[i].dataSize + ", ";
        printStr += predictInputs[i].getData();
        console.log("==========MSLITE predictInputs===========",printStr);
      }
      predictInputs[0].setData(inputBuffer0.buffer);
      console.log("==========MSLITE predict===========");
      let modelOutputs = await predictModel.predict(predictInputs);
      expect(modelOutputs !== null).assertTrue();
      for (let i = 0; i < modelOutputs.length; i++) {
        let printStr = modelOutputs[i].name + ", ";
        printStr += modelOutputs[i].shape + ", ";
        printStr += modelOutputs[i].dtype + ", ";
        printStr += modelOutputs[i].dataSize + ", ";
        printStr += modelOutputs[i].getData();
        console.log("==========MSLITE modelOutputs===========",printStr);
      }
      let output0 = new Float32Array(modelOutputs[0].getData());
      for (let i = 0; i < 20; i++) {
        console.log('output:', output0[i]);
      }
      console.log("==========MSLITE end===========");
    })

    // exportWeightsCollaborateWithMicro参数4个
    it('SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_parameter_0001', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let model_file = globalThis.abilityContext.filesDir + '/' + 'lenet_train.ms';
      console.log("==========MSLITE Context===========");
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      context.cpu = {};
      context.cpu.threadNum = 1;
      context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
      console.log("==========MSLITE TrainCfg===========");
      let cfg:mindSporeLite.TrainCfg={};
      cfg.lossName = ["loss_fct", "_loss_fn", "SigmoidCrossEntropy"];
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      ret = msliteModel.exportWeightsCollaborateWithMicro(path +"/micro_weight.bin", true, false, [""]);
      expect(ret).assertTrue();
      console.log("==========MSLITE end===========");
    })

    // exportWeightsCollaborateWithMicro参数2个
    it('SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_parameter_0002', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let model_file = globalThis.abilityContext.filesDir + '/' + 'lenet_train.ms';
      console.log("==========MSLITE Context===========");
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      context.cpu = {};
      context.cpu.threadNum = 1;
      context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
      console.log("==========MSLITE TrainCfg===========");
      let cfg:mindSporeLite.TrainCfg={};
      cfg.lossName = ["loss_fct", "_loss_fn", "SigmoidCrossEntropy"];
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      ret = msliteModel.exportWeightsCollaborateWithMicro(path +"/micro_weight.bin", true);
      expect(ret).assertTrue();
      console.log("==========MSLITE end===========");
    })

    // exportWeightsCollaborateWithMicro参数3个
    it('SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_parameter_0003', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let model_file = globalThis.abilityContext.filesDir + '/' + 'lenet_train.ms';
      console.log("==========MSLITE Context===========");
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      context.cpu = {};
      context.cpu.threadNum = 1;
      context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
      console.log("==========MSLITE TrainCfg===========");
      let cfg:mindSporeLite.TrainCfg={};
      cfg.lossName = ["loss_fct", "_loss_fn", "SigmoidCrossEntropy"];
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      ret = msliteModel.exportWeightsCollaborateWithMicro(path +"/micro_weight.bin", true, false);
      expect(ret).assertTrue();
      console.log("==========MSLITE end===========");
    })

    // 正常场景：通过path加载模型，执行1轮训练并对比精度
    it('SUB_AI_MindSpore_ArkTS_loadTrainModelFromFile_0001', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array = await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array = await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let model_file = globalThis.abilityContext.filesDir + '/' + 'lenet_train.ms';
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.NO_QUANT, true);
      expect(ret).assertTrue();
      console.log("==========MSLITE loadModelFromFile===========");
      let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
      expect(predictModel !== null).assertTrue();
      predictModel.trainMode = false;
      console.log("==========MSLITE getInputs===========");
      const predictInputs = predictModel.getInputs();
      for (let i = 0; i < predictInputs.length; i++) {
        let printStr = predictInputs[i].name + ", ";
        printStr += predictInputs[i].shape + ", ";
        printStr += predictInputs[i].dtype + ", ";
        printStr += predictInputs[i].dataSize + ", ";
        printStr += predictInputs[i].getData();
        console.log("==========MSLITE predictInputs===========",printStr);
      }
      predictInputs[0].setData(inputBuffer0.buffer);
      console.log("==========MSLITE predict===========");
      let modelOutputs = await predictModel.predict(predictInputs);
      expect(modelOutputs !== null).assertTrue();
      for (let i = 0; i < modelOutputs.length; i++) {
        let printStr = modelOutputs[i].name + ", ";
        printStr += modelOutputs[i].shape + ", ";
        printStr += modelOutputs[i].dtype + ", ";
        printStr += modelOutputs[i].dataSize + ", ";
        printStr += modelOutputs[i].getData();
        console.log("==========MSLITE modelOutputs===========",printStr);
      }
      let output0 = new Float32Array(modelOutputs[0].getData());
      for (let i = 0; i < 20; i++) {
        console.log('output:', output0[i]);
      }
      console.log("==========MSLITE end===========");
    })

    // 异常场景：加载模型文件路径不存在
    it('SUB_AI_MindSpore_ArkTS_loadTrainModelFromFile_0002', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let model_file = globalThis.abilityContext.filesDir + '/not_exist/' + 'ml_face_isface_0.input';
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file);
      expect(msliteModel).not().assertNull();
      const modelInputs = msliteModel.getInputs();
      expect(modelInputs).assertUndefined();
      console.log("==========MSLITE end===========");
    })

    // 异常场景：加载模型文件路径为空
    it('SUB_AI_MindSpore_ArkTS_loadTrainModelFromFile_0003', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromFile("");
      expect(msliteModel).assertUndefined();
      console.log("==========MSLITE end===========");
    })

    // 异常场景：加载模型文件路径为错误文件
    it('SUB_AI_MindSpore_ArkTS_loadTrainModelFromFile_0004', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface_0.input';
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file);
      expect(msliteModel).not().assertNull();
      const modelInputs = msliteModel.getInputs();
      expect(modelInputs).assertUndefined();
      console.log("==========MSLITE end===========");
    })

    // 正常场景：通过path加载模型，执行1轮训练并对比精度
    it('SUB_AI_MindSpore_ArkTS_loadTrainModelFromBuffer_0001', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array = await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array = await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let modelBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent("lenet_train.ms");
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.NO_QUANT, true);
      expect(ret).assertTrue();
      console.log("==========MSLITE loadModelFromFile===========");
      let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
      expect(predictModel !== null).assertTrue();
      predictModel.trainMode = false;
      console.log("==========MSLITE getInputs===========");
      const predictInputs = predictModel.getInputs();
      for (let i = 0; i < predictInputs.length; i++) {
        let printStr = predictInputs[i].name + ", ";
        printStr += predictInputs[i].shape + ", ";
        printStr += predictInputs[i].dtype + ", ";
        printStr += predictInputs[i].dataSize + ", ";
        printStr += predictInputs[i].getData();
        console.log("==========MSLITE predictInputs===========",printStr);
      }
      predictInputs[0].setData(inputBuffer0.buffer);
      console.log("==========MSLITE predict===========");
      let modelOutputs = await predictModel.predict(predictInputs);
      expect(modelOutputs !== null).assertTrue();
      for (let i = 0; i < modelOutputs.length; i++) {
        let printStr = modelOutputs[i].name + ", ";
        printStr += modelOutputs[i].shape + ", ";
        printStr += modelOutputs[i].dtype + ", ";
        printStr += modelOutputs[i].dataSize + ", ";
        printStr += modelOutputs[i].getData();
        console.log("==========MSLITE modelOutputs===========",printStr);
      }
      let output0 = new Float32Array(modelOutputs[0].getData());
      for (let i = 0; i < 20; i++) {
        console.log('output:', output0[i]);
      }
      console.log("==========MSLITE end===========");
    })

    //异常场景：加载模型buffer为空
    it('SUB_AI_MindSpore_ArkTS_loadTrainModelFromBuffer_0002', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(null);
      expect(msliteModel).assertUndefined();
      console.log("==========MSLITE end===========");
    })

    // 正常场景：通过path加载模型，执行1轮训练并对比精度
    it('SUB_AI_MindSpore_ArkTS_loadTrainModelFromFd_0001', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array = await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array = await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let model_file = globalThis.abilityContext.filesDir + '/' + 'lenet_train.ms';
      let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.NO_QUANT, true);
      expect(ret).assertTrue();
      console.log("==========MSLITE loadModelFromFile===========");
      let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
      expect(predictModel !== null).assertTrue();
      predictModel.trainMode = false;
      console.log("==========MSLITE getInputs===========");
      const predictInputs = predictModel.getInputs();
      for (let i = 0; i < predictInputs.length; i++) {
        let printStr = predictInputs[i].name + ", ";
        printStr += predictInputs[i].shape + ", ";
        printStr += predictInputs[i].dtype + ", ";
        printStr += predictInputs[i].dataSize + ", ";
        printStr += predictInputs[i].getData();
        console.log("==========MSLITE predictInputs===========",printStr);
      }
      predictInputs[0].setData(inputBuffer0.buffer);
      console.log("==========MSLITE predict===========");
      let modelOutputs = await predictModel.predict(predictInputs);
      expect(modelOutputs !== null).assertTrue();
      for (let i = 0; i < modelOutputs.length; i++) {
        let printStr = modelOutputs[i].name + ", ";
        printStr += modelOutputs[i].shape + ", ";
        printStr += modelOutputs[i].dtype + ", ";
        printStr += modelOutputs[i].dataSize + ", ";
        printStr += modelOutputs[i].getData();
        console.log("==========MSLITE modelOutputs===========",printStr);
      }
      let output0 = new Float32Array(modelOutputs[0].getData());
      for (let i = 0; i < 20; i++) {
        console.log('output:', output0[i]);
      }
      console.log("==========MSLITE end===========");
    })

    // 正常场景：设置学习率为0.01
    it('SUB_AI_MindSpore_ArkTS_learningRate_0001', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let model_file = globalThis.abilityContext.filesDir + '/' + 'lenet_train.ms';
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      msliteModel.learningRate = 0.01;
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      ret = msliteModel.exportModel(path +"/lenet_train_infer.ms");
      expect(ret).assertTrue();
      console.log("==========MSLITE loadModelFromFile===========");
      let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
      expect(predictModel !== null).assertTrue();
      predictModel.trainMode = false;
      console.log("==========MSLITE getInputs===========");
      const predictInputs = predictModel.getInputs();
      for (let i = 0; i < predictInputs.length; i++) {
        let printStr = predictInputs[i].name + ", ";
        printStr += predictInputs[i].shape + ", ";
        printStr += predictInputs[i].dtype + ", ";
        printStr += predictInputs[i].dataSize + ", ";
        printStr += predictInputs[i].getData();
        console.log("==========MSLITE predictInputs===========",printStr);
      }
      predictInputs[0].setData(inputBuffer0.buffer);
      console.log("==========MSLITE predict===========");
      let modelOutputs = await predictModel.predict(predictInputs);
      expect(modelOutputs !== null).assertTrue();
      for (let i = 0; i < modelOutputs.length; i++) {
        let printStr = modelOutputs[i].name + ", ";
        printStr += modelOutputs[i].shape + ", ";
        printStr += modelOutputs[i].dtype + ", ";
        printStr += modelOutputs[i].dataSize + ", ";
        printStr += modelOutputs[i].getData();
        console.log("==========MSLITE modelOutputs===========",printStr);
      }
      let output0 = new Float32Array(modelOutputs[0].getData());
      for (let i = 0; i < 20; i++) {
        console.log('output:', output0[i]);
      }
      console.log("==========MSLITE end===========");
    })

    // 正常场景：设置学习率为1000.0
    it('SUB_AI_MindSpore_ArkTS_learningRate_0002', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let model_file = globalThis.abilityContext.filesDir + '/' + 'lenet_train.ms';
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      msliteModel.learningRate = 1000.0;
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      ret = msliteModel.exportModel(path +"/lenet_train_infer.ms");
      expect(ret).assertTrue();
      console.log("==========MSLITE loadModelFromFile===========");
      let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
      expect(predictModel !== null).assertTrue();
      predictModel.trainMode = false;
      console.log("==========MSLITE getInputs===========");
      const predictInputs = predictModel.getInputs();
      for (let i = 0; i < predictInputs.length; i++) {
        let printStr = predictInputs[i].name + ", ";
        printStr += predictInputs[i].shape + ", ";
        printStr += predictInputs[i].dtype + ", ";
        printStr += predictInputs[i].dataSize + ", ";
        printStr += predictInputs[i].getData();
        console.log("==========MSLITE predictInputs===========",printStr);
      }
      predictInputs[0].setData(inputBuffer0.buffer);
      console.log("==========MSLITE predict===========");
      let modelOutputs = await predictModel.predict(predictInputs);
      expect(modelOutputs !== null).assertTrue();
      for (let i = 0; i < modelOutputs.length; i++) {
        let printStr = modelOutputs[i].name + ", ";
        printStr += modelOutputs[i].shape + ", ";
        printStr += modelOutputs[i].dtype + ", ";
        printStr += modelOutputs[i].dataSize + ", ";
        printStr += modelOutputs[i].getData();
        console.log("==========MSLITE modelOutputs===========",printStr);
      }
      let output0 = new Float32Array(modelOutputs[0].getData());
      for (let i = 0; i < 20; i++) {
        console.log('output:', output0[i]);
      }
      console.log("==========MSLITE end===========");
    })

    // 正常场景：设置虚拟batch_size为2
    it('SUB_AI_MindSpore_ArkTS_setupVirtualBatch_0001', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let model_file = globalThis.abilityContext.filesDir + '/' + 'lenet_train.ms';
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      let ret = msliteModel.setupVirtualBatch(2,-1,-1);
      expect(ret).assertTrue();
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      ret = msliteModel.exportModel(path +"/lenet_train_infer.ms");
      expect(ret).assertTrue();
      console.log("==========MSLITE loadModelFromFile===========");
      let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
      expect(predictModel !== null).assertTrue();
      predictModel.trainMode = false;
      console.log("==========MSLITE getInputs===========");
      const predictInputs = predictModel.getInputs();
      for (let i = 0; i < predictInputs.length; i++) {
        let printStr = predictInputs[i].name + ", ";
        printStr += predictInputs[i].shape + ", ";
        printStr += predictInputs[i].dtype + ", ";
        printStr += predictInputs[i].dataSize + ", ";
        printStr += predictInputs[i].getData();
        console.log("==========MSLITE predictInputs===========",printStr);
      }
      predictInputs[0].setData(inputBuffer0.buffer);
      console.log("==========MSLITE predict===========");
      let modelOutputs = await predictModel.predict(predictInputs);
      expect(modelOutputs !== null).assertTrue();
      for (let i = 0; i < modelOutputs.length; i++) {
        let printStr = modelOutputs[i].name + ", ";
        printStr += modelOutputs[i].shape + ", ";
        printStr += modelOutputs[i].dtype + ", ";
        printStr += modelOutputs[i].dataSize + ", ";
        printStr += modelOutputs[i].getData();
        console.log("==========MSLITE modelOutputs===========",printStr);
      }
      let output0 = new Float32Array(modelOutputs[0].getData());
      for (let i = 0; i < 20; i++) {
        console.log('output:', output0[i]);
      }
      console.log("==========MSLITE end===========");
    })

    // 正常场景：设置优化等级O0
    it('SUB_AI_MindSpore_ArkTS_optimizationLevel_0001', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let model_file = globalThis.abilityContext.filesDir + '/' + 'lenet_train.ms';
      console.log("==========MSLITE Context===========");
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      context.cpu = {};
      context.cpu.threadNum = 1;
      context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
      console.log("==========MSLITE TrainCfg===========");
      let cfg:mindSporeLite.TrainCfg={};
      cfg.lossName = ["loss_fct", "_loss_fn", "SigmoidCrossEntropy"];
      cfg.optimizationLevel = mindSporeLite.OptimizationLevel.O0;
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      msliteModel.learningRate = 0.001;
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      ret = msliteModel.exportModel(path +"/lenet_train_infer.ms");
      expect(ret).assertTrue();
      console.log("==========MSLITE loadModelFromFile===========");
      let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
      expect(predictModel !== null).assertTrue();
      predictModel.trainMode = false;
      console.log("==========MSLITE getInputs===========");
      const predictInputs = predictModel.getInputs();
      for (let i = 0; i < predictInputs.length; i++) {
        let printStr = predictInputs[i].name + ", ";
        printStr += predictInputs[i].shape + ", ";
        printStr += predictInputs[i].dtype + ", ";
        printStr += predictInputs[i].dataSize + ", ";
        printStr += predictInputs[i].getData();
        console.log("==========MSLITE predictInputs===========",printStr);
      }
      predictInputs[0].setData(inputBuffer0.buffer);
      console.log("==========MSLITE predict===========");
      let modelOutputs = await predictModel.predict(predictInputs);
      expect(modelOutputs !== null).assertTrue();
      for (let i = 0; i < modelOutputs.length; i++) {
        let printStr = modelOutputs[i].name + ", ";
        printStr += modelOutputs[i].shape + ", ";
        printStr += modelOutputs[i].dtype + ", ";
        printStr += modelOutputs[i].dataSize + ", ";
        printStr += modelOutputs[i].getData();
        console.log("==========MSLITE modelOutputs===========",printStr);
      }
      let output0 = new Float32Array(modelOutputs[0].getData());
      for (let i = 0; i < 20; i++) {
        console.log('output:', output0[i]);
      }
      console.log("==========MSLITE end===========");
    })

    // 正常场景：设置优化等级O2
    it('SUB_AI_MindSpore_ArkTS_optimizationLevel_0002', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let model_file = globalThis.abilityContext.filesDir + '/' + 'lenet_train.ms';
      console.log("==========MSLITE Context===========");
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      context.cpu = {};
      context.cpu.threadNum = 1;
      context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
      console.log("==========MSLITE TrainCfg===========");
      let cfg:mindSporeLite.TrainCfg={};
      cfg.lossName = ["loss_fct", "_loss_fn", "SigmoidCrossEntropy"];
      cfg.optimizationLevel = mindSporeLite.OptimizationLevel.O2;
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      msliteModel.learningRate = 0.001;
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      ret = msliteModel.exportModel(path +"/lenet_train_infer.ms");
      expect(ret).assertTrue();
      console.log("==========MSLITE loadModelFromFile===========");
      let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
      expect(predictModel !== null).assertTrue();
      predictModel.trainMode = false;
      console.log("==========MSLITE getInputs===========");
      const predictInputs = predictModel.getInputs();
      for (let i = 0; i < predictInputs.length; i++) {
        let printStr = predictInputs[i].name + ", ";
        printStr += predictInputs[i].shape + ", ";
        printStr += predictInputs[i].dtype + ", ";
        printStr += predictInputs[i].dataSize + ", ";
        printStr += predictInputs[i].getData();
        console.log("==========MSLITE predictInputs===========",printStr);
      }
      predictInputs[0].setData(inputBuffer0.buffer);
      console.log("==========MSLITE predict===========");
      let modelOutputs = await predictModel.predict(predictInputs);
      expect(modelOutputs !== null).assertTrue();
      for (let i = 0; i < modelOutputs.length; i++) {
        let printStr = modelOutputs[i].name + ", ";
        printStr += modelOutputs[i].shape + ", ";
        printStr += modelOutputs[i].dtype + ", ";
        printStr += modelOutputs[i].dataSize + ", ";
        printStr += modelOutputs[i].getData();
        console.log("==========MSLITE modelOutputs===========",printStr);
      }
      let output0 = new Float32Array(modelOutputs[0].getData());
      for (let i = 0; i < 20; i++) {
        console.log('output:', output0[i]);
      }
      console.log("==========MSLITE end===========");
    })

    // 正常场景：设置优化等级O3
    it('SUB_AI_MindSpore_ArkTS_optimizationLevel_0003', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let model_file = globalThis.abilityContext.filesDir + '/' + 'lenet_train.ms';
      console.log("==========MSLITE Context===========");
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      context.cpu = {};
      context.cpu.threadNum = 1;
      context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
      console.log("==========MSLITE TrainCfg===========");
      let cfg:mindSporeLite.TrainCfg={};
      cfg.lossName = ["loss_fct", "_loss_fn", "SigmoidCrossEntropy"];
      cfg.optimizationLevel = mindSporeLite.OptimizationLevel.O3;
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      msliteModel.learningRate = 0.001;
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      ret = msliteModel.exportModel(path +"/lenet_train_infer.ms");
      expect(ret).assertTrue();
      console.log("==========MSLITE loadModelFromFile===========");
      let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
      expect(predictModel !== null).assertTrue();
      predictModel.trainMode = false;
      console.log("==========MSLITE getInputs===========");
      const predictInputs = predictModel.getInputs();
      for (let i = 0; i < predictInputs.length; i++) {
        let printStr = predictInputs[i].name + ", ";
        printStr += predictInputs[i].shape + ", ";
        printStr += predictInputs[i].dtype + ", ";
        printStr += predictInputs[i].dataSize + ", ";
        printStr += predictInputs[i].getData();
        console.log("==========MSLITE predictInputs===========",printStr);
      }
      predictInputs[0].setData(inputBuffer0.buffer);
      console.log("==========MSLITE predict===========");
      let modelOutputs = await predictModel.predict(predictInputs);
      expect(modelOutputs !== null).assertTrue();
      for (let i = 0; i < modelOutputs.length; i++) {
        let printStr = modelOutputs[i].name + ", ";
        printStr += modelOutputs[i].shape + ", ";
        printStr += modelOutputs[i].dtype + ", ";
        printStr += modelOutputs[i].dataSize + ", ";
        printStr += modelOutputs[i].getData();
        console.log("==========MSLITE modelOutputs===========",printStr);
      }
      let output0 = new Float32Array(modelOutputs[0].getData());
      for (let i = 0; i < 20; i++) {
        console.log('output:', output0[i]);
      }
      console.log("==========MSLITE end===========");
    })

    // 正常场景：设置优化等级AUTO
    it('SUB_AI_MindSpore_ArkTS_optimizationLevel_0004', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let model_file = globalThis.abilityContext.filesDir + '/' + 'lenet_train.ms';
      console.log("==========MSLITE Context===========");
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      context.cpu = {};
      context.cpu.threadNum = 1;
      context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
      console.log("==========MSLITE TrainCfg===========");
      let cfg:mindSporeLite.TrainCfg={};
      cfg.lossName = ["loss_fct", "_loss_fn", "SigmoidCrossEntropy"];
      cfg.optimizationLevel = mindSporeLite.OptimizationLevel.AUTO;
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      msliteModel.learningRate = 0.001;
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      ret = msliteModel.exportModel(path +"/lenet_train_infer.ms");
      expect(ret).assertTrue();
      console.log("==========MSLITE loadModelFromFile===========");
      let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
      expect(predictModel !== null).assertTrue();
      predictModel.trainMode = false;
      console.log("==========MSLITE getInputs===========");
      const predictInputs = predictModel.getInputs();
      for (let i = 0; i < predictInputs.length; i++) {
        let printStr = predictInputs[i].name + ", ";
        printStr += predictInputs[i].shape + ", ";
        printStr += predictInputs[i].dtype + ", ";
        printStr += predictInputs[i].dataSize + ", ";
        printStr += predictInputs[i].getData();
        console.log("==========MSLITE predictInputs===========",printStr);
      }
      predictInputs[0].setData(inputBuffer0.buffer);
      console.log("==========MSLITE predict===========");
      let modelOutputs = await predictModel.predict(predictInputs);
      expect(modelOutputs !== null).assertTrue();
      for (let i = 0; i < modelOutputs.length; i++) {
        let printStr = modelOutputs[i].name + ", ";
        printStr += modelOutputs[i].shape + ", ";
        printStr += modelOutputs[i].dtype + ", ";
        printStr += modelOutputs[i].dataSize + ", ";
        printStr += modelOutputs[i].getData();
        console.log("==========MSLITE modelOutputs===========",printStr);
      }
      let output0 = new Float32Array(modelOutputs[0].getData());
      for (let i = 0; i < 20; i++) {
        console.log('output:', output0[i]);
      }
      console.log("==========MSLITE end===========");
    })

    // 正常场景：设置存在的损失函数名
    it('SUB_AI_MindSpore_ArkTS_lossName_0001', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let model_file = globalThis.abilityContext.filesDir + '/' + 'lenet_train.ms';
      console.log("==========MSLITE Context===========");
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      context.cpu = {};
      context.cpu.threadNum = 1;
      context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
      console.log("==========MSLITE TrainCfg===========");
      let cfg:mindSporeLite.TrainCfg={};
      cfg.lossName = ["loss_fct", "_loss_fn", "SigmoidCrossEntropy"];
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      msliteModel.learningRate = 0.001;
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      ret = msliteModel.exportModel(path +"/lenet_train_infer.ms");
      expect(ret).assertTrue();
      console.log("==========MSLITE loadModelFromFile===========");
      let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
      expect(predictModel !== null).assertTrue();
      predictModel.trainMode = false;
      console.log("==========MSLITE getInputs===========");
      const predictInputs = predictModel.getInputs();
      for (let i = 0; i < predictInputs.length; i++) {
        let printStr = predictInputs[i].name + ", ";
        printStr += predictInputs[i].shape + ", ";
        printStr += predictInputs[i].dtype + ", ";
        printStr += predictInputs[i].dataSize + ", ";
        printStr += predictInputs[i].getData();
        console.log("==========MSLITE predictInputs===========",printStr);
      }
      predictInputs[0].setData(inputBuffer0.buffer);
      console.log("==========MSLITE predict===========");
      let modelOutputs = await predictModel.predict(predictInputs);
      expect(modelOutputs !== null).assertTrue();
      for (let i = 0; i < modelOutputs.length; i++) {
        let printStr = modelOutputs[i].name + ", ";
        printStr += modelOutputs[i].shape + ", ";
        printStr += modelOutputs[i].dtype + ", ";
        printStr += modelOutputs[i].dataSize + ", ";
        printStr += modelOutputs[i].getData();
        console.log("==========MSLITE modelOutputs===========",printStr);
      }
      let output0 = new Float32Array(modelOutputs[0].getData());
      for (let i = 0; i < 20; i++) {
        console.log('output:', output0[i]);
      }
      console.log("==========MSLITE end===========");
    })

    // 正常场景：设置不存在的损失函数名
    it('SUB_AI_MindSpore_ArkTS_lossName_0002', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let model_file = globalThis.abilityContext.filesDir + '/' + 'lenet_train.ms';
      console.log("==========MSLITE Context===========");
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      context.cpu = {};
      context.cpu.threadNum = 1;
      context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
      console.log("==========MSLITE TrainCfg===========");
      let cfg:mindSporeLite.TrainCfg={};
      cfg.lossName = ["aaa", "bbb", "ccc"];
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      msliteModel.learningRate = 0.001;
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      ret = msliteModel.exportModel(path +"/lenet_train_infer.ms");
      expect(ret).assertTrue();
      console.log("==========MSLITE loadModelFromFile===========");
      let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
      expect(predictModel !== null).assertTrue();
      predictModel.trainMode = false;
      console.log("==========MSLITE getInputs===========");
      const predictInputs = predictModel.getInputs();
      for (let i = 0; i < predictInputs.length; i++) {
        let printStr = predictInputs[i].name + ", ";
        printStr += predictInputs[i].shape + ", ";
        printStr += predictInputs[i].dtype + ", ";
        printStr += predictInputs[i].dataSize + ", ";
        printStr += predictInputs[i].getData();
        console.log("==========MSLITE predictInputs===========",printStr);
      }
      predictInputs[0].setData(inputBuffer0.buffer);
      console.log("==========MSLITE predict===========");
      let modelOutputs = await predictModel.predict(predictInputs);
      expect(modelOutputs !== null).assertTrue();
      for (let i = 0; i < modelOutputs.length; i++) {
        let printStr = modelOutputs[i].name + ", ";
        printStr += modelOutputs[i].shape + ", ";
        printStr += modelOutputs[i].dtype + ", ";
        printStr += modelOutputs[i].dataSize + ", ";
        printStr += modelOutputs[i].getData();
        console.log("==========MSLITE modelOutputs===========",printStr);
      }
      let output0 = new Float32Array(modelOutputs[0].getData());
      for (let i = 0; i < 20; i++) {
        console.log('output:', output0[i]);
      }
      console.log("==========MSLITE end===========");
    })

    // 正常场景：更新权重
    it('SUB_AI_MindSpore_ArkTS_updateWeights_0001', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let model_file = globalThis.abilityContext.filesDir + '/' + 'lenet_train.ms';
      console.log("==========MSLITE Context===========");
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      context.cpu = {};
      context.cpu.threadNum = 1;
      context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
      console.log("==========MSLITE TrainCfg===========");
      let cfg:mindSporeLite.TrainCfg={};
      cfg.lossName = ["loss_fct", "_loss_fn", "SigmoidCrossEntropy"];
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE getWeights===========");
      const weights = msliteModel.getWeights();
      for (let i = 0; i < weights.length; i++) {
        let printStr = weights[i].name + ", ";
        printStr += weights[i].shape + ", ";
        printStr += weights[i].dtype + ", ";
        printStr += weights[i].dataSize + ", ";
        printStr += weights[i].getData();
        console.log("==========MSLITE weights===========",printStr);
      }
      let ret = msliteModel.updateWeights(weights);
      expect(ret).assertTrue();
      console.log("==========MSLITE runStep===========");
      ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE end===========");
    })

    // 正常场景：更新权重后导出训练图，再获取权重
    it('SUB_AI_MindSpore_ArkTS_updateWeights_0002', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let model_file = globalThis.abilityContext.filesDir + '/' + 'lenet_train.ms';
      console.log("==========MSLITE Context===========");
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      context.cpu = {};
      context.cpu.threadNum = 1;
      context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
      console.log("==========MSLITE TrainCfg===========");
      let cfg:mindSporeLite.TrainCfg={};
      cfg.lossName = ["loss_fct", "_loss_fn", "SigmoidCrossEntropy"];
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE getWeights===========");
      const weights = msliteModel.getWeights();
      for (let i = 0; i < weights.length; i++) {
        let printStr = weights[i].name + ", ";
        printStr += weights[i].shape + ", ";
        printStr += weights[i].dtype + ", ";
        printStr += weights[i].dataSize + ", ";
        printStr += weights[i].getData();
        console.log("==========MSLITE weights===========",printStr);
      }
      let ret = msliteModel.updateWeights(weights);
      expect(ret).assertTrue();
      console.log("==========MSLITE runStep===========");
      ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      ret = msliteModel.exportModel(path +"/lenet_train_infer.ms");
      expect(ret).assertTrue();
      console.log("==========MSLITE loadModelFromFile===========");
      let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
      expect(predictModel !== null).assertTrue();
      console.log("==========MSLITE getWeights2===========");
      const weights2 = predictModel.getWeights();
      for (let i = 0; i < weights2.length; i++) {
        let printStr = weights2[i].name + ", ";
        printStr += weights2[i].shape + ", ";
        printStr += weights2[i].dtype + ", ";
        printStr += weights2[i].dataSize + ", ";
        printStr += weights2[i].getData();
        console.log("==========MSLITE weights2===========",printStr);
      }
      console.log("==========MSLITE end===========");
    })

    // 正常场景：训练model导出推理图后对比精度
    it('SUB_AI_MindSpore_ArkTS_exportModel_0001', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let modelBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train.ms");
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      ret = msliteModel.exportModel(path +"/lenet_train_infer.ms");
      expect(ret).assertTrue();
      console.log("==========MSLITE loadModelFromFile===========");
      let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
      expect(predictModel !== null).assertTrue();
      predictModel.trainMode = false;
      console.log("==========MSLITE getInputs===========");
      const predictInputs = predictModel.getInputs();
      for (let i = 0; i < predictInputs.length; i++) {
        let printStr = predictInputs[i].name + ", ";
        printStr += predictInputs[i].shape + ", ";
        printStr += predictInputs[i].dtype + ", ";
        printStr += predictInputs[i].dataSize + ", ";
        printStr += predictInputs[i].getData();
        console.log("==========MSLITE predictInputs===========",printStr);
      }
      predictInputs[0].setData(inputBuffer0.buffer);
      console.log("==========MSLITE predict===========");
      let modelOutputs = await predictModel.predict(predictInputs);
      expect(modelOutputs !== null).assertTrue();
      for (let i = 0; i < modelOutputs.length; i++) {
        let printStr = modelOutputs[i].name + ", ";
        printStr += modelOutputs[i].shape + ", ";
        printStr += modelOutputs[i].dtype + ", ";
        printStr += modelOutputs[i].dataSize + ", ";
        printStr += modelOutputs[i].getData();
        console.log("==========MSLITE modelOutputs===========",printStr);
      }
      let output0 = new Float32Array(modelOutputs[0].getData());
      for (let i = 0; i < 20; i++) {
        console.log('output:', output0[i]);
      }
      console.log("==========MSLITE end===========");
    })

    // 正常场景：quantization_type为OH_AI_NO_QUANT
    it('SUB_AI_MindSpore_ArkTS_exportModel_0002', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let modelBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train.ms");
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.NO_QUANT, true);
      expect(ret).assertTrue();
      console.log("==========MSLITE loadModelFromFile===========");
      let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
      expect(predictModel !== null).assertTrue();
      predictModel.trainMode = false;
      console.log("==========MSLITE getInputs===========");
      const predictInputs = predictModel.getInputs();
      for (let i = 0; i < predictInputs.length; i++) {
        let printStr = predictInputs[i].name + ", ";
        printStr += predictInputs[i].shape + ", ";
        printStr += predictInputs[i].dtype + ", ";
        printStr += predictInputs[i].dataSize + ", ";
        printStr += predictInputs[i].getData();
        console.log("==========MSLITE predictInputs===========",printStr);
      }
      predictInputs[0].setData(inputBuffer0.buffer);
      console.log("==========MSLITE predict===========");
      let modelOutputs = await predictModel.predict(predictInputs);
      expect(modelOutputs !== null).assertTrue();
      for (let i = 0; i < modelOutputs.length; i++) {
        let printStr = modelOutputs[i].name + ", ";
        printStr += modelOutputs[i].shape + ", ";
        printStr += modelOutputs[i].dtype + ", ";
        printStr += modelOutputs[i].dataSize + ", ";
        printStr += modelOutputs[i].getData();
        console.log("==========MSLITE modelOutputs===========",printStr);
      }
      let output0 = new Float32Array(modelOutputs[0].getData());
      for (let i = 0; i < 20; i++) {
        console.log('output:', output0[i]);
      }
      console.log("==========MSLITE end===========");
    })

    // 正常场景：quantization_type为OH_AI_WEIGHT_QUANT
    it('SUB_AI_MindSpore_ArkTS_exportModel_0003', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let modelBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train.ms");
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.WEIGHT_QUANT, true);
      expect(ret).assertTrue();
      console.log("==========MSLITE loadModelFromFile===========");
      let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
      expect(predictModel !== null).assertTrue();
      predictModel.trainMode = false;
      console.log("==========MSLITE getInputs===========");
      const predictInputs = predictModel.getInputs();
      for (let i = 0; i < predictInputs.length; i++) {
        let printStr = predictInputs[i].name + ", ";
        printStr += predictInputs[i].shape + ", ";
        printStr += predictInputs[i].dtype + ", ";
        printStr += predictInputs[i].dataSize + ", ";
        printStr += predictInputs[i].getData();
        console.log("==========MSLITE predictInputs===========",printStr);
      }
      predictInputs[0].setData(inputBuffer0.buffer);
      console.log("==========MSLITE predict===========");
      let modelOutputs = await predictModel.predict(predictInputs);
      expect(modelOutputs !== null).assertTrue();
      for (let i = 0; i < modelOutputs.length; i++) {
        let printStr = modelOutputs[i].name + ", ";
        printStr += modelOutputs[i].shape + ", ";
        printStr += modelOutputs[i].dtype + ", ";
        printStr += modelOutputs[i].dataSize + ", ";
        printStr += modelOutputs[i].getData();
        console.log("==========MSLITE modelOutputs===========",printStr);
      }
      let output0 = new Float32Array(modelOutputs[0].getData());
      for (let i = 0; i < 20; i++) {
        console.log('output:', output0[i]);
      }
      console.log("==========MSLITE end===========");
    })

    // 正常场景：quantization_type为OH_AI_FULL_QUANT
    it('SUB_AI_MindSpore_ArkTS_exportModel_0004', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let modelBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train.ms");
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.FULL_QUANT, true);
      expect(ret).assertTrue();
      console.log("==========MSLITE loadModelFromFile===========");
      let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
      expect(predictModel !== null).assertTrue();
      predictModel.trainMode = false;
      console.log("==========MSLITE getInputs===========");
      const predictInputs = predictModel.getInputs();
      for (let i = 0; i < predictInputs.length; i++) {
        let printStr = predictInputs[i].name + ", ";
        printStr += predictInputs[i].shape + ", ";
        printStr += predictInputs[i].dtype + ", ";
        printStr += predictInputs[i].dataSize + ", ";
        printStr += predictInputs[i].getData();
        console.log("==========MSLITE predictInputs===========",printStr);
      }
      predictInputs[0].setData(inputBuffer0.buffer);
      console.log("==========MSLITE predict===========");
      let modelOutputs = await predictModel.predict(predictInputs);
      expect(modelOutputs !== null).assertTrue();
      for (let i = 0; i < modelOutputs.length; i++) {
        let printStr = modelOutputs[i].name + ", ";
        printStr += modelOutputs[i].shape + ", ";
        printStr += modelOutputs[i].dtype + ", ";
        printStr += modelOutputs[i].dataSize + ", ";
        printStr += modelOutputs[i].getData();
        console.log("==========MSLITE modelOutputs===========",printStr);
      }
      let output0 = new Float32Array(modelOutputs[0].getData());
      for (let i = 0; i < 20; i++) {
        console.log('output:', output0[i]);
      }
      console.log("==========MSLITE end===========");
    })

    // 正常场景：export_inference_only为false
    it('SUB_AI_MindSpore_ArkTS_exportModel_0005', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let modelBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train.ms");
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      ret = msliteModel.exportModel(path +"/lenet_train_train.ms", mindSporeLite.QuantizationType.NO_QUANT, false);
      expect(ret).assertTrue();
      console.log("==========MSLITE loadModelFromFile===========");
      let msliteModel2 = await mindSporeLite.loadTrainModelFromFile(path +"/lenet_train_train.ms");
      expect(msliteModel2 !== null).assertTrue();
      msliteModel2.trainMode = true;
      console.log("==========MSLITE getInputs2===========");
      const modelInputs2 = msliteModel.getInputs();
      for (let i = 0; i < modelInputs2.length; i++) {
        let printStr = modelInputs2[i].name + ", ";
        printStr += modelInputs2[i].shape + ", ";
        printStr += modelInputs2[i].dtype + ", ";
        printStr += modelInputs2[i].dataSize + ", ";
        printStr += modelInputs2[i].getData();
        console.log("==========MSLITE modelInputs2===========",printStr);
      }
      modelInputs2[0].setData(inputBuffer0.buffer);
      modelInputs2[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      ret = msliteModel2.runStep(modelInputs2);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.NO_QUANT, true);
      expect(ret).assertTrue();
      console.log("==========MSLITE loadModelFromFile===========");
      let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
      expect(predictModel !== null).assertTrue();
      predictModel.trainMode = false;
      console.log("==========MSLITE getInputs===========");
      const predictInputs = predictModel.getInputs();
      for (let i = 0; i < predictInputs.length; i++) {
        let printStr = predictInputs[i].name + ", ";
        printStr += predictInputs[i].shape + ", ";
        printStr += predictInputs[i].dtype + ", ";
        printStr += predictInputs[i].dataSize + ", ";
        printStr += predictInputs[i].getData();
        console.log("==========MSLITE predictInputs===========",printStr);
      }
      predictInputs[0].setData(inputBuffer0.buffer);
      console.log("==========MSLITE predict===========");
      let modelOutputs = await predictModel.predict(predictInputs);
      expect(modelOutputs !== null).assertTrue();
      for (let i = 0; i < modelOutputs.length; i++) {
        let printStr = modelOutputs[i].name + ", ";
        printStr += modelOutputs[i].shape + ", ";
        printStr += modelOutputs[i].dtype + ", ";
        printStr += modelOutputs[i].dataSize + ", ";
        printStr += modelOutputs[i].getData();
        console.log("==========MSLITE modelOutputs===========",printStr);
      }
      let output0 = new Float32Array(modelOutputs[0].getData());
      for (let i = 0; i < 20; i++) {
        console.log('output:', output0[i]);
      }
      console.log("==========MSLITE end===========");
    })

    // 正常场景：export_inference_only为false，再指定output_tensor_name
    it('SUB_AI_MindSpore_ArkTS_exportModel_0006', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let modelBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train.ms");
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      let outputTensorName = ["Default/network-WithLossCell/_loss_fn-L1Loss/ReduceMean-op127"]
      ret = msliteModel.exportModel(path +"/lenet_train_train.ms", mindSporeLite.QuantizationType.NO_QUANT, false, outputTensorName);
      expect(ret).assertTrue();
      console.log("==========MSLITE loadModelFromFile===========");
      let msliteModel2 = await mindSporeLite.loadTrainModelFromFile(path +"/lenet_train_train.ms");
      expect(msliteModel2 !== null).assertTrue();
      msliteModel2.trainMode = true;
      console.log("==========MSLITE getInputs2===========");
      const modelInputs2 = msliteModel.getInputs();
      for (let i = 0; i < modelInputs2.length; i++) {
        let printStr = modelInputs2[i].name + ", ";
        printStr += modelInputs2[i].shape + ", ";
        printStr += modelInputs2[i].dtype + ", ";
        printStr += modelInputs2[i].dataSize + ", ";
        printStr += modelInputs2[i].getData();
        console.log("==========MSLITE modelInputs2===========",printStr);
      }
      modelInputs2[0].setData(inputBuffer0.buffer);
      modelInputs2[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      ret = msliteModel2.runStep(modelInputs2);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.NO_QUANT, true);
      expect(ret).assertTrue();
      console.log("==========MSLITE loadModelFromFile===========");
      let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
      expect(predictModel !== null).assertTrue();
      predictModel.trainMode = false;
      console.log("==========MSLITE getInputs===========");
      const predictInputs = predictModel.getInputs();
      for (let i = 0; i < predictInputs.length; i++) {
        let printStr = predictInputs[i].name + ", ";
        printStr += predictInputs[i].shape + ", ";
        printStr += predictInputs[i].dtype + ", ";
        printStr += predictInputs[i].dataSize + ", ";
        printStr += predictInputs[i].getData();
        console.log("==========MSLITE predictInputs===========",printStr);
      }
      predictInputs[0].setData(inputBuffer0.buffer);
      console.log("==========MSLITE predict===========");
      let modelOutputs = await predictModel.predict(predictInputs);
      expect(modelOutputs !== null).assertTrue();
      for (let i = 0; i < modelOutputs.length; i++) {
        let printStr = modelOutputs[i].name + ", ";
        printStr += modelOutputs[i].shape + ", ";
        printStr += modelOutputs[i].dtype + ", ";
        printStr += modelOutputs[i].dataSize + ", ";
        printStr += modelOutputs[i].getData();
        console.log("==========MSLITE modelOutputs===========",printStr);
      }
      let output0 = new Float32Array(modelOutputs[0].getData());
      for (let i = 0; i < 20; i++) {
        console.log('output:', output0[i]);
      }
      console.log("==========MSLITE end===========");
    })

    // 异常场景：指定导出不存在的output_tensor_name
    it('SUB_AI_MindSpore_ArkTS_exportModel_0007', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let modelBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train.ms");
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      let outputTensorName = ["aaa"]
      ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", 0, true, outputTensorName);
      expect(ret).assertFalse();
      console.log("==========MSLITE end===========");
    })

    // 异常场景：model_file文件路径不存在
    it('SUB_AI_MindSpore_ArkTS_exportModel_0008', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let modelBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train.ms");
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      ret = msliteModel.exportModel("/data/local/tmp/not_exist/lenet_train_infer.ms");
      expect(ret).assertFalse();
      console.log("==========MSLITE end===========");
    })

    // 异常场景：model_file路径为空
    it('SUB_AI_MindSpore_ArkTS_exportModel_0009', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let modelBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train.ms");
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      ret = msliteModel.exportModel("");
      expect(ret).assertFalse();
      console.log("==========MSLITE end===========");
    })

    // 异常场景：model_file路径为文件夹
    it('SUB_AI_MindSpore_ArkTS_exportModel_0010', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let modelBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train.ms");
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      ret = msliteModel.exportModel("/data/local/tmp");
      expect(ret).assertFalse();
      console.log("==========MSLITE end===========");
    })

    // 正常场景：训练model更新并导出micro权重
    it('SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_0001', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let syscontext: common.Context = globalThis.context
      let inputBuffer0: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_0.input");
      let inputBuffer1: Uint8Array= await syscontext.resourceManager.getRawFileContent("lenet_train_1.input");
      let model_file = globalThis.abilityContext.filesDir + '/' + 'lenet_train.ms';
      console.log("==========MSLITE Context===========");
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      context.cpu = {};
      context.cpu.threadNum = 1;
      context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
      console.log("==========MSLITE TrainCfg===========");
      let cfg:mindSporeLite.TrainCfg={};
      cfg.lossName = ["loss_fct", "_loss_fn", "SigmoidCrossEntropy"];
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE trainMode===========", msliteModel.trainMode);
      msliteModel.trainMode = true;
      console.log("==========MSLITE set trainMode===========", msliteModel.trainMode);
      console.log("==========MSLITE getInputs===========");
      const modelInputs = msliteModel.getInputs();
      for (let i = 0; i < modelInputs.length; i++) {
        let printStr = modelInputs[i].name + ", ";
        printStr += modelInputs[i].shape + ", ";
        printStr += modelInputs[i].dtype + ", ";
        printStr += modelInputs[i].dataSize + ", ";
        printStr += modelInputs[i].getData();
        console.log("==========MSLITE modelInputs===========",printStr);
      }
      modelInputs[0].setData(inputBuffer0.buffer);
      modelInputs[1].setData(inputBuffer1.buffer);
      console.log("==========MSLITE runStep===========");
      let ret = msliteModel.runStep(modelInputs);
      expect(ret).assertTrue();
      console.log("==========MSLITE exportModel===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      ret = msliteModel.exportWeightsCollaborateWithMicro(path +"/micro_weight.bin");
      expect(ret).assertTrue();
      console.log("==========MSLITE end===========");
    })

    // 异常场景：weight_file文件路径不存在
    it('SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_0002', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let model_file = globalThis.abilityContext.filesDir + '/' + 'lenet_train.ms';
      console.log("==========MSLITE Context===========");
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      context.cpu = {};
      context.cpu.threadNum = 1;
      context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
      console.log("==========MSLITE TrainCfg===========");
      let cfg:mindSporeLite.TrainCfg={};
      cfg.lossName = ["loss_fct", "_loss_fn", "SigmoidCrossEntropy"];
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE exportWeightsCollaborateWithMicro===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      let ret = msliteModel.exportWeightsCollaborateWithMicro(path +"/not_exist/micro_weight.bin");
      expect(ret).assertFalse();
      console.log("==========MSLITE end===========");
    })

    // 异常场景：weight_file路径为空
    it('SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_0003', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let model_file = globalThis.abilityContext.filesDir + '/' + 'lenet_train.ms';
      console.log("==========MSLITE Context===========");
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      context.cpu = {};
      context.cpu.threadNum = 1;
      context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
      console.log("==========MSLITE TrainCfg===========");
      let cfg:mindSporeLite.TrainCfg={};
      cfg.lossName = ["loss_fct", "_loss_fn", "SigmoidCrossEntropy"];
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE exportWeightsCollaborateWithMicro===========");
      let ret = msliteModel.exportWeightsCollaborateWithMicro("");
      expect(ret).assertFalse();
      console.log("==========MSLITE end===========");
    })

    // 异常场景：weight_file路径为文件夹
    it('SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_0004', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let model_file = globalThis.abilityContext.filesDir + '/' + 'lenet_train.ms';
      console.log("==========MSLITE Context===========");
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      context.cpu = {};
      context.cpu.threadNum = 1;
      context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
      console.log("==========MSLITE TrainCfg===========");
      let cfg:mindSporeLite.TrainCfg={};
      cfg.lossName = ["loss_fct", "_loss_fn", "SigmoidCrossEntropy"];
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE exportWeightsCollaborateWithMicro===========");
      let ret = msliteModel.exportWeightsCollaborateWithMicro("/data/local/tmp");
      expect(ret).assertFalse();
      console.log("==========MSLITE end===========");
    })

    // 异常场景：is_inference为false
    it('SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_0005', Level.LEVEL0, async () => {
      console.log("==========MSLITE start===========");
      let model_file = globalThis.abilityContext.filesDir + '/' + 'lenet_train.ms';
      console.log("==========MSLITE Context===========");
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      context.cpu = {};
      context.cpu.threadNum = 1;
      context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
      console.log("==========MSLITE TrainCfg===========");
      let cfg:mindSporeLite.TrainCfg={};
      cfg.lossName = ["loss_fct", "_loss_fn", "SigmoidCrossEntropy"];
      console.log("==========MSLITE loadModel===========");
      let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
      expect(msliteModel !== null).assertTrue();
      console.log("==========MSLITE exportWeightsCollaborateWithMicro===========");
      let path : String = globalThis.abilityContext.filesDir;
      console.log("==========MSLITE path===========",path);
      let ret = msliteModel.exportWeightsCollaborateWithMicro(path +"/not_exist/micro_weight.bin", false);
      expect(ret).assertFalse();
      console.log("==========MSLITE end===========");
    })


    // 正常场景：ModelBuild，调用buffer方法，正常推理
    it('Test_load_model_param_model_buffer', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_buffer");
      let modelName = 'ml_face_isface.ms';
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context
      let inputBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let modelBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(modelName);
      let context: mindSporeLite.Context = {};
      context.target = ["cpu", "nnrt"];
      context.nnrt = {};
      context.cpu = {};
      context.cpu.threadNum = 1;
      context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
      context.cpu.precisionMode = "preferred_fp16";
      context.cpu.threadAffinityCoreList = [0, 1, 2, 3];
      let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context)
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      let input_name = modelInputs[0].name;
      console.log(input_name.toString());
      expect(input_name.toString()).assertEqual("data");
      let input_shape = modelInputs[0].shape;
      console.log(input_shape.toString());
      expect(input_shape.toString()).assertEqual("1,48,48,3")
      let input_elementNum = modelInputs[0].elementNum;
      console.log(input_elementNum.toString());
      expect(input_elementNum.toString()).assertEqual("6912");
      let input_dtype = modelInputs[0].dtype;
      console.log(input_dtype.toString());
      expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      let input_format = modelInputs[0].format;
      console.log(input_format.toString());
      expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize = modelInputs[0].dataSize;
      console.log(input_dataSize.toString());
      expect(input_dataSize.toString()).assertEqual("27648");
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })

    // 正常场景：ModelBuild，调用fd方法，正常推理
    it('Test_load_model_param_model_fd', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_fd");
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      console.log('=========MSLITE loadModel start=====');
      let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
      let msliteModel = await mindSporeLite.loadModelFromFd(file.fd);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      let input_name = modelInputs[0].name;
      console.log(input_name.toString());
      expect(input_name.toString()).assertEqual("data");
      let input_shape = modelInputs[0].shape;
      console.log(input_shape.toString());
      expect(input_shape.toString()).assertEqual("1,48,48,3");
      let input_elementNum = modelInputs[0].elementNum;
      console.log(input_elementNum.toString());
      expect(input_elementNum.toString()).assertEqual("6912");
      let input_dtype = modelInputs[0].dtype;
      console.log(input_dtype.toString());
      expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      let input_format = modelInputs[0].format;
      console.log(input_format.toString());
      expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize = modelInputs[0].dataSize;
      console.log(input_dataSize.toString());
      expect(input_dataSize.toString()).assertEqual("27648");
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })

    // 正常场景：ModelBuild，调用loadModelFromFile方法，正常推理
    it('Test_load_model_param_model_path', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path");
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let context:mindSporeLite.Context={};
      context.target = ["cpu", "nnrt"];
      context.nnrt = {};
      context.cpu = {};
      context.cpu.threadNum = 1;
      context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
      context.cpu.precisionMode = "preferred_fp16";
      context.cpu.threadAffinityCoreList = [0, 1, 2, 3];
      console.log('=========MSLITE loadModel start=====');
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      let input_name = modelInputs[0].name;
      console.log(input_name.toString());
      expect(input_name.toString()).assertEqual("data");
      let input_shape = modelInputs[0].shape;
      console.log(input_shape.toString());
      expect(input_shape.toString()).assertEqual("1,48,48,3")
      let input_elementNum = modelInputs[0].elementNum;
      console.log(input_elementNum.toString());
      expect(input_elementNum.toString()).assertEqual("6912");
      let input_dtype = modelInputs[0].dtype;
      console.log(input_dtype.toString());
      expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      let input_format = modelInputs[0].format;
      console.log(input_format.toString());
      expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize = modelInputs[0].dataSize;
      console.log(input_dataSize.toString());
      expect(input_dataSize.toString()).assertEqual("27648");
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })

    //正常场景：Context设置CPU，4线程
    it('Test_load_model_param_model_path_settings_threads_001', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_settings_threads_001");
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      context.cpu = {
        "threadNum": 4,
      }
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      let input_name = modelInputs[0].name;
      console.log(input_name.toString());
      expect(input_name.toString()).assertEqual("data");
      let input_shape = modelInputs[0].shape;
      console.log(input_shape.toString());
      expect(input_shape.toString()).assertEqual("1,48,48,3")
      let input_elementNum = modelInputs[0].elementNum;
      console.log(input_elementNum.toString());
      expect(input_elementNum.toString()).assertEqual("6912");
      let input_dtype = modelInputs[0].dtype;
      console.log(input_dtype.toString());
      expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      let input_format = modelInputs[0].format;
      console.log(input_format.toString());
      expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize = modelInputs[0].dataSize;
      console.log(input_dataSize.toString());
      expect(input_dataSize.toString()).assertEqual("27648");
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })

    //正常场景：Context设置CPU，2线程
    it('Test_load_model_param_model_path_settings_threads_002', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_settings_threads_002");
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      context.cpu = {
        "threadNum": 2,
      }
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      let input_name = modelInputs[0].name;
      console.log(input_name.toString());
      expect(input_name.toString()).assertEqual("data");
      let input_shape = modelInputs[0].shape;
      console.log(input_shape.toString());
      expect(input_shape.toString()).assertEqual("1,48,48,3")
      let input_elementNum = modelInputs[0].elementNum;
      console.log(input_elementNum.toString());
      expect(input_elementNum.toString()).assertEqual("6912");
      let input_dtype = modelInputs[0].dtype;
      console.log(input_dtype.toString());
      expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      let input_format = modelInputs[0].format;
      console.log(input_format.toString());
      expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize = modelInputs[0].dataSize;
      console.log(input_dataSize.toString());
      expect(input_dataSize.toString()).assertEqual("27648");
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })

    //正常场景：Context设置CPU，1线程
    it('Test_load_model_param_model_path_settings_threads_003', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_settings_threads_003");
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength)
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      context.cpu = {
        "threadNum": 1,
      }
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      let input_name = modelInputs[0].name;
      console.log(input_name.toString());
      expect(input_name.toString()).assertEqual("data");
      let input_shape = modelInputs[0].shape;
      console.log(input_shape.toString());
      expect(input_shape.toString()).assertEqual("1,48,48,3");
      let input_elementNum = modelInputs[0].elementNum;
      console.log(input_elementNum.toString());
      expect(input_elementNum.toString()).assertEqual("6912");
      let input_dtype = modelInputs[0].dtype;
      console.log(input_dtype.toString());
      expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      let input_format = modelInputs[0].format;
      console.log(input_format.toString());
      expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize = modelInputs[0].dataSize;
      console.log(input_dataSize.toString());
      expect(input_dataSize.toString()).assertEqual("27648");
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })

    //正常场景：Context设置CPU，0线程
    it('Test_load_model_param_model_path_settings_threads_004', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_settings_threads_004");
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      context.cpu = {
        "threadNum": 0,
      }
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      let input_name = modelInputs[0].name;
      console.log(input_name.toString());
      expect(input_name.toString()).assertEqual("data");
      let input_shape = modelInputs[0].shape;
      console.log(input_shape.toString());
      expect(input_shape.toString()).assertEqual("1,48,48,3")
      let input_elementNum = modelInputs[0].elementNum;
      console.log(input_elementNum.toString());
      expect(input_elementNum.toString()).assertEqual("6912");
      let input_dtype = modelInputs[0].dtype;
      console.log(input_dtype.toString());
      expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      let input_format = modelInputs[0].format;
      console.log(input_format.toString());
      expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize = modelInputs[0].dataSize;
      console.log(input_dataSize.toString());
      expect(input_dataSize.toString()).assertEqual("27648");
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })

    //异常场景：Context设置CPU，绑核设置为3，绑核失败
    it('Test_load_model_param_model_path_settings_affinity_001', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_settings_affinity_001");
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      context.cpu={};
      context.cpu.threadAffinityMode = 3;
      console.log("MSLITE api test: set threadAffinityMode=3.");
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
      expect(msliteModel).assertUndefined();
    })

    ///异常场景：Context设置CPU，绑核设置为2，绑小核
    it('Test_load_model_param_model_path_settings_affinity_002', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_settings_affinity_002");
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      context.cpu={};
      context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.LITTLE_CORES_FIRST;
      console.log("MSLITE api test: set threadAffinityMode=2.");
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      let input_name = modelInputs[0].name;
      console.log(input_name.toString());
      expect(input_name.toString()).assertEqual("data");
      let input_shape = modelInputs[0].shape;
      console.log(input_shape.toString());
      expect(input_shape.toString()).assertEqual("1,48,48,3");
      let input_elementNum = modelInputs[0].elementNum;
      console.log(input_elementNum.toString());
      expect(input_elementNum.toString()).assertEqual("6912");
      let input_dtype = modelInputs[0].dtype;
      console.log(input_dtype.toString());
      expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      let input_format = modelInputs[0].format;
      console.log(input_format.toString());
      expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize = modelInputs[0].dataSize;
      console.log(input_dataSize.toString());
      expect(input_dataSize.toString()).assertEqual("27648");
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })

    //异常场景：Context设置CPU，绑核设置为1，绑大核
    it('Test_load_model_param_model_path_settings_affinity_003', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_settings_affinity_003");
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength)
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      context.cpu={};
      context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
      console.log("MSLITE api test: set threadAffinityMode=1.");
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      let input_name = modelInputs[0].name;
      console.log(input_name.toString());
      expect(input_name.toString()).assertEqual("data");
      let input_shape = modelInputs[0].shape;
      console.log(input_shape.toString());
      expect(input_shape.toString()).assertEqual("1,48,48,3")
      let input_elementNum = modelInputs[0].elementNum;
      console.log(input_elementNum.toString());
      expect(input_elementNum.toString()).assertEqual("6912");
      let input_dtype = modelInputs[0].dtype;
      console.log(input_dtype.toString());
      expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      let input_format = modelInputs[0].format;
      console.log(input_format.toString());
      expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize = modelInputs[0].dataSize;
      console.log(input_dataSize.toString());
      expect(input_dataSize.toString()).assertEqual("27648");
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })

    //正常场景：Context设置CPU，绑核设置为0，不绑核
    it('Test_load_model_param_model_path_settings_affinity_004', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_settings_affinity_004");
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      context.cpu={};
      context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.NO_AFFINITIES;
      console.log("MSLITE api test: set threadAffinityMode=0.");
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      let input_name = modelInputs[0].name;
      console.log(input_name.toString());
      expect(input_name.toString()).assertEqual("data");
      let input_shape = modelInputs[0].shape;
      console.log(input_shape.toString());
      expect(input_shape.toString()).assertEqual("1,48,48,3")
      let input_elementNum = modelInputs[0].elementNum;
      console.log(input_elementNum.toString());
      expect(input_elementNum.toString()).assertEqual("6912");
      let input_dtype = modelInputs[0].dtype;
      console.log(input_dtype.toString());
      expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      let input_format = modelInputs[0].format;
      console.log(input_format.toString());
      expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize = modelInputs[0].dataSize;
      console.log(input_dataSize.toString());
      expect(input_dataSize.toString()).assertEqual("27648");
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })

    //正常场景：Context设置CPU，绑核列表[0,1,2,3]
    it('Test_load_model_param_model_path_settings_affinity_list_001', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_settings_affinity_list_001");
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      context.cpu={};
      context.cpu.threadAffinityCoreList = [0, 1, 2, 3];
      console.log("MSLITE api test: set threadAffinityCoreList=[0, 1, 2, 3].");
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      let input_name = modelInputs[0].name;
      console.log(input_name.toString());
      expect(input_name.toString()).assertEqual("data");
      let input_shape = modelInputs[0].shape;
      console.log(input_shape.toString());
      expect(input_shape.toString()).assertEqual("1,48,48,3")
      let input_elementNum = modelInputs[0].elementNum;
      console.log(input_elementNum.toString());
      expect(input_elementNum.toString()).assertEqual("6912");
      let input_dtype = modelInputs[0].dtype;
      console.log(input_dtype.toString());
      expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      let input_format = modelInputs[0].format;
      console.log(input_format.toString());
      expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize = modelInputs[0].dataSize;
      console.log(input_dataSize.toString());
      expect(input_dataSize.toString()).assertEqual("27648");
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })

    //异常场景：ModelBuild，调用model path方法，path为空
    it('Test_load_model_param_model_path_is_None_001',Level.LEVEL0, async (done: Function) => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_is_None_001");
      let model_file = "";
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
      console.log('=========MSLITE loadModel end=====');
      expect(msliteModel).assertUndefined();
      done();
    })

    //异常场景：ModelBuild，调用buffer方法，modelBuffer为None
    it('Test_load_model_param_model_buffer_is_None_001',Level.LEVEL0, async (done: Function) => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_buffer_is_None_001");
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      let msliteModel = await mindSporeLite.loadModelFromBuffer(null, context);
      console.log('=========MSLITE loadModel end=====');
      expect(msliteModel).assertUndefined();
      done();
    })

    //异常场景：ModelBuild，context为null
    it('Test_load_model_param_model_path_context_is_None_001',Level.LEVEL0, async (done: Function) => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_context_is_None_001");
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file, null);
      expect(msliteModel).assertUndefined();
      console.log('=========MSLITE loadModel end=====');
      done();
    })

    // 正常场景：ModelResize，shape与之前一致
    it('Test_load_model_param_model_path_resize_001', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_resize_001");
      let inputName = 'ml_ocr_cn_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_ocr_cn.ms';
      let inputBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      let input_name = modelInputs[0].name;
      console.log(input_name.toString());
      expect(input_name.toString()).assertEqual("data");
      let input_shape = modelInputs[0].shape;
      console.log(input_shape.toString());
      expect(input_shape.toString()).assertEqual("1,32,512,1");
      let input_elementNum = modelInputs[0].elementNum;
      console.log(input_elementNum.toString());
      expect(input_elementNum.toString()).assertEqual("16384");
      let input_dtype = modelInputs[0].dtype;
      console.log(input_dtype.toString());
      expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      let input_format = modelInputs[0].format;
      console.log(input_format.toString());
      expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize = modelInputs[0].dataSize;
      console.log(input_dataSize.toString());
      expect(input_dataSize.toString()).assertEqual("65536");
      console.log('=========MSLITE resize start=====');
      let new_dim = new Array([1, 32, 512, 1]);
      let resize_result = msliteModel.resize(modelInputs, new_dim);
      expect(resize_result).assertTrue();
      console.log('=========MSLITE resize success=====');
      const modelInputs2 = msliteModel.getInputs();
      let input_name2 = modelInputs2[0].name;
      console.log(input_name2.toString());
      expect(input_name2.toString()).assertEqual("data");
      let input_shape2 = modelInputs2[0].shape;
      console.log(input_shape2.toString());
      expect(input_shape2.toString()).assertEqual("1,32,512,1");
      let input_elementNum2 = modelInputs2[0].elementNum;
      console.log(input_elementNum2.toString());
      expect(input_elementNum2.toString()).assertEqual("16384");
      let input_dtype2 = modelInputs2[0].dtype;
      console.log(input_dtype2.toString());
      expect(input_dtype2).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      let input_format2 = modelInputs2[0].format;
      console.log(input_format2.toString());
      expect(input_format2).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize2 = modelInputs2[0].dataSize;
      console.log(input_dataSize2.toString());
      expect(input_dataSize2.toString()).assertEqual("65536");
      modelInputs2[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs2);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })

    // 正常场景：ModelResize，shape与之前不一致
    it('Test_load_model_param_model_path_resize_002', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_resize_002");
      let inputName = 'ml_ocr_cn_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_ocr_cn.ms';
      let inputBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      let input_name = modelInputs[0].name;
      console.log(input_name.toString());
      expect(input_name.toString()).assertEqual("data");
      let input_shape = modelInputs[0].shape;
      console.log(input_shape.toString());
      expect(input_shape.toString()).assertEqual("1,32,512,1");
      let input_elementNum = modelInputs[0].elementNum;
      console.log(input_elementNum.toString());
      expect(input_elementNum.toString()).assertEqual("16384");
      let input_dtype = modelInputs[0].dtype;
      console.log(input_dtype.toString());
      expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      let input_format = modelInputs[0].format;
      console.log(input_format.toString());
      expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize = modelInputs[0].dataSize;
      console.log(input_dataSize.toString());
      expect(input_dataSize.toString()).assertEqual("65536");
      console.log('=========MSLITE resize start=====');
      let new_dim = new Array([1,64,256,1]);
      let resize_result = msliteModel.resize(modelInputs, new_dim);
      expect(resize_result).assertTrue();
      console.log('=========MSLITE resize success=====');
      const modelInputs2 = msliteModel.getInputs();
      let input_name2 = modelInputs2[0].name;
      console.log(input_name2.toString());
      expect(input_name2.toString()).assertEqual("data");
      let input_shape2 = modelInputs2[0].shape;
      console.log(input_shape2.toString());
      expect(input_shape2.toString()).assertEqual("1,64,256,1");
      let input_elementNum2 = modelInputs2[0].elementNum;
      console.log(input_elementNum2.toString());
      expect(input_elementNum2.toString()).assertEqual("16384");
      let input_dtype2 = modelInputs2[0].dtype;
      console.log(input_dtype2.toString());
      expect(input_dtype2).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      let input_format2 = modelInputs2[0].format;
      console.log(input_format2.toString());
      expect(input_format2).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize2 = modelInputs2[0].dataSize;
      console.log(input_dataSize2.toString());
      expect(input_dataSize2.toString()).assertEqual("65536");
      modelInputs2[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs2);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })

    // 异常场景：ModelResize，shape为三维
    it('Test_load_model_param_model_path_resize_003', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_resize_003");
      let inputName = 'ml_ocr_cn_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_ocr_cn.ms';
      let inputBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      let input_name = modelInputs[0].name;
      console.log(input_name.toString());
      expect(input_name.toString()).assertEqual("data");
      let input_shape = modelInputs[0].shape;
      console.log(input_shape.toString());
      expect(input_shape.toString()).assertEqual("1,32,512,1");
      let input_elementNum = modelInputs[0].elementNum;
      console.log(input_elementNum.toString());
      expect(input_elementNum.toString()).assertEqual("16384");
      let input_dtype = modelInputs[0].dtype;
      console.log(input_dtype.toString());
      expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      let input_format = modelInputs[0].format;
      console.log(input_format.toString());
      expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize = modelInputs[0].dataSize;
      console.log(input_dataSize.toString());
      expect(input_dataSize.toString()).assertEqual("65536");
      console.log('=========MSLITE resize start=====');
      let new_dim = new Array([1,32,1]);
      let resize_result = msliteModel.resize(modelInputs, new_dim);
      expect(resize_result).assertFalse;
      console.log('=========MSLITE resize failed=====');
    })

    // 异常场景：ModelResize，不支持resize的模型
    it('Test_load_model_param_model_path_resize_004', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_resize_004");
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      let input_name = modelInputs[0].name;
      console.log(input_name.toString());
      expect(input_name.toString()).assertEqual("data");
      console.log(modelInputs[0].shape.toString());
      expect(modelInputs[0].shape.toString()).assertEqual("1,48,48,3");
      console.log(modelInputs[0].elementNum.toString());
      expect(modelInputs[0].elementNum.toString()).assertEqual("6912");
      let input_dtype = modelInputs[0].dtype;
      console.log(input_dtype.toString());
      expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      let input_format = modelInputs[0].format;
      console.log(input_format.toString());
      expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize = modelInputs[0].dataSize;
      console.log(input_dataSize.toString());
      expect(input_dataSize.toString()).assertEqual("27648");
      console.log('=========MSLITE resize start=====');
      let new_dim = new Array([1,96,96,1]);
      let resize_result = msliteModel.resize(modelInputs, new_dim);
      expect(resize_result).assertFalse();
      console.log('=========MSLITE resize failed=====');
    })

    // 异常场景：ModelResize，shape值有负数
    it('Test_load_model_param_model_path_resize_005', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_resize_005");
      let inputName = 'ml_ocr_cn_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_ocr_cn.ms';
      let inputBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      let input_name = modelInputs[0].name;
      console.log(input_name.toString());
      expect(input_name.toString()).assertEqual("data");
      let input_shape = modelInputs[0].shape;
      console.log(input_shape.toString());
      expect(input_shape.toString()).assertEqual("1,32,512,1");
      let input_elementNum = modelInputs[0].elementNum;
      console.log(input_elementNum.toString());
      expect(input_elementNum.toString()).assertEqual("16384");
      let input_dtype = modelInputs[0].dtype;
      console.log(input_dtype.toString());
      expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      let input_format = modelInputs[0].format;
      console.log(input_format.toString());
      expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize = modelInputs[0].dataSize;
      console.log(input_dataSize.toString());
      expect(input_dataSize.toString()).assertEqual("65536");
      console.log('=========MSLITE resize start=====');
      let new_dim = new Array([1,-32,32,1]);
      let resize_result = msliteModel.resize(modelInputs, new_dim);
      expect(resize_result).assertFalse();
      console.log('=========MSLITE resize failed=====');
    })

    // 正常场景：Build一次，Predict多次
    it('Test_load_model_param_model_path_much_predict_001',Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_much_predict_001");
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      let input_name = modelInputs[0].name;
      console.log(input_name.toString());
      expect(input_name.toString()).assertEqual("data");
      let input_shape = modelInputs[0].shape;
      console.log(input_shape.toString());
      expect(input_shape.toString()).assertEqual("1,48,48,3");
      let input_elementNum = modelInputs[0].elementNum;
      console.log(input_elementNum.toString());
      expect(input_elementNum.toString()).assertEqual("6912");
      let input_dtype = modelInputs[0].dtype;
      console.log(input_dtype.toString());
      expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      let input_format = modelInputs[0].format;
      console.log(input_format.toString());
      expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize = modelInputs[0].dataSize;
      console.log(input_dataSize.toString());
      expect(input_dataSize.toString()).assertEqual("27648");
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let num = 0;
      for (let i = 0; i < 10; i++) {
        let modelOutputs = await msliteModel.predict(modelInputs);
        expect(modelOutputs !== null).assertTrue();
        console.log('=========MSLITE new Float32Array start=====');
        let output0 = new Float32Array(modelOutputs[0].getData());
        expect(output0.length).assertLarger(0);
        console.log('output0.length:' + output0.length);
        for (let z = 0; z < 2; z++) {
          console.log(output0[z].toString());
          expect(output0[z].toString() !== null).assertTrue();
        }
        const modelInputs0 = msliteModel.getInputs();
        console.log(modelInputs0[0].name.toString());
        console.log('=========MSLITE new Float32Array end=====');
        console.log('=========i.toString()=====');
        console.log(i.toString());
        ++num;
        console.log('=========num.toString()=====');
        console.log(num.toString());
      }
    })

    // 异常场景：Build多次
    it('Test_load_model_param_model_path_much_build_001', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_much_build_001");
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      for (let i = 0; i < 10; i++) {
        mindSporeLite.loadModelFromFile(model_file);
      }
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      let input_name = modelInputs[0].name;
      console.log(input_name.toString());
      expect(input_name.toString()).assertEqual("data");
      let input_shape = modelInputs[0].shape;
      console.log(input_shape.toString());
      expect(input_shape.toString()).assertEqual("1,48,48,3");
      let input_elementNum = modelInputs[0].elementNum;
      console.log(input_elementNum.toString());
      expect(input_elementNum.toString()).assertEqual("6912");
      let input_dtype = modelInputs[0].dtype;
      console.log(input_dtype.toString());
      expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      let input_format = modelInputs[0].format;
      console.log(input_format.toString());
      expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize = modelInputs[0].dataSize;
      console.log(input_dataSize.toString());
      expect(input_dataSize.toString()).assertEqual("27648");
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })

    // 正常场景：单输入模型
    it('Test_load_model_param_model_path_model_001', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_model_001");
      let modelName = 'ml_face_isface.ms';
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let inputBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let modelBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(modelName);
      let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      let input_name = modelInputs[0].name;
      console.log(input_name.toString());
      expect(input_name.toString()).assertEqual("data");
      console.log(modelInputs[0].shape.toString());
      expect(modelInputs[0].shape.toString()).assertEqual("1,48,48,3");
      console.log(modelInputs[0].elementNum.toString());
      expect(modelInputs[0].elementNum.toString()).assertEqual("6912");
      let input_dtype = modelInputs[0].dtype;
      console.log(input_dtype.toString());
      expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      let input_format = modelInputs[0].format;
      console.log(input_format.toString());
      expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize = modelInputs[0].dataSize;
      console.log(input_dataSize.toString());
      expect(input_dataSize.toString()).assertEqual("27648");
      modelInputs[0].setData(inputBuffer.buffer);
      let Inputs2 = new Float32Array(modelInputs[0].getData());
      for (let i = 0; i < 5; i++) {
        console.log(Inputs2[i].toString());

      }
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })

    // 正常场景：多输入模型
    it('Test_load_model_param_model_path_model_002', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_model_002");
      let modelName = 'ml_video_edit_face_cutout_portraitSeg_deconv.ms';
      let inputName01 = 'ml_video_edit_face_cutout_portraitSeg_deconv_0.input';
      let inputName02 = 'ml_video_edit_face_cutout_portraitSeg_deconv_1.input';
      let syscontext: common.Context = globalThis.context;
      let inputBuffer01 = await syscontext.resourceManager.getRawFileContent(inputName01);
      let inputBuffer02 = await syscontext.resourceManager.getRawFileContent(inputName02);
      console.log('=========MSLITE success, input01 bin bytelength: ' + inputBuffer01.byteLength);
      console.log('=========MSLITE success, input02 bin bytelength: ' + inputBuffer02.byteLength);
      let modelBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(modelName);
      let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      console.log(modelInputs[0].name);
      expect(modelInputs[0].name.toString()).assertEqual("a");
      console.log(modelInputs[0].shape.toString());
      expect(modelInputs[0].shape.toString()).assertEqual("1,512,512,3");
      console.log(modelInputs[0].elementNum.toString());
      expect(modelInputs[0].elementNum.toString()).assertEqual("786432");
      let input_dtype = modelInputs[0].dtype;
      console.log(input_dtype.toString());
      expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      let input_format = modelInputs[0].format;
      console.log(input_format.toString());
      expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize = modelInputs[0].dataSize;
      console.log(input_dataSize.toString());
      expect(input_dataSize.toString()).assertEqual("3145728");

      console.log(modelInputs[1].name);
      expect(modelInputs[1].name.toString()).assertEqual("b");
      console.log(modelInputs[1].shape.toString());
      expect(modelInputs[1].shape.toString()).assertEqual("1,512,512,1");
      console.log(modelInputs[1].elementNum.toString());
      expect(modelInputs[1].elementNum.toString()).assertEqual("262144");
      console.log(modelInputs[1].dtype.toString());
      expect(modelInputs[1].dtype.toString()).assertEqual("43");
      console.log(modelInputs[1].format.toString());
      expect(modelInputs[1].format.toString()).assertEqual("1");
      console.log(modelInputs[1].dataSize.toString());
      expect(modelInputs[1].dataSize.toString()).assertEqual("1048576");
      modelInputs[0].setData(inputBuffer01.buffer);
      modelInputs[1].setData(inputBuffer02.buffer);
      let Inputs2 = new Float32Array(modelInputs[0].getData());
      for (let i = 0; i < 5; i++) {
        console.log(Inputs2[i].toString());
      }
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })

    // 正常场景：输入为uint8模型
    it('Test_load_model_param_model_path_model_003', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_model_003");
      let modelName = 'aiy_vision_classifier_plants_V1_3.ms';
      let inputName = 'aiy_vision_classifier_plants_V1_3_0.input';
      let syscontext: common.Context = globalThis.context;
      let inputBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let modelBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(modelName);
      let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      console.log(modelInputs[0].name);
      expect(modelInputs[0].name.toString()).assertEqual("module/hub_input/images_uint8");
      console.log(modelInputs[0].shape.toString());
      expect(modelInputs[0].shape.toString()).assertEqual("1,224,224,3");
      console.log(modelInputs[0].elementNum.toString());
      expect(modelInputs[0].elementNum.toString()).assertEqual("150528");
      console.log(modelInputs[0].dtype.toString());
      expect(modelInputs[0].dtype.toString()).assertEqual("37");
      console.log(modelInputs[0].format.toString());
      expect(modelInputs[0].format.toString()).assertEqual("1");
      console.log(modelInputs[0].dataSize.toString());
      expect(modelInputs[0].dataSize.toString()).assertEqual("150528");
      modelInputs[0].setData(inputBuffer.buffer);
      let Inputs2 = new Uint8Array(modelInputs[0].getData());
      for (let i = 0; i < 5; i++) {
        console.log(Inputs2[i].toString());
      }
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Uint8Array(modelOutputs[0].getData());
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })

    // 正常场景：多输入单输出
    it('Test_load_model_param_model_path_model_004', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_model_004");
      let modelName = 'ml_headpose_pb2tflite.ms';
      let inputName01 = 'ml_headpose_pb2tflite_0.input';
      let inputName02 = 'ml_headpose_pb2tflite_1.input';
      let inputName03 = 'ml_headpose_pb2tflite_2.input';
      let syscontext: common.Context = globalThis.context
      let inputBuffer01 = await syscontext.resourceManager.getRawFileContent(inputName01);
      let inputBuffer02 = await syscontext.resourceManager.getRawFileContent(inputName02);
      let inputBuffer03 = await syscontext.resourceManager.getRawFileContent(inputName03);
      console.log('=========MSLITE success, input01 bin bytelength: ' + inputBuffer01.byteLength);
      console.log('=========MSLITE success, input02 bin bytelength: ' + inputBuffer02.byteLength);
      console.log('=========MSLITE success, input03 bin bytelength: ' + inputBuffer03.byteLength);
      let modelBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(modelName);
      let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      console.log(modelInputs[0].name);
      expect(modelInputs[0].name.toString()).assertEqual("input_1");
      console.log(modelInputs[0].shape.toString());
      expect(modelInputs[0].shape.toString()).assertEqual("1,64,64,3");
      console.log(modelInputs[0].elementNum.toString());
      expect(modelInputs[0].elementNum.toString()).assertEqual("12288");
      let input_dtype = modelInputs[0].dtype;
      console.log(input_dtype.toString());
      expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      let input_format = modelInputs[0].format;
      console.log(input_format.toString());
      expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize = modelInputs[0].dataSize;
      console.log(input_dataSize.toString());
      expect(input_dataSize.toString()).assertEqual("49152");

      console.log(modelInputs[1].name);
      expect(modelInputs[1].name.toString()).assertEqual("batch_normalization_8/batchnorm/add");
      console.log(modelInputs[1].shape.toString());
      expect(modelInputs[1].shape.toString()).assertEqual("16");
      console.log(modelInputs[1].elementNum.toString());
      expect(modelInputs[1].elementNum.toString()).assertEqual("16");
      console.log(modelInputs[1].dtype.toString());
      expect(modelInputs[1].dtype.toString()).assertEqual("43");
      console.log(modelInputs[1].format.toString());
      expect(modelInputs[1].format.toString()).assertEqual("1");
      console.log(modelInputs[1].dataSize.toString());
      expect(modelInputs[1].dataSize.toString()).assertEqual("64");

      console.log(modelInputs[2].name);
      expect(modelInputs[2].name.toString()).assertEqual("batch_normalization_1/batchnorm/add");
      console.log(modelInputs[2].shape.toString());
      expect(modelInputs[2].shape.toString()).assertEqual("16");
      console.log(modelInputs[2].elementNum.toString());
      expect(modelInputs[2].elementNum.toString()).assertEqual("16");
      console.log(modelInputs[2].dtype.toString());
      expect(modelInputs[2].dtype.toString()).assertEqual("43");
      console.log(modelInputs[2].format.toString());
      expect(modelInputs[2].format.toString()).assertEqual("1");
      console.log(modelInputs[2].dataSize.toString());
      expect(modelInputs[2].dataSize.toString()).assertEqual("64");
      modelInputs[0].setData(inputBuffer01.buffer);
      modelInputs[1].setData(inputBuffer02.buffer);
      modelInputs[2].setData(inputBuffer03.buffer);
      let Inputs2 = new Float32Array(modelInputs[0].getData());
      for (let i = 0; i < 5; i++) {
        console.log(Inputs2[i].toString());
      }
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })

    // 正常场景：调用loadModelFromFile callback接口设置context
    it('Test_load_model_param_model_path_callback', Level.LEVEL0, async (done: Function) => {
      console.log("++++++MSLITE api test: loadModel param model file.Test_load_model_param_model_path_callback");
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      console.log('=========MSLITE loadModel start=====');
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let context: mindSporeLite.Context = {};
      context.target = ["cpu"];
      context.cpu = {
        "threadNum": 4,
      }
      context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
      context.cpu.precisionMode = "preferred_fp16";
      context.cpu.threadAffinityCoreList = [0, 1, 2, 3];
      mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
        console.log('=========MSLITE loadModel end=====');
        expect(msliteModel !== null).assertTrue();
        console.log('=========MSLITE loadModel end=====');
        let modelInputs: mindSporeLite.MSTensor[] = msliteModel.getInputs();
        expect(modelInputs[0].name.toString()).assertEqual("data");
        expect(modelInputs[0].shape.toString()).assertEqual("1,48,48,3");
        expect(modelInputs[0].elementNum.toString()).assertEqual("6912");
        expect(modelInputs[0].dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
        expect(modelInputs[0].format).assertEqual(mindSporeLite.Format.NHWC);
        expect(modelInputs[0].dataSize.toString()).assertEqual("27648");
        modelInputs[0].setData(inputBuffer.buffer);
        console.log('=========MSLITE predict start=====');
        msliteModel.predict(modelInputs, (modelOutputs: mindSporeLite.MSTensor[]) => {
          expect(modelOutputs !== null).assertTrue();
          console.log('=========MSLITE new Float32Array start=====');
          let output0 = new Float32Array(modelOutputs[0].getData());
          expect(output0.length).assertLarger(0);
          console.log('output0.length:' + output0.length);
          for (let i = 0; i < 2; i++) {
            console.log(output0[i].toString());
            expect(output0[i].toString() !== null).assertTrue();
          }
          console.log('=========MSLITE new Float32Array end=====');
          done();
        })
      })
    })

    // 正常场景：调用loadModelFromBuffer callback接口设置context
    it('Test_load_model_param_model_buffer_callback', Level.LEVEL0, async (done: Function) => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_buffer_callback");
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;

      let inputBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);

      console.log('=========MSLITE loadModel start=====');
      let modelName = 'ml_face_isface.ms';
      let model_buffer = await syscontext.resourceManager.getRawFileContent(modelName);
      let context: mindSporeLite.Context = {};
      context.target = ["cpu"];
      context.cpu = {
        "threadNum": 4,
      }
      context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
      context.cpu.precisionMode = "preferred_fp16";
      context.cpu.threadAffinityCoreList = [0, 1, 2, 3];
      mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context, (msliteModel: mindSporeLite.Model) => {
        expect(msliteModel !== null).assertTrue();
        console.log('=========MSLITE loadModel end=====');
        let modelInputs: mindSporeLite.MSTensor[] = msliteModel.getInputs();
        let input_name = modelInputs[0].name;
        console.log(input_name.toString());
        expect(input_name.toString()).assertEqual("data");
        let input_shape = modelInputs[0].shape;
        console.log(input_shape.toString());
        expect(input_shape.toString()).assertEqual("1,48,48,3")
        let input_elementNum = modelInputs[0].elementNum;
        console.log(input_elementNum.toString());
        expect(input_elementNum.toString()).assertEqual("6912");
        let input_dtype = modelInputs[0].dtype;
        console.log(input_dtype.toString());
        expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
        let input_format = modelInputs[0].format;
        console.log(input_format.toString());
        expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
        let input_dataSize = modelInputs[0].dataSize;
        console.log(input_dataSize.toString());
        expect(input_dataSize.toString()).assertEqual("27648");
        modelInputs[0].setData(inputBuffer.buffer);
        console.log('=========MSLITE predict start=====');
        msliteModel.predict(modelInputs, (modelOutputs: mindSporeLite.MSTensor[]) => {
          expect(modelOutputs !== null).assertTrue();
          console.log('=========MSLITE new Float32Array start=====');
          let output0 = new Float32Array(modelOutputs[0].getData());
          expect(output0.length).assertLarger(0);
          console.log('output0.length:' + output0.length);
          for (let i = 0; i < 2; i++) {
            console.log(output0[i].toString());
            expect(output0[i].toString() !== null).assertTrue();
          }
          console.log('=========MSLITE new Float32Array end=====');
          done();
        })
      })
    })

    // 正常场景：调用loadModelFromFd callback接口设置context
    it('Test_load_model_param_model_fd_callback', Level.LEVEL0, async (done: Function) => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_fd_callback");
      
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let inputBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);

      console.log('=========MSLITE loadModel start=====');
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      context.cpu = {
        "threadNum": 4,
      }
      context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
      context.cpu.precisionMode = "preferred_fp16";
      context.cpu.threadAffinityCoreList = [0, 1, 2, 3];
      mindSporeLite.loadModelFromFd(file.fd, (msliteModel: mindSporeLite.Model) => {
        expect(msliteModel !== null).assertTrue();
        console.log('=========MSLITE loadModel end=====');
        let modelInputs: mindSporeLite.MSTensor[] = msliteModel.getInputs();
        let input_name = modelInputs[0].name;
        console.log(input_name.toString());
        expect(input_name.toString()).assertEqual("data");
        let input_shape = modelInputs[0].shape;
        console.log(input_shape.toString());
        expect(input_shape.toString()).assertEqual("1,48,48,3")
        let input_elementNum = modelInputs[0].elementNum;
        console.log(input_elementNum.toString());
        expect(input_elementNum.toString()).assertEqual("6912");
        let input_dtype = modelInputs[0].dtype;
        console.log(input_dtype.toString());
        expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
        let input_format = modelInputs[0].format;
        console.log(input_format.toString());
        expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
        let input_dataSize = modelInputs[0].dataSize;
        console.log(input_dataSize.toString());
        expect(input_dataSize.toString()).assertEqual("27648");
        modelInputs[0].setData(inputBuffer.buffer);
        console.log('=========MSLITE predict start=====');
        msliteModel.predict(modelInputs, (modelOutputs: mindSporeLite.MSTensor[]) => {
          expect(modelOutputs !== null).assertTrue();
          console.log('=========MSLITE new Float32Array start=====');
          let output0 = new Float32Array(modelOutputs[0].getData());
          expect(output0.length).assertLarger(0);
          console.log('output0.length:' + output0.length);
          for (let i = 0; i < 2; i++) {
            console.log(output0[i].toString());
            expect(output0[i].toString() !== null).assertTrue();
          }
          console.log('=========MSLITE new Float32Array end=====');
          done();
        })
      })
    })

    // 正常场景：调用loadModelFromFile callback接口未设置context
    it('Test_load_model_param_model_path_callback_no_context', Level.LEVEL0, async (done: Function) => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_callback_no_context");
      
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let inputBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      console.log('=========MSLITE loadModel start=====');
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      mindSporeLite.loadModelFromFile(model_file, (msliteModel: mindSporeLite.Model) => {
        expect(msliteModel !== null).assertTrue();
        console.log('=========MSLITE loadModel end=====');
        let modelInputs: mindSporeLite.MSTensor[] = msliteModel.getInputs();
        let input_name = modelInputs[0].name;
        console.log(input_name.toString());
        expect(input_name.toString()).assertEqual("data");
        let input_shape = modelInputs[0].shape;
        console.log(input_shape.toString());
        expect(input_shape.toString()).assertEqual("1,48,48,3")
        let input_elementNum = modelInputs[0].elementNum;
        console.log(input_elementNum.toString());
        expect(input_elementNum.toString()).assertEqual("6912");
        let input_dtype = modelInputs[0].dtype;
        console.log(input_dtype.toString());
        expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
        let input_format = modelInputs[0].format;
        console.log(input_format.toString());
        expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
        let input_dataSize = modelInputs[0].dataSize;
        console.log(input_dataSize.toString());
        expect(input_dataSize.toString()).assertEqual("27648");
        modelInputs[0].setData(inputBuffer.buffer);
        console.log('=========MSLITE predict start=====');
        msliteModel.predict(modelInputs, (modelOutputs: mindSporeLite.MSTensor[]) => {
          expect(modelOutputs !== null).assertTrue();
          console.log('=========MSLITE new Float32Array start=====');
          let output0 = new Float32Array(modelOutputs[0].getData());
          expect(output0.length).assertLarger(0);
          console.log('output0.length:' + output0.length);
          for (let i = 0; i < 2; i++) {
            console.log(output0[i].toString());
            expect(output0[i].toString() !== null).assertTrue();
          }
          console.log('=========MSLITE new Float32Array end=====');
          done();
        })
      })
    })

    // 正常场景：调用loadModelFromBuffer callback接口未设置context
    it('Test_load_model_param_model_buffer_callback_no_context', Level.LEVEL0, async (done: Function) => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_buffer_callback_no_context");
      
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let inputBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      console.log('=========MSLITE loadModel start=====');
      let modelName = 'ml_face_isface.ms';
      let model_buffer = await syscontext.resourceManager.getRawFileContent(modelName);
      mindSporeLite.loadModelFromBuffer(model_buffer.buffer, (msliteModel: mindSporeLite.Model) => {
        expect(msliteModel !== null).assertTrue();
        console.log('=========MSLITE loadModel end=====');
        let modelInputs: mindSporeLite.MSTensor[] = msliteModel.getInputs();
        let input_name = modelInputs[0].name;
        console.log(input_name.toString());
        expect(input_name.toString()).assertEqual("data");
        let input_shape = modelInputs[0].shape;
        console.log(input_shape.toString());
        expect(input_shape.toString()).assertEqual("1,48,48,3")
        let input_elementNum = modelInputs[0].elementNum;
        console.log(input_elementNum.toString());
        expect(input_elementNum.toString()).assertEqual("6912");
        let input_dtype = modelInputs[0].dtype;
        console.log(input_dtype.toString());
        expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
        let input_format = modelInputs[0].format;
        console.log(input_format.toString());
        expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
        let input_dataSize = modelInputs[0].dataSize;
        console.log(input_dataSize.toString());
        expect(input_dataSize.toString()).assertEqual("27648");
        modelInputs[0].setData(inputBuffer.buffer);
        console.log('=========MSLITE predict start=====');
        msliteModel.predict(modelInputs, (modelOutputs: mindSporeLite.MSTensor[]) => {
          expect(modelOutputs !== null).assertTrue();
          console.log('=========MSLITE new Float32Array start=====');
          let output0 = new Float32Array(modelOutputs[0].getData());
          expect(output0.length).assertLarger(0);
          console.log('output0.length:' + output0.length);
          for (let i = 0; i < 2; i++) {
            console.log(output0[i].toString());
            expect(output0[i].toString() !== null).assertTrue();
          }
          console.log('=========MSLITE new Float32Array end=====');
          done();
        })
      })
    })

    // 正常场景：调用loadModelFromFd callback接口未设置context
    it('Test_load_model_param_model_fd_callback_no_context', Level.LEVEL0, async (done: Function) => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_fd_callback_no_context");
      
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let inputBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      console.log('=========MSLITE loadModel start=====');
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
      mindSporeLite.loadModelFromFd(file.fd, (msliteModel: mindSporeLite.Model) => {
        expect(msliteModel !== null).assertTrue();
        console.log('=========MSLITE loadModel end=====');
        let modelInputs: mindSporeLite.MSTensor[] = msliteModel.getInputs();
        let input_name = modelInputs[0].name;
        console.log(input_name.toString());
        expect(input_name.toString()).assertEqual("data");
        let input_shape = modelInputs[0].shape;
        console.log(input_shape.toString());
        expect(input_shape.toString()).assertEqual("1,48,48,3");
        let input_elementNum = modelInputs[0].elementNum;
        console.log(input_elementNum.toString());
        expect(input_elementNum.toString()).assertEqual("6912");
        let input_dtype = modelInputs[0].dtype;
        console.log(input_dtype.toString());
        expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
        let input_format = modelInputs[0].format;
        console.log(input_format.toString());
        expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
        let input_dataSize = modelInputs[0].dataSize;
        console.log(input_dataSize.toString());
        expect(input_dataSize.toString()).assertEqual("27648");
        modelInputs[0].setData(inputBuffer.buffer);
        console.log('=========MSLITE predict start=====');
        msliteModel.predict(modelInputs, (modelOutputs: mindSporeLite.MSTensor[]) => {
          expect(modelOutputs !== null).assertTrue();
          console.log('=========MSLITE new Float32Array start=====');
          let output0 = new Float32Array(modelOutputs[0].getData());
          expect(output0.length).assertLarger(0);
          console.log('output0.length:' + output0.length);
          for (let i = 0; i < 2; i++) {
            console.log(output0[i].toString());
            expect(output0[i].toString() !== null).assertTrue();
          }
          console.log('=========MSLITE new Float32Array end=====');
          done();
        })
      })
    })

    // 正常场景：头文件枚举值测试
    it('Test_enumerated_value', Level.LEVEL0, async (done: Function) => {
      try{
        expect(mindSporeLite.Format.NCHW).assertEqual(0);
        expect(mindSporeLite.Format.NHWC).assertEqual(1);
        expect(mindSporeLite.Format.NHWC4).assertEqual(2);
        expect(mindSporeLite.Format.HWKC).assertEqual(3);
        expect(mindSporeLite.Format.HWCK).assertEqual(4);
        expect(mindSporeLite.Format.KCHW).assertEqual(5);
        expect(mindSporeLite.Format.DEFAULT_FORMAT).assertEqual(-1);

        expect(mindSporeLite.DataType.TYPE_UNKNOWN).assertEqual(0);
        expect(mindSporeLite.DataType.NUMBER_TYPE_INT8).assertEqual(32);
        expect(mindSporeLite.DataType.NUMBER_TYPE_INT16).assertEqual(33);
        expect(mindSporeLite.DataType.NUMBER_TYPE_INT32).assertEqual(34);
        expect(mindSporeLite.DataType.NUMBER_TYPE_INT64).assertEqual(35);
        expect(mindSporeLite.DataType.NUMBER_TYPE_UINT8).assertEqual(37);
        expect(mindSporeLite.DataType.NUMBER_TYPE_UINT16).assertEqual(38);
        expect(mindSporeLite.DataType.NUMBER_TYPE_UINT32).assertEqual(39);
        expect(mindSporeLite.DataType.NUMBER_TYPE_UINT64).assertEqual(40);
        expect(mindSporeLite.DataType.NUMBER_TYPE_FLOAT16).assertEqual(42);
        expect(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32).assertEqual(43);
        expect(mindSporeLite.DataType.NUMBER_TYPE_FLOAT64).assertEqual(44);

        expect(mindSporeLite.NNRTDeviceType.NNRTDEVICE_OTHERS).assertEqual(0);
        expect(mindSporeLite.NNRTDeviceType.NNRTDEVICE_CPU).assertEqual(1);
        expect(mindSporeLite.NNRTDeviceType.NNRTDEVICE_GPU).assertEqual(2);
        expect(mindSporeLite.NNRTDeviceType.NNRTDEVICE_ACCELERATOR).assertEqual(3);
        done()
      } catch (error) {
        console.info("The enumerated are changed:" + error)
        done()
      }
    })


    it('SUB_AI_MindSpore_ArkTS_NNRT_0001', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.SUB_AI_MindSpore_ArkTS_NNRT_0001");
      let modelName = 'ml_face_isface.ms';
      let inputName = 'ml_face_isface_0.input';
      let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
      if (all_devices == null) {
        console.log('=========getAllNNRTDeviceDescriptions is NULL==========');
        return
      }
      let syscontext: common.Context = globalThis.context
      let inputBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let modelBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(modelName);
      let context: mindSporeLite.Context = {};
      context.target = ["nnrt"];
      context.nnrt = {};
      for (let i:number = 0; i<all_devices.length; i++){
        console.log('=========print NNRT Device==========');
        console.log(await all_devices[i].deviceID().toString());
        console.log(await all_devices[i].deviceType().toString());
        console.log(await all_devices[i].deviceName().toString());
        console.log('=========print NNRT Device end============');
      }
      let device = all_devices[0];
      context.nnrt.deviceID = device.deviceID();
      context.nnrt.performanceMode = mindSporeLite.PerformanceMode.PERFORMANCE_NONE;
      context.nnrt.priority = mindSporeLite.Priority.PRIORITY_NONE;
      let nnrt_extensions: mindSporeLite.Extension = {
        name: "value",
        value: modelBuffer
      };
      context.nnrt.extensions = [nnrt_extensions];

      let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context)
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      let input_name = modelInputs[0].name;
      console.log(input_name.toString());
      expect(input_name.toString()).assertEqual("data");
      let input_shape = modelInputs[0].shape;
      console.log(input_shape.toString());
      expect(input_shape.toString()).assertEqual("1,48,48,3")
      let input_elementNum = modelInputs[0].elementNum;
      console.log(input_elementNum.toString());
      expect(input_elementNum.toString()).assertEqual("6912");
      let input_dtype = modelInputs[0].dtype;
      console.log(input_dtype.toString());
      expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      let input_format = modelInputs[0].format;
      console.log(input_format.toString());
      expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize = modelInputs[0].dataSize;
      console.log(input_dataSize.toString());
      expect(input_dataSize.toString()).assertEqual("27648");
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })

    it('SUB_AI_MindSpore_ArkTS_NNRT_0002', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.SUB_AI_MindSpore_ArkTS_NNRT_0002");
      let modelName = 'ml_face_isface.ms';
      let inputName = 'ml_face_isface_0.input';
      let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
      if (all_devices == null) {
        console.log('=========getAllNNRTDeviceDescriptions is NULL==========');
        return
      }
      let syscontext: common.Context = globalThis.context
      let inputBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let modelBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(modelName);
      let context: mindSporeLite.Context = {};
      context.target = ["nnrt"];
      context.nnrt = {};
      for (let i:number = 0; i<all_devices.length; i++){
        console.log('=========print NNRT Device==========');
        console.log(await all_devices[i].deviceID().toString());
        console.log(await all_devices[i].deviceType().toString());
        console.log(await all_devices[i].deviceName().toString());
        console.log('=========print NNRT Device end============');
      }
      let device = all_devices[0];
      context.nnrt.deviceID = device.deviceID();
      context.nnrt.performanceMode = mindSporeLite.PerformanceMode.PERFORMANCE_LOW;
      context.nnrt.priority = mindSporeLite.Priority.PRIORITY_LOW;
      let nnrt_extensions: mindSporeLite.Extension = {
        name: "value",
        value: modelBuffer
      };
      context.nnrt.extensions = [nnrt_extensions];

      let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context)
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      let input_name = modelInputs[0].name;
      console.log(input_name.toString());
      expect(input_name.toString()).assertEqual("data");
      let input_shape = modelInputs[0].shape;
      console.log(input_shape.toString());
      expect(input_shape.toString()).assertEqual("1,48,48,3")
      let input_elementNum = modelInputs[0].elementNum;
      console.log(input_elementNum.toString());
      expect(input_elementNum.toString()).assertEqual("6912");
      let input_dtype = modelInputs[0].dtype;
      console.log(input_dtype.toString());
      expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      let input_format = modelInputs[0].format;
      console.log(input_format.toString());
      expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize = modelInputs[0].dataSize;
      console.log(input_dataSize.toString());
      expect(input_dataSize.toString()).assertEqual("27648");
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })

    it('SUB_AI_MindSpore_ArkTS_NNRT_0003', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.SUB_AI_MindSpore_ArkTS_NNRT_0003");
      let modelName = 'ml_face_isface.ms';
      let inputName = 'ml_face_isface_0.input';
      let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
      if (all_devices == null) {
        console.log('=========getAllNNRTDeviceDescriptions is NULL==========');
        return
      }
      let syscontext: common.Context = globalThis.context
      let inputBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let modelBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(modelName);
      let context: mindSporeLite.Context = {};
      context.target = ["nnrt"];
      context.nnrt = {};
      for (let i:number = 0; i<all_devices.length; i++){
        console.log('=========print NNRT Device==========');
        console.log(await all_devices[i].deviceID().toString());
        console.log(await all_devices[i].deviceType().toString());
        console.log(await all_devices[i].deviceName().toString());
        console.log('=========print NNRT Device end============');
      }
      let device = all_devices[0];
      context.nnrt.deviceID = device.deviceID();
      context.nnrt.performanceMode = mindSporeLite.PerformanceMode.PERFORMANCE_MEDIUM;
      context.nnrt.priority = mindSporeLite.Priority.PRIORITY_MEDIUM;
      let nnrt_extensions: mindSporeLite.Extension = {
        name: "value",
        value: modelBuffer
      };
      context.nnrt.extensions = [nnrt_extensions];

      let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context)
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      let input_name = modelInputs[0].name;
      console.log(input_name.toString());
      expect(input_name.toString()).assertEqual("data");
      let input_shape = modelInputs[0].shape;
      console.log(input_shape.toString());
      expect(input_shape.toString()).assertEqual("1,48,48,3")
      let input_elementNum = modelInputs[0].elementNum;
      console.log(input_elementNum.toString());
      expect(input_elementNum.toString()).assertEqual("6912");
      let input_dtype = modelInputs[0].dtype;
      console.log(input_dtype.toString());
      expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      let input_format = modelInputs[0].format;
      console.log(input_format.toString());
      expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize = modelInputs[0].dataSize;
      console.log(input_dataSize.toString());
      expect(input_dataSize.toString()).assertEqual("27648");
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })

    it('SUB_AI_MindSpore_ArkTS_NNRT_0004', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.SUB_AI_MindSpore_ArkTS_NNRT_0004");
      let modelName = 'ml_face_isface.ms';
      let inputName = 'ml_face_isface_0.input';
      let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
      if (all_devices == null) {
        console.log('=========getAllNNRTDeviceDescriptions is NULL==========');
        return
      }
      let syscontext: common.Context = globalThis.context
      let inputBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let modelBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(modelName);
      let context: mindSporeLite.Context = {};
      context.target = ["nnrt"];
      context.nnrt = {};
      for (let i:number = 0; i<all_devices.length; i++){
        console.log('=========print NNRT Device==========');
        console.log(await all_devices[i].deviceID().toString());
        console.log(await all_devices[i].deviceType().toString());
        console.log(await all_devices[i].deviceName().toString());
        console.log('=========print NNRT Device end============');
      }
      let device = all_devices[0];
      context.nnrt.deviceID = device.deviceID();
      context.nnrt.performanceMode = mindSporeLite.PerformanceMode.PERFORMANCE_HIGH;
      context.nnrt.priority = mindSporeLite.Priority.PRIORITY_HIGH;
      let nnrt_extensions: mindSporeLite.Extension = {
        name: "value",
        value: modelBuffer
      };
      context.nnrt.extensions = [nnrt_extensions];

      let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context)
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      let input_name = modelInputs[0].name;
      console.log(input_name.toString());
      expect(input_name.toString()).assertEqual("data");
      let input_shape = modelInputs[0].shape;
      console.log(input_shape.toString());
      expect(input_shape.toString()).assertEqual("1,48,48,3")
      let input_elementNum = modelInputs[0].elementNum;
      console.log(input_elementNum.toString());
      expect(input_elementNum.toString()).assertEqual("6912");
      let input_dtype = modelInputs[0].dtype;
      console.log(input_dtype.toString());
      expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      let input_format = modelInputs[0].format;
      console.log(input_format.toString());
      expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize = modelInputs[0].dataSize;
      console.log(input_dataSize.toString());
      expect(input_dataSize.toString()).assertEqual("27648");
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })

    it('SUB_AI_MindSpore_ArkTS_NNRT_0005', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.SUB_AI_MindSpore_ArkTS_NNRT_0005");
      let modelName = 'ml_face_isface.ms';
      let inputName = 'ml_face_isface_0.input';
      let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
      if (all_devices == null) {
        console.log('=========getAllNNRTDeviceDescriptions is NULL==========');
        return
      }
      let syscontext: common.Context = globalThis.context
      let inputBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let modelBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(modelName);
      let context: mindSporeLite.Context = {};
      context.target = ["nnrt"];
      context.nnrt = {};
      for (let i:number = 0; i<all_devices.length; i++){
        console.log('=========print NNRT Device==========');
        console.log(await all_devices[i].deviceID().toString());
        console.log(await all_devices[i].deviceType().toString());
        console.log(await all_devices[i].deviceName().toString());
        console.log('=========print NNRT Device end============');
      }
      let device = all_devices[0];
      context.nnrt.deviceID = device.deviceID();
      context.nnrt.performanceMode = mindSporeLite.PerformanceMode.PERFORMANCE_EXTREME;
      context.nnrt.priority = mindSporeLite.Priority.PRIORITY_HIGH;
      let nnrt_extensions: mindSporeLite.Extension = {
        name: "value",
        value: modelBuffer
      };
      context.nnrt.extensions = [nnrt_extensions];

      let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context)
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      let input_name = modelInputs[0].name;
      console.log(input_name.toString());
      expect(input_name.toString()).assertEqual("data");
      let input_shape = modelInputs[0].shape;
      console.log(input_shape.toString());
      expect(input_shape.toString()).assertEqual("1,48,48,3")
      let input_elementNum = modelInputs[0].elementNum;
      console.log(input_elementNum.toString());
      expect(input_elementNum.toString()).assertEqual("6912");
      let input_dtype = modelInputs[0].dtype;
      console.log(input_dtype.toString());
      expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      let input_format = modelInputs[0].format;
      console.log(input_format.toString());
      expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize = modelInputs[0].dataSize;
      console.log(input_dataSize.toString());
      expect(input_dataSize.toString()).assertEqual("27648");
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })

    it('SUB_AI_MindSpore_ArkTS_NNRT_0006', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.SUB_AI_MindSpore_ArkTS_NNRT_0006");
      let modelName = 'ml_face_isface.ms';
      let inputName = 'ml_face_isface_0.input';
      let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
      if (all_devices == null) {
        console.log('=========getAllNNRTDeviceDescriptions is NULL==========');
        return
      }
      for (let i:number = 0; i<all_devices.length; i++){
        console.log('=========print NNRT Device==========');
        console.log(await all_devices[i].deviceID().toString());
        console.log(await all_devices[i].deviceType().toString());
        console.log(await all_devices[i].deviceName().toString());
        console.log('=========print NNRT Device end============');
      }
      let syscontext: common.Context = globalThis.context
      let inputBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let modelBuffer: Uint8Array= await syscontext.resourceManager.getRawFileContent(modelName);
      let context: mindSporeLite.Context = {};
      context.target = ["cpu", "nnrt"];

      context.cpu = {};
      context.cpu.threadNum = 1;
      context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
      context.cpu.precisionMode = "preferred_fp16";
      context.cpu.threadAffinityCoreList = [0, 1, 2, 3];

      context.nnrt = {};
      let device = all_devices[0];
      context.nnrt.deviceID = device.deviceID();
      context.nnrt.performanceMode = mindSporeLite.PerformanceMode.PERFORMANCE_EXTREME;
      context.nnrt.priority = mindSporeLite.Priority.PRIORITY_HIGH;
      let nnrt_extensions: mindSporeLite.Extension = {
        name: "value",
        value: modelBuffer
      };
      context.nnrt.extensions = [nnrt_extensions];

      let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context)
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      let input_name = modelInputs[0].name;
      console.log(input_name.toString());
      expect(input_name.toString()).assertEqual("data");
      let input_shape = modelInputs[0].shape;
      console.log(input_shape.toString());
      expect(input_shape.toString()).assertEqual("1,48,48,3")
      let input_elementNum = modelInputs[0].elementNum;
      console.log(input_elementNum.toString());
      expect(input_elementNum.toString()).assertEqual("6912");
      let input_dtype = modelInputs[0].dtype;
      console.log(input_dtype.toString());
      expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      let input_format = modelInputs[0].format;
      console.log(input_format.toString());
      expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize = modelInputs[0].dataSize;
      console.log(input_dataSize.toString());
      expect(input_dataSize.toString()).assertEqual("27648");
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })


    it('SUB_AI_MindSpore_ArkTS_NNRT_0008', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.SUB_AI_MindSpore_ArkTS_NNRT_0008");
      let modelName = 'ml_face_isface.ms';
      let inputName = 'ml_face_isface_0.input';
      let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
      if (all_devices == null) {
        console.log('=========getAllNNRTDeviceDescriptions is NULL==========');
        return
      }
      let syscontext: common.Context = globalThis.context
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let modelBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(modelName);
      let context: mindSporeLite.Context = {};
      context.target = ["nnrt"];
      context.nnrt = {};
      for (let i:number = 0; i<all_devices.length; i++){
        console.log('=========print NNRT Device==========');
        console.log(await all_devices[i].deviceID().toString());
        console.log(await all_devices[i].deviceType().toString());
        console.log(await all_devices[i].deviceName().toString());
        console.log('=========print NNRT Device end============');
      }
      let device = all_devices[0];
      context.nnrt.deviceID = device.deviceID();
      context.nnrt.performanceMode = 5;
      context.nnrt.priority = 5;
      let nnrt_extensions: mindSporeLite.Extension = {
        name: "value",
        value: modelBuffer
      };
      context.nnrt.extensions = [nnrt_extensions];

      let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context)
      expect(msliteModel).assertUndefined();
    })


    // 正常场景：模拟器，ModelBuild，调用buffer方法，正常推理
    it('Test_load_model_param_model_buffer_emulator', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_buffer");
      let modelName = 'ml_face_isface.ms';
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let modelBuffer = await syscontext.resourceManager.getRawFileContent(modelName);
      let context: mindSporeLite.Context = {};
      context.target = ["cpu"];
      let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      expect(modelInputs[0].name.toString()).assertEqual("data");
      expect(modelInputs[0].shape.toString()).assertEqual("1,48,48,3");;
      expect(modelInputs[0].elementNum.toString()).assertEqual("6912");
      expect(modelInputs[0].dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      expect(modelInputs[0].format).assertEqual(mindSporeLite.Format.NHWC);
      expect(modelInputs[0].dataSize.toString()).assertEqual("27648");
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      console.log('=========MSLITE new Float32Array end=====');
    });

    // 正常场景：模拟器，ModelBuild，调用fd方法，正常推理
    it('Test_load_model_param_model_fd_emulator', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_fd");
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      console.log('=========MSLITE loadModel start=====');
      let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
      let msliteModel = await mindSporeLite.loadModelFromFd(file.fd);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      console.log('=========MSLITE new Float32Array end=====');
    });

    // 正常场景：模拟器，ModelBuild，调用loadModelFromFile方法，正常推理
    it('Test_load_model_param_model_path_emulator', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path");
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let context: mindSporeLite.Context = {};
      context.target = ["cpu"];
      context.cpu = {};
      context.cpu.threadNum = 1;
      console.log('=========MSLITE loadModel start=====');
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      console.log('=========MSLITE new Float32Array end=====');
    });

    //正常场景：模拟器，Context设置CPU，4线程
    it('Test_load_model_param_model_path_settings_threads_emulator_001', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_settings_threads_001");
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let context: mindSporeLite.Context = {};
      context.target = ["cpu"];
      context.cpu = {
        "threadNum": 4,
      };
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      console.log('=========MSLITE new Float32Array end=====');
    });

    //正常场景：模拟器，Context设置CPU，2线程
    it('Test_load_model_param_model_path_settings_threads_emulator_002', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_settings_threads_002");
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let context: mindSporeLite.Context = {};
      context.target = ["cpu"];
      context.cpu = {
        "threadNum": 2,
      };
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      console.log('=========MSLITE new Float32Array end=====');
    });

    //正常场景：模拟器，Context设置CPU，1线程
    it('Test_load_model_param_model_path_settings_threads_emulator_003', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_settings_threads_003");
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let context: mindSporeLite.Context = {};
      context.target = ["cpu"];
      context.cpu = {
        "threadNum": 1,
      };
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      console.log('=========MSLITE new Float32Array end=====');
    });

    //正常场景：模拟器，Context设置CPU，0线程
    it('Test_load_model_param_model_path_settings_threads_emulator_004', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_settings_threads_004");
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let context: mindSporeLite.Context = {};
      context.target = ["cpu"];
      context.cpu = {
        "threadNum": 0,
      };
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      console.log('=========MSLITE new Float32Array end=====');
    });

    //异常场景：模拟器，ModelBuild，调用model path方法，path为空
    it('Test_load_model_param_model_path_is_None_emulator_001', Level.LEVEL0, async (done: Function) => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_is_None_001");
      let model_file = "";
      let context: mindSporeLite.Context = {};
      context.target = ["cpu"];
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
      console.log('=========MSLITE loadModel end=====');
      expect(msliteModel).assertUndefined();
      done();
    });

    //异常场景：模拟器，ModelBuild，调用buffer方法，modelBuffer为None
    it('Test_load_model_param_model_buffer_is_None_emulator_001', Level.LEVEL0, async (done: Function) => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_buffer_is_None_001");
      let context: mindSporeLite.Context = {};
      context.target = ["cpu"];
      let msliteModel = await mindSporeLite.loadModelFromBuffer(null, context);
      console.log('=========MSLITE loadModel end=====');
      expect(msliteModel).assertUndefined();
      done();
    });

    //异常场景：模拟器，ModelBuild，context为null
    it('Test_load_model_param_model_path_context_is_None_emulator_001', Level.LEVEL0, async (done: Function) => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_context_is_None_001");      
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file, null);
      expect(msliteModel).assertUndefined();
      console.log('=========MSLITE loadModel end=====');
      done();
    });

    // 正常场景：模拟器，ModelResize，shape与之前一致
    it('Test_load_model_param_model_path_resize_emulator_001', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_resize_001");
      let inputName = 'ml_ocr_cn_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_ocr_cn.ms';
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      console.log('=========MSLITE resize start=====');
      let new_dim = new Array([1, 32, 512, 1]);
      let resize_result = msliteModel.resize(modelInputs, new_dim);
      expect(resize_result).assertTrue();
      console.log('=========MSLITE resize success=====');
      const modelInputs2 = msliteModel.getInputs();
      modelInputs2[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs2);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      console.log('=========MSLITE new Float32Array end=====');
    });

    // 正常场景：模拟器，ModelResize，shape与之前不一致
    it('Test_load_model_param_model_path_resize_emulator_002', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_resize_002");
      let inputName = 'ml_ocr_cn_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_ocr_cn.ms';
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      expect(modelInputs[0].name.toString()).assertEqual("data");
      let input_shape = modelInputs[0].shape;

      expect(input_shape.toString()).assertEqual("1,32,512,1");
      let input_elementNum = modelInputs[0].elementNum;

      expect(input_elementNum.toString()).assertEqual("16384");
      expect(modelInputs[0].dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      expect(modelInputs[0].format).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize = modelInputs[0].dataSize;

      expect(input_dataSize.toString()).assertEqual("65536");
      console.log('=========MSLITE resize start=====');
      let new_dim = new Array([1, 64, 256, 1]);
      let resize_result = msliteModel.resize(modelInputs, new_dim);
      expect(resize_result).assertTrue();
      console.log('=========MSLITE resize success=====');
      const modelInputs2 = msliteModel.getInputs();
      let input_name2 = modelInputs2[0].name;
      console.log(input_name2.toString());
      expect(input_name2.toString()).assertEqual("data");
      let input_shape2 = modelInputs2[0].shape;
      console.log(input_shape2.toString());
      expect(input_shape2.toString()).assertEqual("1,64,256,1");
      let input_elementNum2 = modelInputs2[0].elementNum;
      console.log(input_elementNum2.toString());
      expect(input_elementNum2.toString()).assertEqual("16384");
      let input_dtype2 = modelInputs2[0].dtype;
      console.log(input_dtype2.toString());
      expect(input_dtype2).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      let input_format2 = modelInputs2[0].format;
      console.log(input_format2.toString());
      expect(input_format2).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize2 = modelInputs2[0].dataSize;
      console.log(input_dataSize2.toString());
      expect(input_dataSize2.toString()).assertEqual("65536");
      modelInputs2[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs2);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      console.log('=========MSLITE new Float32Array end=====');
    });

    // 异常场景：模拟器，ModelResize，shape为三维
    it('Test_load_model_param_model_path_resize_emulator_003', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_resize_003");
      let inputName = 'ml_ocr_cn_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_ocr_cn.ms';
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      console.log('=========MSLITE resize start=====');
      let new_dim = new Array([1, 32, 1]);
      let resize_result = msliteModel.resize(modelInputs, new_dim);
      expect(resize_result).assertFalse;
      console.log('=========MSLITE resize failed=====');
    });

    // 异常场景：模拟器，ModelResize，不支持resize的模型
    it('Test_load_model_param_model_path_resize_emulator_004', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_resize_004");
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      console.log('=========MSLITE resize start=====');
      let new_dim = new Array([1, 96, 96, 1]);
      let resize_result = msliteModel.resize(modelInputs, new_dim);
      expect(resize_result).assertFalse();
      console.log('=========MSLITE resize failed=====');
    });

    // 异常场景：模拟器，ModelResize，shape值有负数
    it('Test_load_model_param_model_path_resize_emulator_005', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_resize_005");
      let inputName = 'ml_ocr_cn_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_ocr_cn.ms';
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      console.log('=========MSLITE resize start=====');
      let new_dim = new Array([1, -32, 32, 1]);
      let resize_result = msliteModel.resize(modelInputs, new_dim);
      expect(resize_result).assertFalse();
      console.log('=========MSLITE resize failed=====');
    });

    // 正常场景：模拟器，Build一次，Predict多次
    it('Test_load_model_param_model_path_much_predict_emulator_001', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_much_predict_001");
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let num = 0;
      for (let i = 0; i < 10; i++) {
        let modelOutputs = await msliteModel.predict(modelInputs);
        expect(modelOutputs !== null).assertTrue();
        console.log('=========MSLITE new Float32Array start=====');
        let output0 = new Float32Array(modelOutputs[0].getData());
        expect(output0.length).assertLarger(0);
        console.log('output0.length:' + output0.length);
        for (let z = 0; z < 2; z++) {
          console.log(output0[z].toString());
          expect(output0[z].toString() !== null).assertTrue();
        }
        console.log('=========MSLITE new Float32Array end=====');
        console.log('=========i.toString()=====');
        console.log(i.toString());
        ++num;
        console.log('=========num.toString()=====');
        console.log(num.toString());
      }
    });

    // 异常场景：模拟器，Build多次
    it('Test_load_model_param_model_path_much_build_emulator_001', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_much_build_001");
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      for (let i = 0; i < 10; i++) {
        mindSporeLite.loadModelFromFile(model_file);
      }
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      modelInputs[0].setData(inputBuffer.buffer);
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      console.log('=========MSLITE new Float32Array end=====');
    });

    // 正常场景：模拟器，单输入模型
    it('Test_load_model_param_model_path_model_emulator_001', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_model_001");
      let modelName = 'ml_face_isface.ms';
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let modelBuffer = await syscontext.resourceManager.getRawFileContent(modelName);
      let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      modelInputs[0].setData(inputBuffer.buffer);
      let Inputs2 = new Float32Array(modelInputs[0].getData());
      for (let i = 0; i < 5; i++) {
        console.log(Inputs2[i].toString());
      }
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      console.log('=========MSLITE new Float32Array end=====');
    });

    // 正常场景：模拟器，多输入模型
    it('Test_load_model_param_model_path_model_emulator_002', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_model_002");
      let modelName = 'ml_video_edit_face_cutout_portraitSeg_deconv.ms';
      let inputName01 = 'ml_video_edit_face_cutout_portraitSeg_deconv_0.input';
      let inputName02 = 'ml_video_edit_face_cutout_portraitSeg_deconv_1.input';
      let syscontext: common.Context = globalThis.context;
      let inputBuffer01 = await syscontext.resourceManager.getRawFileContent(inputName01);
      let inputBuffer02 = await syscontext.resourceManager.getRawFileContent(inputName02);
      console.log('=========MSLITE success, input01 bin bytelength: ' + inputBuffer01.byteLength);
      console.log('=========MSLITE success, input02 bin bytelength: ' + inputBuffer02.byteLength);
      let modelBuffer = await syscontext.resourceManager.getRawFileContent(modelName);
      let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      console.log(modelInputs[0].name);
      expect(modelInputs[0].name.toString()).assertEqual("a");
      console.log(modelInputs[0].shape.toString());
      expect(modelInputs[0].shape.toString()).assertEqual("1,512,512,3");
      console.log(modelInputs[0].elementNum.toString());
      expect(modelInputs[0].elementNum.toString()).assertEqual("786432");
      expect(modelInputs[0].dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      expect(modelInputs[0].format).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize = modelInputs[0].dataSize;

      expect(input_dataSize.toString()).assertEqual("3145728");
      console.log(modelInputs[1].name);
      expect(modelInputs[1].name.toString()).assertEqual("b");
      console.log(modelInputs[1].shape.toString());
      expect(modelInputs[1].shape.toString()).assertEqual("1,512,512,1");
      console.log(modelInputs[1].elementNum.toString());
      expect(modelInputs[1].elementNum.toString()).assertEqual("262144");
      console.log(modelInputs[1].dtype.toString());
      expect(modelInputs[1].dtype.toString()).assertEqual("43");
      console.log(modelInputs[1].format.toString());
      expect(modelInputs[1].format.toString()).assertEqual("1");
      console.log(modelInputs[1].dataSize.toString());
      expect(modelInputs[1].dataSize.toString()).assertEqual("1048576");
      modelInputs[0].setData(inputBuffer01.buffer);
      modelInputs[1].setData(inputBuffer02.buffer);
      let Inputs2 = new Float32Array(modelInputs[0].getData());
      for (let i = 0; i < 5; i++) {
        console.log(Inputs2[i].toString());
      }
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      console.log('=========MSLITE new Float32Array end=====');
    });

    // 正常场景：模拟器，输入为uint8模型
    it('Test_load_model_param_model_path_model_emulator_003', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_model_003");
      let modelName = 'aiy_vision_classifier_plants_V1_3.ms';
      let inputName = 'aiy_vision_classifier_plants_V1_3_0.input';
      let syscontext: common.Context = globalThis.context;
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let modelBuffer = await syscontext.resourceManager.getRawFileContent(modelName);
      let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      console.log(modelInputs[0].name);
      expect(modelInputs[0].name.toString()).assertEqual("module/hub_input/images_uint8");
      console.log(modelInputs[0].shape.toString());
      expect(modelInputs[0].shape.toString()).assertEqual("1,224,224,3");
      console.log(modelInputs[0].elementNum.toString());
      expect(modelInputs[0].elementNum.toString()).assertEqual("150528");
      console.log(modelInputs[0].dtype.toString());
      expect(modelInputs[0].dtype.toString()).assertEqual("37");
      console.log(modelInputs[0].format.toString());
      expect(modelInputs[0].format.toString()).assertEqual("1");
      console.log(modelInputs[0].dataSize.toString());
      expect(modelInputs[0].dataSize.toString()).assertEqual("150528");
      modelInputs[0].setData(inputBuffer.buffer);
      let Inputs2 = new Uint8Array(modelInputs[0].getData());
      for (let i = 0; i < 5; i++) {
        console.log(Inputs2[i].toString());
      }
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Uint8Array(modelOutputs[0].getData());
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      console.log('=========MSLITE new Float32Array end=====');
    });

    // 正常场景：模拟器，多输入单输出
    it('Test_load_model_param_model_path_model_emulator_004', Level.LEVEL0, async () => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_model_004");
      let modelName = 'ml_headpose_pb2tflite.ms';
      let inputName01 = 'ml_headpose_pb2tflite_0.input';
      let inputName02 = 'ml_headpose_pb2tflite_1.input';
      let inputName03 = 'ml_headpose_pb2tflite_2.input';
      let syscontext: common.Context = globalThis.context;
      let inputBuffer01 = await syscontext.resourceManager.getRawFileContent(inputName01);
      let inputBuffer02 = await syscontext.resourceManager.getRawFileContent(inputName02);
      let inputBuffer03 = await syscontext.resourceManager.getRawFileContent(inputName03);
      console.log('=========MSLITE success, input01 bin bytelength: ' + inputBuffer01.byteLength);
      console.log('=========MSLITE success, input02 bin bytelength: ' + inputBuffer02.byteLength);
      console.log('=========MSLITE success, input03 bin bytelength: ' + inputBuffer03.byteLength);
      let modelBuffer = await syscontext.resourceManager.getRawFileContent(modelName);
      let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer);
      expect(msliteModel !== null).assertTrue();
      console.log('=========MSLITE loadModel end=====');
      const modelInputs = msliteModel.getInputs();
      console.log(modelInputs[0].name);
      expect(modelInputs[0].name.toString()).assertEqual("input_1");
      console.log(modelInputs[0].shape.toString());
      expect(modelInputs[0].shape.toString()).assertEqual("1,64,64,3");
      console.log(modelInputs[0].elementNum.toString());
      expect(modelInputs[0].elementNum.toString()).assertEqual("12288");
      expect(modelInputs[0].dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
      expect(modelInputs[0].format).assertEqual(mindSporeLite.Format.NHWC);
      let input_dataSize = modelInputs[0].dataSize;

      expect(input_dataSize.toString()).assertEqual("49152");
      console.log(modelInputs[1].name);
      expect(modelInputs[1].name.toString()).assertEqual("batch_normalization_8/batchnorm/add");
      console.log(modelInputs[1].shape.toString());
      expect(modelInputs[1].shape.toString()).assertEqual("16");
      console.log(modelInputs[1].elementNum.toString());
      expect(modelInputs[1].elementNum.toString()).assertEqual("16");
      console.log(modelInputs[1].dtype.toString());
      expect(modelInputs[1].dtype.toString()).assertEqual("43");
      console.log(modelInputs[1].format.toString());
      expect(modelInputs[1].format.toString()).assertEqual("1");
      console.log(modelInputs[1].dataSize.toString());
      expect(modelInputs[1].dataSize.toString()).assertEqual("64");
      console.log(modelInputs[2].name);
      expect(modelInputs[2].name.toString()).assertEqual("batch_normalization_1/batchnorm/add");
      console.log(modelInputs[2].shape.toString());
      expect(modelInputs[2].shape.toString()).assertEqual("16");
      console.log(modelInputs[2].elementNum.toString());
      expect(modelInputs[2].elementNum.toString()).assertEqual("16");
      console.log(modelInputs[2].dtype.toString());
      expect(modelInputs[2].dtype.toString()).assertEqual("43");
      console.log(modelInputs[2].format.toString());
      expect(modelInputs[2].format.toString()).assertEqual("1");
      console.log(modelInputs[2].dataSize.toString());
      expect(modelInputs[2].dataSize.toString()).assertEqual("64");
      modelInputs[0].setData(inputBuffer01.buffer);
      modelInputs[1].setData(inputBuffer02.buffer);
      modelInputs[2].setData(inputBuffer03.buffer);
      let Inputs2 = new Float32Array(modelInputs[0].getData());
      for (let i = 0; i < 5; i++) {
        console.log(Inputs2[i].toString());
      }
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      console.log('output0.length:' + output0.length);
      for (let i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      console.log('=========MSLITE new Float32Array end=====');
    });

    // 正常场景：模拟器，调用loadModelFromFile callback接口设置context
    it('Test_load_model_param_model_path_callback_emulator', Level.LEVEL0, async (done: Function) => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_callback_emulator");
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      console.log('=========MSLITE loadModel start=====');
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let context: mindSporeLite.Context = {};
      context.target = ["cpu"];
      context.cpu = {
        "threadNum": 4,
      }
      mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
        console.log('=========MSLITE loadModel end=====');
        expect(msliteModel !== null).assertTrue();
        console.log('=========MSLITE loadModel end=====');
        let modelInputs: mindSporeLite.MSTensor[] = msliteModel.getInputs();
        expect(modelInputs[0].name.toString()).assertEqual("data");
        expect(modelInputs[0].shape.toString()).assertEqual("1,48,48,3");
        expect(modelInputs[0].elementNum.toString()).assertEqual("6912");
        expect(modelInputs[0].dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
        expect(modelInputs[0].format).assertEqual(mindSporeLite.Format.NHWC);
        expect(modelInputs[0].dataSize.toString()).assertEqual("27648");
        modelInputs[0].setData(inputBuffer.buffer);
        console.log('=========MSLITE predict start=====');
        msliteModel.predict(modelInputs, (modelOutputs: mindSporeLite.MSTensor[]) => {
          expect(modelOutputs !== null).assertTrue();
          console.log('=========MSLITE new Float32Array start=====');
          let output0 = new Float32Array(modelOutputs[0].getData());
          expect(output0.length).assertLarger(0);
          console.log('output0.length:' + output0.length);
          for (let i = 0; i < 2; i++) {
            console.log(output0[i].toString());
            expect(output0[i].toString() !== null).assertTrue();
          }
          console.log('=========MSLITE new Float32Array end=====');
          done();
        })
      })
    });

    // 正常场景：模拟器，调用loadModelFromBuffer callback接口设置context
    it('Test_load_model_param_model_buffer_callback_emulator', Level.LEVEL0, async (done: Function) => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_buffer_callback_emulator");
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      console.log('=========MSLITE loadModel start=====');
      let modelName = 'ml_face_isface.ms';
      let model_buffer = await syscontext.resourceManager.getRawFileContent(modelName);
      let context: mindSporeLite.Context = {};
      context.target = ["cpu"];
      context.cpu = {
        "threadNum": 4,
      }
      mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context, (msliteModel: mindSporeLite.Model) => {
        expect(msliteModel !== null).assertTrue();
        console.log('=========MSLITE loadModel end=====');
        let modelInputs: mindSporeLite.MSTensor[] = msliteModel.getInputs();
        let input_name = modelInputs[0].name;
        console.log(input_name.toString());
        expect(input_name.toString()).assertEqual("data");
        let input_shape = modelInputs[0].shape;
        console.log(input_shape.toString());
        expect(input_shape.toString()).assertEqual("1,48,48,3")
        let input_elementNum = modelInputs[0].elementNum;
        console.log(input_elementNum.toString());
        expect(input_elementNum.toString()).assertEqual("6912");
        let input_dtype = modelInputs[0].dtype;
        console.log(input_dtype.toString());
        expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
        let input_format = modelInputs[0].format;
        console.log(input_format.toString());
        expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
        let input_dataSize = modelInputs[0].dataSize;
        console.log(input_dataSize.toString());
        expect(input_dataSize.toString()).assertEqual("27648");
        modelInputs[0].setData(inputBuffer.buffer);
        console.log('=========MSLITE predict start=====');
        msliteModel.predict(modelInputs, (modelOutputs: mindSporeLite.MSTensor[]) => {
          expect(modelOutputs !== null).assertTrue();
          console.log('=========MSLITE new Float32Array start=====');
          let output0 = new Float32Array(modelOutputs[0].getData());
          expect(output0.length).assertLarger(0);
          console.log('output0.length:' + output0.length);
          for (let i = 0; i < 2; i++) {
            console.log(output0[i].toString());
            expect(output0[i].toString() !== null).assertTrue();
          }
          console.log('=========MSLITE new Float32Array end=====');
          done();
        })
      })
    });

    // 正常场景：模拟器，调用loadModelFromFd callback接口设置context
    it('Test_load_model_param_model_fd_callback_emulator', Level.LEVEL0, async (done: Function) => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_fd_callback_emulator");
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      console.log('=========MSLITE loadModel start=====');
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      context.cpu = {
        "threadNum": 4,
      }
      mindSporeLite.loadModelFromFd(file.fd, (msliteModel: mindSporeLite.Model) => {
        expect(msliteModel !== null).assertTrue();
        console.log('=========MSLITE loadModel end=====');
        let modelInputs: mindSporeLite.MSTensor[] = msliteModel.getInputs();
        let input_name = modelInputs[0].name;
        console.log(input_name.toString());
        expect(input_name.toString()).assertEqual("data");
        let input_shape = modelInputs[0].shape;
        console.log(input_shape.toString());
        expect(input_shape.toString()).assertEqual("1,48,48,3")
        let input_elementNum = modelInputs[0].elementNum;
        console.log(input_elementNum.toString());
        expect(input_elementNum.toString()).assertEqual("6912");
        let input_dtype = modelInputs[0].dtype;
        console.log(input_dtype.toString());
        expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
        let input_format = modelInputs[0].format;
        console.log(input_format.toString());
        expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
        let input_dataSize = modelInputs[0].dataSize;
        console.log(input_dataSize.toString());
        expect(input_dataSize.toString()).assertEqual("27648");
        modelInputs[0].setData(inputBuffer.buffer);
        console.log('=========MSLITE predict start=====');
        msliteModel.predict(modelInputs, (modelOutputs: mindSporeLite.MSTensor[]) => {
          expect(modelOutputs !== null).assertTrue();
          console.log('=========MSLITE new Float32Array start=====');
          let output0 = new Float32Array(modelOutputs[0].getData());
          expect(output0.length).assertLarger(0);
          console.log('output0.length:' + output0.length);
          for (let i = 0; i < 2; i++) {
            console.log(output0[i].toString());
            expect(output0[i].toString() !== null).assertTrue();
          }
          console.log('=========MSLITE new Float32Array end=====');
          done();
        })
      })
    });

    // 正常场景：模拟器，调用loadModelFromFile callback接口未设置context
    it('Test_load_model_param_model_path_callback_no_context_emulator', Level.LEVEL0, async (done: Function) => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_callback_no_context_emulator");
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      console.log('=========MSLITE loadModel start=====');
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      mindSporeLite.loadModelFromFile(model_file, (msliteModel: mindSporeLite.Model) => {
        expect(msliteModel !== null).assertTrue();
        console.log('=========MSLITE loadModel end=====');
        let modelInputs: mindSporeLite.MSTensor[] = msliteModel.getInputs();
        let input_name = modelInputs[0].name;
        console.log(input_name.toString());
        expect(input_name.toString()).assertEqual("data");
        let input_shape = modelInputs[0].shape;
        console.log(input_shape.toString());
        expect(input_shape.toString()).assertEqual("1,48,48,3")
        let input_elementNum = modelInputs[0].elementNum;
        console.log(input_elementNum.toString());
        expect(input_elementNum.toString()).assertEqual("6912");
        let input_dtype = modelInputs[0].dtype;
        console.log(input_dtype.toString());
        expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
        let input_format = modelInputs[0].format;
        console.log(input_format.toString());
        expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
        let input_dataSize = modelInputs[0].dataSize;
        console.log(input_dataSize.toString());
        expect(input_dataSize.toString()).assertEqual("27648");
        modelInputs[0].setData(inputBuffer.buffer);
        console.log('=========MSLITE predict start=====');
        msliteModel.predict(modelInputs, (modelOutputs: mindSporeLite.MSTensor[]) => {
          expect(modelOutputs !== null).assertTrue();
          console.log('=========MSLITE new Float32Array start=====');
          let output0 = new Float32Array(modelOutputs[0].getData());
          expect(output0.length).assertLarger(0);
          console.log('output0.length:' + output0.length);
          for (let i = 0; i < 2; i++) {
            console.log(output0[i].toString());
            expect(output0[i].toString() !== null).assertTrue();
          }
          console.log('=========MSLITE new Float32Array end=====');
          done();
        })
      })
    });

    // 正常场景：模拟器，调用loadModelFromBuffer callback接口未设置context
    it('Test_load_model_param_model_buffer_callback_no_context_emulator', Level.LEVEL0, async (done: Function) => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_buffer_callback_no_context_emulator");
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      console.log('=========MSLITE loadModel start=====');
      let modelName = 'ml_face_isface.ms';
      let model_buffer = await syscontext.resourceManager.getRawFileContent(modelName);
      mindSporeLite.loadModelFromBuffer(model_buffer.buffer, (msliteModel: mindSporeLite.Model) => {
        expect(msliteModel !== null).assertTrue();
        console.log('=========MSLITE loadModel end=====');
        let modelInputs: mindSporeLite.MSTensor[] = msliteModel.getInputs();
        let input_name = modelInputs[0].name;
        console.log(input_name.toString());
        expect(input_name.toString()).assertEqual("data");
        let input_shape = modelInputs[0].shape;
        console.log(input_shape.toString());
        expect(input_shape.toString()).assertEqual("1,48,48,3")
        let input_elementNum = modelInputs[0].elementNum;
        console.log(input_elementNum.toString());
        expect(input_elementNum.toString()).assertEqual("6912");
        let input_dtype = modelInputs[0].dtype;
        console.log(input_dtype.toString());
        expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
        let input_format = modelInputs[0].format;
        console.log(input_format.toString());
        expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
        let input_dataSize = modelInputs[0].dataSize;
        console.log(input_dataSize.toString());
        expect(input_dataSize.toString()).assertEqual("27648");
        modelInputs[0].setData(inputBuffer.buffer);
        console.log('=========MSLITE predict start=====');
        msliteModel.predict(modelInputs, (modelOutputs: mindSporeLite.MSTensor[]) => {
          expect(modelOutputs !== null).assertTrue();
          console.log('=========MSLITE new Float32Array start=====');
          let output0 = new Float32Array(modelOutputs[0].getData());
          expect(output0.length).assertLarger(0);
          console.log('output0.length:' + output0.length);
          for (let i = 0; i < 2; i++) {
            console.log(output0[i].toString());
            expect(output0[i].toString() !== null).assertTrue();
          }
          console.log('=========MSLITE new Float32Array end=====');
          done();
        })
      })
    });

    // 正常场景：模拟器，调用loadModelFromFd callback接口未设置context
    it('Test_load_model_param_model_fd_callback_no_context_emulator', Level.LEVEL0, async (done: Function) => {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_fd_callback_no_context_emulator");
      let inputName = 'ml_face_isface_0.input';
      let syscontext: common.Context = globalThis.context;
      let inputBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      console.log('=========MSLITE loadModel start=====');
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
      mindSporeLite.loadModelFromFd(file.fd, (msliteModel: mindSporeLite.Model) => {
        expect(msliteModel !== null).assertTrue();
        console.log('=========MSLITE loadModel end=====');
        let modelInputs: mindSporeLite.MSTensor[] = msliteModel.getInputs();
        let input_name = modelInputs[0].name;
        console.log(input_name.toString());
        expect(input_name.toString()).assertEqual("data");
        let input_shape = modelInputs[0].shape;
        console.log(input_shape.toString());
        expect(input_shape.toString()).assertEqual("1,48,48,3");
        let input_elementNum = modelInputs[0].elementNum;
        console.log(input_elementNum.toString());
        expect(input_elementNum.toString()).assertEqual("6912");
        let input_dtype = modelInputs[0].dtype;
        console.log(input_dtype.toString());
        expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
        let input_format = modelInputs[0].format;
        console.log(input_format.toString());
        expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
        let input_dataSize = modelInputs[0].dataSize;
        console.log(input_dataSize.toString());
        expect(input_dataSize.toString()).assertEqual("27648");
        modelInputs[0].setData(inputBuffer.buffer);
        console.log('=========MSLITE predict start=====');
        msliteModel.predict(modelInputs, (modelOutputs: mindSporeLite.MSTensor[]) => {
          expect(modelOutputs !== null).assertTrue();
          console.log('=========MSLITE new Float32Array start=====');
          let output0 = new Float32Array(modelOutputs[0].getData());
          expect(output0.length).assertLarger(0);
          console.log('output0.length:' + output0.length);
          for (let i = 0; i < 2; i++) {
            console.log(output0[i].toString());
            expect(output0[i].toString() !== null).assertTrue();
          }
          console.log('=========MSLITE new Float32Array end=====');
          done();
        })
      })
    });
  })
}
