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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import mindSporeLite from '@ohos.ai.mindSporeLite';
import fs from '@ohos.file.fs';

export default function abilityTest() {
  describe('ActsAbilityTest', function () {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(function () {
      let dir = globalThis.abilityContext.filesDir + "/";
      try {
        let ml_face_model_file = dir + "ml_face_isface.ms";
        globalThis.context.resourceManager.getRawFileContent("ml_face_isface.ms", (error, model_buffer) => {
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
        globalThis.context.resourceManager.getRawFileContent("ml_face_isface_0.input", (error, model_buffer) => {
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
        globalThis.context.resourceManager.getRawFileContent("ml_ocr_cn.ms", (error, model_buffer) => {
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

      } catch (error) {
        console.info("[rawfile_copy_to_sandbox] getRawFileDescriptor api run failed" + error);
      }

      console.info("[rawfile_copy_to_sandbox] sandbox path:" + dir);
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async function () {
      let dir = globalThis.abilityContext.filesDir + "/";

      let ml_face_model = dir + "ml_face_isface.ms";
      await fs.access(ml_face_model).then(async (res) => {
        if (res) {
          console.info("ml_face_isface.ms file exists");
        }
      }).catch((err) => {
        console.info("ml_face_isface.ms file does not exists! access failed with error message: " +
        err.message + ", error code: " + err.code);
      });

      let mnet_caffemodel_bin_file = dir + "ml_face_isface_0.input";
      await fs.access(mnet_caffemodel_bin_file).then(async (res) => {
        if (res) {
          console.info("ml_face_isface_0.input file exists");
        }
      }).catch((err) => {
        console.info("ml_face_isface_0.input file does not exist! access failed with error message: " +
        err.message + ", error code: " + err.code);
      });

      let ml_ocr_model = dir + "ml_ocr_cn.ms";
      await fs.access(ml_ocr_model).then(async (res) => {
        if (res) {
          console.info("ml_ocr_cn.ms file exists");
        }
      }).catch((err) => {
        console.info("ml_ocr_cn.ms file does not exists! access failed with error message: " +
        err.message + ", error code: " + err.code);
      });



      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(function () {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(function () {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    // 正常场景：ModelBuild，调用buffer方法，正常推理
    it('Test_load_model_param_model_buffer', 0, async function () {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_buffer");
      let modelName = 'ml_face_isface.ms';
      let inputName = 'ml_face_isface_0.input';
      let syscontext = globalThis.context
      let inputBuffer = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let modelBuffer = await syscontext.resourceManager.getRawFileContent(modelName);
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
      for (var i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })



    // 正常场景：ModelBuild，调用fd方法，正常推理
    it('Test_load_model_param_model_fd', 0, async function () {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_fd");
      let inputName = 'ml_face_isface_0.input';
      let syscontext = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer = await syscontext.resourceManager.getRawFileContent(inputName);
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
      for (var i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })

    // 正常场景：ModelBuild，调用loadModelFromFile方法，正常推理
    it('Test_load_model_param_model_path', 0, async function () {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path");
      let inputName = 'ml_face_isface_0.input';
      let syscontext = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer = await syscontext.resourceManager.getRawFileContent(inputName);
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
      for (var i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })


    //正常场景：Context设置CPU，4线程
    it('Test_load_model_param_model_path_settings_threads_001', 0, async function () {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_settings_threads_001");
      let inputName = 'ml_face_isface_0.input';
      let syscontext = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer = await syscontext.resourceManager.getRawFileContent(inputName);
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
      for (var i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })


    //正常场景：Context设置CPU，2线程
    it('Test_load_model_param_model_path_settings_threads_002', 0, async function () {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_settings_threads_002");
      let inputName = 'ml_face_isface_0.input';
      let syscontext = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer = await syscontext.resourceManager.getRawFileContent(inputName);
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
      for (var i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })

    //正常场景：Context设置CPU，1线程
    it('Test_load_model_param_model_path_settings_threads_003', 0, async function () {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_settings_threads_003");
      let inputName = 'ml_face_isface_0.input';
      let syscontext = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer = await syscontext.resourceManager.getRawFileContent(inputName);
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
      for (var i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })


    //正常场景：Context设置CPU，0线程
    it('Test_load_model_param_model_path_settings_threads_004', 0, async function () {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_settings_threads_004");
      let inputName = 'ml_face_isface_0.input';
      let syscontext = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer = await syscontext.resourceManager.getRawFileContent(inputName);
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
      for (var i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })


    //异常场景：Context设置CPU，绑核设置为3，绑核失败
    it('Test_load_model_param_model_path_settings_affinity_001', 0, async function () {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_settings_affinity_001");
      let inputName = 'ml_face_isface_0.input';
      let syscontext = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer = await syscontext.resourceManager.getRawFileContent(inputName);
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
    it('Test_load_model_param_model_path_settings_affinity_002', 0, async function () {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_settings_affinity_002");
      let inputName = 'ml_face_isface_0.input';
      let syscontext = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer = await syscontext.resourceManager.getRawFileContent(inputName);
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
      for (var i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })


    //异常场景：Context设置CPU，绑核设置为1，绑大核
    it('Test_load_model_param_model_path_settings_affinity_003', 0, async function () {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_settings_affinity_003");
      let inputName = 'ml_face_isface_0.input';
      let syscontext = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer = await syscontext.resourceManager.getRawFileContent(inputName);
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
      for (var i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })

    //正常场景：Context设置CPU，绑核设置为0，不绑核
    it('Test_load_model_param_model_path_settings_affinity_004', 0, async function () {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_settings_affinity_004");
      let inputName = 'ml_face_isface_0.input';
      let syscontext = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer = await syscontext.resourceManager.getRawFileContent(inputName);
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
      for (var i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })



    //正常场景：Context设置CPU，绑核列表[0,1,2,3]
    it('Test_load_model_param_model_path_settings_affinity_list_001', 0, async function () {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_settings_affinity_list_001");
      let inputName = 'ml_face_isface_0.input';
      let syscontext = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer = await syscontext.resourceManager.getRawFileContent(inputName);
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
      for (var i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })

    //异常场景：ModelBuild，调用model path方法，path为空
    it('Test_load_model_param_model_path_is_None_001',0, async function (done) {
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
    it('Test_load_model_param_model_buffer_is_None_001',0, async function (done) {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_buffer_is_None_001");
      let context:mindSporeLite.Context={};
      context.target = ["cpu"];
      let msliteModel = await mindSporeLite.loadModelFromBuffer(null, context);
      console.log('=========MSLITE loadModel end=====');
      expect(msliteModel).assertUndefined();
      done();
    })


    //异常场景：ModelBuild，context为null
    it('Test_load_model_param_model_path_context_is_None_001',0, async function (done) {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_context_is_None_001");
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let context:mindSporeLite.Context=null;
      let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
      expect(msliteModel).assertUndefined();
      console.log('=========MSLITE loadModel end=====');
      done();
    })

    // 正常场景：ModelResize，shape与之前一致
    it('Test_load_model_param_model_path_resize_001', 0, async function () {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_resize_001");
      let inputName = 'ml_ocr_cn_0.input';
      let syscontext = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_ocr_cn.ms';
      let inputBuffer = await syscontext.resourceManager.getRawFileContent(inputName);
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
      for (var i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })


    // 正常场景：ModelResize，shape与之前不一致
    it('Test_load_model_param_model_path_resize_002', 0, async function () {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_resize_002");
      let inputName = 'ml_ocr_cn_0.input';
      let syscontext = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_ocr_cn.ms';
      let inputBuffer = await syscontext.resourceManager.getRawFileContent(inputName);
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
      for (var i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })


    // 异常场景：ModelResize，shape为三维
    it('Test_load_model_param_model_path_resize_003', 0, async function () {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_resize_003");
      let inputName = 'ml_ocr_cn_0.input';
      let syscontext = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_ocr_cn.ms';
      let inputBuffer = await syscontext.resourceManager.getRawFileContent(inputName);
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
    it('Test_load_model_param_model_path_resize_004', 0, async function () {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_resize_004");
      let inputName = 'ml_face_isface_0.input';
      let syscontext = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer = await syscontext.resourceManager.getRawFileContent(inputName);
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
    it('Test_load_model_param_model_path_resize_005', 0, async function () {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_resize_005");
      let inputName = 'ml_ocr_cn_0.input';
      let syscontext = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_ocr_cn.ms';
      let inputBuffer = await syscontext.resourceManager.getRawFileContent(inputName);
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
    it('Test_load_model_param_model_path_much_predict_001',0, async function () {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_much_predict_001");
      let inputName = 'ml_face_isface_0.input';
      let syscontext = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer = await syscontext.resourceManager.getRawFileContent(inputName);
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
      for (var i = 0; i < 10; i++) {
        let modelOutputs = await msliteModel.predict(modelInputs);
        expect(modelOutputs !== null).assertTrue();
        console.log('=========MSLITE new Float32Array start=====');
        let output0 = new Float32Array(modelOutputs[0].getData());
        expect(output0.length).assertLarger(0);
        console.log('output0.length:' + output0.length);
        for (var z = 0; z < 2; z++) {
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
    it('Test_load_model_param_model_path_much_build_001', 0, async function () {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_much_build_001");
      let inputName = 'ml_face_isface_0.input';
      let syscontext = globalThis.context;
      let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
      let inputBuffer = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      for (var i = 0; i < 10; i++) {
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
      for (var i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })


    // 正常场景：单输入模型
    it('Test_load_model_param_model_path_model_001', 0, async function () {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_model_001");
      let modelName = 'ml_face_isface.ms';
      let inputName = 'ml_face_isface_0.input';
      let syscontext = globalThis.context;
      let inputBuffer = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      let modelBuffer = await syscontext.resourceManager.getRawFileContent(modelName);
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
      for (var i = 0; i < 5; i++) {
        console.log(Inputs2[i].toString());

      }
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      console.log('output0.length:' + output0.length);
      for (var i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })


    // 正常场景：多输入模型
    it('Test_load_model_param_model_path_model_002', 0, async function () {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_model_002");
      let modelName = 'ml_video_edit_face_cutout_portraitSeg_deconv.ms';
      let inputName01 = 'ml_video_edit_face_cutout_portraitSeg_deconv_0.input';
      let inputName02 = 'ml_video_edit_face_cutout_portraitSeg_deconv_1.input';
      let syscontext = globalThis.context;
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
      for (var i = 0; i < 5; i++) {
        console.log(Inputs2[i].toString());
      }
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      console.log('output0.length:' + output0.length);
      for (var i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })



    // 正常场景：输入为uint8模型
    it('Test_load_model_param_model_path_model_003', 0, async function () {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_model_003");
      let modelName = 'aiy_vision_classifier_plants_V1_3.ms';
      let inputName = 'aiy_vision_classifier_plants_V1_3_0.input';
      let syscontext = globalThis.context;
      let inputBuffer = await syscontext.resourceManager.getRawFileContent(inputName);
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
      for (var i = 0; i < 5; i++) {
        console.log(Inputs2[i].toString());
      }
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Uint8Array(modelOutputs[0].getData());
      console.log('output0.length:' + output0.length);
      for (var i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })


    // 正常场景：多输入单输出
    it('Test_load_model_param_model_path_model_004', 0, async function () {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_model_004");
      let modelName = 'ml_headpose_pb2tflite.ms';
      let inputName01 = 'ml_headpose_pb2tflite_0.input';
      let inputName02 = 'ml_headpose_pb2tflite_1.input';
      let inputName03 = 'ml_headpose_pb2tflite_2.input';
      let syscontext = globalThis.context
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
      for (var i = 0; i < 5; i++) {
        console.log(Inputs2[i].toString());
      }
      console.log('=========MSLITE predict start=====');
      let modelOutputs = await msliteModel.predict(modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      console.log('output0.length:' + output0.length);
      for (var i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
    })


    // 正常场景：调用loadModelFromFile callback接口设置context
    it('Test_load_model_param_model_path_callback', 0, async function (done) {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_callback");
      function load_model_from_file() {
        return new Promise((resolve) => {
          let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
          let context: mindSporeLite.Context = {};
          context.target = ["cpu"];
          context.cpu = {
            "threadNum": 4,
          }
          context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
          context.cpu.precisionMode = "preferred_fp16";
          context.cpu.threadAffinityCoreList = [0, 1, 2, 3];
          mindSporeLite.loadModelFromFile(model_file, context, (msliteModel) => {
            resolve(msliteModel);
          })
        })
      }
      function case_predict(msliteModel, modelInputs) {
        return new Promise((resolve) => {
          msliteModel.predict(modelInputs, (modelOutputs) => {
            resolve(modelOutputs);
          })
        })
      }

      let inputName = 'ml_face_isface_0.input';
      let syscontext = globalThis.context;
      let inputBuffer = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      console.log('=========MSLITE loadModel start=====');
      let msliteModel = null;
      msliteModel = await load_model_from_file();
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
      let modelOutputs = await case_predict(msliteModel, modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (var i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
      done();
    })


    // 正常场景：调用loadModelFromBuffer callback接口设置context
    it('Test_load_model_param_model_buffer_callback', 0, async function (done) {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_buffer_callback");
      function load_model_from_buffer() {
        return new Promise((resolve) => {
          let modelName = 'ml_face_isface.ms';
          syscontext.resourceManager.getRawFileContent(modelName).then((model_buffer) => {
            let modelBuffer = model_buffer
            let context: mindSporeLite.Context = {};
            context.target = ["cpu"];
            context.cpu = {
              "threadNum": 4,
            }
            context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
            context.cpu.precisionMode = "preferred_fp16";
            context.cpu.threadAffinityCoreList = [0, 1, 2, 3];
            mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context, (msliteModel) => {
              resolve(msliteModel);
            })
          })
        })
      }
      function case_predict(msliteModel, modelInputs) {
        return new Promise((resolve) => {
          msliteModel.predict(modelInputs, (modelOutputs) => {
            resolve(modelOutputs);
          })
        })
      }
      let inputName = 'ml_face_isface_0.input';
      let syscontext = globalThis.context;

      let inputBuffer = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);

      console.log('=========MSLITE loadModel start=====');
      let msliteModel = null;
      msliteModel = await load_model_from_buffer();
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
      let modelOutputs = await case_predict(msliteModel, modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (var i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
      done();
    })


    // 正常场景：调用loadModelFromFd callback接口设置context
    it('Test_load_model_param_model_fd_callback', 0, async function (done) {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_fd_callback");
      function load_model_from_fd() {
        return new Promise((resolve) => {
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
          mindSporeLite.loadModelFromFd(file.fd, context, (msliteModel) => {
            resolve(msliteModel);
          })
        })
      }
      function case_predict(msliteModel, modelInputs) {
        return new Promise((resolve) => {
          msliteModel.predict(modelInputs, (modelOutputs) => {
            resolve(modelOutputs);
          })
        })
      }
      let inputName = 'ml_face_isface_0.input';
      let syscontext = globalThis.context;
      let inputBuffer = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);

      console.log('=========MSLITE loadModel start=====');
      let msliteModel = null;
      msliteModel = await load_model_from_fd();
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
      let modelOutputs = await case_predict(msliteModel, modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (var i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
      done();
    })


    // 正常场景：调用loadModelFromFile callback接口未设置context
    it('Test_load_model_param_model_path_callback_no_context', 0, async function (done) {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_path_callback_no_context");
      function load_model_from_file() {
        return new Promise((resolve) => {
          let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
          mindSporeLite.loadModelFromFile(model_file, (msliteModel) => {
            resolve(msliteModel);
          })
        })
      }
      function case_predict(msliteModel, modelInputs) {
        return new Promise((resolve) => {
          msliteModel.predict(modelInputs, (modelOutputs) => {
            resolve(modelOutputs);
          })
        })
      }
      let inputName = 'ml_face_isface_0.input';
      let syscontext = globalThis.context;
      let inputBuffer = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      console.log('=========MSLITE loadModel start=====');
      let msliteModel = null;
      msliteModel = await load_model_from_file();
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
      let modelOutputs = await case_predict(msliteModel, modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (var i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
      done();
    })


    // 正常场景：调用loadModelFromBuffer callback接口未设置context
    it('Test_load_model_param_model_buffer_callback_no_context', 0, async function (done) {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_buffer_callback_no_context");
      function load_model_from_buffer() {
        return new Promise((resolve) => {
          let modelName = 'ml_face_isface.ms';
          syscontext.resourceManager.getRawFileContent(modelName).then((model_buffer) => {
            let modelBuffer = model_buffer
            mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, (msliteModel) => {
              resolve(msliteModel);
          })
          })
        })
      }
      function case_predict(msliteModel, modelInputs) {
        return new Promise((resolve) => {
          msliteModel.predict(modelInputs, (modelOutputs) => {
            resolve(modelOutputs);
          })
        })
      }
      let inputName = 'ml_face_isface_0.input';
      let syscontext = globalThis.context;
      let inputBuffer = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      console.log('=========MSLITE loadModel start=====');
      let msliteModel = null;
      msliteModel = await load_model_from_buffer();
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
      let modelOutputs = await case_predict(msliteModel, modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (var i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
      done();
    })


    // 正常场景：调用loadModelFromFd callback接口未设置context
    it('Test_load_model_param_model_fd_callback_no_context', 0, async function (done) {
      console.log("MSLITE api test: loadModel param model file.Test_load_model_param_model_fd_callback_no_context");
      function load_model_from_fd() {
        return new Promise((resolve) => {
          let model_file = globalThis.abilityContext.filesDir + '/' + 'ml_face_isface.ms';
          let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
          mindSporeLite.loadModelFromFd(file.fd, (msliteModel) => {
            resolve(msliteModel);
          })
        })
      }
      function case_predict(msliteModel, modelInputs) {
        return new Promise((resolve) => {
          msliteModel.predict(modelInputs, (modelOutputs) => {
            resolve(modelOutputs);
          })
        })
      }
      let inputName = 'ml_face_isface_0.input';
      let syscontext = globalThis.context;
      let inputBuffer = await syscontext.resourceManager.getRawFileContent(inputName);
      console.log('=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
      console.log('=========MSLITE loadModel start=====');
      let msliteModel = null;
      msliteModel = await load_model_from_fd();
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
      let modelOutputs = await case_predict(msliteModel, modelInputs);
      expect(modelOutputs !== null).assertTrue();
      console.log('=========MSLITE new Float32Array start=====');
      let output0 = new Float32Array(modelOutputs[0].getData());
      expect(output0.length).assertLarger(0);
      console.log('output0.length:' + output0.length);
      for (var i = 0; i < 2; i++) {
        console.log(output0[i].toString());
        expect(output0[i].toString() !== null).assertTrue();
      }
      const modelInputs0 = msliteModel.getInputs();
      console.log(modelInputs0[0].name.toString());
      console.log('=========MSLITE new Float32Array end=====');
      done();
    })

    // 正常场景：头文件枚举值测试
    it('Test_enumerated_value', 0, async function (done) {
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
        done()
      } catch (error) {
        console.info("The enumerated are changed:" + error)
        done()
      }
    })

  })
}
