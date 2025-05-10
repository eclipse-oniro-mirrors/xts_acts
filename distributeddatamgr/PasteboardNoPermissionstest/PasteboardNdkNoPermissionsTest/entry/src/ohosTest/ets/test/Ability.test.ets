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

import testndk from 'libentry.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import batteryInfo from '@ohos.batteryInfo';
import collections from '@arkts.collections';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { fileIo as fs} from '@kit.CoreFileKit';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
let BASE_PATH: string = context.filesDir;
let str_line = 'a'.repeat(1024*1024*2);

let TAG = '[testLog-ets]';
export default function pasteboardTestNdkTest() {
  describe('pasteboardTestNdkTest', async (done: Function) => {

    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0100
     * @tc.name OH_Pasteboard_GetMimeTypes0100
     * @tc.desc OH_PasteboardObserver_Create test
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */

    it('OH_Pasteboard_GetMimeTypes0100', 0, async (done: Function) => {
      let data = testndk.OH_Pasteboard_GetMimeTypes0100();
      console.info(TAG + "OH_Pasteboard_GetMimeTypes0100 data = " + data);
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0200
     * @tc.name OH_Pasteboard_GetMimeTypes0200
     * @tc.desc OH_PasteboardObserver_Create test
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */

    it('OH_Pasteboard_GetMimeTypes0200', 0, async (done: Function) => {
      let data = testndk.OH_Pasteboard_GetMimeTypes0200();
      console.info(TAG + "OH_Pasteboard_GetMimeTypes0200 data = " + data);
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0300
     * @tc.name OH_Pasteboard_GetMimeTypes0300
     * @tc.desc OH_PasteboardObserver_Create test
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */

    it('OH_Pasteboard_GetMimeTypes0300', 0, async (done: Function) => {
      let data = testndk.OH_Pasteboard_GetMimeTypes0300();
      console.info(TAG + "OH_Pasteboard_GetMimeTypes0300 data = " + data);
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0400
     * @tc.name OH_Pasteboard_GetDataWithNoProgress001
     * @tc.desc OH_Pasteboard_GetDataWithNoProgress test
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('OH_Pasteboard_GetDataWithNoProgress001', 0, async (done: Function) => {
      let fileFullName = BASE_PATH +'/dstFile.txt';
      let dirPath = BASE_PATH+"/haps";
      fs.mkdirSync(dirPath)
      console.info(TAG + "fileFullName fileFullName = " + fileFullName);
      console.info(TAG + "fileFullName fileFullName = " + dirPath);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd,"write strings to " + str_line +"\n");
      fs.closeSync(file);
      let data = testndk.OH_Pasteboard_GetDataWithNoProgress001();
      console.info(TAG + "OH_Pasteboard_GetDataWithNoProgress001 data = " + data );
      fs.rmdirSync(dirPath);
      expect(data).assertEqual(0);
      done();
    });

  })
}