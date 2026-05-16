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
import { describe, beforeAll, beforeEach, it, expect, Level } from '@ohos/hypium'
import mindSporeLite from '@ohos.ai.mindSporeLite';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

export default function coverageSupplementTest() {
  describe('CoverageSupplementTest', () => {
    beforeAll(() => {
      let dir = globalThis.abilityContext.filesDir + "/";
      try {
        let ml_face_model_file = dir + "ml_face_isface.ms";
        globalThis.context.resourceManager.getRawFileContent("ml_face_isface.ms", (error: BusinessError, model_buffer: Uint8Array) => {
          if (error != null) {
            console.log(
              "[rawfile_copy_to_sandbox] ml_face_isface.ms is copy " +
              "failed:${error.code}, message: ${error.message}.");
          } else {
            let file = fs.openSync(ml_face_model_file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
            fs.writeSync(file.fd, model_buffer.buffer);
            fs.closeSync(file);
            console.log("[rawfile_copy_to_sandbox] ml_face_isface.ms is copy success");
          }
        });

        let ml_ocr_model_file = dir + "ml_ocr_cn.ms";
        globalThis.context.resourceManager.getRawFileContent("ml_ocr_cn.ms", (error: BusinessError, model_buffer: Uint8Array) => {
          if (error != null) {
            console.log(
              "[rawfile_copy_to_sandbox] ml_ocr_cn.ms is copy " +
              "failed:${error.code}, message: ${error.message}.");
          } else {
            let file = fs.openSync(ml_ocr_model_file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
            fs.writeSync(file.fd, model_buffer.buffer);
            fs.closeSync(file);
            console.log("[rawfile_copy_to_sandbox] ml_ocr_cn.ms is copy success");
          }
        });

        let lenet_train_model_file = dir + "lenet_train.ms";
        globalThis.context.resourceManager.getRawFileContent("lenet_train.ms", (error: BusinessError, model_buffer: Uint8Array) => {
          if (error != null) {
            console.log(
              "[rawfile_copy_to_sandbox] lenet_train.ms is copy " +
              "failed:${error.code}, message: ${error.message}.");
          } else {
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

      let ml_ocr_model = dir + "ml_ocr_cn.ms";
      await fs.access(ml_ocr_model).then(async (res) => {
        if (res) {
          console.info("ml_ocr_cn.ms file exists");
        }
      }).catch((err: BusinessError) => {
        console.info("ml_ocr_cn.ms file does not exists! access failed with error message: " +
        err.message + ", error code: " + err.code);
      });

      let lenet_train_model = dir + "lenet_train.ms";
      await fs.access(lenet_train_model).then(async (res) => {
        if (res) {
          console.info("lenet_train.ms file exists");
        }
      }).catch((err: BusinessError) => {
        console.info("lenet_train.ms file does not exists! access failed with error message: " +
        err.message + ", error code: " + err.code);
      });
    });


    // 4. loadTrainModelFromFile 测试用例
    /**
     * @tc.name   loadTrainModelFromFileLossNameEmptyArray001
     * @tc.number CoverageSupplementTest_008
     * @tc.desc   loadTrainModelFromFile TrainCfg lossName empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileLossNameEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplementTest: loadTrainModelFromFileLossNameEmptyArray001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.lossName = [];

        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];

        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFileLossNameEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    // 6. loadTrainModelFromFd 测试用例
    /**
     * @tc.name   loadTrainModelFromFdFDModelNull001
     * @tc.number CoverageSupplementTest_013
     * @tc.desc   loadTrainModelFromFd model null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdFDModelNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplementTest: loadTrainModelFromFdFDModelNull001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(null, trainCfg, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFdFDModelNull001 error: " + JSON.stringify(error));
      }
    });

    // 8. Model.runStep 测试用例
    /**
     * @tc.name   modelRunStepInputsNull001
     * @tc.number CoverageSupplementTest_017
     * @tc.desc   Model runStep inputs null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelRunStepInputsNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplementTest: modelRunStepInputsNull001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let ret = msliteModel.runStep(null);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelRunStepInputsNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelRunStepInputsEmptyArray001
     * @tc.number CoverageSupplementTest_018
     * @tc.desc   Model runStep inputs empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelRunStepInputsEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplementTest: modelRunStepInputsEmptyArray001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let ret = msliteModel.runStep([]);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelRunStepInputsEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    // 9. Model.updateWeights 测试用例
    /**
     * @tc.name   modelUpdateWeightsWeightsNull001
     * @tc.number CoverageSupplementTest_019
     * @tc.desc   Model updateWeights weights null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelUpdateWeightsWeightsNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplementTest: modelUpdateWeightsWeightsNull001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let ret = msliteModel.updateWeights(null);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelUpdateWeightsWeightsNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelUpdateWeightsWeightsEmptyArray001
     * @tc.number CoverageSupplementTest_020
     * @tc.desc   Model updateWeights weights empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelUpdateWeightsWeightsEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplementTest: modelUpdateWeightsWeightsEmptyArray001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let ret = msliteModel.updateWeights([]);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelUpdateWeightsWeightsEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    // 11. Model.resize 测试用例
    /**
     * @tc.name   modelResizeInputsNull001
     * @tc.number CoverageSupplementTest_024
     * @tc.desc   Model resize inputs null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelResizeInputsNull001', Level.LEVEL1, () => {
      console.log("CoverageSupplementTest: modelResizeInputsNull001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          if (msliteModel !== null) {
            let new_dim: number[][] = [[48, 48]];
            let ret = msliteModel.resize(null, new_dim);
            expect(ret).assertFalse();
          }
        });
      } catch (error) {
        console.log("modelResizeInputsNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelResizeDimsNull001
     * @tc.number CoverageSupplementTest_025
     * @tc.desc   Model resize dims null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelResizeDimsNull001', Level.LEVEL1, () => {
      console.log("CoverageSupplementTest: modelResizeDimsNull001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          if (msliteModel !== null) {
            let modelInputs: mindSporeLite.MSTensor[] = msliteModel.getInputs();
            if (modelInputs.length > 0) {
              let ret = msliteModel.resize(modelInputs, null);
              expect(ret).assertFalse();
            }
          }
        });
      } catch (error) {
        console.log("modelResizeDimsNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFdModelNull001
     * @tc.number CoverageSupplement2Test_030
     * @tc.desc   loadModelFromFd model invalid fd test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdModelNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadModelFromFdModelNull001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let msliteModel = await mindSporeLite.loadModelFromFd(null, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadModelFromFdModelNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFdModelUndefined001
     * @tc.number CoverageSupplement2Test_031
     * @tc.desc   loadModelFromFd model undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdModelUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadModelFromFdModelUndefined001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let msliteModel = await mindSporeLite.loadModelFromFd(undefined, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadModelFromFdModelUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFdContextNull001
     * @tc.number CoverageSupplement2Test_032
     * @tc.desc   loadModelFromFd context null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadModelFromFdContextNull001");
      try {
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, null);
        fs.closeSync(file);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadModelFromFdContextNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFdContextUndefined001
     * @tc.number CoverageSupplement2Test_033
     * @tc.desc   loadModelFromFd context undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadModelFromFdContextUndefined001");
      try {
        let model_file = globalThis.abilityContext.filesDirDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, undefined);
        fs.closeSync(file);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadModelFromFdContextUndefined001 error: " + JSON.stringify(error));
      }
    });

    // 3. loadModelFromFd API 测试 - Context + Callback 版本 - 基础测试
    /**
     * @tc.name   loadModelFromFdContextCallbackNormal001
     * @tc.number CoverageSupplement2Test_036
     * @tc.desc   loadModelFromFd Context Callback normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextCallbackNormal001', Level.LEVEL1, (done: Function) => {
      console.log("CoverageSupplement2Test: loadModelFromFdContextCallbackNormal001");
      try {
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        mindSporeLite.loadModelFromFd(file.fd, context, (msliteModel: mindSporeLite.Model) => {
          fs.closeSync(file);
          expect(msliteModel !== null).assertTrue();
          done();
        });
      } catch (error) {
        console.log("loadModelFromFdContextCallbackNormal001 error: " + JSON.stringify(error));
        done();
      }
    });

    // 4. loadTrainModelFromFile API 测试 - Context 属性覆盖
    /**
     * @tc.name   loadTrainModelFromFileContextPrecisionModeEmptyString001
     * @tc.number CoverageSupplement2Test_037
     * @tc.desc   loadTrainModelFromFile Context precisionMode empty string test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileContextPrecisionModeEmptyString001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromFileContextPrecisionModeEmptyString001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.precisionMode = "";
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        expect(msliteModel).not().assertUndefined();
        expect(msliteModel).not().assertNull();
      } catch (error) {
        console.log("loadTrainModelFromFileContextPrecisionModeEmptyString001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFileModelNull001
     * @tc.number CoverageSupplement2Test_040
     * @tc.desc   loadTrainModelFromFile model null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileModelNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromFileModelNull001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(null, trainCfg, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFileModelNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFileModelUndefined001
     * @tc.number CoverageSupplement2Test_041
     * @tc.desc   loadTrainModelFromFile model undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileModelUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromFileModelUndefined001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(undefined, trainCfg, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFileModelUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFileTrainCfgNull001
     * @tc.number CoverageSupplement2Test_042
     * @tc.desc   loadTrainModelFromFile trainCfg null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileTrainCfgNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromFileTrainCfgNull001");
      try {
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, null, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFileTrainCfgNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFileTrainCfgUndefined001
     * @tc.number CoverageSupplement2Test_043
     * @tc.desc   loadTrainModelFromFile trainCfg undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileTrainCfgUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromFileTrainCfgUndefined001");
      try {
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, undefined, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFileTrainCfgUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFileContextNull001
     * @tc.number CoverageSupplement2Test_044
     * @tc.desc   loadTrainModelFromFile context null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileContextNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromFileContextNull001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, null);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFileContextNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFileContextUndefined001
     * @tc.number CoverageSupplement2Test_045
     * @tc.desc   loadTrainModelFromFile context undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileContextUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromFileContextUndefined001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, undefined);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFileContextUndefined001 error: " + JSON.stringify(error));
      }
    });

    // 5. loadTrainModelFromBuffer API 测试 - Context 属性覆盖
    /**
     * @tc.name   loadTrainModelFromBufferContextPrecisionModeEmptyString001
     * @tc.number CoverageSupplement2Test_046
     * @tc.desc   loadTrainModelFromBuffer Context precisionMode empty string test.
     * @tc.type     FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromBufferContextPrecisionModeEmptyString001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromBufferContextPrecisionModeEmptyString001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.precisionMode = "";
        let syscontext: common.Context = globalThis.context;
        let modelName = 'lenet_train.ms';
        syscontext.resourceManager.getRawFileContent(modelName, (error: BusinessError, model_buffer: Uint8Array) => {
          if (error == null) {
            mindSporeLite.loadTrainModelFromBuffer(model_buffer.buffer, trainCfg, context).then((msliteModel: mindSporeLite.Model) => {
              expect(msliteModel).not().assertUndefined();
              expect(msliteModel).not().assertNull();
            }).catch((err: BusinessError) => {
            });
          }
        });
      } catch (error) {
        console.log("loadTrainModelFromBufferContextPrecisionModeEmptyString001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromBufferModelNull001
     * @tc.number CoverageSupplement2Test_049
     * @tc.desc   loadTrainModelFromBuffer model null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromBufferModelNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromBufferModelNull001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(null, trainCfg, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromBufferModelNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromBufferModelUndefined001
     * @tc.number CoverageSupplement2Test_050
     * @tc.desc   loadTrainModelFromBuffer model undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromBufferModelUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromBufferModelUndefined001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(undefined, trainCfg, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromBufferModelUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromBufferTrainCfgNull001
     * @tc.number CoverageSupplement2Test_051
     * @tc.desc   loadTrainModelFromBuffer trainCfg null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromBufferTrainCfgNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromBufferTrainCfgNull001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let syscontext: common.Context = globalThis.context
        let modelBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent("lenet_train.ms");
        let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer, null, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromBufferTrainCfgNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromBufferTrainCfgUndefined001
     * @tc.number CoverageSupplement2Test_052
     * @tc.desc   loadTrainModelFromBuffer trainCfg undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromBufferTrainCfgUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromBufferTrainCfgUndefined001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let syscontext: common.Context = globalThis.context
        let modelBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent("lenet_train.ms");
        let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer, undefined, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromBufferTrainCfgUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromBufferContextNull001
     * @tc.number CoverageSupplement2Test_053
     * @tc.desc   loadTrainModelFromBuffer context null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromBufferContextNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromBufferContextNull001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let syscontext: common.Context = globalThis.context
        let modelBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent("lenet_train.ms");
        let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer, trainCfg, null);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromBufferContextNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFromContextUndefined001
     * @tc.number CoverageSupplement2Test_054
     * @tc.desc   loadTrainModelFromFromBuffer context undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFromContextUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromFromContextUndefined001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let syscontext: common.Context = globalThis.context
        let modelBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent("lenet_train.ms");
        let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer, trainCfg, undefined);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFromContextUndefined001 error: " + JSON.stringify(error));
      }
    });

    // 6. loadTrainModelFromFd API 测试 - Context 属性覆盖
    /**
     * @tc.name   loadTrainModelFromFdContextPrecisionModeEmptyString001
     * @tc.number CoverageSupplement2Test_055
     * @tc.desc   loadTrainModelFromFd Context precisionMode empty string test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdContextPrecisionModeEmptyString001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromFdContextPrecisionModeEmptyString001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        context.cpu = {};
        context.cpu.precisionMode = "";
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, trainCfg, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertUndefined();
        expect(msliteModel).not().assertNull();
      } catch (error) {
        console.log("loadTrainModelFromFdContextPrecisionModeEmptyString001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFdModelNull001
     * @tc.number CoverageSupplement2Test_058
     * @tc.desc   loadTrainModelFromFd model invalid fd test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdModelNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromFdModelNull001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(null, trainCfg, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFdModelNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFdModelUndefined001
     * @tc.number CoverageSupplement2Test_059
     * @tc.desc   loadTrainModelFromFd model undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdModelUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromFdModelUndefined001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(undefined, trainCfg, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFdModelUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFdTrainCfgNull001
     * @tc.number CoverageSupplement2Test_060
     * @tc.desc   loadTrainModelFromFd trainCfg null test.
     * * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdTrainCfgNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromFdTrainCfgNull001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, null, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFdTrainCfgNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFdTrainCfgUndefined001
     * @tc.number CoverageSupplement2Test_061
     * @tc.desc   loadTrainModelFromFd trainCfg undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdTrainCfgUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromFdTrainCfgUndefined001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, undefined, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFdTrainCfgUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFdContextNull001
     * @tc.number CoverageSupplement2Test_062
     * @tc.desc   loadTrainModelFromFd context null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdContextNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromFdContextNull001001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, trainCfg, null);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFdContextNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFdContextUndefined001
     * @tc.number CoverageSupplement2Test_063
     * @tc.desc   loadTrainModelFromFd context undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdContextUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: loadTrainModelFromFdContextUndefined001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, trainCfg, undefined);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFdContextUndefined001 error: " + JSON.stringify(error));
      }
    });

    // 7. Model.predict API 测试 - Promise 版本 - 参数覆盖
    /**
     * @tc.name   modelPredictPromiseInputsNull001
     * @tc.number CoverageSupplement2Test_067
     * @tc.desc   Model predict Promise inputs null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelPredictPromiseInputsNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelPredictPromiseInputsNull001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_ocr_cn.ms";
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
        if (msliteModel !== null) {
          let modelOutputs = await msliteModel.predict(null);
          expect(modelOutputs).assertUndefined();
        }
      } catch (error) {
        console.log("modelPredictPromiseInputsNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelPredictPromiseInputsUndefined001
     * @tc.number CoverageSupplement2Test_068
     * @tc.desc   Model predict Promise inputs undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelPredictPromiseInputsUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelPredictPromiseInputsUndefined001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_ocr_cn.ms";
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
        if (msliteModel !== null) {
          let modelOutputs = await msliteModel.predict(undefined);
          expect(modelOutputs).assertUndefined();
        }
      } catch (error) {
        console.log("modelPredictPromiseInputsUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelPredictPromiseInputsEmptyArray001
     * @tc.number CoverageSupplement2Test_069
     * @tc.desc   Model predict Promise inputs empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelPredictPromiseInputsEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelPredictPromiseInputsEmptyArray001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_ocr_cn.ms";
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
        if (msliteModel !== null) {
          let modelOutputs = await msliteModel.predict([]);
          expect(modelOutputs).assertUndefined();
        }
      } catch (error) {
        console.log("modelPredictPromiseInputsEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    // 8. Model.resize API 测试 - 参数覆盖
    /**
     * @tc.name   modelResizeInputsUndefined001
     * @tc.number CoverageSupplement2Test_070
     * @tc.desc   Model resize inputs undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelResizeInputsUndefined001', Level.LEVEL1, () => {
      console.log("CoverageSupplement2Test: modelResizeInputsUndefined001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          if (msliteModel !== null) {
            let new_dim: number[][] = [[48, 48]];
            let ret = msliteModel.resize(undefined, new_dim);
            expect(ret).assertFalse();
          }
        });
      } catch (error) {
        console.log("modelResizeInputsUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelResizeDimsUndefined001
     * @tc.number CoverageSupplement2Test_071
     * @tc.desc   Model resize dims undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelResizeDimsUndefined001', Level.LEVEL1, () => {
      console.log("CoverageSupplement2Test: modelResizeDimsUndefined001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        mindSporeLite.loadModelFromFile(model_file, context, (mslite: mindSporeLite.Model) => {
          if (mslite !== null) {
            let modelInputs: mindSporeLite.MSTensor[] = mslite.getInputs();
            if (modelInputs.length > 0) {
              let ret = mslite.resize(modelInputs, undefined);
              expect(ret).assertFalse();
            }
          }
        });
      } catch (error) {
        console.log("modelResizeDimsUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelResizeInputsEmptyArray001
     * @tc.number CoverageSupplement2Test_072
     * @tc.desc   Model resize inputs empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelResizeInputsEmptyArray001', Level.LEVEL1, () => {
      console.log("CoverageSupplement2Test: modelResizeInputsEmptyArray001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        mindSporeLite.loadModelFromFile(model_file, context, (mslite: mindSporeLite.Model) => {
          if (mslite !== null) {
            let new_dim: number[][] = [[48, 48]];
            let ret = mslite.resize([], new_dim);
            expect(ret).assertFalse();
          }
        });
      } catch (error) {
        console.log("modelResizeInputsEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelResizeDimsEmptyArray001
     * @tc.number CoverageSupplement2Test_073
     * @tc.desc   Model resize dims empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelResizeDimsEmptyArray001', Level.LEVEL1, () => {
      console.log("CoverageSupplement2Test: modelResizeDimsEmptyArray001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        mindSporeLite.loadModelFromFile(model_file, context, (mslite: mindSporeLite.Model) => {
          if (mslite !== null) {
            let modelInputs: mindSporeLite.MSTensor[] = mslite.getInputs();
            if (modelInputs.length > 0) {
              let ret = mslite.resize(modelInputs, []);
            expect(ret).assertFalse();
            }
          }
        });
      } catch (error) {
        console.log("modelResizeDimsEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    // 9. Model.runStep API 测试 - 参数覆盖
    /**
     * @tc.name   modelRunStepInputsUndefined001
     * @tc.number CoverageSupplement2Test_074
     * @tc.desc   Model runStep inputs undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelRunStepInputsUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelRunStepInputsUndefined001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let ret = msliteModel.runStep(undefined);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelRunStepInputsUndefined001 error: " + JSON.stringify(error));
      }
    });

    // 10. Model.updateWeights API 测试 - 参数覆盖
    /**
     * @tc.name   modelUpdateWeightsWeightsUndefined001
     * @tc.number CoverageSupplement2Test_075
     * @tc.desc   Model updateWeights weights undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelUpdateWeightsWeightsUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelUpdateWeightsWeightsUndefined001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let ret = msliteModel.updateWeights(undefined);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelUpdateWeightsWeightsUndefined001 error: " + JSON.stringify(error));
      }
    });

    // 11. Model.setupVirtualBatch API 测试 - 参数覆盖
    /**
     * @tc.name   modelSetupVirtualBatchVirtualBatchMultiplierNull001
     * @tc.number CoverageSupplement2Test_076
     * @tc.desc   Model setupVirtualBatch virtualBatchMultiplier null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelSetupVirtualBatchVirtualBatchMultiplierNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelSetupVirtualBatchVirtualBatchMultiplierNull001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let ret = msliteModel.setupVirtualBatch(null, -1, -1);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelSetupVirtualBatchVirtualBatchMultiplierNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelSetupVirtualBatchVirtualBatchMultiplierUndefined001
     * @tc.number CoverageSupplement2Test_077
     * @tc.desc   Model setupVirtualBatch virtualBatchMultiplier undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelSetupVirtualBatchVirtualBatchMultiplierUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelSetupVirtualBatchVirtualBatchMultiplierUndefined001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel) {
          let ret = msliteModel.setupVirtualBatch(undefined, -1, -1);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelSetupVirtualBatchVirtualBatchMultiplierUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelSetupVirtualBatchLrNull001
     * @tc.number CoverageSupplement2Test_078
     * @tc.desc   Model setupVirtualBatch lr null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelSetupVirtualBatchLrNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelSetupVirtualBatchLrNull001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let ret = msliteModel.setupVirtualBatch(2, null, -1);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelSetupVirtualBatchLrNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelSetupVirtualBatchLrUndefined001
     * @tc.number CoverageSupplement2Test_079
     * @tc.desc   Model setupVirtualBatch lr undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelSetupVirtualBatchLrUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelSetupVirtualBatchLrUndefined001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let ret = msliteModel.setupVirtualBatch(2, undefined, -1);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelSetupVirtualBatchLrUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelSetupVirtualBatchMomentumNull001
     * @tc.number CoverageSupplement2Test_080
     * @tc.desc   Model setupVirtualBatch momentum null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelSetupVirtualBatchMomentumNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelSetupVirtualBatchMomentumNull001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let ret = msliteModel.setupVirtualBatch(2, -1, null);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelSetupVirtualBatchMomentumNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelSetupVirtualBatchMomentumUndefined001
     * @tc.number CoverageSupplement2Test_081
     * @tc.desc   Model setupVirtualBatch momentum undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelSetupVirtualBatchMomentumUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelSetupVirtualBatchMomentumUndefined001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let ret = msliteModel.setupVirtualBatch(2, -1, undefined);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelSetupVirtualBatchMomentumUndefined001 error: " + JSON.stringify(error));
      }
    });

    // 12. Model.exportModel API 测试 - 参数覆盖
    /**
     * @tc.name   modelExportModelModelFileNull001
     * @tc.number CoverageSupplement2Test_082
     * @tc.desc   Model exportModel modelFile null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelExportModelModelFileNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelExportModelModelFileNull001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let ret = msliteModel.exportModel(null, mindSporeLite.QuantizationType.NO_QUANT, true);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelExportModelModelFileNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelExportModelModelFileUndefined001
     * @tc.number CoverageSupplement2Test_083
     * @tc.desc   Model exportModel modelFile undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelExportModelModelFileUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelExportModelModelFileUndefined001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let ret = msliteModel.exportModel(undefined, mindSporeLite.QuantizationType.NO_QUANT, true);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelExportModelModelFileUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelExportModelOutputTensorNameNull001
     * @tc.number CoverageSupplement2Test_084
     * @tc.desc   Model exportModel outputTensorName null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelExportModelOutputTensorNameNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelExportModelOutputTensorNameNull001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let path: string = globalThis.abilityContext.filesDir + "/test_export_model.ms";
          let ret = msliteModel.exportModel(path, mindSporeLite.QuantizationType.NO_QUANT, true, null);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelExportModelOutputTensorNameNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelExportModelOutputTensorNameUndefined001
     * @tc.number CoverageSupplement2Test_085
     * @tc.desc   Model exportModel outputTensorName undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelExportModelOutputTensorNameUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelExportModelOutputTensorNameUndefined001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let path: string = globalThis.abilityContext.filesDir + "/test_export_model.ms";
          let ret = msliteModel.exportModel(path, mindSporeLite.QuantizationType.NO_QUANT, true, undefined);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelExportModelOutputTensorNameUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelExportModelOutputTensorNameEmptyArray001
     * @tc.number CoverageSupplement2Test_086
     * @tc.desc   Model exportModel outputTensorName empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelExportModelOutputTensorNameEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelExportModelOutputTensorNameEmptyArray001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let trainCfg: mindSporeLite.TrainCfg = {};
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let path: string = globalThis.abilityContext.filesDir + "/test_export_model.ms";
          let ret = msliteModel.exportModel(path, mindSporeLite.QuantizationType.NO_QUANT, true, []);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelExportModelOutputTensorNameEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    // 13. Model.exportWeightsCollaborateWithMicro API 测试 - 参数覆盖
    /**
     * @tc.name   modelExportWeightsCollaborateWithMicroWeightFileNull001
     * @tc.number CoverageSupplement2Test_087
     * @tc.desc   Model exportWeightsCollaborateWithMicro weightFile null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelExportWeightsCollaborateWithMicroWeightFileNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelExportWeightsCollaborateWithMicroWeightFileNull001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.lossName = ["CrossEntropy"];
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let ret = msliteModel.exportWeightsCollaborateWithMicro(null, true);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelExportWeightsCollaborateWithMicroWeightFileNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelExportWeightsCollaborateWithMicroWeightFileUndefined001
     * @tc.number CoverageSupplement2Test_088
     * @tc.desc   Model exportWeightsCollaborateWithMicro weightFile undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelExportWeightsCollaborateWithMicroWeightFileUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelExportWeightsCollaborateWithMicroWeightFileUndefined001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.lossName = ["CrossEntropy"];
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let ret = msliteModel.exportWeightsCollaborateWithMicro(undefined, true);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelExportWeightsCollaborateWithMicroWeightFileUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelExportWeightsCollaborateWithMicroChangeableWeightsNameNull001
     * @tc.number CoverageSupplement2Test_089
     * @tc.desc   Model exportWeightsCollaborateWithMicro changeableWeightsName null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelExportWeightsCollaborateWithMicroChangeableWeightsNameNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelExportWeightsCollaborateWithMicroChangeableWeightsNameNull001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.lossName = ["CrossEntropy"];
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let path: string = globalThis.abilityContext.filesDir + "/test_export_weights.bin";
          let ret = msliteModel.exportWeightsCollaborateWithMicro(path, true, false, null);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelExportWeightsCollaborateWithMicroChangeableWeightsNameNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelExportWeightsCollaborateWithMicroChangeableWeightsNameUndefined001
     * @tc.number CoverageSupplement2Test_090
     * @tc.desc   Model exportWeightsCollaborateWithMicro changeableWeightsName undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('modelExportWeightsCollaborateWithMicroChangeableWeightsNameUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelExportWeightsCollaborateWithMicroChangeableWeightsNameUndefined001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.lossName = ["CrossEntropy"];
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let path: string = globalThis.abilityContext.filesDir + "/test_export_weights.bin";
          let ret = msliteModel.exportWeightsCollaborateWithMicro(path, true, false, undefined);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelExportWeightsCollaborateWithMicroChangeableWeightsNameUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   modelExportWeightsCollaborateWithMicroChangeableWeightsNameEmptyArray001
     * @tc.number CoverageSupplement2Test_091
     * @tc.desc   Model exportWeightsCollaborateWithMicro changeableWeightsName empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  1
     */
    it('modelExportWeightsCollaborateWithMicroChangeableWeightsNameEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement2Test: modelExportWeightsCollaborateWithMicroChangeableWeightsNameEmptyArray001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.lossName = ["CrossEntropy"];
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        if (msliteModel !== null) {
          let path: string = globalThis.abilityContext.filesDir + "/test_export_weights.bin";
          let ret = msliteModel.exportWeightsCollaborateWithMicro(path, true, false, []);
          expect(ret).assertFalse();
        }
      } catch (error) {
        console.log("modelExportWeightsCollaborateWithMicroChangeableWeightsNameEmptyArray001 error: " + JSON.stringify(error));
      }
    });
    
    // 1. loadModelFromFile API 测试 - Promise 版本 - Context 属性覆盖
    /**
     * @tc.name   loadModelFromFileContextCpuThreadAffinityCoreListEmptyArray001
     * @tc.number CoverageSupplement3Test_001
     * @tc.desc   loadModelFromFile Context cpu threadAffinityCoreList empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileContextCpuThreadAffinityCoreListEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromFileContextCpuThreadAffinityCoreListEmptyArray001");
      try {
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.threadAffinityCoreList = [];
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadModelFromFileContextCpuThreadAffinityCoreListEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFileContextNnrtPerformanceModeExtreme001
     * @tc.number CoverageSupplement3Test_006
     * @tc.desc   loadModelFromFile Context nnrt performanceMode PERFORMANCE_EXTREME test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileContextNnrtPerformanceModeExtreme001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromFileContextNnrtPerformanceModeExtreme001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.performanceMode = mindSporeLite.PerformanceMode.PERFORMANCE_EXTREME;
        context.nnrt.deviceID = all_devices[0].deviceID();
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadModelFromFileContextNnrtPerformanceModeExtreme001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFileContextNnrtPerformanceModeLow001
     * @tc.number CoverageSupplement3Test_007
     * @tc.desc   loadModelFromFile Context nnrt performanceMode PERFORMANCE_LOW test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileContextNnrtPerformanceModeLow001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromFileContextNnrtPerformanceModeLow001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.priority = mindSporeLite.Priority.PRIORITY_NONE;
        context.nnrt.performanceMode = mindSporeLite.PerformanceMode.PERFORMANCE_LOW;
        context.nnrt.deviceID = all_devices[0].deviceID();
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadModelFromFileContextNnrtPerformanceModeLow001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFileContextNnrtPriorityLow001
     * @tc.number CoverageSupplement3Test_008
     * @tc.desc   loadModelFromFile Context nnrt priority LOW test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileContextNnrtPriorityLow001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromFileContextNnrtPriorityLow001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.priority = mindSporeLite.Priority.PRIORITY_LOW;
        context.nnrt.deviceID = all_devices[0].deviceID();
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadModelFromFileContextNnrtPriorityLow001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFileContextNnrtPriorityMedium001
     * @tc.number CoverageSupplement3Test_009
     * @tc.desc   loadModelFromFile Context nnrt priority MEDIUM test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileContextNnrtPriorityMedium001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromFileContextNnrtPriorityMedium001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.priority = mindSporeLite.Priority.PRIORITY_MEDIUM;
        context.nnrt.deviceID = all_devices[0].deviceID();
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadModelFromFileContextNnrtPriorityMedium001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFileContextNnrtPriorityHigh001
     * @tc.number CoverageSupplement3Test_010
     * @tc.desc   loadModelFromFile Context nnrt priority HIGH test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileContextNnrtPriorityHigh001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromFileContextNnrtPriorityHigh001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.priority = mindSporeLite.Priority.PRIORITY_HIGH;
        context.nnrt.deviceID = all_devices[0].deviceID();
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadModelFromFileContextNnrtPriorityHigh001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFileContextNnrtExtensionsEmptyArray001
     * @tc.number CoverageSupplement3Test_011
     * @tc.desc   loadModelFromFile Context nnrt extensions empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileContextNnrtExtensionsEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromFileContextNnrtExtensionsEmptyArray001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.deviceID = all_devices[0].deviceID();
        context.nnrt.extensions = [];
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadModelFromFileContextNnrtExtensionsEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFileContextNnrtExtensionsNonEmptyArray001
     * @tc.number CoverageSupplement3Test_012
     * @tc.desc   loadModelFromFile Context nnrt extensions non-empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileContextNnrtExtensionsNonEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromFileContextNnrtExtensionsNonEmptyArray001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let syscontext: common.Context = globalThis.context;
        let modelName = 'ml_face_isface.ms';
        syscontext.resourceManager.getRawFileContent(modelName, async (error: BusinessError, model_buffer: Uint8Array) => {
          if (error == null) {
            let context: mindSporeLite.Context = {};
            context.target = ["nnrt"];
            context.nnrt = {};
            context.nnrt.deviceID = all_devices[0].deviceID();
            let extension: mindSporeLite.Extension = {
              name: "test_extension",
              value: model_buffer
            };
            context.nnrt.extensions = [extension];
            let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
            expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
          }
        });
      } catch (error) {
        console.log("loadModelFromFileContextNnrtExtensionsNonEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFileCallbackContextCpuThreadAffinityModeAffinityMode001
     * @tc.number CoverageSupplement3Test_018
     * @tc.desc   loadModelFromFile Callback Context cpu threadAffinityMode AFFINITY_MODE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileCallbackContextCpuThreadAffinityModeAffinityMode001', Level.LEVEL1, (done: Function) => {
      console.log("CoverageSupplement3Test: loadModelFromFileCallbackContextCpuThreadAffinityModeAffinityMode001");
      try {
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.NO_AFFINITIES;
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        console.log("loadModelFromFileCallbackContextCpuThreadAffinityModeAffinityMode001 error: " + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileCallbackContextCpuThreadAffinityModeBigLittle001
     * @tc.number CoverageSupplement3Test_019
     * @tc.desc   loadModelFromFile Callback Context cpu threadAffinityMode BIG_LITTLE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileCallbackContextCpuThreadAffinityModeBigLittle001', Level.LEVEL1, (done: Function) => {
      console.log("CoverageSupplement3Test: loadModelFromFileCallbackContextCpuThreadAffinityModeBigLittle001");
      try {
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        console.log("loadModelFromFileCallbackContextCpuThreadAffinityModeBigLittle001 error: " + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileCallbackContextCpuThreadAffinityModeHybrid001
     * @tc.number CoverageSupplement3Test_020
     * @tc.desc   loadModelFromFile Callback Context cpu threadAffinityMode HYBRID test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileCallbackContextCpuThreadAffinityModeHybrid001', Level.LEVEL1, (done: Function) => {
      console.log("CoverageSupplement3Test: loadModelFromFileCallbackContextCpuThreadAffinityModeHybrid001");
      try {
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.LITTLE_CORES_FIRST;
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        console.log("loadModelFromFileCallbackContextCpuThreadAffinityModeHybrid001 error: " + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileCallbackContextCpuThreadAffinityCoreListEmptyArray001
     * @tc.number CoverageSupplement3Test_021
     * @tc.desc   loadModelFromFile Callback Context cpu threadAffinityCoreList empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileCallbackContextCpuThreadAffinityCoreListEmptyArray001', Level.LEVEL1, (done: Function) => {
      console.log("CoverageSupplement3Test: loadModelFromFileCallbackContextCpuThreadAffinityCoreListEmptyArray001");
      try {
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.threadAffinityCoreList = [];
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        console.log("loadModelFromFileCallbackContextCpuThreadAffinityCoreListEmptyArray001 error: " + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileCallbackContextNnrtPerformanceModeNone001
     * @tc.number CoverageSupplement3Test_022
     * @tc.desc   loadModelFromFile Callback Context nnrt performanceMode PERFORMANCE_NONE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileCallbackContextNnrtPerformanceModeNone001', Level.LEVEL1, async (done: Function) => {
      console.log("CoverageSupplement3Test: loadModelFromFileCallbackContextNnrtPerformanceModeNone001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          done();
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.performanceMode = mindSporeLite.PerformanceMode.PERFORMANCE_NONE;
        context.nnrt.deviceID = all_devices[0].deviceID();
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        console.log("loadModelFromFileCallbackContextNnrtPerformanceModeNone001 error: " + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileCallbackContextNnrtPerformanceModeLow001
     * @tc.number CoverageSupplement3Test_023
     * @tc.desc   loadModelFromFile Callback Context nnrt performanceMode PERFORMANCE_LOW test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileCallbackContextNnrtPerformanceModeLow001', Level.LEVEL1, async (done: Function) => {
      console.log("CoverageSupplement3Test: loadModelFromFileCallbackContextNnrtPerformanceModeLow001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          done();
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.priority = mindSporeLite.Priority.PRIORITY_NONE;
        context.nnrt.performanceMode = mindSporeLite.PerformanceMode.PERFORMANCE_LOW;
        context.nnrt.deviceID = all_devices[0].deviceID();
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        console.log("loadModelFromFileCallbackContextNnrtPerformanceModeLow001 error: " + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileCallbackContextNnrtPriorityLow001
     * @tc.number CoverageSupplement3Test_024
     * @tc.desc   loadModelFromFile Callback Context nnrt priority LOW test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileCallbackContextNnrtPriorityLow001', Level.LEVEL1, async (done: Function) => {
      console.log("CoverageSupplement3Test: loadModelFromFileCallbackContextNnrtPriorityLow001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          done();
          return;
        }
        let model_file = globalThis.abilityContextContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.priority = mindSporeLite.Priority.PRIORITY_LOW;
        context.nnrt.deviceID = all_devices[0].deviceID();
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        console.log("loadModelFromFileCallbackContextNnrtPriorityLow001 error: " + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileCallbackContextNnrtPriorityMedium001
     * @tc.number CoverageSupplement3Test_025
     * @tc.desc   loadModelFromFile Callback Context nnrt priority MEDIUM test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileCallbackContextNnrtPriorityMedium001', Level.LEVEL1, async (done: Function) => {
      console.log("CoverageSupplement3Test: loadModelFromFileCallbackContextNnrtPriorityMedium001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          done();
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.priority = mindSporeLite.Priority.PRIORITY_MEDIUM;
        context.nnrt.deviceID = all_devices[0].deviceID();
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        console.log("loadModelFromFileCallbackContextNnrtPriorityMedium001 error: " + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileCallbackContextNnrtPriorityHigh001
     * @tc.number CoverageSupplement3Test_026
     * @tc.desc   loadModelFromFile Callback Context nnrt priority HIGH test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileCallbackContextNnrtPriorityHigh001', Level.LEVEL1, async (done: Function) => {
      console.log("CoverageSupplement3Test: loadModelFromFileCallbackContextNnrtPriorityHigh001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          done();
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.priority = mindSporeLite.Priority.PRIORITY_HIGH;
        context.nnrt.deviceID = all_devices[0].deviceID();
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        console.log("loadModelFromFileCallbackContextNnrtPriorityHigh001 error: " + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileCallbackContextNnrtExtensionsEmptyArray001
     * @tc.number CoverageSupplement3Test_027
     * @tc.desc   loadModelFromFile Callback Context nnrt extensions empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileCallbackContextNnrtExtensionsEmptyArray001', Level.LEVEL1, async (done: Function) => {
      console.log("CoverageSupplement3Test: loadModelFromFileCallbackContextNnrtExtensionsEmptyArray001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          done();
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.deviceID = all_devices[0].deviceID();
        context.nnrt.extensions = [];
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        console.log("loadModelFromFileCallbackContextNnrtExtensionsEmptyArray001 error: " + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileCallbackContextNnrtExtensionsNonEmptyArray001
     * @tc.number CoverageSupplement3Test_028
     * @tc.desc   loadModelFromFile Callback Context nnrt extensions non-empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileCallbackContextNnrtExtensionsNonEmptyArray001', Level.LEVEL1, async (done: Function) => {
      console.log("CoverageSupplement3Test: loadModelFromFileCallbackContextNnrtExtensionsNonEmptyArray001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          done();
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let syscontext: common.Context = globalThis.context;
        let modelName = 'ml_face_isface.ms';
        syscontext.resourceManager.getRawFileContent(modelName, (error: BusinessError, model_buffer: Uint8Array) => {
          if (error == null) {
            let context: mindSporeLite.Context = {};
            context.target = ["nnrt"];
            context.nnrt = {};
            context.nnrt.deviceID = all_devices[0].deviceID();
            let extension: mindSporeLite.Extension = {
              name: "test_extension",
              value: model_buffer
            };
            context.nnrt.extensions = [extension];
            mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
              expect(msliteModel).not().assertNull();
              expect(msliteModel).not().assertUndefined();
              done();
            });
          } else {
            done();
          }
        });
      } catch (error) {
        console.log("loadModelFromFileCallbackContextNnrtExtensionsNonEmptyArray001 error: " + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextCpuThreadAffinityModeAffinityMode001
     * @tc.number CoverageSupplement3Test_032
     * @tc.desc   loadModelFromBuffer Context cpu threadAffinityMode AFFINITY_MODE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextCpuThreadAffinityModeAffinityMode001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromBufferContextCpuThreadAffinityModeAffinityMode001");
      try {
        let syscontext: common.Context = globalThis.context;
        let modelName = 'ml_face_isface.ms';
        syscontext.resourceManager.getRawFileContent(modelName, async (error: BusinessError, model_buffer: Uint8Array) => {
          if (error == null) {
            let context: mindSporeLite.Context = {};
            context.target = ["cpu"];
            context.cpu = {};
            context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.NO_AFFINITIES;
            let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context);
            expect(msliteModel).not().assertNull();
            expect(msliteModel).not().assertUndefined();
          }
        });
      } catch (error) {
        console.log("loadModelFromBufferContextCpuThreadAffinityModeAffinityMode001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextCpuThreadAffinityModeBigLittle001
     * @tc.number CoverageSupplement3Test_033
     * @tc.desc   loadModelFromBuffer Context cpu threadAffinityMode BIG_LITTLE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextCpuThreadAffinityModeBigLittle001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromBufferContextCpuThreadAffinityModeBigLittle001");
      try {
        let syscontext: common.Context = globalThis.context;
        let modelName = 'ml_face_isface.ms';
        syscontext.resourceManager.getRawFileContent(modelName, async (error: BusinessError, model_buffer: Uint8Array) => {
          if (error == null) {
            let context: mindSporeLite.Context = {};
            context.target = ["cpu"];
            context.cpu = {};
            context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
            let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context);
            expect(msliteModel).not().assertNull();
            expect(msliteModel).not().assertUndefined();
          }
        });
      } catch (error) {
        console.log("loadModelFromBufferContextCpuThreadAffinityModeBigLittle001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextCpuThreadAffinityModeHybrid001
     * @tc.number CoverageSupplement3Test_034
     * @tc.desc   loadModelFromBuffer Context cpu threadAffinityMode HYBRID test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextCpuThreadAffinityModeHybrid001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromBufferContextCpuThreadAffinityModeHybrid001");
      try {
        let syscontext: common.Context = globalThis.context;
        let modelName = 'ml_face_isface.ms';
        syscontext.resourceManager.getRawFileContent(modelName, async (error: BusinessError, model_buffer: Uint8Array) => {
          if (error == null) {
            let context: mindSporeLite.Context = {};
            context.target = ["cpu"];
            context.cpu = {};
            context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.LITTLE_CORES_FIRST;
            let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context);
            expect(msliteModel).not().assertNull();
            expect(msliteModel).not().assertUndefined();
          }
        });
      } catch (error) {
        console.log("loadModelFromBufferContextCpuThreadAffinityModeHybrid001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextCpuThreadAffinityCoreListEmptyArray001
     * @tc.number CoverageSupplement3Test_035
     * @tc.desc   loadModelFromBuffer Context cpu threadAffinityCoreList empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextCpuThreadAffinityCoreListEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromBufferContextCpuThreadAffinityCoreListEmptyArray001");
      try {
        let syscontext: common.Context = globalThis.context;
        let modelName = 'ml_face_isface.ms';
        syscontext.resourceManager.getRawFileContent(modelName, async (error: BusinessError, model_buffer: Uint8Array) => {
          if (error == null) {
            let context: mindSporeLite.Context = {};
            context.target = ["cpu"];
            context.cpu = {};
            context.cpu.threadAffinityCoreList = [];
            let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context);
            expect(msliteModel).not().assertNull();
            expect(msliteModel).not().assertUndefined();
          }
        });
      } catch (error) {
        console.log("loadModelFromBufferContextCpuThreadAffinityCoreListEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextCpuThreadAffinityCoreListNonEmptyArray001
     * @tc.number CoverageSupplement3Test_036
     * @tc.desc   loadModelFromBuffer Context cpu threadAffinityCoreList non-empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextCpuThreadAffinityCoreListNonEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromBufferContextCpuThreadAffinityCoreListNonEmptyArray001");
      try {
        let syscontext: common.Context = globalThis.context;
        let modelName = 'ml_face_isface.ms';
        syscontext.resourceManager.getRawFileContent(modelName, async (error: BusinessError, model_buffer: Uint8Array) => {
          if (error == null) {
            let context: mindSporeLite.Context = {};
            context.target = ["cpu"];
            context.cpu = {};
            context.cpu.threadAffinityCoreList = [0, 1];
            let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context);
            expect(msliteModel).not().assertNull();
            expect(msliteModel).not().assertUndefined();
          }
        });
      } catch (error) {
        console.log("loadModelFromBufferContextCpuThreadAffinityCoreListNonEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextNnrtPerformanceModeNone001
     * @tc.number CoverageSupplement3Test_037
     * @tc.desc   loadModelFromBuffer Context nnrt performanceMode PERFORMANCE_NONE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextNnrtPerformanceModeNone001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromBufferContextNnrtPerformanceModeNone001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          return;
        }
        let syscontext: common.Context = globalThis.context;
        let modelName = 'ml_face_isface.ms';
        syscontext.resourceManager.getRawFileContent(modelName, async (error: BusinessError, model_buffer: Uint8Array) => {
          if (error == null) {
            let context: mindSporeLite.Context = {};
            context.target = ["nnrt"];
            context.nnrt = {};
            context.nnrt.performanceMode = mindSporeLite.PerformanceMode.PERFORMANCE_NONE;
            context.nnrt.deviceID = all_devices[0].deviceID();
            let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context);
            expect(msliteModel).not().assertNull();
            expect(msliteModel).not().assertUndefined();
          }
        });
      } catch (error) {
        console.log("loadModelFromBufferContextNnrtPerformanceModeNone001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextNnrtPerformanceModeLow001
     * @tc.number CoverageSupplement3Test_038
     * @tc.desc   loadModelFromBuffer Context nnrt performanceMode PERFORMANCE_LOW test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextNnrtPerformanceModeLow001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromBufferContextNnrtPerformanceModeLow001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          return;
        }
        let syscontext: common.Context = globalThis.context;
        let modelName = 'ml_face_isface.ms';
        syscontext.resourceManager.getRawFileContent(modelName, async (error: BusinessError, model_buffer: Uint8Array) => {
          if (error == null) {
            let context: mindSporeLite.Context = {};
            context.target = ["nnrt"];
            context.nnrt = {};
            context.nnrt.priority = mindSporeLite.Priority.PRIORITY_NONE;
            context.nnrt.performanceMode = mindSporeLite.PerformanceMode.PERFORMANCE_LOW;
            context.nnrt.deviceID = all_devices[0].deviceID();
            let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context);
            expect(msliteModel).not().assertNull();
            expect(msliteModel).not().assertUndefined();
          }
        });
      } catch (error) {
        console.log("loadModelFromBufferContextNnrtPerformanceModeLow001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextNnrtPriorityLow001
     * @tc.number CoverageSupplement3Test_039
     * @tc.desc   loadModelFromBuffer Context nnrt priority LOW test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextNnrtPriorityLow001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromBufferContextNnrtPriorityLow001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          return;
        }
        let syscontext: common.Context = globalThis.context;
        let modelName = 'ml_face_isface.ms';
        syscontext.resourceManager.getRawFileContent(modelName, async (error: BusinessError, model_buffer: Uint8Array) => {
          if (error == null) {
            let context: mindSporeLite.Context = {};
            context.target = ["nnrt"];
            context.nnrt = {};
            context.nnrt.priority = mindSporeLite.Priority.PRIORITY_LOW;
            context.nnrt.deviceID = all_devices[0].deviceID();
            let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context);
            expect(msliteModel).not().assertNull();
            expect(msliteModel).not().assertUndefined();
          }
        });
      } catch (error) {
        console.log("loadModelFromBufferContextNnrtPriorityLow001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextNnrtPriorityMedium001
     * @tc.number CoverageSupplement3Test_040
     * @tc.desc   loadModelFromBuffer Context nnrt priority MEDIUM test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextNnrtPriorityMedium001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromBufferContextNnrtPriorityMedium001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          return;
        }
        let syscontext: common.Context = globalThis.context;
        let modelName = 'ml_face_isface.ms';
        syscontext.resourceManager.getRawFileContent(modelName, async (error: BusinessError, model_buffer: Uint8Array) => {
          if (error == null) {
            let context: mindSporeLite.Context = {};
            context.target = ["nnrt"];
            context.nnrt = {};
            context.nnrt.priority = mindSporeLite.Priority.PRIORITY_MEDIUM;
            context.nnrt.deviceID = all_devices[0].deviceID();
            let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context);
            expect(msliteModel).not().assertNull();
            expect(msliteModel).not().assertUndefined();
          }
        });
      } catch (error) {
        console.log("loadModelFromBufferContextNnrtPriorityMedium001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextNnrtPriorityHigh001
     * @tc.number CoverageSupplement3Test_041
     * @tc.desc   loadModelFromBuffer Context nnrt priority HIGH test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextNnrtPriorityHigh001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromBufferContextNnrtPriorityHigh001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          return;
        }
        let syscontext: common.Context = globalThis.context;
        let modelName = 'ml_face_isface.ms';
        syscontext.resourceManager.getRawFileContent(modelName, async (error: BusinessError, model_buffer: Uint8Array) => {
          if (error == null) {
            let context: mindSporeLite.Context = {};
            context.target = ["nnrt"];
            context.nnrt = {};
            context.nnrt.priority = mindSporeLite.Priority.PRIORITY_HIGH;
            context.nnrt.deviceID = all_devices[0].deviceID();
            let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context);
            expect(msliteModel).not().assertNull();
            expect(msliteModel).not().assertUndefined();
          }
        });
      } catch (error) {
        console.log("loadModelFromBufferContextNnrtPriorityHigh001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextNnrtExtensionsEmptyArray001
     * @tc.number CoverageSupplement3Test_042
     * @tc.desc   loadModelFromBuffer Context nnrt extensions empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextNnrtExtensionsEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromBufferContextNnrtExtensionsEmptyArray001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          return;
        }
        let syscontext: common.Context = globalThis.context;
        let modelName = 'ml_face_isface.ms';
        syscontext.resourceManager.getRawFileContent(modelName, async (error: BusinessError, model_buffer: Uint8Array) => {
          if (error == null) {
            let context: mindSporeLite.Context = {};
            context.target = ["nnrt"];
            context.nnrt = {};
            context.nnrt.deviceID = all_devices[0].deviceID();
            context.nnrt.extensions = [];
            let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context);
            expect(msliteModel).not().assertNull();
            expect(msliteModel).not().assertUndefined();
          }
        });
      } catch (error) {
        console.log("loadModelFromBufferContextNnrtExtensionsEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextNnrtExtensionsNonEmptyArray001
     * @tc.number CoverageSupplement3Test_043
     * @tc.desc   loadModelFromBuffer Context nnrt extensions non-empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextNnrtExtensionsNonEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromBufferContextNnrtExtensionsNonEmptyArray001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          return;
        }
        let syscontext: common.Context = globalThis.context;
        let modelName = 'ml_face_isface.ms';
        syscontext.resourceManager.getRawFileContent(modelName, async (error: BusinessError, model_buffer: Uint8Array) => {
          if (error == null) {
            let context: mindSporeLite.Context = {};
            context.target = ["nnrt"];
            context.nnrt = {};
            context.nnrt.deviceID = all_devices[0].deviceID();
            let extension: mindSporeLite.Extension = {
              name: "test_extension",
              value: model_buffer
            };
            context.nnrt.extensions = [extension];
            let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context);
            expect(msliteModel).not().assertNull();
            expect(msliteModel).not().assertUndefined();
          }
        });
      } catch (error) {
        console.log("loadModelFromBufferContextNnrtExtensionsNonEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextNull001
     * @tc.number CoverageSupplement3Test_044
     * @tc.desc   loadModelFromBuffer context null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromBufferContextNull001");
      try {
        let syscontext: common.Context = globalThis.context;
        let modelName = 'ml_face_isface.ms';
        syscontext.resourceManager.getRawFileContent(modelName, async (error: BusinessError, model_buffer: Uint8Array) => {
          if (error == null) {
            let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, null);
            expect(msliteModel).assertUndefined();
          }
        });
      } catch (error) {
        console.log("loadModelFromBufferContextNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextUndefined001
     * @tc.number CoverageSupplement3Test_045
     * @tc.desc   loadModelFromBuffer context undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromBufferContextUndefined001");
      try {
        let syscontext: common.Context = globalThis.context;
        let modelName = 'ml_face_isface.ms';
        syscontext.resourceManager.getRawFileContent(modelName, async (error: BusinessError, model_buffer: Uint8Array) => {
          if (error == null) {
            let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, undefined);
            expect(msliteModel).assertUndefined();
          }
        });
      } catch (error) {
        console.log("loadModelFromBufferContextUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFdContextCpuThreadAffinityModeBigLittle001
     * @tc.number CoverageSupplement3Test_054
     * @tc.desc   loadModelFromFd Context cpu threadAffinityMode BIG_LITTLE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextCpuThreadAffinityModeBigLittle001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromFdContextCpuThreadAffinityModeBigLittle001");
      try {
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadModelFromFdContextCpuThreadAffinityModeBigLittle001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFdContextCpuThreadAffinityModeHybrid001
     * @tc.number CoverageSupplement3Test_055
     * @tc.desc   loadModelFromFd Context cpu threadAffinityMode HYBRID test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextCpuThreadAffinityModeHybrid001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromFdContextCpuThreadAffinityModeHybrid001");
      try {
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.LITTLE_CORES_FIRST;
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadModelFromFdContextCpuThreadAffinityModeHybrid001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFdContextCpuThreadAffinityCoreListEmptyArray001
     * @tc.number CoverageSupplement3Test_056
     * @tc.desc   loadModelFromFd Context cpu threadAffinityCoreList empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextCpuThreadAffinityCoreListEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromFdContextCpuThreadAffinityCoreListEmptyArray001");
      try {
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.threadAffinityCoreList = [];
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadModelFromFdContextCpuThreadAffinityCoreListEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFdContextCpuThreadAffinityCoreListNonEmptyArray001
     * @tc.number CoverageSupplement3Test_057
     * @tc.desc   loadModelFromFd Context cpu threadAffinityCoreList non-empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextCpuThreadAffinityCoreListNonEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromFdContextCpuThreadAffinityCoreListNonEmptyArray001");
      try {
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.threadAffinityCoreList = [0, 1];
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadModelFromFdContextCpuThreadAffinityCoreListNonEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFdContextNnrtPerformanceModeLow001
     * @tc.number CoverageSupplement3Test_058
     * @tc.desc   loadModelFromFd Context nnrt performanceMode PERFORMANCE_LOW test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextNnrtPerformanceModeLow001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromFdContextNnrtPerformanceModeLow001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.performanceMode = mindSporeLite.PerformanceMode.PERFORMANCE_LOW;
        context.nnrt.deviceID = all_devices[0].deviceID();
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadModelFromFdContextNnrtPerformanceModeLow001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFdContextNnrtPerformanceModeNone001
     * @tc.number CoverageSupplement3Test_059
     * @tc.desc   loadModelFromFd Context nnrt performanceMode PERFORMANCE_NONE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextNnrtPerformanceModeNone001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromFdContextNnrtPerformanceModeNone001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.priority = mindSporeLite.Priority.PRIORITY_NONE;
        context.nnrt.performanceMode = mindSporeLite.PerformanceMode.PERFORMANCE_NONE;
        context.nnrt.deviceID = all_devices[0].deviceID();
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadModelFromFdContextNnrtPerformanceModeNone001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFdContextNnrtPriorityLow001
     * @tc.number CoverageSupplement3Test_060
     * @tc.desc   loadModelFromFd Context nnrt priority LOW test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextNnrtPriorityLow001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromFdContextNnrtPriorityLow001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.priority = mindSporeLite.Priority.PRIORITY_LOW;
        context.nnrt.deviceID = all_devices[0].deviceID();
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadModelFromFdContextNnrtPriorityLow001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFdContextNnrtPriorityMedium001
     * @tc.number CoverageSupplement3Test_061
     * @tc.desc   loadModelFromFd Context nnrt priority MEDIUM test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextNnrtPriorityMedium001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromFdContextNnrtPriorityMedium001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.priority = mindSporeLite.Priority.PRIORITY_MEDIUM;
        context.nnrt.deviceID = all_devices[0].deviceID();
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadModelFromFdContextNnrtPriorityMedium001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFdContextNnrtPriorityHigh001
     * @tc.number CoverageSupplement3Test_062
     * @tc.desc   loadModelFromFd Context nnrt priority HIGH test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextNnrtPriorityHigh001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromFdContextNnrtPriorityHigh001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.priority = mindSporeLite.Priority.PRIORITY_HIGH;
        context.nnrt.deviceID = all_devices[0].deviceID();
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadModelFromFdContextNnrtPriorityHigh001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFdContextNnrtExtensionsEmptyArray001
     * @tc.number CoverageSupplement3Test_063
     * @tc.desc   loadModelFromFd Context nnrt extensions empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextNnrtExtensionsEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromFdContextNnrtExtensionsEmptyArray001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.deviceID = all_devices[0].deviceID();
        context.nnrt.extensions = [];
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadModelFromFdContextNnrtExtensionsEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFdContextNnrtExtensionsNonEmptyArray001
     * @tc.number CoverageSupplement3Test_064
     * @tc.desc   loadModelFromFd Context nnrt extensions non-empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextNnrtExtensionsNonEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromFdContextNnrtExtensionsNonEmptyArray001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let syscontext: common.Context = globalThis.context;
        let modelName = 'ml_face_isface.ms';
        syscontext.resourceManager.getRawFileContent(modelName, async (error: BusinessError, model_buffer: Uint8Array) => {
          if (error == null) {
            let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
            let context: mindSporeLite.Context = {};
            context.target = ["nnrt"];
            context.nnrt = {};
            context.nnrt.deviceID = all_devices[0].deviceID();
            let extension: mindSporeLite.Extension = {
              name: "test_extension",
              value: model_buffer
            };
            context.nnrt.extensions = [extension];
            let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
            fs.closeSync(file);
            expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
          }
        });
      } catch (error) {
        console.log("loadModelFromFdContextNnrtExtensionsNonEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFileContextCpuThreadAffinityModeAffinityMode001
     * @tc.number CoverageSupplement3Test_085
     * @tc.desc   loadTrainModelFromFile Context cpu threadAffinityMode AFFINITY_MODE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileContextCpuThreadAffinityModeAffinityMode001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadTrainModelFromFileContextCpuThreadAffinityModeAffinityMode001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.NO_AFFINITIES;

        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFileContextCpuThreadAffinityModeAffinityMode001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFileContextCpuThreadAffinityModeBigLittle001
     * @tc.number CoverageSupplement3Test_086
     * @tc.desc   loadTrainModelFromFile Context cpu threadAffinityMode BIG_LITTLE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileContextCpuThreadAffinityModeBigLittle001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadTrainModelFromFileContextCpuThreadAffinityModeBigLittle001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;

        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFileContextCpuThreadAffinityModeBigLittle001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFileContextCpuThreadAffinityModeHybrid001
     * @tc.number CoverageSupplement3Test_087
     * @tc.desc   loadTrainModelFromFile Context cpu threadAffinityMode HYBRID test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileContextCpuThreadAffinityModeHybrid001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadTrainModelFromFileContextCpuThreadAffinityModeHybrid001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.LITTLE_CORES_FIRST;

        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFileContextCpuThreadAffinityModeHybrid001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFileContextCpuThreadAffinityCoreListEmptyArray001
     * @tc.number CoverageSupplement3Test_088
     * @tc.desc   loadTrainModelFromFile Context cpu threadAffinityCoreList empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileContextCpuThreadAffinityCoreListEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadTrainModelFromFileContextCpuThreadAffinityCoreListEmptyArray001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.threadAffinityCoreList = [];

        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFileContextCpuThreadAffinityCoreListEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFileContextCpuThreadAffinityCoreListNonEmptyArray001
     * @tc.number CoverageSupplement3Test_089
     * @tc.desc   loadTrainModelFromFile Context cpu threadAffinityCoreList non-empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileContextCpuThreadAffinityCoreListNonEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadTrainModelFromFileContextCpuThreadAffinityCoreListNonEmptyArray001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.threadAffinityCoreList = [0, 1];

        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFileContextCpuThreadAffinityCoreListNonEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromBufferTrainCfgOptimizationLevelO0001
     * @tc.number CoverageSupplement3Test_093
     * @tc.desc   loadTrainModelFromBuffer TrainCfg optimizationLevel O0 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromBufferTrainCfgOptimizationLevelO0001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadTrainModelFromBufferTrainCfgOptimizationLevelO0001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.optimizationLevel = mindSporeLite.OptimizationLevel.O0;
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.threadAffinityCoreList = [0, 1];
        context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.NO_AFFINITIES;
        let syscontext: common.Context = globalThis.context;
        let modelName = 'lenet_train.ms';
        syscontext.resourceManager.getRawFileContent(modelName, async (error: BusinessError, model_buffer: Uint8Array) => {
          if (error == null) {
            let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(model_buffer.buffer, trainCfg, context);
            expect(msliteModel).not().assertNull();
            expect(msliteModel).not().assertUndefined();
          }
        });
      } catch (error) {
        console.log("loadTrainModelFromBufferTrainCfgOptimizationLevelO0001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromBufferTrainCfgOptimizationLevelO2001
     * @tc.number CoverageSupplement3Test_094
     * @tc.desc   loadTrainModelFromBuffer TrainCfg optimizationLevel OPTIMIZE_MEMORY test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromBufferTrainCfgOptimizationLevelO2001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadTrainModelFromBufferTrainCfgOptimizationLevelO2001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.optimizationLevel = mindSporeLite.OptimizationLevel.O2;
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
        let syscontext: common.Context = globalThis.context;
        let modelName = 'lenet_train.ms';
        syscontext.resourceManager.getRawFileContent(modelName, async (error: BusinessError, model_buffer: Uint8Array) => {
          if (error == null) {
            let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(model_buffer.buffer, trainCfg, context);
            expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
          }
        });
      } catch (error) {
        console.log("loadTrainModelFromBufferTrainCfgOptimizationLevelO2001 error: " + JSON.stringify(error));
      }
    });
    
    /**
     * @tc.name   loadTrainModelFromFdTrainCfgOptimizationLevelO2001
     * @tc.number CoverageSupplement3Test_103
     * @tc.desc   loadTrainModelFromFd TrainCfg optimizationLevel O2 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdTrainCfgOptimizationLevelO2001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadTrainModelFromFdTrainCfgOptimizationLevelO2001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.optimizationLevel = mindSporeLite.OptimizationLevel.O2;
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];

        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, trainCfg, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFdTrainCfgOptimizationLevelO2001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFdTrainCfgOptimizationLevelO0001
     * @tc.number CoverageSupplement3Test_104
     * @tc.desc   loadTrainModelFromFd TrainCfg optimizationLevel O0 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdTrainCfgOptimizationLevelO0001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadTrainModelFromFdTrainCfgOptimizationLevelO0001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.optimizationLevel = mindSporeLite.OptimizationLevel.O0;
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];

        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, trainCfg, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFdTrainCfgOptimizationLevelO0001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFileContextNnrtPerformanceModeNone001
     * @tc.number CoverageSupplement3Test_105
     * @tc.desc   loadModelFromFile Context nnrt performanceMode PERFORMANCE_NONE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileContextNnrtPerformanceModeNone001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromFileContextNnrtPerformanceModeNone001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.performanceMode = mindSporeLite.PerformanceMode.PERFORMANCE_NONE;
        context.nnrt.deviceID = all_devices[0].deviceID();
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadModelFromFileContextNnrtPerformanceModeNone001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFileContextNnrtPerformanceModeMedium001
     * @tc.number CoverageSupplement3Test_106
     * @tc.desc   loadModelFromFile Context nnrt performanceMode PERFORMANCE_MEDIUM test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileContextNnrtPerformanceModeMedium001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromFileContextNnrtPerformanceModeMedium001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.performanceMode = mindSporeLite.PerformanceMode.PERFORMANCE_MEDIUM;
        context.nnrt.deviceID = all_devices[0].deviceID();
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadModelFromFileContextNnrtPerformanceModeMedium001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFileContextNnrtPerformanceModeHigh001
     * @tc.number CoverageSupplement3Test_107
     * @tc.desc   loadModelFromFile Context nnrt performanceMode PERFORMANCE_HIGH test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileContextNnrtPerformanceModeHigh001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromFileContextNnrtPerformanceModeHigh001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.performanceMode = mindSporeLite.PerformanceMode.PERFORMANCE_HIGH;
        context.nnrt.deviceID = all_devices[0].deviceID();
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadModelFromFileContextNnrtPerformanceModeHigh001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFileCallbackContextNnrtPerformanceModeMedium001
     * @tc.number CoverageSupplement3Test_108
     * @tc.desc   loadModelFromFile Callback Context nnrt performanceMode PERFORMANCE_MEDIUM test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileCallbackContextNnrtPerformanceModeMedium001', Level.LEVEL1, async (done: Function) => {
      console.log("CoverageSupplement3Test: loadModelFromFileCallbackContextNnrtPerformanceModeMedium001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          done();
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.performanceMode = mindSporeLite.PerformanceMode.PERFORMANCE_MEDIUM;
        context.nnrt.deviceID = all_devices[0].deviceID();
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        console.log("loadModelFromFileCallbackContextNnrtPerformanceModeMedium001 error: " + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileCallbackContextNnrtPerformanceModeHigh001
     * @tc.number CoverageSupplement3Test_109
     * @tc.desc   loadModelFromFile Callback Context nnrt performanceMode PERFORMANCE_HIGH test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileCallbackContextNnrtPerformanceModeHigh001', Level.LEVEL1, async (done: Function) => {
      console.log("CoverageSupplement3Test: loadModelFromFileCallbackContextNnrtPerformanceModeHigh001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          done();
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.performanceMode = mindSporeLite.PerformanceMode.PERFORMANCE_HIGH;
        context.nnrt.deviceID = all_devices[0].deviceID();
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        console.log("loadModelFromFileCallbackContextNnrtPerformanceModeHigh001 error: " + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFileCallbackContextNnrtPerformanceModeExtreme001
     * @tc.number CoverageSupplement3Test_110
     * @tc.desc   loadModelFromFile Callback Context nnrt performanceMode PERFORMANCE_HIGH test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileCallbackContextNnrtPerformanceModeExtreme001', Level.LEVEL1, async (done: Function) => {
      console.log("CoverageSupplement3Test: loadModelFromFileCallbackContextNnrtPerformanceModeExtreme001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          done();
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.performanceMode = mindSporeLite.PerformanceMode.PERFORMANCE_EXTREME;
        context.nnrt.deviceID = all_devices[0].deviceID();
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        console.log("loadModelFromFileCallbackContextNnrtPerformanceModeExtreme001 error: " + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextNnrtPerformanceModeMedium001
     * @tc.number CoverageSupplement3Test_111
     * @tc.desc   loadModelFromBuffer Context nnrt performanceMode PERFORMANCE_MEDIUM test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextNnrtPerformanceModeMedium001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromBufferContextNnrtPerformanceModeMedium001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          return;
        }
        let syscontext: common.Context = globalThis.context;
        let modelName = 'ml_face_isface.ms';
        syscontext.resourceManager.getRawFileContent(modelName, async (error: BusinessError, model_buffer: Uint8Array) => {
          if (error == null) {
            let context: mindSporeLite.Context = {};
            context.target = ["nnrt"];
            context.nnrt = {};
            context.nnrt.performanceMode = mindSporeLite.PerformanceMode.PERFORMANCE_MEDIUM;
            context.nnrt.deviceID = all_devices[0].deviceID();
            let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context);
            expect(msliteModel).not().assertNull();
            expect(msliteModel).not().assertUndefined();
          }
        });
      } catch (error) {
        console.log("loadModelFromBufferContextNnrtPerformanceModeMedium001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextNnrtPerformanceModeHigh001
     * @tc.number CoverageSupplement3Test_112
     * @tc.desc   loadModelFromBuffer Context nnrt performanceMode PERFORMANCE_HIGH test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextNnrtPerformanceModeHigh001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromBufferContextNnrtPerformanceModeHigh001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          return;
        }
        let syscontext: common.Context = globalThis.context;
        let modelName = 'ml_face_isface.ms';
        syscontext.resourceManager.getRawFileContent(modelName, async (error: BusinessError, model_buffer: Uint8Array) => {
          if (error == null) {
            let context: mindSporeLite.Context = {};
            context.target = ["nnrt"];
            context.nnrt = {};
            context.nnrt.performanceMode = mindSporeLite.PerformanceMode.PERFORMANCE_HIGH;
            context.nnrt.deviceID = all_devices[0].deviceID();
            let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context);
            expect(msliteModel).not().assertNull();
            expect(msliteModel).not().assertUndefined();
          }
        });
      } catch (error) {
        console.log("loadModelFromBufferContextNnrtPerformanceModeHigh001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextNnrtPerformanceModeExtreme001
     * @tc.number CoverageSupplement3Test_113
     * @tc.desc   loadModelFromBuffer Context nnrt performanceMode PERFORMANCE_EXTREME test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextNnrtPerformanceModeExtreme001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromBufferContextNnrtPerformanceModeExtreme001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          return;
        }
        let syscontext: common.Context = globalThis.context;
        let modelName = 'ml_face_isface.ms';
        syscontext.resourceManager.getRawFileContent(modelName, async (error: BusinessError, model_buffer: Uint8Array) => {
          if (error == null) {
            let context: mindSporeLite.Context = {};
            context.target = ["nnrt"];
            context.nnrt = {};
            context.nnrt.performanceMode = mindSporeLite.PerformanceMode.PERFORMANCE_EXTREME;
            context.nnrt.deviceID = all_devices[0].deviceID();
            let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context);
            expect(msliteModel).not().assertNull();
            expect(msliteModel).not().assertUndefined();
          }
        });
      } catch (error) {
        console.log("loadModelFromBufferContextNnrtPerformanceModeExtreme001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFdContextNnrtPerformanceModeMedium001
     * @tc.number CoverageSupplement3Test_114
     * @tc.desc   loadModelFromFd Context nnrt performanceMode PERFORMANCE_MEDIUM test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextNnrtPerformanceModeMedium001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromFdContextNnrtPerformanceModeMedium001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.performanceMode = mindSporeLite.PerformanceMode.PERFORMANCE_MEDIUM;
        context.nnrt.deviceID = all_devices[0].deviceID();
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadModelFromFdContextNnrtPerformanceModeMedium001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFdContextNnrtPerformanceModeHigh001
     * @tc.number CoverageSupplement3Test_115
     * @tc.desc   loadModelFromFd Context nnrt performanceMode PERFORMANCE_NONE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextNnrtPerformanceModeHigh001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromFdContextNnrtPerformanceModeHigh001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.performanceMode = mindSporeLite.PerformanceMode.PERFORMANCE_HIGH;
        context.nnrt.deviceID = all_devices[0].deviceID();
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadModelFromFdContextNnrtPerformanceModeHigh001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFdContextNnrtPerformanceModeExtreme001
     * @tc.number CoverageSupplement3Test_116
     * @tc.desc   loadModelFromFd Context nnrt performanceMode PERFORMANCE_EXTREME test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextNnrtPerformanceModeExtreme001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromFdContextNnrtPerformanceModeExtreme001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.performanceMode = mindSporeLite.PerformanceMode.PERFORMANCE_EXTREME;
        context.nnrt.deviceID = all_devices[0].deviceID();
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadModelFromFdContextNnrtPerformanceModeExtreme001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromBufferTrainCfgOptimizationLevelO3001
     * @tc.number CoverageSupplement3Test_117
     * @tc.desc   loadTrainModelFromBuffer TrainCfg optimizationLevel O0 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromBufferTrainCfgOptimizationLevelO3001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadTrainModelFromBufferTrainCfgOptimizationLevelO3001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.optimizationLevel = mindSporeLite.OptimizationLevel.O3;
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.LITTLE_CORES_FIRST;
        let syscontext: common.Context = globalThis.context;
        let modelName = 'lenet_train.ms';
        syscontext.resourceManager.getRawFileContent(modelName, async (error: BusinessError, model_buffer: Uint8Array) => {
          if (error == null) {
            let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(model_buffer.buffer, trainCfg, context);
            expect(msliteModel).not().assertNull();
            expect(msliteModel).not().assertUndefined();
          }
        });
      } catch (error) {
        console.log("loadTrainModelFromBufferTrainCfgOptimizationLevelO3001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromBufferTrainCfgOptimizationLevelAuto001
     * @tc.number CoverageSupplement3Test_118
     * @tc.desc   loadTrainModelFromBuffer TrainCfg optimizationLevel OPTIMIZE_MEMORY test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromBufferTrainCfgOptimizationLevelAuto001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadTrainModelFromBufferTrainCfgOptimizationLevelAuto001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.optimizationLevel = mindSporeLite.OptimizationLevel.AUTO;
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];

        let syscontext: common.Context = globalThis.context;
        let modelName = 'lenet_train.ms';
        syscontext.resourceManager.getRawFileContent(modelName, async (error: BusinessError, model_buffer: Uint8Array) => {
          if (error == null) {
            let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(model_buffer.buffer, trainCfg, context);
            expect(msliteModel).not().assertNull();
            expect(msliteModel).not().assertUndefined();
          }
        });
      } catch (error) {
        console.log("loadTrainModelFromBufferTrainCfgOptimizationLevelAuto001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFdTrainCfgOptimizationLevelO3001
     * @tc.number CoverageSupplement3Test_119
     * @tc.desc   loadTrainModelFromFd TrainCfg optimizationLevel O3 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdTrainCfgOptimizationLevelO3001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadTrainModelFromFdTrainCfgOptimizationLevelO3001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.optimizationLevel = mindSporeLite.OptimizationLevel.O3;
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];

        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, trainCfg, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFdTrainCfgOptimizationLevelO3001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFdTrainCfgOptimizationLevelAuto001
     * @tc.number CoverageSupplement3Test_120
     * @tc.desc   loadTrainModelFromFd TrainCfg optimizationLevel AUTO test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdTrainCfgOptimizationLevelAuto001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadTrainModelFromFdTrainCfgOptimizationLevelAuto001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.optimizationLevel = mindSporeLite.OptimizationLevel.AUTO;
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];

        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, trainCfg, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFdTrainCfgOptimizationLevelAuto001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextCpuThreadAffinityModeBigCoresFirst001
     * @tc.number CoverageSupplement4Test_002
     * @tc.desc   loadModelFromBuffer Context cpu threadAffinityMode BIG_CORES_FIRST test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextCpuThreadAffinityModeBigCoresFirst001', Level.LEVEL1, async(done: Function) => {
      console.log("CoverageSupplement4Test: loadModelFromBufferContextCpuThreadAffinityModeBigCoresFirst001");
      try {
        let syscontext: common.Context = globalThis.context;
        let modelBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent('ml_face_isface.ms');
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
        mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        console.log("loadModelFromBufferContextCpuThreadAffinityModeBigCoresFirst001 error: " + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextCpuThreadAffinityModeLittleCoresFirst001
     * @tc.number CoverageSupplement4Test_003
     * @tc.desc   loadModelFromBuffer Context cpu threadAffinityMode LITTLE_CORES_FIRST test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextCpuThreadAffinityModeLittleCoresFirst001', Level.LEVEL1, async(done: Function) => {
      console.log("CoverageSupplement4Test: loadModelFromBufferContextCpuThreadAffinityModeLittleCoresFirst001");
      try {
        let syscontext: common.Context = globalThis.context;
        let modelBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent('ml_face_isface.ms');
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.LITTLE_CORES_FIRST;
        mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        console.log("loadModelFromBufferContextCpuThreadAffinityModeLittleCoresFirst001 error: " + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.name   loadModelFromBufferContextCpuThreadAffinityNoAffinities001
     * @tc.number CoverageSupplement4Test_004
     * @tc.desc   loadModelFromBuffer Context cpu threadAffinityMode NO_AFFINITIES test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextCpuThreadAffinityNoAffinities001', Level.LEVEL1, async(done: Function) => {
      console.log("CoverageSupplement4Test: loadModelFromBufferContextCpuThreadAffinityNoAffinities001");
      try {
        let syscontext: common.Context = globalThis.context;
        let modelBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent('ml_face_isface.ms');
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.NO_AFFINITIES;
        mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        console.log("loadModelFromBufferContextCpuThreadAffinityNoAffinities001 error: " + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.name   loadModelFromBufferCallbackContextCpuThreadAffinityCoreListEmptyArray001
     * @tc.number CoverageSupplement4Test_005
     * @tc.desc   loadModelFromBuffer Context cpu threadAffinityCoreList empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferCallbackContextCpuThreadAffinityCoreListEmptyArray001', Level.LEVEL1, async(done: Function) => {
      console.log("CoverageSupplement4Test: loadModelFromBufferCallbackContextCpuThreadAffinityCoreListEmptyArray001");
      try {
        let syscontext: common.Context = globalThis.context;
        let modelBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent('ml_face_isface.ms');
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.threadAffinityCoreList = [];
        mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        console.log("loadModelFromBufferCallbackContextCpuThreadAffinityCoreListEmptyArray001 error: " + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.name   loadModelFromBufferCallbackContextNnrtExtensionsEmptyArray001
     * @tc.number CoverageSupplement4Test_006
     * @tc.desc   loadModelFromBuffer Context nnrt extensions empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferCallbackContextNnrtExtensionsEmptyArray001', Level.LEVEL1, async(done: Function) => {
      console.log("CoverageSupplement4Test: loadModelFromBufferCallbackContextNnrtExtensionsEmptyArray001");
      try {
        let syscontext: common.Context = globalThis.context;
        let modelBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent('ml_face_isface.ms');
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          done();
          return;
        }
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.deviceID = all_devices[0].deviceID();
        context.nnrt.extensions = [];
        mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context, (msliteModel: mindSporeLite.Model) => {
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        console.log("loadModelFromBufferCallbackContextNnrtExtensionsEmptyArray001 error: " + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdContextCpuThreadAffinityModeBigCoresFirst001
     * @tc.number CoverageSupplement4Test_010
     * @tc.desc   loadModelFromFd Context cpu threadAffinityMode BIG_CORES_FIRST test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextCpuThreadAffinityModeBigCoresFirst001', Level.LEVEL1, (done: Function) => {
      console.log("CoverageSupplement4Test: loadModelFromFdContextCpuThreadAffinityModeBigCoresFirst001");
      try {
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
        mindSporeLite.loadModelFromFd(file.fd, context, (msliteModel: mindSporeLite.Model) => {
          fs.closeSync(file);
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        console.log("loadModelFromFdContextCpuThreadAffinityModeBigCoresFirst001 error: " + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdContextCpuThreadAffinityModeLittleCoresFirst001
     * @tc.number CoverageSupplement4Test_011
     * @tc.desc   loadModelFromFd Context cpu threadAffinityMode LITTLE_CORES_FIRST test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextCpuThreadAffinityModeLittleCoresFirst001', Level.LEVEL1, (done: Function) => {
      console.log("CoverageSupplement4Test: loadModelFromFdContextCpuThreadAffinityModeLittleCoresFirst001");
      try {
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.LITTLE_CORES_FIRST;
        mindSporeLite.loadModelFromFd(file.fd, context, (msliteModel: mindSporeLite.Model) => {
          fs.closeSync(file);
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        console.log("loadModelFromFdContextCpuThreadAffinityModeLittleCoresFirst001 error: " + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdContextCpuThreadAffinityNoAffinities001
     * @tc.number CoverageSupplement4Test_012
     * @tc.desc   loadModelFromFd Context cpu threadAffinityMode NO_AFFINITIES test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextCpuThreadAffinityNoAffinities001', Level.LEVEL1, (done: Function) => {
      console.log("CoverageSupplement4Test: loadModelFromFdContextCpuThreadAffinityNoAffinities001");
      try {
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.NO_AFFINITIES;
        mindSporeLite.loadModelFromFd(file.fd, context, (msliteModel: mindSporeLite.Model) => {
          fs.closeSync(file);
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        console.log("loadModelFromFdContextCpuThreadAffinityNoAffinities001 error: " + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdCallbackContextCpuThreadAffinityCoreListEmptyArray001
     * @tc.number CoverageSupplement4Test_013
     * @tc.desc   loadModelFromFd Context cpu threadAffinityCoreList empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdCallbackContextCpuThreadAffinityCoreListEmptyArray001', Level.LEVEL1, (done: Function) => {
      console.log("CoverageSupplement4Test: loadModelFromFdCallbackContextCpuThreadAffinityCoreListEmptyArray001");
      try {
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.threadAffinityCoreList = [];
        mindSporeLite.loadModelFromFd(file.fd, context, (msliteModel: mindSporeLite.Model) => {
          fs.closeSync(file);
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        console.log("loadModelFromFdCallbackContextCpuThreadAffinityCoreListEmptyArray001 error: " + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdCallbackContextNnrtPerformanceModeHigh001
     * @tc.number CoverageSupplement4Test_0141
     * @tc.desc   loadModelFromFd Context nnrt performanceMode PERFORMANCE_HIGH test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdCallbackContextNnrtPerformanceModeHigh001', Level.LEVEL1, async(done: Function) => {
      console.log("CoverageSupplement4Test: loadModelFromFdCallbackContextNnrtPerformanceModeHigh001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          done();
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.priority = mindSporeLite.Priority.PRIORITY_LOW;
        context.nnrt.performanceMode = mindSporeLite.PerformanceMode.PERFORMANCE_HIGH;
        context.nnrt.deviceID = all_devices[0].deviceID();
        mindSporeLite.loadModelFromFd(file.fd, context, (msliteModel: mindSporeLite.Model) => {
          fs.closeSync(file);
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        console.log("loadModelFromFdCallbackContextNnrtPerformanceModeHigh001 error: " + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdCallbackContextNnrtPerformanceModeLow001
     * @tc.number CoverageSupplement4Test_014
     * @tc.desc   loadModelFromFd Context nnrt performanceMode PERFORMANCE_LOW test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdCallbackContextNnrtPerformanceModeLow001', Level.LEVEL1, async(done: Function) => {
      console.log("CoverageSupplement4Test: loadModelFromFdCallbackContextNnrtPerformanceModeLow001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          done();
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.priority = mindSporeLite.Priority.PRIORITY_MEDIUM;
        context.nnrt.performanceMode = mindSporeLite.PerformanceMode.PERFORMANCE_LOW;
        context.nnrt.deviceID = all_devices[0].deviceID();
        mindSporeLite.loadModelFromFd(file.fd, context, (msliteModel: mindSporeLite.Model) => {
          fs.closeSync(file);
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        console.log("loadModelFromFdCallbackContextNnrtPerformanceModeLow001 error: " + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdCallbackContextNnrtPriorityHigh001
     * @tc.number CoverageSupplement4Test_0151
     * @tc.desc   loadModelFromFd Context nnrt priority PRIORITY_HIGH test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdCallbackContextNnrtPriorityHigh001', Level.LEVEL1, async(done: Function) => {
      console.log("CoverageSupplement4Test: loadModelFromFdCallbackContextNnrtPriorityHigh001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          done();
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.performanceMode = mindSporeLite.PerformanceMode.PERFORMANCE_NONE;
        context.nnrt.performanceMode = mindSporeLite.PerformanceMode.PERFORMANCE_MEDIUM;
        context.nnrt.priority = mindSporeLite.Priority.PRIORITY_HIGH;
        context.nnrt.deviceID = all_devices[0].deviceID();
        mindSporeLite.loadModelFromFd(file.fd, context, (msliteModel: mindSporeLite.Model) => {
          fs.closeSync(file);
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        console.log("loadModelFromFdCallbackContextNnrtPriorityHigh001 error: " + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdContextNnrtPriorityNone001
     * @tc.number CoverageSupplement4Test_015
     * @tc.desc   loadModelFromFd Context nnrt priority PRIORITY_NONE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextNnrtPriorityNone001', Level.LEVEL1, async(done: Function) => {
      console.log("CoverageSupplement4Test: loadModelFromFdContextNnrtPriorityNone001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          done();
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.performanceMode = mindSporeLite.PerformanceMode.PERFORMANCE_EXTREME;
        context.nnrt.priority = mindSporeLite.Priority.PRIORITY_NONE;
        context.nnrt.deviceID = all_devices[0].deviceID();
        mindSporeLite.loadModelFromFd(file.fd, context, (msliteModel: mindSporeLite.Model) => {
          fs.closeSync(file);
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        console.log("loadModelFromFdContextNnrtPriorityNone001 error: " + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdCallbackContextNnrtExtensionsEmptyArray001
     * @tc.number CoverageSupplement4Test_016
     * @tc.desc   loadModelFromFd Context nnrt extensions empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdCallbackContextNnrtExtensionsEmptyArray001', Level.LEVEL1, async(done: Function) => {
      console.log("CoverageSupplement4Test: loadModelFromFdCallbackContextNnrtExtensionsEmptyArray001");
      try {
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          done();
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.deviceID = all_devices[0].deviceID();
        context.nnrt.extensions = [];
        mindSporeLite.loadModelFromFd(file.fd, context, (msliteModel: mindSporeLite.Model) => {
          fs.closeSync(file);
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        console.log("loadModelFromFdCallbackContextNnrtExtensionsEmptyArray001 error: " + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.name   loadModelFromFdCallbackContextNnrtExtensionsNonEmptyArray001
     * @tc.number CoverageSupplement4Test_017
     * @tc.desc   loadModelFromFd Context nnrt extensions non-empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdCallbackContextNnrtExtensionsNonEmptyArray001', Level.LEVEL1, async(done: Function) => {
      console.log("CoverageSupplement4Test: loadModelFromFdCallbackContextNnrtExtensionsNonEmptyArray001");
      try {
        let syscontext: common.Context = globalThis.context;
        let modelBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent('ml_face_isface.ms');
        let all_devices = await mindSporeLite.getAllNNRTDeviceDescriptions();
        if (all_devices == null || all_devices.length == 0) {
          console.log('=========no NPU device,skip testcase==========');
          done();
          return;
        }
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["nnrt"];
        context.nnrt = {};
        context.nnrt.deviceID = all_devices[0].deviceID();
        let extension: mindSporeLite.Extension = {
          name: "test_extension",
          value: modelBuffer
        };
        context.nnrt.extensions = [extension];
        mindSporeLite.loadModelFromFd(file.fd, context, (msliteModel: mindSporeLite.Model) => {
          fs.closeSync(file);
          expect(msliteModel).not().assertNull();
          expect(msliteModel).not().assertUndefined();
          done();
        });
      } catch (error) {
        console.log("loadModelFromFdCallbackContextNnrtExtensionsNonEmptyArray001 error: " + JSON.stringify(error));
        done();
      }
    });

    // 4. loadTrainModelFromBuffer API 测试 - Promise 版本 - Context 属性覆盖
    /**
     * @tc.name   loadTrainModelFromBufferContextCpuThreadAffinityCoreListEmptyArray001
     * @tc.number CoverageSupplement4Test_022
     * @tc.desc   loadTrainModelFromBuffer Context cpu threadAffinityCoreList empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromBufferContextCpuThreadAffinityCoreListEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement4Test: loadTrainModelFromBufferContextCpuThreadAffinityCoreListEmptyArray001");
      try {
        let syscontext: common.Context = globalThis.context;
        let modelBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent('ml_face_isface.ms');
        let cfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.threadAffinityCoreList = [];
        let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer, cfg, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromBufferContextCpuThreadAffinityCoreListEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    // 5. loadTrainModelFromFd API 测试 - Promise 版本 - Context 属性覆盖
    /**
     * @tc.name   loadTrainModelFromFdContextTargetEmptyArray001
     * @tc.number CoverageSupplement4Test_023
     * @tc.desc   loadTrainModelFromFd Context target empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdContextTargetEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement4Test: loadTrainModelFromFdContextTargetEmptyArray001");
      try {
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let cfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = [];
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, cfg, context);
        fs.closeSync(file);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFdContextTargetEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFdContextCpuThreadAffinityModeBigCoresFirst001
     * @tc.number CoverageSupplement4Test_024
     * @tc.desc   loadTrainModelFromFd Context cpu threadAffinityMode BIG_CORES_FIRST test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdContextCpuThreadAffinityModeBigCoresFirst001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement4Test: loadTrainModelFromFdContextCpuThreadAffinityModeBigCoresFirst001");
      try {
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let cfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, cfg, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFdContextCpuThreadAffinityModeBigCoresFirst001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFdContextCpuThreadAffinityModeLittleCoresFirst001
     * @tc.number CoverageSupplement4Test_025
     * @tc.desc   loadTrainModelFromFd Context cpu threadAffinityMode LITTLE_CORES_FIRST test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdContextCpuThreadAffinityModeLittleCoresFirst001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement4Test: loadTrainModelFromFdContextCpuThreadAffinityModeLittleCoresFirst001");
      try {
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let cfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.LITTLE_CORES_FIRST;
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, cfg, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFdContextCpuThreadAffinityModeLittleCoresFirst001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFdContextCpuThreadAffinityNoAffinities001
     * @tc.number CoverageSupplement4Test_026
     * @tc.desc   loadTrainModelFromFd Context cpu threadAffinityMode NO_AFFINITIES test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdContextCpuThreadAffinityNoAffinities001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement4Test: loadTrainModelFromFdContextCpuThreadAffinityNoAffinities001");
      try {
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let cfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.NO_AFFINITIES;
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, cfg, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFdContextCpuThreadAffinityNoAffinities001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFdContextCpuThreadAffinityCoreListEmptyArray001
     * @tc.number CoverageSupplement4Test_027
     * @tc.desc   loadTrainModelFromFd Context cpu threadAffinityCoreList empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdContextCpuThreadAffinityCoreListEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement4Test: loadTrainModelFromFdContextCpuThreadAffinityCoreListEmptyArray001");
      try {
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let cfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.threadAffinityCoreList = [];
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, cfg, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFdContextCpuThreadAffinityCoreListEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFdContextCpuThreadAffinityCoreListNonEmptyArray001
     * @tc.number CoverageSupplement4Test_028
     * @tc.desc   loadTrainModelFromFd Context cpu threadAffinityCoreList non-empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdContextCpuThreadAffinityCoreListNonEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement4Test: loadTrainModelFromFdContextCpuThreadAffinityCoreListNonEmptyArray001");
      try {
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let cfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.threadAffinityCoreList = [0];
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, cfg, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFdContextCpuThreadAffinityCoreListNonEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    // 5. loadTrainModelFromFile API 测试
    /**
     * @tc.name   loadTrainModelFromFileTrainCfgLossNameEmptyArray001
     * @tc.number CoverageSupplement3Test_083
     * @tc.desc   loadTrainModelFromFile TrainCfg lossName empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileTrainCfgLossNameEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadTrainModelFromFileTrainCfgLossNameEmptyArray001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.lossName = [];
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFileTrainCfgLossNameEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFileContextTargetEmptyArray001
     * @tc.number CoverageSupplement3Test_084
     * @tc.desc   loadTrainModelFromFile Context target empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileContextTargetEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadTrainModelFromFileContextTargetEmptyArray001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = [];
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, trainCfg, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFileContextTargetEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFileModelEmptyString001
     * @tc.number CoverageSupplement3Test_090
     * @tc.desc   loadTrainModelFromFile model empty string test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFileModelEmptyString001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadTrainModelFromFileModelEmptyString001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let msliteModel = await mindSporeLite.loadTrainModelFromFile("", trainCfg, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFileModelEmptyString001 error: " + JSON.stringify(error));
      }
    });

    // 6. loadTrainModelFromBuffer API 测试
    /**
     * @tc.name   loadTrainModelFromBufferTrainCfgLossNameEmptyArray001
     * @tc.number CoverageSupplement3Test_091
     * @tc.desc   loadTrainModelFromBuffer TrainCfg lossName empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromBufferTrainCfgLossNameEmptyArray001', Level.LEVEL1, async (done:()=>void) => {
      console.log("CoverageSupplement3Test: loadTrainModelFromBufferTrainCfgLossNameEmptyArray001");
      try {
        let syscontext: common.Context = globalThis.context;
        let modelBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent('ml_face_isface.ms');
        let cfg: mindSporeLite.TrainCfg = {};
        cfg.lossName = [""];
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer, cfg, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromBufferTrainCfgLossNameEmptyArray001 error: " + JSON.stringify(error));
      }
      done();
    });

    /**
     * @tc.name   loadTrainModelFromBufferTrainCfgLossNameNonEmptyArray001
     * @tc.number CoverageSupplement3Test_092
     * @tc.desc   loadTrainModelFromBuffer TrainCfg lossName non-empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromBufferTrainCfgLossNameNonEmptyArray001', Level.LEVEL1, async (done:()=>void) => {
      console.log("CoverageSupplement3Test: loadTrainModelFromBufferTrainCfgLossNameNonEmptyArray001");
      try {
        let syscontext: common.Context = globalThis.context;
        let modelBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent('ml_face_isface.ms');
        let cfg: mindSporeLite.TrainCfg = {};
        cfg.lossName = ["CrossEntropy"];
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer, cfg, context);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromBufferTrainCfgLossNameNonEmptyArray001 error: " + JSON.stringify(error));
      }
      done();
    });

    /**
     * @tc.name   loadTrainModelFromBufferContextTargetEmptyArray001
     * @tc.number CoverageSupplement3Test_095
     * @tc.desc   loadTrainModelFromBuffer Context target empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromBufferContextTargetEmptyArray001', Level.LEVEL1, async (done:()=>void) => {
      console.log("CoverageSupplement3Test: loadTrainModelFromBufferContextTargetEmptyArray001");
      try {
        let syscontext: common.Context = globalThis.context;
        let modelBuffer: Uint8Array = await syscontext.resourceManager.getRawFileContent('ml_face_isface.ms');
        let cfg: mindSporeLite.TrainCfg = {};
        let context: mindSporeLite.Context = {};
        context.target = [];
        let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer, cfg, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromBufferContextTargetEmptyArray001 error: " + JSON.stringify(error));
      }
      done();
    });

    // 7. loadTrainModelFromFd API 测试
    /**
     * @tc.name   loadTrainModelFromFdTrainCfgLossNameEmptyArray001
     * @tc.number CoverageSupplement3Test_101
     * @tc.desc   loadTrainModelFromFd TrainCfg lossName empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdTrainCfgLossNameEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadTrainModelFromFdTrainCfgLossNameEmptyArray001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.lossName = [];
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, trainCfg, context);
        fs.closeSync(file);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFdTrainCfgLossNameEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadTrainModelFromFdTrainCfgLossNameNonEmptyArray001
     * @tc.number CoverageSupplement3Test_102
     * @tc.desc   loadTrainModelFromFd TrainCfg lossName non-empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadTrainModelFromFdTrainCfgLossNameNonEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadTrainModelFromFdTrainCfgLossNameNonEmptyArray001");
      try {
        let trainCfg: mindSporeLite.TrainCfg = {};
        trainCfg.lossName = ["CrossEntropy"];
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let model_file = globalThis.abilityContext.filesDir + "/" + "lenet_train.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, trainCfg, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadTrainModelFromFdTrainCfgLossNameNonEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFileContextTargetEmptyArray001
     * @tc.number CoverageSupplement3Test_013
     * @tc.desc   loadModelFromFile Context target empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileContextTargetEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromFileContextTargetEmptyArray001");
      try {
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let context: mindSporeLite.Context = {};
        context.target = [];
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadModelFromFileContextTargetEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFileModelNull001
     * @tc.number CoverageSupplement3Test_014
     * @tc.desc   loadModelFromFile model null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileModelNull001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromFileModelNull001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let msliteModel = await mindSporeLite.loadModelFromFile(null, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadModelFromFileModelNull001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFileModelUndefined001
     * @tc.number CoverageSupplement3Test_015
     * @tc.desc   loadModelFromFile model undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileModelUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromFileModelUndefined001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let msliteModel = await mindSporeLite.loadModelFromFile(undefined, context);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadModelFromFileModelUndefined001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFileContextUndefined001
     * @tc.number CoverageSupplement3Test_016
     * @tc.desc   loadModelFromFile context undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFileContextUndefined001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromFileContextUndefined001");
      try {
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let msliteModel = await mindSporeLite.loadModelFromFile(model_file, undefined);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadModelFromFileContextUndefined001 error: " + JSON.stringify(error));
      }
    });
    
    // 3. loadModelFromBuffer API 测试 - Promise 版本
    /**
     * @tc.name   loadModelFromBufferContextTargetEmptyArray001
     * @tc.number CoverageSupplement3Test_031
     * @tc.desc   loadModelFromBuffer Context target empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromBufferContextTargetEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromBufferContextTargetEmptyArray001");
      try {
        let syscontext: common.Context = globalThis.context;
        let modelName = 'ml_face_isface.ms';
        syscontext.resourceManager.getRawFileContent(modelName, async (error: BusinessError, model_buffer: Uint8Array) => {
          if (error == null) {
            let context: mindSporeLite.Context = {};
            context.target = [];
            let msliteModel = await mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context);
            expect(msliteModel).assertUndefined();
          }
        });
      } catch (error) {
        console.log("loadModelFromBufferContextTargetEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    // 4. loadModelFromFd API 测试 - Promise 版本
    /**
     * @tc.name   loadModelFromFdContextTargetEmptyArray001
     * @tc.number CoverageSupplement3Test_052
     * @tc.desc   loadModelFromFd Context target empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextTargetEmptyArray001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromFdContextTargetEmptyArray001");
      try {
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = [];
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
        fs.closeSync(file);
        expect(msliteModel).assertUndefined();
      } catch (error) {
        console.log("loadModelFromFdContextTargetEmptyArray001 error: " + JSON.stringify(error));
      }
    });

    /**
     * @tc.name   loadModelFromFdContextCpuThreadAffinityModeAffinityMode001
     * @tc.number CoverageSupplement3Test_053
     * @tc.desc   loadModelFromFd Context cpu threadAffinityMode AFFINITY_MODE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('loadModelFromFdContextCpuThreadAffinityModeAffinityMode001', Level.LEVEL1, async () => {
      console.log("CoverageSupplement3Test: loadModelFromFdContextCpuThreadAffinityModeAffinityMode001");
      try {
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_face_isface.ms";
        let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        context.cpu = {};
        context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.NO_AFFINITIES;
        let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
        fs.closeSync(file);
        expect(msliteModel).not().assertNull();
        expect(msliteModel).not().assertUndefined();
      } catch (error) {
        console.log("loadModelFromFdContextCpuThreadAffinityModeAffinityMode001 error: " + JSON.stringify(error));
      }
    });

    // 14. MSTensor.setData 测试用例
    /**
     * @tc.name   mstensorSetDataInputArrayNull001
     * @tc.number CoverageSupplementTest_028
     * @tc.desc   MSTensor setData input array null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('mstensorSetDataInputArrayNull001', Level.LEVEL1, () => {
      console.log("CoverageSupplementTest: mstensorSetDataInputArrayNull001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"];
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_ocr_cn.ms";
        mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
          if (msliteModel !== null) {
            let modelInputs: mindSporeLite.MSTensor[] = msliteModel.getInputs();
            if (modelInputs.length > 0) {
              try {
                modelInputs[0].setData(null);

              } catch (error) {
                expect(true).assertFalse();
                console.log("mstensorSetDataInputArrayNull001 setData error: " + JSON.stringify(error));
              }
            }
          }
        });
      } catch (error) {
        console.log("mstensorSetDataInputArrayNull001 error: " + JSON.stringify(error));
      }
    });
    
    // 16. MSTensor.setData API 测试 - 参数覆盖
    /**
     * @tc.name   mstensorSetDataInputArrayUndefined001
     * @tc.number CoverageSupplement2Test_094
     * @tc.desc   MSTensor setData inputArray undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('mstensorSetDataInputArrayUndefined001', Level.LEVEL1, () => {
      console.log("CoverageSupplement2Test: mstensorSetDataInputArrayUndefined001");
      try {
        let context: mindSporeLite.Context = {};
        context.target = ["cpu"]
        let model_file = globalThis.abilityContext.filesDir + "/" + "ml_ocr_cn.ms";
        mindSporeLite.loadModelFromFile(model_file, context, (mslite: mindSporeLite.Model) => {
          if (mslite !== null) {
            let modelInputs: mindSporeLite.MSTensor[] = mslite.getInputs();
            if (modelInputs.length > 0) {
              try {
                modelInputs[0].setData(undefined);
                expect(true).assertFalse();
              } catch (error) {
                console.log("mstensorSetDataInputArrayUndefined001 setData error: " + JSON.stringify(error));
              }
            }
          }
        });
      } catch (error) {
        console.log("mstensorSetDataInputArrayUndefined001 error: " + JSON.stringify(error));
      }
    });

  })
}
