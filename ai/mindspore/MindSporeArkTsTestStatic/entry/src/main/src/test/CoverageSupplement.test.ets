/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import resourceManager from '@ohos.resourceManager';
import Ability from '@ohos.app.ability.UIAbility'
import Context from 'application.Context';
import common from '@ohos.app.ability.common';
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach} from "../../../hypium/index";
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs';
import { collections } from '@kit.ArkTS';
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { BusinessError } from '@ohos.base'
import mindSporeLite from '@ohos.ai.mindSporeLite';


let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'MSTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

function getNPUDeviceDesc(): mindSporeLite.NNRTDeviceDescription|null {
  let device : mindSporeLite.NNRTDeviceDescription|null;
  device = null;
  let all_devices = mindSporeLite.getAllNNRTDeviceDescriptions();
  if (all_devices == null) {
    hilog.info(domain, tag, '%{public}s', '=========getAllNNRTDeviceDescriptions is NULL==========');
    return device
  }
  for (let i = 0; i<all_devices.length; i++){
    if (all_devices[i].deviceName().toString().startsWith('NPU_')) {
      device = all_devices[i];
      hilog.info(domain, tag, '%{public}s', '=========The NNRt-npu device has been found.==========');
    }
    hilog.info(domain, tag, '%{public}s', '=========print NNRT Device==========');
    hilog.info(domain, tag, '%{public}s', all_devices[i].deviceID().toString());
    hilog.info(domain, tag, '%{public}s', all_devices[i].deviceType().toString());
    hilog.info(domain, tag, '%{public}s', all_devices[i].deviceName().toString());
    hilog.info(domain, tag, '%{public}s', '=========print NNRT Device end============');
  }
  return device
}

function sleep(ms:number) {
  // 获取当前时间的戳
  const date = Date.now();
  // 初始化当前时间为 null
  let currentDate:number;
  // 开始一个循环，直到延迟时间结束
  do {
    // 获取当前时间的戳
    currentDate = Date.now();
    // 检查当前时间与开始时间之差是否小于延迟时间
  } while ((currentDate - date) < ms)
}

export default function coverageSupplementTest() {

  describe('coverageSupplementTest', (): void => {
    let abilityContext: Context;
    let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
    abilityContext = abilityDelegator.getAppContext()
    hilog.info(domain, tag, '%{public}s', 'describe start!!!');

    beforeAll(() => {
      let dir = abilityContext.filesDir + "/";
      try {
        let ml_face_model_file = dir + "ml_face_isface.ms";
        abilityContext.resourceManager.getRawFileContent("ml_face_isface.ms", (error: BusinessError<void> | null, model_buffer: Uint8Array | undefined) => {
          if (error != null) {
            hilog.info(domain, tag, '%{public}s',
              "[rawfile_copy_to_sandbox] ml_face_isface.ms is copy " +
              "failed:${error.code}, message: ${error.message}.");
          } else {
            let file = fs.openSync(ml_face_model_file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
            if (model_buffer?.buffer !== null) {
              fs.writeSync(file.fd, model_buffer!.buffer);
              fs.closeSync(file);
              hilog.info(domain, tag, '%{public}s', "[rawfile_copy_to_sandbox] ml_face_isface.ms is copy success");
            } else {
              hilog.info(domain, tag, '%{public}s', 'copy ml_ocr_cn.ms sandbox fail!!!');
            }
          }
        });

        let ml_ocr_model_file = dir + "ml_ocr_cn.ms";
        abilityContext.resourceManager.getRawFileContent("ml_ocr_cn.ms", (error: BusinessError<void> | null, model_buffer: Uint8Array | undefined) => {
          if (error != null) {
            hilog.info(domain, tag, '%{public}s',
              "[rawfile_copy_to_sandbox] ml_ocr_cn.ms is copy " +
              "failed:${error.code}, message: ${error.message}.");
          } else {
            let file = fs.openSync(ml_ocr_model_file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
            if (model_buffer?.buffer !== null) {
              fs.writeSync(file.fd, model_buffer!.buffer);
              fs.closeSync(file);
              hilog.info(domain, tag, '%{public}s', "[rawfile_copy_to_sandbox] ml_ocr_cn.ms is copy success");
            } else {
              hilog.info(domain, tag, '%{public}s', 'copy ml_ocr_cn.ms sandbox fail!!!');
            }
          }
        });

        let lenet_train_model_file = dir + "lenet_train.ms";
        abilityContext.resourceManager.getRawFileContent("lenet_train.ms", (error: BusinessError<void> | null, model_buffer: Uint8Array | undefined) => {
          if (error != null) {
            hilog.info(domain, tag, '%{public}s',
              "[rawfile_copy_to_sandbox] lenet_train.ms is copy " +
              "failed:${error.code}, message: ${error.message}.");
          } else {
            let file = fs.openSync(lenet_train_model_file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
            if (model_buffer?.buffer !== null) {
              fs.writeSync(file.fd, model_buffer!.buffer);
              fs.closeSync(file);
              hilog.info(domain, tag, '%{public}s', "[rawfile_copy_to_sandbox] lenet_train.ms is copy success");
            } else {
              hilog.info(domain, tag, '%{public}s', 'copy lenet_train.ms sandbox fail!!!');
            }
          }
        });

      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "[rawfile_copy_to_sandbox] getRawFileDescriptor api run failed" + error);
      }

      hilog.info(domain, tag, '%{public}s', "[rawfile_copy_to_sandbox] sandbox path:" + dir);
    });

    beforeEach(async () => {
      let dir = abilityContext.filesDir + "/";
      let ml_face_model = dir + "ml_face_isface.ms";
      let ml_face_model_return = await fs.access(ml_face_model, fs.AccessModeType.EXIST)
      if (ml_face_model_return) {
        hilog.info(domain, tag, '%{public}s', "ml_face_isface.ms file exists:" + ml_face_model_return.toString());
      }else{
        hilog.info(domain, tag, '%{public}s', "ml_face_isface.ms file not exists:" + ml_face_model_return.toString());
        hilog.info(domain, tag, '%{public}s', "Wait for the file copy to complete.");
        // 延时等待模型拷贝完成，单位是毫秒，1秒（s）=1000毫秒（ms）
        sleep(6000);
      }

      let ml_ocr_model = dir + "ml_ocr_cn.ms";
      let ml_ocr_model_return = await fs.access(ml_ocr_model, fs.AccessModeType.EXIST)
      if (ml_ocr_model_return) {
        hilog.info(domain, tag, '%{public}s', "ml_ocr_cn.ms file exists:" + ml_ocr_model_return.toString());
      }else{
        hilog.info(domain, tag, '%{public}s', "ml_ocr_cn.ms file not exists:" + ml_ocr_model_return.toString());
        hilog.info(domain, tag, '%{public}s', "Wait for the file copy to complete.");
        // 延时等待模型拷贝完成，单位是毫秒，1秒（s）=1000毫秒（ms）
        sleep(6000);
      }

      let lenet_train_model = dir + "lenet_train.ms";
      let lenet_train_model_return = await fs.access(lenet_train_model, fs.AccessModeType.EXIST)
      if (lenet_train_model_return) {
        hilog.info(domain, tag, '%{public}s', "lenet_train.ms file exists:" + lenet_train_model_return.toString());
      }else{
        hilog.info(domain, tag, '%{public}s', "lenet_train.ms file not exists:" + lenet_train_model_return.toString());
        hilog.info(domain, tag, '%{public}s', "Wait for the file copy to complete.");
        // 延时等待模型拷贝完成，单位是毫秒，1秒（s）=1000毫秒（ms）
        sleep(6000);
      }
    });


    // 4. loadTrainModelFromFile 测试用例
    /**
     * @tc.name   loadTrainModelFromFileLossNameEmptyArrayStatic001
     * @tc.number CoverageSupplementTest_008
     * @tc.desc   loadTrainModelFromFile TrainCfg lossName empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileLossNameEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplementTest: loadTrainModelFromFileLossNameEmptyArrayStatic001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.lossName = [];
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let model_file = abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        expect(msliteModel).not().assertUndefined();
        expect(msliteModel).not().assertNull();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadTrainModelFromFileLossNameEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });


    /**
     * @tc.name   modelRunStepInputsEmptyArrayStatic001
     * @tc.number CoverageSupplementTest_018
     * @tc.desc   Model runStep inputs empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelRunStepInputsEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplementTest: modelRunStepInputsEmptyArrayStatic001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let ret = msliteModel.runStep([]);
          expect(ret).assertFalse();
        }
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "modelRunStepInputsEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   modelUpdateWeightsWeightsEmptyArrayStatic001
     * @tc.number CoverageSupplementTest_020
     * @tc.desc   Model updateWeights weights empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelUpdateWeightsWeightsEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplementTest: modelUpdateWeightsWeightsEmptyArrayStatic001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let ret = msliteModel.updateWeights([]);
          expect(ret).assertFalse();
        }
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "modelUpdateWeightsWeightsEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });


    // 3. loadModelFromFd API 测试 - Context + Callback 版本 - 基础测试
    /**
     * @tc.name   loadModelFromFdContextCallbackNormalStatic001
     * @tc.number CoverageSupplement2Test_036
     * @tc.desc   loadModelFromFd Context Callback normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextCallbackNormalStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement2Test: loadModelFromFdContextCallbackNormalStatic001");
      try {
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        mindSporeLite.loadModelFromFd(file.fd, context, (msliteModel: mindSporeLite.Model) => {
          fs.closeSync(file);
          expect(msliteModel !== null).assertTrue();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFdContextCallbackNormalStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    // 4. loadTrainModelFromFile API 测试 - Context 属性覆盖
    /**
     * @tc.name   loadTrainModelFromFileContextPrecisionModeEmptyStringStatic001
     * @tc.number CoverageSupplement2Test_037
     * @tc.desc   loadTrainModelFromFile Context precisionMode empty string test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileContextPrecisionModeEmptyStringStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement2Test: loadTrainModelFromFileContextPrecisionModeEmptyStringStatic001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          precisionMode: "",
        };
        let model_file = abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        expect(msliteModel).not().assertUndefined();
        expect(msliteModel).not().assertNull();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadTrainModelFromFileContextPrecisionModeEmptyStringStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });


    // 5. loadTrainModelFromBuffer API 测试 - Context 属性覆盖
    /**
     * @tc.name   loadTrainModelFromBufferContextPrecisionModeEmptyStringStatic001
     * @tc.number CoverageSupplement2Test_046
     * @tc.desc   loadTrainModelFromBuffer Context precisionMode empty string test.
     * @tc.type     FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromBufferContextPrecisionModeEmptyStringStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement2Test: loadTrainModelFromBufferContextPrecisionModeEmptyStringStatic001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityCoreList: [0, 1],
        };
        let modelBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent("lenet_train.ms");
        let msliteModel = mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer, trainCfg, context);
        expect(msliteModel).not().assertUndefined();
        expect(msliteModel).not().assertNull();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadTrainModelFromBufferContextPrecisionModeEmptyStringStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    // 6. loadTrainModelFromFd API 测试 - Context 属性覆盖
    /**
     * @tc.name   loadTrainModelFromFdContextPrecisionModeEmptyStringStatic001
     * @tc.number CoverageSupplement2Test_055
     * @tc.desc   loadTrainModelFromFd Context precisionMode empty string test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdContextPrecisionModeEmptyStringStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement2Test: loadTrainModelFromFdContextPrecisionModeEmptyStringStatic001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        context.cpu = {
          threadAffinityCoreList: [0, 1],
        };
        let model_file = abilityContext.filesDir + "/" + "lenet_train.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, trainCfg, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertUndefined();
        expect(msliteModel).not().assertNull();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadTrainModelFromFdContextPrecisionModeEmptyStringStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });


    /**
     * @tc.name   modelPredictPromiseInputsEmptyArrayStatic001
     * @tc.number CoverageSupplement2Test_069
     * @tc.desc   Model predict Promise inputs empty array test.返回一个空对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelPredictPromiseInputsEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement2Test: modelPredictPromiseInputsEmptyArrayStatic001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let model_file = abilityContext.filesDir + "/" + "ml_ocr_cn.ms";
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
        if (msliteModel !== null) {
          let modelOutputs = await msliteModel.predict([]);
          hilog.info(domain, tag, 'modelOutputs type: ' + typeof modelOutputs);
          hilog.info(domain, tag, 'modelOutputs keys length: ' + Object.keys(modelOutputs).length);
          hilog.info(domain, tag, 'modelOutputs stringify: ' + JSON.stringify(modelOutputs));
          expect(modelOutputs).not().assertNull();
          expect(modelOutputs).not().assertUndefined();
          expect(typeof modelOutputs).assertEqual("object");
          expect(Object.keys(modelOutputs).length).assertEqual(0);
          done();
        }
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "modelPredictPromiseInputsEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   modelResizeInputsEmptyArrayStatic001
     * @tc.number CoverageSupplement2Test_072
     * @tc.desc   Model resize inputs empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelResizeInputsEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement2Test: modelResizeInputsEmptyArrayStatic001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        mindSporeLite.loadModelFromFile(model_file, context, (mslite: mindSporeLite.Model) => {
          if (mslite !== null) {
            let new_dim = new Array<Int[]>([48, 48]);
            let ret = mslite.resize([], new_dim);
            expect(ret).assertFalse();
          }
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "modelResizeInputsEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   modelResizeDimsEmptyArrayStatic001
     * @tc.number CoverageSupplement2Test_073
     * @tc.desc   Model resize dims empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelResizeDimsEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement2Test: modelResizeDimsEmptyArrayStatic001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        mindSporeLite.loadModelFromFile(model_file, context, (mslite: mindSporeLite.Model) => {
          if (mslite !== null) {
            let modelInputs: mindSporeLite.MSTensor[] = mslite.getInputs();
            if (modelInputs.length > 0) {
              let ret = mslite.resize(modelInputs, []);
            expect(ret).assertFalse();
            }
          }
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "modelResizeDimsEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });


    // 1. loadModelFromFile API 测试 - Promise 版本 - Context 属性覆盖
    /**
     * @tc.name   loadModelFromFileContextCpuThreadAffinityCoreListEmptyArrayStatic001
     * @tc.number CoverageSupplement3Test_Static001
     * @tc.desc   loadModelFromFile Context cpu threadAffinityCoreList empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileContextCpuThreadAffinityCoreListEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFileContextCpuThreadAffinityCoreListEmptyArrayStatic001");
      try {
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityCoreList: [],
        };
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFileContextCpuThreadAffinityCoreListEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileContextNnrtPerformanceModeExtremeStatic001
     * @tc.number CoverageSupplement3Test_006
     * @tc.desc   loadModelFromFile Context nnrt performanceMode PERFORMANCE_EXTREME test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileContextNnrtPerformanceModeExtremeStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFileContextNnrtPerformanceModeExtremeStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          performanceMode: mindSporeLite.PerformanceMode.PERFORMANCE_EXTREME,
          deviceID: device.deviceID(),
        };
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
        hilog.info(domain, tag, 'msliteModel type: ' + typeof msliteModel);
        hilog.info(domain, tag, 'msliteModel keys length: ' + Object.keys(msliteModel).length);
        hilog.info(domain, tag, 'msliteModel stringify: ' + JSON.stringify(msliteModel));
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFileContextNnrtPerformanceModeExtremeStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileContextNnrtPerformanceModeLowStatic001
     * @tc.number CoverageSupplement3Test_007
     * @tc.desc   loadModelFromFile Context nnrt performanceMode PERFORMANCE_LOW test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileContextNnrtPerformanceModeLowStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFileContextNnrtPerformanceModeLowStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          priority: mindSporeLite.Priority.PRIORITY_NONE,
          performanceMode: mindSporeLite.PerformanceMode.PERFORMANCE_LOW,
          deviceID: device.deviceID(),
        };
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFileContextNnrtPerformanceModeLowStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileContextNnrtPriorityLowStatic001
     * @tc.number CoverageSupplement3Test_008
     * @tc.desc   loadModelFromFile Context nnrt priority LOW test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileContextNnrtPriorityLowStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFileContextNnrtPriorityLowStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          priority: mindSporeLite.Priority.PRIORITY_LOW,
          deviceID: device.deviceID(),
        };
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFileContextNnrtPriorityLowStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileContextNnrtPriorityMediumStatic001
     * @tc.number CoverageSupplement3Test_009
     * @tc.desc   loadModelFromFile Context nnrt priority MEDIUM test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileContextNnrtPriorityMediumStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFileContextNnrtPriorityMediumStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          priority: mindSporeLite.Priority.PRIORITY_MEDIUM,
          deviceID: device.deviceID(),
        };
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFileContextNnrtPriorityMediumStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileContextNnrtPriorityHighStatic001
     * @tc.number CoverageSupplement3Test_010
     * @tc.desc   loadModelFromFile Context nnrt priority HIGH test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileContextNnrtPriorityHighStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFileContextNnrtPriorityHighStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          priority: mindSporeLite.Priority.PRIORITY_HIGH,
          deviceID: device.deviceID(),
        };
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFileContextNnrtPriorityHighStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileContextNnrtExtensionsEmptyArrayStatic001
     * @tc.number CoverageSupplement3Test_011
     * @tc.desc   loadModelFromFile Context nnrt extensions empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileContextNnrtExtensionsEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFileContextNnrtExtensionsEmptyArrayStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          deviceID: device.deviceID(),
          extensions: [],
        };
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFileContextNnrtExtensionsEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileContextNnrtExtensionsNonEmptyArrayStatic001
     * @tc.number CoverageSupplement3Test_012
     * @tc.desc   loadModelFromFile Context nnrt extensions non-empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileContextNnrtExtensionsNonEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFileContextNnrtExtensionsNonEmptyArrayStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        let Extension_Buffer = new ArrayBuffer(16777216);
        let extension: mindSporeLite.Extension = {
          name: "test_extension",
          value: Extension_Buffer,
        };
        context.nnrt = {
          deviceID: device.deviceID(),
          extensions: [extension],
        };
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFileContextNnrtExtensionsNonEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileCallbackContextCpuThreadAffinityModeAffinityModeStatic001
     * @tc.number CoverageSupplement3Test_018
     * @tc.desc   loadModelFromFile Callback Context cpu threadAffinityMode AFFINITY_MODE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileCallbackContextCpuThreadAffinityModeAffinityModeStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFileCallbackContextCpuThreadAffinityModeAffinityModeStatic001");
      try {
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityMode: mindSporeLite.ThreadAffinityMode.NO_AFFINITIES,
        };
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFileCallbackContextCpuThreadAffinityModeAffinityModeStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileCallbackContextCpuThreadAffinityModeBigLittleStatic001
     * @tc.number CoverageSupplement3Test_019
     * @tc.desc   loadModelFromFile Callback Context cpu threadAffinityMode BIG_LITTLE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileCallbackContextCpuThreadAffinityModeBigLittleStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFileCallbackContextCpuThreadAffinityModeBigLittleStatic001");
      try {
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST,
        };
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFileCallbackContextCpuThreadAffinityModeBigLittleStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileCallbackContextCpuThreadAffinityModeHybridStatic001
     * @tc.number CoverageSupplement3Test_020
     * @tc.desc   loadModelFromFile Callback Context cpu threadAffinityMode HYBRID test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileCallbackContextCpuThreadAffinityModeHybridStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFileCallbackContextCpuThreadAffinityModeHybridStatic001");
      try {
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityMode: mindSporeLite.ThreadAffinityMode.LITTLE_CORES_FIRST,
        };
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFileCallbackContextCpuThreadAffinityModeHybridStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileCallbackContextCpuThreadAffinityCoreListEmptyArrayStatic001
     * @tc.number CoverageSupplement3Test_021
     * @tc.desc   loadModelFromFile Callback Context cpu threadAffinityCoreList empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileCallbackContextCpuThreadAffinityCoreListEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFileCallbackContextCpuThreadAffinityCoreListEmptyArrayStatic001");
      try {
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityCoreList: [],
        };
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFileCallbackContextCpuThreadAffinityCoreListEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileCallbackContextNnrtPerformanceModeNoneStatic001
     * @tc.number CoverageSupplement3Test_022
     * @tc.desc   loadModelFromFile Callback Context nnrt performanceMode PERFORMANCE_NONE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileCallbackContextNnrtPerformanceModeNoneStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFileCallbackContextNnrtPerformanceModeNoneStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          performanceMode: mindSporeLite.PerformanceMode.PERFORMANCE_NONE,
          deviceID: device.deviceID(),
        };
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFileCallbackContextNnrtPerformanceModeNoneStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileCallbackContextNnrtPerformanceModeLowStatic001
     * @tc.number CoverageSupplement3Test_023
     * @tc.desc   loadModelFromFile Callback Context nnrt performanceMode PERFORMANCE_LOW test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileCallbackContextNnrtPerformanceModeLowStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFileCallbackContextNnrtPerformanceModeLowStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          priority: mindSporeLite.Priority.PRIORITY_NONE,
          performanceMode: mindSporeLite.PerformanceMode.PERFORMANCE_LOW,
          deviceID: device.deviceID(),
        };
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFileCallbackContextNnrtPerformanceModeLowStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileCallbackContextNnrtPriorityLowStatic001
     * @tc.number CoverageSupplement3Test_024
     * @tc.desc   loadModelFromFile Callback Context nnrt priority LOW test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileCallbackContextNnrtPriorityLowStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFileCallbackContextNnrtPriorityLowStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          priority: mindSporeLite.Priority.PRIORITY_LOW,
          deviceID: device.deviceID(),
        };
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFileCallbackContextNnrtPriorityLowStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileCallbackContextNnrtPriorityMediumStatic001
     * @tc.number CoverageSupplement3Test_025
     * @tc.desc   loadModelFromFile Callback Context nnrt priority MEDIUM test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileCallbackContextNnrtPriorityMediumStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFileCallbackContextNnrtPriorityMediumStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          priority: mindSporeLite.Priority.PRIORITY_MEDIUM,
          deviceID: device.deviceID(),
        };
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFileCallbackContextNnrtPriorityMediumStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileCallbackContextNnrtPriorityHighStatic001
     * @tc.number CoverageSupplement3Test_026
     * @tc.desc   loadModelFromFile Callback Context nnrt priority HIGH test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileCallbackContextNnrtPriorityHighStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFileCallbackContextNnrtPriorityHighStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          priority: mindSporeLite.Priority.PRIORITY_HIGH,
          deviceID: device.deviceID(),
        };
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFileCallbackContextNnrtPriorityHighStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileCallbackContextNnrtExtensionsEmptyArrayStatic001
     * @tc.number CoverageSupplement3Test_027
     * @tc.desc   loadModelFromFile Callback Context nnrt extensions empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileCallbackContextNnrtExtensionsEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFileCallbackContextNnrtExtensionsEmptyArrayStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          deviceID: device.deviceID(),
          extensions: [],
        };
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFileCallbackContextNnrtExtensionsEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileCallbackContextNnrtExtensionsNonEmptyArrayStatic001
     * @tc.number CoverageSupplement3Test_028
     * @tc.desc   loadModelFromFile Callback Context nnrt extensions non-empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileCallbackContextNnrtExtensionsNonEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFileCallbackContextNnrtExtensionsNonEmptyArrayStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        let Extension_Buffer = new ArrayBuffer(16777216);
        let extension: mindSporeLite.Extension = {
          name: "test_extension",
          value: Extension_Buffer,
        };
        context.nnrt = {
          deviceID: device.deviceID(),
          extensions: [extension],
        };
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFileCallbackContextNnrtExtensionsNonEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextCpuThreadAffinityModeAffinityModeStatic001
     * @tc.number CoverageSupplement3Test_032
     * @tc.desc   loadModelFromBuffer Context cpu threadAffinityMode AFFINITY_MODE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextCpuThreadAffinityModeAffinityModeStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromBufferContextCpuThreadAffinityModeAffinityModeStatic001");
      try {

        let modelName = 'ml_face_isface.ms';
        let model_buffer = await abilityContext.resourceManager.getRawFileContent(modelName);
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityMode:mindSporeLite.ThreadAffinityMode.NO_AFFINITIES,
        };
        let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromBufferContextCpuThreadAffinityModeAffinityModeStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextCpuThreadAffinityModeBigLittleStatic001
     * @tc.number CoverageSupplement3Test_033
     * @tc.desc   loadModelFromBuffer Context cpu threadAffinityMode BIG_LITTLE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextCpuThreadAffinityModeBigLittleStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromBufferContextCpuThreadAffinityModeBigLittleStatic001");
      try {

        let modelName = 'ml_face_isface.ms';
        let model_buffer = await abilityContext.resourceManager.getRawFileContent(modelName);
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST,
        };
        let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromBufferContextCpuThreadAffinityModeBigLittleStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextCpuThreadAffinityModeHybridStatic001
     * @tc.number CoverageSupplement3Test_034
     * @tc.desc   loadModelFromBuffer Context cpu threadAffinityMode HYBRID test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextCpuThreadAffinityModeHybridStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromBufferContextCpuThreadAffinityModeHybridStatic001");
      try {

        let modelName = 'ml_face_isface.ms';
        let model_buffer = await abilityContext.resourceManager.getRawFileContent(modelName);
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityMode:mindSporeLite.ThreadAffinityMode.LITTLE_CORES_FIRST,
        };
        let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromBufferContextCpuThreadAffinityModeHybridStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextCpuThreadAffinityCoreListEmptyArrayStatic001
     * @tc.number CoverageSupplement3Test_035
     * @tc.desc   loadModelFromBuffer Context cpu threadAffinityCoreList empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextCpuThreadAffinityCoreListEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromBufferContextCpuThreadAffinityCoreListEmptyArrayStatic001");
      try {

        let modelName = 'ml_face_isface.ms';
        let model_buffer = await abilityContext.resourceManager.getRawFileContent(modelName);
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityCoreList: [],
        };
        let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromBufferContextCpuThreadAffinityCoreListEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextCpuThreadAffinityCoreListNonEmptyArrayStatic001
     * @tc.number CoverageSupplement3Test_036
     * @tc.desc   loadModelFromBuffer Context cpu threadAffinityCoreList non-empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextCpuThreadAffinityCoreListNonEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromBufferContextCpuThreadAffinityCoreListNonEmptyArrayStatic001");
      try {

        let modelName = 'ml_face_isface.ms';
        let model_buffer = await abilityContext.resourceManager.getRawFileContent(modelName);
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityCoreList: [0, 1],
        };
        let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromBufferContextCpuThreadAffinityCoreListNonEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextNnrtPerformanceModeNoneStatic001
     * @tc.number CoverageSupplement3Test_037
     * @tc.desc   loadModelFromBuffer Context nnrt performanceMode PERFORMANCE_NONE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextNnrtPerformanceModeNoneStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromBufferContextNnrtPerformanceModeNoneStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }

        let modelName = 'ml_face_isface.ms';
        let model_buffer = await abilityContext.resourceManager.getRawFileContent(modelName);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          performanceMode: mindSporeLite.PerformanceMode.PERFORMANCE_NONE,
          deviceID: device.deviceID(),
        };
        let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromBufferContextNnrtPerformanceModeNoneStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextNnrtPerformanceModeLowStatic001
     * @tc.number CoverageSupplement3Test_038
     * @tc.desc   loadModelFromBuffer Context nnrt performanceMode PERFORMANCE_LOW test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextNnrtPerformanceModeLowStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromBufferContextNnrtPerformanceModeLowStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }

        let modelName = 'ml_face_isface.ms';
        let model_buffer = await abilityContext.resourceManager.getRawFileContent(modelName);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          priority: mindSporeLite.Priority.PRIORITY_NONE,
          performanceMode: mindSporeLite.PerformanceMode.PERFORMANCE_LOW,
          deviceID: device.deviceID(),
        };
        let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromBufferContextNnrtPerformanceModeLowStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextNnrtPriorityLowStatic001
     * @tc.number CoverageSupplement3Test_039
     * @tc.desc   loadModelFromBuffer Context nnrt priority LOW test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextNnrtPriorityLowStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromBufferContextNnrtPriorityLowStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }

        let modelName = 'ml_face_isface.ms';
        let model_buffer = await abilityContext.resourceManager.getRawFileContent(modelName);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          priority: mindSporeLite.Priority.PRIORITY_LOW,
          deviceID: device.deviceID(),
        };
        let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromBufferContextNnrtPriorityLowStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextNnrtPriorityMediumStatic001
     * @tc.number CoverageSupplement3Test_040
     * @tc.desc   loadModelFromBuffer Context nnrt priority MEDIUM test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextNnrtPriorityMediumStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromBufferContextNnrtPriorityMediumStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }

        let modelName = 'ml_face_isface.ms';
        let model_buffer = await abilityContext.resourceManager.getRawFileContent(modelName);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          priority: mindSporeLite.Priority.PRIORITY_MEDIUM,
          deviceID: device.deviceID(),
        };
        let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromBufferContextNnrtPriorityMediumStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextNnrtPriorityHighStatic001
     * @tc.number CoverageSupplement3Test_041
     * @tc.desc   loadModelFromBuffer Context nnrt priority HIGH test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextNnrtPriorityHighStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromBufferContextNnrtPriorityHighStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }

        let modelName = 'ml_face_isface.ms';
        let model_buffer = await abilityContext.resourceManager.getRawFileContent(modelName);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          priority: mindSporeLite.Priority.PRIORITY_HIGH,
          deviceID: device.deviceID(),
        };
        let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromBufferContextNnrtPriorityHighStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextNnrtExtensionsEmptyArrayStatic001
     * @tc.number CoverageSupplement3Test_042
     * @tc.desc   loadModelFromBuffer Context nnrt extensions empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextNnrtExtensionsEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromBufferContextNnrtExtensionsEmptyArrayStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let modelName = 'ml_face_isface.ms';
        let model_buffer = await abilityContext.resourceManager.getRawFileContent(modelName);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          deviceID: device.deviceID(),
          extensions: [],
        };
        let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromBufferContextNnrtExtensionsEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextNnrtExtensionsNonEmptyArrayStatic001
     * @tc.number CoverageSupplement3Test_043
     * @tc.desc   loadModelFromBuffer Context nnrt extensions non-empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextNnrtExtensionsNonEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromBufferContextNnrtExtensionsNonEmptyArrayStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let modelName = 'ml_face_isface.ms';
        let model_buffer = await abilityContext.resourceManager.getRawFileContent(modelName);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        let Extension_Buffer = new ArrayBuffer(16777216);
        let extension: mindSporeLite.Extension = {
          name: "test_extension",
          value: Extension_Buffer,
        };
        context.nnrt = {
          deviceID: device.deviceID(),
          extensions: [extension],
        };
        let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromBufferContextNnrtExtensionsNonEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });


    /**
     * @tc.name   loadModelFromFdContextCpuThreadAffinityModeBigLittleStatic001
     * @tc.number CoverageSupplement3Test_054
     * @tc.desc   loadModelFromFd Context cpu threadAffinityMode BIG_LITTLE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextCpuThreadAffinityModeBigLittleStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFdContextCpuThreadAffinityModeBigLittleStatic001");
      try {
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST,
        };
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFdContextCpuThreadAffinityModeBigLittleStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdContextCpuThreadAffinityModeHybridStatic001
     * @tc.number CoverageSupplement3Test_055
     * @tc.desc   loadModelFromFd Context cpu threadAffinityMode HYBRID test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextCpuThreadAffinityModeHybridStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFdContextCpuThreadAffinityModeHybridStatic001");
      try {
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityMode: mindSporeLite.ThreadAffinityMode.LITTLE_CORES_FIRST,
        };
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFdContextCpuThreadAffinityModeHybridStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdContextCpuThreadAffinityCoreListEmptyArrayStatic001
     * @tc.number CoverageSupplement3Test_056
     * @tc.desc   loadModelFromFd Context cpu threadAffinityCoreList empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextCpuThreadAffinityCoreListEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFdContextCpuThreadAffinityCoreListEmptyArrayStatic001");
      try {
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityCoreList: [],
        };
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFdContextCpuThreadAffinityCoreListEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdContextCpuThreadAffinityCoreListNonEmptyArrayStatic001
     * @tc.number CoverageSupplement3Test_057
     * @tc.desc   loadModelFromFd Context cpu threadAffinityCoreList non-empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextCpuThreadAffinityCoreListNonEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFdContextCpuThreadAffinityCoreListNonEmptyArrayStatic001");
      try {
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityCoreList: [0, 1],
        };
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFdContextCpuThreadAffinityCoreListNonEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdContextNnrtPerformanceModeLowStatic001
     * @tc.number CoverageSupplement3Test_058
     * @tc.desc   loadModelFromFd Context nnrt performanceMode PERFORMANCE_LOW test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextNnrtPerformanceModeLowStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFdContextNnrtPerformanceModeLowStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          performanceMode: mindSporeLite.PerformanceMode.PERFORMANCE_LOW,
          deviceID: device.deviceID(),
        };
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFdContextNnrtPerformanceModeLowStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdContextNnrtPerformanceModeNoneStatic001
     * @tc.number CoverageSupplement3Test_059
     * @tc.desc   loadModelFromFd Context nnrt performanceMode PERFORMANCE_NONE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextNnrtPerformanceModeNoneStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFdContextNnrtPerformanceModeNoneStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          priority: mindSporeLite.Priority.PRIORITY_NONE,
          performanceMode: mindSporeLite.PerformanceMode.PERFORMANCE_NONE,
          deviceID: device.deviceID(),
        };
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFdContextNnrtPerformanceModeNoneStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdContextNnrtPriorityLowStatic001
     * @tc.number CoverageSupplement3Test_060
     * @tc.desc   loadModelFromFd Context nnrt priority LOW test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextNnrtPriorityLowStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFdContextNnrtPriorityLowStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          priority: mindSporeLite.Priority.PRIORITY_LOW,
          deviceID: device.deviceID(),
        };
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFdContextNnrtPriorityLowStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdContextNnrtPriorityMediumStatic001
     * @tc.number CoverageSupplement3Test_061
     * @tc.desc   loadModelFromFd Context nnrt priority MEDIUM test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextNnrtPriorityMediumStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFdContextNnrtPriorityMediumStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          priority: mindSporeLite.Priority.PRIORITY_MEDIUM,
          deviceID: device.deviceID(),
        };
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFdContextNnrtPriorityMediumStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdContextNnrtPriorityHighStatic001
     * @tc.number CoverageSupplement3Test_062
     * @tc.desc   loadModelFromFd Context nnrt priority HIGH test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextNnrtPriorityHighStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFdContextNnrtPriorityHighStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          priority: mindSporeLite.Priority.PRIORITY_HIGH,
          deviceID: device.deviceID(),
        };
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFdContextNnrtPriorityHighStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdContextNnrtExtensionsEmptyArrayStatic001
     * @tc.number CoverageSupplement3Test_063
     * @tc.desc   loadModelFromFd Context nnrt extensions empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextNnrtExtensionsEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFdContextNnrtExtensionsEmptyArrayStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          deviceID: device.deviceID(),
          extensions: [],
        };
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFdContextNnrtExtensionsEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdContextNnrtExtensionsNonEmptyArrayStatic001
     * @tc.number CoverageSupplement3Test_064
     * @tc.desc   loadModelFromFd Context nnrt extensions non-empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextNnrtExtensionsNonEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFdContextNnrtExtensionsNonEmptyArrayStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        let Extension_Buffer = new ArrayBuffer(16777216);
        let extension: mindSporeLite.Extension = {
          name: "test_extension",
          value: Extension_Buffer,
        };
        context.nnrt = {
          deviceID: device.deviceID(),
          extensions: [extension],
        };
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFdContextNnrtExtensionsNonEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadTrainModelFromFileContextCpuThreadAffinityModeAffinityModeStatic001
     * @tc.number CoverageSupplement3Test_085
     * @tc.desc   loadTrainModelFromFile Context cpu threadAffinityMode AFFINITY_MODE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileContextCpuThreadAffinityModeAffinityModeStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadTrainModelFromFileContextCpuThreadAffinityModeAffinityModeStatic001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityMode: mindSporeLite.ThreadAffinityMode.NO_AFFINITIES,
        };
        let model_file = abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadTrainModelFromFileContextCpuThreadAffinityModeAffinityModeStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadTrainModelFromFileContextCpuThreadAffinityModeBigLittleStatic001
     * @tc.number CoverageSupplement3Test_086
     * @tc.desc   loadTrainModelFromFile Context cpu threadAffinityMode BIG_LITTLE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileContextCpuThreadAffinityModeBigLittleStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadTrainModelFromFileContextCpuThreadAffinityModeBigLittleStatic001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST,
        };
        let model_file = abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadTrainModelFromFileContextCpuThreadAffinityModeBigLittleStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadTrainModelFromFileContextCpuThreadAffinityModeHybridStatic001
     * @tc.number CoverageSupplement3Test_087
     * @tc.desc   loadTrainModelFromFile Context cpu threadAffinityMode HYBRID test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileContextCpuThreadAffinityModeHybridStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadTrainModelFromFileContextCpuThreadAffinityModeHybridStatic001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityMode: mindSporeLite.ThreadAffinityMode.LITTLE_CORES_FIRST,
        };
        let model_file = abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadTrainModelFromFileContextCpuThreadAffinityModeHybridStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadTrainModelFromFileContextCpuThreadAffinityCoreListEmptyArrayStatic001
     * @tc.number CoverageSupplement3Test_088
     * @tc.desc   loadTrainModelFromFile Context cpu threadAffinityCoreList empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileContextCpuThreadAffinityCoreListEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadTrainModelFromFileContextCpuThreadAffinityCoreListEmptyArrayStatic001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityCoreList: [],
        };

        let model_file = abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadTrainModelFromFileContextCpuThreadAffinityCoreListEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadTrainModelFromFileContextCpuThreadAffinityCoreListNonEmptyArrayStatic001
     * @tc.number CoverageSupplement3Test_089
     * @tc.desc   loadTrainModelFromFile Context cpu threadAffinityCoreList non-empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileContextCpuThreadAffinityCoreListNonEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadTrainModelFromFileContextCpuThreadAffinityCoreListNonEmptyArrayStatic001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityCoreList: [0, 1],
        };

        let model_file = abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadTrainModelFromFileContextCpuThreadAffinityCoreListNonEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadTrainModelFromBufferTrainCfgOptimizationLevelO0Static001
     * @tc.number CoverageSupplement3Test_093
     * @tc.desc   loadTrainModelFromBuffer TrainCfg optimizationLevel O0 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromBufferTrainCfgOptimizationLevelO0Static001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadTrainModelFromBufferTrainCfgOptimizationLevelO0Static001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.optimizationLevel = mindSporeLite.OptimizationLevel.O0;
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityCoreList: [0, 1],
          threadAffinityMode: mindSporeLite.ThreadAffinityMode.NO_AFFINITIES,
        };
        let modelName = 'lenet_train.ms';
        let model_buffer = await abilityContext.resourceManager.getRawFileContent(modelName);
        let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(model_buffer.buffer, trainCfg, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadTrainModelFromBufferTrainCfgOptimizationLevelO0Static001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadTrainModelFromBufferTrainCfgOptimizationLevelO2Static001
     * @tc.number CoverageSupplement3Test_094
     * @tc.desc   loadTrainModelFromBuffer TrainCfg optimizationLevel OPTIMIZE_MEMORY test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromBufferTrainCfgOptimizationLevelO2Static001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadTrainModelFromBufferTrainCfgOptimizationLevelO2Static001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.optimizationLevel = mindSporeLite.OptimizationLevel.O2;
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST,
        };
        let modelName = 'lenet_train.ms';
        let model_buffer = await abilityContext.resourceManager.getRawFileContent(modelName);
        let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(model_buffer.buffer, trainCfg, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadTrainModelFromBufferTrainCfgOptimizationLevelO2Static001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadTrainModelFromFdTrainCfgOptimizationLevelO2Static001
     * @tc.number CoverageSupplement3Test_103
     * @tc.desc   loadTrainModelFromFd TrainCfg optimizationLevel O2 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdTrainCfgOptimizationLevelO2Static001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadTrainModelFromFdTrainCfgOptimizationLevelO2Static001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.optimizationLevel = mindSporeLite.OptimizationLevel.O2;
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let model_file = abilityContext.filesDir + "/" + "lenet_train.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, trainCfg, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadTrainModelFromFdTrainCfgOptimizationLevelO2Static001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadTrainModelFromFdTrainCfgOptimizationLevelO0Static001
     * @tc.number CoverageSupplement3Test_104
     * @tc.desc   loadTrainModelFromFd TrainCfg optimizationLevel O0 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdTrainCfgOptimizationLevelO0Static001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadTrainModelFromFdTrainCfgOptimizationLevelO0Static001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.optimizationLevel = mindSporeLite.OptimizationLevel.O0;
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let model_file = abilityContext.filesDir + "/" + "lenet_train.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, trainCfg, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadTrainModelFromFdTrainCfgOptimizationLevelO0Static001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileContextNnrtPerformanceModeNoneStatic001
     * @tc.number CoverageSupplement3Test_105
     * @tc.desc   loadModelFromFile Context nnrt performanceMode PERFORMANCE_NONE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileContextNnrtPerformanceModeNoneStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFileContextNnrtPerformanceModeNoneStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          performanceMode: mindSporeLite.PerformanceMode.PERFORMANCE_NONE,
          deviceID: device.deviceID(),
        };
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFileContextNnrtPerformanceModeNoneStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileContextNnrtPerformanceModeMediumStatic001
     * @tc.number CoverageSupplement3Test_106
     * @tc.desc   loadModelFromFile Context nnrt performanceMode PERFORMANCE_MEDIUM test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileContextNnrtPerformanceModeMediumStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFileContextNnrtPerformanceModeMediumStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          performanceMode: mindSporeLite.PerformanceMode.PERFORMANCE_MEDIUM,
          deviceID: device.deviceID(),
        };
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFileContextNnrtPerformanceModeMediumStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileContextNnrtPerformanceModeHighStatic001
     * @tc.number CoverageSupplement3Test_107
     * @tc.desc   loadModelFromFile Context nnrt performanceMode PERFORMANCE_HIGH test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileContextNnrtPerformanceModeHighStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFileContextNnrtPerformanceModeHighStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          performanceMode: mindSporeLite.PerformanceMode.PERFORMANCE_HIGH,
          deviceID: device.deviceID(),
        };
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFileContextNnrtPerformanceModeHighStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileCallbackContextNnrtPerformanceModeMediumStatic001
     * @tc.number CoverageSupplement3Test_108
     * @tc.desc   loadModelFromFile Callback Context nnrt performanceMode PERFORMANCE_MEDIUM test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileCallbackContextNnrtPerformanceModeMediumStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFileCallbackContextNnrtPerformanceModeMediumStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          performanceMode: mindSporeLite.PerformanceMode.PERFORMANCE_MEDIUM,
          deviceID: device.deviceID(),
        };
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFileCallbackContextNnrtPerformanceModeMediumStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileCallbackContextNnrtPerformanceModeHighStatic001
     * @tc.number CoverageSupplement3Test_109
     * @tc.desc   loadModelFromFile Callback Context nnrt performanceMode PERFORMANCE_HIGH test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileCallbackContextNnrtPerformanceModeHighStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFileCallbackContextNnrtPerformanceModeHighStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          performanceMode: mindSporeLite.PerformanceMode.PERFORMANCE_HIGH,
          deviceID: device.deviceID(),
        };
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFileCallbackContextNnrtPerformanceModeHighStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileCallbackContextNnrtPerformanceModeExtremeStatic001
     * @tc.number CoverageSupplement3Test_110
     * @tc.desc   loadModelFromFile Callback Context nnrt performanceMode PERFORMANCE_HIGH test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileCallbackContextNnrtPerformanceModeExtremeStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFileCallbackContextNnrtPerformanceModeExtremeStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          performanceMode: mindSporeLite.PerformanceMode.PERFORMANCE_EXTREME,
          deviceID: device.deviceID(),
        };
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFileCallbackContextNnrtPerformanceModeExtremeStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextNnrtPerformanceModeMediumStatic001
     * @tc.number CoverageSupplement3Test_111
     * @tc.desc   loadModelFromBuffer Context nnrt performanceMode PERFORMANCE_MEDIUM test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextNnrtPerformanceModeMediumStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromBufferContextNnrtPerformanceModeMediumStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }

        let modelName = 'ml_face_isface.ms';
        let model_buffer = await abilityContext.resourceManager.getRawFileContent(modelName);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          performanceMode: mindSporeLite.PerformanceMode.PERFORMANCE_MEDIUM,
          deviceID: device.deviceID(),
        };
        let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromBufferContextNnrtPerformanceModeMediumStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextNnrtPerformanceModeHighStatic001
     * @tc.number CoverageSupplement3Test_112
     * @tc.desc   loadModelFromBuffer Context nnrt performanceMode PERFORMANCE_HIGH test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextNnrtPerformanceModeHighStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromBufferContextNnrtPerformanceModeHighStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }

        let modelName = 'ml_face_isface.ms';
        let model_buffer = await abilityContext.resourceManager.getRawFileContent(modelName);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          performanceMode: mindSporeLite.PerformanceMode.PERFORMANCE_HIGH,
          deviceID: device.deviceID(),
        };
        let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromBufferContextNnrtPerformanceModeHighStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextNnrtPerformanceModeExtremeStatic001
     * @tc.number CoverageSupplement3Test_113
     * @tc.desc   loadModelFromBuffer Context nnrt performanceMode PERFORMANCE_EXTREME test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextNnrtPerformanceModeExtremeStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromBufferContextNnrtPerformanceModeExtremeStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }

        let modelName = 'ml_face_isface.ms';
        let model_buffer = await abilityContext.resourceManager.getRawFileContent(modelName);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          performanceMode: mindSporeLite.PerformanceMode.PERFORMANCE_EXTREME,
          deviceID: device.deviceID(),
        };
        let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromBufferContextNnrtPerformanceModeExtremeStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdContextNnrtPerformanceModeMediumStatic001
     * @tc.number CoverageSupplement3Test_114
     * @tc.desc   loadModelFromFd Context nnrt performanceMode PERFORMANCE_MEDIUM test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextNnrtPerformanceModeMediumStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFdContextNnrtPerformanceModeMediumStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          performanceMode: mindSporeLite.PerformanceMode.PERFORMANCE_MEDIUM,
          deviceID: device.deviceID(),
        };
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFdContextNnrtPerformanceModeMediumStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdContextNnrtPerformanceModeHighStatic001
     * @tc.number CoverageSupplement3Test_115
     * @tc.desc   loadModelFromFd Context nnrt performanceMode PERFORMANCE_NONE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextNnrtPerformanceModeHighStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFdContextNnrtPerformanceModeHighStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          performanceMode: mindSporeLite.PerformanceMode.PERFORMANCE_HIGH,
          deviceID: device.deviceID(),
        };
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFdContextNnrtPerformanceModeHighStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdContextNnrtPerformanceModeExtremeStatic001
     * @tc.number CoverageSupplement3Test_116
     * @tc.desc   loadModelFromFd Context nnrt performanceMode PERFORMANCE_EXTREME test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextNnrtPerformanceModeExtremeStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFdContextNnrtPerformanceModeExtremeStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          performanceMode: mindSporeLite.PerformanceMode.PERFORMANCE_EXTREME,
          deviceID: device.deviceID(),
        };
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFdContextNnrtPerformanceModeExtremeStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadTrainModelFromBufferTrainCfgOptimizationLevelO3Static001
     * @tc.number CoverageSupplement3Test_117
     * @tc.desc   loadTrainModelFromBuffer TrainCfg optimizationLevel O0 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromBufferTrainCfgOptimizationLevelO3Static001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadTrainModelFromBufferTrainCfgOptimizationLevelO3Static001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.optimizationLevel = mindSporeLite.OptimizationLevel.O3;
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityMode: mindSporeLite.ThreadAffinityMode.LITTLE_CORES_FIRST,
        };
        let modelName = 'lenet_train.ms';
        let model_buffer = await abilityContext.resourceManager.getRawFileContent(modelName);
        let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(model_buffer.buffer, trainCfg, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadTrainModelFromBufferTrainCfgOptimizationLevelO3Static001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadTrainModelFromBufferTrainCfgOptimizationLevelAutoStatic001
     * @tc.number CoverageSupplement3Test_118
     * @tc.desc   loadTrainModelFromBuffer TrainCfg optimizationLevel OPTIMIZE_MEMORY test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromBufferTrainCfgOptimizationLevelAutoStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadTrainModelFromBufferTrainCfgOptimizationLevelAutoStatic001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.optimizationLevel = mindSporeLite.OptimizationLevel.AUTO;
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let modelName = 'lenet_train.ms';
        let model_buffer = await abilityContext.resourceManager.getRawFileContent(modelName);
        let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(model_buffer.buffer, trainCfg, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadTrainModelFromBufferTrainCfgOptimizationLevelAutoStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadTrainModelFromFdTrainCfgOptimizationLevelO3Static001
     * @tc.number CoverageSupplement3Test_119
     * @tc.desc   loadTrainModelFromFd TrainCfg optimizationLevel O3 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdTrainCfgOptimizationLevelO3Static001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadTrainModelFromFdTrainCfgOptimizationLevelO3Static001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.optimizationLevel = mindSporeLite.OptimizationLevel.O3;
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let model_file = abilityContext.filesDir + "/" + "lenet_train.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, trainCfg, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadTrainModelFromFdTrainCfgOptimizationLevelO3Static001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadTrainModelFromFdTrainCfgOptimizationLevelAutoStatic001
     * @tc.number CoverageSupplement3Test_120
     * @tc.desc   loadTrainModelFromFd TrainCfg optimizationLevel AUTO test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdTrainCfgOptimizationLevelAutoStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadTrainModelFromFdTrainCfgOptimizationLevelAutoStatic001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.optimizationLevel = mindSporeLite.OptimizationLevel.AUTO;
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let model_file = abilityContext.filesDir + "/" + "lenet_train.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, trainCfg, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadTrainModelFromFdTrainCfgOptimizationLevelAutoStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextCpuThreadAffinityModeBigCoresFirstStatic001
     * @tc.number CoverageSupplement4Test_002
     * @tc.desc   loadModelFromBuffer Context cpu threadAffinityMode BIG_CORES_FIRST test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextCpuThreadAffinityModeBigCoresFirstStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement4Test: loadModelFromBufferContextCpuThreadAffinityModeBigCoresFirstStatic001");
      try {

        let modelBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent('ml_face_isface.ms');
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST,
        };
        mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromBufferContextCpuThreadAffinityModeBigCoresFirstStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextCpuThreadAffinityModeLittleCoresFirstStatic001
     * @tc.number CoverageSupplement4Test_003
     * @tc.desc   loadModelFromBuffer Context cpu threadAffinityMode LITTLE_CORES_FIRST test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextCpuThreadAffinityModeLittleCoresFirstStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement4Test: loadModelFromBufferContextCpuThreadAffinityModeLittleCoresFirstStatic001");
      try {

        let modelBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent('ml_face_isface.ms');
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityMode: mindSporeLite.ThreadAffinityMode.LITTLE_CORES_FIRST,
        };
        mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromBufferContextCpuThreadAffinityModeLittleCoresFirstStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextCpuThreadAffinityNoAffinitiesStatic001
     * @tc.number CoverageSupplement4Test_004
     * @tc.desc   loadModelFromBuffer Context cpu threadAffinityMode NO_AFFINITIES test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextCpuThreadAffinityNoAffinitiesStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement4Test: loadModelFromBufferContextCpuThreadAffinityNoAffinitiesStatic001");
      try {

        let modelBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent('ml_face_isface.ms');
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityMode: mindSporeLite.ThreadAffinityMode.NO_AFFINITIES,
        };
        mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromBufferContextCpuThreadAffinityNoAffinitiesStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromBufferCallbackContextCpuThreadAffinityCoreListEmptyArrayStatic001
     * @tc.number CoverageSupplement4Test_005
     * @tc.desc   loadModelFromBuffer Context cpu threadAffinityCoreList empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferCallbackContextCpuThreadAffinityCoreListEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement4Test: loadModelFromBufferCallbackContextCpuThreadAffinityCoreListEmptyArrayStatic001");
      try {

        let modelBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent('ml_face_isface.ms');
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityCoreList: [],
        };
        mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromBufferCallbackContextCpuThreadAffinityCoreListEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromBufferCallbackContextNnrtExtensionsEmptyArrayStatic001
     * @tc.number CoverageSupplement4Test_006
     * @tc.desc   loadModelFromBuffer Context nnrt extensions empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferCallbackContextNnrtExtensionsEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement4Test: loadModelFromBufferCallbackContextNnrtExtensionsEmptyArrayStatic001");
      try {

        let modelBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent('ml_face_isface.ms');
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          deviceID: device.deviceID(),
          extensions: [],
        };
        mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromBufferCallbackContextNnrtExtensionsEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdContextCpuThreadAffinityModeBigCoresFirstStatic001
     * @tc.number CoverageSupplement4Test_010
     * @tc.desc   loadModelFromFd Context cpu threadAffinityMode BIG_CORES_FIRST test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextCpuThreadAffinityModeBigCoresFirstStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement4Test: loadModelFromFdContextCpuThreadAffinityModeBigCoresFirstStatic001");
      try {
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST,
        };
        mindSporeLite.loadModelFromFd(file.fd, context, (msliteModel: mindSporeLite.Model) => {
          fs.closeSync(file);
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFdContextCpuThreadAffinityModeBigCoresFirstStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdContextCpuThreadAffinityModeLittleCoresFirstStatic001
     * @tc.number CoverageSupplement4Test_011
     * @tc.desc   loadModelFromFd Context cpu threadAffinityMode LITTLE_CORES_FIRST test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextCpuThreadAffinityModeLittleCoresFirstStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement4Test: loadModelFromFdContextCpuThreadAffinityModeLittleCoresFirstStatic001");
      try {
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityMode: mindSporeLite.ThreadAffinityMode.LITTLE_CORES_FIRST,
        };
        mindSporeLite.loadModelFromFd(file.fd, context, (msliteModel: mindSporeLite.Model) => {
          fs.closeSync(file);
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFdContextCpuThreadAffinityModeLittleCoresFirstStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdContextCpuThreadAffinityNoAffinitiesStatic001
     * @tc.number CoverageSupplement4Test_012
     * @tc.desc   loadModelFromFd Context cpu threadAffinityMode NO_AFFINITIES test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextCpuThreadAffinityNoAffinitiesStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement4Test: loadModelFromFdContextCpuThreadAffinityNoAffinitiesStatic001");
      try {
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityMode: mindSporeLite.ThreadAffinityMode.NO_AFFINITIES,
        };
        mindSporeLite.loadModelFromFd(file.fd, context, (msliteModel: mindSporeLite.Model) => {
          fs.closeSync(file);
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFdContextCpuThreadAffinityNoAffinitiesStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdCallbackContextCpuThreadAffinityCoreListEmptyArrayStatic001
     * @tc.number CoverageSupplement4Test_013
     * @tc.desc   loadModelFromFd Context cpu threadAffinityCoreList empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdCallbackContextCpuThreadAffinityCoreListEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement4Test: loadModelFromFdCallbackContextCpuThreadAffinityCoreListEmptyArrayStatic001");
      try {
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityCoreList: [],
        };
        mindSporeLite.loadModelFromFd(file.fd, context, (msliteModel: mindSporeLite.Model) => {
          fs.closeSync(file);
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFdCallbackContextCpuThreadAffinityCoreListEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdCallbackContextNnrtPerformanceModeHighStatic001
     * @tc.number CoverageSupplement4Test_0141
     * @tc.desc   loadModelFromFd Context nnrt performanceMode PERFORMANCE_HIGH test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdCallbackContextNnrtPerformanceModeHighStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement4Test: loadModelFromFdCallbackContextNnrtPerformanceModeHighStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          priority: mindSporeLite.Priority.PRIORITY_LOW,
          performanceMode: mindSporeLite.PerformanceMode.PERFORMANCE_HIGH,
          deviceID: device.deviceID(),
        };
        mindSporeLite.loadModelFromFd(file.fd, context, (msliteModel: mindSporeLite.Model) => {
          fs.closeSync(file);
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFdCallbackContextNnrtPerformanceModeHighStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdCallbackContextNnrtPerformanceModeLowStatic001
     * @tc.number CoverageSupplement4Test_014
     * @tc.desc   loadModelFromFd Context nnrt performanceMode PERFORMANCE_LOW test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdCallbackContextNnrtPerformanceModeLowStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement4Test: loadModelFromFdCallbackContextNnrtPerformanceModeLowStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          priority: mindSporeLite.Priority.PRIORITY_MEDIUM,
          performanceMode: mindSporeLite.PerformanceMode.PERFORMANCE_LOW,
          deviceID: device.deviceID(),
        };
        mindSporeLite.loadModelFromFd(file.fd, context, (msliteModel: mindSporeLite.Model) => {
          fs.closeSync(file);
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFdCallbackContextNnrtPerformanceModeLowStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdCallbackContextNnrtPriorityHighStatic001
     * @tc.number CoverageSupplement4Test_0151
     * @tc.desc   loadModelFromFd Context nnrt priority PRIORITY_HIGH test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdCallbackContextNnrtPriorityHighStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement4Test: loadModelFromFdCallbackContextNnrtPriorityHighStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          performanceMode: mindSporeLite.PerformanceMode.PERFORMANCE_NONE,
          priority: mindSporeLite.Priority.PRIORITY_HIGH,
          deviceID: device.deviceID(),
        };
        context.nnrt = {
          performanceMode: mindSporeLite.PerformanceMode.PERFORMANCE_MEDIUM,
          priority: mindSporeLite.Priority.PRIORITY_HIGH,
          deviceID: device.deviceID(),
        }
        mindSporeLite.loadModelFromFd(file.fd, context, (msliteModel: mindSporeLite.Model) => {
          fs.closeSync(file);
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFdCallbackContextNnrtPriorityHighStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdContextNnrtPriorityNoneStatic001
     * @tc.number CoverageSupplement4Test_015
     * @tc.desc   loadModelFromFd Context nnrt priority PRIORITY_NONE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextNnrtPriorityNoneStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement4Test: loadModelFromFdContextNnrtPriorityNoneStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          performanceMode: mindSporeLite.PerformanceMode.PERFORMANCE_EXTREME,
          priority: mindSporeLite.Priority.PRIORITY_NONE,
          deviceID: device.deviceID(),
        };
        mindSporeLite.loadModelFromFd(file.fd, context, (msliteModel: mindSporeLite.Model) => {
          fs.closeSync(file);
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFdContextNnrtPriorityNoneStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdCallbackContextNnrtExtensionsEmptyArrayStatic001
     * @tc.number CoverageSupplement4Test_016
     * @tc.desc   loadModelFromFd Context nnrt extensions empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdCallbackContextNnrtExtensionsEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement4Test: loadModelFromFdCallbackContextNnrtExtensionsEmptyArrayStatic001");
      try {
        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {
          deviceID: device.deviceID(),
          extensions: [],
        };
        mindSporeLite.loadModelFromFd(file.fd, context, (msliteModel: mindSporeLite.Model) => {
          fs.closeSync(file);
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFdCallbackContextNnrtExtensionsEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdCallbackContextNnrtExtensionsNonEmptyArrayStatic001
     * @tc.number CoverageSupplement4Test_017
     * @tc.desc   loadModelFromFd Context nnrt extensions non-empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdCallbackContextNnrtExtensionsNonEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement4Test: loadModelFromFdCallbackContextNnrtExtensionsNonEmptyArrayStatic001");
      try {

        let device = getNPUDeviceDesc();
        if (device == null) {
            hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
            hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
            done();
            return;
        }
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        let Extension_Buffer = new ArrayBuffer(16777216);
        let extension: mindSporeLite.Extension = {
          name: "test_extension",
          value: Extension_Buffer,
        };
        context.target = ["nnrt"];
        context.nnrt = {
          deviceID: device.deviceID(),
          extensions: [extension],
        };
        mindSporeLite.loadModelFromFd(file.fd, context, (msliteModel: mindSporeLite.Model) => {
          fs.closeSync(file);
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFdCallbackContextNnrtExtensionsNonEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    // 4. loadTrainModelFromBuffer API 测试 - Promise 版本 - Context 属性覆盖
    /**
     * @tc.name   loadTrainModelFromBufferContextCpuThreadAffinityCoreListEmptyArrayStatic001
     * @tc.number CoverageSupplement4Test_022
     * @tc.desc   loadTrainModelFromBuffer Context cpu threadAffinityCoreList empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromBufferContextCpuThreadAffinityCoreListEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement4Test: loadTrainModelFromBufferContextCpuThreadAffinityCoreListEmptyArrayStatic001");
      try {

        let modelBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent('ml_face_isface.ms');
        let cfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityCoreList: [],
        };
        let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer, cfg, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadTrainModelFromBufferContextCpuThreadAffinityCoreListEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    // 5. loadTrainModelFromFd API 测试 - Promise 版本 - Context 属性覆盖
    /**
     * @tc.name   loadTrainModelFromFdContextTargetEmptyArrayStatic001
     * @tc.number CoverageSupplement4Test_023
     * @tc.desc   loadTrainModelFromFd Context target empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdContextTargetEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement4Test: loadTrainModelFromFdContextTargetEmptyArrayStatic001");
      try {
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let cfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = [];
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, cfg, context);
        fs.closeSync(file);
        hilog.info(domain, tag, 'msliteModel type: ' + typeof msliteModel);
        hilog.info(domain, tag, 'msliteModel keys length: ' + Object.keys(msliteModel).length);
        hilog.info(domain, tag, 'msliteModel stringify: ' + JSON.stringify(msliteModel));
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        expect(typeof msliteModel).assertEqual("object");
        expect(Object.keys(msliteModel).length).assertEqual(0);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadTrainModelFromFdContextTargetEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(error.code).assertEqual(1000001);
        done();
      }
    });

    /**
     * @tc.name   loadTrainModelFromFdContextCpuThreadAffinityModeBigCoresFirstStatic001
     * @tc.number CoverageSupplement4Test_024
     * @tc.desc   loadTrainModelFromFd Context cpu threadAffinityMode BIG_CORES_FIRST test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdContextCpuThreadAffinityModeBigCoresFirstStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement4Test: loadTrainModelFromFdContextCpuThreadAffinityModeBigCoresFirstStatic001");
      try {
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let cfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST,
        };
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, cfg, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadTrainModelFromFdContextCpuThreadAffinityModeBigCoresFirstStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadTrainModelFromFdContextCpuThreadAffinityModeLittleCoresFirstStatic001
     * @tc.number CoverageSupplement4Test_025
     * @tc.desc   loadTrainModelFromFd Context cpu threadAffinityMode LITTLE_CORES_FIRST test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdContextCpuThreadAffinityModeLittleCoresFirstStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement4Test: loadTrainModelFromFdContextCpuThreadAffinityModeLittleCoresFirstStatic001");
      try {
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let cfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityMode: mindSporeLite.ThreadAffinityMode.LITTLE_CORES_FIRST,
        };
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, cfg, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadTrainModelFromFdContextCpuThreadAffinityModeLittleCoresFirstStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadTrainModelFromFdContextCpuThreadAffinityNoAffinitiesStatic001
     * @tc.number CoverageSupplement4Test_026
     * @tc.desc   loadTrainModelFromFd Context cpu threadAffinityMode NO_AFFINITIES test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdContextCpuThreadAffinityNoAffinitiesStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement4Test: loadTrainModelFromFdContextCpuThreadAffinityNoAffinitiesStatic001");
      try {
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let cfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityMode: mindSporeLite.ThreadAffinityMode.NO_AFFINITIES,
        };
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, cfg, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadTrainModelFromFdContextCpuThreadAffinityNoAffinitiesStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadTrainModelFromFdContextCpuThreadAffinityCoreListEmptyArrayStatic001
     * @tc.number CoverageSupplement4Test_027
     * @tc.desc   loadTrainModelFromFd Context cpu threadAffinityCoreList empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdContextCpuThreadAffinityCoreListEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement4Test: loadTrainModelFromFdContextCpuThreadAffinityCoreListEmptyArrayStatic001");
      try {
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let cfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityCoreList: [],
        };
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, cfg, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadTrainModelFromFdContextCpuThreadAffinityCoreListEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadTrainModelFromFdContextCpuThreadAffinityCoreListNonEmptyArrayStatic001
     * @tc.number CoverageSupplement4Test_028
     * @tc.desc   loadTrainModelFromFd Context cpu threadAffinityCoreList non-empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdContextCpuThreadAffinityCoreListNonEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement4Test: loadTrainModelFromFdContextCpuThreadAffinityCoreListNonEmptyArrayStatic001");
      try {
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let cfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          threadAffinityCoreList: [0],
        };
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, cfg, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadTrainModelFromFdContextCpuThreadAffinityCoreListNonEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });
    
    // 5. loadTrainModelFromFile API 测试
    /**
     * @tc.name   loadTrainModelFromFileTrainCfgLossNameEmptyArrayStatic001
     * @tc.number CoverageSupplement3Test_083
     * @tc.desc   loadTrainModelFromFile TrainCfg lossName empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileTrainCfgLossNameEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadTrainModelFromFileTrainCfgLossNameEmptyArrayStatic001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.lossName = [];
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let model_file = abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadTrainModelFromFileTrainCfgLossNameEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadTrainModelFromFileContextTargetEmptyArrayStatic001
     * @tc.number CoverageSupplement3Test_084
     * @tc.desc   loadTrainModelFromFile Context target empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileContextTargetEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadTrainModelFromFileContextTargetEmptyArrayStatic001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = [];
        let model_file = abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        hilog.info(domain, tag, 'msliteModel type: ' + typeof msliteModel);
        hilog.info(domain, tag, 'msliteModel keys length: ' + Object.keys(msliteModel).length);
        hilog.info(domain, tag, 'msliteModel stringify: ' + JSON.stringify(msliteModel));
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        expect(typeof msliteModel).assertEqual("object");
        expect(Object.keys(msliteModel).length).assertEqual(0);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadTrainModelFromFileContextTargetEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(error.code).assertEqual(1000001);
        done();
      }
    });

    /**
     * @tc.name   loadTrainModelFromFileModelEmptyStringStatic001
     * @tc.number CoverageSupplement3Test_090
     * @tc.desc   loadTrainModelFromFile model empty string test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileModelEmptyStringStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadTrainModelFromFileModelEmptyStringStatic001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let msliteModel = await mindSporeLite.loadTrainModelFromFile("", trainCfg, context);
        hilog.info(domain, tag, 'msliteModel type: ' + typeof msliteModel);
        hilog.info(domain, tag, 'msliteModel keys length: ' + Object.keys(msliteModel).length);
        hilog.info(domain, tag, 'msliteModel stringify: ' + JSON.stringify(msliteModel));
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        expect(typeof msliteModel).assertEqual("object");
        expect(Object.keys(msliteModel).length).assertEqual(0);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadTrainModelFromFileModelEmptyStringStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(error.code).assertEqual(1000008);
        done();
      }
    });

    // 6. loadTrainModelFromBuffer API 测试
    /**
     * @tc.name   loadTrainModelFromBufferTrainCfgLossNameEmptyArrayStatic001
     * @tc.number CoverageSupplement3Test_091
     * @tc.desc   loadTrainModelFromBuffer TrainCfg lossName empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromBufferTrainCfgLossNameEmptyArrayStatic001', Level.LEVEL1, async (done:()=>void) => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadTrainModelFromBufferTrainCfgLossNameEmptyArrayStatic001");
      try {
        let modelBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent('ml_face_isface.ms');
        let cfg: mindSporeLite.TrainCfg = {};
        cfg.lossName = [""];
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer, cfg, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadTrainModelFromBufferTrainCfgLossNameEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
      done();
    });

    /**
     * @tc.name   loadTrainModelFromBufferTrainCfgLossNameNonEmptyArrayStatic001
     * @tc.number CoverageSupplement3Test_092
     * @tc.desc   loadTrainModelFromBuffer TrainCfg lossName non-empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromBufferTrainCfgLossNameNonEmptyArrayStatic001', Level.LEVEL1, async (done:()=>void) => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadTrainModelFromBufferTrainCfgLossNameNonEmptyArrayStatic001");
      try {
        let modelBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent('ml_face_isface.ms');
        let cfg: mindSporeLite.TrainCfg = {};
        cfg.lossName = ["CrossEntropy"];
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer, cfg, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadTrainModelFromBufferTrainCfgLossNameNonEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadTrainModelFromBufferContextTargetEmptyArrayStatic001
     * @tc.number CoverageSupplement3Test_095
     * @tc.desc   loadTrainModelFromBuffer Context target empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromBufferContextTargetEmptyArrayStatic001', Level.LEVEL1, async (done:()=>void) => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadTrainModelFromBufferContextTargetEmptyArrayStatic001");
      try {
        let modelBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent('ml_face_isface.ms');
        let cfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = [];
        let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer, cfg, context);
        hilog.info(domain, tag, 'msliteModel type: ' + typeof msliteModel);
        hilog.info(domain, tag, 'msliteModel keys length: ' + Object.keys(msliteModel).length);
        hilog.info(domain, tag, 'msliteModel stringify: ' + JSON.stringify(msliteModel));
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        expect(typeof msliteModel).assertEqual("object");
        expect(Object.keys(msliteModel).length).assertEqual(0);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadTrainModelFromBufferContextTargetEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(error.code).assertEqual(1000001);
        done();
      }
    });

    // 7. loadTrainModelFromFd API 测试
    /**
     * @tc.name   loadTrainModelFromFdTrainCfgLossNameEmptyArrayStatic001
     * @tc.number CoverageSupplement3Test_101
     * @tc.desc   loadTrainModelFromFd TrainCfg lossName empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdTrainCfgLossNameEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadTrainModelFromFdTrainCfgLossNameEmptyArrayStatic001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.lossName = [];
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let model_file = abilityContext.filesDir + "/" + "lenet_train.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, trainCfg, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadTrainModelFromFdTrainCfgLossNameEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadTrainModelFromFdTrainCfgLossNameNonEmptyArrayStatic001
     * @tc.number CoverageSupplement3Test_102
     * @tc.desc   loadTrainModelFromFd TrainCfg lossName non-empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdTrainCfgLossNameNonEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadTrainModelFromFdTrainCfgLossNameNonEmptyArrayStatic001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.lossName = ["CrossEntropy"];
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let model_file = abilityContext.filesDir + "/" + "lenet_train.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, trainCfg, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadTrainModelFromFdTrainCfgLossNameNonEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileContextTargetEmptyArrayStatic001
     * @tc.number CoverageSupplement3Test_013
     * @tc.desc   loadModelFromFile Context target empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileContextTargetEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFileContextTargetEmptyArrayStatic001");
      try {
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = [];
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
        hilog.info(domain, tag, 'msliteModel type: ' + typeof msliteModel);
        hilog.info(domain, tag, 'msliteModel keys length: ' + Object.keys(msliteModel).length);
        hilog.info(domain, tag, 'msliteModel stringify: ' + JSON.stringify(msliteModel));
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        expect(typeof msliteModel).assertEqual("object");
        expect(Object.keys(msliteModel).length).assertEqual(0);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFileContextTargetEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(error.code).assertEqual(1000001);
        done();
      }
    });


    // 3. loadModelFromBuffer API 测试 - Promise 版本
    /**
     * @tc.name   loadModelFromBufferContextTargetEmptyArrayStatic001
     * @tc.number CoverageSupplement3Test_031
     * @tc.desc   loadModelFromBuffer Context target empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextTargetEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromBufferContextTargetEmptyArrayStatic001");
      try {
        let model_buffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent('ml_face_isface.ms');
        let context: mindSporeLite.Context = {};
        context.target = [];
        let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context);
        hilog.info(domain, tag, 'msliteModel type: ' + typeof msliteModel);
        hilog.info(domain, tag, 'msliteModel keys length: ' + Object.keys(msliteModel).length);
        hilog.info(domain, tag, 'msliteModel stringify: ' + JSON.stringify(msliteModel));
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        expect(typeof msliteModel).assertEqual("object");
        expect(Object.keys(msliteModel).length).assertEqual(0);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromBufferContextTargetEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(error.code).assertEqual(1000001);
        done();
      }
    });

    // 4. loadModelFromFd API 测试 - Promise 版本
    /**
     * @tc.name   loadModelFromFdContextTargetEmptyArrayStatic001
     * @tc.number CoverageSupplement3Test_052
     * @tc.desc   loadModelFromFd Context target empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextTargetEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFdContextTargetEmptyArrayStatic001");
      try {
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = [];
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
        fs.closeSync(file);
        hilog.info(domain, tag, 'msliteModel type: ' + typeof msliteModel);
        hilog.info(domain, tag, 'msliteModel keys length: ' + Object.keys(msliteModel).length);
        hilog.info(domain, tag, 'msliteModel stringify: ' + JSON.stringify(msliteModel));
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        expect(typeof msliteModel).assertEqual("object");
        expect(Object.keys(msliteModel).length).assertEqual(0);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFdContextTargetEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(error.code).assertEqual(1000001);
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdContextCpuThreadAffinityModeAffinityModeStatic001
     * @tc.number CoverageSupplement3Test_053
     * @tc.desc   loadModelFromFd Context cpu threadAffinityMode AFFINITY_MODE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextCpuThreadAffinityModeAffinityModeStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "CoverageSupplement3Test: loadModelFromFdContextCpuThreadAffinityModeAffinityModeStatic001");
      try {
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {
          "threadAffinityMode": mindSporeLite.ThreadAffinityMode.NO_AFFINITIES
        };
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
        fs.closeSync(file);
        hilog.info(domain, tag, 'msliteModel type: ' + typeof msliteModel);
        hilog.info(domain, tag, 'msliteModel keys length: ' + Object.keys(msliteModel).length);
        hilog.info(domain, tag, 'msliteModel stringify: ' + JSON.stringify(msliteModel));
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
        expect(typeof msliteModel).assertEqual("object");
        expect(Object.keys(msliteModel).length).assertLarger(0);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "loadModelFromFdContextCpuThreadAffinityModeAffinityModeStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileContextCallbackModelEmptyStringStatic001
     * @tc.number CoverageSupplement2Test_010
     * @tc.desc   loadModelFromFile Context Callback model empty string test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileContextCallbackModelEmptyStringStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "CoverageSupplement2Test: loadModelFromFileContextCallbackModelEmptyStringStatic001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        mindSporeLite.loadModelFromFile("", context, (msliteModel: mindSporeLite.Model) => {
          hilog.info(domain, tag, 'msliteModel type: ' + typeof msliteModel);
          hilog.info(domain, tag, 'msliteModel keys length: ' + Object.keys(msliteModel).length);
          hilog.info(domain, tag, 'msliteModel stringify: ' + JSON.stringify(msliteModel));
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          expect(typeof msliteModel).assertEqual("object");
          expect(Object.keys(msliteModel).length).assertEqual(0);
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, "loadModelFromFileContextCallbackModelEmptyStringStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(error.code).assertEqual(1000000);
        done();
      }
    });


    /**
     * @tc.name   modelPredictCallbackInputsEmptyArrayStatic001
     * @tc.number CoverageSupplement2Test_066
     * @tc.desc   Model predict Callback inputs empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelPredictCallbackInputsEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "CoverageSupplement2Test: modelPredictCallbackInputsEmptyArrayStatic001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let model_file = abilityContext.filesDir + "/" + "ml_ocr_cn.ms";
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          if (msliteModel !== null) {
            try {
              msliteModel.predict([], (modelOutputs: mindSporeLite.MSTensor[]) => {
                hilog.info(domain, tag, 'modelOutputs type: ' + typeof modelOutputs);
                hilog.info(domain, tag, 'modelOutputs keys length: ' + Object.keys(modelOutputs).length);
                hilog.info(domain, tag, 'modelOutputs stringify: ' + JSON.stringify(modelOutputs));
                expect(modelOutputs).not().assertNull();
                expect(modelOutputs).not().assertUndefined();
                expect(typeof modelOutputs).assertEqual("object");
                expect(Object.keys(modelOutputs).length).assertEqual(0);
                done();
              });
            } catch (error) {
              hilog.info(domain, tag, "modelPredictCallbackInputsEmptyArrayStatic001 predict error: " + error);
              hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
              expect(false).assertTrue();
              done();
            }
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        hilog.info(domain, tag, "modelPredictCallbackInputsEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(false).assertTrue();
        done();
      }
    });

    // 2. loadModelFromFile API 测试 - Callback 版本 - Context 属性覆盖
    /**
     * @tc.name   loadModelFromFileCallbackContextTargetEmptyArrayStatic001
     * @tc.number CoverageSupplement3Test_017
     * @tc.desc   loadModelFromFile Callback Context target empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileCallbackContextTargetEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "CoverageSupplement3Test: loadModelFromFileCallbackContextTargetEmptyArrayStatic001");
      try {
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = [];
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          hilog.info(domain, tag, 'msliteModel type: ' + typeof msliteModel);
          hilog.info(domain, tag, 'msliteModel keys length: ' + Object.keys(msliteModel).length);
          hilog.info(domain, tag, 'msliteModel stringify: ' + JSON.stringify(msliteModel));
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          expect(typeof msliteModel).assertEqual("object");
          expect(Object.keys(msliteModel).length).assertEqual(0);
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, "loadModelFromFileCallbackContextTargetEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(error.code).assertEqual(1000001);
        done();
      }
    });


    // 1. loadModelFromBuffer API 测试 - Callback 版本 - Context 属性覆盖
    /**
     * @tc.name   loadModelFromBufferCallbackContextTargetEmptyArrayStatic001
     * @tc.number CoverageSupplement4Test_001
     * @tc.desc   loadModelFromBuffer Context target empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferCallbackContextTargetEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "CoverageSupplement4Test: loadModelFromBufferCallbackContextTargetEmptyArrayStatic001");
      try {
        let modelBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent('ml_face_isface.ms');
        let context: mindSporeLite.Context = {};
        context.target = [];
        mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context, (msliteModel: mindSporeLite.Model) => {
          hilog.info(domain, tag, 'msliteModel type: ' + typeof msliteModel);
          hilog.info(domain, tag, 'msliteModel keys length: ' + Object.keys(msliteModel).length);
          hilog.info(domain, tag, 'msliteModel stringify: ' + JSON.stringify(msliteModel));
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          expect(typeof msliteModel).assertEqual("object");
          expect(Object.keys(msliteModel).length).assertEqual(0);
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, "loadModelFromBufferCallbackContextTargetEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(error.code).assertEqual(1000001);
        done();
      }
    });

    // 3. loadModelFromFd API 测试 - 3 参数 Callback 版本 - Context 属性覆盖
    /**
     * @tc.name   loadModelFromFdCallbackContextTargetEmptyArrayStatic001
     * @tc.number CoverageSupplement4Test_009
     * @tc.desc   loadModelFromFd Context target empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdCallbackContextTargetEmptyArrayStatic001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "CoverageSupplement4Test: loadModelFromFdCallbackContextTargetEmptyArrayStatic001");
      try {
        let model_file = abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = [];
        mindSporeLite.loadModelFromFd(file.fd, context, (msliteModel: mindSporeLite.Model) => {
          fs.closeSync(file);
          hilog.info(domain, tag, 'msliteModel type: ' + typeof msliteModel);
          hilog.info(domain, tag, 'msliteModel keys length: ' + Object.keys(msliteModel).length);
          hilog.info(domain, tag, 'msliteModel stringify: ' + JSON.stringify(msliteModel));
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          expect(typeof msliteModel).assertEqual("object");
          expect(Object.keys(msliteModel).length).assertEqual(0);
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, "loadModelFromFdCallbackContextTargetEmptyArrayStatic001 error: " + error);
        hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
        expect(error.code).assertEqual(1000001);
        done();
      }
    });

  })
}
