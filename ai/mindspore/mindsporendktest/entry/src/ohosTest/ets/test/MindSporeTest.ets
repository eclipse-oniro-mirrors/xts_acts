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

import { beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium'
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
     * @tc.name   testMindSporeContextCreate001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTCREATE_0100
     * @tc.desc   test the normal condition of OH_AI_ContextCreate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeContextCreate001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIContextCreateOne();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeContextDestroy001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTDESTROY_0100
     * @tc.desc   test the normal condition of OH_AI_ContextDestroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeContextDestroy001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIContextDestroyOne();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeContextSetThreadNum001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTSETTHREADNUM_0100
     * @tc.desc   test the normal condition of OH_AI_ContextSetThreadNum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeContextSetThreadNum001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIContextSetThreadNumOne(2);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(2);
      done()
    });

    /**
     * @tc.name   testMindSporeContextSetThreadNum002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTSETTHREADNUM_0200
     * @tc.desc   test the abnormal condition of OH_AI_ContextSetThreadNum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeContextSetThreadNum002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIContextSetThreadNumTwo(2);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMindSporeContextSetThreadNum003
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTSETTHREADNUM_0300
     * @tc.desc   test the normal condition of OH_AI_ContextSetThreadNum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeContextSetThreadNum003', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIContextSetThreadNumOne(666666);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(666666);
      done()
    });

    /**
     * @tc.name   testMindSporeContextGetThreadNum001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTGETTHREADNUM_0100
     * @tc.desc   test the normal condition of OH_AI_ContextGetThreadNum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeContextGetThreadNum001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIContextGetThreadNumOne(1);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeContextGetThreadNum002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTGETTHREADNUM_0200
     * @tc.desc   test the abnormal condition of OH_AI_ContextGetThreadNum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeContextGetThreadNum002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIContextGetThreadNumTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMindSporeContextSetThreadAffinityMode001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTSETTHREADAFFINITYMODE_0100
     * @tc.desc   test the normal condition of OH_AI_ContextSetThreadAffinityMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeContextSetThreadAffinityMode001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIContextSetThreadAffinityModeOne(0);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMindSporeContextSetThreadAffinityMode002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTSETTHREADAFFINITYMODE_0200
     * @tc.desc   test the normal condition of OH_AI_ContextSetThreadAffinityMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeContextSetThreadAffinityMode002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIContextSetThreadAffinityModeOne(1);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeContextSetThreadAffinityMode003
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTSETTHREADAFFINITYMODE_0300
     * @tc.desc   test the normal condition of OH_AI_ContextSetThreadAffinityMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeContextSetThreadAffinityMode003', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIContextSetThreadAffinityModeOne(2);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(2);
      done()
    });

    /**
     * @tc.name   testMindSporeContextSetThreadAffinityMode004
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTSETTHREADAFFINITYMODE_0400
     * @tc.desc   test the abnormal condition of OH_AI_ContextSetThreadAffinityMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeContextSetThreadAffinityMode004', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIContextSetThreadAffinityModeTwo(2);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMindSporeContextSetThreadAffinityMode005
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTSETTHREADAFFINITYMODE_0500
     * @tc.desc   test the abnormal condition of OH_AI_ContextSetThreadAffinityMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeContextSetThreadAffinityMode005', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIContextSetThreadAffinityModeOne(6);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMindSporeContextGetThreadAffinityMode001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTGETTHREADAFFINITYMODE_0100
     * @tc.desc   test the normal condition of OH_AI_ContextGetThreadAffinityMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeContextGetThreadAffinityMode001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIContextGetThreadAffinityModeOne(1);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeContextGetThreadAffinityMode002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTGETTHREADAFFINITYMODE_0200
     * @tc.desc   test the abnormal condition of OH_AI_ContextGetThreadAffinityMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeContextGetThreadAffinityMode002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIContextGetThreadAffinityModeTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoCreate001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOCREATE_0100
     * @tc.desc   test the normal condition of OH_AI_DeviceInfoCreate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoCreate001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoCreateOne(OH_AI_DeviceType.OH_AI_DEVICETYPE_CPU);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoGetDeviceType001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOGETDEVICETYPE_0100
     * @tc.desc   test the normal condition of OH_AI_DeviceInfoGetDeviceType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoGetDeviceType001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoGetDeviceTypeOne(OH_AI_DeviceType.OH_AI_DEVICETYPE_CPU);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoGetDeviceType002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOGETDEVICETYPE_0200
     * @tc.desc   test the normal condition of OH_AI_DeviceInfoGetDeviceType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoGetDeviceType002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoGetDeviceTypeTwo(OH_AI_DeviceType.OH_AI_DEVICETYPE_NNRT);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoGetDeviceType003
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOGETDEVICETYPE_0300
     * @tc.desc   test the normal condition of OH_AI_DeviceInfoGetDeviceType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoGetDeviceType003', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoGetDeviceTypeThree(OH_AI_DeviceType.OH_AI_DEVICETYPE_INVALID);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoGetDeviceType004
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOGETDEVICETYPE_0400
     * @tc.desc   When use function OH_AI_DeviceInfoGetDeviceType (), do not use the OH_AI_DeviceInfoHandle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoGetDeviceType004', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoGetDeviceTypeFour();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoDestroy001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFODESTROY_0100
     * @tc.desc   test the normal condition of OH_AI_DeviceInfoDestroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoDestroy001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoDestroyOne(OH_AI_DeviceType.OH_AI_DEVICETYPE_CPU);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoSetProvider001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETPROVIDER_0100
     * @tc.desc   test the normal condition of OH_AI_DeviceInfoSetProvider
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoSetProvider001', Level.LEVEL0, async (done: Function) => {
      let value_data = "CPU";
      let data = mindSpore.oHAIDeviceInfoSetProviderOne(OH_AI_DeviceType.OH_AI_DEVICETYPE_CPU, value_data);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(value_data);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoSetProvider002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETPROVIDER_0200
     * @tc.desc   test the normal condition of OH_AI_DeviceInfoSetProvider
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoSetProvider002', Level.LEVEL0, async (done: Function) => {
      let value_data = "NNRT";
      let data = mindSpore.oHAIDeviceInfoSetProviderTwo(OH_AI_DeviceType.OH_AI_DEVICETYPE_NNRT, value_data);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(value_data);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoSetProvider003
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETPROVIDER_0300
     * @tc.desc   test the normal condition of OH_AI_DeviceInfoSetProvider
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoSetProvider003', Level.LEVEL0, async (done: Function) => {
      let value_data = "INVALID";
      let data = mindSpore.oHAIDeviceInfoSetProviderThree(OH_AI_DeviceType.OH_AI_DEVICETYPE_INVALID, value_data);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoSetProvider004
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETPROVIDER_0400
     * @tc.desc   test the abnormal condition of OH_AI_DeviceInfoSetProvider
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoSetProvider004', Level.LEVEL0, async (done: Function) => {
      let value_data = "INVALID";
      let data = mindSpore.oHAIDeviceInfoSetProviderFour(OH_AI_DeviceType.OH_AI_DEVICETYPE_INVALID, value_data);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoGetProvider001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOGETPROVIDER_0100
     * @tc.desc   test the normal condition of OH_AI_DeviceInfoGetProvider
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoGetProvider001', Level.LEVEL0, async (done: Function) => {
      let value_data = "CPU";
      let data = mindSpore.oHAIDeviceInfoGetProviderOne(OH_AI_DeviceType.OH_AI_DEVICETYPE_CPU, value_data);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(value_data);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoGetProvider002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOGETPROVIDER_0200
     * @tc.desc   test the abnormal condition of OH_AI_DeviceInfoGetProvider
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoGetProvider002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoGetProviderTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoSetProviderDevice001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETPROVIDERDEVICE_0100
     * @tc.desc   test the normal condition of OH_AI_DeviceInfoSetProviderDevice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoSetProviderDevice001', Level.LEVEL0, async (done: Function) => {
      let value_data = "CPU";
      let data = mindSpore.oHAIDeviceInfoSetProviderDeviceOne(OH_AI_DeviceType.OH_AI_DEVICETYPE_CPU, value_data);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(value_data);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoSetProviderDevice002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETPROVIDERDEVICE_0200
     * @tc.desc   test the normal condition of OH_AI_DeviceInfoSetProviderDevice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoSetProviderDevice002', Level.LEVEL0, async (done: Function) => {
      let value_data = "NNRT";
      let data = mindSpore.oHAIDeviceInfoSetProviderDeviceTwo(OH_AI_DeviceType.OH_AI_DEVICETYPE_NNRT, value_data);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(value_data);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoSetProviderDevice003
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETPROVIDERDEVICE_0300
     * @tc.desc   test the normal condition of OH_AI_DeviceInfoSetProviderDevice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoSetProviderDevice003', Level.LEVEL0, async (done: Function) => {
      let value_data = "INVALID";
      let data = mindSpore.oHAIDeviceInfoSetProviderDeviceThree(OH_AI_DeviceType.OH_AI_DEVICETYPE_INVALID, value_data);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoGetProviderDevice001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOGETPROVIDERDEVICE_0100
     * @tc.desc   test the normal condition of OH_AI_DeviceInfoGetProviderDevice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoGetProviderDevice001', Level.LEVEL0, async (done: Function) => {
      let value_data = "CPU";
      let data = mindSpore.oHAIDeviceInfoGetProviderDeviceOne(OH_AI_DeviceType.OH_AI_DEVICETYPE_CPU, value_data);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(value_data);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoGetProviderDevice002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOGETPROVIDERDEVICE_0200
     * @tc.desc   test the abnormal condition of OH_AI_DeviceInfoGetProviderDevice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoGetProviderDevice002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoGetProviderDeviceTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoSetEnableFP16001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETENABLEFP16_0100
     * @tc.desc   test the normal condition of OH_AI_DeviceInfoSetEnableFP16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoSetEnableFP16001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoSetEnableFP16One(OH_AI_DeviceType.OH_AI_DEVICETYPE_CPU);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoSetEnableFP16002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETENABLEFP16_0200
     * @tc.desc   test the normal condition of OH_AI_DeviceInfoSetEnableFP16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoSetEnableFP16002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoSetEnableFP16Two(OH_AI_DeviceType.OH_AI_DEVICETYPE_CPU);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoSetEnableFP16003
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETENABLEFP16_0300
     * @tc.desc   test the abnormal condition of OH_AI_DeviceInfoSetEnableFP16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoSetEnableFP16003', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoSetEnableFP16Three();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoGetEnableFP16001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOGETENABLEFP16_0100
     * @tc.desc   test the normal condition of OH_AI_DeviceInfoGetEnableFP16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoGetEnableFP16001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoGetEnableFP16One(OH_AI_DeviceType.OH_AI_DEVICETYPE_CPU);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoGetEnableFP16002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOGETENABLEFP16_0200
     * @tc.desc   test the abnormal condition of OH_AI_DeviceInfoGetEnableFP16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoGetEnableFP16002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoGetEnableFP16Two();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoSetDeviceId001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETDEVICEID_0100
     * @tc.desc   test the normal condition of OH_AI_DeviceInfoSetDeviceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoSetDeviceId001', Level.LEVEL0, async (done: Function) => {
      let value_data = 111;
      let data = mindSpore.oHAIDeviceInfoSetDeviceIdOne(OH_AI_DeviceType.OH_AI_DEVICETYPE_NNRT, value_data);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(value_data);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoSetDeviceId002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETDEVICEID_0200
     * @tc.desc   test the abnormal condition of OH_AI_DeviceInfoSetDeviceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoSetDeviceId002', Level.LEVEL0, async (done: Function) => {
      let value_data = 111;
      let data = mindSpore.oHAIDeviceInfoSetDeviceIdTwo(value_data);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoGetDeviceId001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOGETDEVICEID_0100
     * @tc.desc   test the normal condition of OH_AI_DeviceInfoGetDeviceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoGetDeviceId001', Level.LEVEL0, async (done: Function) => {
      let value_data = 222;
      let data = mindSpore.oHAIDeviceInfoGetDeviceIdOne(OH_AI_DeviceType.OH_AI_DEVICETYPE_NNRT, value_data);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(value_data);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoGetDeviceId002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOGETDEVICEID_0200
     * @tc.desc   test the abnormal condition of OH_AI_DeviceInfoGetDeviceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoGetDeviceId002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoGetDeviceIdTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoSetPerformanceMode001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETPERFORMANCEMODE_0100
     * @tc.desc   test the normal condition of OH_AI_DeviceInfoSetPerformanceMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoSetPerformanceMode001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoSetPerformanceModeOne(OH_AI_DeviceType.OH_AI_DEVICETYPE_NNRT,
        OH_AI_PerformanceMode.OH_AI_PERFORMANCE_NONE);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(OH_AI_PerformanceMode.OH_AI_PERFORMANCE_NONE);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoSetPerformanceMode002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETPERFORMANCEMODE_0200
     * @tc.desc   test the normal condition of OH_AI_DeviceInfoSetPerformanceMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoSetPerformanceMode002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoSetPerformanceModeTwo(OH_AI_DeviceType.OH_AI_DEVICETYPE_NNRT,
        OH_AI_PerformanceMode.OH_AI_PERFORMANCE_LOW);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(OH_AI_PerformanceMode.OH_AI_PERFORMANCE_LOW);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoSetPerformanceMode003
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETPERFORMANCEMODE_0300
     * @tc.desc   test the normal condition of OH_AI_DeviceInfoSetPerformanceMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoSetPerformanceMode003', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoSetPerformanceModeThree(OH_AI_DeviceType.OH_AI_DEVICETYPE_NNRT,
        OH_AI_PerformanceMode.OH_AI_PERFORMANCE_MEDIUM);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(OH_AI_PerformanceMode.OH_AI_PERFORMANCE_MEDIUM);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoSetPerformanceMode004
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETPERFORMANCEMODE_0400
     * @tc.desc   test the normal condition of OH_AI_DeviceInfoSetPerformanceMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoSetPerformanceMode004', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoSetPerformanceModeFour(OH_AI_DeviceType.OH_AI_DEVICETYPE_NNRT,
        OH_AI_PerformanceMode.OH_AI_PERFORMANCE_HIGH);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(OH_AI_PerformanceMode.OH_AI_PERFORMANCE_HIGH);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoSetPerformanceMode005
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETPERFORMANCEMODE_0500
     * @tc.desc   test the normal condition of OH_AI_DeviceInfoSetPerformanceMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoSetPerformanceMode005', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoSetPerformanceModeFive(OH_AI_DeviceType.OH_AI_DEVICETYPE_NNRT,
        OH_AI_PerformanceMode.OH_AI_PERFORMANCE_EXTREME);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(OH_AI_PerformanceMode.OH_AI_PERFORMANCE_EXTREME);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoGetPerformanceMode001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOGETPERFORMANCEMODE_0100
     * @tc.desc   test the normal condition of OH_AI_DeviceInfoGetPerformanceMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoGetPerformanceMode001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoGetPerformanceModeOne(OH_AI_DeviceType.OH_AI_DEVICETYPE_NNRT,
        OH_AI_PerformanceMode.OH_AI_PERFORMANCE_NONE);
      expect(data).assertEqual(OH_AI_PerformanceMode.OH_AI_PERFORMANCE_NONE);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoGetPerformanceMode002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOGETPERFORMANCEMODE_0200
     * @tc.desc   test the abnormal condition of OH_AI_DeviceInfoGetPerformanceMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoGetPerformanceMode002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoGetPerformanceModeTwo();
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMindSporeContextSetThreadAffinityCoreList001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTSETTHREADAFFINITYCORELIST_0100
     * @tc.desc   test the normal condition of OH_AI_ContextSetThreadAffinityCoreList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeContextSetThreadAffinityCoreList001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIContextSetThreadAffinityCoreListOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeContextGetThreadAffinityCoreList001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTGETTHREADAFFINITYCORELIST_0100
     * @tc.desc   test the normal condition of OH_AI_ContextGetThreadAffinityCoreList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeContextGetThreadAffinityCoreList001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIContextGetThreadAffinityCoreListOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeContextSetEnableParallel001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTSETENABLEPARALLEL_0100
     * @tc.desc   test the normal condition of OH_AI_ContextSetEnableParallel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeContextSetEnableParallel001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIContextSetEnableParallelOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeContextSetEnableParallel002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTSETENABLEPARALLEL_0200
     * @tc.desc   test the normal condition of OH_AI_ContextSetEnableParallel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeContextSetEnableParallel002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIContextSetEnableParallelTwo();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeContextGetEnableParallel001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTGETENABLEPARALLEL_0100
     * @tc.desc   test the normal condition of OH_AI_ContextGetEnableParallel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeContextGetEnableParallel001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIContextGetEnableParallelOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeContextGetEnableParallel002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTGETENABLEPARALLEL_0200
     * @tc.desc   test the abnormal condition of OH_AI_ContextGetEnableParallel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeContextGetEnableParallel002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIContextGetEnableParallelTwo();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoSetFrequency001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETFREQUENCY_0100
     * @tc.desc   test the normal condition of OH_AI_DeviceInfoSetFrequency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoSetFrequency001', Level.LEVEL0, async (done: Function) => {
      let value_one = 1;
      let data = mindSpore.oHAISetFrequencyOne(value_one);
      expect(data).assertEqual(value_one);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoGetFrequency001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOGETFREQUENCY_0100
     * @tc.desc   test the normal condition of OH_AI_DeviceInfoGetFrequency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoGetFrequency001', Level.LEVEL0, async (done: Function) => {
      let value_one = 4;
      let data = mindSpore.oHAIGetFrequencyOne(value_one);
      expect(data).assertEqual(value_one);
      done()
    });

    /**
     * @tc.name   testMindSporeModelCreate001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_MODELCREATE_0100
     * @tc.desc   test the normal condition of OH_AI_ModelCreate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeModelCreate001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIModelCreateOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeModelDestroy001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_MODELDESTROY_0100
     * @tc.desc   test the normal condition of OH_AI_ModelDestroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeModelDestroy001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIModelDestroyOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeTensorCreate001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORCREATE_0100
     * @tc.desc   test the normal condition of OH_AI_TensorCreate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeTensorCreate001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAITensorCreateOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeTensorDestroy001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORDESTROY_0100
     * @tc.desc   test the normal condition of OH_AI_TensorDestroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeTensorDestroy001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAITensorDestroyOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeTensorClone001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORCLONE_0100
     * @tc.desc   test the normal condition of OH_AI_TensorClone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeTensorClone001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAITensorCloneOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeTensorSetName001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORSETNAME_0100
     * @tc.desc   test the normal condition of OH_AI_TensorSetName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeTensorSetName001', Level.LEVEL0, async (done: Function) => {
      let value_data = "new_data";
      let data = mindSpore.oHAITensorSetNameOne(value_data);
      expect(data).assertEqual(value_data);
      done()
    });

    /**
     * @tc.name   testMindSporeTensorGetName001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORGETNAME_0100
     * @tc.desc   test the normal condition of OH_AI_TensorGetName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeTensorGetName001', Level.LEVEL0, async (done: Function) => {
      let value_data = "new_get_data";
      let data = mindSpore.oHAITensorGetNameOne(value_data);
      expect(data).assertEqual(value_data);
      done()
    });

    /**
     * @tc.name   testMindSporeTensorSetDataType001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORSETDATATYPE_0100
     * @tc.desc   test the normal condition of OH_AI_TensorSetDataType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeTensorSetDataType001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAITensorSetDataTypeOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeTensorGetDataType001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORGETDATATYPE_0100
     * @tc.desc   test the normal condition of OH_AI_TensorGetDataType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeTensorGetDataType001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAITensorGetDataTypeOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeTensorSetShape001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORSETSHAPE_0100
     * @tc.desc   test the normal condition of OH_AI_TensorSetShape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeTensorSetShape001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAITensorSetShapeOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeTensorGetShape001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORGETSHAPE_0100
     * @tc.desc   test the normal condition of OH_AI_TensorGetShape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeTensorGetShape001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAITensorGetShapeOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeTensorSetFormat001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORSETFORMAT_0100
     * @tc.desc   test the normal condition of OH_AI_TensorSetFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeTensorSetFormat001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAITensorSetFormatOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeTensorGetFormat001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORGETFORMAT_0100
     * @tc.desc   test the normal condition of OH_AI_TensorGetFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeTensorGetFormat001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAITensorGetFormatOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeTensorSetData001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORSETDATA_0100
     * @tc.desc   test the normal condition of OH_AI_TensorSetData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeTensorSetData001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAITensorSetDataOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeTensorGetData001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORGETDATA_0100
     * @tc.desc   test the normal condition of OH_AI_TensorGetData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeTensorGetData001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAITensorGetDataOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeTensorGetMutableData001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORGETMUTABLEDATA_0100
     * @tc.desc   test the normal condition of OH_AI_TensorGetMutableData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeTensorGetMutableData001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAITensorGetMutableDataOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeTensorGetElementNum001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORGETELEMENTNUM_0100
     * @tc.desc   test the normal condition of OH_AI_TensorGetElementNum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeTensorGetElementNum001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAITensorGetElementNumOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeTensorGetDataSize001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORGETDATASIZE_0100
     * @tc.desc   test the normal condition of OH_AI_TensorGetDataSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeTensorGetDataSize001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAITensorGetDataSizeOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeGetAllNNRTDeviceDescs001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_GETALLNNRTDEVICEDESCS_0100
     * @tc.desc   test the normal condition of OH_AI_GetAllNNRTDeviceDescs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeGetAllNNRTDeviceDescs001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIGetAllNNRTDeviceDescsOne();
        expect(data).assertEqual(1);
        done()
    });

    /**
     * @tc.name   testMindSporeDestroyAllNNRTDeviceDescs001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DESTROYALLNNRTDEVICEDESCS_0100
     * @tc.desc   test the normal condition of OH_AI_DestroyAllNNRTDeviceDescs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDestroyAllNNRTDeviceDescs001', Level.LEVEL0, async (done: Function) => {
		let data = mindSpore.oHAIDestroyAllNNRTDeviceDescsOne();
        expect(data).assertEqual(1);
        done()
    });

    /**
     * @tc.name   testMindSporeGetDeviceIdFromNNRTDeviceDesc001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_GETDEVICEIDFROMNNRTDEVICEDESC_0100
     * @tc.desc   test the normal condition of OH_AI_GetDeviceIdFromNNRTDeviceDesc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeGetDeviceIdFromNNRTDeviceDesc001', Level.LEVEL0, async (done: Function) => {
        let data = mindSpore.oHAIGetDeviceIdFromNNRTDeviceDescOne();
        expect(data).assertEqual(1);
        done()
    });

    /**
     * @tc.name   testMindSporeGetNameFromNNRTDeviceDesc001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_GETNAMEFROMNNRTDEVICEDESC_0100
     * @tc.desc   test the normal condition of OH_AI_GetNameFromNNRTDeviceDesc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeGetNameFromNNRTDeviceDesc001', Level.LEVEL0, async (done: Function) => {
        let data = mindSpore.oHAIGetNameFromNNRTDeviceDescOne();
        expect(data).assertEqual(1);
        done()
    });

    /**
     * @tc.name   testMindSporeGetTypeFromNNRTDeviceDesc001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_GETTYPEFROMNNRTDEVICEDESC_0100
     * @tc.desc   test the normal condition of OH_AI_GetTypeFromNNRTDeviceDesc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeGetTypeFromNNRTDeviceDesc001', Level.LEVEL0, async (done: Function) => {
        let data = mindSpore.oHAIGetTypeFromNNRTDeviceDescOne();
        expect(data).assertEqual(1);
        done()
    });

    /**
     * @tc.name   testMindSporeCreateNNRTDeviceInfoByName001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_CREATENNRTDEVICEINFOBYNAME_0100
     * @tc.desc   test the normal condition of OH_AI_CreateNNRTDeviceInfoByName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeCreateNNRTDeviceInfoByName001', Level.LEVEL0, async (done: Function) => {
        let data = mindSpore.oHAICreateNNRTDeviceInfoByNameOne();
        expect(data).assertEqual(1);
        done()
    });

    /**
     * @tc.name   testMindSporeCreateNNRTDeviceInfoByType001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_CREATENNRTDEVICEINFOBYTYPE_0100
     * @tc.desc   test the normal condition of OH_AI_CreateNNRTDeviceInfoByType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeCreateNNRTDeviceInfoByType001', Level.LEVEL0, async (done: Function) => {
        let data = mindSpore.oHAICreateNNRTDeviceInfoByTypeOne();
        expect(data).assertEqual(1);
        done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoSetPriority001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETPRIORITY_0100
     * @tc.desc   test the normal condition of OH_AI_DeviceInfoSetPriority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoSetPriority001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoSetPriorityOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeGetElementOfNNRTDeviceDescs001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_GETELEMENTOFNNRTDEVICEDESCS_0100
     * @tc.desc   test the normal condition of OH_AI_GetElementOfNNRTDeviceDescs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeGetElementOfNNRTDeviceDescs001', Level.LEVEL0, async (done: Function) => {
        let data = mindSpore.oHAIGetElementOfNNRTDeviceDescsOne();
        expect(data).assertEqual(1);
        done()

    });

    /**
     * @tc.name   testMindSporeDeviceInfoAddExtension001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOADDEXTENSION_0100
     * @tc.desc   test the normal condition of OH_AI_DeviceInfoAddExtension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoAddExtension001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoAddExtensionOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeContextAddDeviceInfo001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTADDDEVICEINFO_0100
     * @tc.desc   test the normal condition of OH_AI_ContextAddDeviceInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeContextAddDeviceInfo001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIContextAddDeviceInfoOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeModelBuildFromFile001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_MODELBUILDFROMFILE_0100
     * @tc.desc   test the normal condition of OH_AI_ModelBuildFromFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeModelBuildFromFile001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIModelBuildFromFileOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeModelResize001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_MODELRESIZE_0100
     * @tc.desc   test the normal condition of OH_AI_ModelResize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeModelResize001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIModelResizeOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeModelPredict001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_MODELPREDICT_0100
     * @tc.desc   test the normal condition of OH_AI_ModelPredict
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeModelPredict001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIModelPredictOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeModelGetInputs001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_MODELGETINPUTS_0100
     * @tc.desc   test the normal condition of OH_AI_ModelGetInputs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeModelGetInputs001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIModelGetInputsOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeModelGetOutputs001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_MODELGETOUTPUTS_0100
     * @tc.desc   test the normal condition of OH_AI_ModelGetOutputs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeModelGetOutputs001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIModelGetOutputsOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeModelGetInputByTensorName001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_MODELGETINPUTBYTENSORNAME_0100
     * @tc.desc   test the normal condition of OH_AI_ModelGetInputByTensorName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeModelGetInputByTensorName001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIModelGetInputByTensorNameOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeModelGetOutputByTensorName001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_MODELGETOUTPUTBYTENSORNAME_0100
     * @tc.desc   test the normal condition of OH_AI_ModelGetOutputByTensorName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeModelGetOutputByTensorName001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIModelGetOutputByTensorNameOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeTensorSetUserData001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORSETUSERDATA_0100
     * @tc.desc   test the normal condition of OH_AI_TensorSetUserData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeTensorSetUserData001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAITensorSetUserDataOne();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoCreate002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOCREATE_0200
     * @tc.desc   test the abnormal condition of OH_AI_DeviceInfoCreate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoCreate002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoCreateTwo();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeContextSetThreadAffinityCoreList002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTSETTHREADAFFINITYCORELIST_0200
     * @tc.desc   test the normal condition of OH_AI_ContextSetThreadAffinityCoreList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeContextSetThreadAffinityCoreList002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIContextSetThreadAffinityCoreListTwo();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeContextGetThreadAffinityCoreList002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_CONTEXTGETTHREADAFFINITYCORELIST_0200
     * @tc.desc   test the normal condition of OH_AI_ContextGetThreadAffinityCoreList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeContextGetThreadAffinityCoreList002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIContextGetThreadAffinityCoreListTwo();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoSetFrequency002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETFREQUENCY_0200
     * @tc.desc   test the abnormal condition of OH_AI_DeviceInfoSetFrequency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoSetFrequency002', Level.LEVEL0, async (done: Function) => {
      let result_value = -1;
      let value_one = 1;
      let data = mindSpore.oHAISetFrequencyTwo(value_one);
      expect(data).assertEqual(result_value);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoGetFrequency002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOGETFREQUENCY_0200
     * @tc.desc   test the abnormal condition of OH_AI_DeviceInfoGetFrequency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoGetFrequency002', Level.LEVEL0, async (done: Function) => {
      let value_one = -1;
      let data = mindSpore.oHAIGetFrequencyTwo();
      expect(data).assertEqual(value_one);
      done()
    });

    /**
     * @tc.name   testMindSporeTensorCreate002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORCREATE_0200
     * @tc.desc   test the abnormal condition of OH_AI_TensorCreate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeTensorCreate002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAITensorCreateTwo();
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMindSporeTensorSetName002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORSETNAME_0200
     * @tc.desc   test the abnormal condition of OH_AI_TensorSetName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeTensorSetName002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAITensorSetNameTwo();
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMindSporeTensorGetName002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORGETNAME_0200
     * @tc.desc   test the abnormal condition of OH_AI_TensorGetName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeTensorGetName002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAITensorGetNameTwo();
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMindSporeTensorSetDataType002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORSETDATATYPE_0200
     * @tc.desc   test the abnormal condition of OH_AI_TensorSetDataType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeTensorSetDataType002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAITensorSetDataTypeTwo();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeTensorGetDataType002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORGETDATATYPE_0200
     * @tc.desc   test the abnormal condition of OH_AI_TensorGetDataType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeTensorGetDataType002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAITensorGetDataTypeTwo();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeTensorSetShape002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORSETSHAPE_0200
     * @tc.desc   test the abnormal condition of OH_AI_TensorSetShape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeTensorSetShape002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAITensorSetShapeTwo();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeTensorGetShape002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORGETSHAPE_0200
     * @tc.desc   test the abnormal condition of OH_AI_TensorGetShape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeTensorGetShape002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAITensorGetShapeTwo();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeTensorSetFormat002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORSETFORMAT_0200
     * @tc.desc   test the abnormal condition of OH_AI_TensorSetFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeTensorSetFormat002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAITensorSetFormatTwo();
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMindSporeTensorGetFormat002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORGETFORMAT_0200
     * @tc.desc   test the abnormal condition of OH_AI_TensorGetFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeTensorGetFormat002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAITensorGetFormatTwo();
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMindSporeTensorSetData002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORSETDATA_0200
     * @tc.desc   test the abnormal condition of OH_AI_TensorSetData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeTensorSetData002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAITensorSetDataTwo();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeTensorGetData002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORGETDATA_0200
     * @tc.desc   test the abnormal condition of OH_AI_TensorGetData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeTensorGetData002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAITensorGetDataTwo();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeTensorGetMutableData002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORGETMUTABLEDATA_0200
     * @tc.desc   test the abnormal condition of OH_AI_TensorGetMutableData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeTensorGetMutableData002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAITensorGetMutableDataTwo();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeTensorGetElementNum002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORGETELEMENTNUM_0200
     * @tc.desc   test the abnormal condition of OH_AI_TensorGetElementNum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeTensorGetElementNum002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAITensorGetElementNumTwo();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeTensorGetDataSize002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORGETDATASIZE_0200
     * @tc.desc   test the abnormal condition of OH_AI_TensorGetDataSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeTensorGetDataSize002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAITensorGetDataSizeTwo();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoSetPriority002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOSETPRIORITY_0200
     * @tc.desc   test the abnormal condition of OH_AI_DeviceInfoSetPriority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoSetPriority002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoSetPriorityTwo();
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMindSporeTensorClone002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_TENSORCLONE_0200
     * @tc.desc   test the normal condition of OH_AI_TensorClone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeTensorClone002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAITensorCloneTwo();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoAddExtension002
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOADDEXTENSION_0200
     * @tc.desc   test the normal condition of OH_AI_DeviceInfoAddExtension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoAddExtension002', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoAddExtensionTwo();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeDeviceInfoAddExtension003
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_DEVICEINFOADDEXTENSION_0300
     * @tc.desc   test the normal condition of OH_AI_DeviceInfoAddExtension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeDeviceInfoAddExtension003', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIDeviceInfoAddExtensionThree();
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMindSporeModelBuild001
     * @tc.number SUB_THIRDPARTY_MINDSPORE_OH_AI_MODELBUILD_0100
     * @tc.desc   test the normal condition of OH_AI_ModelBuild
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMindSporeModelBuild001', Level.LEVEL0, async (done: Function) => {
      let data = mindSpore.oHAIModelBuildOne();
      expect(data).assertEqual(1);
      done()
    });
  })
}
