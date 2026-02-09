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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import {
  WatchEvent,
  Watcher,
} from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000 //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';
const WAIT_HALF_SECOND = 500;
const watcherEvent = new Map<string, int>([
  ['IN_ACCESS', 0x00000001],
  ['IN_MODIFY', 0x00000002],
  ['IN_ATTRIB', 0x00000004],
  ['IN_CLOSE_WRITE', 0x00000008],
  ['IN_CLOSE_NOWRITE', 0x00000010],
  ['IN_OPEN', 0x00000020],
  ['IN_MOVED_FROM', 0x00000040],
  ['IN_MOVED_TO', 0x00000080],
  ['IN_CREATE', 0x00000100],
  ['IN_DELETE', 0x00000200],
  ['IN_DELETE_SELF', 0x00000400],
  ['IN_MOVE_SELF', 0x00000800]
]);

const callback = (data: WatchEvent) => {
  hilog.info(domain, tag, '%{public}s', `The watcher is triggered :{event: ${data.event}, fileName: ${data.fileName}, cookie:${data.cookie}}`);
}

interface TestWatcher {
  flag: boolean,
  watcher: fs.Watcher|undefined
}

function startWatcher(testNum: string, eventCode: int|undefined , watchPath: string): TestWatcher {
  let ret: TestWatcher = {
    flag: false,
    watcher: undefined
  }
  if(eventCode == undefined){
    hilog.info(domain, tag, '%{public}s', 'eventCode get fail');
    return ret;
  }
  waitForCompletion(async()=> {await Utils.msSleep(10)});
  try {
    ret.watcher = fs.createWatcher(watchPath, eventCode, (data: WatchEvent) => {
      hilog.info(domain, tag, '%{public}s', `${testNum} :{event: ${data.event}, fileName: ${data.fileName}, cookie: ${data.cookie}}`);
      if (eventCode === data.event) {
        ret.flag = true;
      }
    });
  } catch (e) {
    hilog.info(domain, tag, '%{public}s', testNum + ' startWatcher failed for ' + e.message + ', code: ' + e.code);
    return ret;
  }
  ret.watcher?.start();
  return ret;
}

export default function fileIOWatcher() {
  describe('fileIO_fs_watcher', (): void => {

    /**
     * @tc.name   fileIO_test_watcher_static_001
     * @tc.number SUB_DF_FILEIO_WATCHER_0100
     * @tc.desc   Test watcher event '0x00000001': 'IN_ACCESS'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_watcher_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let testNum = 'fileIO_test_watcher_static_001';
      let dpath = await Utils.nextFileName(testNum);
      let fpath = dpath + '/file_001.txt';
      fs.mkdirSync(dpath);
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();

      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        let resWatcher = startWatcher(testNum, watcherEvent.get('IN_ACCESS'), dpath);
        fs.readSync(file.fd, new ArrayBuffer(4096));
        await Utils.msSleep(WAIT_HALF_SECOND);
        expect(resWatcher.flag == true).assertTrue();
        resWatcher.watcher?.stop();
        fs.closeSync(file);
        fs.rmdirSync(dpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', testNum + ' has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_watcher_static_002
     * @tc.number SUB_DF_FILEIO_WATCHER_0200
     * @tc.desc   Test watcher event '0x00000002': 'IN_MODIFY'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_watcher_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let testNum = 'fileIO_test_watcher_static_002';
      let dpath = await Utils.nextFileName(testNum);
      let fpath = dpath + '/file_002.txt';
      fs.mkdirSync(dpath);
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();

      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        let resWatcher = startWatcher(testNum, watcherEvent.get('IN_MODIFY'), dpath);
        fs.writeSync(file.fd, FILE_CONTENT);
        await Utils.msSleep(WAIT_HALF_SECOND);
        expect(resWatcher.flag == true).assertTrue();
        resWatcher.watcher?.stop();
        fs.closeSync(file);
        fs.rmdirSync(dpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', testNum + ' has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_watcher_static_003
     * @tc.number SUB_DF_FILEIO_WATCHER_0300
     * @tc.desc   Test watcher event '0x00000004': 'IN_ATTRIB'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_watcher_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let testNum = 'fileIO_test_watcher_static_003';
      let dpath = await Utils.nextFileName(testNum);
      let fpath = dpath + '/file_003.txt';
      fs.mkdirSync(dpath);
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();

      try {
        let resWatcher = startWatcher(testNum, watcherEvent.get('IN_ATTRIB'), dpath);
        let time = new Date().getTime();
        fs.utimes(fpath,time);
        await Utils.msSleep(WAIT_HALF_SECOND);
        expect(resWatcher.flag == true).assertTrue();
        resWatcher.watcher?.stop();
        fs.rmdirSync(dpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', testNum + ' has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_watcher_static_004
     * @tc.number SUB_DF_FILEIO_WATCHER_0400
     * @tc.desc   Test watcher event '0x00000008': 'IN_CLOSE_WRITE'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_watcher_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let testNum = 'fileIO_test_watcher_static_004';
      let dpath = await Utils.nextFileName(testNum);
      let fpath = dpath + '/file_004.txt';
      fs.mkdirSync(dpath);
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();

      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        let resWatcher = startWatcher(testNum, watcherEvent.get('IN_CLOSE_WRITE'), dpath);
        fs.closeSync(file.fd);
        await Utils.msSleep(WAIT_HALF_SECOND);
        expect(resWatcher.flag == true).assertTrue();
        resWatcher.watcher?.stop();
        fs.rmdirSync(dpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', testNum + ' has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_watcher_static_005
     * @tc.number SUB_DF_FILEIO_WATCHER_0500
     * @tc.desc   Test watcher event '0x00000020': 'IN_OPEN'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_watcher_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let testNum = 'fileIO_test_watcher_static_005';
      let dpath = await Utils.nextFileName(testNum);
      let fpath = dpath + '/file_005.txt';
      fs.mkdirSync(dpath);
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();

      try {
        let resWatcher = startWatcher(testNum, watcherEvent.get('IN_OPEN'), dpath);
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        await Utils.msSleep(WAIT_HALF_SECOND);
        expect(resWatcher.flag == true).assertTrue();
        resWatcher.watcher?.stop();
        fs.closeSync(file);
        fs.rmdirSync(dpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', testNum + ' has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_watcher_static_006
     * @tc.number SUB_DF_FILEIO_WATCHER_0600
     * @tc.desc   Test watcher event '0x00000040': 'IN_MOVED_FROM', '0x00000080': 'IN_MOVED_TO',
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_watcher_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let testNum = 'fileIO_test_watcher_static_006';
      let dpath = await Utils.nextFileName(testNum);
      let fpath = dpath + '/file_006.txt';
      fs.mkdirSync(dpath);
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();

      try {
        let watcherFrom: number = 1;
        let watcherTo: number = -1;
        let watcher = fs.createWatcher(dpath, watcherEvent.get('IN_MOVED_FROM', 0x00000040) | watcherEvent.get('IN_MOVED_TO', 0x00000080), (data: WatchEvent) => {
          hilog.info(domain, tag, '%{public}s', `${testNum} :{event: ${data.event}, fileName: ${data.fileName}, cookie: ${data.cookie}}`);
          if (watcherEvent.get('IN_MOVED_FROM') === data.event) {
            watcherFrom = data.cookie;
          }
          if (watcherEvent.get('IN_MOVED_TO') === data.event) {
            watcherTo = data.cookie;
          }
        });
        watcher.start();
        fs.renameSync(fpath, fpath + 'newf');
        await Utils.msSleep(WAIT_HALF_SECOND);
        expect(watcherFrom == watcherTo).assertTrue();
        watcher.stop();
        fs.rmdirSync(dpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', testNum + ' has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_watcher_static_007
     * @tc.number SUB_DF_FILEIO_WATCHER_0700
     * @tc.desc   Test watcher event '0x00000100': 'IN_CREATE'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_watcher_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let testNum = 'fileIO_test_watcher_static_007';
      let dpath = await Utils.nextFileName(testNum);
      let fpath = dpath + '/file_007.txt';
      fs.mkdirSync(dpath);

      try {
        let resWatcher = startWatcher(testNum, watcherEvent.get('IN_CREATE'), dpath);
        let file = fs.openSync(fpath, fs.OpenMode.CREATE);
        await Utils.msSleep(WAIT_HALF_SECOND);
        expect(resWatcher.flag == true).assertTrue();
        resWatcher.watcher?.stop();
        fs.closeSync(file);
        fs.rmdirSync(dpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', testNum + ' has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_watcher_static_008
     * @tc.number SUB_DF_FILEIO_WATCHER_0800
     * @tc.desc   Test watcher event '0x00000100': 'IN_CREATE'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_watcher_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let testNum = 'fileIO_test_watcher_static_008';
      let dpath = await Utils.nextFileName(testNum);
      let ddpath = dpath + '/dir_008';
      fs.mkdirSync(dpath);

      try {
        let resWatcher = startWatcher(testNum, watcherEvent.get('IN_CREATE'), dpath);
        fs.mkdirSync(ddpath);
        await Utils.msSleep(WAIT_HALF_SECOND);
        expect(resWatcher.flag == true).assertTrue();
        resWatcher.watcher?.stop();
        fs.rmdirSync(dpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', testNum + ' has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_watcher_static_009
     * @tc.number SUB_DF_FILEIO_WATCHER_0900
     * @tc.desc   Test watcher event '0x00000200': 'IN_DELETE'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_watcher_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let testNum = 'fileIO_test_watcher_static_009';
      let dpath = await Utils.nextFileName(testNum);
      let fpath = dpath + '/file_009.txt';
      fs.mkdirSync(dpath);
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();

      try {
        let resWatcher = startWatcher(testNum, watcherEvent.get('IN_DELETE'), dpath);
        fs.unlinkSync(fpath);
        await Utils.msSleep(WAIT_HALF_SECOND);
        expect(resWatcher.flag == true).assertTrue();
        resWatcher.watcher?.stop();
        fs.rmdirSync(dpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', testNum + ' has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_watcher_static_010
     * @tc.number SUB_DF_FILEIO_WATCHER_1000
     * @tc.desc   Test watcher event '0x00000200': 'IN_DELETE'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_watcher_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let testNum = 'fileIO_test_watcher_static_010';
      let dpath = await Utils.nextFileName(testNum);
      let ddpath = dpath + '/dir_010';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);

      try {
        let resWatcher = startWatcher(testNum, watcherEvent.get('IN_DELETE'), dpath);
        fs.rmdirSync(ddpath);
        await Utils.msSleep(WAIT_HALF_SECOND);
        expect(resWatcher.flag == true).assertTrue();
        resWatcher.watcher?.stop();
        fs.rmdirSync(dpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', testNum + ' has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_watcher_static_011
     * @tc.number SUB_DF_FILEIO_WATCHER_1100
     * @tc.desc   Test watcher event '0x00000400': 'IN_DELETE_SELF'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_watcher_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let testNum = 'fileIO_test_watcher_static_011';
      let dpath = await Utils.nextFileName(testNum);
      fs.mkdirSync(dpath);

      try {
        let resWatcher = startWatcher(testNum, watcherEvent.get('IN_DELETE_SELF'), dpath);
        fs.rmdirSync(dpath);
        await Utils.msSleep(WAIT_HALF_SECOND);
        expect(resWatcher.flag == true).assertTrue();
        resWatcher.watcher?.stop();
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', testNum + ' has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_watcher_static_012
     * @tc.number SUB_DF_FILEIO_WATCHER_1200
     * @tc.desc   Test watcher event '0x00000800': 'IN_MOVE_SELF'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_watcher_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let testNum = 'fileIO_test_watcher_static_012';
      let dpath = await Utils.nextFileName(testNum);
      fs.mkdirSync(dpath);

      try {
        let resWatcher = startWatcher(testNum, watcherEvent.get('IN_MOVE_SELF'), dpath);
        fs.renameSync(dpath, dpath + 'newd');
        await Utils.msSleep(WAIT_HALF_SECOND);
        expect(resWatcher.flag == true).assertTrue();
        resWatcher.watcher?.stop();
        fs.rmdirSync(dpath + 'newd');
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', testNum + ' has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_watcher_static_013
     * @tc.number SUB_DF_FILEIO_WATCHER_1300
     * @tc.desc   Test watcher event '0x00000800': 'IN_MOVE_SELF'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_watcher_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let testNum = 'fileIO_test_watcher_static_013';
      let fpath = await Utils.nextFileName(testNum);
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();

      try {
        let resWatcher = startWatcher(testNum, watcherEvent.get('IN_MOVE_SELF'), fpath);
        fs.renameSync(fpath, fpath + 'newd');
        await Utils.msSleep(WAIT_HALF_SECOND);
        expect(resWatcher.flag == true).assertTrue();
        resWatcher.watcher?.stop();
        fs.unlinkSync(fpath + 'newd');
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', testNum + ' has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_watcher_static_014
     * @tc.number SUB_DF_FILEIO_WATCHER_1400
     * @tc.desc   Test watcher event '0x00000010': 'IN_CLOSE_NOWRITE'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_watcher_static_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let testNum = 'fileIO_test_watcher_static_014';
      let dpath = await Utils.nextFileName(testNum);
      let fpath = dpath + '/file_014.txt';
      fs.mkdirSync(dpath);
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();

      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        let resWatcher = startWatcher(testNum, watcherEvent.get('IN_CLOSE_NOWRITE'), dpath);
        fs.closeSync(file.fd);
        await Utils.msSleep(WAIT_HALF_SECOND);
        expect(resWatcher.flag == true).assertTrue();
        resWatcher.watcher?.stop();
        fs.rmdirSync(dpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', testNum + ' has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_watcher_static_015
     * @tc.number SUB_DF_FILEIO_WATCHER_1500
     * @tc.desc   Create multiple watchers in the same directory.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_watcher_static_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let testNum = 'fileIO_test_watcher_static_015';
      let dpath = await Utils.nextFileName(testNum);
      let fpath1 = dpath + '/file_015.txt';
      let fpath2 = dpath + '/file_016.txt';
      fs.mkdirSync(dpath);
      let res = await Utils.prepareFile(fpath1, FILE_CONTENT);
      expect(res).assertTrue();
      res = await Utils.prepareFile(fpath2, FILE_CONTENT);
      expect(res).assertTrue();

      try {
        let resWatcher: Watcher[] = new Array<Watcher>(5);
        resWatcher[0] = fs.createWatcher(dpath, watcherEvent.get('IN_OPEN', 0x00000020), callback);
        resWatcher[1] = fs.createWatcher(dpath, watcherEvent.get('IN_ACCESS', 0x00000001), callback);
        resWatcher[2] = fs.createWatcher(dpath, watcherEvent.get('IN_CLOSE_NOWRITE', 0x00000010), callback);
        resWatcher[3] = fs.createWatcher(dpath, watcherEvent.get('IN_MODIFY', 0x00000002), callback);
        resWatcher[4] = fs.createWatcher(dpath, watcherEvent.get('IN_CLOSE_WRITE', 0x00000008), callback);
        resWatcher.forEach(element => { element.start(); });
        let file1 = fs.openSync(fpath1, fs.OpenMode.READ_ONLY);
        let file2 = fs.openSync(fpath2, fs.OpenMode.READ_WRITE);
        await Utils.msSleep(WAIT_HALF_SECOND);
        fs.readSync(file1.fd, new ArrayBuffer(64));
        await Utils.msSleep(WAIT_HALF_SECOND);
        fs.closeSync(file1);
        await Utils.msSleep(WAIT_HALF_SECOND);
        fs.writeSync(file2.fd, FILE_CONTENT);
        await Utils.msSleep(WAIT_HALF_SECOND);
        fs.closeSync(file2.fd);
        await Utils.msSleep(WAIT_HALF_SECOND);
        resWatcher.forEach(element => { element.stop(); });
        fs.rmdirSync(dpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', testNum + ' has failed for ' + e.message + ', code: ' + e.code);
      }
    });

    /**
     * @tc.name   fileIO_test_watcher_static_016
     * @tc.number SUB_DF_FILEIO_WATCHER_1600
     * @tc.desc   Same event, different callback function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_watcher_static_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let testNum = 'fileIO_test_watcher_static_016';
      let dpath = await Utils.nextFileName(testNum);
      let fpath = dpath + '/file_005.txt';
      fs.mkdirSync(dpath);
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();

      try {
        let resWatcher1 = fs.createWatcher(dpath, watcherEvent.get('IN_OPEN', 0x00000020), (data: WatchEvent) => {
          hilog.info(domain, tag, '%{public}s', `cb_st: ${testNum} :{event: ${data.event}, fileName: ${data.fileName}, cookie: ${data.cookie}}`);
        });
        resWatcher1.start();
        let resWatcher2 = fs.createWatcher(dpath, watcherEvent.get('IN_OPEN', 0x00000020), (data: WatchEvent) => {
          hilog.info(domain, tag, '%{public}s', `cb_nd: ${testNum} :{event: ${data.event}, fileName: ${data.fileName}, cookie: ${data.cookie}}`);
        });
        resWatcher2.start();
        let file = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        await Utils.msSleep(WAIT_HALF_SECOND);
        resWatcher1.stop();
        resWatcher2.stop();
        fs.closeSync(file);
        fs.rmdirSync(dpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', testNum + ' has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_watcher_static_017
     * @tc.number SUB_DF_FILEIO_WATCHER_1700
     * @tc.desc   Same parameter, throw errno.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_watcher_static_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let testNum = 'fileIO_test_watcher_static_017';
      let fpath = await Utils.nextFileName(testNum);
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let watcher: Watcher | undefined;

      try {
        watcher = fs.createWatcher(fpath, watcherEvent.get('IN_ACCESS', 0x00000001), callback);
        watcher!.start();
        fs.createWatcher(fpath, watcherEvent.get('IN_ACCESS', 0x00000001), callback);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        watcher!.stop();
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', testNum + ' has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_watcher_static_018
     * @tc.number SUB_DF_FILEIO_WATCHER_1800
     * @tc.desc   null parameter, throw errno.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_watcher_static_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let testNum = 'fileIO_test_watcher_static_018';
      let watcher: Watcher | undefined;

      try {
        watcher = fs.createWatcher("", watcherEvent.get('IN_ACCESS', 0x00000001), callback);
        watcher?.start();
        expect(false).assertTrue();
        done();
      } catch (e) {
        e = e as BusinessError;
        watcher?.stop();
        hilog.info(domain, tag, '%{public}s', testNum + ' has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_watcher_static_021
     * @tc.number SUB_DF_FILEIO_WATCHER_2100
     * @tc.desc   No watcher started.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_watcher_static_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let testNum = 'fileIO_test_watcher_static_021';
      let fpath = await Utils.nextFileName(testNum);
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();

      try {
        let watcher = fs.createWatcher(fpath, watcherEvent.get('IN_ACCESS', 0x00000001), (data: WatchEvent) => {});
        watcher.stop();
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', testNum + ' has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_watcher_static_023
     * @tc.number SUB_DF_FILEIO_WATCHER_2300
     * @tc.desc   Test Invalid parameter, events = -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_watcher_static_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let testNum = 'fileIO_test_watcher_static_023';
      let fpath = await Utils.nextFileName(testNum);
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      const invalidEvent = -1;

      try {
        let watcher = fs.createWatcher(fpath, invalidEvent, (data: WatchEvent) => {});
        watcher.start();
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', testNum + ' has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_watcher_static_025
     * @tc.number SUB_DF_FILEIO_WATCHER_2500
     * @tc.desc   The path point to nothing, no such file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_watcher_static_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let testNum = 'fileIO_test_watcher_static_025';
      let fpath = await Utils.nextFileName(testNum);

      try {
        let watcher = fs.createWatcher(fpath, watcherEvent.get('IN_ACCESS', 0x00000001), (data: WatchEvent) => {});
        watcher.start();
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', testNum + ' has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });

  });
}