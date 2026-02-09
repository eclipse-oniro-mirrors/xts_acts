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

                let lenet_train_model_file = dir + "lenet_train.ms";
                hilog.info(domain, tag, '%{public}s', 'start get lenet_train.ms buffer!!!');
                abilityContext.resourceManager.getRawFileContent("lenet_train.ms", (error: BusinessError<void> | null, model_buffer: Uint8Array | undefined) => {
                    if (error != null) {
                        //getRawFileDescriptor运行失败
                        hilog.info(domain, tag, '%{public}s', 'get lenet_train.ms fail!!!');
                    } else {
                        //getRawFileDescriptor运行成功
                        let file = fs.openSync(lenet_train_model_file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
                        if (model_buffer?.buffer !== undefined){
                            lenet_train_buffer = model_buffer!;
                            fs.writeSync(file.fd, model_buffer!.buffer);
                            hilog.info(domain, tag, '%{public}s', 'copy lenet_train.ms sandbox success!!!');
                        }
                        else{
                            hilog.info(domain, tag, '%{public}s', 'copy lenet_train.ms sandbox fail!!!');
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
         * @tc.number Test_load_model_from_file_error_code_static_001
         * @tc.name   Test_load_model_from_file_error_code_static_001
         * @tc.desc: 正常场景：错误码新增看护，看护loadModelFromFile错误码1000000
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_from_file_error_code_static_001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_from_file_error_code_static_001");
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
         * @tc.number Test_load_model_from_file_error_code_static_002
         * @tc.name   Test_load_model_from_file_error_code_static_002
         * @tc.desc: 正常场景：错误码新增看护，看护loadModelFromFile错误码1000001
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_from_file_error_code_static_002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_from_file_error_code_static_002");
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let context: mindSporeLite.Context = {};
            context.target = ["suv"];
            try {
                let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
                hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
                expect().assertFail();
                done();
            } catch (error) {
                let err = error as BusinessError
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR:' + error);
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + err.code);
                expect(err.code).assertEqual(1000001);
                done();
            }
        });

        /**
         * @tc.number Test_load_model_from_file_error_code_static_003
         * @tc.name   Test_load_model_from_file_error_code_static_003
         * @tc.desc: 正常场景：错误码新增看护，看护loadModelFromFile错误码1000002
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_from_file_error_code_static_003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_from_file_error_code_static_003");
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface_0.input';
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
                expect(err.code).assertEqual(1000002);
                done();
            }
        });

        /**
         * @tc.number Test_load_model_from_file_error_code_static_004
         * @tc.name   Test_load_model_from_file_error_code_static_004
         * @tc.desc: 正常场景：错误码新增看护，看护loadModelFromFile,callback接口错误码1000000
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_from_file_error_code_static_004', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_from_file_error_code_static_004");
            let model_file = "";
            let context: mindSporeLite.Context = {};
            context.target = ["cpu"];
            try {
                mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
                hilog.info(domain, tag, '%{public}s', 'loadModel callback api error code test:ERROR');
                expect().assertFail();
                done();
                })
            } catch (error) {
                error = error as BusinessError;
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR:' + error);
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
                expect(error.code).assertEqual(1000000);
                done();
            }
        });

        /**
         * @tc.number Test_load_model_from_file_error_code_static_005
         * @tc.name   Test_load_model_from_file_error_code_static_005
         * @tc.desc: 正常场景：错误码新增看护，看护loadModelFromFile,callback接口错误码1000001
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_from_file_error_code_static_005', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_from_file_error_code_static_005");
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let context: mindSporeLite.Context = {};
            context.target = ["suv"];
            try {
                mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
                hilog.info(domain, tag, '%{public}s', 'loadModel callback api error code test:ERROR');
                expect().assertFail();
                done();
                })
            } catch (error) {
                error = error as BusinessError;
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR:' + error);
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
                expect(error.code).assertEqual(1000001);
                done();
            }
        });

        /**
         * @tc.number Test_load_model_from_file_error_code_static_006
         * @tc.name   Test_load_model_from_file_error_code_static_006
         * @tc.desc: 正常场景：错误码新增看护，看护loadModelFromFile,callback接口错误码1000002
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_from_file_error_code_static_006', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_from_file_error_code_static_006");
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface_0.input';
            let context: mindSporeLite.Context = {};
            context.target = ["cpu"];
            try {
                mindSporeLite.loadModelFromFile(model_file, context, (msliteModel: mindSporeLite.Model) => {
                hilog.info(domain, tag, '%{public}s', 'loadModel callback api error code test:ERROR');
                expect().assertFail();
                done();
                })
            } catch (error) {
                error = error as BusinessError;
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR:' + error);
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
                expect(error.code).assertEqual(1000002);
                done();
            }
        });

        /**
         * @tc.number Test_load_model_from_file_error_code_static_007
         * @tc.name   Test_load_model_from_file_error_code_static_007
         * @tc.desc: 正常场景：错误码新增看护，看护loadModelFromFile,callback接口,context默认，错误码1000000
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_from_file_error_code_static_007', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_from_file_error_code_static_007");
            let model_file = "";
            try {
                mindSporeLite.loadModelFromFile(model_file, (msliteModel: mindSporeLite.Model) => {
                hilog.info(domain, tag, '%{public}s', 'loadModel callback api error code test:ERROR');
                expect().assertFail();
                done();
                })
            } catch (error) {
                error = error as BusinessError;
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR:' + error);
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
                expect(error.code).assertEqual(1000000);
                done();
            }
        });

        /**
         * @tc.number Test_load_model_from_file_error_code_static_008
         * @tc.name   Test_load_model_from_file_error_code_static_008
         * @tc.desc: 正常场景：错误码新增看护，看护loadModelFromFile,callback接口,context默认，错误码1000002
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_from_file_error_code_static_008', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_from_file_error_code_static_008");
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface_0.input';
            try {
                mindSporeLite.loadModelFromFile(model_file, (msliteModel: mindSporeLite.Model) => {
                hilog.info(domain, tag, '%{public}s', 'loadModel callback api error code test:ERROR');
                expect().assertFail();
                done();
                })
            } catch (error) {
                error = error as BusinessError;
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR:' + error);
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
                expect(error.code).assertEqual(1000002);
                done();
            }
        });

        /**
         * @tc.number Test_load_model_from_buffer_error_code_static_001
         * @tc.name   Test_load_model_from_buffer_error_code_static_001
         * @tc.desc: 正常场景：错误码新增看护，看护loadModelFromBuffer,错误码1000004
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_from_buffer_error_code_static_001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_from_buffer_error_code_static_001");
            let modelBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent("test.txt");
            let context: mindSporeLite.Context = {};
            context.target = ["cpu"];
            try {
                let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context);
                hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
                expect().assertFail();
                done();
            } catch (error) {
                let err = error as BusinessError
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR:' + error);
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + err.code);
                expect(err.code).assertEqual(1000004);
                done();
            }
        });

        /**
         * @tc.number Test_load_model_from_buffer_error_code_static_002
         * @tc.name   Test_load_model_from_buffer_error_code_static_002
         * @tc.desc: 正常场景：错误码新增看护，看护loadModelFromBuffer错误码1000001
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_from_buffer_error_code_static_002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_from_buffer_error_code_static_002");
            let modelBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent("ml_face_isface.ms");
            let context: mindSporeLite.Context = {};
            context.target = ["suv"];
            try {
                let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context);
                hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
                expect().assertFail();
                done();
            } catch (error) {
                let err = error as BusinessError
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR:' + error);
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + err.code);
                expect(err.code).assertEqual(1000001);
                done();
            }
        });

        /**
         * @tc.number Test_load_model_from_buffer_error_code_static_003
         * @tc.name   Test_load_model_from_buffer_error_code_static_003
         * @tc.desc: 正常场景：错误码新增看护，看护loadModelFromBuffer错误码1000005
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_from_buffer_error_code_static_003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_from_buffer_error_code_static_003");
            let modelBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent("ml_headpose_pb2tflite_0.input");
            let context: mindSporeLite.Context = {};
            context.target = ["cpu"];
            try {
                let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context);
                hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
                expect().assertFail();
                done();
            } catch (error) {
                let err = error as BusinessError
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR:' + error);
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + err.code);
                expect(err.code).assertEqual(1000005);
                done();
            }
        });

        /**
         * @tc.number Test_load_model_from_buffer_error_code_static_004
         * @tc.name   Test_load_model_from_buffer_error_code_static_004
         * @tc.desc: 正常场景：错误码新增看护，看护loadModelFromBuffer,callback接口,错误码1000004
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_from_buffer_error_code_static_004', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_from_buffer_error_code_static_004");
            let modelBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent("test.txt");
            let context: mindSporeLite.Context = {};
            context.target = ["cpu"];
            try {
                mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context, (msliteModel: mindSporeLite.Model) => {
                hilog.info(domain, tag, '%{public}s', 'loadModel callback api error code test:ERROR');
                expect().assertFail();
                done();
                })
            } catch (error) {
                error = error as BusinessError;
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR:' + error);
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
                expect(error.code).assertEqual(1000004);
                done();
            }
        });

        /**
         * @tc.number Test_load_model_from_buffer_error_code_static_005
         * @tc.name   Test_load_model_from_buffer_error_code_static_005
         * @tc.desc: 正常场景：错误码新增看护，看护loadModelFromBuffer,callback接口,错误码1000001
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_from_buffer_error_code_static_005', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_from_buffer_error_code_static_005");
            let modelBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent("ml_face_isface.ms");
            let context: mindSporeLite.Context = {};
            context.target = ["suv"];
            try {
                mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context, (msliteModel: mindSporeLite.Model) => {
                hilog.info(domain, tag, '%{public}s', 'loadModel callback api error code test:ERROR');
                expect().assertFail();
                done();
                })
            } catch (error) {
                error = error as BusinessError;
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR:' + error);
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
                expect(error.code).assertEqual(1000001);
                done();
            }
        });

        /**
         * @tc.number Test_load_model_from_buffer_error_code_static_006
         * @tc.name   Test_load_model_from_buffer_error_code_static_006
         * @tc.desc: 正常场景：错误码新增看护，看护loadModelFromBuffer,callback接口,错误码1000005
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_from_buffer_error_code_static_006', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_from_buffer_error_code_static_006");
            let modelBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent("ml_headpose_pb2tflite_0.input");
            let context: mindSporeLite.Context = {};
            context.target = ["cpu"];
            try {
                mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context, (msliteModel: mindSporeLite.Model) => {
                hilog.info(domain, tag, '%{public}s', 'loadModel callback api error code test:ERROR');
                expect().assertFail();
                done();
                })
            } catch (error) {
                error = error as BusinessError;
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR:' + error);
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
                expect(error.code).assertEqual(1000005);
                done();
            }
        });

        /**
         * @tc.number Test_load_model_from_buffer_error_code_static_007
         * @tc.name   Test_load_model_from_buffer_error_code_static_007
         * @tc.desc: 正常场景：错误码新增看护，看护loadModelFromBuffer,callback接口,context默认,错误码1000004
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_from_buffer_error_code_static_007', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_from_buffer_error_code_static_007");
            let modelBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent("test.txt");
            try {
                mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, (msliteModel: mindSporeLite.Model) => {
                hilog.info(domain, tag, '%{public}s', 'loadModel callback api error code test:ERROR');
                expect().assertFail();
                done();
                })
            } catch (error) {
                error = error as BusinessError;
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR:' + error);
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
                expect(error.code).assertEqual(1000004);
                done();
            }
        });

        /**
         * @tc.number Test_load_model_from_buffer_error_code_static_008
         * @tc.name   Test_load_model_from_buffer_error_code_static_008
         * @tc.desc: 正常场景：错误码新增看护，看护loadModelFromBuffer,callback接口,context默认,错误码1000005
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_from_buffer_error_code_static_008', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_from_buffer_error_code_static_008");
            let modelBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent("ml_headpose_pb2tflite_0.input");
            try {
                mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, (msliteModel: mindSporeLite.Model) => {
                hilog.info(domain, tag, '%{public}s', 'loadModel callback api error code test:ERROR');
                expect().assertFail();
                done();
                })
            } catch (error) {
                error = error as BusinessError;
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR:' + error);
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
                expect(error.code).assertEqual(1000005);
                done();
            }
        });

        /**
         * @tc.number Test_load_model_from_fd_error_code_static_001
         * @tc.name   Test_load_model_from_fd_error_code_static_001
         * @tc.desc: 正常场景：错误码新增看护，看护loadModelFromFd错误码1000001
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_from_fd_error_code_static_001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_from_fd_error_code_static_001");
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
            let context: mindSporeLite.Context = {};
            context.target = ["suv"];
            try {
                let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
                hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
                expect().assertFail();
                done();
            } catch (error) {
                let err = error as BusinessError
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR:' + error);
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + err.code);
                expect(err.code).assertEqual(1000001);
            }
            done();
        });


        /**
         * @tc.number Test_load_model_from_fd_error_code_static_002
         * @tc.name   Test_load_model_from_fd_error_code_static_002
         * @tc.desc: 正常场景：错误码新增看护，看护loadModelFromFd错误码1000007
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_from_fd_error_code_static_002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_from_fd_error_code_static_002");
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface_0.input';
            let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
            let context: mindSporeLite.Context = {};
            context.target = ["cpu"];
            try {
                let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
                hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
                expect().assertFail();
                done();
            } catch (error) {
                let err = error as BusinessError
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR:' + error);
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + err.code);
                expect(err.code).assertEqual(1000007);
            }
            done();
        });

        /**
         * @tc.number Test_load_model_from_fd_error_code_static_003
         * @tc.name   Test_load_model_from_fd_error_code_static_003
         * @tc.desc: 正常场景：错误码新增看护，看护loadModelFromFd,callback接口,错误码1000001
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_from_fd_error_code_static_003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_from_fd_error_code_static_003");
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
            let context: mindSporeLite.Context = {};
            context.target = ["suv"];
            try {
                mindSporeLite.loadModelFromFd(file.fd, context, (msliteModel: mindSporeLite.Model) => {
                hilog.info(domain, tag, '%{public}s', 'loadModel callback api error code test:ERROR');
                expect().assertFail();
                done();
                })
            } catch (error) {
                error = error as BusinessError;
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR:' + error);
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
                expect(error.code).assertEqual(1000001);
                done();
            }
        });

        /**
         * @tc.number Test_load_model_from_fd_error_code_static_004
         * @tc.name   Test_load_model_from_fd_error_code_static_004
         * @tc.desc: 正常场景：错误码新增看护，看护loadModelFromFd,callback接口,错误码1000007
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_from_fd_error_code_static_004', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_from_fd_error_code_static_004");
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface_0.input';
            let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
            let context: mindSporeLite.Context = {};
            context.target = ["cpu"];
            try {
                mindSporeLite.loadModelFromFd(file.fd, context, (msliteModel: mindSporeLite.Model) => {
                hilog.info(domain, tag, '%{public}s', 'loadModel callback api error code test:ERROR');
                expect().assertFail();
                done();
                })
            } catch (error) {
                error = error as BusinessError;
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR:' + error);
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
                expect(error.code).assertEqual(1000007);
                done();
            }
        });

        /**
         * @tc.number Test_load_model_from_fd_error_code_static_005
         * @tc.name   Test_load_model_from_fd_error_code_static_005
         * @tc.desc: 正常场景：错误码新增看护，看护loadModelFromFd,callback接口,context默认,错误码1000007
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_from_fd_error_code_static_005', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_from_fd_error_code_static_005");
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface_0.input';
            let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
            try {
                mindSporeLite.loadModelFromFd(file.fd, (msliteModel: mindSporeLite.Model) => {
                hilog.info(domain, tag, '%{public}s', 'loadModel callback api error code test:ERROR');
                expect().assertFail();
                done();
                })
            } catch (error) {
                error = error as BusinessError;
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR:' + error);
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + error.code);
                expect(error.code).assertEqual(1000007);
                done();
            }
        });

        /**
         * @tc.number Test_load_train_model_from_file_error_code_static_001
         * @tc.name   Test_load_train_model_from_file_error_code_static_001
         * @tc.desc: 正常场景：错误码新增看护，看护loadTrainModelFromFile错误码1000008
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_train_model_from_file_error_code_static_001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_train_model_from_file_error_code_static_001");
            let model_file = "";
            let cfg: mindSporeLite.TrainCfg = {};
            let context: mindSporeLite.Context = {};
            context.target = ["cpu"];
            try {
                let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
                hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
                expect().assertFail();
                done();
            } catch (error) {
                let err = error as BusinessError
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR:' + error);
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + err.code);
                expect(err.code).assertEqual(1000008);
                done();
            }
        });

        /**
         * @tc.number Test_load_train_model_from_file_error_code_static_002
         * @tc.name   Test_load_train_model_from_file_error_code_static_002
         * @tc.desc: 正常场景：错误码新增看护，看护loadTrainModelFromFile错误码1000001
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_train_model_from_file_error_code_static_002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_train_model_from_file_error_code_static_002");
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let cfg: mindSporeLite.TrainCfg = {};
            let context: mindSporeLite.Context = {};
            context.target = ["suv"];
            try {
                let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
                hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
                expect().assertFail();
                done();
            } catch (error) {
                let err = error as BusinessError
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR:' + error);
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + err.code);
                expect(err.code).assertEqual(1000001);
                done();
            }
        });

        /**
         * @tc.number Test_load_train_model_from_file_error_code_static_003
         * @tc.name   Test_load_train_model_from_file_error_code_static_003
         * @tc.desc: 正常场景：错误码新增看护，看护loadTrainModelFromFile错误码1000009
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_train_model_from_file_error_code_static_003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_train_model_from_file_error_code_static_003");
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface_0.input';
            let cfg: mindSporeLite.TrainCfg = {};
            let context: mindSporeLite.Context = {};
            context.target = ["cpu"];
            try {
                let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
                hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
                expect().assertFail();
                done();
            } catch (error) {
                let err = error as BusinessError
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR:' + error);
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + err.code);
                expect(err.code).assertEqual(1000009);
                done();
            }
        });

        /**
         * @tc.number Test_load_train_model_from_buffer_error_code_static_001
         * @tc.name   Test_load_train_model_from_buffer_error_code_static_001
         * @tc.desc: 正常场景：错误码新增看护，看护loadTrainModelFromBuffer错误码1000010
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_train_model_from_buffer_error_code_static_001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_train_model_from_buffer_error_code_static_001");
            let modelBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent("test.txt");
            let cfg: mindSporeLite.TrainCfg = {};
            let context: mindSporeLite.Context = {};
            context.target = ["cpu"];
            try {
                let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer, cfg, context);
                hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
                expect().assertFail();
                done();
            } catch (error) {
                let err = error as BusinessError
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR:' + error);
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + err.code);
                expect(err.code).assertEqual(1000010);
                done();
            }
        });

        /**
         * @tc.number Test_load_train_model_from_buffer_error_code_static_002
         * @tc.name   Test_load_train_model_from_buffer_error_code_static_002
         * @tc.desc: 正常场景：错误码新增看护，看护loadTrainModelFromBuffer错误码1000001
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_train_model_from_buffer_error_code_static_002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_train_model_from_buffer_error_code_static_002");
            let modelBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent("ml_face_isface.ms");
            let cfg: mindSporeLite.TrainCfg = {};
            let context: mindSporeLite.Context = {};
            context.target = ["suv"];
            try {
                let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer, cfg, context);
                hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
                expect().assertFail();
                done();
            } catch (error) {
                let err = error as BusinessError
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR:' + error);
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + err.code);
                expect(err.code).assertEqual(1000001);
                done();
            }
        });

        /**
         * @tc.number Test_load_train_model_from_buffer_error_code_static_003
         * @tc.name   Test_load_train_model_from_buffer_error_code_static_003
         * @tc.desc: 正常场景：错误码新增看护，看护loadTrainModelFromBuffer错误码1000011
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_train_model_from_buffer_error_code_static_003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_train_model_from_buffer_error_code_static_003");
            let modelBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent("ml_headpose_pb2tflite_0.input");
            let cfg: mindSporeLite.TrainCfg = {};
            let context: mindSporeLite.Context = {};
            context.target = ["cpu"];
            try {
                let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer, cfg, context);
                hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
                expect().assertFail();
                done();
            } catch (error) {
                let err = error as BusinessError
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR:' + error);
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + err.code);
                expect(err.code).assertEqual(1000011);
                done();
            }
        });

        /**
         * @tc.number Test_load_train_model_from_fd_error_code_static_001
         * @tc.name   Test_load_train_model_from_fd_error_code_static_001
         * @tc.desc: 正常场景：错误码新增看护，看护loadTrainModelFromBuffer错误码1000001
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_train_model_from_fd_error_code_static_001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_train_model_from_fd_error_code_static_001");
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
            let cfg: mindSporeLite.TrainCfg = {};
            let context: mindSporeLite.Context = {};
            context.target = ["suv"];
            try {
                let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, cfg, context);
                hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
                expect().assertFail();
                done();
            } catch (error) {
                let err = error as BusinessError
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR:' + error);
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + err.code);
                expect(err.code).assertEqual(1000001);
                done();
            }
        });

        /**
         * @tc.number Test_load_train_model_from_fd_error_code_static_002
         * @tc.name   Test_load_train_model_from_fd_error_code_static_002
         * @tc.desc: 正常场景：错误码新增看护，看护loadTrainModelFromBuffer错误码1000012
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_train_model_from_fd_error_code_static_002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_train_model_from_fd_error_code_static_002");
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface_0.input';
            let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
            let cfg: mindSporeLite.TrainCfg = {};
            let context: mindSporeLite.Context = {};
            context.target = ["cpu"];
            try {
                let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, cfg, context);
                hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
                expect().assertFail();
                done();
            } catch (error) {
                let err = error as BusinessError
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR:' + error);
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + err.code);
                expect(err.code).assertEqual(1000012);
                done();
            }
        });

        /**
         * @tc.number Test_setdata_error_code_static_001
         * @tc.name   Test_setdata_error_code_static_001
         * @tc.desc: 正常场景：错误码新增看护，看护setData错误码1000013
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_setdata_error_code_static_001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_setdata_error_code_static_001");
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
            let input_Buffer = new ArrayBuffer(0);
            try {
                modelInputs[0].setData(input_Buffer);
                hilog.info(domain, tag, '%{public}s', '=========MSLITE predict start=====');
                expect().assertFail();
                done();
            } catch (error) {
                let err = error as BusinessError
                hilog.info(domain, tag, '%{public}s', 'setData fail,ERROR:' + error);
                hilog.info(domain, tag, '%{public}s', 'setData fail,ERROR.code:' + err.code);
                expect(err.code).assertEqual(1000013);
                done();
            }
        });

        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_loadTrainModelFromFile_parameter_static_0001
         * @tc.name   SUB_AI_MindSpore_ArkTS_loadTrainModelFromFile_parameter_static_0001
         * @tc.desc: loadTrainModelFromFile参数3个
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_loadTrainModelFromFile_parameter_static_0001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_loadTrainModelFromFile_parameter_static_0001")

            let inputBuffer0: Uint8Array = await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array = await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let model_file = abilityContext.filesDir + '/' + 'lenet_train.ms';
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let cfg: mindSporeLite.TrainCfg = {};
            let context:mindSporeLite.Context={};
            context.target = ["cpu"];
            context.cpu = {};
            context.cpu = {
                threadNum: 1,
                threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST
            };
            let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.NO_QUANT, true);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModelFromFile===========");
            let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
            expect(predictModel !== null).assertTrue();
            predictModel.trainMode = false;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const predictInputs = predictModel.getInputs();
            for (let i = 0; i < predictInputs.length; i++) {
                let printStr = predictInputs[i].name + ", ";
                printStr += predictInputs[i].shape + ", ";
                printStr += predictInputs[i].dtype + ", ";
                printStr += predictInputs[i].dataSize + ", ";
                printStr += predictInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE predictInputs==========="+printStr);
            }
            predictInputs[0].setData(inputBuffer0.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE predict===========");
            let modelOutputs = await predictModel.predict(predictInputs);
            expect(modelOutputs !== null).assertTrue();
            for (let i = 0; i < modelOutputs.length; i++) {
                let printStr = modelOutputs[i].name + ", ";
                printStr += modelOutputs[i].shape + ", ";
                printStr += modelOutputs[i].dtype + ", ";
                printStr += modelOutputs[i].dataSize + ", ";
                printStr += modelOutputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelOutputs==========="+printStr);
            }
            let output0 = new Float32Array(modelOutputs[0].getData());
            for (let i = 0; i < 20; i++) {
                hilog.info(domain, tag, '%{public}s', 'output:'+output0[i]);
            }
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })

        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_loadTrainModelFromFile_parameter_static_0002
         * @tc.name   SUB_AI_MindSpore_ArkTS_loadTrainModelFromFile_parameter_static_0002
         * @tc.desc: loadTrainModelFromFile参数2个
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_loadTrainModelFromFile_parameter_static_0002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_loadTrainModelFromFile_parameter_static_0002");

            let inputBuffer0: Uint8Array = await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array = await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let model_file = abilityContext.filesDir + '/' + 'lenet_train.ms';
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let cfg: mindSporeLite.TrainCfg = {};
            let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.NO_QUANT, true);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModelFromFile===========");
            let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
            expect(predictModel !== null).assertTrue();
            predictModel.trainMode = false;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const predictInputs = predictModel.getInputs();
            for (let i = 0; i < predictInputs.length; i++) {
                let printStr = predictInputs[i].name + ", ";
                printStr += predictInputs[i].shape + ", ";
                printStr += predictInputs[i].dtype + ", ";
                printStr += predictInputs[i].dataSize + ", ";
                printStr += predictInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE predictInputs==========="+printStr);
            }
            predictInputs[0].setData(inputBuffer0.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE predict===========");
            let modelOutputs = await predictModel.predict(predictInputs);
            expect(modelOutputs !== null).assertTrue();
            for (let i = 0; i < modelOutputs.length; i++) {
                let printStr = modelOutputs[i].name + ", ";
                printStr += modelOutputs[i].shape + ", ";
                printStr += modelOutputs[i].dtype + ", ";
                printStr += modelOutputs[i].dataSize + ", ";
                printStr += modelOutputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelOutputs==========="+printStr);
            }
            let output0 = new Float32Array(modelOutputs[0].getData());
            for (let i = 0; i < 20; i++) {
                hilog.info(domain, tag, '%{public}s', 'output:'+output0[i]);
            }
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_loadTrainModelFromBuffer_parameter_static_0001
         * @tc.name   SUB_AI_MindSpore_ArkTS_loadTrainModelFromBuffer_parameter_static_0001
         * @tc.desc: loadTrainModelFromBuffer参数3个
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_loadTrainModelFromBuffer_parameter_static_0001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_loadTrainModelFromBuffer_parameter_static_0001");

            let inputBuffer0: Uint8Array = await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array = await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let modelBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent("lenet_train.ms");
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let cfg: mindSporeLite.TrainCfg = {};
            let context:mindSporeLite.Context={};
            context.target = ["cpu"];
            context.cpu = {};
            context.cpu = {
                threadNum: 1,
                threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST
            };
            let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer, cfg, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.NO_QUANT, true);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModelFromFile===========");
            let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
            expect(predictModel !== null).assertTrue();
            predictModel.trainMode = false;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const predictInputs = predictModel.getInputs();
            for (let i = 0; i < predictInputs.length; i++) {
                let printStr = predictInputs[i].name + ", ";
                printStr += predictInputs[i].shape + ", ";
                printStr += predictInputs[i].dtype + ", ";
                printStr += predictInputs[i].dataSize + ", ";
                printStr += predictInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE predictInputs==========="+printStr);
            }
            predictInputs[0].setData(inputBuffer0.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE predict===========");
            let modelOutputs = await predictModel.predict(predictInputs);
            expect(modelOutputs !== null).assertTrue();
            for (let i = 0; i < modelOutputs.length; i++) {
                let printStr = modelOutputs[i].name + ", ";
                printStr += modelOutputs[i].shape + ", ";
                printStr += modelOutputs[i].dtype + ", ";
                printStr += modelOutputs[i].dataSize + ", ";
                printStr += modelOutputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelOutputs==========="+printStr);
            }
            let output0 = new Float32Array(modelOutputs[0].getData());
            for (let i = 0; i < 20; i++) {
                hilog.info(domain, tag, '%{public}s', 'output:'+output0[i]);
            }
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_loadTrainModelFromBuffer_parameter_static_0002
         * @tc.name   SUB_AI_MindSpore_ArkTS_loadTrainModelFromBuffer_parameter_static_0002
         * @tc.desc: loadTrainModelFromBuffer参数2个
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_loadTrainModelFromBuffer_parameter_static_0002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_loadTrainModelFromBuffer_parameter_static_0002");
            let inputBuffer0: Uint8Array = await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array = await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let modelBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent("lenet_train.ms");
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let cfg: mindSporeLite.TrainCfg = {};
            let context:mindSporeLite.Context={};
            context.target = ["cpu"];
            let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer, cfg);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.NO_QUANT, true);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModelFromFile===========");
            let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
            expect(predictModel !== null).assertTrue();
            predictModel.trainMode = false;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const predictInputs = predictModel.getInputs();
            for (let i = 0; i < predictInputs.length; i++) {
                let printStr = predictInputs[i].name + ", ";
                printStr += predictInputs[i].shape + ", ";
                printStr += predictInputs[i].dtype + ", ";
                printStr += predictInputs[i].dataSize + ", ";
                printStr += predictInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE predictInputs==========="+printStr);
            }
            predictInputs[0].setData(inputBuffer0.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE predict===========");
            let modelOutputs = await predictModel.predict(predictInputs);
            expect(modelOutputs !== null).assertTrue();
            for (let i = 0; i < modelOutputs.length; i++) {
                let printStr = modelOutputs[i].name + ", ";
                printStr += modelOutputs[i].shape + ", ";
                printStr += modelOutputs[i].dtype + ", ";
                printStr += modelOutputs[i].dataSize + ", ";
                printStr += modelOutputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelOutputs==========="+printStr);
            }
            let output0 = new Float32Array(modelOutputs[0].getData());
            for (let i = 0; i < 20; i++) {
                hilog.info(domain, tag, '%{public}s', 'output:'+output0[i]);
            }
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_loadTrainModelFromFd_parameter_static_0001
         * @tc.name   SUB_AI_MindSpore_ArkTS_loadTrainModelFromFd_parameter_static_0001
         * @tc.desc: loadTrainModelFromFd参数3个
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_loadTrainModelFromFd_parameter_static_0001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_loadTrainModelFromFd_parameter_static_0001");

            let inputBuffer0: Uint8Array = await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array = await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let model_file = abilityContext.filesDir + '/' + 'lenet_train.ms';
            let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let cfg: mindSporeLite.TrainCfg = {};
            let context:mindSporeLite.Context={};
            context.target = ["cpu"];
            context.cpu = {};
            context.cpu = {
                threadNum: 1,
                threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST
            };
            let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, cfg, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.NO_QUANT, true);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModelFromFile===========");
            let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
            expect(predictModel !== null).assertTrue();
            predictModel.trainMode = false;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const predictInputs = predictModel.getInputs();
            for (let i = 0; i < predictInputs.length; i++) {
                let printStr = predictInputs[i].name + ", ";
                printStr += predictInputs[i].shape + ", ";
                printStr += predictInputs[i].dtype + ", ";
                printStr += predictInputs[i].dataSize + ", ";
                printStr += predictInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE predictInputs==========="+printStr);
            }
            predictInputs[0].setData(inputBuffer0.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE predict===========");
            let modelOutputs = await predictModel.predict(predictInputs);
            expect(modelOutputs !== null).assertTrue();
            for (let i = 0; i < modelOutputs.length; i++) {
                let printStr = modelOutputs[i].name + ", ";
                printStr += modelOutputs[i].shape + ", ";
                printStr += modelOutputs[i].dtype + ", ";
                printStr += modelOutputs[i].dataSize + ", ";
                printStr += modelOutputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelOutputs==========="+printStr);
            }
            let output0 = new Float32Array(modelOutputs[0].getData());
            for (let i = 0; i < 20; i++) {
                hilog.info(domain, tag, '%{public}s', 'output:'+output0[i]);
            }
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_loadTrainModelFromFd_parameter_static_0002
         * @tc.name   SUB_AI_MindSpore_ArkTS_loadTrainModelFromFd_parameter_static_0002
         * @tc.desc: loadTrainModelFromFd参数2个
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_loadTrainModelFromFd_parameter_static_0002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_loadTrainModelFromFd_parameter_static_0002");

            let inputBuffer0: Uint8Array = await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array = await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let model_file = abilityContext.filesDir + '/' + 'lenet_train.ms';
            let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let cfg: mindSporeLite.TrainCfg = {};
            let context:mindSporeLite.Context={};
            context.target = ["cpu"];
            let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd, cfg);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.NO_QUANT, true);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModelFromFile===========");
            let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
            expect(predictModel !== null).assertTrue();
            predictModel.trainMode = false;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const predictInputs = predictModel.getInputs();
            for (let i = 0; i < predictInputs.length; i++) {
                let printStr = predictInputs[i].name + ", ";
                printStr += predictInputs[i].shape + ", ";
                printStr += predictInputs[i].dtype + ", ";
                printStr += predictInputs[i].dataSize + ", ";
                printStr += predictInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE predictInputs==========="+printStr);
            }
            predictInputs[0].setData(inputBuffer0.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE predict===========");
            let modelOutputs = await predictModel.predict(predictInputs);
            expect(modelOutputs !== null).assertTrue();
            for (let i = 0; i < modelOutputs.length; i++) {
                let printStr = modelOutputs[i].name + ", ";
                printStr += modelOutputs[i].shape + ", ";
                printStr += modelOutputs[i].dtype + ", ";
                printStr += modelOutputs[i].dataSize + ", ";
                printStr += modelOutputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelOutputs==========="+printStr);
            }
            let output0 = new Float32Array(modelOutputs[0].getData());
            for (let i = 0; i < 20; i++) {
                hilog.info(domain, tag, '%{public}s', 'output:'+output0[i]);
            }
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_exportModel_parameter_static_0001
         * @tc.name   SUB_AI_MindSpore_ArkTS_exportModel_parameter_static_0001
         * @tc.desc: exportModel参数4个
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_exportModel_parameter_static_0001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_exportModel_parameter_static_0001");

            let inputBuffer0: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let modelBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train.ms");
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            let outputTensorName = ["aaa"]
            ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.NO_QUANT, true, outputTensorName);
            expect(ret).assertFalse();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_exportModel_parameter_static_0002
         * @tc.name   SUB_AI_MindSpore_ArkTS_exportModel_parameter_static_0002
         * @tc.desc: exportModel参数2个
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_exportModel_parameter_static_0002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_exportModel_parameter_static_0002");

            let inputBuffer0: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let modelBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train.ms");
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.NO_QUANT);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModelFromFile===========");
            let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
            expect(predictModel !== null).assertTrue();
            predictModel.trainMode = false;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const predictInputs = predictModel.getInputs();
            for (let i = 0; i < predictInputs.length; i++) {
                let printStr = predictInputs[i].name + ", ";
                printStr += predictInputs[i].shape + ", ";
                printStr += predictInputs[i].dtype + ", ";
                printStr += predictInputs[i].dataSize + ", ";
                printStr += predictInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE predictInputs==========="+printStr);
            }
            predictInputs[0].setData(inputBuffer0.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE predict===========");
            let modelOutputs = await predictModel.predict(predictInputs);
            expect(modelOutputs !== null).assertTrue();
            for (let i = 0; i < modelOutputs.length; i++) {
                let printStr = modelOutputs[i].name + ", ";
                printStr += modelOutputs[i].shape + ", ";
                printStr += modelOutputs[i].dtype + ", ";
                printStr += modelOutputs[i].dataSize + ", ";
                printStr += modelOutputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelOutputs==========="+printStr);
            }
            let output0 = new Float32Array(modelOutputs[0].getData());
            for (let i = 0; i < 20; i++) {
                hilog.info(domain, tag, '%{public}s', 'output:'+output0[i]);
            }
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_exportModel_parameter_static_0003
         * @tc.name   SUB_AI_MindSpore_ArkTS_exportModel_parameter_static_0003
         * @tc.desc: exportModel参数3个
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_exportModel_parameter_static_0003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_exportModel_parameter_static_0003");

            let inputBuffer0: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let modelBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train.ms");
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.NO_QUANT, true);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModelFromFile===========");
            let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
            expect(predictModel !== null).assertTrue();
            predictModel.trainMode = false;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const predictInputs = predictModel.getInputs();
            for (let i = 0; i < predictInputs.length; i++) {
                let printStr = predictInputs[i].name + ", ";
                printStr += predictInputs[i].shape + ", ";
                printStr += predictInputs[i].dtype + ", ";
                printStr += predictInputs[i].dataSize + ", ";
                printStr += predictInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE predictInputs==========="+printStr);
            }
            predictInputs[0].setData(inputBuffer0.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE predict===========");
            let modelOutputs = await predictModel.predict(predictInputs);
            expect(modelOutputs !== null).assertTrue();
            for (let i = 0; i < modelOutputs.length; i++) {
                let printStr = modelOutputs[i].name + ", ";
                printStr += modelOutputs[i].shape + ", ";
                printStr += modelOutputs[i].dtype + ", ";
                printStr += modelOutputs[i].dataSize + ", ";
                printStr += modelOutputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelOutputs==========="+printStr);
            }
            let output0 = new Float32Array(modelOutputs[0].getData());
            for (let i = 0; i < 20; i++) {
                hilog.info(domain, tag, '%{public}s', 'output:'+output0[i]);
            }
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_parameter_static_0001
         * @tc.name   SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_parameter_static_0001
         * @tc.desc: exportWeightsCollaborateWithMicro参数4个
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_parameter_static_0001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_parameter_static_0001");

            let inputBuffer0: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let model_file = abilityContext.filesDir + '/' + 'lenet_train.ms';
            hilog.info(domain, tag, '%{public}s', "==========MSLITE Context===========");
            let context:mindSporeLite.Context={};
            context.target = ["cpu"];
            context.cpu = {};
            context.cpu = {
                threadNum: 1,
                threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST
            };
            hilog.info(domain, tag, '%{public}s', "==========MSLITE TrainCfg===========");
            let cfg:mindSporeLite.TrainCfg={};
            cfg.lossName = ["loss_fct", "_loss_fn", "SigmoidCrossEntropy"];
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            ret = msliteModel.exportWeightsCollaborateWithMicro(path +"/micro_weight.bin", true, false, [""]);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_parameter_static_0002
         * @tc.name   SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_parameter_static_0002
         * @tc.desc: exportWeightsCollaborateWithMicro参数2个
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_parameter_static_0002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_parameter_static_0002");

            let inputBuffer0: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let model_file = abilityContext.filesDir + '/' + 'lenet_train.ms';
            hilog.info(domain, tag, '%{public}s', "==========MSLITE Context===========");
            let context:mindSporeLite.Context={};
            context.target = ["cpu"];
            context.cpu = {};
            context.cpu = {
                threadNum: 1,
                threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST
            };
            hilog.info(domain, tag, '%{public}s', "==========MSLITE TrainCfg===========");
            let cfg:mindSporeLite.TrainCfg={};
            cfg.lossName = ["loss_fct", "_loss_fn", "SigmoidCrossEntropy"];
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            ret = msliteModel.exportWeightsCollaborateWithMicro(path +"/micro_weight.bin", true);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_parameter_static_0003
         * @tc.name   SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_parameter_static_0003
         * @tc.desc: exportWeightsCollaborateWithMicro参数3个
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_parameter_static_0003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_parameter_static_0003");

            let inputBuffer0: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let model_file = abilityContext.filesDir + '/' + 'lenet_train.ms';
            hilog.info(domain, tag, '%{public}s', "==========MSLITE Context===========");
            let context:mindSporeLite.Context={};
            context.target = ["cpu"];
            context.cpu = {};
            context.cpu = {
                threadNum: 1,
                threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST
            };
            hilog.info(domain, tag, '%{public}s', "==========MSLITE TrainCfg===========");
            let cfg:mindSporeLite.TrainCfg={};
            cfg.lossName = ["loss_fct", "_loss_fn", "SigmoidCrossEntropy"];
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            ret = msliteModel.exportWeightsCollaborateWithMicro(path +"/micro_weight.bin", true, false);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_loadTrainModelFromFile_static_0001
         * @tc.name   SUB_AI_MindSpore_ArkTS_loadTrainModelFromFile_static_0001
         * @tc.desc   正常场景：通过path加载模型，执行1轮训练并对比精度
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_loadTrainModelFromFile_static_0001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_loadTrainModelFromFile_static_0001");
            let inputBuffer0: Uint8Array = await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array = await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let model_file = abilityContext.filesDir + '/' + 'lenet_train.ms';
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.NO_QUANT, true);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModelFromFile===========");
            let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
            expect(predictModel !== null).assertTrue();
            predictModel.trainMode = false;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const predictInputs = predictModel.getInputs();
            for (let i = 0; i < predictInputs.length; i++) {
                let printStr = predictInputs[i].name + ", ";
                printStr += predictInputs[i].shape + ", ";
                printStr += predictInputs[i].dtype + ", ";
                printStr += predictInputs[i].dataSize + ", ";
                printStr += predictInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE predictInputs==========="+printStr);
            }
            predictInputs[0].setData(inputBuffer0.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE predict===========");
            let modelOutputs = await predictModel.predict(predictInputs);
            expect(modelOutputs !== null).assertTrue();
            for (let i = 0; i < modelOutputs.length; i++) {
                let printStr = modelOutputs[i].name + ", ";
                printStr += modelOutputs[i].shape + ", ";
                printStr += modelOutputs[i].dtype + ", ";
                printStr += modelOutputs[i].dataSize + ", ";
                printStr += modelOutputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelOutputs==========="+printStr);
            }
            let output0 = new Float32Array(modelOutputs[0].getData());
            for (let i = 0; i < 20; i++) {
                hilog.info(domain, tag, '%{public}s', 'output:'+output0[i]);
            }
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_loadTrainModelFromFile_static_0002
         * @tc.name   SUB_AI_MindSpore_ArkTS_loadTrainModelFromFile_static_0002
         * @tc.desc   异常场景：加载模型文件路径不存在
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_loadTrainModelFromFile_static_0002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_loadTrainModelFromFile_static_0002");
            let model_file = abilityContext.filesDir + '/not_exist/' + 'ml_face_isface_0.input';
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            try {
                let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file);
                hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel success===========");
                expect(msliteModel).not().assertNull();
                const modelInputs = msliteModel.getInputs();
                expect(modelInputs).assertUndefined();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            } catch (error) {
                let err = error as BusinessError
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR:' + error);
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + err.code);
                expect(err.code).assertEqual(1000009);
            }
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_loadTrainModelFromFile_static_0003
         * @tc.name   SUB_AI_MindSpore_ArkTS_loadTrainModelFromFile_static_0003
         * @tc.desc   异常场景：加载模型文件路径为空
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_loadTrainModelFromFile_static_0003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_loadTrainModelFromFile_static_0003");
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            try {
                let msliteModel = await mindSporeLite.loadTrainModelFromFile("");
                hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
                expect().assertFail();
                done();
                
            } catch (error) {
                let err = error as BusinessError
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR:' + error);
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + err.code);
                expect(err.code).assertEqual(1000008);
                done();
            }
            
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_loadTrainModelFromFile_static_0004
         * @tc.name   SUB_AI_MindSpore_ArkTS_loadTrainModelFromFile_static_0004
         * @tc.desc   异常场景：加载模型文件路径为错误文件
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_loadTrainModelFromFile_static_0004', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_loadTrainModelFromFile_static_0004");
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface_0.input';
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            try {
                let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file);
                hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel success===========");
                expect(msliteModel).not().assertNull();
                const modelInputs = msliteModel.getInputs();
                expect(modelInputs).assertUndefined();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            } catch (error) {
                let err = error as BusinessError
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR:' + error);
                hilog.info(domain, tag, '%{public}s', 'loadModel fail,ERROR.code:' + err.code);
                expect(err.code).assertEqual(1000009);
            }
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_loadTrainModelFromBuffer_static_0001
         * @tc.name   SUB_AI_MindSpore_ArkTS_loadTrainModelFromBuffer_static_0001
         * @tc.desc   正常场景：通过path加载模型，执行1轮训练并对比精度
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_loadTrainModelFromBuffer_static_0001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_loadTrainModelFromBuffer_static_0001");
            let inputBuffer0: Uint8Array = await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array = await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let modelBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent("lenet_train.ms");
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.NO_QUANT, true);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModelFromFile===========");
            let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
            expect(predictModel !== null).assertTrue();
            predictModel.trainMode = false;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const predictInputs = predictModel.getInputs();
            for (let i = 0; i < predictInputs.length; i++) {
                let printStr = predictInputs[i].name + ", ";
                printStr += predictInputs[i].shape + ", ";
                printStr += predictInputs[i].dtype + ", ";
                printStr += predictInputs[i].dataSize + ", ";
                printStr += predictInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE predictInputs==========="+printStr);
            }
            predictInputs[0].setData(inputBuffer0.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE predict===========");
            let modelOutputs = await predictModel.predict(predictInputs);
            expect(modelOutputs !== null).assertTrue();
            for (let i = 0; i < modelOutputs.length; i++) {
                let printStr = modelOutputs[i].name + ", ";
                printStr += modelOutputs[i].shape + ", ";
                printStr += modelOutputs[i].dtype + ", ";
                printStr += modelOutputs[i].dataSize + ", ";
                printStr += modelOutputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelOutputs==========="+printStr);
            }
            let output0 = new Float32Array(modelOutputs[0].getData());
            for (let i = 0; i < 20; i++) {
                hilog.info(domain, tag, '%{public}s', 'output:'+output0[i]);
            }
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_loadTrainModelFromFd_static_0001
         * @tc.name   SUB_AI_MindSpore_ArkTS_loadTrainModelFromFd_static_0001
         * @tc.desc: 正常场景：通过path加载模型，执行1轮训练并对比精度
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_loadTrainModelFromFd_static_0001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_loadTrainModelFromFd_static_0001");
            let inputBuffer0: Uint8Array = await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array = await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let model_file = abilityContext.filesDir + '/' + 'lenet_train.ms';
            let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromFd(file.fd);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.NO_QUANT, true);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModelFromFile===========");
            let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
            expect(predictModel !== null).assertTrue();
            predictModel.trainMode = false;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const predictInputs = predictModel.getInputs();
            for (let i = 0; i < predictInputs.length; i++) {
                let printStr = predictInputs[i].name + ", ";
                printStr += predictInputs[i].shape + ", ";
                printStr += predictInputs[i].dtype + ", ";
                printStr += predictInputs[i].dataSize + ", ";
                printStr += predictInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE predictInputs==========="+printStr);
            }
            predictInputs[0].setData(inputBuffer0.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE predict===========");
            let modelOutputs = await predictModel.predict(predictInputs);
            expect(modelOutputs !== null).assertTrue();
            for (let i = 0; i < modelOutputs.length; i++) {
                let printStr = modelOutputs[i].name + ", ";
                printStr += modelOutputs[i].shape + ", ";
                printStr += modelOutputs[i].dtype + ", ";
                printStr += modelOutputs[i].dataSize + ", ";
                printStr += modelOutputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelOutputs==========="+printStr);
            }
            let output0 = new Float32Array(modelOutputs[0].getData());
            for (let i = 0; i < 20; i++) {
                hilog.info(domain, tag, '%{public}s', 'output:'+output0[i]);
            }
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_learningRate_static_0001
         * @tc.name   SUB_AI_MindSpore_ArkTS_learningRate_static_0001
         * @tc.desc: 正常场景：设置学习率为0.01
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_learningRate_static_0001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_learningRate_static_0001");
            let inputBuffer0: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let model_file = abilityContext.filesDir + '/' + 'lenet_train.ms';
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            msliteModel.learningRate = 0.01;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            ret = msliteModel.exportModel(path +"/lenet_train_infer.ms");
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModelFromFile===========");
            let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
            expect(predictModel !== null).assertTrue();
            predictModel.trainMode = false;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const predictInputs = predictModel.getInputs();
            for (let i = 0; i < predictInputs.length; i++) {
                let printStr = predictInputs[i].name + ", ";
                printStr += predictInputs[i].shape + ", ";
                printStr += predictInputs[i].dtype + ", ";
                printStr += predictInputs[i].dataSize + ", ";
                printStr += predictInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE predictInputs==========="+printStr);
            }
            predictInputs[0].setData(inputBuffer0.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE predict===========");
            let modelOutputs = await predictModel.predict(predictInputs);
            expect(modelOutputs !== null).assertTrue();
            for (let i = 0; i < modelOutputs.length; i++) {
                let printStr = modelOutputs[i].name + ", ";
                printStr += modelOutputs[i].shape + ", ";
                printStr += modelOutputs[i].dtype + ", ";
                printStr += modelOutputs[i].dataSize + ", ";
                printStr += modelOutputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelOutputs==========="+printStr);
            }
            let output0 = new Float32Array(modelOutputs[0].getData());
            for (let i = 0; i < 20; i++) {
                hilog.info(domain, tag, '%{public}s', 'output:'+output0[i]);
            }
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_learningRate_static_0002
         * @tc.name   SUB_AI_MindSpore_ArkTS_learningRate_static_0002
         * @tc.desc: 正常场景：设置学习率为1000.0
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_learningRate_static_0002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_learningRate_static_0002");
            let inputBuffer0: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let model_file = abilityContext.filesDir + '/' + 'lenet_train.ms';
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            msliteModel.learningRate = 1000.0;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            ret = msliteModel.exportModel(path +"/lenet_train_infer.ms");
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModelFromFile===========");
            let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
            expect(predictModel !== null).assertTrue();
            predictModel.trainMode = false;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const predictInputs = predictModel.getInputs();
            for (let i = 0; i < predictInputs.length; i++) {
                let printStr = predictInputs[i].name + ", ";
                printStr += predictInputs[i].shape + ", ";
                printStr += predictInputs[i].dtype + ", ";
                printStr += predictInputs[i].dataSize + ", ";
                printStr += predictInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE predictInputs==========="+printStr);
            }
            predictInputs[0].setData(inputBuffer0.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE predict===========");
            let modelOutputs = await predictModel.predict(predictInputs);
            expect(modelOutputs !== null).assertTrue();
            for (let i = 0; i < modelOutputs.length; i++) {
                let printStr = modelOutputs[i].name + ", ";
                printStr += modelOutputs[i].shape + ", ";
                printStr += modelOutputs[i].dtype + ", ";
                printStr += modelOutputs[i].dataSize + ", ";
                printStr += modelOutputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelOutputs==========="+printStr);
            }
            let output0 = new Float32Array(modelOutputs[0].getData());
            for (let i = 0; i < 20; i++) {
                hilog.info(domain, tag, '%{public}s', 'output:'+output0[i]);
            }
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_setupVirtualBatch_static_0001
         * @tc.name   SUB_AI_MindSpore_ArkTS_setupVirtualBatch_static_0001
         * @tc.desc: 设置虚拟batch_size为2
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_setupVirtualBatch_static_0001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_setupVirtualBatch_static_0001");
            let inputBuffer0: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let model_file = abilityContext.filesDir + '/' + 'lenet_train.ms';
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            let ret = msliteModel.setupVirtualBatch(2,-1,-1);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            ret = msliteModel.exportModel(path +"/lenet_train_infer.ms");
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModelFromFile===========");
            let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
            expect(predictModel !== null).assertTrue();
            predictModel.trainMode = false;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const predictInputs = predictModel.getInputs();
            for (let i = 0; i < predictInputs.length; i++) {
                let printStr = predictInputs[i].name + ", ";
                printStr += predictInputs[i].shape + ", ";
                printStr += predictInputs[i].dtype + ", ";
                printStr += predictInputs[i].dataSize + ", ";
                printStr += predictInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE predictInputs==========="+printStr);
            }
            predictInputs[0].setData(inputBuffer0.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE predict===========");
            let modelOutputs = await predictModel.predict(predictInputs);
            expect(modelOutputs !== null).assertTrue();
            for (let i = 0; i < modelOutputs.length; i++) {
                let printStr = modelOutputs[i].name + ", ";
                printStr += modelOutputs[i].shape + ", ";
                printStr += modelOutputs[i].dtype + ", ";
                printStr += modelOutputs[i].dataSize + ", ";
                printStr += modelOutputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelOutputs==========="+printStr);
            }
            let output0 = new Float32Array(modelOutputs[0].getData());
            for (let i = 0; i < 20; i++) {
                hilog.info(domain, tag, '%{public}s', 'output:'+output0[i]);
            }
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_optimizationLevel_static_0001
         * @tc.name   SUB_AI_MindSpore_ArkTS_optimizationLevel_static_0001
         * @tc.desc: 正常场景：设置优化等级O0
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_optimizationLevel_static_0001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_optimizationLevel_static_0001");

            let inputBuffer0: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let model_file = abilityContext.filesDir + '/' + 'lenet_train.ms';
            hilog.info(domain, tag, '%{public}s', "==========MSLITE Context===========");
            let context:mindSporeLite.Context={};
            context.target = ["cpu"];
            context.cpu = {};
            context.cpu = {threadNum: 1, threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST};
            hilog.info(domain, tag, '%{public}s', "==========MSLITE TrainCfg===========");
            let cfg:mindSporeLite.TrainCfg={};
            cfg.lossName = ["loss_fct", "_loss_fn", "SigmoidCrossEntropy"];
            cfg.optimizationLevel = mindSporeLite.OptimizationLevel.O0;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            msliteModel.learningRate = 0.001;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            ret = msliteModel.exportModel(path +"/lenet_train_infer.ms");
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModelFromFile===========");
            let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
            expect(predictModel !== null).assertTrue();
            predictModel.trainMode = false;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const predictInputs = predictModel.getInputs();
            for (let i = 0; i < predictInputs.length; i++) {
                let printStr = predictInputs[i].name + ", ";
                printStr += predictInputs[i].shape + ", ";
                printStr += predictInputs[i].dtype + ", ";
                printStr += predictInputs[i].dataSize + ", ";
                printStr += predictInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE predictInputs==========="+printStr);
            }
            predictInputs[0].setData(inputBuffer0.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE predict===========");
            let modelOutputs = await predictModel.predict(predictInputs);
            expect(modelOutputs !== null).assertTrue();
            for (let i = 0; i < modelOutputs.length; i++) {
                let printStr = modelOutputs[i].name + ", ";
                printStr += modelOutputs[i].shape + ", ";
                printStr += modelOutputs[i].dtype + ", ";
                printStr += modelOutputs[i].dataSize + ", ";
                printStr += modelOutputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelOutputs==========="+printStr);
            }
            let output0 = new Float32Array(modelOutputs[0].getData());
            for (let i = 0; i < 20; i++) {
                hilog.info(domain, tag, '%{public}s', 'output:'+output0[i]);
            }
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_optimizationLevel_static_0002
         * @tc.name   SUB_AI_MindSpore_ArkTS_optimizationLevel_static_0002
         * @tc.desc: 正常场景：设置优化等级O2
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_optimizationLevel_static_0002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_optimizationLevel_static_0002");

            let inputBuffer0: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let model_file = abilityContext.filesDir + '/' + 'lenet_train.ms';
            hilog.info(domain, tag, '%{public}s', "==========MSLITE Context===========");
            let context:mindSporeLite.Context={};
            context.target = ["cpu"];
            context.cpu = {};
            context.cpu = {threadNum: 1, threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST};
            hilog.info(domain, tag, '%{public}s', "==========MSLITE TrainCfg===========");
            let cfg:mindSporeLite.TrainCfg={};
            cfg.lossName = ["loss_fct", "_loss_fn", "SigmoidCrossEntropy"];
            cfg.optimizationLevel = mindSporeLite.OptimizationLevel.O2;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            msliteModel.learningRate = 0.001;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            ret = msliteModel.exportModel(path +"/lenet_train_infer.ms");
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModelFromFile===========");
            let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
            expect(predictModel !== null).assertTrue();
            predictModel.trainMode = false;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const predictInputs = predictModel.getInputs();
            for (let i = 0; i < predictInputs.length; i++) {
                let printStr = predictInputs[i].name + ", ";
                printStr += predictInputs[i].shape + ", ";
                printStr += predictInputs[i].dtype + ", ";
                printStr += predictInputs[i].dataSize + ", ";
                printStr += predictInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE predictInputs==========="+printStr);
            }
            predictInputs[0].setData(inputBuffer0.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE predict===========");
            let modelOutputs = await predictModel.predict(predictInputs);
            expect(modelOutputs !== null).assertTrue();
            for (let i = 0; i < modelOutputs.length; i++) {
                let printStr = modelOutputs[i].name + ", ";
                printStr += modelOutputs[i].shape + ", ";
                printStr += modelOutputs[i].dtype + ", ";
                printStr += modelOutputs[i].dataSize + ", ";
                printStr += modelOutputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelOutputs==========="+printStr);
            }
            let output0 = new Float32Array(modelOutputs[0].getData());
            for (let i = 0; i < 20; i++) {
                hilog.info(domain, tag, '%{public}s', 'output:'+output0[i]);
            }
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_optimizationLevel_static_0003
         * @tc.name   SUB_AI_MindSpore_ArkTS_optimizationLevel_static_0003
         * @tc.desc: 正常场景：设置优化等级O3
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_optimizationLevel_static_0003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_optimizationLevel_static_0003");

            let inputBuffer0: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let model_file = abilityContext.filesDir + '/' + 'lenet_train.ms';
            hilog.info(domain, tag, '%{public}s', "==========MSLITE Context===========");
            let context:mindSporeLite.Context={};
            context.target = ["cpu"];
            context.cpu = {};
            context.cpu = {threadNum: 1, threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST};
            hilog.info(domain, tag, '%{public}s', "==========MSLITE TrainCfg===========");
            let cfg:mindSporeLite.TrainCfg={};
            cfg.lossName = ["loss_fct", "_loss_fn", "SigmoidCrossEntropy"];
            cfg.optimizationLevel = mindSporeLite.OptimizationLevel.O3;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            msliteModel.learningRate = 0.001;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            ret = msliteModel.exportModel(path +"/lenet_train_infer.ms");
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModelFromFile===========");
            let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
            expect(predictModel !== null).assertTrue();
            predictModel.trainMode = false;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const predictInputs = predictModel.getInputs();
            for (let i = 0; i < predictInputs.length; i++) {
                let printStr = predictInputs[i].name + ", ";
                printStr += predictInputs[i].shape + ", ";
                printStr += predictInputs[i].dtype + ", ";
                printStr += predictInputs[i].dataSize + ", ";
                printStr += predictInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE predictInputs==========="+printStr);
            }
            predictInputs[0].setData(inputBuffer0.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE predict===========");
            let modelOutputs = await predictModel.predict(predictInputs);
            expect(modelOutputs !== null).assertTrue();
            for (let i = 0; i < modelOutputs.length; i++) {
                let printStr = modelOutputs[i].name + ", ";
                printStr += modelOutputs[i].shape + ", ";
                printStr += modelOutputs[i].dtype + ", ";
                printStr += modelOutputs[i].dataSize + ", ";
                printStr += modelOutputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelOutputs==========="+printStr);
            }
            let output0 = new Float32Array(modelOutputs[0].getData());
            for (let i = 0; i < 20; i++) {
                hilog.info(domain, tag, '%{public}s', 'output:'+output0[i]);
            }
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_optimizationLevel_static_0004
         * @tc.name   SUB_AI_MindSpore_ArkTS_optimizationLevel_static_0004
         * @tc.desc: 正常场景：设置优化等级AUTO
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_optimizationLevel_static_0004', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_optimizationLevel_static_0004");

            let inputBuffer0: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let model_file = abilityContext.filesDir + '/' + 'lenet_train.ms';
            hilog.info(domain, tag, '%{public}s', "==========MSLITE Context===========");
            let context:mindSporeLite.Context={};
            context.target = ["cpu"];
            context.cpu = {};
            context.cpu = {threadNum: 1, threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST};
            hilog.info(domain, tag, '%{public}s', "==========MSLITE TrainCfg===========");
            let cfg:mindSporeLite.TrainCfg={};
            cfg.lossName = ["loss_fct", "_loss_fn", "SigmoidCrossEntropy"];
            cfg.optimizationLevel = mindSporeLite.OptimizationLevel.AUTO;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            msliteModel.learningRate = 0.001;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            ret = msliteModel.exportModel(path +"/lenet_train_infer.ms");
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModelFromFile===========");
            let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
            expect(predictModel !== null).assertTrue();
            predictModel.trainMode = false;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const predictInputs = predictModel.getInputs();
            for (let i = 0; i < predictInputs.length; i++) {
                let printStr = predictInputs[i].name + ", ";
                printStr += predictInputs[i].shape + ", ";
                printStr += predictInputs[i].dtype + ", ";
                printStr += predictInputs[i].dataSize + ", ";
                printStr += predictInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE predictInputs==========="+printStr);
            }
            predictInputs[0].setData(inputBuffer0.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE predict===========");
            let modelOutputs = await predictModel.predict(predictInputs);
            expect(modelOutputs !== null).assertTrue();
            for (let i = 0; i < modelOutputs.length; i++) {
                let printStr = modelOutputs[i].name + ", ";
                printStr += modelOutputs[i].shape + ", ";
                printStr += modelOutputs[i].dtype + ", ";
                printStr += modelOutputs[i].dataSize + ", ";
                printStr += modelOutputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelOutputs==========="+printStr);
            }
            let output0 = new Float32Array(modelOutputs[0].getData());
            for (let i = 0; i < 20; i++) {
                hilog.info(domain, tag, '%{public}s', 'output:'+output0[i]);
            }
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_lossName_static_0001
         * @tc.name   SUB_AI_MindSpore_ArkTS_lossName_static_0001
         * @tc.desc: 正常场景：设置存在的损失函数名
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_lossName_static_0001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_lossName_static_0001");

            let inputBuffer0: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let model_file = abilityContext.filesDir + '/' + 'lenet_train.ms';
            hilog.info(domain, tag, '%{public}s', "==========MSLITE Context===========");
            let context:mindSporeLite.Context={};
            context.target = ["cpu"];
            context.cpu = {};
            context.cpu = {threadNum: 1, threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST};
            hilog.info(domain, tag, '%{public}s', "==========MSLITE TrainCfg===========");
            let cfg:mindSporeLite.TrainCfg={};
            cfg.lossName = ["loss_fct", "_loss_fn", "SigmoidCrossEntropy"];
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            msliteModel.learningRate = 0.001;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            ret = msliteModel.exportModel(path +"/lenet_train_infer.ms");
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModelFromFile===========");
            let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
            expect(predictModel !== null).assertTrue();
            predictModel.trainMode = false;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const predictInputs = predictModel.getInputs();
            for (let i = 0; i < predictInputs.length; i++) {
                let printStr = predictInputs[i].name + ", ";
                printStr += predictInputs[i].shape + ", ";
                printStr += predictInputs[i].dtype + ", ";
                printStr += predictInputs[i].dataSize + ", ";
                printStr += predictInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE predictInputs==========="+printStr);
            }
            predictInputs[0].setData(inputBuffer0.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE predict===========");
            let modelOutputs = await predictModel.predict(predictInputs);
            expect(modelOutputs !== null).assertTrue();
            for (let i = 0; i < modelOutputs.length; i++) {
                let printStr = modelOutputs[i].name + ", ";
                printStr += modelOutputs[i].shape + ", ";
                printStr += modelOutputs[i].dtype + ", ";
                printStr += modelOutputs[i].dataSize + ", ";
                printStr += modelOutputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelOutputs==========="+printStr);
            }
            let output0 = new Float32Array(modelOutputs[0].getData());
            for (let i = 0; i < 20; i++) {
                hilog.info(domain, tag, '%{public}s', 'output:'+output0[i]);
            }
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_lossName_static_0002
         * @tc.name   SUB_AI_MindSpore_ArkTS_lossName_static_0002
         * @tc.desc: 正常场景：设置不存在的损失函数名
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_lossName_static_0002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_lossName_static_0002");

            let inputBuffer0: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let model_file = abilityContext.filesDir + '/' + 'lenet_train.ms';
            hilog.info(domain, tag, '%{public}s', "==========MSLITE Context===========");
            let context:mindSporeLite.Context={};
            context.target = ["cpu"];
            context.cpu = {};
            context.cpu = {threadNum: 1, threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST};
            hilog.info(domain, tag, '%{public}s', "==========MSLITE TrainCfg===========");
            let cfg:mindSporeLite.TrainCfg={};
            cfg.lossName = ["aaa", "bbb", "ccc"];
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            msliteModel.learningRate = 0.001;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            ret = msliteModel.exportModel(path +"/lenet_train_infer.ms");
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModelFromFile===========");
            let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
            expect(predictModel !== null).assertTrue();
            predictModel.trainMode = false;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const predictInputs = predictModel.getInputs();
            for (let i = 0; i < predictInputs.length; i++) {
                let printStr = predictInputs[i].name + ", ";
                printStr += predictInputs[i].shape + ", ";
                printStr += predictInputs[i].dtype + ", ";
                printStr += predictInputs[i].dataSize + ", ";
                printStr += predictInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE predictInputs==========="+printStr);
            }
            predictInputs[0].setData(inputBuffer0.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE predict===========");
            let modelOutputs = await predictModel.predict(predictInputs);
            expect(modelOutputs !== null).assertTrue();
            for (let i = 0; i < modelOutputs.length; i++) {
                let printStr = modelOutputs[i].name + ", ";
                printStr += modelOutputs[i].shape + ", ";
                printStr += modelOutputs[i].dtype + ", ";
                printStr += modelOutputs[i].dataSize + ", ";
                printStr += modelOutputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelOutputs==========="+printStr);
            }
            let output0 = new Float32Array(modelOutputs[0].getData());
            for (let i = 0; i < 20; i++) {
                hilog.info(domain, tag, '%{public}s', 'output:'+output0[i]);
            }
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_updateWeights_static_0001
         * @tc.name   SUB_AI_MindSpore_ArkTS_updateWeights_static_0001
         * @tc.desc: 正常场景：更新权重
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_updateWeights_static_0001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_updateWeights_static_0001");
            let inputBuffer0: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let model_file = abilityContext.filesDir + '/' + 'lenet_train.ms';
            hilog.info(domain, tag, '%{public}s', "==========MSLITE Context===========");
            let context:mindSporeLite.Context={};
            context.target = ["cpu"];
            context.cpu = {};
            context.cpu = {threadNum: 1, threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST};
            hilog.info(domain, tag, '%{public}s', "==========MSLITE TrainCfg===========");
            let cfg:mindSporeLite.TrainCfg={};
            cfg.lossName = ["loss_fct", "_loss_fn", "SigmoidCrossEntropy"];
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getWeights===========");
            const weights = msliteModel.getWeights();
            for (let i = 0; i < weights.length; i++) {
                let printStr = weights[i].name + ", ";
                printStr += weights[i].shape + ", ";
                printStr += weights[i].dtype + ", ";
                printStr += weights[i].dataSize + ", ";
                printStr += weights[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE weights==========="+printStr);
            }
            let ret = msliteModel.updateWeights(weights);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_updateWeights_static_0002
         * @tc.name   SUB_AI_MindSpore_ArkTS_updateWeights_static_0002
         * @tc.desc: 正常场景：更新权重后导出训练图，再获取权重
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_updateWeights_static_0002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_updateWeights_static_0002");
            let inputBuffer0: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let model_file = abilityContext.filesDir + '/' + 'lenet_train.ms';
            hilog.info(domain, tag, '%{public}s', "==========MSLITE Context===========");
            let context:mindSporeLite.Context={};
            context.target = ["cpu"];
            context.cpu = {};
            context.cpu = {threadNum: 1, threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST};
            hilog.info(domain, tag, '%{public}s', "==========MSLITE TrainCfg===========");
            let cfg:mindSporeLite.TrainCfg={};
            cfg.lossName = ["loss_fct", "_loss_fn", "SigmoidCrossEntropy"];
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getWeights===========");
            const weights = msliteModel.getWeights();
            for (let i = 0; i < weights.length; i++) {
                let printStr = weights[i].name + ", ";
                printStr += weights[i].shape + ", ";
                printStr += weights[i].dtype + ", ";
                printStr += weights[i].dataSize + ", ";
                printStr += weights[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE weights==========="+printStr);
            }
            let ret = msliteModel.updateWeights(weights);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            ret = msliteModel.exportModel(path +"/lenet_train_infer.ms");
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModelFromFile===========");
            let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
            expect(predictModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getWeights2===========");
            const weights2 = predictModel.getWeights();
            for (let i = 0; i < weights2.length; i++) {
                let printStr = weights2[i].name + ", ";
                printStr += weights2[i].shape + ", ";
                printStr += weights2[i].dtype + ", ";
                printStr += weights2[i].dataSize + ", ";
                printStr += weights2[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE weights2==========="+printStr);
            }
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_exportModel_static_0001
         * @tc.name   SUB_AI_MindSpore_ArkTS_exportModel_static_0001
         * @tc.desc: 正常场景：训练model导出推理图后对比精度
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_exportModel_static_0001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_exportModel_static_0001");
            let inputBuffer0: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let modelBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train.ms");
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            ret = msliteModel.exportModel(path +"/lenet_train_infer.ms");
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModelFromFile===========");
            let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
            expect(predictModel !== null).assertTrue();
            predictModel.trainMode = false;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const predictInputs = predictModel.getInputs();
            for (let i = 0; i < predictInputs.length; i++) {
                let printStr = predictInputs[i].name + ", ";
                printStr += predictInputs[i].shape + ", ";
                printStr += predictInputs[i].dtype + ", ";
                printStr += predictInputs[i].dataSize + ", ";
                printStr += predictInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE predictInputs==========="+printStr);
            }
            predictInputs[0].setData(inputBuffer0.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE predict===========");
            let modelOutputs = await predictModel.predict(predictInputs);
            expect(modelOutputs !== null).assertTrue();
            for (let i = 0; i < modelOutputs.length; i++) {
                let printStr = modelOutputs[i].name + ", ";
                printStr += modelOutputs[i].shape + ", ";
                printStr += modelOutputs[i].dtype + ", ";
                printStr += modelOutputs[i].dataSize + ", ";
                printStr += modelOutputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelOutputs==========="+printStr);
            }
            let output0 = new Float32Array(modelOutputs[0].getData());
            for (let i = 0; i < 20; i++) {
                hilog.info(domain, tag, '%{public}s', 'output:'+output0[i]);
            }
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_exportModel_static_0002
         * @tc.name   SUB_AI_MindSpore_ArkTS_exportModel_static_0002
         * @tc.desc: 正常场景：quantization_type为OH_AI_NO_QUANT
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_exportModel_static_0002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_exportModel_static_0002");
            let inputBuffer0: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let modelBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train.ms");
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.NO_QUANT, true);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModelFromFile===========");
            let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
            expect(predictModel !== null).assertTrue();
            predictModel.trainMode = false;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const predictInputs = predictModel.getInputs();
            for (let i = 0; i < predictInputs.length; i++) {
                let printStr = predictInputs[i].name + ", ";
                printStr += predictInputs[i].shape + ", ";
                printStr += predictInputs[i].dtype + ", ";
                printStr += predictInputs[i].dataSize + ", ";
                printStr += predictInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE predictInputs==========="+printStr);
            }
            predictInputs[0].setData(inputBuffer0.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE predict===========");
            let modelOutputs = await predictModel.predict(predictInputs);
            expect(modelOutputs !== null).assertTrue();
            for (let i = 0; i < modelOutputs.length; i++) {
                let printStr = modelOutputs[i].name + ", ";
                printStr += modelOutputs[i].shape + ", ";
                printStr += modelOutputs[i].dtype + ", ";
                printStr += modelOutputs[i].dataSize + ", ";
                printStr += modelOutputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelOutputs==========="+printStr);
            }
            let output0 = new Float32Array(modelOutputs[0].getData());
            for (let i = 0; i < 20; i++) {
                hilog.info(domain, tag, '%{public}s', 'output:'+output0[i]);
            }
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_exportModel_static_0003
         * @tc.name   SUB_AI_MindSpore_ArkTS_exportModel_static_0003
         * @tc.desc: 正常场景：quantization_type为OH_AI_WEIGHT_QUANT
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_exportModel_static_0003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_exportModel_static_0003");
            let inputBuffer0: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let modelBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train.ms");
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.WEIGHT_QUANT, true);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModelFromFile===========");
            let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
            expect(predictModel !== null).assertTrue();
            predictModel.trainMode = false;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const predictInputs = predictModel.getInputs();
            for (let i = 0; i < predictInputs.length; i++) {
                let printStr = predictInputs[i].name + ", ";
                printStr += predictInputs[i].shape + ", ";
                printStr += predictInputs[i].dtype + ", ";
                printStr += predictInputs[i].dataSize + ", ";
                printStr += predictInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE predictInputs==========="+printStr);
            }
            predictInputs[0].setData(inputBuffer0.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE predict===========");
            let modelOutputs = await predictModel.predict(predictInputs);
            expect(modelOutputs !== null).assertTrue();
            for (let i = 0; i < modelOutputs.length; i++) {
                let printStr = modelOutputs[i].name + ", ";
                printStr += modelOutputs[i].shape + ", ";
                printStr += modelOutputs[i].dtype + ", ";
                printStr += modelOutputs[i].dataSize + ", ";
                printStr += modelOutputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelOutputs==========="+printStr);
            }
            let output0 = new Float32Array(modelOutputs[0].getData());
            for (let i = 0; i < 20; i++) {
                hilog.info(domain, tag, '%{public}s', 'output:'+output0[i]);
            }
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_exportModel_static_0004
         * @tc.name   SUB_AI_MindSpore_ArkTS_exportModel_static_0004
         * @tc.desc: 正常场景：quantization_type为OH_AI_FULL_QUANT
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_exportModel_static_0004', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_exportModel_static_0004");
            let inputBuffer0: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let modelBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train.ms");
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.FULL_QUANT, true);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModelFromFile===========");
            let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
            expect(predictModel !== null).assertTrue();
            predictModel.trainMode = false;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const predictInputs = predictModel.getInputs();
            for (let i = 0; i < predictInputs.length; i++) {
                let printStr = predictInputs[i].name + ", ";
                printStr += predictInputs[i].shape + ", ";
                printStr += predictInputs[i].dtype + ", ";
                printStr += predictInputs[i].dataSize + ", ";
                printStr += predictInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE predictInputs==========="+printStr);
            }
            predictInputs[0].setData(inputBuffer0.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE predict===========");
            let modelOutputs = await predictModel.predict(predictInputs);
            expect(modelOutputs !== null).assertTrue();
            for (let i = 0; i < modelOutputs.length; i++) {
                let printStr = modelOutputs[i].name + ", ";
                printStr += modelOutputs[i].shape + ", ";
                printStr += modelOutputs[i].dtype + ", ";
                printStr += modelOutputs[i].dataSize + ", ";
                printStr += modelOutputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelOutputs==========="+printStr);
            }
            let output0 = new Float32Array(modelOutputs[0].getData());
            for (let i = 0; i < 20; i++) {
                hilog.info(domain, tag, '%{public}s', 'output:'+output0[i]);
            }
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_exportModel_static_0005
         * @tc.name   SUB_AI_MindSpore_ArkTS_exportModel_static_0005
         * @tc.desc: 正常场景：export_inference_only为false
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_exportModel_static_0005', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_exportModel_static_0005");
            let inputBuffer0: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let modelBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train.ms");
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            ret = msliteModel.exportModel(path +"/lenet_train_train.ms", mindSporeLite.QuantizationType.NO_QUANT, false);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModelFromFile===========");
            let msliteModel2 = await mindSporeLite.loadTrainModelFromFile(path +"/lenet_train_train.ms");
            expect(msliteModel2 !== null).assertTrue();
            msliteModel2.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs2===========");
            const modelInputs2 = msliteModel.getInputs();
            for (let i = 0; i < modelInputs2.length; i++) {
                let printStr = modelInputs2[i].name + ", ";
                printStr += modelInputs2[i].shape + ", ";
                printStr += modelInputs2[i].dtype + ", ";
                printStr += modelInputs2[i].dataSize + ", ";
                printStr += modelInputs2[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs2==========="+printStr);
            }
            modelInputs2[0].setData(inputBuffer0.buffer);
            modelInputs2[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            ret = msliteModel2.runStep(modelInputs2);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.NO_QUANT, true);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModelFromFile===========");
            let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
            expect(predictModel !== null).assertTrue();
            predictModel.trainMode = false;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const predictInputs = predictModel.getInputs();
            for (let i = 0; i < predictInputs.length; i++) {
                let printStr = predictInputs[i].name + ", ";
                printStr += predictInputs[i].shape + ", ";
                printStr += predictInputs[i].dtype + ", ";
                printStr += predictInputs[i].dataSize + ", ";
                printStr += predictInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE predictInputs==========="+printStr);
            }
            predictInputs[0].setData(inputBuffer0.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE predict===========");
            let modelOutputs = await predictModel.predict(predictInputs);
            expect(modelOutputs !== null).assertTrue();
            for (let i = 0; i < modelOutputs.length; i++) {
                let printStr = modelOutputs[i].name + ", ";
                printStr += modelOutputs[i].shape + ", ";
                printStr += modelOutputs[i].dtype + ", ";
                printStr += modelOutputs[i].dataSize + ", ";
                printStr += modelOutputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelOutputs==========="+printStr);
            }
            let output0 = new Float32Array(modelOutputs[0].getData());
            for (let i = 0; i < 20; i++) {
                hilog.info(domain, tag, '%{public}s', 'output:'+output0[i]);
            }
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_exportModel_static_0006
         * @tc.name   SUB_AI_MindSpore_ArkTS_exportModel_static_0006
         * @tc.desc: 正常场景：export_inference_only为false，再指定output_tensor_name
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_exportModel_static_0006', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_exportModel_static_0006");
            let inputBuffer0: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let modelBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train.ms");
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            let outputTensorName = ["Default/network-WithLossCell/_loss_fn-L1Loss/ReduceMean-op127"]
            ret = msliteModel.exportModel(path +"/lenet_train_train.ms", mindSporeLite.QuantizationType.NO_QUANT, false, outputTensorName);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModelFromFile===========");
            let msliteModel2 = await mindSporeLite.loadTrainModelFromFile(path +"/lenet_train_train.ms");
            expect(msliteModel2 !== null).assertTrue();
            msliteModel2.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs2===========");
            const modelInputs2 = msliteModel.getInputs();
            for (let i = 0; i < modelInputs2.length; i++) {
                let printStr = modelInputs2[i].name + ", ";
                printStr += modelInputs2[i].shape + ", ";
                printStr += modelInputs2[i].dtype + ", ";
                printStr += modelInputs2[i].dataSize + ", ";
                printStr += modelInputs2[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs2==========="+printStr);
            }
            modelInputs2[0].setData(inputBuffer0.buffer);
            modelInputs2[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            ret = msliteModel2.runStep(modelInputs2);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.NO_QUANT, true);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModelFromFile===========");
            let predictModel = await mindSporeLite.loadModelFromFile(path +"/lenet_train_infer.ms");
            expect(predictModel !== null).assertTrue();
            predictModel.trainMode = false;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const predictInputs = predictModel.getInputs();
            for (let i = 0; i < predictInputs.length; i++) {
                let printStr = predictInputs[i].name + ", ";
                printStr += predictInputs[i].shape + ", ";
                printStr += predictInputs[i].dtype + ", ";
                printStr += predictInputs[i].dataSize + ", ";
                printStr += predictInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE predictInputs==========="+printStr);
            }
            predictInputs[0].setData(inputBuffer0.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE predict===========");
            let modelOutputs = await predictModel.predict(predictInputs);
            expect(modelOutputs !== null).assertTrue();
            for (let i = 0; i < modelOutputs.length; i++) {
                let printStr = modelOutputs[i].name + ", ";
                printStr += modelOutputs[i].shape + ", ";
                printStr += modelOutputs[i].dtype + ", ";
                printStr += modelOutputs[i].dataSize + ", ";
                printStr += modelOutputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelOutputs==========="+printStr);
            }
            let output0 = new Float32Array(modelOutputs[0].getData());
            for (let i = 0; i < 20; i++) {
                hilog.info(domain, tag, '%{public}s', 'output:'+output0[i]);
            }
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_exportModel_static_0007
         * @tc.name   SUB_AI_MindSpore_ArkTS_exportModel_static_0007
         * @tc.desc: 异常场景：指定导出不存在的output_tensor_name
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_exportModel_static_0007', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_exportModel_static_0007");
            let inputBuffer0: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let modelBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train.ms");
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            let outputTensorName = ["aaa"]
            ret = msliteModel.exportModel(path +"/lenet_train_infer.ms", mindSporeLite.QuantizationType.NO_QUANT, true, outputTensorName);
            expect(ret).assertFalse();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_exportModel_static_0008
         * @tc.name   SUB_AI_MindSpore_ArkTS_exportModel_static_0008
         * @tc.desc: 异常场景：model_file文件路径不存在
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_exportModel_static_0008', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_exportModel_static_0008");
            let inputBuffer0: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let modelBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train.ms");
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            ret = msliteModel.exportModel("/data/local/tmp/not_exist/lenet_train_infer.ms");
            expect(ret).assertFalse();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_exportModel_static_0009
         * @tc.name   SUB_AI_MindSpore_ArkTS_exportModel_static_0009
         * @tc.desc: 异常场景：model_file路径为空
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_exportModel_static_0009', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_exportModel_static_0009");
            let inputBuffer0: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let modelBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train.ms");
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            ret = msliteModel.exportModel("");
            expect(ret).assertFalse();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_exportModel_static_0010
         * @tc.name   SUB_AI_MindSpore_ArkTS_exportModel_static_0010
         * @tc.desc: 异常场景：model_file路径为文件夹
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_exportModel_static_0010', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_exportModel_static_0010");
            let inputBuffer0: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let modelBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train.ms");
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromBuffer(modelBuffer.buffer);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            ret = msliteModel.exportModel("/data/local/tmp");
            expect(ret).assertFalse();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_static_0001
         * @tc.name   SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_static_0001
         * @tc.desc: 正常场景：训练model更新并导出micro权重
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_static_0001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_static_0001");
            let inputBuffer0: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_0.input");
            let inputBuffer1: Uint8Array= await abilityContext.resourceManager.getRawFileContent("lenet_train_1.input");
            let model_file = abilityContext.filesDir + '/' + 'lenet_train.ms';
            hilog.info(domain, tag, '%{public}s', "==========MSLITE Context===========");
            let context:mindSporeLite.Context={};
            context.target = ["cpu"];
            context.cpu = {};
            context.cpu = {threadNum: 1, threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST};
            hilog.info(domain, tag, '%{public}s', "==========MSLITE TrainCfg===========");
            let cfg:mindSporeLite.TrainCfg={};
            cfg.lossName = ["loss_fct", "_loss_fn", "SigmoidCrossEntropy"];
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE trainMode==========="+msliteModel.trainMode);
            msliteModel.trainMode = true;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE set trainMode==========="+msliteModel.trainMode);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE getInputs===========");
            const modelInputs = msliteModel.getInputs();
            for (let i = 0; i < modelInputs.length; i++) {
                let printStr = modelInputs[i].name + ", ";
                printStr += modelInputs[i].shape + ", ";
                printStr += modelInputs[i].dtype + ", ";
                printStr += modelInputs[i].dataSize + ", ";
                printStr += modelInputs[i].getData();
                hilog.info(domain, tag, '%{public}s', "==========MSLITE modelInputs==========="+printStr);
            }
            modelInputs[0].setData(inputBuffer0.buffer);
            modelInputs[1].setData(inputBuffer1.buffer);
            hilog.info(domain, tag, '%{public}s', "==========MSLITE runStep===========");
            let ret = msliteModel.runStep(modelInputs);
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportModel===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            ret = msliteModel.exportWeightsCollaborateWithMicro(path +"/micro_weight.bin");
            expect(ret).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_static_0002
         * @tc.name   SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_static_0002
         * @tc.desc: 异常场景：weight_file文件路径不存在
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_static_0002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_static_0002");
            let model_file = abilityContext.filesDir + '/' + 'lenet_train.ms';
            hilog.info(domain, tag, '%{public}s', "==========MSLITE Context===========");
            let context:mindSporeLite.Context={};
            context.target = ["cpu"];
            context.cpu = {};
            context.cpu = {threadNum: 1, threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST};
            //context.cpu.threadNum = 1;
            //context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE TrainCfg===========");
            let cfg:mindSporeLite.TrainCfg={};
            cfg.lossName = ["loss_fct", "_loss_fn", "SigmoidCrossEntropy"];
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportWeightsCollaborateWithMicro===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            let ret = msliteModel.exportWeightsCollaborateWithMicro(path +"/not_exist/micro_weight.bin");
            expect(ret).assertFalse();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_static_0003
         * @tc.name   SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_static_0003
         * @tc.desc: 异常场景：weight_file路径为空
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_static_0003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_static_0003");
            let model_file = abilityContext.filesDir + '/' + 'lenet_train.ms';
            hilog.info(domain, tag, '%{public}s', "==========MSLITE Context===========");
            let context:mindSporeLite.Context={};
            context.target = ["cpu"];
            context.cpu = {};
            context.cpu = {threadNum: 1, threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST};
            hilog.info(domain, tag, '%{public}s', "==========MSLITE TrainCfg===========");
            let cfg:mindSporeLite.TrainCfg={};
            cfg.lossName = ["loss_fct", "_loss_fn", "SigmoidCrossEntropy"];
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportWeightsCollaborateWithMicro===========");
            let ret = msliteModel.exportWeightsCollaborateWithMicro("");
            expect(ret).assertFalse();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_static_0004
         * @tc.name   SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_static_0004
         * @tc.desc: 异常场景：weight_file路径为文件夹
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_static_0004', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_static_0004");
            let model_file = abilityContext.filesDir + '/' + 'lenet_train.ms';
            hilog.info(domain, tag, '%{public}s', "==========MSLITE Context===========");
            let context:mindSporeLite.Context={};
            context.target = ["cpu"];
            context.cpu = {};
            context.cpu = {threadNum: 1, threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST};
            hilog.info(domain, tag, '%{public}s', "==========MSLITE TrainCfg===========");
            let cfg:mindSporeLite.TrainCfg={};
            cfg.lossName = ["loss_fct", "_loss_fn", "SigmoidCrossEntropy"];
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportWeightsCollaborateWithMicro===========");
            let ret = msliteModel.exportWeightsCollaborateWithMicro("/data/local/tmp");
            expect(ret).assertFalse();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_static_0005
         * @tc.name   SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_static_0005
         * @tc.desc: 异常场景：is_inference为false
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_static_0005', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_exportWeightsCollaborateWithMicro_static_0005");
            let model_file = abilityContext.filesDir + '/' + 'lenet_train.ms';
            hilog.info(domain, tag, '%{public}s', "==========MSLITE Context===========");
            let context:mindSporeLite.Context={};
            context.target = ["cpu"];
            context.cpu = {};
            context.cpu = {threadNum: 1, threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST};
            hilog.info(domain, tag, '%{public}s', "==========MSLITE TrainCfg===========");
            let cfg:mindSporeLite.TrainCfg={};
            cfg.lossName = ["loss_fct", "_loss_fn", "SigmoidCrossEntropy"];
            hilog.info(domain, tag, '%{public}s', "==========MSLITE loadModel===========");
            let msliteModel = await mindSporeLite.loadTrainModelFromFile(model_file, cfg, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE exportWeightsCollaborateWithMicro===========");
            let path : String = abilityContext.filesDir;
            hilog.info(domain, tag, '%{public}s', "==========MSLITE path==========="+path);
            let ret = msliteModel.exportWeightsCollaborateWithMicro(path +"/not_exist/micro_weight.bin", false);
            expect(ret).assertFalse();
            hilog.info(domain, tag, '%{public}s', "==========MSLITE end===========");
            done();
        })


        /**
         * @tc.number Test_load_model_param_model_buffer_static
         * @tc.name   Test_load_model_param_model_buffer_static
         * @tc.desc: 正常场景：ModelBuild，调用buffer方法，正常推理
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_buffer_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:Test_load_model_param_model_buffer_static");
            let modelName = 'ml_face_isface.ms';
            let inputName = 'ml_face_isface_0.input';
            let inputBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let modelBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(modelName);
            let context: mindSporeLite.Context = {};
            context.target = ["cpu", "nnrt"];
            context.nnrt = {};
            context.cpu = {};
            context.cpu = {
                threadNum: 1,
                threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST,
                precisionMode: "preferred_fp16",
                threadAffinityCoreList: [0, 1, 2, 3]
            };
            let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context)
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
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
            let modelOutputs = await msliteModel.predict(modelInputs);
            expect(modelOutputs !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array start=====');
            let output0 = new Float32Array(modelOutputs[0].getData());
            hilog.info(domain, tag, '%{public}s', 'output0.length:' + output0.length);
            for (let i = 0; i < 2; i++) {
                hilog.info(domain, tag, '%{public}s', output0[i].toString());
                expect(output0[i].toString() !== null).assertTrue();
            }
            const modelInputs0 = msliteModel.getInputs();
            hilog.info(domain, tag, '%{public}s', modelInputs0[0].name.toString());
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        })


        /**
         * @tc.number Test_load_model_param_model_fd_static
         * @tc.name   Test_load_model_param_model_fd_static
         * @tc.desc: 正常场景：ModelBuild，调用fd方法，默认context，正常推理
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_fd_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:Test_load_model_param_model_fd_static");
            let inputName = 'ml_face_isface_0.input';
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let inputBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel start=====');
            let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
            let msliteModel = await mindSporeLite.loadModelFromFd(file.fd);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
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
            let modelOutputs = await msliteModel.predict(modelInputs);
            expect(modelOutputs !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array start=====');
            let output0 = new Float32Array(modelOutputs[0].getData());
            hilog.info(domain, tag, '%{public}s', 'output0.length:' + output0.length);
            for (let i = 0; i < 2; i++) {
                hilog.info(domain, tag, '%{public}s', output0[i].toString());
                expect(output0[i].toString() !== null).assertTrue();
            }
            const modelInputs0 = msliteModel.getInputs();
            hilog.info(domain, tag, '%{public}s', modelInputs0[0].name.toString());
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        })


        /**
         * @tc.number Test_load_model_param_model_fd_context_static
         * @tc.name   Test_load_model_param_model_fd_context_static
         * @tc.desc: 正常场景：ModelBuild，调用fd方法，正常推理
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_fd_context_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:Test_load_model_param_model_fd_context_static");
            let inputName = 'ml_face_isface_0.input';
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let inputBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel start=====');
            let context: mindSporeLite.Context = {};
            context.target = ["cpu", "nnrt"];
            context.nnrt = {};
            context.cpu = {};
            context.cpu = {
                threadNum: 1,
                threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST,
                precisionMode: "preferred_fp16",
                threadAffinityCoreList: [0, 1, 2, 3]
            };
            let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
            let msliteModel = await mindSporeLite.loadModelFromFd(file.fd, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
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
            let modelOutputs = await msliteModel.predict(modelInputs);
            expect(modelOutputs !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array start=====');
            let output0 = new Float32Array(modelOutputs[0].getData());
            hilog.info(domain, tag, '%{public}s', 'output0.length:' + output0.length);
            for (let i = 0; i < 2; i++) {
                hilog.info(domain, tag, '%{public}s', output0[i].toString());
                expect(output0[i].toString() !== null).assertTrue();
            }
            const modelInputs0 = msliteModel.getInputs();
            hilog.info(domain, tag, '%{public}s', modelInputs0[0].name.toString());
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        })


        /**
         * @tc.number Test_load_model_param_model_path_static
         * @tc.name   Test_load_model_param_model_path_static
         * @tc.desc: 正常场景：ModelBuild，调用loadModelFromFile方法，正常推理
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:Test_load_model_param_model_path_static");
            let inputName = 'ml_face_isface_0.input';
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let inputBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let context:mindSporeLite.Context={};
            context.target = ["cpu", "nnrt"];
            context.nnrt = {};
            context.cpu = {};
            context.cpu = {
                threadNum: 1,
                threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST,
                precisionMode: "preferred_fp16",
                threadAffinityCoreList: [0, 1, 2, 3]
            };
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel start=====');
            let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
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
            const modelInputs0 = msliteModel.getInputs();
            hilog.info(domain, tag, '%{public}s', modelInputs0[0].name.toString());
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        })


        /**
         * @tc.number Test_load_model_param_model_path_settings_threads_static_001
         * @tc.name   Test_load_model_param_model_path_settings_threads_static_001
         * @tc.desc: Context设置CPU，4线程
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_settings_threads_static_001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:Test_load_model_param_model_path_settings_threads_static_001");
            let inputName = 'ml_face_isface_0.input';
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let inputBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let context:mindSporeLite.Context={};
            context.target = ["cpu"];
            context.cpu = {
                "threadNum": 4,
            }
            let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
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
            const modelInputs0 = msliteModel.getInputs();
            hilog.info(domain, tag, '%{public}s', modelInputs0[0].name.toString());
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        })


        /**
         * @tc.number Test_load_model_param_model_path_settings_threads_static_002
         * @tc.name   Test_load_model_param_model_path_settings_threads_static_002
         * @tc.desc: Context设置CPU，2线程
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_settings_threads_static_002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:Test_load_model_param_model_path_settings_threads_static_002");
            let inputName = 'ml_face_isface_0.input';
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let inputBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let context:mindSporeLite.Context={};
            context.target = ["cpu"];
            context.cpu = {
                "threadNum": 2,
            }
            let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
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
            const modelInputs0 = msliteModel.getInputs();
            hilog.info(domain, tag, '%{public}s', modelInputs0[0].name.toString());
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        })


        /**
         * @tc.number Test_load_model_param_model_path_settings_threads_static_003
         * @tc.name   Test_load_model_param_model_path_settings_threads_static_003
         * @tc.desc: Context设置CPU，1线程
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_settings_threads_static_003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:Test_load_model_param_model_path_settings_threads_static_003");
            let inputName = 'ml_face_isface_0.input';
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let inputBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength)
            let context:mindSporeLite.Context={};
            context.target = ["cpu"];
            context.cpu = {
                "threadNum": 1,
            }
            let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
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
            const modelInputs0 = msliteModel.getInputs();
            hilog.info(domain, tag, '%{public}s', modelInputs0[0].name.toString());
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        })


        /**
         * @tc.number Test_load_model_param_model_path_settings_threads_static_004
         * @tc.name   Test_load_model_param_model_path_settings_threads_static_004
         * @tc.desc: Context设置CPU，0线程
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_settings_threads_static_004', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:Test_load_model_param_model_path_settings_threads_static_004");
            let inputName = 'ml_face_isface_0.input';
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let inputBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let context:mindSporeLite.Context={};
            context.target = ["cpu"];
            context.cpu = {
                "threadNum": 0,
            }
            let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
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
            const modelInputs0 = msliteModel.getInputs();
            hilog.info(domain, tag, '%{public}s', modelInputs0[0].name.toString());
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        })


        /**
         * @tc.number Test_load_model_param_model_path_settings_affinity_static_002
         * @tc.name   Test_load_model_param_model_path_settings_affinity_static_002
         * @tc.desc: 异常场景：Context设置CPU，绑核设置为2，绑小核
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_settings_affinity_static_002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:Test_load_model_param_model_path_settings_affinity_static_002");
            let inputName = 'ml_face_isface_0.input';
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let inputBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let context:mindSporeLite.Context={};
            context.target = ["cpu"];
            context.cpu={};
            //context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.LITTLE_CORES_FIRST;
            context.cpu = {threadAffinityMode: mindSporeLite.ThreadAffinityMode.LITTLE_CORES_FIRST};
            hilog.info(domain, tag, '%{public}s', "MSLITE api test: set threadAffinityMode=2.");
            let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
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
            const modelInputs0 = msliteModel.getInputs();
            hilog.info(domain, tag, '%{public}s', modelInputs0[0].name.toString());
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        })


        /**
         * @tc.number Test_load_model_param_model_path_settings_affinity_static_003
         * @tc.name   Test_load_model_param_model_path_settings_affinity_static_003
         * @tc.desc: 异常场景：Context设置CPU，绑核设置为1，绑大核
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_settings_affinity_static_003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:Test_load_model_param_model_path_settings_affinity_static_003");
            let inputName = 'ml_face_isface_0.input';
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let inputBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength)
            let context:mindSporeLite.Context={};
            context.target = ["cpu"];
            context.cpu={};
            context.cpu = {threadNum: 1, threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST};
            hilog.info(domain, tag, '%{public}s', "MSLITE api test: set threadAffinityMode=1.");
            let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
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
            const modelInputs0 = msliteModel.getInputs();
            hilog.info(domain, tag, '%{public}s', modelInputs0[0].name.toString());
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        })


        /**
         * @tc.number Test_load_model_param_model_path_settings_affinity_static_004
         * @tc.name   Test_load_model_param_model_path_settings_affinity_static_004
         * @tc.desc: 正常场景：Context设置CPU，绑核设置为0，不绑核
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_settings_affinity_static_004', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:Test_load_model_param_model_path_settings_affinity_static_004");
            let inputName = 'ml_face_isface_0.input';
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let inputBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let context:mindSporeLite.Context={};
            context.target = ["cpu"];
            context.cpu={};
            //context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.NO_AFFINITIES;
            context.cpu = {threadAffinityMode: mindSporeLite.ThreadAffinityMode.NO_AFFINITIES};
            hilog.info(domain, tag, '%{public}s', "MSLITE api test: set threadAffinityMode=0.");
            let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
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
            const modelInputs0 = msliteModel.getInputs();
            hilog.info(domain, tag, '%{public}s', modelInputs0[0].name.toString());
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        })
            
            
        /**
         * @tc.number Test_load_model_param_model_path_settings_affinity_list_static_001
         * @tc.name   Test_load_model_param_model_path_settings_affinity_list_static_001
         * @tc.desc: 正常场景：Context设置CPU，绑核列表[0,1,2,3]
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_settings_affinity_list_static_001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:Test_load_model_param_model_path_settings_affinity_list_static_001");
            let inputName = 'ml_face_isface_0.input';
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let inputBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let context:mindSporeLite.Context={};
            context.target = ["cpu"];
            context.cpu={};
            context.cpu = {threadAffinityCoreList: [0, 1, 2, 3]};
            hilog.info(domain, tag, '%{public}s', "MSLITE api test: set threadAffinityCoreList=[0, 1, 2, 3].");
            let msliteModel = await mindSporeLite.loadModelFromFile(model_file, context);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
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
            const modelInputs0 = msliteModel.getInputs();
            hilog.info(domain, tag, '%{public}s', modelInputs0[0].name.toString());
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        })

        /**
         * @tc.number Test_load_model_param_model_path_is_None_static_001
         * @tc.name   Test_load_model_param_model_path_is_None_static_001
         * @tc.desc: 异常场景：ModelBuild，调用model path方法，path为空
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_is_None_static_001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "MSLITE testcase: Test_load_model_param_model_path_is_None_static_001");
            let model_file = "";
            let context:mindSporeLite.Context={};
            context.target = ["cpu"];
            try{
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
        })
            

        /**
         * @tc.number Test_load_model_param_model_path_resize_static_001
         * @tc.name   Test_load_model_param_model_path_resize_static_001
         * @tc.desc: 正常场景：ModelResize，shape与之前一致
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_resize_static_001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:Test_load_model_param_model_path_resize_static_001");
            let inputName = 'ml_ocr_cn_0.input';
            let model_file = abilityContext.filesDir + '/' + 'ml_ocr_cn.ms';
            let inputBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
            let input_name = modelInputs[0].name;
            hilog.info(domain, tag, '%{public}s', input_name.toString());
            expect(input_name.toString()).assertEqual("data");
            let input_shape = modelInputs[0].shape;
            hilog.info(domain, tag, '%{public}s', input_shape.toString());
            expect(input_shape.toString()).assertEqual("1,32,512,1");
            let input_elementNum = modelInputs[0].elementNum;
            hilog.info(domain, tag, '%{public}s', input_elementNum.toString());
            expect(input_elementNum.toString()).assertEqual("16384");
            let input_dtype = modelInputs[0].dtype;
            hilog.info(domain, tag, '%{public}s', input_dtype.toString());
            expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
            let input_format = modelInputs[0].format;
            hilog.info(domain, tag, '%{public}s', input_format.toString());
            expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
            let input_dataSize = modelInputs[0].dataSize;
            hilog.info(domain, tag, '%{public}s', input_dataSize.toString());
            expect(input_dataSize.toString()).assertEqual("65536");
            hilog.info(domain, tag, '%{public}s', '=========MSLITE resize start=====');
            let new_dim = new Array<Int[]>([1, 32, 512, 1]);
            let resize_result = msliteModel.resize(modelInputs, new_dim);
            expect(resize_result).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE resize success=====');
            const modelInputs2 = msliteModel.getInputs();
            let input_name2 = modelInputs2[0].name;
            hilog.info(domain, tag, '%{public}s', input_name2.toString());
            expect(input_name2.toString()).assertEqual("data");
            let input_shape2 = modelInputs2[0].shape;
            hilog.info(domain, tag, '%{public}s', input_shape2.toString());
            expect(input_shape2.toString()).assertEqual("1,32,512,1");
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
            const modelInputs0 = msliteModel.getInputs();
            hilog.info(domain, tag, '%{public}s', modelInputs0[0].name.toString());
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        })


        /**
         * @tc.number Test_load_model_param_model_path_resize_static_002
         * @tc.name   Test_load_model_param_model_path_resize_static_002
         * @tc.desc: 正常场景：ModelResize，shape与之前不一致
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_resize_static_002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:Test_load_model_param_model_path_resize_static_002");
            let inputName = 'ml_ocr_cn_0.input';
            let model_file = abilityContext.filesDir + '/' + 'ml_ocr_cn.ms';
            let inputBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
            let input_name = modelInputs[0].name;
            hilog.info(domain, tag, '%{public}s', input_name.toString());
            expect(input_name.toString()).assertEqual("data");
            let input_shape = modelInputs[0].shape;
            hilog.info(domain, tag, '%{public}s', input_shape.toString());
            expect(input_shape.toString()).assertEqual("1,32,512,1");
            let input_elementNum = modelInputs[0].elementNum;
            hilog.info(domain, tag, '%{public}s', input_elementNum.toString());
            expect(input_elementNum.toString()).assertEqual("16384");
            let input_dtype = modelInputs[0].dtype;
            hilog.info(domain, tag, '%{public}s', input_dtype.toString());
            expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
            let input_format = modelInputs[0].format;
            hilog.info(domain, tag, '%{public}s', input_format.toString());
            expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
            let input_dataSize = modelInputs[0].dataSize;
            hilog.info(domain, tag, '%{public}s', input_dataSize.toString());
            expect(input_dataSize.toString()).assertEqual("65536");
            hilog.info(domain, tag, '%{public}s', '=========MSLITE resize start=====');
            let new_dim = new Array<Int[]>([1,64,256,1]);
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
            const modelInputs0 = msliteModel.getInputs();
            hilog.info(domain, tag, '%{public}s', modelInputs0[0].name.toString());
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        })


        /**
         * @tc.number Test_load_model_param_model_path_resize_static_003
         * @tc.name   Test_load_model_param_model_path_resize_static_003
         * @tc.desc: 异常场景：ModelResize，shape为三维
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_resize_static_003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:Test_load_model_param_model_path_resize_static_003");
            let inputName = 'ml_ocr_cn_0.input';
            let model_file = abilityContext.filesDir + '/' + 'ml_ocr_cn.ms';
            let inputBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
            let input_name = modelInputs[0].name;
            hilog.info(domain, tag, '%{public}s', input_name.toString());
            expect(input_name.toString()).assertEqual("data");
            let input_shape = modelInputs[0].shape;
            hilog.info(domain, tag, '%{public}s', input_shape.toString());
            expect(input_shape.toString()).assertEqual("1,32,512,1");
            let input_elementNum = modelInputs[0].elementNum;
            hilog.info(domain, tag, '%{public}s', input_elementNum.toString());
            expect(input_elementNum.toString()).assertEqual("16384");
            let input_dtype = modelInputs[0].dtype;
            hilog.info(domain, tag, '%{public}s', input_dtype.toString());
            expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
            let input_format = modelInputs[0].format;
            hilog.info(domain, tag, '%{public}s', input_format.toString());
            expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
            let input_dataSize = modelInputs[0].dataSize;
            hilog.info(domain, tag, '%{public}s', input_dataSize.toString());
            expect(input_dataSize.toString()).assertEqual("65536");
            hilog.info(domain, tag, '%{public}s', '=========MSLITE resize start=====');
            let new_dim = new Array<Int[]>([1,32,1]);
            let resize_result = msliteModel.resize(modelInputs, new_dim);
            expect(resize_result).assertFalse;
            hilog.info(domain, tag, '%{public}s', '=========MSLITE resize failed=====');
            done();
        })


        /**
         * @tc.number Test_load_model_param_model_path_resize_static_004
         * @tc.name   Test_load_model_param_model_path_resize_static_004
         * @tc.desc: 异常场景：ModelResize，不支持resize的模型
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_resize_static_004', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:Test_load_model_param_model_path_resize_static_004");
            let inputName = 'ml_face_isface_0.input';
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let inputBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
            let input_name = modelInputs[0].name;
            hilog.info(domain, tag, '%{public}s', input_name.toString());
            expect(input_name.toString()).assertEqual("data");
            hilog.info(domain, tag, '%{public}s', modelInputs[0].shape.toString());
            expect(modelInputs[0].shape.toString()).assertEqual("1,48,48,3");
            hilog.info(domain, tag, '%{public}s', modelInputs[0].elementNum.toString());
            expect(modelInputs[0].elementNum.toString()).assertEqual("6912");
            let input_dtype = modelInputs[0].dtype;
            hilog.info(domain, tag, '%{public}s', input_dtype.toString());
            expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
            let input_format = modelInputs[0].format;
            hilog.info(domain, tag, '%{public}s', input_format.toString());
            expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
            let input_dataSize = modelInputs[0].dataSize;
            hilog.info(domain, tag, '%{public}s', input_dataSize.toString());
            expect(input_dataSize.toString()).assertEqual("27648");
            hilog.info(domain, tag, '%{public}s', '=========MSLITE resize start=====');
            let new_dim = new Array<Int[]>([1,96,96,1]);
            let resize_result = msliteModel.resize(modelInputs, new_dim);
            expect(resize_result).assertFalse();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE resize failed=====');
            done();
        })


        /**
         * @tc.number Test_load_model_param_model_path_resize_static_005
         * @tc.name   Test_load_model_param_model_path_resize_static_005
         * @tc.desc: 异常场景：ModelResize，shape值有负数
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_resize_static_005', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:Test_load_model_param_model_path_resize_static_005");
            let inputName = 'ml_ocr_cn_0.input';
            let model_file = abilityContext.filesDir + '/' + 'ml_ocr_cn.ms';
            let inputBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
            let input_name = modelInputs[0].name;
            hilog.info(domain, tag, '%{public}s', input_name.toString());
            expect(input_name.toString()).assertEqual("data");
            let input_shape = modelInputs[0].shape;
            hilog.info(domain, tag, '%{public}s', input_shape.toString());
            expect(input_shape.toString()).assertEqual("1,32,512,1");
            let input_elementNum = modelInputs[0].elementNum;
            hilog.info(domain, tag, '%{public}s', input_elementNum.toString());
            expect(input_elementNum.toString()).assertEqual("16384");
            let input_dtype = modelInputs[0].dtype;
            hilog.info(domain, tag, '%{public}s', input_dtype.toString());
            expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
            let input_format = modelInputs[0].format;
            hilog.info(domain, tag, '%{public}s', input_format.toString());
            expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
            let input_dataSize = modelInputs[0].dataSize;
            hilog.info(domain, tag, '%{public}s', input_dataSize.toString());
            expect(input_dataSize.toString()).assertEqual("65536");
            hilog.info(domain, tag, '%{public}s', '=========MSLITE resize start=====');
            let new_dim = new Array<Int[]>([1,-32,32,1]);
            let resize_result = msliteModel.resize(modelInputs, new_dim);
            expect(resize_result).assertFalse();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE resize failed=====');
            done();
        })


        /**
         * @tc.number Test_load_model_param_model_path_much_predict_static_001
         * @tc.name   Test_load_model_param_model_path_much_predict_static_001
         * @tc.desc: 正常场景：Build一次，Predict多次
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_much_predict_static_001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:Test_load_model_param_model_path_much_predict_static_001");
            let inputName = 'ml_face_isface_0.input';
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let inputBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
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
                const modelInputs0 = msliteModel.getInputs();
                hilog.info(domain, tag, '%{public}s', modelInputs0[0].name.toString());
                hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
                hilog.info(domain, tag, '%{public}s', '=========i.toString()=====');
                hilog.info(domain, tag, '%{public}s', i.toString());
                ++num;
                hilog.info(domain, tag, '%{public}s', '=========num.toString()=====');
                hilog.info(domain, tag, '%{public}s', num.toString());
            }
            done();
        })


        /**
         * @tc.number Test_load_model_param_model_path_much_build_static_001
         * @tc.name   Test_load_model_param_model_path_much_build_static_001
         * @tc.desc: 异常场景：Build多次
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_much_build_static_001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:Test_load_model_param_model_path_much_build_static_001");
            let inputName = 'ml_face_isface_0.input';
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let inputBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            for (let i = 0; i < 10; i++) {
                mindSporeLite.loadModelFromFile(model_file);
            }
            let msliteModel = await mindSporeLite.loadModelFromFile(model_file);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
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
            const modelInputs0 = msliteModel.getInputs();
            hilog.info(domain, tag, '%{public}s', modelInputs0[0].name.toString());
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        })


        /**
         * @tc.number Test_load_model_param_model_path_model_static_001
         * @tc.name   Test_load_model_param_model_path_model_static_001
         * @tc.desc: 正常场景：单输入模型
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_model_static_001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:Test_load_model_param_model_path_model_static_001");
            let modelName = 'ml_face_isface.ms';
            let inputName = 'ml_face_isface_0.input';
            ;
            let inputBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let modelBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(modelName);
            let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer);
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
            let input_name = modelInputs[0].name;
            hilog.info(domain, tag, '%{public}s', input_name.toString());
            expect(input_name.toString()).assertEqual("data");
            hilog.info(domain, tag, '%{public}s', modelInputs[0].shape.toString());
            expect(modelInputs[0].shape.toString()).assertEqual("1,48,48,3");
            hilog.info(domain, tag, '%{public}s', modelInputs[0].elementNum.toString());
            expect(modelInputs[0].elementNum.toString()).assertEqual("6912");
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
            const modelInputs0 = msliteModel.getInputs();
            hilog.info(domain, tag, '%{public}s', modelInputs0[0].name.toString());
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        })


        /**
         * @tc.number Test_load_model_param_model_path_model_static_002
         * @tc.name   Test_load_model_param_model_path_model_static_002
         * @tc.desc: 正常场景：多输入模型
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_model_static_002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:Test_load_model_param_model_path_model_static_002");
            let modelName = 'ml_video_edit_face_cutout_portraitSeg_deconv.ms';
            let inputName01 = 'ml_video_edit_face_cutout_portraitSeg_deconv_0.input';
            let inputName02 = 'ml_video_edit_face_cutout_portraitSeg_deconv_1.input';
            ;
            let inputBuffer01 = await abilityContext.resourceManager.getRawFileContent(inputName01);
            let inputBuffer02 = await abilityContext.resourceManager.getRawFileContent(inputName02);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input01 bin bytelength: ' + inputBuffer01.byteLength);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input02 bin bytelength: ' + inputBuffer02.byteLength);
            let modelBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(modelName);
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
            let input_dtype = modelInputs[0].dtype;
            hilog.info(domain, tag, '%{public}s', input_dtype.toString());
            expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
            let input_format = modelInputs[0].format;
            hilog.info(domain, tag, '%{public}s', input_format.toString());
            expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
            let input_dataSize = modelInputs[0].dataSize;
            hilog.info(domain, tag, '%{public}s', input_dataSize.toString());
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
            const modelInputs0 = msliteModel.getInputs();
            hilog.info(domain, tag, '%{public}s', modelInputs0[0].name.toString());
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        })


        /**
         * @tc.number Test_load_model_param_model_path_model_static_003
         * @tc.name   Test_load_model_param_model_path_model_static_003
         * @tc.desc: 正常场景：输入为uint8模型
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_model_static_003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:Test_load_model_param_model_path_model_static_003");
            let modelName = 'aiy_vision_classifier_plants_V1_3.ms';
            let inputName = 'aiy_vision_classifier_plants_V1_3_0.input';
            ;
            let inputBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let modelBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(modelName);
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
            const modelInputs0 = msliteModel.getInputs();
            hilog.info(domain, tag, '%{public}s', modelInputs0[0].name.toString());
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        })


        /**
         * @tc.number Test_load_model_param_model_path_model_static_004
         * @tc.name   Test_load_model_param_model_path_model_static_004
         * @tc.desc: 正常场景：多输入单输出
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_model_static_004', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:Test_load_model_param_model_path_model_static_004");
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
            let modelBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(modelName);
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
            let input_dtype = modelInputs[0].dtype;
            hilog.info(domain, tag, '%{public}s', input_dtype.toString());
            expect(input_dtype).assertEqual(mindSporeLite.DataType.NUMBER_TYPE_FLOAT32);
            let input_format = modelInputs[0].format;
            hilog.info(domain, tag, '%{public}s', input_format.toString());
            expect(input_format).assertEqual(mindSporeLite.Format.NHWC);
            let input_dataSize = modelInputs[0].dataSize;
            hilog.info(domain, tag, '%{public}s', input_dataSize.toString());
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
            const modelInputs0 = msliteModel.getInputs();
            hilog.info(domain, tag, '%{public}s', modelInputs0[0].name.toString());
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        })


        /**
         * @tc.number Test_load_model_param_model_path_callback_static
         * @tc.name   Test_load_model_param_model_path_callback_static
         * @tc.desc: 正常场景：调用loadModelFromFile callback接口设置context
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_callback_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:Test_load_model_param_model_path_callback_static");
            let inputName = 'ml_face_isface_0.input';
            ;
            let inputBuffer: Uint8Array = await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel start=====');
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let context: mindSporeLite.Context = {};
            context.target = ["cpu"];
            context.cpu = {
                "threadNum": 4,
                threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST,
                precisionMode: "preferred_fp16",
                threadAffinityCoreList:[0, 1, 2, 3],
            }
            // context.cpu.threadAffinityMode = mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST;
            // context.cpu.precisionMode = "preferred_fp16";
            // context.cpu.threadAffinityCoreList = [0, 1, 2, 3];
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
        })


        /**
         * @tc.number Test_load_model_param_model_buffer_callback_static
         * @tc.name   Test_load_model_param_model_buffer_callback_static
         * @tc.desc: 正常场景：调用loadModelFromBuffer callback接口设置context
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_buffer_callback_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:Test_load_model_param_model_buffer_callback_static");
            let inputName = 'ml_face_isface_0.input';
            ;

            let inputBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);

            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel start=====');
            let modelName = 'ml_face_isface.ms';
            let model_buffer = await abilityContext.resourceManager.getRawFileContent(modelName);
            let context: mindSporeLite.Context = {};
            context.target = ["cpu"];
            context.cpu = {
                "threadNum": 4,
                threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST,
                precisionMode: "preferred_fp16",
                threadAffinityCoreList:[0, 1, 2, 3],
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
        })
            
        /**
         * @tc.number Test_load_model_param_model_fd_callback_static
         * @tc.name   Test_load_model_param_model_fd_callback_static
         * @tc.desc: 正常场景：调用loadModelFromFd callback接口设置context
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_fd_callback_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:Test_load_model_param_model_fd_callback_static");
            let inputName = 'ml_face_isface_0.input';
            ;
            let inputBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);

            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel start=====');
            let model_file = abilityContext.filesDir + '/' + 'ml_face_isface.ms';
            let file = fs.openSync(model_file, fs.OpenMode.READ_ONLY);
            let context:mindSporeLite.Context={};
            context.target = ["cpu"];
            context.cpu = {
                "threadNum": 4,
                threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST,
                precisionMode: "preferred_fp16",
                threadAffinityCoreList:[0, 1, 2, 3],
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
        })
            
        /**
         * @tc.number Test_load_model_param_model_path_callback_no_context_static
         * @tc.name   Test_load_model_param_model_path_callback_no_context_static
         * @tc.desc: 正常场景：调用loadModelFromFile callback接口未设置context
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_path_callback_no_context_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:Test_load_model_param_model_path_callback_no_context_static");
            let inputName = 'ml_face_isface_0.input';
            ;
            let inputBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(inputName);
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
        })
            
        /**
         * @tc.number Test_load_model_param_model_buffer_callback_no_context_static
         * @tc.name   Test_load_model_param_model_buffer_callback_no_context_static
         * @tc.desc: 正常场景：调用loadModelFromBuffer callback接口未设置context
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_buffer_callback_no_context_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:Test_load_model_param_model_buffer_callback_no_context_static");
            let inputName = 'ml_face_isface_0.input';
            ;
            let inputBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(inputName);
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
        })
            
        /**
         * @tc.number Test_load_model_param_model_fd_callback_no_context_static
         * @tc.name   Test_load_model_param_model_fd_callback_no_context_static
         * @tc.desc: 正常场景：调用loadModelFromFd callback接口未设置context
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_load_model_param_model_fd_callback_no_context_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:Test_load_model_param_model_fd_callback_no_context_static");
            let inputName = 'ml_face_isface_0.input';
            ;
            let inputBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(inputName);
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
        })
            
        /**
         * @tc.number Test_enumerated_value_static
         * @tc.name   Test_enumerated_value_static
         * @tc.desc: 正常场景：头文件枚举值测试
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('Test_enumerated_value_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:Test_enumerated_value_static");
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
                done();
            } catch (error) {
                console.info("The enumerated are changed:" + error)
                done();
            }
        })

        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_NNRT_static_0001
         * @tc.name   SUB_AI_MindSpore_ArkTS_NNRT_static_0001
         * @tc.desc   获取nnrt设备，context设置nnrt设备为npu,PerformanceMode=0，PRIORITY_NONE = 0，Extension
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_NNRT_static_0001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_NNRT_static_0001");
            let modelName = 'ml_face_isface.ms';
            let inputName = 'ml_face_isface_0.input';
            let inputBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let modelBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(modelName);
            let context: mindSporeLite.Context = {};
            context.target = ["nnrt"];
            context.nnrt = {};
            let device = getNPUDeviceDesc();
            if (device == null) {
                hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
                hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
                done();
                return;
            }
            let Extension_Buffer = new ArrayBuffer(16777216);
            let nnrt_extensions: mindSporeLite.Extension = {
                name: "value",
                value: Extension_Buffer,
            };
            context.nnrt = {
                deviceID: device.deviceID(),
                performanceMode: mindSporeLite.PerformanceMode.PERFORMANCE_NONE,
                priority: mindSporeLite.Priority.PRIORITY_NONE,
                extensions:[nnrt_extensions],
            }
            let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context)
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
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
            let modelOutputs = await msliteModel.predict(modelInputs);
            expect(modelOutputs !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array start=====');
            let output0 = new Float32Array(modelOutputs[0].getData());
            hilog.info(domain, tag, '%{public}s', 'output0.length:' + output0.length);
            for (let i = 0; i < 2; i++) {
                hilog.info(domain, tag, '%{public}s', output0[i].toString());
                expect(output0[i].toString() !== null).assertTrue();
            }
            const modelInputs0 = msliteModel.getInputs();
            hilog.info(domain, tag, '%{public}s', modelInputs0[0].name.toString());
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        });


        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_NNRT_static_0002
         * @tc.name   SUB_AI_MindSpore_ArkTS_NNRT_static_0002
         * @tc.desc   获取nnrt设备，context设置nnrt设备为npu,PerformanceMode=1，PRIORITY_NONE = 1，Extension
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_NNRT_static_0002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_NNRT_static_0002");
            let modelName = 'ml_face_isface.ms';
            let inputName = 'ml_face_isface_0.input';
            let inputBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let modelBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(modelName);
            let context: mindSporeLite.Context = {};
            context.target = ["nnrt"];
            context.nnrt = {};
            let device = getNPUDeviceDesc();
            if (device == null) {
                hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
                hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
                done();
                return;
            }
            let Extension_Buffer = new ArrayBuffer(16777216);
            let nnrt_extensions: mindSporeLite.Extension = {
                name: "value",
                value: Extension_Buffer,
            };
            context.nnrt = {
                deviceID: device.deviceID(),
                performanceMode: mindSporeLite.PerformanceMode.PERFORMANCE_LOW,
                priority: mindSporeLite.Priority.PRIORITY_LOW,
                extensions:[nnrt_extensions],
            }
            let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context)
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
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
            let modelOutputs = await msliteModel.predict(modelInputs);
            expect(modelOutputs !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array start=====');
            let output0 = new Float32Array(modelOutputs[0].getData());
            hilog.info(domain, tag, '%{public}s', 'output0.length:' + output0.length);
            for (let i = 0; i < 2; i++) {
                hilog.info(domain, tag, '%{public}s', output0[i].toString());
                expect(output0[i].toString() !== null).assertTrue();
            }
            const modelInputs0 = msliteModel.getInputs();
            hilog.info(domain, tag, '%{public}s', modelInputs0[0].name.toString());
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        });

        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_NNRT_static_0003
         * @tc.name   SUB_AI_MindSpore_ArkTS_NNRT_static_0003
         * @tc.desc   获取nnrt设备，context设置nnrt设备为npu,PerformanceMode=2，PRIORITY_NONE = 2，Extension
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_NNRT_static_0003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_NNRT_static_0003");
            let modelName = 'ml_face_isface.ms';
            let inputName = 'ml_face_isface_0.input';
            let inputBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let modelBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(modelName);
            let context: mindSporeLite.Context = {};
            context.target = ["nnrt"];
            context.nnrt = {};
            let device = getNPUDeviceDesc();
            if (device == null) {
                hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
                hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
                done();
                return;
            }
            let Extension_Buffer = new ArrayBuffer(16777216);
            let nnrt_extensions: mindSporeLite.Extension = {
                name: "value",
                value: Extension_Buffer,
            };
            context.nnrt = {
                deviceID: device.deviceID(),
                performanceMode: mindSporeLite.PerformanceMode.PERFORMANCE_MEDIUM,
                priority: mindSporeLite.Priority.PRIORITY_MEDIUM,
                extensions:[nnrt_extensions],
            }
            let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context)
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
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
            let modelOutputs = await msliteModel.predict(modelInputs);
            expect(modelOutputs !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array start=====');
            let output0 = new Float32Array(modelOutputs[0].getData());
            hilog.info(domain, tag, '%{public}s', 'output0.length:' + output0.length);
            for (let i = 0; i < 2; i++) {
                hilog.info(domain, tag, '%{public}s', output0[i].toString());
                expect(output0[i].toString() !== null).assertTrue();
            }
            const modelInputs0 = msliteModel.getInputs();
            hilog.info(domain, tag, '%{public}s', modelInputs0[0].name.toString());
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        });

        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_NNRT_static_0004
         * @tc.name   SUB_AI_MindSpore_ArkTS_NNRT_static_0004
         * @tc.desc   获取nnrt设备，context设置nnrt设备为npu,PerformanceMode=3，PRIORITY_NONE = 3，Extension
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_NNRT_static_0004', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_NNRT_static_0004");
            let modelName = 'ml_face_isface.ms';
            let inputName = 'ml_face_isface_0.input';
            let inputBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let modelBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(modelName);
            let context: mindSporeLite.Context = {};
            context.target = ["nnrt"];
            context.nnrt = {};
            let device = getNPUDeviceDesc();
            if (device == null) {
                hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
                hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
                done();
                return;
            }
            let Extension_Buffer = new ArrayBuffer(16777216);
            let nnrt_extensions: mindSporeLite.Extension = {
                name: "value",
                value: Extension_Buffer,
            };
            context.nnrt = {
                deviceID: device.deviceID(),
                performanceMode: mindSporeLite.PerformanceMode.PERFORMANCE_HIGH,
                priority: mindSporeLite.Priority.PRIORITY_HIGH,
                extensions:[nnrt_extensions],
            }
            let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context)
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
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
            let modelOutputs = await msliteModel.predict(modelInputs);
            expect(modelOutputs !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array start=====');
            let output0 = new Float32Array(modelOutputs[0].getData());
            hilog.info(domain, tag, '%{public}s', 'output0.length:' + output0.length);
            for (let i = 0; i < 2; i++) {
                hilog.info(domain, tag, '%{public}s', output0[i].toString());
                expect(output0[i].toString() !== null).assertTrue();
            }
            const modelInputs0 = msliteModel.getInputs();
            hilog.info(domain, tag, '%{public}s', modelInputs0[0].name.toString());
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        });

        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_NNRT_static_0005
         * @tc.name   SUB_AI_MindSpore_ArkTS_NNRT_static_0005
         * @tc.desc   获取nnrt设备，context设置nnrt设备为npu,PerformanceMode=4，PRIORITY_NONE = 3，Extension
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_NNRT_static_0005', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_NNRT_static_0005");
            let modelName = 'ml_face_isface.ms';
            let inputName = 'ml_face_isface_0.input';
            let inputBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let modelBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(modelName);
            let context: mindSporeLite.Context = {};
            context.target = ["nnrt"];
            context.nnrt = {};
            let device = getNPUDeviceDesc();
            if (device == null) {
                hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
                hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
                done();
                return;
            }
            let Extension_Buffer = new ArrayBuffer(16777216);
            let nnrt_extensions: mindSporeLite.Extension = {
                name: "value",
                value: Extension_Buffer,
            };
            context.nnrt = {
                deviceID: device.deviceID(),
                performanceMode: mindSporeLite.PerformanceMode.PERFORMANCE_EXTREME,
                priority: mindSporeLite.Priority.PRIORITY_HIGH,
                extensions:[nnrt_extensions],
            }
            let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context)
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
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
            let modelOutputs = await msliteModel.predict(modelInputs);
            expect(modelOutputs !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array start=====');
            let output0 = new Float32Array(modelOutputs[0].getData());
            hilog.info(domain, tag, '%{public}s', 'output0.length:' + output0.length);
            for (let i = 0; i < 2; i++) {
                hilog.info(domain, tag, '%{public}s', output0[i].toString());
                expect(output0[i].toString() !== null).assertTrue();
            }
            const modelInputs0 = msliteModel.getInputs();
            hilog.info(domain, tag, '%{public}s', modelInputs0[0].name.toString());
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        });

        /**
         * @tc.number SUB_AI_MindSpore_ArkTS_NNRT_static_0006
         * @tc.name   SUB_AI_MindSpore_ArkTS_NNRT_static_0006
         * @tc.desc   获取nnrt设备，context设置nnrt设备为CPU与npu,PerformanceMode=4，PRIORITY_NONE = 3，Extension
         * @tc.level  LEVEL0
         * @tc.size   MEDIUMTEST
         * @tc.type   FUNCTION
        */
        it('SUB_AI_MindSpore_ArkTS_NNRT_static_0006', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "Testcase:SUB_AI_MindSpore_ArkTS_NNRT_static_0006");
            let modelName = 'ml_face_isface.ms';
            let inputName = 'ml_face_isface_0.input';
            let all_devices = mindSporeLite.getAllNNRTDeviceDescriptions();
            let inputBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(inputName);
            hilog.info(domain, tag, '%{public}s', '=========MSLITE success, input bin bytelength: ' + inputBuffer.byteLength);
            let modelBuffer: Uint8Array= await abilityContext.resourceManager.getRawFileContent(modelName);
            let context: mindSporeLite.Context = {};
            context.target = ["cpu", "nnrt"];
            context.cpu = {};
            context.cpu = {
                threadNum: 1,
                threadAffinityMode: mindSporeLite.ThreadAffinityMode.BIG_CORES_FIRST,
                precisionMode: "preferred_fp16",
                threadAffinityCoreList: [0, 1, 2, 3]
            };
            context.nnrt = {};
            let device = getNPUDeviceDesc();
            if (device == null) {
                hilog.info(domain, tag, '%{public}s', '=========getNPUDeviceDescResult: ' + device);
                hilog.info(domain, tag, '%{public}s', '=========No NNRT device, testcase skipped============');
                done();
                return;
            }
            let Extension_Buffer = new ArrayBuffer(16777216);
            let nnrt_extensions: mindSporeLite.Extension = {
                name: "value",
                value: Extension_Buffer,
            };
            context.nnrt = {
                deviceID: device.deviceID(),
                performanceMode: mindSporeLite.PerformanceMode.PERFORMANCE_EXTREME,
                priority: mindSporeLite.Priority.PRIORITY_HIGH,
                extensions:[nnrt_extensions],
            }
            let msliteModel = await mindSporeLite.loadModelFromBuffer(modelBuffer.buffer, context)
            expect(msliteModel !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE loadModel end=====');
            const modelInputs = msliteModel.getInputs();
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
            let modelOutputs = await msliteModel.predict(modelInputs);
            expect(modelOutputs !== null).assertTrue();
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array start=====');
            let output0 = new Float32Array(modelOutputs[0].getData());
            hilog.info(domain, tag, '%{public}s', 'output0.length:' + output0.length);
            for (let i = 0; i < 2; i++) {
                hilog.info(domain, tag, '%{public}s', output0[i].toString());
                expect(output0[i].toString() !== null).assertTrue();
            }
            const modelInputs0 = msliteModel.getInputs();
            hilog.info(domain, tag, '%{public}s', modelInputs0[0].name.toString());
            hilog.info(domain, tag, '%{public}s', '=========MSLITE new Float32Array end=====');
            done();
        });
    })
}
