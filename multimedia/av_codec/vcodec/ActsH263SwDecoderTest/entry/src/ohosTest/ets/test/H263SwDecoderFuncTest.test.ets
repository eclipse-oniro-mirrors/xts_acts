/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import testNapi from 'libh263swdecoder_test.so';
import fs from '@ohos.file.fs';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

interface FileCopyInfo {
  raw: string;
  target: string;
}

function getContext(): Context {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let context = abilityDelegator.getAppContext();
  return context;
}

async function copyRawFileToSandbox(context: Context, rawFileName: string, targetPath: string): Promise<void> {
  return new Promise<void>((resolve, reject) => {
    context.resourceManager.getRawFileContent(rawFileName, (error, buffer) => {
      if (error) {
        console.error(`[copyRawFile] ${rawFileName} copy failed: ${error.code}, message: ${error.message}`);
        reject(error);
      } else {
        try {
          let file = fs.openSync(targetPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          fs.writeSync(file.fd, buffer.buffer);
          fs.closeSync(file);
          console.info(`[copyRawFile] ${rawFileName} copy success to ${targetPath}`);
          resolve();
        } catch (e) {
          console.error(`[copyRawFile] ${rawFileName} write failed: ${JSON.stringify(e)}`);
          reject(e);
        }
      }
    });
  });
}

export default function H263SwDecoderFuncTest() {
  describe('H263SwDecoderFunctionTest', () => {
    beforeAll(async () => {
      console.info('H263SwDecoderFunctionTest beforeAll called');
      
      try {
        let context = getContext();
        let filesDir = context.filesDir;
        let mediaDir = filesDir + '/media';
        
        // Create media directory if it doesn't exist
        try {
          if (!fs.accessSync(mediaDir)) {
            fs.mkdirSync(mediaDir);
            console.info(`Created directory: ${mediaDir}`);
          }
        } catch (e) {
          console.error(`Failed to create directory ${mediaDir}: ${JSON.stringify(e)}`);
        }
      
        const filesToCopy: FileCopyInfo[] = [
          { raw: 'profile0_level10_I_128x96.h263', target: mediaDir + '/profile0_level10_I_128x96.h263' },
          { raw: '20x20.h263', target: mediaDir + '/20x20.h263' }
        ];
      
        for (const file of filesToCopy) {
          try {
            await copyRawFileToSandbox(context, file.raw, file.target);
          } catch (e) {
            console.error(`Skip file ${file.raw}: not found in rawfile`);
          }
        }
      } catch (e) {
        console.error(`beforeAll error: ${JSON.stringify(e)}`);
      }
    });

    afterAll(() => {
      console.info('H263SwDecoderFunctionTest afterAll called');
    });

    beforeEach(() => {
      console.info('H263SwDecoderFunctionTest beforeEach called');
    });

    afterEach(() => {
      console.info('H263SwDecoderFunctionTest afterEach called');
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_SW263_FUNC_0010
     * @tc.number VIDEO_DECODE_SYNC_SW263_FUNC_0010
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_DECODE_SYNC_SW263_FUNC_0010', Level.LEVEL1, async () => {
      let result: number = testNapi.runFuncTest(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_SW263_FUNC_0020
     * @tc.number VIDEO_DECODE_SYNC_SW263_FUNC_0020
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VIDEO_DECODE_SYNC_SW263_FUNC_0020', Level.LEVEL0, async () => {
      let result: number = testNapi.runFuncTest(1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SYNC_SW263_FUNC_0040
     * @tc.number VIDEO_DECODE_SYNC_SW263_FUNC_0040
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VIDEO_DECODE_SYNC_SW263_FUNC_0040', Level.LEVEL1, async () => {
      let result: number = testNapi.runFuncTest(2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   VIDEO_DECODE_SW263_BLANK_FRAME_0010
     * @tc.number VIDEO_DECODE_SW263_BLANK_FRAME_0010
     * @tc.desc   function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('VIDEO_DECODE_SW263_BLANK_FRAME_0010', Level.LEVEL0, async () => {
      let result: number = testNapi.runFuncTest(3);
      expect(result).assertEqual(0);
    });

  });
}
