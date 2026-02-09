/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from "../../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from '../Util.test';
import fs from '@ohos.file.fs';
import buffer from '@ohos.buffer';
import { BusinessError } from '@ohos.base';
import util from '@ohos.util';

let domain: int = 0x0000 //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const FILE_CONTENT = 'hello world';
const WAIT_ONE_SECOND = 1000;

export default function atomicFileTest() {
  let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe("fileIO_fs_atomicFile_test", (): void => {
    hilog.info(domain, tag, '%{public}s', 'fileIO_fs_atomicFile_test start');

    /**
     * @tc.name   fileIO_test_atomicFile_static_000
     * @tc.number SUB_DF_ATOMIC_FILE_0000
     * @tc.desc   Test the startWrite() interface of class AtomicFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_atomicFile_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_000 start');
      try {
        let file1 = new fs.AtomicFile("");
        let ws1 = file1.startWrite();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_000 has failed for' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message === "No such file or directory").assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_atomicFile_static_001
     * @tc.number SUB_DF_ATOMIC_FILE_0100
     * @tc.desc   Test the startWrite() interface of class AtomicFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_atomicFile_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_001 start');
      let fpath = await Utils.nextFileName('fileIO_test_atomicFile_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = new fs.AtomicFile(fpath);
        let ws = file.startWrite();
        file.finishWrite();
        let statres = fs.statSync(fpath);
        expect(statres.size == 0).assertTrue();
        file.delete();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_atomicFile_static_003
     * @tc.number SUB_DF_ATOMIC_FILE_0300
     * @tc.desc   Test the startWrite() interface of class AtomicFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_atomicFile_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_003 start');
      let fpath = await Utils.nextFileName('fileIO_test_atomicFile_static_003');
      try {
        let file1 = new fs.AtomicFile(fpath);
        let ws1 = file1.readFully();
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_003 has failed for' + e.code + e.message );
        expect(e.code == 13900002 && e.message === "No such file or directory").assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_atomicFile_static_004
     * @tc.number SUB_DF_ATOMIC_FILE_0400
     * @tc.desc   Test the readFully() interface of class AtomicFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_atomicFile_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_004 start');
      let fpath = await Utils.nextFileName('fileIO_test_atomicFile_static_004');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = new fs.AtomicFile(fpath);
        let data = file.readFully();
        expect(data !== null).assertTrue();
        let decoder = util.TextDecoder.create('utf-8');
        let str = decoder.decodeToString(new Uint8Array(data));
        expect(str === FILE_CONTENT).assertTrue();
        file.delete();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_004 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_atomicFile_static_005
     * @tc.number SUB_DF_ATOMIC_FILE_0500
     * @tc.desc   Test the openRead() interface of class AtomicFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_atomicFile_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_005 start');
      let fpath = await Utils.nextFileName('test5');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = new fs.AtomicFile(fpath);
        let readStream = file.openRead();
        readStream.on('readable', () => {
          let data = readStream.read();
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_005 data ' + data);
          if (data == null) {
            return;
          }
          let context = data.toString();
          expect(context === FILE_CONTENT).assertTrue();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_005 has failed for ' + e.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_atomicFile_static_006
     * @tc.number SUB_DF_ATOMIC_FILE_0600
     * @tc.desc   Test the failedWrite() interface of class AtomicFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_atomicFile_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_006 start');
      let fpath = await Utils.nextFileName('fileIO_test_atomicFile_static_006');
      expect(await Utils.prepareFile(fpath, "fileIO_test_atomicFile_static_006")).assertTrue();
      try {
        let file = new fs.AtomicFile(fpath);
        let ws = file.startWrite();
        ws.write("hello world");
        await Utils.msSleep(WAIT_ONE_SECOND);
        file.failWrite();

        let data = file.readFully();
        let decoder = util.TextDecoder.create('utf-8');
        let str = decoder.decodeToString(new Uint8Array(data));
        expect(str === "fileIO_test_atomicFile_static_006").assertTrue();
        file.delete();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_006 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_atomicFile_static_007
     * @tc.number SUB_DF_ATOMIC_FILE_0700
     * @tc.desc   Test the function interface of class AtomicFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_atomicFile_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_007 start');
      let fpath = await Utils.nextFileName('fileIO_test_atomicFile_static_007');
      expect(await Utils.prepareFile(fpath, "fileIO_test_atomicFile_static_007")).assertTrue();
      try {
        let rFile = new fs.AtomicFile(fpath);
        let readData = rFile.readFully();
        let rDecoder = util.TextDecoder.create('utf-8');
        let readStr = rDecoder.decodeToString(new Uint8Array(readData));
        expect(readStr === "fileIO_test_atomicFile_static_007").assertTrue();

        let wPath = await Utils.nextFileName('test7_write.txt');
        let wFile = new fs.AtomicFile(wPath);
        let ws = wFile.startWrite();
        ws.write(readStr,"utf-8",()=> {
          wFile.finishWrite();
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_007 finishWrite');
          setTimeout(()=>{
            let writeData = wFile.readFully();
            let wDecoder = util.TextDecoder.create('utf-8');
            let writeStr = wDecoder.decodeToString(new Uint8Array(writeData));
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_007 writeStr' + writeStr);
          },1000);
        })
        rFile.delete();
        wFile.delete();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_007 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_atomicFile_static_008
     * @tc.number SUB_DF_ATOMIC_FILE_0800
     * @tc.desc   Test the delete() interface of class AtomicFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_atomicFile_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_008 start');
      let fpath = await Utils.nextFileName('fileIO_test_atomicFile_static_008');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = new fs.AtomicFile(fpath);
        let ws = file.startWrite();
        file.finishWrite();
        let stat = fs.statSync(fpath);
        expect(stat.size == 0).assertTrue();

        file.delete();
        let res = fs.accessSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_008 res ' + res);
        expect(res).assertFalse();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_008 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_atomicFile_static_009
     * @tc.number SUB_DF_ATOMIC_FILE_0900
     * @tc.desc   Test the getBaseFile() interface of class AtomicFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_atomicFile_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_009 start');
      let fpath = await Utils.nextFileName('fileIO_test_atomicFile_static_009');
      try {
        let file = new fs.AtomicFile(fpath);
        let File = file.getBaseFile();
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_009 has failed for' + e.message + ', code: ' + e.code);
        expect(e.code == 13900002 && e.message === "No such file or directory").assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_atomicFile_static_010
     * @tc.number SUB_DF_ATOMIC_FILE_1000
     * @tc.desc   Test the getBaseFile() interface of class AtomicFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_atomicFile_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_010 start');
      let fpath = await Utils.nextFileName('fileIO_test_atomicFile_static_010');
      try {
        let file = new fs.AtomicFile(fpath);
        let ws = file.startWrite();
        ws.write("fileIO_test_atomicFile_static_010");
        await Utils.msSleep(WAIT_ONE_SECOND);
        file.finishWrite();
        let File = file.getBaseFile();
        expect(File.fd > 0).assertTrue();
        expect(File.path === fpath).assertTrue();
        file.delete();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_010 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

  })
  hilog.info(domain, tag, '%{public}s', 'fileIO_fs_atomicFile_test end');

}