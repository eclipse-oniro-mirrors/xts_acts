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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import libavcode from 'libavcode.so'
import { BusinessError } from '@ohos.base';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';

const OS_ACCOUNT_ERR_OK = 0;

export default function AVCodeTest3() {
  describe('AVCodeTest3', () => {
    let sandboxMp4Path: string = '';
    // 定义应用上下文（提前获取，避免重复调用）
    let appContext: Context;
    beforeAll(async (done: Function) => {
      try {
        // 1. 获取应用上下文（关键：确保能访问资源和沙箱目录）
        appContext = getContext();
        if (!appContext) {
          throw new Error("获取应用上下文失败，无法访问资源和沙箱");
        }
        // 2. 定义资源路径和沙箱路径
        const rawMp4Path = 'test.mp4'; // src/main/resources/rawfile/test.mp4（base目录无需显式写）
        const sandboxDir = appContext.filesDir; // 应用沙箱根目录（如/data/storage/el2/base/haps/xxx/files）
        sandboxMp4Path = `${sandboxDir}/test.mp4`; // 沙箱中test.mp4的最终路径

        console.info(`[AVCodeTest3] 开始复制：资源路径=${rawMp4Path}，沙箱目标路径=${sandboxMp4Path}`);

        // 3. 读取raw资源中的test.mp4（用Promise封装异步回调，确保复制完成后再执行后续逻辑）
        const mp4Buffer = await new Promise<ArrayBuffer>((resolve, reject) => {
          appContext.resourceManager.getRawFileContent(rawMp4Path, (error: BusinessError, buffer: ArrayBuffer) => {
            if (error) {
              // 资源读取失败（常见原因：路径错误、文件不存在、资源未打包）
              const errMsg = `读取test.mp4失败：code=${error.code}，message=${error.message}`;
              console.error(`[AVCodeTest3] ${errMsg}`);
              reject(new Error(errMsg));
              return;
            }
            if (!buffer || buffer.byteLength === 0) {
              const errMsg = "读取的test.mp4内容为空（可能文件损坏）";
              console.error(`[AVCodeTest3] ${errMsg}`);
              reject(new Error(errMsg));
              return;
            }
            console.info(`[AVCodeTest3] 成功读取test.mp4，文件大小=${buffer.byteLength}字节`);
            resolve(buffer);
          });
        });

        // 4. 将读取到的文件写入沙箱（覆盖已存在文件，确保最新）
        // 打开文件：READ_WRITE=可读可写，CREATE=不存在则创建，TRUNCATE=存在则清空内容（避免旧内容残留）
        const file = fs.openSync(
          sandboxMp4Path,
          fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE
        );
        if (!file || file.fd === null) {
          throw new Error("打开沙箱文件失败，文件描述符无效");
        }

        // 写入文件内容（校验写入大小，确保完整）
        const writeSize = fs.writeSync(file.fd, mp4Buffer);
        if (writeSize !== mp4Buffer.byteLength) {
          throw new Error(`文件写入不完整：预期${mp4Buffer.byteLength}字节，实际${writeSize}字节`);
        }

        // 5. 关闭文件（避免资源泄漏）
        fs.closeSync(file);
        console.info(`[AVCodeTest3] test.mp4成功写入沙箱，路径=${sandboxMp4Path}`);

        // 6. 通知beforeAll执行完成（必须调用，否则测试用例会阻塞）
        done();

      } catch (error) {
        // 捕获全流程错误，确保测试框架能感知失败
        const errMsg = `[AVCodeTest3] beforeAll执行失败：${(error as Error).message}`;
        console.error(errMsg);
        done(error); // 传递错误，标记前置操作失败
      }
    });

    // beforeEach：在每个测试用例前执行，校验沙箱中test.mp4是否有效
    beforeEach(async () => {
      try {
        if (!appContext || !sandboxMp4Path) {
          throw new Error("应用上下文或沙箱路径未初始化，无法校验文件");
        }

        console.info(`[AVCodeTest3] 校验沙箱文件：${sandboxMp4Path}`);

        // 读取沙箱中test.mp4的状态（判断是否存在、是否为文件、大小是否合法）
        const fileStat = await fs.stat(sandboxMp4Path);
        if (fileStat.isFile() && fileStat.size > 0) {
          console.info(`[AVCodeTest3] test.mp4校验通过：存在，大小=${fileStat.size}字节`);
        } else {
          throw new Error(`test.mp4校验失败：非有效文件（大小=${fileStat.size}字节）`);
        }
      } catch (error) {
        // 校验失败时明确提示（便于定位问题）
        const err = error as BusinessError;
        const errMsg = `[AVCodeTest3] beforeEach校验失败：${err.message}，code=${err.code}`;
        console.error(errMsg);
      }
    });

    /**
     * @tc.name   testAVCodeOHAudioEncoderDestroy001
     * @tc.number SUB_AVCode_OH_AudioEncoderDestroy_001
     * @tc.desc   Verify that AVCodeOHAudioEncoderDestroySuccess function correctly handles successful audio encoder destruction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHAudioEncoderDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioEncoderDestroySuccess();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioEncoderDestroy001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHAudioEncoderDestroy002
     * @tc.number SUB_AVCode_OH_AudioEncoderDestroy_002
     * @tc.desc   Verify that AVCodeOHAudioEncoderDestroyInvalidVal function properly handles invalid parameters during encoder destruction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHAudioEncoderDestroy002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioEncoderDestroyInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioEncoderDestroy002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHAudioEncoderConfigure002
     * @tc.number SUB_AVCode_OH_AudioEncoderConfigure_002
     * @tc.desc   Verify that AVCodeOHAudioEncoderConfigureInvalidVal function validates invalid configuration parameters correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHAudioEncoderConfigure002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioEncoderConfigureInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioEncoderConfigure002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHAudioEncoderConfigure010
     * @tc.number SUB_AVCode_OH_AudioCodecConfigure_001
     * @tc.desc   Verify that AVCodeOHAudioEncoderConfigureUnsupport function handles unsupported configuration parameters properly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHAudioEncoderConfigure010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioEncoderConfigureUnsupport();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioEncoderConfigure010 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHAudioEncoderPrepare002
     * @tc.number SUB_AVCode_OH_AudioEncoderPrepare_002
     * @tc.desc   Verify that AVCodeOHAudioEncoderPrepareInvalidVal function validates invalid parameters during encoder preparation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHAudioEncoderPrepare002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioEncoderPrepareInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioEncoderPrepare002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHAudioEncoderPrepare010
     * @tc.number SUB_AVCode_OH_AudioEncoderPrepare_010
     * @tc.desc   Verify that AVCodeOHAudioEncoderConfigureUnsupport function handles unsupported configurations during encoder preparation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHAudioEncoderPrepare010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioEncoderConfigureUnsupport();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioEncoderPrepare010 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHAudioEncoderStart002
     * @tc.number SUB_AVCode_OH_AudioEncoderStart_002
     * @tc.desc   Verify that AVCodeOHAudioEncoderStartInvalidVal function validates invalid parameters during encoder startup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHAudioEncoderStart002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioEncoderStartInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioEncoderStart002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHAudioEncoderStart009
     * @tc.number SUB_AVCode_OH_AudioEncoderStart_009
     * @tc.desc   Verify that AVCodeOHAudioEncoderStartInvalidState function handles invalid states during encoder startup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHAudioEncoderStart009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioEncoderStartInvalidState();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioEncoderStart009 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHAudioEncoderStop002
     * @tc.number SUB_AVCode_OH_AudioEncoderStop_002
     * @tc.desc   Verify that AVCodeOHAudioEncoderStopInvalidState function handles invalid states during encoder stop operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHAudioEncoderStop002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioEncoderStopInvalidState();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioEncoderStop002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHAudioEncoderStop009
     * @tc.number SUB_AVCode_OH_AudioEncoderStop_009
     * @tc.desc   Verify that AVCodeOHAudioEncoderStopInvalidState function handles error conditions during encoder stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHAudioEncoderStop009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioEncoderStopInvalidState();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioEncoderStop009 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHAudioEncoderFlush002
     * @tc.number SUB_AVCode_OH_AudioEncoder_Flush_002
     * @tc.desc   Verify that AVCodeOHAudioEncoderFlushInvalidVal function validates invalid parameters during encoder flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHAudioEncoderFlush002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioEncoderFlushInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioEncoderFlush002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHAudioEncoderFlush009
     * @tc.number SUB_AVCode_OH_AudioEncoder_Flush_009
     * @tc.desc   Verify that AVCodeOHAudioEncoderFlushInvalidState function handles invalid states during encoder flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHAudioEncoderFlush009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioEncoderFlushInvalidState();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioEncoderFlush009 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHAudioEncoderReset002
     * @tc.number SUB_AVCode_OH_AudioEncoder_Reset_002
     * @tc.desc   Verify that AVCodeOHAudioEncoderResetInvalidVal function validates invalid parameters during encoder reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHAudioEncoderReset002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioEncoderResetInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioEncoderReset002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHAudioEncoderSetParameter002
     * @tc.number SUB_AVCode_OH_AudioEncoder_SetParameter_002
     * @tc.desc   Verify that AVCodeOHAudioEncoderSetParameterInvalidVal function validates invalid parameters during encoder parameter setting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHAudioEncoderSetParameter002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioEncoderSetParameterInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioEncoderSetParameter002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHAudioEncoderPushInputData002
     * @tc.number SUB_AVCode_OH_AudioEncoder_PushInputData_002
     * @tc.desc   Verify that AVCodeOHAudioEncoderPushInputDataInvalidVal function validates invalid input data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHAudioEncoderPushInputData002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioEncoderPushInputDataInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioEncoderPushInputData002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHAudioCodecSetParameter001
     * @tc.number SUB_AVCode_OH_AudioCodec_SetParameter_001
     * @tc.desc   Verify that AVCodeOHAudioCodecSetParameterInvalidVal function validates invalid codec parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHAudioCodecSetParameter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioCodecSetParameterInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioCodecSetParameter001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHAudioCodecSetParameter002
     * @tc.number SUB_AVCode_OH_AudioCodec_SetParameter_002
     * @tc.desc   Verify that AVCodeOHAudioCodecSetParameterOperateNotPermit function handles unauthorized parameter changes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHAudioCodecSetParameter002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioCodecSetParameterOperateNotPermit();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioCodecSetParameter002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHAudioCodecSetParameter003
     * @tc.number SUB_AVCode_OH_AudioCodec_SetParameter_003
     * @tc.desc   Verify that AVCodeOHAudioCodecSetParameterOperateInvalidState function handles parameter changes in invalid states
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHAudioCodecSetParameter003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioCodecSetParameterOperateInvalidState();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioCodecSetParameter003 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHAudioCodecPushInputBuffer002
     * @tc.number SUB_AVCode_OH_AudioCodec_PushInputBuffer_002
     * @tc.desc   Verify that AVCodeOHAudioCodecPushInputBufferInvalidVal function validates invalid input buffers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHAudioCodecPushInputBuffer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioCodecPushInputBufferInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioCodecPushInputBuffer002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHAACProfile001
     * @tc.number SUB_AVCode_OH_AACProfile_001
     * @tc.desc   Verify that EnumAACPROFILEHE function correctly enumerates AAC_PROFILE_HE_V2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHAACProfile001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAACPROFILEHE();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAACProfile001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHAACProfile002
     * @tc.number SUB_AVCode_OH_AACProfile_002
     * @tc.desc   Verify that EnumAACPROFILEHE function correctly enumerates AAC_PROFILE_HE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHAACProfile002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAACPROFILEHE1();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAACProfile002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHHEVCProfile001
     * @tc.number SUB_AVCode_OH_HEVCProfile_001
     * @tc.desc   Verify that EnumHEVCProfile1 function correctly enumerates HEVC_PROFILE_MAIN_STILL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHHEVCProfile001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumHEVCProfile1();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHHEVCProfile001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHHEVCProfile002
     * @tc.number SUB_AVCode_OH_HEVCProfile_002
     * @tc.desc   Verify that EnumAACPROFILEHE function correctly enumerates AAC_PROFILE_HE_V2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHHEVCProfile002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumHEVCProfile2();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHHEVCProfile002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHVVCProfile001
     * @tc.number SUB_AVCode_OH_VVCProfile_001
     * @tc.desc   Verify that EnumVVCProfile1 function correctly enumerates VVC_PROFILE_MAIN_10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHVVCProfile001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumVVCProfile1();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHVVCProfile001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHVVCProfile002
     * @tc.number SUB_AVCode_OH_VVCProfile_002
     * @tc.desc   Verify that EnumVVCProfile2 function correctly enumerates VVC_PROFILE_MAIN_12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHVVCProfile002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumVVCProfile2();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHVVCProfile002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHVVCProfile003
     * @tc.number SUB_AVCode_OH_VVCProfile_003
     * @tc.desc   Verify that EnumVVCProfile3 function correctly enumerates VVC_PROFILE_MAIN_12_INTRA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHVVCProfile003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumVVCProfile3();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHVVCProfile003 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHVVCProfile004
     * @tc.number SUB_AVCode_OH_VVCProfile_004
     * @tc.desc   Verify that EnumVVCProfile4 function correctly enumerates VVC_PROFILE_MULTI_MAIN_10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHVVCProfile004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumVVCProfile4();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHVVCProfile004 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHVVCProfile005
     * @tc.number SUB_AVCode_OH_VVCProfile_005
     * @tc.desc   Verify that EnumVVCProfile5 function correctly enumerates VVC_PROFILE_MAIN_10_444
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHVVCProfile005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumVVCProfile5();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHVVCProfile005 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHVVCProfile006
     * @tc.number SUB_AVCode_OH_VVCProfile_006
     * @tc.desc   Verify that EnumVVCProfile6 function correctly enumerates VVC_PROFILE_MAIN_12_444
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHVVCProfile006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumVVCProfile6();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHVVCProfile006 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHVVCProfile007
     * @tc.number SUB_AVCode_OH_VVCProfile_007
     * @tc.desc   Verify that EnumVVCProfile7 function correctly enumerates VVC_PROFILE_MAIN_16_444
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHVVCProfile007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumVVCProfile7();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHVVCProfile007 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHVVCProfile008
     * @tc.number SUB_AVCode_OH_VVCProfile_008
     * @tc.desc   Verify that EnumVVCProfile8 function correctly enumerates VVC_PROFILE_MAIN_12_444_INTRA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHVVCProfile008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumVVCProfile8();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHVVCProfile008 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHVVCProfile009
     * @tc.number SUB_AVCode_OH_VVCProfile_009
     * @tc.desc   Verify that EnumVVCProfile9 function correctly enumerates VVC_PROFILE_MAIN_16_444_INTRA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHVVCProfile009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumVVCProfile9();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHVVCProfile009 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHVVCProfile010
     * @tc.number SUB_AVCode_OH_VVCProfile_010
     * @tc.desc   Verify that EnumVVCProfile10 function correctly enumerates VVC_PROFILE_MULTI_MAIN_10_444
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHVVCProfile010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumVVCProfile10();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHVVCProfile010 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHVVCProfile011
     * @tc.number SUB_AVCode_OH_VVCProfile_011
     * @tc.desc   Verify that EnumVVCProfile11 function correctly enumerates VVC_PROFILE_MAIN_10_STILL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHVVCProfile011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumVVCProfile11();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHVVCProfile011 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHVVCProfile012
     * @tc.number SUB_AVCode_OH_VVCProfile_012
     * @tc.desc   Verify that EnumVVCProfile12 function correctly enumerates VVC_PROFILE_MAIN_12_STILL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHVVCProfile012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumVVCProfile12();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHVVCProfile012 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHVVCProfile013
     * @tc.number SUB_AVCode_OH_VVCProfile_013
     * @tc.desc   Verify that EnumVVCProfile13 function correctly enumerates VVC_PROFILE_MAIN_10_444_STILL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHVVCProfile013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumVVCProfile13();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHVVCProfile013 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHVVCProfile014
     * @tc.number SUB_AVCode_OH_VVCProfile_014
     * @tc.desc   Verify that EnumVVCProfile14 function correctly enumerates VVC_PROFILE_MAIN_12_444_STILL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHVVCProfile014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumVVCProfile14();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHVVCProfile014 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHVVCProfile015
     * @tc.number SUB_AVCode_OH_VVCProfile_015
     * @tc.desc   Verify that EnumVVCProfile15 function correctly enumerates VVC_PROFILE_MAIN_16_444_STILL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHVVCProfile015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumVVCProfile15();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHVVCProfile015 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHMPEG2Profile001
     * @tc.number SUB_AVCode_OH_MPEG2Profile_001
     * @tc.desc   Verify that EnumMPEGProfile1 function correctly enumerates MPEG2 profile 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHMPEG2Profile001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile1();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHMPEG2Profile002
     * @tc.number SUB_AVCode_OH_MPEG2Profile_002
     * @tc.desc   Verify that EnumMPEGProfile2 function correctly enumerates MPEG2 profile 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHMPEG2Profile002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile2();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHMPEG2Profile003
     * @tc.number SUB_AVCode_OH_MPEG2Profile_003
     * @tc.desc   Verify that EnumMPEGProfile3 function correctly enumerates MPEG2 profile 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHMPEG2Profile003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile3();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile003 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHMPEG2Profile004
     * @tc.number SUB_AVCode_OH_MPEG2Profile_004
     * @tc.desc   Verify that EnumMPEGProfile4 function correctly enumerates MPEG2 profile 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHMPEG2Profile004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile4();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile004 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHMPEG2Profile005
     * @tc.number SUB_AVCode_OH_MPEG2Profile_005
     * @tc.desc   Verify that EnumMPEGProfile5 function correctly enumerates MPEG2 profile 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHMPEG2Profile005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile5();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile005 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHMPEG2Profile006
     * @tc.number SUB_AVCode_OH_MPEG2Profile_006
     * @tc.desc   Verify that EnumMPEGProfile6 function correctly enumerates MPEG2 profile 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHMPEG2Profile006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile6();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile006 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHMPEG2Profile007
     * @tc.number SUB_AVCode_OH_MPEG2Profile_007
     * @tc.desc   Verify that EnumMPEGProfile7 function correctly enumerates MPEG2 profile 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHMPEG2Profile007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile7();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile007 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHMPEG2Profile008
     * @tc.number SUB_AVCode_OH_MPEG2Profile_008
     * @tc.desc   Verify that EnumMPEGProfile8 function correctly enumerates MPEG2 profile 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHMPEG2Profile008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile8();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile008 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHMPEG2Profile009
     * @tc.number SUB_AVCode_OH_MPEG2Profile_009
     * @tc.desc   Verify that EnumMPEGProfile9 function correctly enumerates MPEG2 profile 9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHMPEG2Profile009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile9();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile009 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHMPEG2Profile010
     * @tc.number SUB_AVCode_OH_MPEG2Profile_010
     * @tc.desc   Verify that EnumMPEGProfile10 function correctly enumerates MPEG2 profile 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHMPEG2Profile010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile10();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile010 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHMPEG2Profile011
     * @tc.number SUB_AVCode_OH_MPEG2Profile_011
     * @tc.desc   Verify that EnumMPEGProfile11 function correctly enumerates MPEG2 profile 11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHMPEG2Profile011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile11();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile011 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHMPEG2Profile012
     * @tc.number SUB_AVCode_OH_MPEG2Profile_012
     * @tc.desc   Verify that EnumMPEGProfile12 function correctly enumerates MPEG2 profile 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHMPEG2Profile012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile12();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile012 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHMPEG2Profile013
     * @tc.number SUB_AVCode_OH_MPEG2Profile_013
     * @tc.desc   Verify that EnumMPEGProfile13 function correctly enumerates MPEG2 profile 13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHMPEG2Profile013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile13();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile013 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHMPEG2Profile014
     * @tc.number SUB_AVCode_OH_MPEG2Profile_014
     * @tc.desc   Verify that EnumMPEGProfile14 function correctly enumerates MPEG2 profile 14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHMPEG2Profile014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile14();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile014 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHMPEG2Profile015
     * @tc.number SUB_AVCode_OH_MPEG2Profile_015
     * @tc.desc   Verify that EnumMPEGProfile15 function correctly enumerates MPEG2 profile 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHMPEG2Profile015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile15();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile015 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHMPEG2Profile016
     * @tc.number SUB_AVCode_OH_MPEG2Profile_016
     * @tc.desc   Verify that EnumMPEGProfile16 function correctly enumerates MPEG2 profile 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHMPEG2Profile016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile16();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile016 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHMPEG2Profile017
     * @tc.number SUB_AVCode_OH_MPEG2Profile_017
     * @tc.desc   Verify that EnumMPEGProfile17 function correctly enumerates MPEG2 profile 17
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHMPEG2Profile017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile17();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile017 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHMPEG2Profile018
     * @tc.number SUB_AVCode_OH_MPEG2Profile_018
     * @tc.desc   Verify that EnumMPEGProfile18 function correctly enumerates MPEG2 profile 18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHMPEG2Profile018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile18();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile018 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHMPEG2Profile019
     * @tc.number SUB_AVCode_OH_MPEG2Profile_019
     * @tc.desc   Verify that EnumMPEGProfile19 function correctly enumerates MPEG2 profile 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHMPEG2Profile019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile19();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile019 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHMPEG2Profile020
     * @tc.number SUB_AVCode_OH_MPEG2Profile_020
     * @tc.desc   Verify that EnumMPEGProfile20 function correctly enumerates MPEG2 profile 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHMPEG2Profile020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile20();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile020 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHMPEG2Profile021
     * @tc.number SUB_AVCode_OH_MPEG2Profile_021
     * @tc.desc   Verify that EnumMPEGProfile21 function correctly enumerates MPEG2 profile 21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHMPEG2Profile021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumMPEGProfile21();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMPEG2Profile021 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHH263Profile001
     * @tc.number SUB_AVCode_OH_H263Profile_001
     * @tc.desc   Verify that EnumOHH263Profile1 function correctly enumerates MPEG2 profile 21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHH263Profile001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHH263Profile1();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHH263Profile001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHH263Profile002
     * @tc.number SUB_AVCode_OH_H263Profile_002
     * @tc.desc   Verify that EnumMPEGProfile21 function correctly enumerates MPEG2 profile 21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHH263Profile002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHH263Profile2();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHH263Profile002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHAVOutputFormat001
     * @tc.number SUB_AVCode_OH_AVOutputFormat_001
     * @tc.desc   Verify that EnumOHAVOutputFormat1 function correctly enumerates AV output format 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHAVOutputFormat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAVOutputFormat1();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAVOutputFormat001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHAVOutputFormat002
     * @tc.number SUB_AVCode_OH_AVOutputFormat_002
     * @tc.desc   Verify that EnumOHAVOutputFormat2 function correctly enumerates AV output format 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHAVOutputFormat002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAVOutputFormat2();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAVOutputFormat002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHAVOutputFormat003
     * @tc.number SUB_AVCode_OH_AVOutputFormat_003
     * @tc.desc   Verify that EnumOHAVOutputFormat3 function correctly enumerates AV output format 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHAVOutputFormat003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAVOutputFormat3();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAVOutputFormat003 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHAVOutputFormat004
     * @tc.number SUB_AVCode_OH_AVOutputFormat_004
     * @tc.desc   Verify that EnumOHAVOutputFormat4 function correctly enumerates AV output format 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHAVOutputFormat004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAVOutputFormat4();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAVOutputFormat004 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHAVOutputFormat005
     * @tc.number SUB_AVCode_OH_AVOutputFormat_005
     * @tc.desc   Verify that EnumOHAVOutputFormat5 function correctly enumerates AV output format 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHAVOutputFormat005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAVOutputFormat5();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAVOutputFormat005 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHAVOutputFormat006
     * @tc.number SUB_AVCode_OH_AVOutputFormat_006
     * @tc.desc   Verify that EnumOHAVOutputFormat6 function correctly enumerates AV output format 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHAVOutputFormat006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAVOutputFormat6();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAVOutputFormat006 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });
      
    /**
     * @tc.name   testAVCodeOHAVOutputFormat007
     * @tc.number SUB_AVCode_OH_AVOutputFormat_007
     * @tc.desc   Verify that EnumOHAVOutputFormat7 function correctly enumerates AV output format 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHAVOutputFormat007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAVOutputFormat7();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAVOutputFormat007 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeColorPrimary001
     * @tc.number SUB_AVCode_COLOR_PRIMARY_001
     * @tc.desc   Verify that EnumOHAVColorPrimary1 function correctly enumerates OH_ColorPrimary 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeColorPrimary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAVColorPrimary1();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeColorPrimary001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeColorPrimary002
     * @tc.number SUB_AVCode_COLOR_PRIMARY_002
     * @tc.desc   Verify that EnumOHAVColorPrimary2 function correctly enumerates OH_ColorPrimary 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeColorPrimary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAVColorPrimary2();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeColorPrimary002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeColorPrimary003
     * @tc.number SUB_AVCode_COLOR_PRIMARY_003
     * @tc.desc   Verify that EnumOHAVColorPrimary3 function correctly enumerates OH_ColorPrimary 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeColorPrimary003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAVColorPrimary3();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeColorPrimary003 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeColorPrimary004
     * @tc.number SUB_AVCode_COLOR_PRIMARY_004
     * @tc.desc   Verify that EnumOHAVColorPrimary4 function correctly enumerates OH_ColorPrimary 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeColorPrimary004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAVColorPrimary4();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeColorPrimary004 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeColorPrimary005
     * @tc.number SUB_AVCode_COLOR_PRIMARY_005
     * @tc.desc   Verify that EnumOHAVColorPrimary5 function correctly enumerates OH_ColorPrimary 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeColorPrimary005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAVColorPrimary5();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeColorPrimary005 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeColorPrimary006
     * @tc.number SUB_AVCode_COLOR_PRIMARY_006
     * @tc.desc   Verify that EnumOHAVColorPrimary6 function correctly enumerates OH_ColorPrimary 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeColorPrimary006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAVColorPrimary6();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeColorPrimary006 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeColorPrimary007
     * @tc.number SUB_AVCode_COLOR_PRIMARY_007
     * @tc.desc   Verify that EnumOHAVColorPrimary7 function correctly enumerates OH_ColorPrimary 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeColorPrimary007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAVColorPrimary7();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeColorPrimary007 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeColorPrimary008
     * @tc.number SUB_AVCode_COLOR_PRIMARY_008
     * @tc.desc   Verify that EnumOHAVColorPrimary8 function correctly enumerates OH_ColorPrimary 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeColorPrimary008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAVColorPrimary8();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeColorPrimary008 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHTransferCharacteristic001
     * @tc.number SUB_AVCode_OH_TransferCharacteristic_001
     * @tc.desc   Verify that EnumOHTransferCharacteristic1 function correctly enumerates OH_TransferCharacteristic 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHTransferCharacteristic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHTransferCharacteristic1();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHTransferCharacteristic001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHTransferCharacteristic002
     * @tc.number SUB_AVCode_OH_TransferCharacteristic_002
     * @tc.desc   Verify that EnumOHTransferCharacteristic2 function correctly enumerates OH_TransferCharacteristic 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHTransferCharacteristic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHTransferCharacteristic2();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHTransferCharacteristic002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHTransferCharacteristic003
     * @tc.number SUB_AVCode_OH_TransferCharacteristic_003
     * @tc.desc   Verify that EnumOHTransferCharacteristic3 function correctly enumerates OH_TransferCharacteristic 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHTransferCharacteristic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHTransferCharacteristic3();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHTransferCharacteristic003 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHTransferCharacteristic004
     * @tc.number SUB_AVCode_OH_TransferCharacteristic_004
     * @tc.desc   Verify that EnumOHTransferCharacteristic4 function correctly enumerates OH_TransferCharacteristic 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHTransferCharacteristic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHTransferCharacteristic4();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHTransferCharacteristic004 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHTransferCharacteristic005
     * @tc.number SUB_AVCode_OH_TransferCharacteristic_005
     * @tc.desc   Verify that EnumOHTransferCharacteristic5 function correctly enumerates OH_TransferCharacteristic 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHTransferCharacteristic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHTransferCharacteristic5();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHTransferCharacteristic005 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHTransferCharacteristic006
     * @tc.number SUB_AVCode_OH_TransferCharacteristic_006
     * @tc.desc   Verify that EnumOHTransferCharacteristic6 function correctly enumerates OH_TransferCharacteristic 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHTransferCharacteristic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHTransferCharacteristic6();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHTransferCharacteristic006 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHTransferCharacteristic007
     * @tc.number SUB_AVCode_OH_TransferCharacteristic_007
     * @tc.desc   Verify that EnumOHTransferCharacteristic7 function correctly enumerates OH_TransferCharacteristic 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHTransferCharacteristic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHTransferCharacteristic7();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHTransferCharacteristic007 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHTransferCharacteristic008
     * @tc.number SUB_AVCode_OH_TransferCharacteristic_008
     * @tc.desc   Verify that EnumOHTransferCharacteristic8 function correctly enumerates OH_TransferCharacteristic 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHTransferCharacteristic008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHTransferCharacteristic8();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHTransferCharacteristic008 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHTransferCharacteristic009
     * @tc.number SUB_AVCode_OH_TransferCharacteristic_009
     * @tc.desc   Verify that EnumOHTransferCharacteristic9 function correctly enumerates OH_TransferCharacteristic 9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHTransferCharacteristic009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHTransferCharacteristic9();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHTransferCharacteristic009 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHTransferCharacteristic010
     * @tc.number SUB_AVCode_OH_TransferCharacteristic_010
     * @tc.desc   Verify that EnumOHTransferCharacteristic10 function correctly enumerates OH_TransferCharacteristic 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHTransferCharacteristic010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHTransferCharacteristic10();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHTransferCharacteristic010 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHTransferCharacteristic011
     * @tc.number SUB_AVCode_OH_TransferCharacteristic_011
     * @tc.desc   Verify that EnumOHTransferCharacteristic11 function correctly enumerates OH_TransferCharacteristic 11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHTransferCharacteristic011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHTransferCharacteristic11();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHTransferCharacteristic011 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHTransferCharacteristic012
     * @tc.number SUB_AVCode_OH_TransferCharacteristic_012
     * @tc.desc   Verify that EnumOHTransferCharacteristic12 function correctly enumerates OH_TransferCharacteristic 12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHTransferCharacteristic012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHTransferCharacteristic12();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHTransferCharacteristic012 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHTransferCharacteristic013
     * @tc.number SUB_AVCode_OH_TransferCharacteristic_013
     * @tc.desc   Verify that EnumOHTransferCharacteristic13 function correctly enumerates OH_TransferCharacteristic 13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHTransferCharacteristic013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHTransferCharacteristic13();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHTransferCharacteristic013 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHMatrixCoefficient001
     * @tc.number SUB_AVCode_OH_MatrixCoefficient_001
     * @tc.desc   Verify that EnumOHMatrixCoefficient1 function correctly enumerates OH_MatrixCoefficient 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHMatrixCoefficient001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHMatrixCoefficient1();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMatrixCoefficient001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHMatrixCoefficient002
     * @tc.number SUB_AVCode_OH_MatrixCoefficient_002
     * @tc.desc   Verify that EnumOHMatrixCoefficient2 function correctly enumerates OH_MatrixCoefficient 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHMatrixCoefficient002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHMatrixCoefficient2();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMatrixCoefficient002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHMatrixCoefficient003
     * @tc.number SUB_AVCode_OH_MatrixCoefficient_003
     * @tc.desc   Verify that EnumOHMatrixCoefficient3 function correctly enumerates OH_MatrixCoefficient 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHMatrixCoefficient003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHMatrixCoefficient3();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMatrixCoefficient003 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHMatrixCoefficient004
     * @tc.number SUB_AVCode_OH_MatrixCoefficient_004
     * @tc.desc   Verify that EnumOHMatrixCoefficient4 function correctly enumerates OH_MatrixCoefficient 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHMatrixCoefficient004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHMatrixCoefficient4();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMatrixCoefficient004 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHMatrixCoefficient005
     * @tc.number SUB_AVCode_OH_MatrixCoefficient_005
     * @tc.desc   Verify that EnumOHMatrixCoefficient5 function correctly enumerates OH_MatrixCoefficient 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHMatrixCoefficient005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHMatrixCoefficient5();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMatrixCoefficient005 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHMatrixCoefficient006
     * @tc.number SUB_AVCode_OH_MatrixCoefficient_006
     * @tc.desc   Verify that EnumOHMatrixCoefficient6 function correctly enumerates OH_MatrixCoefficient 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHMatrixCoefficient006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHMatrixCoefficient6();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMatrixCoefficient006 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHMatrixCoefficient007
     * @tc.number SUB_AVCode_OH_MatrixCoefficient_007
     * @tc.desc   Verify that EnumOHMatrixCoefficient7 function correctly enumerates OH_MatrixCoefficient 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHMatrixCoefficient007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHMatrixCoefficient7();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMatrixCoefficient007 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHMatrixCoefficient008
     * @tc.number SUB_AVCode_OH_MatrixCoefficient_008
     * @tc.desc   Verify that EnumOHMatrixCoefficient8 function correctly enumerates OH_MatrixCoefficient 8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHMatrixCoefficient008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHMatrixCoefficient8();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMatrixCoefficient008 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHMatrixCoefficient009
     * @tc.number SUB_AVCode_OH_MatrixCoefficient_009
     * @tc.desc   Verify that EnumOHMatrixCoefficient9 function correctly enumerates OH_MatrixCoefficient 9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHMatrixCoefficient009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHMatrixCoefficient9();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMatrixCoefficient009 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHMatrixCoefficient010
     * @tc.number SUB_AVCode_OH_MatrixCoefficient_010
     * @tc.desc   Verify that EnumOHMatrixCoefficient10 function correctly enumerates OH_MatrixCoefficient 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHMatrixCoefficient010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHMatrixCoefficient10();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHMatrixCoefficient010 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHBitsPerSample001
     * @tc.number SUB_AVCode_OH_BitsPerSample_001
     * @tc.desc   Verify that EnumOHBitsPerSample1 function correctly enumerates OH_BitsPerSample 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHBitsPerSample001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHBitsPerSample1();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHBitsPerSample001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHBitsPerSample002
     * @tc.number SUB_AVCode_OH_BitsPerSample_002
     * @tc.desc   Verify that EnumOHBitsPerSample2 function correctly enumerates OH_BitsPerSample 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHBitsPerSample002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHBitsPerSample2();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHBitsPerSample002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHBitsPerSample003
     * @tc.number SUB_AVCode_OH_BitsPerSample_003
     * @tc.desc   Verify that EnumOHBitsPerSample3 function correctly enumerates OH_BitsPerSample 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHBitsPerSample003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHBitsPerSample3();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHBitsPerSample003 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHBitsPerSample004
     * @tc.number SUB_AVCode_OH_BitsPerSample_004
     * @tc.desc   Verify that EnumOHBitsPerSample4 function correctly enumerates OH_BitsPerSample 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHBitsPerSample004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHBitsPerSample4();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHBitsPerSample004 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHBitsPerSample005
     * @tc.number SUB_AVCode_OH_BitsPerSample_005
     * @tc.desc   Verify that EnumOHBitsPerSample5 function correctly enumerates OH_BitsPerSample 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHBitsPerSample005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHBitsPerSample5();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHBitsPerSample005 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHBitsPerSample006
     * @tc.number SUB_AVCode_OH_BitsPerSample_006
     * @tc.desc   Verify that EnumOHBitsPerSample6 function correctly enumerates OH_BitsPerSample 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHBitsPerSample006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHBitsPerSample6();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHBitsPerSample006 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHBitsPerSample007
     * @tc.number SUB_AVCode_OH_BitsPerSample_007
     * @tc.desc   Verify that EnumOHBitsPerSample7 function correctly enumerates OH_BitsPerSample 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHBitsPerSample007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHBitsPerSample7();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHBitsPerSample007 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHCoreHdrType001
     * @tc.number SUB_AVCode_OH_Core_HdrType_001
     * @tc.desc   Verify that EnumOHCoreHdrType1 function correctly enumerates OH_CORE_HDR_TYPE_NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHCoreHdrType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHCoreHdrType1();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHCoreHdrType001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHCoreHdrType002
     * @tc.number SUB_AVCode_OH_Core_HdrType_002
     * @tc.desc   Verify that EnumOHCoreHdrType2 function correctly enumerates OH_CORE_HDR_TYPE_VIVID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHCoreHdrType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHCoreHdrType2();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHCoreHdrType002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHAVDataSource001
     * @tc.number SUB_AVCode_OH_AVDataSource_001
     * @tc.desc   Verify that EnumOHCoreHdrType2 function correctly OH_AVDataSource size readAt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHAVDataSource001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAVDataSource();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAVDataSource001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHScalingMode001
     * @tc.number SUB_AVCode_OH_ScalingMode_001
     * @tc.desc   Verify that EnumOHScalingMode1 function correctly enumerates SCALING_MODE_SCALE_TO_WINDOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHScalingMode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHScalingMode1();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHScalingMode001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCodeOHScalingMode002
     * @tc.number SUB_AVCode_OH_ScalingMode_002
     * @tc.desc   Verify that EnumOHScalingMode2 function correctly enumerates SCALING_MODE_SCALE_CROP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCodeOHScalingMode002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHScalingMode2();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHScalingMode002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });
  })
}
