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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import batteryInfo from '@ohos.batteryInfo';
import collections from '@arkts.collections';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { fileIo as fs} from '@kit.CoreFileKit';
import { BusinessError} from '@kit.BasicServicesKit';
import { Driver, ON } from '@kit.TestKit';
import { abilityAccessCtrl, common, PermissionRequestResult } from '@kit.AbilityKit';
import { unifiedDataChannel } from "@kit.ArkData";

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();

let BASE_PATH: string = context.filesDir;
let str_line = 'a'.repeat(1024*1024*2);
let TAG = '[testLog-ets]';
let getPermission = async () => {
  console.info('getPermission is start');
  let context:common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext;
  atManager.requestPermissionsFromUser(context, ['ohos.permission.READ_PASTEBOARD'], (err:BusinessError, data:PermissionRequestResult) => {
    console.info('requestPermissionsFromUser success data is' + JSON.stringify(data));
    console.info('requestPermissionsFromUser failed err is' + JSON.stringify(err));
  })
}

let sleep = (ms:number) => {
  return new Promise<ESObject>(resolve => setTimeout(resolve, ms));
}

let drivenFn = async () => {
  try {
    let driver: Driver = Driver.create();
    console.info('come in driveFn');
    console.info('driver is ${JSON.stringify(driver)}');
    await sleep(1000);
    let button = await driver.findComponent(ON.text('始终允许'));
    if (button) {
      console.info('button is $ {JSON.stringify(button)}');
      await sleep(1000);
      await button.click();
      await  sleep(1000);
    } else {
      let button1 = await driver.findComponent(ON.text('仅本次允许'));
      console.info('button is $ {JSON.stringify(button)}');
      await sleep(1000);
      await button1.click();
      await  sleep(1000);
    }
  } catch (err) {
    console.info('err is' + err);
    return
  }
}

export default function pasteboardTestNdkPermissionTest() {
  describe('pasteboardTestNdkPermissionTest', async (done: Function) => {
    beforeAll(async (done:Function) => {
      await getPermission();
      await sleep(1000);
      await drivenFn();
      await sleep(1000);
      done();
    })
    beforeEach( async()=>{
     
    })
    afterEach(()=>{

    })


    /**
     * @tc.name   OH_Pasteboard_GetDataWithProgress001
     * @tc.number OH_Pasteboard_GetDataWithProgress001
     * @tc.desc   OH_Pasteboard_GetDataWithProgress001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_GetDataWithProgress001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   OH_Pasteboard_GetDataWithProgress002
     * @tc.number OH_Pasteboard_GetDataWithProgress002
     * @tc.desc   OH_Pasteboard_GetDataWithProgress002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_GetDataWithProgress002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   OH_Pasteboard_GetDataWithProgress003
     * @tc.number OH_Pasteboard_GetDataWithProgress003
     * @tc.desc   OH_Pasteboard_GetDataWithProgress003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_Pasteboard_GetDataWithProgress003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data = testndk.OH_Pasteboard_GetDataWithProgress003();
      console.info(TAG + "OH_Pasteboard_GetDataWithProgress003 data = " + data );
      expect(data).assertEqual(0);
      done();
    });


    /**
     * @tc.name   OH_Pasteboard_GetDataWithProgress004
     * @tc.number OH_Pasteboard_GetDataWithProgress004
     * @tc.desc   OH_Pasteboard_GetDataWithProgress004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_GetDataWithProgress004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   OH_Pasteboard_GetDataWithProgress005
     * @tc.number OH_Pasteboard_GetDataWithProgress005
     * @tc.desc   OH_Pasteboard_GetDataWithProgress005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_GetDataWithProgress005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   OH_Pasteboard_GetDataWithProgress006
     * @tc.number OH_Pasteboard_GetDataWithProgress006
     * @tc.desc   OH_Pasteboard_GetDataWithProgress006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_GetDataWithProgress006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   OH_Pasteboard_GetDataWithProgress007
     * @tc.number OH_Pasteboard_GetDataWithProgress007
     * @tc.desc   OH_Pasteboard_GetDataWithProgress007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_GetDataWithProgress007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   OH_Pasteboard_GetDataWithProgress008
     * @tc.number OH_Pasteboard_GetDataWithProgress008
     * @tc.desc   OH_Pasteboard_GetDataWithProgress008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_GetDataWithProgress008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   OH_Pasteboard_GetDataWithProgress012
     * @tc.number OH_Pasteboard_GetDataWithProgress012
     * @tc.desc   OH_Pasteboard_GetDataWithProgress012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_GetDataWithProgress012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   OH_Pasteboard_GetDataWithProgress013
     * @tc.number OH_Pasteboard_GetDataWithProgress013
     * @tc.desc   OH_Pasteboard_GetDataWithProgress013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_GetDataWithProgress013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   OH_Pasteboard_GetDataWithProgress014
     * @tc.number OH_Pasteboard_GetDataWithProgress014
     * @tc.desc   OH_Pasteboard_GetDataWithProgress014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_GetDataWithProgress014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   OH_Pasteboard_GetDataWithProgress015
     * @tc.number OH_Pasteboard_GetDataWithProgress015
     * @tc.desc   OH_Pasteboard_GetDataWithProgress015
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_GetDataWithProgress015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   OH_Pasteboard_GetDataWithProgress016
     * @tc.number OH_Pasteboard_GetDataWithProgress016
     * @tc.desc   OH_Pasteboard_GetDataWithProgress016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_GetDataWithProgress016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   OH_Pasteboard_GetDataWithProgress017
     * @tc.number OH_Pasteboard_GetDataWithProgress017
     * @tc.desc   OH_Pasteboard_GetDataWithProgress017
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_GetDataWithProgress017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   OH_Pasteboard_GetDataWithProgress018
     * @tc.number OH_Pasteboard_GetDataWithProgress018
     * @tc.desc   OH_Pasteboard_GetDataWithProgress018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_GetDataWithProgress018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   OH_Pasteboard_GetDataWithProgress019
     * @tc.number OH_Pasteboard_GetDataWithProgress019
     * @tc.desc   OH_Pasteboard_GetDataWithProgress019
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_GetDataWithProgress019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   OH_Pasteboard_GetDataWithProgress020
     * @tc.number OH_Pasteboard_GetDataWithProgress020
     * @tc.desc   OH_Pasteboard_GetDataWithProgress020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_GetDataWithProgress020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   OH_Pasteboard_GetDataWithProgress021
     * @tc.number OH_Pasteboard_GetDataWithProgress021
     * @tc.desc   OH_Pasteboard_GetDataWithProgress021
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_GetDataWithProgress021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   OH_Pasteboard_GetDataWithProgress011
     * @tc.number OH_Pasteboard_GetDataWithProgress011
     * @tc.desc   OH_Pasteboard_GetDataWithProgress011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_GetDataWithProgress011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   OH_Pasteboard_GetDataWithProgress010
     * @tc.number OH_Pasteboard_GetDataWithProgress010
     * @tc.desc   OH_Pasteboard_GetDataWithProgress010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_GetDataWithProgress010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   OH_Pasteboard_GetDataWithProgress009
     * @tc.number OH_Pasteboard_GetDataWithProgress009
     * @tc.desc   OH_Pasteboard_GetDataWithProgress009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_GetDataWithProgress009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   OH_Pasteboard_GetChangeCount0100
     * @tc.number OH_Pasteboard_GetChangeCount0100
     * @tc.desc   OH_Pasteboard_GetChangeCount0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_GetChangeCount0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Pasteboard_GetChangeCount0100();
      console.info(TAG + "OH_Pasteboard_GetChangeCount0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    
    /**
     * @tc.name   OH_Pasteboard_GetChangeCount0200
     * @tc.number OH_Pasteboard_GetChangeCount0200
     * @tc.desc   OH_Pasteboard_GetChangeCount0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_GetChangeCount0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Pasteboard_GetChangeCount0200();
      console.info(TAG + "OH_Pasteboard_GetChangeCount0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });



    /**
     * @tc.name   OH_Pasteboard_GetChangeCount0300
     * @tc.number OH_Pasteboard_GetChangeCount0300
     * @tc.desc   OH_Pasteboard_GetChangeCount0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Pasteboard_GetChangeCount0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Pasteboard_GetChangeCount0300();
      console.info(TAG + "OH_Pasteboard_GetChangeCount0300 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
  })
}