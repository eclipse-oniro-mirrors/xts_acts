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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libQosManagerOps from 'libqosmanagerops.so';
import Utils, { Log } from './Utils.test';
import fs from '@ohos.file.fs';
import util from '@ohos.util';

// Define config interface for api_config.json
interface TokenizerConfig {
  model_path: string;
}

interface ApiConfig {
  tokenizer: TokenizerConfig;
  params_path: string;
}

const fileArr = [
  "Qwen2.5-0.5B-CPU-Q4/api_config.json",
  "Qwen2.5-0.5B-CPU-Q4/params",
  "Qwen2.5-0.5B-CPU-Q4/tokenizer.json"
]

const MODEL_DIR = "Qwen2.5-0.5B-CPU-Q4"

export default function QosCapiTest() {
  describe('QosCapiTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      let context = getContext()
      
      // Create model directory
      const modelDirPath = context.filesDir + "/" + MODEL_DIR
      Utils.createDirSync(modelDirPath)
      
      // Copy files using Promise.all to wait for all files to complete
      const copyPromises = fileArr.map(rawfilePath => {
        const fileName = rawfilePath.split('/').pop();
        const targetFilePath = modelDirPath + "/" + fileName;
        return Utils.copyRawfileToFilesDirAsync(rawfilePath, targetFilePath, context);
      });
      
      try {
        await Promise.all(copyPromises);
        Log.info(`[rawfile_copy_to_sandbox] All files copied successfully`);
        Log.info(`[rawfile_copy_to_sandbox] sandbox path: ${context.filesDir}/`);
        Log.info(`[rawfile_copy_to_sandbox] model path: ${modelDirPath}/`);
      } catch (error) {
        Log.error(`[rawfile_copy_to_sandbox] Copy failed: ${error}`);
        return; // 如果拷贝失败，提前返回
      }
      
      // NOW it's safe to update api_config.json
      const configPath = modelDirPath + "/api_config.json";
      try {
        // Read config file
        let file = fs.openSync(configPath, fs.OpenMode.READ_WRITE);
        let stat = fs.statSync(configPath);
        let buffer = new ArrayBuffer(stat.size);
        fs.readSync(file.fd, buffer);
        fs.closeSync(file);
        
        // Parse JSON using TextDecoder
        let decoder = util.TextDecoder.create('utf-8');
        let uint8Array = new Uint8Array(buffer);
        let configStr = decoder.decodeWithStream(uint8Array, { stream: false });
        let config = JSON.parse(configStr) as ApiConfig;
        
        // Update paths to sandbox paths
        config.tokenizer.model_path = modelDirPath + "/tokenizer.json";
        config.params_path = modelDirPath + "/params";
        
        // Write back config file
        let updatedConfig = JSON.stringify(config, null, 2);
        let writeFile = fs.openSync(configPath, fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(writeFile.fd, updatedConfig);
        fs.closeSync(writeFile);
        
        Log.info(`[api_config_update] Updated tokenizer path: ${config.tokenizer.model_path}`);
        Log.info(`[api_config_update] Updated params path: ${config.params_path}`);
      } catch (error) {
        Log.error(`[api_config_update] Failed to update config: ${error.message}`);
      }
      
      await Utils.sleep(500)
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      let context = getContext()
      for (let i = 0; i < fileArr.length; i++) {
        const rawfilePath = fileArr[i];  // e.g., "Qwen2.5-0.5B-CPU-Q4/api_config.json"
        const fileName = rawfilePath.split('/').pop();  // Extract filename: "api_config.json"
        const filePathInModel = MODEL_DIR + "/" + fileName;
        if (Utils.fileCheckSync(filePathInModel, context)) {
          Log.info(`QosCapiTest ${filePathInModel} file exists`);
        } else {
          Log.info(`QosCapiTest ${filePathInModel} file does not exists!`);
        }
      }
      await Utils.sleep(1000)
    })
    afterEach(async () => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      await Utils.sleep(1000)
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   SetThreadQoSNdkTest
     * @tc.number SetThreadQoSNdkTest
     * @tc.desc   Verify the Set QoSLevel function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetThreadQoSNdkTest', Level.LEVEL1, () => {
      const result = libQosManagerOps.ThreadQoSTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   ResetThreadQoSNdkTest
     * @tc.number ResetThreadQoSNdkTest
     * @tc.desc   Verify the Reset QoSLevel function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ResetThreadQoSNdkTest', Level.LEVEL1, () => {
      const result = libQosManagerOps.ThreadQoSTest(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   GetThreadQoSNdkTest
     * @tc.number GetThreadQoSNdkTest
     * @tc.desc   Verify the Get QoSLevel function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GetThreadQoSNdkTest', Level.LEVEL1, () => {
      const result = libQosManagerOps.ThreadQoSTest(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   ThreadQoSNdkTest
     * @tc.number ThreadQoSNdkTest
     * @tc.desc   Double Test ThreadQoSNDKTest function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ThreadQoSNdkTest', Level.LEVEL1, () => {
      const result = libQosManagerOps.ThreadQoSTest(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   GewuCreateSessionTest
     * @tc.number SUB_RESOURCESCHEDULE_QOS_0100
     * @tc.desc   Verify the GewuCreateSession function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GewuCreateSessionTest', Level.LEVEL1, () => {
      const result = libQosManagerOps.GewuApiTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   GewuSubmitRequestTest
     * @tc.number SUB_RESOURCESCHEDULE_QOS_0200
     * @tc.desc   Verify the GewuSubmitRequest function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GewuSubmitRequestTest', Level.LEVEL1, () => {
      const result = libQosManagerOps.GewuApiTest(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   GewuAbortRequestTest
     * @tc.number SUB_RESOURCESCHEDULE_QOS_0300
     * @tc.desc   Verify the GewuAbortRequest function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GewuAbortRequestTest', Level.LEVEL1, () => {
      const result = libQosManagerOps.GewuApiTest(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   GewuDestroySessionTest
     * @tc.number SUB_RESOURCESCHEDULE_QOS_0400
     * @tc.desc   Verify the GewuDestroySession function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GewuDestroySessionTest', Level.LEVEL1, () => {
      const result = libQosManagerOps.GewuApiTest(3);
      expect(result).assertEqual(0);
    })
4
    /**
     * @tc.name   GewuErrorCodeTest
     * @tc.number SUB_RESOURCESCHEDULE_QOS_0500
     * @tc.desc   Verify the Gewu error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GewuErrorCodeTest', Level.LEVEL1, () => {
      const result = libQosManagerOps.GewuApiTest(4);
      expect(result).assertEqual(0);
    })
  })
}

