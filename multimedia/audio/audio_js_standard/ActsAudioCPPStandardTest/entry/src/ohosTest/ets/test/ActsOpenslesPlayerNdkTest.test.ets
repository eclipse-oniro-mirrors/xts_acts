import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import audio_cpp_standard_test from 'libaudio_cpp_standard_test.so';
import fs from '@ohos.file.fs';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

function getContext(): Context {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let context = abilityDelegator.getAppContext();
  return context;
}

export default function ActsOpenslesPlayerNdkTest() {
  describe('ActsOpenslesPlayerNdkTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      // 在所有测试开始前，从 rawfile 拷贝音频文件到应用目录
      let context = getContext();
      let dir = context.filesDir + "/";
      
      try {
        // 创建 audio 目录
        let audioDir = dir + "audio";
        if (!fs.accessSync(audioDir)) {
          fs.mkdirSync(audioDir);
          hilog.info(0x0000, 'testTag', 'Created audio directory: %{public}s', audioDir);
        }
        
        // 拷贝音频文件
        let audioFile1 = audioDir + "/S16LE_2_44100.pcm";
        let audioFile2 = audioDir + "/S16LE_2_64000.pcm";
        
        // 使用 Promise 包装并等待第一个文件拷贝完成
        await new Promise<void>((resolve, reject) => {
          context.resourceManager.getRawFileContent("S16LE_2_44100.pcm", (error, model_buffer) => {
            if (error) {
              hilog.error(0x0000, 'testTag', '[rawfile_copy_to_sandbox] S16LE_2_44100.pcm copy failed: %{public}d, message: %{public}s',
                error.code, error.message);
              reject(error);
            } else {
              let file = fs.openSync(audioFile1, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
              fs.writeSync(file.fd, model_buffer.buffer);
              fs.closeSync(file);
              hilog.info(0x0000, 'testTag', '[rawfile_copy_to_sandbox] S16LE_2_44100.pcm copy success');
              resolve();
            }
          });
        });
        
        // 使用 Promise 包装并等待第二个文件拷贝完成
        await new Promise<void>((resolve, reject) => {
          context.resourceManager.getRawFileContent("S16LE_2_64000.pcm", (error, model_buffer) => {
            if (error) {
              hilog.error(0x0000, 'testTag', '[rawfile_copy_to_sandbox] S16LE_2_64000.pcm copy failed: %{public}d, message: %{public}s',
                error.code, error.message);
              reject(error);
            } else {
              let file = fs.openSync(audioFile2, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
              fs.writeSync(file.fd, model_buffer.buffer);
              fs.closeSync(file);
              hilog.info(0x0000, 'testTag', '[rawfile_copy_to_sandbox] S16LE_2_64000.pcm copy success');
              resolve();
            }
          });
        });
        
        hilog.info(0x0000, 'testTag', '[rawfile_copy_to_sandbox] sandbox path: %{public}s', dir);
        hilog.info(0x0000, 'testTag', '[rawfile_copy_to_sandbox] Files ready, tests can start now');
      } catch (error) {
        hilog.error(0x0000, 'testTag', '[rawfile_copy_to_sandbox] getRawFileContent api run failed: %{public}s', JSON.stringify(error));
      }
    })
    beforeEach(() => {
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

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OPENSELES_PALYER_FUNCTION_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_OPENSELES_PALYER_FUNCTION_0100
     * @tc.desc   test opensles Play audio
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_OPENSELES_PALYER_FUNCTION_0100', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_MULTIMEDIA_AUDIO_OPENSELES_PALYER_FUNCTION_0100 begin');
      const result:number = audio_cpp_standard_test.openslesPlayerFunctionTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OPENSELES_PALYER_FUNCTION_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_OPENSELES_PALYER_FUNCTION_0200
     * @tc.desc   test opensles Play audio
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_OPENSELES_PALYER_FUNCTION_0200', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_MULTIMEDIA_AUDIO_OPENSELES_PALYER_FUNCTION_0200 begin');
      const result:number  = audio_cpp_standard_test.openslesPlayerFunctionTest(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0100
     * @tc.desc   test opensles invalid interfacce
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0100', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0100 begin');
      const result:number  = audio_cpp_standard_test.openslesEngineInvalidTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0200
     * @tc.desc   test opensles invalid interfacce
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0200', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0200 begin');
      const result:number  = audio_cpp_standard_test.openslesEngineInvalidTest(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0300
     * @tc.desc   test opensles invalid interfacce
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0300', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0300 begin');
      const result:number  = audio_cpp_standard_test.openslesEngineInvalidTest(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0400
     * @tc.desc   test opensles invalid interfacce
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0400', Level.LEVEL0, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_MULTIMEDIA_AUDIO_OPENSELES_ENGINEITF_INVALID_0400 begin');
      const result:number  = audio_cpp_standard_test.openslesEngineInvalidTest(3);
      expect(result).assertEqual(0);
    })
  })
}
