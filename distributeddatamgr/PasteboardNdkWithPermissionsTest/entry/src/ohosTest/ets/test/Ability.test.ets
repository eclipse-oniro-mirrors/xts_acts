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
import hilog from '@ohos.hilog';
import testndk from 'libentry.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import batteryInfo from '@ohos.batteryInfo';
import collections from '@arkts.collections';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { fileIo as fs} from '@kit.CoreFileKit'

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
let BASE_PATH: string = context.filesDir;
let str_line = 'a'.repeat(1024*1024*2);


let TAG = '[testLog-ets]';
export default function pasteboardTestNdkPermissionTest() {
  describe('pasteboardTestNdkPermissionTest', async (done: Function) => {
    beforeEach( async()=>{
     
    })
    afterEach(()=>{

    })

    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0200
     * @tc.name OH_Pasteboard_GetDataWithOH_Pasteboard_GetDataWithProgress001Progress017
     * @tc.desc OH_PasteboardObserver_Create test
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */

    it('OH_Pasteboard_GetDataWithProgress001', 0, async (done: Function) => {
      let fileFullName = BASE_PATH +'/dstFile.txt';
      let dirPath = BASE_PATH+"/haps";
      fs.mkdirSync(dirPath)
      console.info(TAG + "fileFullName fileFullName = " + fileFullName);
      console.info(TAG + "fileFullName fileFullName = " + dirPath);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd,"write strings to " + str_line +"\n");
      fs.closeSync(file);
      let data = testndk.OH_Pasteboard_GetDataWithProgress001();
      console.info(TAG + "OH_Pasteboard_GetDataWithProgress001 data = " + data );
      fs.rmdirSync(dirPath);
      expect(data).assertEqual(0);
      done();
    });
    
    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0200
     * @tc.name OH_Pasteboard_GetDataWithProgress017
     * @tc.desc OH_PasteboardObserver_Create test
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */

    it('OH_Pasteboard_GetDataWithProgress002', 0, async (done: Function) => {
      let fileFullName = BASE_PATH +'/dstFile.txt';
      let dirPath = BASE_PATH+"/haps";
      fs.mkdirSync(dirPath)
      let dirPath1 = dirPath+"/daily";
      fs.mkdirSync(dirPath1)
      console.info(TAG + "fileFullName fileFullName = " + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd,"write strings to " + str_line +"\n");
      fs.closeSync(file);
      let data = testndk.OH_Pasteboard_GetDataWithProgress002();
      console.info(TAG + "OH_Pasteboard_GetDataWithProgress002 data = " + data );
      fs.rmdirSync(dirPath1);
      fs.rmdirSync(dirPath);
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0200
     * @tc.name OH_Pasteboard_GetDataWithProgress017
     * @tc.desc OH_PasteboardObserver_Create test
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */

    it('OH_Pasteboard_GetDataWithProgress003', 0, async (done: Function) => {
      let data = testndk.OH_Pasteboard_GetDataWithProgress003();
      console.info(TAG + "OH_Pasteboard_GetDataWithProgress003 data = " + data );
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0200
     * @tc.name OH_Pasteboard_GetDataWithProgress017
     * @tc.desc OH_PasteboardObserver_Create test
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */

    it('OH_Pasteboard_GetDataWithProgress004', 0, async (done: Function) => {
      let fileFullName = BASE_PATH +'/dstFile.txt';
      let dirPath = BASE_PATH+"/文件";
      fs.mkdirSync(dirPath)
      console.info(TAG + "fileFullName fileFullName = " + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd,"write strings to " + str_line +"\n");
      fs.closeSync(file);
      let data = testndk.OH_Pasteboard_GetDataWithProgress004();
      console.info(TAG + "OH_Pasteboard_GetDataWithProgress004 data = " + data );
      fs.rmdirSync(dirPath);
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0200
     * @tc.name OH_Pasteboard_GetDataWithProgress017
     * @tc.desc OH_PasteboardObserver_Create test
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */

    it('OH_Pasteboard_GetDataWithProgress005', 0, async (done: Function) => {
      let fileFullName = BASE_PATH +'/dstFile.txt';
      let dirPath = BASE_PATH+"/haps1122";
      fs.mkdirSync(dirPath)
      console.info(TAG + "fileFullName fileFullName = " + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd,"write strings to " + str_line +"\n");
      fs.closeSync(file);
      let data = testndk.OH_Pasteboard_GetDataWithProgress005();
      console.info(TAG + "OH_Pasteboard_GetDataWithProgress005 data = " + data );
      fs.rmdirSync(dirPath);
      expect(data).assertEqual(0);
      done();
    });

    
    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0200
     * @tc.name OH_Pasteboard_GetDataWithProgress017
     * @tc.desc OH_PasteboardObserver_Create test
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */

    it('OH_Pasteboard_GetDataWithProgress006', 0, async (done: Function) => {
      let fileFullName = BASE_PATH +'/dstFile.txt';
      let dirPath = BASE_PATH+"/haps_day";
      fs.mkdirSync(dirPath)
      console.info(TAG + "fileFullName fileFullName = " + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd,"write strings to " + str_line +"\n");
      fs.closeSync(file);
      let data = testndk.OH_Pasteboard_GetDataWithProgress006();
      console.info(TAG + "OH_Pasteboard_GetDataWithProgress006 data = " + data );
      fs.rmdirSync(dirPath);
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0200
     * @tc.name OH_Pasteboard_GetDataWithProgress017
     * @tc.desc OH_PasteboardObserver_Create test
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */

    it('OH_Pasteboard_GetDataWithProgress007', 0, async (done: Function) => {
      let fileFullName = BASE_PATH +'/dstFile.txt';
      let dirPath = BASE_PATH+"/haps.day";
      fs.mkdirSync(dirPath)
      console.info(TAG + "fileFullName fileFullName = " + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd,"write strings to " + str_line +"\n");
      fs.closeSync(file);
      let data = testndk.OH_Pasteboard_GetDataWithProgress007();
      console.info(TAG + "OH_Pasteboard_GetDataWithProgress007 data = " + data );
      fs.rmdirSync(dirPath);
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0200
     * @tc.name OH_Pasteboard_GetDataWithProgress017
     * @tc.desc OH_PasteboardObserver_Create test
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */

    it('OH_Pasteboard_GetDataWithProgress008', 0, async (done: Function) => {
      let fileFullName = BASE_PATH +'/dstFile.txt';
      let dirPath = BASE_PATH+"/haps*day";
      fs.mkdirSync(dirPath)
      console.info(TAG + "fileFullName fileFullName = " + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd,"write strings to " + str_line +"\n");
      fs.closeSync(file);
      let data = testndk.OH_Pasteboard_GetDataWithProgress008();
      console.info(TAG + "OH_Pasteboard_GetDataWithProgress008 data = " + data );
      fs.rmdirSync(dirPath);
      expect(data).assertEqual(0);
      done();
    });


    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0200
     * @tc.name OH_Pasteboard_GetDataWithProgress017
     * @tc.desc OH_PasteboardObserver_Create test
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */

    it('OH_Pasteboard_GetDataWithProgress012', 0, async (done: Function) => {
      let fileFullName = BASE_PATH +'/dstFile.txt';
      let dirPath = BASE_PATH+"/haps";
      fs.mkdirSync(dirPath)
      console.info(TAG + "fileFullName fileFullName = " + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd,"write strings to " + str_line +"\n");
      fs.closeSync(file);
      let data = testndk.OH_Pasteboard_GetDataWithProgress012();
      console.info(TAG + "OH_Pasteboard_GetDataWithProgress012 data = " + data );
      fs.rmdirSync(dirPath);
      expect(data).assertEqual(0);
      done();
    });
    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0200
     * @tc.name OH_Pasteboard_GetDataWithProgress017
     * @tc.desc OH_PasteboardObserver_Create test
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */

    it('OH_Pasteboard_GetDataWithProgress013', 0, async (done: Function) => {
      let fileFullName = BASE_PATH +'/dstFile.txt';
      let dirPath = BASE_PATH+"/haps";
      fs.mkdirSync(dirPath)
      console.info(TAG + "fileFullName fileFullName = " + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd,"write strings to " + str_line +"\n");
      fs.closeSync(file);
      let data = testndk.OH_Pasteboard_GetDataWithProgress013();
      console.info(TAG + "OH_Pasteboard_GetDataWithProgress013 data = " + data );
      fs.rmdirSync(dirPath);
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0200
     * @tc.name OH_Pasteboard_GetDataWithProgress017
     * @tc.desc OH_PasteboardObserver_Create test
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */

    it('OH_Pasteboard_GetDataWithProgress014', 0, async (done: Function) => {
      let fileFullName = BASE_PATH +'/dstFile.txt';
      let dirPath = BASE_PATH+"/haps";
      fs.mkdirSync(dirPath)
      console.info(TAG + "fileFullName fileFullName = " + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd,"write strings to " + str_line +"\n");
      fs.closeSync(file);
      let data = testndk.OH_Pasteboard_GetDataWithProgress014();
      console.info(TAG + "OH_Pasteboard_GetDataWithProgress014 data = " + data );
      fs.rmdirSync(dirPath);
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0200
     * @tc.name OH_Pasteboard_GetDataWithProgress017
     * @tc.desc OH_PasteboardObserver_Create test
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */

    it('OH_Pasteboard_GetDataWithProgress015', 0, async (done: Function) => {
      let fileFullName = BASE_PATH +'/dstFile.txt';
      let dirPath = BASE_PATH+"/haps";
      fs.mkdirSync(dirPath)
      console.info(TAG + "fileFullName fileFullName = " + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd,"write strings to " + str_line +"\n");
      fs.closeSync(file);
      let data = testndk.OH_Pasteboard_GetDataWithProgress015();
      console.info(TAG + "OH_Pasteboard_GetDataWithProgress015 data = " + data );
      fs.rmdirSync(dirPath);
      expect(data).assertEqual(0);
      done();
    });

        /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0200
     * @tc.name OH_Pasteboard_GetDataWithProgress017
     * @tc.desc OH_PasteboardObserver_Create test
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */

    it('OH_Pasteboard_GetDataWithProgress016', 0, async (done: Function) => {
      let fileFullName = BASE_PATH +'/dstFile.txt';
      let dirPath = BASE_PATH+"/haps";
      fs.mkdirSync(dirPath)
      console.info(TAG + "fileFullName fileFullName = " + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd,"write strings to " + str_line +"\n");
      fs.closeSync(file);
      let data = testndk.OH_Pasteboard_GetDataWithProgress016();
      console.info(TAG + "OH_Pasteboard_GetDataWithProgress016 data = " + data );
      fs.rmdirSync(dirPath);
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0200
     * @tc.name OH_Pasteboard_GetDataWithProgress017
     * @tc.desc OH_PasteboardObserver_Create test
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */

    it('OH_Pasteboard_GetDataWithProgress017', 0, async (done: Function) => {
      let fileFullName = BASE_PATH +'/dstFile.txt';
      let dirPath = BASE_PATH+"/haps";
      fs.mkdirSync(dirPath)
      console.info(TAG + "fileFullName fileFullName = " + fileFullName);
      console.info(TAG + "fileFullName fileFullName = " + dirPath);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd,"write strings to " + str_line +"\n");
      fs.closeSync(file);
      let data = testndk.OH_Pasteboard_GetDataWithProgress017();
      console.info(TAG + "OH_Pasteboard_GetDataWithProgress017 data = " + data );
      fs.rmdirSync(dirPath);
      expect(data).assertEqual(0);
      done();
    });
    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0200
     * @tc.name OH_Pasteboard_GetDataWithProgress018
     * @tc.desc OH_PasteboardObserver_Create test
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */

    it('OH_Pasteboard_GetDataWithProgress018', 0, async (done: Function) => {
      let fileFullName = BASE_PATH +'/dstFile.txt';
      let dirPath = BASE_PATH+"/haps";
      fs.mkdirSync(dirPath)
      console.info(TAG + "fileFullName fileFullName = " + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd,"write strings to " + str_line +"\n");
      fs.closeSync(file);
      let data = testndk.OH_Pasteboard_GetDataWithProgress018();
      fs.rmdirSync(dirPath);
      console.info(TAG + "OH_Pasteboard_GetDataWithProgress018 data = " + data );
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0200
     * @tc.name OH_Pasteboard_GetDataWithProgress018
     * @tc.desc OH_PasteboardObserver_Create test
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */

    it('OH_Pasteboard_GetDataWithProgress019', 0, async (done: Function) => {
      let fileFullName = BASE_PATH +'/dstFile.txt';
      let dirPath = BASE_PATH+"/haps";
      fs.mkdirSync(dirPath)
      console.info(TAG + "fileFullName fileFullName = " + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd,"write strings to " + str_line +"\n");
      fs.closeSync(file);
      let data = testndk.OH_Pasteboard_GetDataWithProgress019();
      fs.rmdirSync(dirPath);
      console.info(TAG + "OH_Pasteboard_GetDataWithProgress019 data = " + data );
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0200
     * @tc.name OH_Pasteboard_GetDataWithProgress018
     * @tc.desc OH_PasteboardObserver_Create test
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */

    it('OH_Pasteboard_GetDataWithProgress020', 0, async (done: Function) => {
      let fileFullName = BASE_PATH +'/dstFile.txt';
      let dirPath = BASE_PATH+"/haps";
      fs.mkdirSync(dirPath)
      console.info(TAG + "fileFullName fileFullName = " + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd,"write strings to " + str_line +"\n");
      fs.closeSync(file);
      let data = testndk.OH_Pasteboard_GetDataWithProgress020();
      fs.rmdirSync(dirPath);
      console.info(TAG + "OH_Pasteboard_GetDataWithProgress020 data = " + data );
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0200
     * @tc.name OH_Pasteboard_GetDataWithProgress018
     * @tc.desc OH_PasteboardObserver_Create test
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */

    it('OH_Pasteboard_GetDataWithProgress021', 0, async (done: Function) => {
      let fileFullName = BASE_PATH +'/dstFile.txt';
      let dirPath = BASE_PATH+"/haps";
      fs.mkdirSync(dirPath)
      console.info(TAG + "fileFullName fileFullName = " + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd,"write strings to " + str_line +"\n");
      fs.closeSync(file);
      let data = testndk.OH_Pasteboard_GetDataWithProgress021();
      fs.rmdirSync(dirPath);
      console.info(TAG + "OH_Pasteboard_GetDataWithProgress021 data = " + data );
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0200
     * @tc.name OH_Pasteboard_GetDataWithProgress018
     * @tc.desc OH_PasteboardObserver_Create test
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */

    it('OH_Pasteboard_GetDataWithProgress011', 0, async (done: Function) => {
      let fileFullName = BASE_PATH +'/dstFile.txt';
      let dirPath = BASE_PATH+"/haps2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222";
      fs.mkdirSync(dirPath)
      console.info(TAG + "fileFullName fileFullName = " + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd,"write strings to " + str_line +"\n");
      fs.closeSync(file);
      let data = testndk.OH_Pasteboard_GetDataWithProgress011();
      fs.rmdirSync(dirPath);
      console.info(TAG + "OH_Pasteboard_GetDataWithProgress011 data = " + data );
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0200
     * @tc.name OH_Pasteboard_GetDataWithProgress018
     * @tc.desc OH_PasteboardObserver_Create test
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */

    it('OH_Pasteboard_GetDataWithProgress010', 0, async (done: Function) => {
      let fileFullName = BASE_PATH +'/le.txt';
      let dirPath = BASE_PATH+"/haps22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222";
      fs.mkdirSync(dirPath)
      console.info(TAG + "fileFullName fileFullName = " + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd,"write strings to " + str_line +"\n");
      fs.closeSync(file);
      let data = testndk.OH_Pasteboard_GetDataWithProgress010();
      fs.rmdirSync(dirPath);
      console.info(TAG + "OH_Pasteboard_GetDataWithProgress010 data = " + data );
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_NdkApiTest_0200
     * @tc.name OH_Pasteboard_GetDataWithProgress017
     * @tc.desc OH_PasteboardObserver_Create test
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */

    it('OH_Pasteboard_GetDataWithProgress009', 0, async (done: Function) => {
      let fileFullName = BASE_PATH +'/dstFile.txt';
      let dirPath = BASE_PATH+"/haps";
      fs.mkdirSync(dirPath)
      console.info(TAG + "fileFullName fileFullName = " + fileFullName);
      let file = fs.openSync(fileFullName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd,"write strings to " + str_line +"\n");
      fs.closeSync(file);
      let data = testndk.OH_Pasteboard_GetDataWithProgress009();
      console.info(TAG + "OH_Pasteboard_GetDataWithProgress009 data = " + data );
      fs.rmdirSync(dirPath);
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_GetChangeCount_NdkApiTest_0100
     * @tc.name OH_Pasteboard_GetChangeCount0100
     * @tc.desc changeCount should not change after clear pasteboard
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */

    it('OH_Pasteboard_GetChangeCount0100', 0, async (done: Function) => {
      let res = testndk.OH_Pasteboard_GetChangeCount0100();
      console.info(TAG + "OH_Pasteboard_GetChangeCount0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_GetChangeCount_NdkApiTest_0200
     * @tc.name OH_Pasteboard_GetChangeCount0200
     * @tc.desc changeCount should add 1 after setData
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    
    it('OH_Pasteboard_GetChangeCount0200', 0, async (done: Function) => {
      let res = testndk.OH_Pasteboard_GetChangeCount0200();
      console.info(TAG + "OH_Pasteboard_GetChangeCount0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.number SUB_DistributedData_Pasteboard_SDK_GetChangeCount_NdkApiTest_0300
     * @tc.name OH_Pasteboard_GetChangeCount0300
     * @tc.desc changeCount should add 2 after setData twice
     * @tc.level: Level 2
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */

    it('OH_Pasteboard_GetChangeCount0300', 0, async (done: Function) => {
      let res = testndk.OH_Pasteboard_GetChangeCount0300();
      console.info(TAG + "OH_Pasteboard_GetChangeCount0300 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
  })
}