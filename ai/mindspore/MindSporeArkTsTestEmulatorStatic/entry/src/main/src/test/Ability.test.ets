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
    let dotProduct = 0.0;
    let vec1Magnitude = 0.0;
    let vec2Magnitude = 0.0;
    for (let i = 0; i < vec1.length; i++) {
        dotProduct += vec1[i] * vec2[i];
        vec1Magnitude += vec1[i] * vec1[i];
        vec2Magnitude += vec2[i] * vec2[i];
    }
    vec1Magnitude = Math.sqrt(vec1Magnitude);
    vec2Magnitude = Math.sqrt(vec2Magnitude);
    return dotProduct / (vec1Magnitude * vec2Magnitude);
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


export default function abilityTest() {

    describe("abilityTest", (): void => {
        let abilityContext: Context;
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
        abilityContext = abilityDelegator.getAppContext()
        hilog.info(domain, tag, '%{public}s', 'describe start!!!');
        let res: resourceManager.ResourceManager;
        let inputBuffer0: Uint8Array;
        let inputBuffer1: Uint8Array;
        let inputBuffer_isface: Uint8Array;
        let outputBuffer_isface: Uint8Array;
        let ml_face_buffer: Uint8Array;
        let lenet_train_buffer: Uint8Array;
        let ml_face_isface_buffer: Uint8Array;
        let ml_face_isface_input_buffer: Uint8Array;
        let ml_ocr_cn_buffer: Uint8Array;
        let dir = abilityContext.filesDir + "/";

        beforeAll(() => {

            res = abilityContext.resourceManager
            hilog.info(domain, tag, '%{public}s', 'start run testcase before all');

            try {
                let ml_face_isface_file = dir + "ml_face_isface.ms";
                hilog.info(domain, tag, '%{public}s', 'start get ml_face_isface.ms buffer!!!');
                abilityContext.resourceManager.getRawFileContent("ml_face_isface.ms", (error: BusinessError<void> | null, model_buffer: Uint8Array | undefined) => {
                    if (error != null) {
                        //getRawFileDescriptor运行失败
                        hilog.info(domain, tag, '%{public}s', 'get ml_face_isface.ms fail!!!');
                    } else {
                        //getRawFileDescriptor运行成功
                        let file = fs.openSync(ml_face_isface_file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
                        if (model_buffer?.buffer !== undefined){
                            ml_face_isface_buffer = model_buffer!;
                            fs.writeSync(file.fd, model_buffer!.buffer);
                            hilog.info(domain, tag, '%{public}s', 'copy ml_face_isface.ms sandbox success!!!');
                        }
                        else{
                            hilog.info(domain, tag, '%{public}s', 'copy ml_face_isface.ms sandbox fail!!!');
                        }
                        fs.closeSync(file);
                    }
                });

                let ml_face_isface_input_file = dir + "ml_face_isface_0.input";
                hilog.info(domain, tag, '%{public}s', 'start get ml_face_isface_0.input buffer!!!');
                abilityContext.resourceManager.getRawFileContent("ml_face_isface_0.input", (error: BusinessError<void> | null, model_buffer: Uint8Array | undefined) => {
                    if (error != null) {
                        //getRawFileDescriptor运行失败
                        hilog.info(domain, tag, '%{public}s', 'start run testcase!!!_7');
                    } else {
                        //getRawFileDescriptor运行成功
                        let file = fs.openSync(ml_face_isface_input_file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
                        if (model_buffer?.buffer !== undefined){
                            ml_face_isface_input_buffer = model_buffer!;
                            fs.writeSync(file.fd, model_buffer!.buffer);
                            hilog.info(domain, tag, '%{public}s', 'copy ml_face_isface_0.input sandbox success!!!');
                        }
                        else{
                            hilog.info(domain, tag, '%{public}s', 'copy ml_face_isface_0.input sandbox fail!!!');
                        }
                        fs.closeSync(file);
                    }
                });

                let ml_ocr_model_file = dir + "ml_ocr_cn.ms";
                hilog.info(domain, tag, '%{public}s', 'start get ml_ocr_cn.ms buffer!!!');
                abilityContext.resourceManager.getRawFileContent("ml_ocr_cn.ms", (error: BusinessError<void> | null, model_buffer: Uint8Array | undefined) => {
                    if (error != null) {
                        //getRawFileDescriptor运行失败
                        hilog.info(domain, tag, '%{public}s', 'get ml_ocr_cn.ms fail!!!');
                    } else {
                        //getRawFileDescriptor运行成功
                        let file = fs.openSync(ml_ocr_model_file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
                        if (model_buffer?.buffer !== undefined){
                            ml_ocr_cn_buffer = model_buffer!;
                            fs.writeSync(file.fd, model_buffer!.buffer);
                            hilog.info(domain, tag, '%{public}s', 'copy ml_ocr_cn.ms sandbox success!!!');
                        }
                        else{
                            hilog.info(domain, tag, '%{public}s', 'copy ml_ocr_cn.ms sandbox fail!!!');
                        }
                        fs.closeSync(file);
                    }
                });
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'load model or data fail!!!' + error);
            }
        })

        beforeEach(async () => {
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

            let ml_face_isface_input = dir + "ml_face_isface_0.input";
            let ml_face_isface_input_return = await fs.access(ml_face_isface_input, fs.AccessModeType.EXIST)
            if (ml_face_isface_input_return) {
                hilog.info(domain, tag, '%{public}s', "ml_face_isface_0.input file exists:" + ml_face_isface_input_return.toString());
            }else{
                hilog.info(domain, tag, '%{public}s', "ml_face_isface_0.input file not exists:" + ml_face_isface_input_return.toString());
                hilog.info(domain, tag, '%{public}s', "Wait for the file copy to complete.");
                // 延时等待模型拷贝完成，单位是毫秒，1秒（s）=1000毫秒（ms）
                sleep(6000);
            }

            let ml_ocr_cn_model = dir + "ml_ocr_cn.ms";
            let ml_ocr_cn_model_return = await fs.access(ml_ocr_cn_model, fs.AccessModeType.EXIST)
            if (ml_ocr_cn_model_return) {
                hilog.info(domain, tag, '%{public}s', "ml_ocr_cn.ms file exists:" + ml_ocr_cn_model_return.toString());
            }else{
                hilog.info(domain, tag, '%{public}s', "ml_ocr_cn.ms file not exists:" + ml_ocr_cn_model_return.toString());
                hilog.info(domain, tag, '%{public}s', "Wait for the file copy to complete.");
                // 延时等待模型拷贝完成，单位是毫秒，1秒（s）=1000毫秒（ms）
                sleep(6000);
            }
        })

        /**
         * @tc.number Test_Accuracy_static
         * @tc.name   Test_Accuracy_static
         * @tc.desc   精度测试示例代码
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_Accuracy_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE Test_Accuracy_static test");

            let x =[0.55,0.55,0.55,0.55,0.55]
            let y =[0.55,0.55,0.55,0.55,0.55]
            let s = cosineSimilarity(x, y)
            let z = comparePrecisionAbs(x, y)
            expect(s == 0.9999999999999999).assertTrue();
            expect(z).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE start Comparison Accuracy===========");
            hilog.info(domain, tag, '%{public}s', s.toString())
            hilog.info(domain, tag, '%{public}s', z.toString())
            hilog.info(domain, tag, '%{public}s', "==========MSLITE Comparison Accuracy end==========");
            done();
        })

        /**
         * @tc.number Test_load_model_param_model_buffer_emulator_static
         * @tc.name   Test_load_model_param_model_buffer_emulator_static
         * @tc.desc: 正常场景：模拟器，ModelBuild，调用buffer方法，正常推理
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_buffer_emulator_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_param_model_buffer_emulator_static");
            let modelName = 'ml_face_isface.ms';
            let inputName = 'ml_face_isface_0.input';
            let inputBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let modelBuffer = await abilityContext.resourceManager.getRawFileContent(modelName);
            let context: mindSporeLite.Context = {};
            context.target = ["cpu"];
            let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
            expect(modelInputs[0].name.toString()).assertEqual("data");
            expect(modelInputs[0].shape.toString()).assertEqual("1,48,48,3");;
            expect(modelInputs[0].elementNum.toString()).assertEqual("6912");
            expect(modelInputs[0].dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
            expect(modelInputs[0].format).assertEqual(mindSporeLite.Format.NHWC);
            expect(modelInputs[0].dataSize.toString()).assertEqual("27648");
            modelInputs[0].setData(inputBuffer.buffer);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE predict start=====');
            let modelOutputs = await msliteModel.predict(modelInputs);
            expect(modelOutputs !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array start=====');
            let output0 = new Float32Array(modelOutputs[0].getData());
            hilog.info(domain, tag, '%{public}s', 'output0.length:' + output0.length);
            for (let i = 0; i < 2; i++) {
                hilog.info(domain, tag, '%{public}s', output0[i].toString());
                expect(output0[i].toString() !== null).assertTrue();
            }
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        });

        /**
         * @tc.number Test_load_model_param_model_fd_emulator_static
         * @tc.name   Test_load_model_param_model_fd_emulator_static
         * @tc.desc: 正常场景：模拟器，ModelBuild，调用fd方法，正常推理
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_fd_emulator_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_param_model_fd_emulator_static");
            let inputName = 'ml_face_isface_0.input';
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let inputBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel start=====');
            let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
            let msliteModel = await mindSporeLite.loadModelFromFd(file.fd);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
            modelInputs[0].setData(inputBuffer.buffer);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE predict start=====');
            let modelOutputs = await msliteModel.predict(modelInputs);
            expect(modelOutputs !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array start=====');
            let output0 = new Float32Array(modelOutputs[0].getData());
            hilog.info(domain, tag, '%{public}s', 'output0.length:' + output0.length);
            for (let i = 0; i < 2; i++) {
                hilog.info(domain, tag, '%{public}s', output0[i].toString());
                expect(output0[i].toString() !== null).assertTrue();
            }
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        });

        /**
         * @tc.number Test_load_model_param_model_path_emulator_static
         * @tc.name   Test_load_model_param_model_path_emulator_static
         * @tc.desc: 正常场景：模拟器，ModelBuild，调用loadModelFromFile方法，正常推理
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_emulator_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_param_model_path_emulator_static");
            let inputName = 'ml_face_isface_0.input';
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let inputBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let context: mindSporeLite.Context = {};
            context.target = ["cpu"];
            context.cpu = {};
            context.cpu = {
                "threadNum": 1,
            }
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel start=====');
            let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
            modelInputs[0].setData(inputBuffer.buffer);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE predict start=====');
            let modelOutputs = await msliteModel.predict(modelInputs);
            expect(modelOutputs !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array start=====');
            let output0 = new Float32Array(modelOutputs[0].getData());
            expect(output0.length).assertLarger(0);
            hilog.info(domain, tag, '%{public}s', 'output0.length:' + output0.length);
            for (let i = 0; i < 2; i++) {
                hilog.info(domain, tag, '%{public}s', output0[i].toString());
                expect(output0[i].toString() !== null).assertTrue();
            }
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        });

        /**
         * @tc.number Test_load_model_param_model_path_settings_threads_emulator_static_001
         * @tc.name   Test_load_model_param_model_path_settings_threads_emulator_static_001
         * @tc.desc: 正常场景：模拟器，Context设置CPU，4线程
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_settings_threads_emulator_static_001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_param_model_path_settings_threads_emulator_static_001");
            let inputName = 'ml_face_isface_0.input';
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let inputBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let context: mindSporeLite.Context = {};
            context.target = ["cpu"];
            context.cpu = {
                "threadNum": 4,
            };
            let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
            modelInputs[0].setData(inputBuffer.buffer);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE predict start=====');
            let modelOutputs = await msliteModel.predict(modelInputs);
            expect(modelOutputs !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array start=====');
            let output0 = new Float32Array(modelOutputs[0].getData());
            expect(output0.length).assertLarger(0);
            hilog.info(domain, tag, '%{public}s', 'output0.length:' + output0.length);
            for (let i = 0; i < 2; i++) {
                hilog.info(domain, tag, '%{public}s', output0[i].toString());
                expect(output0[i].toString() !== null).assertTrue();
            }
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        });

        //正常场景：模拟器，Context设置CPU，2线程
        /**
         * @tc.number Test_load_model_param_model_path_settings_threads_emulator_static_002
         * @tc.name   Test_load_model_param_model_path_settings_threads_emulator_static_002
         * @tc.desc: 正常场景：模拟器，Context设置CPU，2线程
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_settings_threads_emulator_static_002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_param_model_path_settings_threads_emulator_static_002");
            let inputName = 'ml_face_isface_0.input';
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let inputBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let context: mindSporeLite.Context = {};
            context.target = ["cpu"];
            context.cpu = {
                "threadNum": 2,
            };
            let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
            modelInputs[0].setData(inputBuffer.buffer);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE predict start=====');
            let modelOutputs = await msliteModel.predict(modelInputs);
            expect(modelOutputs !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array start=====');
            let output0 = new Float32Array(modelOutputs[0].getData());
            expect(output0.length).assertLarger(0);
            hilog.info(domain, tag, '%{public}s', 'output0.length:' + output0.length);
            for (let i = 0; i < 2; i++) {
                hilog.info(domain, tag, '%{public}s', output0[i].toString());
                expect(output0[i].toString() !== null).assertTrue();
            }
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        });

        /**
         * @tc.number Test_load_model_param_model_path_settings_threads_emulator_static_003
         * @tc.name   Test_load_model_param_model_path_settings_threads_emulator_static_003
         * @tc.desc: 正常场景：模拟器，Context设置CPU，1线程
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_settings_threads_emulator_static_003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_param_model_path_settings_threads_emulator_static_003");
            let inputName = 'ml_face_isface_0.input';
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let inputBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let context: mindSporeLite.Context = {};
            context.target = ["cpu"];
            context.cpu = {
                "threadNum": 1,
            };
            let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
            modelInputs[0].setData(inputBuffer.buffer);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE predict start=====');
            let modelOutputs = await msliteModel.predict(modelInputs);
            expect(modelOutputs !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array start=====');
            let output0 = new Float32Array(modelOutputs[0].getData());
            expect(output0.length).assertLarger(0);
            hilog.info(domain, tag, '%{public}s', 'output0.length:' + output0.length);
            for (let i = 0; i < 2; i++) {
                hilog.info(domain, tag, '%{public}s', output0[i].toString());
                expect(output0[i].toString() !== null).assertTrue();
            }
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        });

        /**
         * @tc.number Test_load_model_param_model_path_settings_threads_emulator_static_004
         * @tc.name   Test_load_model_param_model_path_settings_threads_emulator_static_004
         * @tc.desc: 正常场景：模拟器，Context设置CPU，0线程
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_settings_threads_emulator_static_004', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_param_model_path_settings_threads_emulator_static_004");
            let inputName = 'ml_face_isface_0.input';
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let inputBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let context: mindSporeLite.Context = {};
            context.target = ["cpu"];
            context.cpu = {
                "threadNum": 0,
            };
            let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
            modelInputs[0].setData(inputBuffer.buffer);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE predict start=====');
            let modelOutputs = await msliteModel.predict(modelInputs);
            expect(modelOutputs !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array start=====');
            let output0 = new Float32Array(modelOutputs[0].getData());
            expect(output0.length).assertLarger(0);
            hilog.info(domain, tag, '%{public}s', 'output0.length:' + output0.length);
            for (let i = 0; i < 2; i++) {
                hilog.info(domain, tag, '%{public}s', output0[i].toString());
                expect(output0[i].toString() !== null).assertTrue();
            }
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        });

        /**
         * @tc.number Test_load_model_param_model_path_is_None_emulator_static_001
         * @tc.name   Test_load_model_param_model_path_is_None_emulator_static_001
         * @tc.desc: 异常场景：模拟器，ModelBuild，调用model path方法，path为空
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_is_None_emulator_static_001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_param_model_path_is_None_emulator_static_001");
            let model_file = "";
            let context: mindSporeLite.Context = {};
            context.target = ["cpu"];
            try {
                let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
                hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
                expect().assertFail();
                done();
            } catch (error) {
                let err = error as BusinessError
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR:' + error);
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + err.code);
                expect(err.code).assertEqual(1000000);
                done();
            }            
        });

        /**
         * @tc.number Test_load_model_param_model_path_resize_emulator_static_001
         * @tc.name   Test_load_model_param_model_path_resize_emulator_static_001
         * @tc.desc: 正常场景：模拟器，ModelResize，shape与之前一致
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_resize_emulator_static_001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_param_model_path_resize_emulator_static_001");
            let inputName = 'ml_ocr_cn_0.input';
            let model_file = abilityContext.filesDir + '/' + 'ml_ocr_cn.ms';
            let inputBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE resize start=====');
            let new_dim = new Array<Int[]>([1, 32, 512, 1]);
            let resize_result = msliteModel.resize(modelInputs, new_dim);
            expect(resize_result).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE resize success=====');
            const modelInputs2 = msliteModel.getInputs();
            modelInputs2[0].setData(inputBuffer.buffer);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE predict start=====');
            let modelOutputs = await msliteModel.predict(modelInputs2);
            expect(modelOutputs !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array start=====');
            let output0 = new Float32Array(modelOutputs[0].getData());
            expect(output0.length).assertLarger(0);
            hilog.info(domain, tag, '%{public}s', 'output0.length:' + output0.length);
            for (let i = 0; i < 2; i++) {
                hilog.info(domain, tag, '%{public}s', output0[i].toString());
                expect(output0[i].toString() !== null).assertTrue();
            }
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        });

        /**
         * @tc.number Test_load_model_param_model_path_resize_emulator_static_002
         * @tc.name   Test_load_model_param_model_path_resize_emulator_static_002
         * @tc.desc: 正常场景：模拟器，ModelResize，shape与之前不一致
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_resize_emulator_static_002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_param_model_path_resize_emulator_static_002");
            let inputName = 'ml_ocr_cn_0.input';
            let model_file = abilityContext.filesDir + '/' + 'ml_ocr_cn.ms';
            let inputBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
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
            hilog.info(domain, tag, '%{public}s', '=========MSLITE resize start=====');
            let new_dim = new Array<Int[]>([1, 64, 256, 1]);
            let resize_result = msliteModel.resize(modelInputs, new_dim);
            expect(resize_result).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE resize success=====');
            const modelInputs2 = msliteModel.getInputs();
            let input_name2 = modelInputs2[0].name;
            hilog.info(domain, tag, '%{public}s', input_name2.toString());
            expect(input_name2.toString()).assertEqual("data");
            let input_shape2 = modelInputs2[0].shape;
            hilog.info(domain, tag, '%{public}s', input_shape2.toString());
            expect(input_shape2.toString()).assertEqual("1,64,256,1");
            let input_elementNum2 = modelInputs2[0].elementNum;
            hilog.info(domain, tag, '%{public}s', input_elementNum2.toString());
            expect(input_elementNum2.toString()).assertEqual("16384");
            let input_dtype2 = modelInputs2[0].dtype;
            hilog.info(domain, tag, '%{public}s', input_dtype2.toString());
            expect(input_dtype2).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
            let input_format2 = modelInputs2[0].format;
            hilog.info(domain, tag, '%{public}s', input_format2.toString());
            expect(input_format2).assertEqual(mindSporeLite.Format.NHWC);
            let input_dataSize2 = modelInputs2[0].dataSize;
            hilog.info(domain, tag, '%{public}s', input_dataSize2.toString());
            expect(input_dataSize2.toString()).assertEqual("65536");
            modelInputs2[0].setData(inputBuffer.buffer);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE predict start=====');
            let modelOutputs = await msliteModel.predict(modelInputs2);
            expect(modelOutputs !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array start=====');
            let output0 = new Float32Array(modelOutputs[0].getData());
            expect(output0.length).assertLarger(0);
            hilog.info(domain, tag, '%{public}s', 'output0.length:' + output0.length);
            for (let i = 0; i < 2; i++) {
                hilog.info(domain, tag, '%{public}s', output0[i].toString());
                expect(output0[i].toString() !== null).assertTrue();
            }
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        });

        /**
         * @tc.number Test_load_model_param_model_path_resize_emulator_static_003
         * @tc.name   Test_load_model_param_model_path_resize_emulator_static_003
         * @tc.desc: 异常场景：模拟器，ModelResize，shape为三维
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_resize_emulator_static_003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_param_model_path_resize_emulator_static_003");
            let inputName = 'ml_ocr_cn_0.input';
            let model_file = abilityContext.filesDir + '/' + 'ml_ocr_cn.ms';
            let inputBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE resize start=====');
            let new_dim = new Array<Int[]>([1, 32, 1]);
            let resize_result = msliteModel.resize(modelInputs, new_dim);
            expect(resize_result).assertFalse;
            hilog.info(domain, tag, '%{public}s', '=========MSLITE resize failed=====');
            done();
        });

        /**
         * @tc.number Test_load_model_param_model_path_resize_emulator_static_004
         * @tc.name   Test_load_model_param_model_path_resize_emulator_static_004
         * @tc.desc: 异常场景：模拟器，ModelResize，不支持resize的模型
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_resize_emulator_static_004', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_param_model_path_resize_emulator_static_004");
            let inputName = 'ml_face_isface_0.input';
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let inputBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE resize start=====');
            let new_dim = new Array<Int[]>([1, 96, 96, 1]);
            let resize_result = msliteModel.resize(modelInputs, new_dim);
            expect(resize_result).assertFalse();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE resize failed=====');
            done();
        });

        /**
         * @tc.number Test_load_model_param_model_path_resize_emulator_static_005
         * @tc.name   Test_load_model_param_model_path_resize_emulator_static_005
         * @tc.desc: 异常场景：模拟器，ModelResize，shape值有负数
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_resize_emulator_static_005', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_param_model_path_resize_emulator_static_005");
            let inputName = 'ml_ocr_cn_0.input';
            let model_file = abilityContext.filesDir + '/' + 'ml_ocr_cn.ms';
            let inputBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE resize start=====');
            let new_dim = new Array<Int[]>([1, -32, 32, 1]);
            let resize_result = msliteModel.resize(modelInputs, new_dim);
            expect(resize_result).assertFalse();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE resize failed=====');
            done();
        });

        /**
         * @tc.number Test_load_model_param_model_path_much_predict_emulator_static_001
         * @tc.name   Test_load_model_param_model_path_much_predict_emulator_static_001
         * @tc.desc: 正常场景：模拟器，Build一次，Predict多次
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_much_predict_emulator_static_001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_param_model_path_much_predict_emulator_static_001");
            let inputName = 'ml_face_isface_0.input';
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let inputBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
            modelInputs[0].setData(inputBuffer.buffer);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE predict start=====');
            let num = 0;
            for (let i = 0; i < 10; i++) {
                let modelOutputs = await msliteModel.predict(modelInputs);
                expect(modelOutputs !== null).assertTrue();
                hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array start=====');
                let output0 = new Float32Array(modelOutputs[0].getData());
                expect(output0.length).assertLarger(0);
                hilog.info(domain, tag, '%{public}s', 'output0.length:' + output0.length);
                for (let z = 0; z < 2; z++) {
                    hilog.info(domain, tag, '%{public}s', output0[z].toString());
                    expect(output0[z].toString() !== null).assertTrue();
                }
                hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
                hilog.info(domain, tag, '%{public}s', '=========i.toString()=====');
                hilog.info(domain, tag, '%{public}s', i.toString());
                ++num;
                hilog.info(domain, tag, '%{public}s', '=========num.toString()=====');
                hilog.info(domain, tag, '%{public}s', num.toString());
            }
            done();
        });

        /**
         * @tc.number Test_load_model_param_model_path_much_build_emulator_static_001
         * @tc.name   Test_load_model_param_model_path_much_build_emulator_static_001
         * @tc.desc: 异常场景：模拟器，Build多次
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_much_build_emulator_static_001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_param_model_path_much_build_emulator_static_001");
            let inputName = 'ml_face_isface_0.input';
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let inputBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            for (let i = 0; i < 10; i++) {
                mindSporeLite.loadModelFromFile(model_file);
            }
            let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
            modelInputs[0].setData(inputBuffer.buffer);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE predict start=====');
            let modelOutputs = await msliteModel.predict(modelInputs);
            expect(modelOutputs !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array start=====');
            let output0 = new Float32Array(modelOutputs[0].getData());
            expect(output0.length).assertLarger(0);
            hilog.info(domain, tag, '%{public}s', 'output0.length:' + output0.length);
            for (let i = 0; i < 2; i++) {
                hilog.info(domain, tag, '%{public}s', output0[i].toString());
                expect(output0[i].toString() !== null).assertTrue();
            }
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        });

        /**
         * @tc.number Test_load_model_param_model_path_model_emulator_static_001
         * @tc.name   Test_load_model_param_model_path_model_emulator_static_001
         * @tc.desc: 正常场景：模拟器，单输入模型
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_model_emulator_static_001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_param_model_path_model_emulator_static_001");
            let modelName = 'ml_face_isface.ms';
            let inputName = 'ml_face_isface_0.input';
            let inputBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let modelBuffer = await abilityContext.resourceManager.getRawFileContent(modelName);
            let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
            modelInputs[0].setData(inputBuffer.buffer);
            let Inputs2 = new Float32Array(modelInputs[0].getData());
            for (let i = 0; i < 5; i++) {
                hilog.info(domain, tag, '%{public}s', Inputs2[i].toString());
            }
            hilog.info(domain, tag, '%{public}s', '=========MSLITE predict start=====');
            let modelOutputs = await msliteModel.predict(modelInputs);
            expect(modelOutputs !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array start=====');
            let output0 = new Float32Array(modelOutputs[0].getData());
            hilog.info(domain, tag, '%{public}s', 'output0.length:' + output0.length);
            for (let i = 0; i < 2; i++) {
                hilog.info(domain, tag, '%{public}s', output0[i].toString());
                expect(output0[i].toString() !== null).assertTrue();
            }
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        });

        /**
         * @tc.number Test_load_model_param_model_path_model_emulator_static_002
         * @tc.name   Test_load_model_param_model_path_model_emulator_static_002
         * @tc.desc: 正常场景：模拟器，多输入模型
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_model_emulator_static_002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_param_model_path_model_emulator_static_002");
            let modelName = 'ml_video_edit_face_cutout_portraitSeg_deconv.ms';
            let inputName01 = 'ml_video_edit_face_cutout_portraitSeg_deconv_0.input';
            let inputName02 = 'ml_video_edit_face_cutout_portraitSeg_deconv_1.input';
            let inputBuffer01 = await abilityContext.resourceManager.getRawFileContent(inputName01);
            let inputBuffer02 = await abilityContext.resourceManager.getRawFileContent(inputName02);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input01 bin bytelength: ' + inputBuffer01.byteLength);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input02 bin bytelength: ' + inputBuffer02.byteLength);
            let modelBuffer = await abilityContext.resourceManager.getRawFileContent(modelName);
            let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
            hilog.info(domain, tag, '%{public}s', modelInputs[0].name);
            expect(modelInputs[0].name.toString()).assertEqual("a");
            hilog.info(domain, tag, '%{public}s', modelInputs[0].shape.toString());
            expect(modelInputs[0].shape.toString()).assertEqual("1,512,512,3");
            hilog.info(domain, tag, '%{public}s', modelInputs[0].elementNum.toString());
            expect(modelInputs[0].elementNum.toString()).assertEqual("786432");
            expect(modelInputs[0].dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
            expect(modelInputs[0].format).assertEqual(mindSporeLite.Format.NHWC);
            let input_dataSize = modelInputs[0].dataSize;

            expect(input_dataSize.toString()).assertEqual("3145728");
            hilog.info(domain, tag, '%{public}s', modelInputs[1].name);
            expect(modelInputs[1].name.toString()).assertEqual("b");
            hilog.info(domain, tag, '%{public}s', modelInputs[1].shape.toString());
            expect(modelInputs[1].shape.toString()).assertEqual("1,512,512,1");
            hilog.info(domain, tag, '%{public}s', modelInputs[1].elementNum.toString());
            expect(modelInputs[1].elementNum.toString()).assertEqual("262144");
            hilog.info(domain, tag, '%{public}s', modelInputs[1].dtype.toString());
            expect(modelInputs[1].dtype.toString()).assertEqual("43");
            hilog.info(domain, tag, '%{public}s', modelInputs[1].format.toString());
            expect(modelInputs[1].format.toString()).assertEqual("1");
            hilog.info(domain, tag, '%{public}s', modelInputs[1].dataSize.toString());
            expect(modelInputs[1].dataSize.toString()).assertEqual("1048576");
            modelInputs[0].setData(inputBuffer01.buffer);
            modelInputs[1].setData(inputBuffer02.buffer);
            let Inputs2 = new Float32Array(modelInputs[0].getData());
            for (let i = 0; i < 5; i++) {
                hilog.info(domain, tag, '%{public}s', Inputs2[i].toString());
            }
            hilog.info(domain, tag, '%{public}s', '=========MSLITE predict start=====');
            let modelOutputs = await msliteModel.predict(modelInputs);
            expect(modelOutputs !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array start=====');
            let output0 = new Float32Array(modelOutputs[0].getData());
            hilog.info(domain, tag, '%{public}s', 'output0.length:' + output0.length);
            for (let i = 0; i < 2; i++) {
                hilog.info(domain, tag, '%{public}s', output0[i].toString());
                expect(output0[i].toString() !== null).assertTrue();
            }
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        });

        /**
         * @tc.number Test_load_model_param_model_path_model_emulator_static_003
         * @tc.name   Test_load_model_param_model_path_model_emulator_static_003
         * @tc.desc: 正常场景：模拟器，输入为uint8模型
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_model_emulator_static_003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_param_model_path_model_emulator_static_003");
            let modelName = 'aiy_vision_classifier_plants_V1_3.ms';
            let inputName = 'aiy_vision_classifier_plants_V1_3_0.input';
            let inputBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let modelBuffer = await abilityContext.resourceManager.getRawFileContent(modelName);
            let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
            hilog.info(domain, tag, '%{public}s', modelInputs[0].name);
            expect(modelInputs[0].name.toString()).assertEqual("module/hub_input/images_uint8");
            hilog.info(domain, tag, '%{public}s', modelInputs[0].shape.toString());
            expect(modelInputs[0].shape.toString()).assertEqual("1,224,224,3");
            hilog.info(domain, tag, '%{public}s', modelInputs[0].elementNum.toString());
            expect(modelInputs[0].elementNum.toString()).assertEqual("150528");
            hilog.info(domain, tag, '%{public}s', modelInputs[0].dtype.toString());
            expect(modelInputs[0].dtype.toString()).assertEqual("37");
            hilog.info(domain, tag, '%{public}s', modelInputs[0].format.toString());
            expect(modelInputs[0].format.toString()).assertEqual("1");
            hilog.info(domain, tag, '%{public}s', modelInputs[0].dataSize.toString());
            expect(modelInputs[0].dataSize.toString()).assertEqual("150528");
            modelInputs[0].setData(inputBuffer.buffer);
            let Inputs2 = new Uint8Array(modelInputs[0].getData());
            for (let i = 0; i < 5; i++) {
                hilog.info(domain, tag, '%{public}s', Inputs2[i].toString());
            }
            hilog.info(domain, tag, '%{public}s', '=========MSLITE predict start=====');
            let modelOutputs = await msliteModel.predict(modelInputs);
            expect(modelOutputs !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array start=====');
            let output0 = new Uint8Array(modelOutputs[0].getData());
            hilog.info(domain, tag, '%{public}s', 'output0.length:' + output0.length);
            for (let i = 0; i < 2; i++) {
                hilog.info(domain, tag, '%{public}s', output0[i].toString());
                expect(output0[i].toString() !== null).assertTrue();
            }
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        });

        /**
         * @tc.number Test_load_model_param_model_path_model_emulator_static_004
         * @tc.name   Test_load_model_param_model_path_model_emulator_static_004
         * @tc.desc: 正常场景：模拟器，多输入单输出
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_model_emulator_static_004', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_param_model_path_model_emulator_static_004");
            let modelName = 'ml_headpose_pb2tflite.ms';
            let inputName01 = 'ml_headpose_pb2tflite_0.input';
            let inputName02 = 'ml_headpose_pb2tflite_1.input';
            let inputName03 = 'ml_headpose_pb2tflite_2.input';
            let inputBuffer01 = await abilityContext.resourceManager.getRawFileContent(inputName01);
            let inputBuffer02 = await abilityContext.resourceManager.getRawFileContent(inputName02);
            let inputBuffer03 = await abilityContext.resourceManager.getRawFileContent(inputName03);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input01 bin bytelength: ' + inputBuffer01.byteLength);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input02 bin bytelength: ' + inputBuffer02.byteLength);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input03 bin bytelength: ' + inputBuffer03.byteLength);
            let modelBuffer = await abilityContext.resourceManager.getRawFileContent(modelName);
            expect(modelBuffer.buffer !== null).assertTrue();
            let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
            hilog.info(domain, tag, '%{public}s', modelInputs[0].name);
            expect(modelInputs[0].name.toString()).assertEqual("input_1");
            hilog.info(domain, tag, '%{public}s', modelInputs[0].shape.toString());
            expect(modelInputs[0].shape.toString()).assertEqual("1,64,64,3");
            hilog.info(domain, tag, '%{public}s', modelInputs[0].elementNum.toString());
            expect(modelInputs[0].elementNum.toString()).assertEqual("12288");
            expect(modelInputs[0].dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
            expect(modelInputs[0].format).assertEqual(mindSporeLite.Format.NHWC);
            let input_dataSize = modelInputs[0].dataSize;

            expect(input_dataSize.toString()).assertEqual("49152");
            hilog.info(domain, tag, '%{public}s', modelInputs[1].name);
            expect(modelInputs[1].name.toString()).assertEqual("batch_normalization_8/batchnorm/add");
            hilog.info(domain, tag, '%{public}s', modelInputs[1].shape.toString());
            expect(modelInputs[1].shape.toString()).assertEqual("16");
            hilog.info(domain, tag, '%{public}s', modelInputs[1].elementNum.toString());
            expect(modelInputs[1].elementNum.toString()).assertEqual("16");
            hilog.info(domain, tag, '%{public}s', modelInputs[1].dtype.toString());
            expect(modelInputs[1].dtype.toString()).assertEqual("43");
            hilog.info(domain, tag, '%{public}s', modelInputs[1].format.toString());
            expect(modelInputs[1].format.toString()).assertEqual("1");
            hilog.info(domain, tag, '%{public}s', modelInputs[1].dataSize.toString());
            expect(modelInputs[1].dataSize.toString()).assertEqual("64");
            hilog.info(domain, tag, '%{public}s', modelInputs[2].name);
            expect(modelInputs[2].name.toString()).assertEqual("batch_normalization_1/batchnorm/add");
            hilog.info(domain, tag, '%{public}s', modelInputs[2].shape.toString());
            expect(modelInputs[2].shape.toString()).assertEqual("16");
            hilog.info(domain, tag, '%{public}s', modelInputs[2].elementNum.toString());
            expect(modelInputs[2].elementNum.toString()).assertEqual("16");
            hilog.info(domain, tag, '%{public}s', modelInputs[2].dtype.toString());
            expect(modelInputs[2].dtype.toString()).assertEqual("43");
            hilog.info(domain, tag, '%{public}s', modelInputs[2].format.toString());
            expect(modelInputs[2].format.toString()).assertEqual("1");
            hilog.info(domain, tag, '%{public}s', modelInputs[2].dataSize.toString());
            expect(modelInputs[2].dataSize.toString()).assertEqual("64");
            modelInputs[0].setData(inputBuffer01.buffer);
            modelInputs[1].setData(inputBuffer02.buffer);
            modelInputs[2].setData(inputBuffer03.buffer);
            let Inputs2 = new Float32Array(modelInputs[0].getData());
            for (let i = 0; i < 5; i++) {
                hilog.info(domain, tag, '%{public}s', Inputs2[i].toString());
            }
            hilog.info(domain, tag, '%{public}s', '=========MSLITE predict start=====');
            let modelOutputs = await msliteModel.predict(modelInputs);
            expect(modelOutputs !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array start=====');
            let output0 = new Float32Array(modelOutputs[0].getData());
            hilog.info(domain, tag, '%{public}s', 'output0.length:' + output0.length);
            for (let i = 0; i < 2; i++) {
                hilog.info(domain, tag, '%{public}s', output0[i].toString());
                expect(output0[i].toString() !== null).assertTrue();
            }
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        });

        /**
         * @tc.number Test_load_model_param_model_path_callback_emulator_static
         * @tc.name   Test_load_model_param_model_path_callback_emulator_static
         * @tc.desc: 正常场景：模拟器，调用loadModelFromFile callback接口设置context
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_callback_emulator_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_param_model_path_callback_emulator_static");
            let inputName = 'ml_face_isface_0.input';
            let inputBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel start=====');
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let context: mindSporeLite.Context = {};
            context.target = ["cpu"];
            context.cpu = {
                "threadNum": 4,
            }
            mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
                hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
                expect(msliteModel !== null).assertTrue();
                hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
                let modelInputs: mindSporeLite.MSTensor[] = msliteModel.getInputs();
                expect(modelInputs[0].name.toString()).assertEqual("data");
                expect(modelInputs[0].shape.toString()).assertEqual("1,48,48,3");
                expect(modelInputs[0].elementNum.toString()).assertEqual("6912");
                expect(modelInputs[0].dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
                expect(modelInputs[0].format).assertEqual(mindSporeLite.Format.NHWC);
                expect(modelInputs[0].dataSize.toString()).assertEqual("27648");
                modelInputs[0].setData(inputBuffer.buffer);
                hilog.info(domain, tag, '%{public}s', '=========MSLITE predict start=====');
                msliteModel.predict(modelInputs, (modelOutputs: mindSporeLite.MSTensor[]) => {
                    expect(modelOutputs !== null).assertTrue();
                    hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array start=====');
                    let output0 = new Float32Array(modelOutputs[0].getData());
                    expect(output0.length).assertLarger(0);
                    hilog.info(domain, tag, '%{public}s', 'output0.length:' + output0.length);
                    for (let i = 0; i < 2; i++) {
                        hilog.info(domain, tag, '%{public}s', output0[i].toString());
                        expect(output0[i].toString() !== null).assertTrue();
                    }
                    hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
                    done();
                })
            })
            done();
        });

        /**
         * @tc.number Test_load_model_param_model_buffer_callback_emulator_static
         * @tc.name   Test_load_model_param_model_buffer_callback_emulator_static
         * @tc.desc: 正常场景：模拟器，调用loadModelFromBuffer callback接口设置context
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_buffer_callback_emulator_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_param_model_buffer_callback_emulator_static");
            let inputName = 'ml_face_isface_0.input';
            let inputBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel start=====');
            let modelName = 'ml_face_isface.ms';
            let model_buffer = await abilityContext.resourceManager.getRawFileContent(modelName);
            let context: mindSporeLite.Context = {};
            context.target = ["cpu"];
            context.cpu = {
                "threadNum": 4,
            }
            mindSporeLite.loadModelFromBuffer(model_buffer.buffer, context, (msliteModel: mindSporeLite.Model) => {
                expect(msliteModel !== null).assertTrue();
                hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
                let modelInputs: mindSporeLite.MSTensor[] = msliteModel.getInputs();
                let input_name = modelInputs[0].name;
                hilog.info(domain, tag, '%{public}s', input_name.toString());
                expect(input_name.toString()).assertEqual("data");
                let input_shape = modelInputs[0].shape;
                hilog.info(domain, tag, '%{public}s', input_shape.toString());
                expect(input_shape.toString()).assertEqual("1,48,48,3")
                let input_elementNum = modelInputs[0].elementNum;
                hilog.info(domain, tag, '%{public}s', input_elementNum.toString());
                expect(input_elementNum.toString()).assertEqual("6912");
                let input_dtype = modelInputs[0].dtype;
                hilog.info(domain, tag, '%{public}s', input_dtype.toString());
                expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
                let input_format = modelInputs[0].format;
                hilog.info(domain, tag, '%{public}s', input_format.toString());
                expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
                let input_dataSize = modelInputs[0].dataSize;
                hilog.info(domain, tag, '%{public}s', input_dataSize.toString());
                expect(input_dataSize.toString()).assertEqual("27648");
                modelInputs[0].setData(inputBuffer.buffer);
                hilog.info(domain, tag, '%{public}s', '=========MSLITE predict start=====');
                msliteModel.predict(modelInputs, (modelOutputs: mindSporeLite.MSTensor[]) => {
                    expect(modelOutputs !== null).assertTrue();
                    hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array start=====');
                    let output0 = new Float32Array(modelOutputs[0].getData());
                    expect(output0.length).assertLarger(0);
                    hilog.info(domain, tag, '%{public}s', 'output0.length:' + output0.length);
                    for (let i = 0; i < 2; i++) {
                        hilog.info(domain, tag, '%{public}s', output0[i].toString());
                        expect(output0[i].toString() !== null).assertTrue();
                    }
                    hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
                    done();
                })
            })
            done();
        });

        /**
         * @tc.number Test_load_model_param_model_fd_callback_emulator_static
         * @tc.name   Test_load_model_param_model_fd_callback_emulator_static
         * @tc.desc   正常场景：模拟器，调用loadModelFromFd callback接口设置context
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_fd_callback_emulator_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_param_model_fd_callback_emulator_static");
            let inputName = 'ml_face_isface_0.input';
            let inputBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel start=====');
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
            let context:mindSporeLite.Context={};
            context.target = ["cpu"];
            context.cpu = {
                "threadNum": 4,
            }
            mindSporeLite.loadModelFromFd(file.fd, (msliteModel: mindSporeLite.Model) => {
                expect(msliteModel !== null).assertTrue();
                hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
                let modelInputs: mindSporeLite.MSTensor[] = msliteModel.getInputs();
                let input_name = modelInputs[0].name;
                hilog.info(domain, tag, '%{public}s', input_name.toString());
                expect(input_name.toString()).assertEqual("data");
                let input_shape = modelInputs[0].shape;
                hilog.info(domain, tag, '%{public}s', input_shape.toString());
                expect(input_shape.toString()).assertEqual("1,48,48,3")
                let input_elementNum = modelInputs[0].elementNum;
                hilog.info(domain, tag, '%{public}s', input_elementNum.toString());
                expect(input_elementNum.toString()).assertEqual("6912");
                let input_dtype = modelInputs[0].dtype;
                hilog.info(domain, tag, '%{public}s', input_dtype.toString());
                expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
                let input_format = modelInputs[0].format;
                hilog.info(domain, tag, '%{public}s', input_format.toString());
                expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
                let input_dataSize = modelInputs[0].dataSize;
                hilog.info(domain, tag, '%{public}s', input_dataSize.toString());
                expect(input_dataSize.toString()).assertEqual("27648");
                modelInputs[0].setData(inputBuffer.buffer);
                hilog.info(domain, tag, '%{public}s', '=========MSLITE predict start=====');
                msliteModel.predict(modelInputs, (modelOutputs: mindSporeLite.MSTensor[]) => {
                    expect(modelOutputs !== null).assertTrue();
                    hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array start=====');
                    let output0 = new Float32Array(modelOutputs[0].getData());
                    expect(output0.length).assertLarger(0);
                    hilog.info(domain, tag, '%{public}s', 'output0.length:' + output0.length);
                    for (let i = 0; i < 2; i++) {
                        hilog.info(domain, tag, '%{public}s', output0[i].toString());
                        expect(output0[i].toString() !== null).assertTrue();
                    }
                    hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
                    done();
                })
            })
            done();
        });

        /**
         * @tc.number Test_load_model_param_model_path_callback_no_context_emulator_static
         * @tc.name   Test_load_model_param_model_path_callback_no_context_emulator_static
         * @tc.desc   正常场景：模拟器，调用loadModelFromFile callback接口未设置context
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_callback_no_context_emulator_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_param_model_path_callback_no_context_emulator_static");
            let inputName = 'ml_face_isface_0.input';
            let inputBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel start=====');
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            mindSporeLite.loadModelFromFile(model_file, (msliteModel: mindSporeLite.Model) => {
                expect(msliteModel !== null).assertTrue();
                hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
                let modelInputs: mindSporeLite.MSTensor[] = msliteModel.getInputs();
                let input_name = modelInputs[0].name;
                hilog.info(domain, tag, '%{public}s', input_name.toString());
                expect(input_name.toString()).assertEqual("data");
                let input_shape = modelInputs[0].shape;
                hilog.info(domain, tag, '%{public}s', input_shape.toString());
                expect(input_shape.toString()).assertEqual("1,48,48,3")
                let input_elementNum = modelInputs[0].elementNum;
                hilog.info(domain, tag, '%{public}s', input_elementNum.toString());
                expect(input_elementNum.toString()).assertEqual("6912");
                let input_dtype = modelInputs[0].dtype;
                hilog.info(domain, tag, '%{public}s', input_dtype.toString());
                expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
                let input_format = modelInputs[0].format;
                hilog.info(domain, tag, '%{public}s', input_format.toString());
                expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
                let input_dataSize = modelInputs[0].dataSize;
                hilog.info(domain, tag, '%{public}s', input_dataSize.toString());
                expect(input_dataSize.toString()).assertEqual("27648");
                modelInputs[0].setData(inputBuffer.buffer);
                hilog.info(domain, tag, '%{public}s', '=========MSLITE predict start=====');
                msliteModel.predict(modelInputs, (modelOutputs: mindSporeLite.MSTensor[]) => {
                    expect(modelOutputs !== null).assertTrue();
                    hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array start=====');
                    let output0 = new Float32Array(modelOutputs[0].getData());
                    expect(output0.length).assertLarger(0);
                    hilog.info(domain, tag, '%{public}s', 'output0.length:' + output0.length);
                    for (let i = 0; i < 2; i++) {
                        hilog.info(domain, tag, '%{public}s', output0[i].toString());
                        expect(output0[i].toString() !== null).assertTrue();
                    }
                    hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
                    done();
                })
            })
            done();
        });
        
        /**
         * @tc.number Test_load_model_param_model_buffer_callback_no_context_emulator_static
         * @tc.name   Test_load_model_param_model_buffer_callback_no_context_emulator_static
         * @tc.desc   正常场景：模拟器，调用loadModelFromBuffer callback接口未设置context
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_buffer_callback_no_context_emulator_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_param_model_buffer_callback_no_context_emulator_static");
            let inputName = 'ml_face_isface_0.input';
            let inputBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel start=====');
            let modelName = 'ml_face_isface.ms';
            let model_buffer = await abilityContext.resourceManager.getRawFileContent(modelName);
            mindSporeLite.loadModelFromBuffer(model_buffer.buffer, (msliteModel: mindSporeLite.Model) => {
                expect(msliteModel !== null).assertTrue();
                hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
                let modelInputs: mindSporeLite.MSTensor[] = msliteModel.getInputs();
                let input_name = modelInputs[0].name;
                hilog.info(domain, tag, '%{public}s', input_name.toString());
                expect(input_name.toString()).assertEqual("data");
                let input_shape = modelInputs[0].shape;
                hilog.info(domain, tag, '%{public}s', input_shape.toString());
                expect(input_shape.toString()).assertEqual("1,48,48,3")
                let input_elementNum = modelInputs[0].elementNum;
                hilog.info(domain, tag, '%{public}s', input_elementNum.toString());
                expect(input_elementNum.toString()).assertEqual("6912");
                let input_dtype = modelInputs[0].dtype;
                hilog.info(domain, tag, '%{public}s', input_dtype.toString());
                expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
                let input_format = modelInputs[0].format;
                hilog.info(domain, tag, '%{public}s', input_format.toString());
                expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
                let input_dataSize = modelInputs[0].dataSize;
                hilog.info(domain, tag, '%{public}s', input_dataSize.toString());
                expect(input_dataSize.toString()).assertEqual("27648");
                modelInputs[0].setData(inputBuffer.buffer);
                hilog.info(domain, tag, '%{public}s', '=========MSLITE predict start=====');
                msliteModel.predict(modelInputs, (modelOutputs: mindSporeLite.MSTensor[]) => {
                    expect(modelOutputs !== null).assertTrue();
                    hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array start=====');
                    let output0 = new Float32Array(modelOutputs[0].getData());
                    expect(output0.length).assertLarger(0);
                    hilog.info(domain, tag, '%{public}s', 'output0.length:' + output0.length);
                    for (let i = 0; i < 2; i++) {
                        hilog.info(domain, tag, '%{public}s', output0[i].toString());
                        expect(output0[i].toString() !== null).assertTrue();
                    }
                    hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
                    done();
                })
            })
            done();
        });

        /**
         * @tc.number Test_load_model_param_model_fd_callback_no_context_emulator_static
         * @tc.name   Test_load_model_param_model_fd_callback_no_context_emulator_static
         * @tc.desc   正常场景：模拟器，调用loadModelFromFd callback接口未设置context
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_fd_callback_no_context_emulator_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_param_model_fd_callback_no_context_emulator_static");
            let inputName = 'ml_face_isface_0.input';
            let inputBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel start=====');
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
            mindSporeLite.loadModelFromFd(file.fd, (msliteModel: mindSporeLite.Model) => {
                expect(msliteModel !== null).assertTrue();
                hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
                let modelInputs: mindSporeLite.MSTensor[] = msliteModel.getInputs();
                let input_name = modelInputs[0].name;
                hilog.info(domain, tag, '%{public}s', input_name.toString());
                expect(input_name.toString()).assertEqual("data");
                let input_shape = modelInputs[0].shape;
                hilog.info(domain, tag, '%{public}s', input_shape.toString());
                expect(input_shape.toString()).assertEqual("1,48,48,3");
                let input_elementNum = modelInputs[0].elementNum;
                hilog.info(domain, tag, '%{public}s', input_elementNum.toString());
                expect(input_elementNum.toString()).assertEqual("6912");
                let input_dtype = modelInputs[0].dtype;
                hilog.info(domain, tag, '%{public}s', input_dtype.toString());
                expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
                let input_format = modelInputs[0].format;
                hilog.info(domain, tag, '%{public}s', input_format.toString());
                expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
                let input_dataSize = modelInputs[0].dataSize;
                hilog.info(domain, tag, '%{public}s', input_dataSize.toString());
                expect(input_dataSize.toString()).assertEqual("27648");
                modelInputs[0].setData(inputBuffer.buffer);
                hilog.info(domain, tag, '%{public}s', '=========MSLITE predict start=====');
                msliteModel.predict(modelInputs, (modelOutputs: mindSporeLite.MSTensor[]) => {
                    expect(modelOutputs !== null).assertTrue();
                    hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array start=====');
                    let output0 = new Float32Array(modelOutputs[0].getData());
                    expect(output0.length).assertLarger(0);
                    hilog.info(domain, tag, '%{public}s', 'output0.length:' + output0.length);
                    for (let i = 0; i < 2; i++) {
                        hilog.info(domain, tag, '%{public}s', output0[i].toString());
                        expect(output0[i].toString() !== null).assertTrue();
                    }
                    hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
                    done();
                })
            })
            done();
        });
    })
}
