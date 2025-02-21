/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium'
import mindSpore from 'libmindspore.so'
import fs from '@ohos.file.fs';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import Utils from './Utils';
import { BusinessError } from '@ohos.base';

enum OH_AI_DeviceType {
  OH_AI_DEVICETYPE_CPU = 0,
  OH_AI_DEVICETYPE_GPU,
  OH_AI_DEVICETYPE_KIRIN_NPU,
  OH_AI_DEVICETYPE_NNRT = 60,
  OH_AI_DEVICETYPE_INVALID = 100,
}

enum OH_AI_PerformanceMode {
  OH_AI_PERFORMANCE_NONE = 0,
  OH_AI_PERFORMANCE_LOW = 1,
  OH_AI_PERFORMANCE_MEDIUM = 2,
  OH_AI_PERFORMANCE_HIGH = 3,
  OH_AI_PERFORMANCE_EXTREME = 4
}

function getContext(): Context {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let context = abilityDelegator.getAppContext();
  return context;
}

export default function mindSporeTest() {

  beforeAll(async () => {
    let context = getContext()
    let dir = context.filesDir + "/";
    try {
      let ml_face_model_file = dir + "ml_face_isface.ms";
      let ml_face_model_file1 = dir + "ml_face_isface.input";
      context.resourceManager.getRawFileContent("ml_face_isface.ms", (error, model_buffer) => {
        if (error) {
          console.log(
            `[rawfile_copy_to_sandbox] ml_face_isface.ms is
            copy failed:${error.code}, message: ${error.message}.`);
        } else {
          let file = fs.openSync(ml_face_model_file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          fs.writeSync(file.fd, model_buffer.buffer);
          fs.closeSync(file);
          console.log("[rawfile_copy_to_sandbox] ml_face_isface.ms is copy success");
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
  })

  beforeEach(async () => {
    let dir = getContext().filesDir + "/";

    let ml_face_model = dir + "ml_face_isface.ms";
    let ml_face_model_input = dir + "ml_face_isface.input";
    await fs.stat(ml_face_model).then(async (res) => {
      if (res) {
        console.info("MindSporeDemo ml_face_isface.ms file exists");
        console.info(`MindSporeDemo ml_face_isface.ms size:${res.size}`);
      }
    }).catch((err: BusinessError) => {
      console.info("MindSporeDemo ml_face_isface.ms file does not exists! access failed with error message: " +
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

  describe('MindSporeTest', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTCREATE_0100
     * @tc.name       : testMindSporeContextCreateOne
     * @tc.desc       : test the normal condition of OH_AI_ContextCreate
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMindSporeContextCreate001', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextCreateOne();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTDESTROY_0100
     * @tc.name       : testMindSporeContextDestroyOne
     * @tc.desc       : test the normal condition of OH_AI_ContextDestroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMindSporeContextDestroy001', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextDestroyOne();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTSETTHREADNUM_0100
     * @tc.name       : testMindSporeContextSetThreadNumOne
     * @tc.desc       : test the normal condition of OH_AI_ContextSetThreadNum
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeContextSetThreadNum001', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextSetThreadNumOne(2);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(2);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTSETTHREADNUM_0200
     * @tc.name       : testMindSporeContextSetThreadNumTwo
     * @tc.desc       : test the abnormal condition of OH_AI_ContextSetThreadNum
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMindSporeContextSetThreadNum002', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextSetThreadNumTwo(2);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTSETTHREADNUM_0300
     * @tc.name       : testMindSporeContextSetThreadNumThree
     * @tc.desc       : test the normal condition of OH_AI_ContextSetThreadNum
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeContextSetThreadNum003', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextSetThreadNumOne(666666);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(666666);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTGETTHREADNUM_0100
     * @tc.name       : testMindSporeContextGetThreadNumOne
     * @tc.desc       : test the normal condition of OH_AI_ContextGetThreadNum
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeContextGetThreadNum001', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextGetThreadNumOne(1);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTGETTHREADNUM_0200
     * @tc.name       : testMindSporeContextGetThreadNumTwo
     * @tc.desc       : test the abnormal condition of OH_AI_ContextGetThreadNum
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMindSporeContextGetThreadNum002', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextGetThreadNumTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTSETTHREADAFFINITYMODE_0100
     * @tc.name       : testMindSporeContextSetThreadAffinityModeOne
     * @tc.desc       : test the normal condition of OH_AI_ContextSetThreadAffinityMode
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeContextSetThreadAffinityMode001', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextSetThreadAffinityModeOne(0);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTSETTHREADAFFINITYMODE_0200
     * @tc.name       : testMindSporeContextSetThreadAffinityModeTwo
     * @tc.desc       : test the normal condition of OH_AI_ContextSetThreadAffinityMode
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeContextSetThreadAffinityMode002', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextSetThreadAffinityModeOne(1);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTSETTHREADAFFINITYMODE_0300
     * @tc.name       : testMindSporeContextSetThreadAffinityModeThree
     * @tc.desc       : test the normal condition of OH_AI_ContextSetThreadAffinityMode
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeContextSetThreadAffinityMode003', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextSetThreadAffinityModeOne(2);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(2);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTSETTHREADAFFINITYMODE_0400
     * @tc.name       : testMindSporeContextSetThreadAffinityModeFour
     * @tc.desc       : test the abnormal condition of OH_AI_ContextSetThreadAffinityMode
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMindSporeContextSetThreadAffinityMode004', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextSetThreadAffinityModeTwo(2);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTSETTHREADAFFINITYMODE_0500
     * @tc.name       : testMindSporeContextSetThreadAffinityModeFive
     * @tc.desc       : test the abnormal condition of OH_AI_ContextSetThreadAffinityMode
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMindSporeContextSetThreadAffinityMode005', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextSetThreadAffinityModeOne(6);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTGETTHREADAFFINITYMODE_0100
     * @tc.name       : testMindSporeContextGetThreadAffinityModeOne
     * @tc.desc       : test the normal condition of OH_AI_ContextGetThreadAffinityMode
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeContextGetThreadAffinityMode001', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextGetThreadAffinityModeOne(1);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTGETTHREADAFFINITYMODE_0200
     * @tc.name       : testMindSporeContextGetThreadAffinityModeTwo
     * @tc.desc       : test the abnormal condition of OH_AI_ContextGetThreadAffinityMode
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMindSporeContextGetThreadAffinityMode002', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextGetThreadAffinityModeTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOCREATE_0100
     * @tc.name       : testMindSporeDeviceInfoCreateOne
     * @tc.desc       : test the normal condition of OH_AI_DeviceInfoCreate
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMindSporeDeviceInfoCreate001', 0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoCreateOne(OH_AI_DeviceType.OH_AI_DEVICETYPE_CPU);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOGETDEVICETYPE_0100
     * @tc.name       : testMindSporeDeviceInfoGetDeviceTypeOne
     * @tc.desc       : test the normal condition of OH_AI_DeviceInfoGetDeviceType
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeDeviceInfoGetDeviceType001', 0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoGetDeviceTypeOne(OH_AI_DeviceType.OH_AI_DEVICETYPE_CPU);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOGETDEVICETYPE_0200
     * @tc.name       : testMindSporeDeviceInfoGetDeviceTypeTwo
     * @tc.desc       : test the normal condition of OH_AI_DeviceInfoGetDeviceType
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeDeviceInfoGetDeviceType002', 0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoGetDeviceTypeTwo(OH_AI_DeviceType.OH_AI_DEVICETYPE_NNRT);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOGETDEVICETYPE_0300
     * @tc.name       : testMindSporeDeviceInfoGetDeviceTypeThree
     * @tc.desc       : test the normal condition of OH_AI_DeviceInfoGetDeviceType
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeDeviceInfoGetDeviceType003', 0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoGetDeviceTypeThree(OH_AI_DeviceType.OH_AI_DEVICETYPE_INVALID);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOGETDEVICETYPE_0400
     * @tc.name       : testMindSporeDeviceInfoGetDeviceTypeFour
     * @tc.desc       : When use function OH_AI_DeviceInfoGetDeviceType (), do not use the OH_AI_DeviceInfoHandle
     * parameter created by function OH_AI_DeviceInfoCreate(), just input nullptr as parameter
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMindSporeDeviceInfoGetDeviceType004', 0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoGetDeviceTypeFour();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFODESTROY_0100
     * @tc.name       : testMindSporeDeviceInfoDestroyOne
     * @tc.desc       : test the normal condition of OH_AI_DeviceInfoDestroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMindSporeDeviceInfoDestroy001', 0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoDestroyOne(OH_AI_DeviceType.OH_AI_DEVICETYPE_CPU);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETPROVIDER_0100
     * @tc.name       : testMindSporeDeviceInfoSetProviderOne
     * @tc.desc       : test the normal condition of OH_AI_DeviceInfoSetProvider
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeDeviceInfoSetProvider001', 0, async (done: Function) => {
      let value_data = "CPU";
      let data = mindSpore.oHAIDeviceInfoSetProviderOne(OH_AI_DeviceType.OH_AI_DEVICETYPE_CPU, value_data);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(value_data);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETPROVIDER_0200
     * @tc.name       : testMindSporeDeviceInfoSetProviderTwo
     * @tc.desc       : test the normal condition of OH_AI_DeviceInfoSetProvider
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeDeviceInfoSetProvider002', 0, async (done: Function) => {
      let value_data = "NNRT";
      let data = mindSpore.oHAIDeviceInfoSetProviderTwo(OH_AI_DeviceType.OH_AI_DEVICETYPE_NNRT, value_data);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(value_data);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETPROVIDER_0300
     * @tc.name       : testMindSporeDeviceInfoSetProviderThree
     * @tc.desc       : test the normal condition of OH_AI_DeviceInfoSetProvider
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeDeviceInfoSetProvider003', 0, async (done: Function) => {
      let value_data = "INVALID";
      let data = mindSpore.oHAIDeviceInfoSetProviderThree(OH_AI_DeviceType.OH_AI_DEVICETYPE_INVALID, value_data);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETPROVIDER_0400
     * @tc.name       : testMindSporeDeviceInfoSetProviderFour
     * @tc.desc       : test the abnormal condition of OH_AI_DeviceInfoSetProvider
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMindSporeDeviceInfoSetProvider004', 0, async (done: Function) => {
      let value_data = "INVALID";
      let data = mindSpore.oHAIDeviceInfoSetProviderFour(OH_AI_DeviceType.OH_AI_DEVICETYPE_INVALID, value_data);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOGETPROVIDER_0100
     * @tc.name       : testMindSporeDeviceInfoGetProviderOne
     * @tc.desc       : test the normal condition of OH_AI_DeviceInfoGetProvider
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeDeviceInfoGetProvider001', 0, async (done: Function) => {
      let value_data = "CPU";
      let data = mindSpore.oHAIDeviceInfoGetProviderOne(OH_AI_DeviceType.OH_AI_DEVICETYPE_CPU, value_data);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(value_data);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOGETPROVIDER_0200
     * @tc.name       : testMindSporeDeviceInfoGetProviderTwo
     * @tc.desc       : test the abnormal condition of OH_AI_DeviceInfoGetProvider
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMindSporeDeviceInfoGetProvider002', 0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoGetProviderTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETPROVIDERDEVICE_0100
     * @tc.name       : testMindSporeDeviceInfoSetProviderDeviceOne
     * @tc.desc       : test the normal condition of OH_AI_DeviceInfoSetProviderDevice
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeDeviceInfoSetProviderDevice001', 0, async (done: Function) => {
      let value_data = "CPU";
      let data = mindSpore.oHAIDeviceInfoSetProviderDeviceOne(OH_AI_DeviceType.OH_AI_DEVICETYPE_CPU, value_data);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(value_data);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETPROVIDERDEVICE_0200
     * @tc.name       : testMindSporeDeviceInfoSetProviderDeviceTwo
     * @tc.desc       : test the normal condition of OH_AI_DeviceInfoSetProviderDevice
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeDeviceInfoSetProviderDevice002', 0, async (done: Function) => {
      let value_data = "NNRT";
      let data = mindSpore.oHAIDeviceInfoSetProviderDeviceTwo(OH_AI_DeviceType.OH_AI_DEVICETYPE_NNRT, value_data);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(value_data);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETPROVIDERDEVICE_0300
     * @tc.name       : testMindSporeDeviceInfoSetProviderDeviceThree
     * @tc.desc       : test the normal condition of OH_AI_DeviceInfoSetProviderDevice
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeDeviceInfoSetProviderDevice003', 0, async (done: Function) => {
      let value_data = "INVALID";
      let data = mindSpore.oHAIDeviceInfoSetProviderDeviceThree(OH_AI_DeviceType.OH_AI_DEVICETYPE_INVALID, value_data);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOGETPROVIDERDEVICE_0100
     * @tc.name       : testMindSporeDeviceInfoGetProviderDeviceOne
     * @tc.desc       : test the normal condition of OH_AI_DeviceInfoGetProviderDevice
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeDeviceInfoGetProviderDevice001', 0, async (done: Function) => {
      let value_data = "CPU";
      let data = mindSpore.oHAIDeviceInfoGetProviderDeviceOne(OH_AI_DeviceType.OH_AI_DEVICETYPE_CPU, value_data);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(value_data);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOGETPROVIDERDEVICE_0200
     * @tc.name       : testMindSporeDeviceInfoGetProviderDeviceTwo
     * @tc.desc       : test the abnormal condition of OH_AI_DeviceInfoGetProviderDevice
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMindSporeDeviceInfoGetProviderDevice002', 0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoGetProviderDeviceTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETENABLEFP16_0100
     * @tc.name       : testMindSporeDeviceInfoSetEnableFP16One
     * @tc.desc       : test the normal condition of OH_AI_DeviceInfoSetEnableFP16
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeDeviceInfoSetEnableFP16001', 0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoSetEnableFP16One(OH_AI_DeviceType.OH_AI_DEVICETYPE_CPU);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETENABLEFP16_0200
     * @tc.name       : testMindSporeDeviceInfoSetEnableFP16Two
     * @tc.desc       : test the normal condition of OH_AI_DeviceInfoSetEnableFP16
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeDeviceInfoSetEnableFP16002', 0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoSetEnableFP16Two(OH_AI_DeviceType.OH_AI_DEVICETYPE_CPU);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETENABLEFP16_0300
     * @tc.name       : testMindSporeDeviceInfoSetEnableFP16Three
     * @tc.desc       : test the abnormal condition of OH_AI_DeviceInfoSetEnableFP16
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMindSporeDeviceInfoSetEnableFP16003', 0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoSetEnableFP16Three();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOGETENABLEFP16_0100
     * @tc.name       : testMindSporeDeviceInfoGetEnableFP16One
     * @tc.desc       : test the normal condition of OH_AI_DeviceInfoGetEnableFP16
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeDeviceInfoGetEnableFP16001', 0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoGetEnableFP16One(OH_AI_DeviceType.OH_AI_DEVICETYPE_CPU);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOGETENABLEFP16_0200
     * @tc.name       : testMindSporeDeviceInfoGetEnableFP16Two
     * @tc.desc       : test the abnormal condition of OH_AI_DeviceInfoGetEnableFP16
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMindSporeDeviceInfoGetEnableFP16002', 0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoGetEnableFP16Two();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETDEVICEID_0100
     * @tc.name       : testMindSporeDeviceInfoSetDeviceIdOne
     * @tc.desc       : test the normal condition of OH_AI_DeviceInfoSetDeviceId
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeDeviceInfoSetDeviceId001', 0, async (done: Function) => {
      let value_data = 111;
      let data = mindSpore.oHAIDeviceInfoSetDeviceIdOne(OH_AI_DeviceType.OH_AI_DEVICETYPE_NNRT, value_data);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(value_data);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETDEVICEID_0200
     * @tc.name       : testMindSporeDeviceInfoSetDeviceIdTwo
     * @tc.desc       : test the abnormal condition of OH_AI_DeviceInfoSetDeviceId
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMindSporeDeviceInfoSetDeviceId002', 0, async (done: Function) => {
      let value_data = 111;
      let data = mindSpore.oHAIDeviceInfoSetDeviceIdTwo(value_data);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOGETDEVICEID_0100
     * @tc.name       : testMindSporeDeviceInfoGetDeviceIdOne
     * @tc.desc       : test the normal condition of OH_AI_DeviceInfoGetDeviceId
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeDeviceInfoGetDeviceId001', 0, async (done: Function) => {
      let value_data = 222;
      let data = mindSpore.oHAIDeviceInfoGetDeviceIdOne(OH_AI_DeviceType.OH_AI_DEVICETYPE_NNRT, value_data);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(value_data);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOGETDEVICEID_0200
     * @tc.name       : testMindSporeDeviceInfoGetDeviceIdTwo
     * @tc.desc       : test the abnormal condition of OH_AI_DeviceInfoGetDeviceId
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMindSporeDeviceInfoGetDeviceId002', 0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoGetDeviceIdTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETPERFORMANCEMODE_0100
     * @tc.name       : testMindSporeDeviceInfoSetPerformanceModeOne
     * @tc.desc       : test the normal condition of OH_AI_DeviceInfoSetPerformanceMode
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeDeviceInfoSetPerformanceMode001', 0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoSetPerformanceModeOne(OH_AI_DeviceType.OH_AI_DEVICETYPE_NNRT,
        OH_AI_PerformanceMode.OH_AI_PERFORMANCE_NONE);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(OH_AI_PerformanceMode.OH_AI_PERFORMANCE_NONE);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETPERFORMANCEMODE_0200
     * @tc.name       : testMindSporeDeviceInfoSetPerformanceModeTwo
     * @tc.desc       : test the normal condition of OH_AI_DeviceInfoSetPerformanceMode
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeDeviceInfoSetPerformanceMode002', 0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoSetPerformanceModeTwo(OH_AI_DeviceType.OH_AI_DEVICETYPE_NNRT,
        OH_AI_PerformanceMode.OH_AI_PERFORMANCE_LOW);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(OH_AI_PerformanceMode.OH_AI_PERFORMANCE_LOW);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETPERFORMANCEMODE_0300
     * @tc.name       : testMindSporeDeviceInfoSetPerformanceModeThree
     * @tc.desc       : test the normal condition of OH_AI_DeviceInfoSetPerformanceMode
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeDeviceInfoSetPerformanceMode003', 0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoSetPerformanceModeThree(OH_AI_DeviceType.OH_AI_DEVICETYPE_NNRT,
        OH_AI_PerformanceMode.OH_AI_PERFORMANCE_MEDIUM);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(OH_AI_PerformanceMode.OH_AI_PERFORMANCE_MEDIUM);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETPERFORMANCEMODE_0400
     * @tc.name       : testMindSporeDeviceInfoSetPerformanceModeFour
     * @tc.desc       : test the normal condition of OH_AI_DeviceInfoSetPerformanceMode
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeDeviceInfoSetPerformanceMode004', 0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoSetPerformanceModeFour(OH_AI_DeviceType.OH_AI_DEVICETYPE_NNRT,
        OH_AI_PerformanceMode.OH_AI_PERFORMANCE_HIGH);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(OH_AI_PerformanceMode.OH_AI_PERFORMANCE_HIGH);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETPERFORMANCEMODE_0500
     * @tc.name       : testMindSporeDeviceInfoSetPerformanceModeFive
     * @tc.desc       : test the normal condition of OH_AI_DeviceInfoSetPerformanceMode
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeDeviceInfoSetPerformanceMode005', 0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoSetPerformanceModeFive(OH_AI_DeviceType.OH_AI_DEVICETYPE_NNRT,
        OH_AI_PerformanceMode.OH_AI_PERFORMANCE_EXTREME);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(OH_AI_PerformanceMode.OH_AI_PERFORMANCE_EXTREME);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOGETPERFORMANCEMODE_0100
     * @tc.name       : testMindSporeDeviceInfoGetPerformanceModeOne
     * @tc.desc       : test the normal condition of OH_AI_DeviceInfoGetPerformanceMode
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeDeviceInfoGetPerformanceMode001', 0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoGetPerformanceModeOne(OH_AI_DeviceType.OH_AI_DEVICETYPE_NNRT,
        OH_AI_PerformanceMode.OH_AI_PERFORMANCE_NONE);
      expect(data).assertEqual(OH_AI_PerformanceMode.OH_AI_PERFORMANCE_NONE);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOGETPERFORMANCEMODE_0200
     * @tc.name       : testMindSporeDeviceInfoGetPerformanceModeTwo
     * @tc.desc       : test the abnormal condition of OH_AI_DeviceInfoGetPerformanceMode
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMindSporeDeviceInfoGetPerformanceMode002', 0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoGetPerformanceModeTwo();
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTSETTHREADAFFINITYCORELIST_0100
     * @tc.name       : testMindSporeContextSetThreadAffinityCoreListOne
     * @tc.desc       : test the normal condition of OH_AI_ContextSetThreadAffinityCoreList
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeContextSetThreadAffinityCoreList001', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextSetThreadAffinityCoreListOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTGETTHREADAFFINITYCORELIST_0100
     * @tc.name       : testMindSporeContextGetThreadAffinityCoreListOne
     * @tc.desc       : test the normal condition of OH_AI_ContextGetThreadAffinityCoreList
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeContextGetThreadAffinityCoreList001', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextGetThreadAffinityCoreListOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTSETENABLEPARALLEL_0100
     * @tc.name       : testMindSporeContextSetEnableParallelOne
     * @tc.desc       : test the normal condition of OH_AI_ContextSetEnableParallel
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeContextSetEnableParallel001', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextSetEnableParallelOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTSETENABLEPARALLEL_0200
     * @tc.name       : testMindSporeContextSetEnableParallelTwo
     * @tc.desc       : test the normal condition of OH_AI_ContextSetEnableParallel
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeContextSetEnableParallel002', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextSetEnableParallelTwo();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTGETENABLEPARALLEL_0100
     * @tc.name       : testMindSporeContextGetEnableParallelOne
     * @tc.desc       : test the normal condition of OH_AI_ContextGetEnableParallel
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeContextGetEnableParallel001', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextGetEnableParallelOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTGETENABLEPARALLEL_0200
     * @tc.name       : testMindSporeContextGetEnableParallelTwo
     * @tc.desc       : test the abnormal condition of OH_AI_ContextGetEnableParallel
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMindSporeContextGetEnableParallel002', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextGetEnableParallelTwo();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETFREQUENCY_0100
     * @tc.name       : testMindSporeDeviceInfoSetFrequencyOne
     * @tc.desc       : test the normal condition of OH_AI_DeviceInfoSetFrequency
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeDeviceInfoSetFrequency001', 0, async (done: Function) => {
      let value_one = 1;
      let data = mindSpore.oHAISetFrequencyOne(value_one);
      expect(data).assertEqual(value_one);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOGETFREQUENCY_0100
     * @tc.name       : testMindSporeDeviceInfoGetFrequencyOne
     * @tc.desc       : test the normal condition of OH_AI_DeviceInfoGetFrequency
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeDeviceInfoGetFrequency001', 0, async (done: Function) => {
      let value_one = 4;
      let data = mindSpore.oHAIGetFrequencyOne(value_one);
      expect(data).assertEqual(value_one);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_MODELCREATE_0100
     * @tc.name       : testMindSporeModelCreateOne
     * @tc.desc       : test the normal condition of OH_AI_ModelCreate
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeModelCreate001', 0, async (done: Function) => {
      let data = mindSpore.oHAIModelCreateOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_MODELDESTROY_0100
     * @tc.name       : testMindSporeModelDestroyOne
     * @tc.desc       : test the normal condition of OH_AI_ModelDestroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeModelDestroy001', 0, async (done: Function) => {
      let data = mindSpore.oHAIModelDestroyOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORCREATE_0100
     * @tc.name       : testMindSporeTensorCreateOne
     * @tc.desc       : test the normal condition of OH_AI_TensorCreate
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeTensorCreate001', 0, async (done: Function) => {
      let data = mindSpore.oHAITensorCreateOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORDESTROY_0100
     * @tc.name       : testMindSporeTensorDestroyOne
     * @tc.desc       : test the normal condition of OH_AI_TensorDestroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeTensorDestroy001', 0, async (done: Function) => {
      let data = mindSpore.oHAITensorDestroyOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORCLONE_0100
     * @tc.name       : testMindSporeTensorCloneOne
     * @tc.desc       : test the normal condition of OH_AI_TensorClone
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeTensorClone001', 0, async (done: Function) => {
      let data = mindSpore.oHAITensorCloneOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORSETNAME_0100
     * @tc.name       : testMindSporeTensorSetNameOne
     * @tc.desc       : test the normal condition of OH_AI_TensorSetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeTensorSetName001', 0, async (done: Function) => {
      let value_data = "new_data";
      let data = mindSpore.oHAITensorSetNameOne(value_data);
      expect(data).assertEqual(value_data);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORGETNAME_0100
     * @tc.name       : testMindSporeTensorGetNameOne
     * @tc.desc       : test the normal condition of OH_AI_TensorGetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeTensorGetName001', 0, async (done: Function) => {
      let value_data = "new_get_data";
      let data = mindSpore.oHAITensorGetNameOne(value_data);
      expect(data).assertEqual(value_data);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORSETDATATYPE_0100
     * @tc.name       : testMindSporeTensorSetDataTypeOne
     * @tc.desc       : test the normal condition of OH_AI_TensorSetDataType
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeTensorSetDataType001', 0, async (done: Function) => {
      let data = mindSpore.oHAITensorSetDataTypeOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORGETDATATYPE_0100
     * @tc.name       : testMindSporeTensorGetDataTypeOne
     * @tc.desc       : test the normal condition of OH_AI_TensorGetDataType
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeTensorGetDataType001', 0, async (done: Function) => {
      let data = mindSpore.oHAITensorGetDataTypeOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORSETSHAPE_0100
     * @tc.name       : testMindSporeTensorSetShapeOne
     * @tc.desc       : test the normal condition of OH_AI_TensorSetShape
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeTensorSetShape001', 0, async (done: Function) => {
      let data = mindSpore.oHAITensorSetShapeOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORGETSHAPE_0100
     * @tc.name       : testMindSporeTensorGetShapeOne
     * @tc.desc       : test the normal condition of OH_AI_TensorGetShape
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeTensorGetShape001', 0, async (done: Function) => {
      let data = mindSpore.oHAITensorGetShapeOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORSETFORMAT_0100
     * @tc.name       : testMindSporeTensorSetFormatOne
     * @tc.desc       : test the normal condition of OH_AI_TensorSetFormat
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeTensorSetFormat001', 0, async (done: Function) => {
      let data = mindSpore.oHAITensorSetFormatOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORGETFORMAT_0100
     * @tc.name       : testMindSporeTensorGetFormatOne
     * @tc.desc       : test the normal condition of OH_AI_TensorGetFormat
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeTensorGetFormat001', 0, async (done: Function) => {
      let data = mindSpore.oHAITensorGetFormatOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORSETDATA_0100
     * @tc.name       : testMindSporeTensorSetDataOne
     * @tc.desc       : test the normal condition of OH_AI_TensorSetData
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeTensorSetData001', 0, async (done: Function) => {
      let data = mindSpore.oHAITensorSetDataOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORGETDATA_0100
     * @tc.name       : testMindSporeTensorGetDataOne
     * @tc.desc       : test the normal condition of OH_AI_TensorGetData
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeTensorGetData001', 0, async (done: Function) => {
      let data = mindSpore.oHAITensorGetDataOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORGETMUTABLEDATA_0100
     * @tc.name       : testMindSporeTensorGetMutableDataOne
     * @tc.desc       : test the normal condition of OH_AI_TensorGetMutableData
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeTensorGetMutableData001', 0, async (done: Function) => {
      let data = mindSpore.oHAITensorGetMutableDataOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORGETELEMENTNUM_0100
     * @tc.name       : testMindSporeTensorGetElementNumOne
     * @tc.desc       : test the normal condition of OH_AI_TensorGetElementNum
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeTensorGetElementNum001', 0, async (done: Function) => {
      let data = mindSpore.oHAITensorGetElementNumOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORGETDATASIZE_0100
     * @tc.name       : testMindSporeTensorGetDataSizeOne
     * @tc.desc       : test the normal condition of OH_AI_TensorGetDataSize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeTensorGetDataSize001', 0, async (done: Function) => {
      let data = mindSpore.oHAITensorGetDataSizeOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_GETALLNNRTDEVICEDESCS_0100
     * @tc.name       : testMindSporeGetAllNNRTDeviceDescsOne
     * @tc.desc       : test the normal condition of OH_AI_GetAllNNRTDeviceDescs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeGetAllNNRTDeviceDescs001', 0, async (done: Function) => {
      let data = mindSpore.oHAIGetAllNNRTDeviceDescsOne();
        expect(data).assertEqual(1);
        done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DESTROYALLNNRTDEVICEDESCS_0100
     * @tc.name       : testMindSporeDestroyAllNNRTDeviceDescsOne
     * @tc.desc       : test the normal condition of OH_AI_DestroyAllNNRTDeviceDescs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeDestroyAllNNRTDeviceDescs001', 0, async (done: Function) => {
		let data = mindSpore.oHAIDestroyAllNNRTDeviceDescsOne();
        expect(data).assertEqual(1);
        done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_GETDEVICEIDFROMNNRTDEVICEDESC_0100
     * @tc.name       : testMindSporeGetDeviceIdFromNNRTDeviceDescOne
     * @tc.desc       : test the normal condition of OH_AI_GetDeviceIdFromNNRTDeviceDesc
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeGetDeviceIdFromNNRTDeviceDesc001', 0, async (done: Function) => {
        let data = mindSpore.oHAIGetDeviceIdFromNNRTDeviceDescOne();
        expect(data).assertEqual(1);
        done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_GETNAMEFROMNNRTDEVICEDESC_0100
     * @tc.name       : testMindSporeGetNameFromNNRTDeviceDescOne
     * @tc.desc       : test the normal condition of OH_AI_GetNameFromNNRTDeviceDesc
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeGetNameFromNNRTDeviceDesc001', 0, async (done: Function) => {
        let data = mindSpore.oHAIGetNameFromNNRTDeviceDescOne();
        expect(data).assertEqual(1);
        done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_GETTYPEFROMNNRTDEVICEDESC_0100
     * @tc.name       : testMindSporeGetTypeFromNNRTDeviceDescOne
     * @tc.desc       : test the normal condition of OH_AI_GetTypeFromNNRTDeviceDesc
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeGetTypeFromNNRTDeviceDesc001', 0, async (done: Function) => {
        let data = mindSpore.oHAIGetTypeFromNNRTDeviceDescOne();
        expect(data).assertEqual(1);
        done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CREATENNRTDEVICEINFOBYNAME_0100
     * @tc.name       : testMindSporeCreateNNRTDeviceInfoByNameOne
     * @tc.desc       : test the normal condition of OH_AI_CreateNNRTDeviceInfoByName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeCreateNNRTDeviceInfoByName001', 0, async (done: Function) => {
        let data = mindSpore.oHAICreateNNRTDeviceInfoByNameOne();
        expect(data).assertEqual(1);
        done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CREATENNRTDEVICEINFOBYTYPE_0100
     * @tc.name       : testMindSporeCreateNNRTDeviceInfoByTypeOne
     * @tc.desc       : test the normal condition of OH_AI_CreateNNRTDeviceInfoByType
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeCreateNNRTDeviceInfoByType001', 0, async (done: Function) => {
        let data = mindSpore.oHAICreateNNRTDeviceInfoByTypeOne();
        expect(data).assertEqual(1);
        done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETPRIORITY_0100
     * @tc.name       : testMindSporeDeviceInfoSetPriorityOne
     * @tc.desc       : test the normal condition of OH_AI_DeviceInfoSetPriority
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeDeviceInfoSetPriority001', 0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoSetPriorityOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_GETELEMENTOFNNRTDEVICEDESCS_0100
     * @tc.name       : testMindSporeGetElementOfNNRTDeviceDescsOne
     * @tc.desc       : test the normal condition of OH_AI_GetElementOfNNRTDeviceDescs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeGetElementOfNNRTDeviceDescs001', 0, async (done: Function) => {
        let data = mindSpore.oHAIGetElementOfNNRTDeviceDescsOne();
        expect(data).assertEqual(1);
        done()

    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOADDEXTENSION_0100
     * @tc.name       : testMindSporeDeviceInfoAddExtensionOne
     * @tc.desc       : test the normal condition of OH_AI_DeviceInfoAddExtension
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeDeviceInfoAddExtension001', 0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoAddExtensionOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTADDDEVICEINFO_0100
     * @tc.name       : testMindSporeContextAddDeviceInfoOne
     * @tc.desc       : test the normal condition of OH_AI_ContextAddDeviceInfo
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeContextAddDeviceInfo001', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextAddDeviceInfoOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_MODELBUILDFROMFILE_0100
     * @tc.name       : testMindSporeModelBuildFromFileOne
     * @tc.desc       : test the normal condition of OH_AI_ModelBuildFromFile
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeModelBuildFromFile001', 0, async (done: Function) => {
      let data = mindSpore.oHAIModelBuildFromFileOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_MODELRESIZE_0100
     * @tc.name       : testMindSporeModelResizeOne
     * @tc.desc       : test the normal condition of OH_AI_ModelResize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeModelResize001', 0, async (done: Function) => {
      let data = mindSpore.oHAIModelResizeOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_MODELPREDICT_0100
     * @tc.name       : testMindSporeModelPredictOne
     * @tc.desc       : test the normal condition of OH_AI_ModelPredict
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeModelPredict001', 0, async (done: Function) => {
      let data = mindSpore.oHAIModelPredictOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_MODELGETINPUTS_0100
     * @tc.name       : testMindSporeModelGetInputsOne
     * @tc.desc       : test the normal condition of OH_AI_ModelGetInputs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeModelGetInputs001', 0, async (done: Function) => {
      let data = mindSpore.oHAIModelGetInputsOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_MODELGETOUTPUTS_0100
     * @tc.name       : testMindSporeModelGetOutputsOne
     * @tc.desc       : test the normal condition of OH_AI_ModelGetOutputs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeModelGetOutputs001', 0, async (done: Function) => {
      let data = mindSpore.oHAIModelGetOutputsOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_MODELGETINPUTBYTENSORNAME_0100
     * @tc.name       : testMindSporeModelGetInputByTensorNameOne
     * @tc.desc       : test the normal condition of OH_AI_ModelGetInputByTensorName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeModelGetInputByTensorName001', 0, async (done: Function) => {
      let data = mindSpore.oHAIModelGetInputByTensorNameOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_MODELGETOUTPUTBYTENSORNAME_0100
     * @tc.name       : testMindSporeModelGetOutputByTensorNameOne
     * @tc.desc       : test the normal condition of OH_AI_ModelGetOutputByTensorName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeModelGetOutputByTensorName001', 0, async (done: Function) => {
      let data = mindSpore.oHAIModelGetOutputByTensorNameOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORSETUSERDATA_0100
     * @tc.name       : testMindSporeTensorSetUserDataOne
     * @tc.desc       : test the normal condition of OH_AI_TensorSetUserData
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeTensorSetUserData001', 0, async (done: Function) => {
      let data = mindSpore.oHAITensorSetUserDataOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOCREATE_0200
     * @tc.name       : testMindSporeDeviceInfoCreateTwo
     * @tc.desc       : test the abnormal condition of OH_AI_DeviceInfoCreate
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMindSporeDeviceInfoCreate002', 0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoCreateTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTSETTHREADAFFINITYCORELIST_0200
     * @tc.name       : testMindSporeContextSetThreadAffinityCoreListTwo
     * @tc.desc       : test the normal condition of OH_AI_ContextSetThreadAffinityCoreList
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeContextSetThreadAffinityCoreList002', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextSetThreadAffinityCoreListTwo();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTGETTHREADAFFINITYCORELIST_0200
     * @tc.name       : testMindSporeContextGetThreadAffinityCoreListTwo
     * @tc.desc       : test the normal condition of OH_AI_ContextGetThreadAffinityCoreList
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeContextGetThreadAffinityCoreList002', 0, async (done: Function) => {
      let data = mindSpore.oHAIContextGetThreadAffinityCoreListTwo();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETFREQUENCY_0200
     * @tc.name       : testMindSporeDeviceInfoSetFrequencyTwo
     * @tc.desc       : test the abnormal condition of OH_AI_DeviceInfoSetFrequency
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeDeviceInfoSetFrequency002', 0, async (done: Function) => {
      let result_value = -1;
      let value_one = 1;
      let data = mindSpore.oHAISetFrequencyTwo(value_one);
      expect(data).assertEqual(result_value);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOGETFREQUENCY_0200
     * @tc.name       : testMindSporeDeviceInfoGetFrequencyTwo
     * @tc.desc       : test the abnormal condition of OH_AI_DeviceInfoGetFrequency
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeDeviceInfoGetFrequency002', 0, async (done: Function) => {
      let value_one = -1;
      let data = mindSpore.oHAIGetFrequencyTwo();
      expect(data).assertEqual(value_one);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORCREATE_0200
     * @tc.name       : testMindSporeTensorCreateTwo
     * @tc.desc       : test the abnormal condition of OH_AI_TensorCreate
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeTensorCreate002', 0, async (done: Function) => {
      let data = mindSpore.oHAITensorCreateTwo();
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORSETNAME_0200
     * @tc.name       : testMindSporeTensorSetNameTwo
     * @tc.desc       : test the abnormal condition of OH_AI_TensorSetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeTensorSetName002', 0, async (done: Function) => {
      let data = mindSpore.oHAITensorSetNameTwo();
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORGETNAME_0200
     * @tc.name       : testMindSporeTensorGetNameTwo
     * @tc.desc       : test the abnormal condition of OH_AI_TensorGetName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeTensorGetName002', 0, async (done: Function) => {
      let data = mindSpore.oHAITensorGetNameTwo();
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORSETDATATYPE_0200
     * @tc.name       : testMindSporeTensorSetDataTypeTwo
     * @tc.desc       : test the abnormal condition of OH_AI_TensorSetDataType
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeTensorSetDataType002', 0, async (done: Function) => {
      let data = mindSpore.oHAITensorSetDataTypeTwo();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORGETDATATYPE_0200
     * @tc.name       : testMindSporeTensorGetDataTypeTwo
     * @tc.desc       : test the abnormal condition of OH_AI_TensorGetDataType
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeTensorGetDataType002', 0, async (done: Function) => {
      let data = mindSpore.oHAITensorGetDataTypeTwo();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORSETSHAPE_0200
     * @tc.name       : testMindSporeTensorSetShapeTwo
     * @tc.desc       : test the abnormal condition of OH_AI_TensorSetShape
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeTensorSetShape002', 0, async (done: Function) => {
      let data = mindSpore.oHAITensorSetShapeTwo();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORGETSHAPE_0200
     * @tc.name       : testMindSporeTensorGetShapeTwo
     * @tc.desc       : test the abnormal condition of OH_AI_TensorGetShape
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeTensorGetShape002', 0, async (done: Function) => {
      let data = mindSpore.oHAITensorGetShapeTwo();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORSETFORMAT_0200
     * @tc.name       : testMindSporeTensorSetFormatTwo
     * @tc.desc       : test the abnormal condition of OH_AI_TensorSetFormat
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeTensorSetFormat002', 0, async (done: Function) => {
      let data = mindSpore.oHAITensorSetFormatTwo();
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORGETFORMAT_0200
     * @tc.name       : testMindSporeTensorGetFormatTwo
     * @tc.desc       : test the abnormal condition of OH_AI_TensorGetFormat
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeTensorGetFormat002', 0, async (done: Function) => {
      let data = mindSpore.oHAITensorGetFormatTwo();
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORSETDATA_0200
     * @tc.name       : testMindSporeTensorSetDataTwo
     * @tc.desc       : test the abnormal condition of OH_AI_TensorSetData
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeTensorSetData002', 0, async (done: Function) => {
      let data = mindSpore.oHAITensorSetDataTwo();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORGETDATA_0200
     * @tc.name       : testMindSporeTensorGetDataTwo
     * @tc.desc       : test the abnormal condition of OH_AI_TensorGetData
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeTensorGetData002', 0, async (done: Function) => {
      let data = mindSpore.oHAITensorGetDataTwo();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORGETMUTABLEDATA_0200
     * @tc.name       : testMindSporeTensorGetMutableDataTwo
     * @tc.desc       : test the abnormal condition of OH_AI_TensorGetMutableData
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeTensorGetMutableData002', 0, async (done: Function) => {
      let data = mindSpore.oHAITensorGetMutableDataTwo();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORGETELEMENTNUM_0200
     * @tc.name       : testMindSporeTensorGetElementNumTwo
     * @tc.desc       : test the abnormal condition of OH_AI_TensorGetElementNum
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeTensorGetElementNum002', 0, async (done: Function) => {
      let data = mindSpore.oHAITensorGetElementNumTwo();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORGETDATASIZE_0200
     * @tc.name       : testMindSporeTensorGetDataSizeTwo
     * @tc.desc       : test the abnormal condition of OH_AI_TensorGetDataSize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeTensorGetDataSize002', 0, async (done: Function) => {
      let data = mindSpore.oHAITensorGetDataSizeTwo();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETPRIORITY_0200
     * @tc.name       : testMindSporeDeviceInfoSetPriorityTwo
     * @tc.desc       : test the abnormal condition of OH_AI_DeviceInfoSetPriority
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeDeviceInfoSetPriority002', 0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoSetPriorityTwo();
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORCLONE_0200
     * @tc.name       : testMindSporeTensorCloneTwo
     * @tc.desc       : test the normal condition of OH_AI_TensorClone
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeTensorClone002', 0, async (done: Function) => {
      let data = mindSpore.oHAITensorCloneTwo();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOADDEXTENSION_0200
     * @tc.name       : testMindSporeDeviceInfoAddExtensionTwo
     * @tc.desc       : test the normal condition of OH_AI_DeviceInfoAddExtension
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeDeviceInfoAddExtension002', 0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoAddExtensionTwo();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOADDEXTENSION_0300
     * @tc.name       : testMindSporeDeviceInfoAddExtensionThree
     * @tc.desc       : test the normal condition of OH_AI_DeviceInfoAddExtension
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeDeviceInfoAddExtension003', 0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoAddExtensionThree();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MINDSPORE_OH_AI_MODELBUILD_0100
     * @tc.name       : testMindSporeModelBuild001
     * @tc.desc       : test the normal condition of OH_AI_ModelBuild
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMindSporeModelBuild001', 0, async (done: Function) => {
      let data = mindSpore.oHAIModelBuildOne();
      expect(data).assertEqual(1);
      done()
    });
  })
}
