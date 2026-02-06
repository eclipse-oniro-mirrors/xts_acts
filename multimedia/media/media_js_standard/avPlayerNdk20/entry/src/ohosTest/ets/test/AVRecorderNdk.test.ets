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

import { beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium'
import avrecorder from 'libavrecorderndk.so'
import { abilityAccessCtrl, common, PermissionRequestResult, Permissions } from '@kit.AbilityKit';
import { Driver, ON } from '@kit.TestKit';
import { fileIo as fs } from '@kit.CoreFileKit';

export default function AVRecorderNdkTest() {
  describe('AVRecorderNdkTest', () => {
    beforeAll((done: Function) => {
      let permissions: Array<Permissions> = ['ohos.permission.MICROPHONE'];
      let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      // requestPermissionsFromUser会判断权限的授权状态来决定是否唤起弹窗
      setTimeout(async () => {
        let driver: Driver = await Driver.create();
        let text = await driver.findComponent(ON.text('允许'));
        if (text) {
          await text.click()
        }
      }, 2000)
      atManager.requestPermissionsFromUser(getContext(), permissions).then((data: PermissionRequestResult) => {
        let grantStatus: Array<number> = data.authResults;
        let length: number = grantStatus.length;
        for (let i = 0; i < length; i++) {
          if (grantStatus[i] != 0) { // 用户拒绝授权，提示用户必须授权才能访问当前页面的功能，并引导用户到系统设置中打开相应的权限
            return;
          }
        }
        done();
      })
    })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_Prepare0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_Prepare0100
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_Prepare0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_Prepare0100 start====");
          let result: number = avrecorder.OH_AVRecorder_Prepare0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_Prepare0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_GetAVRecorderConfig0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_GetAVRecorderConfig0100
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_GetAVRecorderConfig0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_GetAVRecorderConfig0100 start====");
          let result: number = avrecorder.OH_AVRecorder_GetAVRecorderConfig0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_GetAVRecorderConfig0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_GetInputSurface0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_GetInputSurface0101
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_GetInputSurface0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_GetInputSurface0101 start====");
          let result: number = avrecorder.OH_AVRecorder_GetInputSurface0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_GetInputSurface0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_UpdateRotation0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_UpdateRotation0100
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_UpdateRotation0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_UpdateRotation0100 start====");
          let result: number = avrecorder.OH_AVRecorder_UpdateRotation0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_UpdateRotation0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_Start0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_Start0100
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_Start0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_Start0100 start====");
          let result: number = avrecorder.OH_AVRecorder_Start0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_Start0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_Pause0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_Pause0100
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_Pause0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_Pause0100 start====");
          let result: number = avrecorder.OH_AVRecorder_Pause0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_Pause0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_Resume0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_Resume0100
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_Resume0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_Resume0100 start====");
          let result: number = avrecorder.OH_AVRecorder_Resume0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_Resume0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_Stop0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_Stop0100
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_Stop0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_Stop0100 start====");
          let result: number = avrecorder.OH_AVRecorder_Stop0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_Stop0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_Reset0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_Reset0100
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_Reset0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_Reset0100 start====");
          let result: number = avrecorder.OH_AVRecorder_Reset0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_Reset0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_Release0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_Release0100
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_Release0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_Release0100 start====");
          let result: number = avrecorder.OH_AVRecorder_Release0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_Release0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_GetAvailableEncoder0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_GetAvailableEncoder0100
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_GetAvailableEncoder0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_GetAvailableEncoder0100 start====");
          let result: number = avrecorder.OH_AVRecorder_GetAvailableEncoder0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_GetAvailableEncoder0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_SetStateCallback0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_SetStateCallback0100
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_SetStateCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_SetStateCallback0100 start====");
          let result: number = avrecorder.OH_AVRecorder_SetStateCallback0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_SetStateCallback0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_SetStateCallback0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_SetStateCallback0101
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_SetStateCallback0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_SetStateCallback0101 start====");
          let result: number = avrecorder.OH_AVRecorder_SetStateCallback0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_SetStateCallback0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_SetErrorCallback0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_SetErrorCallback0100
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_SetErrorCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_SetErrorCallback0100 start====");
          let result: number = avrecorder.OH_AVRecorder_SetErrorCallback0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_SetErrorCallback0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_SetErrorCallback0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_SetErrorCallback0101
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_SetErrorCallback0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_SetErrorCallback0101 start====");
          let result: number = avrecorder.OH_AVRecorder_SetErrorCallback0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_SetErrorCallback0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_SetUriCallback0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_SetUriCallback0100
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_SetUriCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_SetUriCallback0100 start====");
          let result: number = avrecorder.OH_AVRecorder_SetUriCallback0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_SetUriCallback0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_SetUriCallback0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_SetUriCallback0101
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_SetUriCallback0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_SetUriCallback0101 start====");
          let result: number = avrecorder.OH_AVRecorder_SetUriCallback0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_SetUriCallback0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_SetWillMuteWhenInterrupted0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_SetWillMuteWhenInterrupted0100
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_SetWillMuteWhenInterrupted0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_SetWillMuteWhenInterrupted0100 start====");
          const context: Context = getContext(); // 参考应用文件访问与管理。
          let filePath: string = context.filesDir + '/example1.amr';
          let audioFile: fs.File = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          let fileFd: number = audioFile.fd; // 获取文件fd。
          let result: number = avrecorder.OH_AVRecorder_SetWillMuteWhenInterrupted0100(fileFd);
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_SetWillMuteWhenInterrupted0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_ContainerFormatType0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_ContainerFormatType0100
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_ContainerFormatType0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const context: Context = getContext(); // 参考应用文件访问与管理。
          let filePath: string = context.filesDir + '/example1.amr';
          let audioFile: fs.File = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          let fileFd: number = audioFile.fd; // 获取文件fd。
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_ContainerFormatType0100 start====");
          let result: number = avrecorder.OH_AVRecorder_ContainerFormatType0100(fileFd);
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_ContainerFormatType0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_MetadataTemplate0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_MetadataTemplate0100
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_MetadataTemplate0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const context: Context = getContext(); // 参考应用文件访问与管理。
          let filePath: string = context.filesDir + '/example2.mp3';
          let audioFile: fs.File = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          let fileFd: number = audioFile.fd; // 获取文件fd。
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_MetadataTemplate0100 start====");
          let result: number = avrecorder.OH_AVRecorder_MetadataTemplate0100(fileFd);
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_MetadataTemplate0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_MetadataTemplate0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_MetadataTemplate0101
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_MetadataTemplate0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const context: Context = getContext(); // 参考应用文件访问与管理。
          let filePath: string = context.filesDir + '/example2.mp3';
          let audioFile: fs.File = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          let fileFd: number = audioFile.fd; // 获取文件fd。
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_MetadataTemplate0101 start====");
          let result: number = avrecorder.OH_AVRecorder_MetadataTemplate0101(fileFd);
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_MetadataTemplate0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_MetadataTemplate0102
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_MetadataTemplate0102
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_MetadataTemplate0102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const context: Context = getContext(); // 参考应用文件访问与管理。
          let filePath: string = context.filesDir + '/example2.mp3';
          let audioFile: fs.File = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          let fileFd: number = audioFile.fd; // 获取文件fd。
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_MetadataTemplate0102 start====");
          let result: number = avrecorder.OH_AVRecorder_MetadataTemplate0101(fileFd);
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_MetadataTemplate0102 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_Metadata0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_Metadata0100
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_Metadata0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const context: Context = getContext(); // 参考应用文件访问与管理。
          let filePath: string = context.filesDir + '/example2.mp3';
          let audioFile: fs.File = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          let fileFd: number = audioFile.fd; // 获取文件fd。
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_Metadata0100 start====");
          let result: number = avrecorder.OH_AVRecorder_Metadata0100(fileFd);
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_Metadata0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_Metadata0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_Metadata0101
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_Metadata0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const context: Context = getContext(); // 参考应用文件访问与管理。
          let filePath: string = context.filesDir + '/example2.mp3';
          let audioFile: fs.File = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          let fileFd: number = audioFile.fd; // 获取文件fd。
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_Metadata0101 start====");
          let result: number = avrecorder.OH_AVRecorder_Metadata0100(fileFd);
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_Metadata0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_Metadata0102
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_Metadata0102
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_Metadata0102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const context: Context = getContext(); // 参考应用文件访问与管理。
          let filePath: string = context.filesDir + '/example2.mp3';
          let audioFile: fs.File = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          let fileFd: number = audioFile.fd; // 获取文件fd。
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_Metadata0102 start====");
          let result: number = avrecorder.OH_AVRecorder_Metadata0100(fileFd);
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_Metadata0102 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVRecorder_Config0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVRecorder_Config0100
     * @tc.desc       : test OH_AVRecorder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVRecorder_Config0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const context: Context = getContext(); // 参考应用文件访问与管理。
          let filePath: string = context.filesDir + '/example2.mp3';
          let audioFile: fs.File = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          let fileFd: number = audioFile.fd; // 获取文件fd。
          console.info("====>SUB_MULTIMEIDA_OH_AVRecorder_Config0100 start====");
          let result: number = avrecorder.OH_AVRecorder_Config0100(fileFd);
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVRecorder_Config0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

  })
}
