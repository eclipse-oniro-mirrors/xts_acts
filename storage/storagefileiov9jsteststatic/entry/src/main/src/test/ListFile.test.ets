/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import { ListFileOptions, Filter } from '@ohos.file.fs';
import { BusinessError } from '@ohos.base'

let domain: int = 0x0000 //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';

export default function fileIOListfile() {
  describe('fileIO_fs_listfile', (): void => {

    /**
     * @tc.name   fileIO_test_listfile_sync_static_000
     * @tc.number SUB_DF_FILEIO_LISTFILE_SYNC_0000
     * @tc.desc   Test listFileSync()interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfile_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_sync_static_000');
      let fpath1 = dpath + '/listfile_sync_000.txt';
      let fpath2 = dpath + '/listfile_sync_000.doc';
      let fpath3 = dpath + '/listfile_sync_000.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let dirents = fs.listFileSync(dpath);
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_sync_static_000 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_sync_static_001
     * @tc.number SUB_DF_FILEIO_LISTFILE_SYNC_0100
     * @tc.desc   Test listFileSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfile_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_sync_static_001');
      let fpath1 = dpath + '/listfile_sync_001.txt';
      let fpath2 = dpath + '/listfile_sync_001.doc';
      let fpath3 = dpath + '/listfile_sync_001.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let dirents = fs.listFileSync(dpath, {
          listNum: 2,
          recursion: false
        });
        expect(dirents.length == 2).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_sync_static_001 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_sync_static_002
     * @tc.number SUB_DF_FILEIO_LISTFILE_SYNC_0200
     * @tc.desc   Test listFileSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfile_sync_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_sync_static_002');
      let fpath1 = dpath + '/listfile_sync_002.txt';
      let fpath2 = dpath + '/listfile_sync_002.doc';
      let fpath3 = dpath + '/listfile_sync_002.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let time = new Date().getTime() / 1000;
        let filter: Filter = {
          suffix: [".txt", ".doc", ".png"],
          displayName: ["*listfile*"],
          fileSizeOver: 0,
          lastModifiedAfter: time - 3
        };

        let option: ListFileOptions = {
          recursion: false,
          filter: filter
        };

        let dirents = fs.listFileSync(dpath, option);
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_sync_static_002 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_sync_static_003
     * @tc.number SUB_DF_FILEIO_LISTFILE_SYNC_0300
     * @tc.desc   Test listFileSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfile_sync_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_sync_static_003');
      let fpath1 = dpath + '/listfile_sync_003.txt';
      let fpath2 = dpath + '/listfile_sync_003.doc';
      let fpath3 = dpath + '/listfile_sync_003.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let time = new Date().getTime() / 1000;
        let filter: Filter = {
          displayName: ["*listfile*"],
          fileSizeOver: 5,
          lastModifiedAfter: time - 3
        };

        let dirents = fs.listFileSync(dpath, {
          listNum: 4,
          recursion: false,
          filter: filter
        });
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_sync_static_003 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_sync_static_004
     * @tc.number SUB_DF_FILEIO_LISTFILE_SYNC_0400
     * @tc.desc   Test listFileSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfile_sync_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_sync_static_004');
      let fpath1 = dpath + '/listfile_sync_004.txt';
      let fpath2 = dpath + '/listfile_sync_004.doc';
      let fpath3 = dpath + '/listfile_sync_004.png';
      let ddpath = dpath + '/kids';
      let ffpath1 = ddpath + '/firstc.txt';
      let ffpath2 = ddpath + '/firsta.txt';
      let ffpath3 = ddpath + '/aabbcc.hap';
      let dddpath = ddpath + '/' + await Utils.randomString(5);
      let fffpath1 = dddpath + '/makef.doc';
      let fffpath2 = dddpath + '/akasd.txt';
      let fffpath3 = dddpath + '/tdd.log';
      let fffpath4 = dddpath + '/tdd.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      fs.mkdirSync(dddpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath3, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fffpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fffpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fffpath3, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fffpath4, FILE_CONTENT)).assertTrue();

      try {
        let time = new Date().getTime() / 1000;
        let filter: Filter = {
          suffix: [".txt", ".doc"],
          displayName: ["*listfile*", "*first*", "*akasd*", "*tdd*", "*makef*"],
          fileSizeOver: 0,
          lastModifiedAfter: time - 3
        };

        let dirents = fs.listFileSync(dpath, {
          listNum: 6,
          recursion: true,
          filter: filter
        });
        expect(dirents.length == 6).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_sync_static_004 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_sync_static_005
     * @tc.number SUB_DF_FILEIO_LISTFILE_SYNC_0500
     * @tc.desc   Test listFileSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfile_sync_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_sync_static_005') ;
      let fpath1 = dpath + '/listfile_sync_005.txt';
      let fpath2 = dpath + '/listfile_sync_005.doc';
      let fpath3 = dpath + '/listfile_sync_005.png';
      let fpath4 = dpath + '/timer.txt';
      fs.mkdirSync(dpath);
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_sync_static_005 prepareFile start');
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath4, FILE_CONTENT)).assertTrue();
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_sync_static_005 prepareFile success123');

      try {
        let time = new Date().getTime() / 1000;
        let filter: Filter = {
          suffix: [".txt"],
          displayName: ["*listfile*", "*time*"],
          fileSizeOver: 4,
          lastModifiedAfter: time - 3
        };
        let dirents = fs.listFileSync(dpath, {
          listNum: 3,
          recursion: false,
          filter: filter
        });
        expect(dirents.length == 2).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_sync_static_005 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_sync_static_006
     * @tc.number SUB_DF_FILEIO_LISTFILE_SYNC_0600
     * @tc.desc   Test listFileSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfile_sync_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_sync_static_006');
      let fpath1 = dpath + '/listfile_sync_006.txt';
      let fpath2 = dpath + '/listfile_sync_006.doc';
      let fpath3 = dpath + '/listfile_sync_006.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let time = new Date().getTime() / 1000;
        let filter: Filter = {
          suffix: ["%.txt%"],
          displayName: ["*listfile*"],
          fileSizeOver: 0,
          lastModifiedAfter: time -3
        };
        fs.listFileSync(dpath, {
          listNum: 3,
          recursion: false,
          filter: filter
        });
        expect(false).assertTrue();
      } catch (err: BusinessError) {
        fs.rmdirSync(dpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_sync_static_006 end error' + JSON.stringify(err));
        expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_sync_static_007
     * @tc.number SUB_DF_FILEIO_LISTFILE_SYNC_0700
     * @tc.desc   Test listFileSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfile_sync_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_sync_static_007');
      let fpath1 = dpath + '/listfile_sync_007.txt';
      let fpath2 = dpath + '/listfile_sync_007.doc';
      let fpath3 = dpath + '/listfile_sync_007.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let time = new Date().getTime() / 1000;
        let filter: Filter = {
          suffix: [".txt"],
          displayName: ["*listfile*"],
          fileSizeOver: 12,
          lastModifiedAfter: time - 3
        };
        let dirents = fs.listFileSync(dpath, {
          listNum: 3,
          recursion: false,
          filter: filter
        });
        expect(dirents.length == 0).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_sync_static_007 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_sync_static_008
     * @tc.number SUB_DF_FILEIO_LISTFILE_SYNC_0800
     * @tc.desc   Test listFileSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfile_sync_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_sync_static_008');
      let fpath1 = dpath + '/listfile_sync_008.txt';
      let fpath2 = dpath + '/listfile_sync_008.doc';
      let fpath3 = dpath + '/listfile_sync_008.png';
      let fpath4 = dpath + '/trespass.txt';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath4, FILE_CONTENT)).assertTrue();

      try {
        let time = new Date().getTime() / 1000;
        let filter: Filter = {
          suffix: [".txt"],
          displayName: ["*listfile*", "*trespass*"],
          fileSizeOver: 5,
          lastModifiedAfter: time - 3
        };
        let dirents = fs.listFileSync(dpath, {
          listNum: 0,
          recursion: false,
          filter: filter
        });
        expect(dirents.length == 2).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_sync_static_008 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_sync_static_013
     * @tc.number SUB_DF_FILEIO_LISTFILE_SYNC_1300
     * @tc.desc   Test listFileSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfile_sync_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_sync_static_002');
      let fpath1 = dpath + '/listfile_sync_013.txt';
      let fpath2 = dpath + '/listfile_sync_013.doc';
      let fpath3 = dpath + '/listfile_sync_013.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let time = new Date().getTime() / 1000;
        let filter: Filter = {
          suffix: [".txt", ".doc", ".png"],
          displayName: ["*listfile*"],
          fileSizeOver: 0,
          lastModifiedAfter: time - 3,
          excludeMedia: false
        };
        let dirents = fs.listFileSync(dpath, {
          listNum: 0,
          recursion: false,
          filter: filter
        });
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_sync_static_013 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_sync_static_014
     * @tc.number SUB_DF_FILEIO_LISTFILE_SYNC_1400
     * @tc.desc   Test listFileSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfile_sync_static_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_sync_static_014');

      try {
        let dirents = fs.listFileSync(dpath, {
          listNum: 2,
          recursion: false
        });
        expect(false).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_sync_static_014 end error' + JSON.stringify(err));
        expect(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_sync_static_015
     * @tc.number SUB_DF_FILEIO_LISTFILE_SYNC_1500
     * @tc.desc   Test listFileSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfile_sync_static_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_sync_static_015');
      expect(await Utils.prepareFile(dpath, FILE_CONTENT)).assertTrue();

      try {
        let dirents = fs.listFileSync(dpath, {
          listNum: 2,
          recursion: false
        });
        expect(false).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_sync_static_015 end error' + JSON.stringify(err));
        expect(err.code == 13900018 && err.message == 'Not a directory').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_sync_static_016
     * @tc.number SUB_DF_FILEIO_LISTFILE_SYNC_1600
     * @tc.desc   Test listFileSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_listfile_sync_static_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_sync_static_016');
      expect(await Utils.prepareFile(dpath, FILE_CONTENT)).assertTrue();

      try {
        let filter: Filter = {
          mimeType: [".txt"]
        };

        let dirents = fs.listFileSync(dpath, {
          listNum: 2,
          recursion: false,
          filter: filter,
        });
        expect(false).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_sync_static_016 end error' + JSON.stringify(err));
        expect(err.code == 13900018 && err.message == 'Not a directory').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_async_static_000
     * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_0000
     * @tc.desc   Test listFile() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfile_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_async_static_000') ;
      let fpath1 = dpath + '/listfile_async_000.txt';
      let fpath2 = dpath + '/listfile_async_000.doc';
      let fpath3 = dpath + '/listfile_async_000.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        fs.listFile(dpath, (err: BusinessError | null, dirents: Array<string> | undefined) => {
          expect(dirents?.length == 3).assertTrue();
          fs.rmdirSync(dpath);
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_async_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_async_static_001
     * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_0100
     * @tc.desc   Test listFile() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfile_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_async_static_001');
      let fpath1 = dpath + '/listfile_async_001.txt';
      let fpath2 = dpath + '/listfile_async_001_1.doc';
      let fpath3 = dpath + '/listfile_async_001.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let dirents = await fs.listFile(dpath);
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_async_static_001 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_async_static_002
     * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_0200
     * @tc.desc   Test listFile() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfile_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_async_static_002');
      let fpath1 = dpath + '/listfile_async_002.txt';
      let fpath2 = dpath + '/listfile_async_002.doc';
      let fpath3 = dpath + '/listfile_async_002.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        fs.listFile(dpath, {
          listNum: 2,
          recursion: false
        }, (err: BusinessError | null, dirents: Array<string> | undefined) => {
          expect(dirents?.length == 2).assertTrue();
          fs.rmdirSync(dpath);
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_async_static_002 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_async_static_003
     * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_0300
     * @tc.desc   Test listFile() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfile_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_async_static_003');
      let fpath1 = dpath + '/listfile_async_003.txt';
      let fpath2 = dpath + '/listfile_async_003.doc';
      let fpath3 = dpath + '/listfile_async_003.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let dirents = await fs.listFile(dpath, {
          listNum: 2,
          recursion: false
        });
        expect(dirents.length == 2).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_async_static_003 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_async_static_004
     * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_0400
     * @tc.desc   Test listFile() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfile_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_async_static_004');
      let fpath1 = dpath + '/listfile_async_004.txt';
      let fpath2 = dpath + '/listfile_async_004.doc';
      let fpath3 = dpath + '/listfile_async_004.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let time = new Date().getTime() / 1000;
        let filter: Filter = {
          suffix: [".txt", ".doc", ".png"],
          displayName: ["*listfile*"],
          fileSizeOver: 0,
          lastModifiedAfter: time - 3
        };
        fs.listFile(dpath, {
          recursion: false,
          filter: filter
        }, (err: BusinessError | null, dirents: Array<string> | undefined) => {
          expect(dirents?.length == 3).assertTrue();
          fs.rmdirSync(dpath);
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_async_static_004 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_async_static_005
     * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_0500
     * @tc.desc   Test listFile() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfile_async_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_async_static_005');
      let fpath1 = dpath + '/listfile_async_005.txt';
      let fpath2 = dpath + '/listfile_async_005.doc';
      let fpath3 = dpath + '/listfile_async_005.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let time = new Date().getTime() / 1000;
        let filter: Filter = {
          suffix: [".txt", ".doc", ".png"],
          displayName: ["*listfile*"],
          fileSizeOver: 0,
          lastModifiedAfter: time - 3
        };
        let dirents = await fs.listFile(dpath, {
          recursion: false,
          filter: filter
        });
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_async_static_005 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_async_static_006
     * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_0600
     * @tc.desc   Test listFile() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfile_async_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_async_static_006');
      let fpath1 = dpath + '/listfile_async_006.txt';
      let fpath2 = dpath + '/listfile_async_006.doc';
      let fpath3 = dpath + '/listfile_async_006.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let time = new Date().getTime() / 1000;
        let filter: Filter = {
          displayName: ["*listfile*"],
          fileSizeOver: 5,
          lastModifiedAfter: time - 3
        };
        fs.listFile(dpath, {
          listNum: 4,
          recursion: false,
          filter: filter
        }, (err: BusinessError | null, dirents: Array<string> | undefined) => {
          expect(dirents?.length == 3).assertTrue();
          fs.rmdirSync(dpath);
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_async_static_006 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_async_static_007
     * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_0700
     * @tc.desc   Test listFile() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfile_async_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_async_static_007');
      let fpath1 = dpath + '/listfile_async_007.txt';
      let fpath2 = dpath + '/listfile_async_007.doc';
      let fpath3 = dpath + '/listfile_async_007.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let time = new Date().getTime() / 1000;
        let filter: Filter = {
          displayName: ["*listfile*"],
          fileSizeOver: 5,
          lastModifiedAfter: time - 3
        };
        let dirents = await fs.listFile(dpath, {
          listNum: 4,
          recursion: false,
          filter: filter
        });
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_async_static_007 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_async_static_008
     * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_0800
     * @tc.desc   Test listFile() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfile_async_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_async_static_008');
      let fpath1 = dpath + '/listfile_async_008.txt';
      let fpath2 = dpath + '/listfile_async_008.doc';
      let fpath3 = dpath + '/listfile_async_008.png';
      let ddpath = dpath + '/kids';
      let ffapth1 = ddpath + '/firstc.txt';
      let ffapth2 = ddpath + '/firsta.txt';
      let ffapth3 = ddpath + '/aabbcc.hap';
      let dddpath = ddpath + '/' + await Utils.randomString(5);
      let fffpath1 = dddpath + '/makef.doc';
      let fffpath2 = dddpath + '/akasd.txt';
      let fffpath3 = dddpath + '/tdd.log';
      let fffpath4 = dddpath + '/tdd.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      fs.mkdirSync(dddpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffapth1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffapth2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffapth3, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fffpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fffpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fffpath3, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fffpath4, FILE_CONTENT)).assertTrue();

      try {
        let time = new Date().getTime() / 1000;
        let filter: Filter = {
          suffix: [".txt", ".doc"],
          displayName: ["*listfile*", "*first*", "*akasd*", "*tdd*", "*makef*"],
          fileSizeOver: 0,
          lastModifiedAfter: time - 3
        };
        fs.listFile(dpath, {
          listNum: 6,
          recursion: true,
          filter: filter
        }, (err: BusinessError | null, dirents: Array<string> | undefined) => {
          expect(dirents?.length == 6).assertTrue();
          fs.rmdirSync(dpath);
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_async_static_008 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_async_static_009
     * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_0900
     * @tc.desc   Test listFile() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfile_async_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_async_static_009');
      let fpath1 = dpath + '/listfile_async_009.txt';
      let fpath2 = dpath + '/listfile_async_009.doc';
      let fpath3 = dpath + '/listfile_async_009.png';
      let ddpath = dpath + '/kids';
      let ffapth1 = ddpath + '/firstc.txt';
      let ffapth2 = ddpath + '/firsta.txt';
      let ffapth3 = ddpath + '/aabbcc.hap';
      let dddpath = ddpath + '/' + await Utils.randomString(5);
      let fffpath1 = dddpath + '/makef.doc';
      let fffpath2 = dddpath + '/akasd.txt';
      let fffpath3 = dddpath + '/tdd.log';
      let fffpath4 = dddpath + '/tdd.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      fs.mkdirSync(dddpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffapth1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffapth2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffapth3, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fffpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fffpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fffpath3, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fffpath4, FILE_CONTENT)).assertTrue();

      try {
        let time = new Date().getTime() / 1000;
        let filter: Filter = {
          suffix: [".txt", ".doc"],
          displayName: ["*listfile*", "*first*", "*akasd*", "*tdd*", "*makef*"],
          fileSizeOver: 0,
          lastModifiedAfter: time - 3
        };
        let dirents = await fs.listFile(dpath, {
          listNum: 6,
          recursion: true,
          filter: filter
        });
        expect(dirents.length == 6).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_async_static_009 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_async_static_010
     * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_1000
     * @tc.desc   Test listFile() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfile_async_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_async_static_010');
      let fapth1 = dpath + '/listfile_async_010.txt';
      let fapth2 = dpath + '/listfile_async_010.doc';
      let fapth3 = dpath + '/listfile_async_010.png';
      let fapth4 = dpath + '/timer.txt';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fapth1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fapth2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fapth3, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fapth4, FILE_CONTENT)).assertTrue();

      try {
        let time = new Date().getTime() / 1000;
        let filter: Filter = {
          suffix: [".txt"],
          displayName: ["*listfile*", "*time*"],
          fileSizeOver: 4,
          lastModifiedAfter: time - 3
        };
        fs.listFile(dpath, {
          listNum: 3,
          recursion: false,
          filter: filter
        }, (err: BusinessError | null, dirents: Array<string> | undefined) => {
          expect(dirents?.length == 2).assertTrue();
          fs.rmdirSync(dpath);
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_async_static_010 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_async_static_011
     * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_1100
     * @tc.desc   Test listFile() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfile_async_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_async_static_011');
      let fapth1 = dpath + '/listfile_async_011.txt';
      let fapth2 = dpath + '/listfile_async_011.doc';
      let fapth3 = dpath + '/listfile_async_011.png';
      let fapth4 = dpath + '/timer.txt';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fapth1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fapth2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fapth3, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fapth4, FILE_CONTENT)).assertTrue();

      try {
        let time = new Date().getTime() / 1000;
        let filter: Filter = {
          suffix: [".txt"],
          displayName: ["*listfile*", "*time*"],
          fileSizeOver: 4,
          lastModifiedAfter: time - 3
        };
        let dirents = await fs.listFile(dpath, {
          listNum: 3,
          recursion: false,
          filter: filter
        });
        expect(dirents.length == 2).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_async_static_011 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_async_static_012
     * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_1200
     * @tc.desc   Test listFile() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfile_async_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_async_static_012');
      let fapth1 = dpath + '/listfile_async_012.txt';
      let fapth2 = dpath + '/listfile_async_012.doc';
      let fapth3 = dpath + '/listfile_async_012.png';
      let fapth4 = dpath + '/timer.txt';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fapth1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fapth2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fapth3, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fapth4, FILE_CONTENT)).assertTrue();

      try {
        let time = new Date().getTime() / 1000;
        let filter: Filter = {
          suffix: ["%.txt%"],
          displayName: ["*listfile*"],
          fileSizeOver: 0,
          lastModifiedAfter: time -3
        };
        fs.listFile(dpath, {
          listNum: 3,
          recursion: false,
          filter: filter
        }, (err: BusinessError | null) => {
          if(err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_async_static_012 error' + JSON.stringify(err));
            expect(err?.code == 13900020 && err?.message == 'Invalid argument').assertTrue();
            fs.rmdirSync(dpath);
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_async_static_012 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_async_static_013
     * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_1300
     * @tc.desc   Test listFile() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_listfile_async_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_async_static_013');
      let fapth1 = dpath + '/listfile_async_013.txt';
      let fapth2 = dpath + '/listfile_async_013.doc';
      let fapth3 = dpath + '/listfile_async_013.png';
      let fapth4 = dpath + '/timer.txt';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fapth1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fapth2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fapth3, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fapth4, FILE_CONTENT)).assertTrue();

      try {
        let time = new Date().getTime() / 1000;
        let filter: Filter = {
          suffix: ["%.txt%"],
          displayName: ["*listfile*"],
          fileSizeOver: 0,
          lastModifiedAfter: time -3
        };
        await fs.listFile(dpath, {
          listNum: 3,
          recursion: false,
          filter: filter
        });
        expect(false).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_async_static_013 end error' + JSON.stringify(err));
        expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
        fs.rmdirSync(dpath);
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_async_static_014
     * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_1400
     * @tc.desc   Test listFile() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_listfile_async_static_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_async_static_014');
      let fapth1 = dpath + '/listfile_async_014.txt';
      let fapth2 = dpath + '/listfile_async_014.doc';
      let fapth3 = dpath + '/listfile_async_014.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fapth1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fapth2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fapth3, FILE_CONTENT)).assertTrue();

      try {
        let time = new Date().getTime() / 1000;
        let filter: Filter = {
          suffix: [".txt"],
          displayName: ["*listfile*"],
          fileSizeOver: 12,
          lastModifiedAfter: time - 3
        };
        fs.listFile(dpath, {
          listNum: 3,
          recursion: false,
          filter: filter
        }, (err: BusinessError | null, dirents: Array<string> | undefined) => {
          expect(dirents?.length == 0).assertTrue();
          fs.rmdirSync(dpath);
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_async_static_014 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_async_static_015
     * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_1500
     * @tc.desc   Test listFile() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_listfile_async_static_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_async_static_015');
      let fapth1 = dpath + '/listfile_async_015.txt';
      let fapth2 = dpath + '/listfile_async_015.doc';
      let fapth3 = dpath + '/listfile_async_015.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fapth1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fapth2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fapth3, FILE_CONTENT)).assertTrue();

      try {
        let time = new Date().getTime() / 1000;
        let filter: Filter = {
          suffix: [".txt"],
          displayName: ["*listfile*"],
          fileSizeOver: 12,
          lastModifiedAfter: time - 3
        };
        let dirents = await fs.listFile(dpath, {
          listNum: 3,
          recursion: false,
          filter: filter
        });
        expect(dirents.length == 0).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_async_static_015 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_async_static_016
     * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_1600
     * @tc.desc   Test listFile() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_listfile_async_static_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_async_static_016');
      let fapth1 = dpath + '/listfile_async_016.txt';
      let fapth2 = dpath + '/listfile_async_016.doc';
      let fapth3 = dpath + '/listfile_async_016.png';
      let fapth4 = dpath + '/trespass.txt';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fapth1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fapth2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fapth3, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fapth4, FILE_CONTENT)).assertTrue();

      try {
        let time = new Date().getTime() / 1000;
        let filter: Filter = {
          suffix: [".txt"],
          displayName: ["*listfile*", "*trespass*"],
          fileSizeOver: 5,
          lastModifiedAfter: time - 3
        };
        fs.listFile(dpath, {
          listNum: 0,
          recursion: false,
          filter: filter
        }, (err: BusinessError | null, dirents: Array<string> | undefined) => {
          expect(dirents?.length == 2).assertTrue();
          fs.rmdirSync(dpath);
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_async_static_016 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_async_static_017
     * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_1700
     * @tc.desc   Test listFile() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_listfile_async_static_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_async_static_017');
      let fapth1 = dpath + '/listfile_async_017.txt';
      let fapth2 = dpath + '/listfile_async_017.doc';
      let fapth3 = dpath + '/listfile_async_017.png';
      let fapth4 = dpath + '/trespass.txt';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fapth1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fapth2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fapth3, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fapth4, FILE_CONTENT)).assertTrue();

      try {
        let time = new Date().getTime() / 1000;
        let filter: Filter = {
          suffix: [".txt"],
          displayName: ["*listfile*", "*trespass*"],
          fileSizeOver: 5,
          lastModifiedAfter: time - 3
        };
        let dirents = await fs.listFile(dpath, {
          listNum: 0,
          recursion: false,
          filter: filter
        });
        expect(dirents.length == 2).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_async_static_017 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_async_static_022
     * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_2200
     * @tc.desc   Test listFile() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_listfile_async_static_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_async_static_022');
      let ddpath = dpath + '/second_dir';
      let fpath1 = dpath + '/listfile_async_022.txt';
      let fpath2 = dpath + '/listfile_async_022.doc';
      let fpath3 = dpath + '/listfile_async_022.png';
      let ffpath1 = ddpath + '/listfile_sync_second_022.txt';
      let ffpath2 = ddpath + '/listfile_sync_second_022.doc';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath2, FILE_CONTENT)).assertTrue();

      try {
        let filter: Filter = {
          displayName: undefined,
          fileSizeOver: undefined,
          lastModifiedAfter: undefined
        };
        let dirents = await fs.listFile(dpath, {
          listNum: undefined,
          recursion: undefined,
          filter: filter
        });
        expect(dirents.length == 4).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_async_static_022 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_async_static_023
     * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_2300
     * @tc.desc   Test listFile() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_listfile_async_static_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_async_static_023');
      let ddpath = dpath + '/second_dir';
      let fpath1 = dpath + '/listfile_async_023.txt';
      let fpath2 = dpath + '/listfile_async_023.doc';
      let fpath3 = dpath + '/listfile_async_023.png';
      let ffpath1 = ddpath + '/listfile_sync_second_023.txt';
      let ffpath2 = ddpath + '/listfile_sync_second_023.doc';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath2, FILE_CONTENT)).assertTrue();

      try {
        let dirents = await fs.listFile(dpath, undefined);
        expect(dirents.length == 4).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_async_static_023 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_async_static_024
     * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_2400
     * @tc.desc   Test listFile() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_listfile_async_static_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_async_static_024');
      let fpath1 = dpath + '/listfile_async_024.txt';
      let fpath2 = dpath + '/listfile_async_024.doc';
      let fpath3 = dpath + '/listfile_async_024.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let time = new Date().getTime() / 1000;
        let filter: Filter = {
          suffix: [".txt", ".doc", ".png"],
          displayName: ["*listfile*"],
          fileSizeOver: 0,
          lastModifiedAfter: time - 3,
          excludeMedia: false
        };
        fs.listFile(dpath, {
          listNum: 0,
          recursion: false,
          filter: filter
        }, (err: BusinessError | null, dirents: Array<string> | undefined) => {
          expect(dirents?.length == 3).assertTrue();
          fs.rmdirSync(dpath);
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_async_static_024 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_async_static_025
     * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_2500
     * @tc.desc   Test listFile() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_listfile_async_static_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_async_static_025');
      let fpath1 = dpath + '/listfile_async_025.txt';
      let fpath2 = dpath + '/listfile_async_025.doc';
      let fpath3 = dpath + '/listfile_async_025.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let time = new Date().getTime() / 1000;
        let filter: Filter = {
          suffix: [".txt", ".doc", ".png"],
          displayName: ["*listfile*"],
          fileSizeOver: 0,
          lastModifiedAfter: time - 3,
          excludeMedia: false
        };
        let dirents = await fs.listFile(dpath, {
          listNum: 0,
          recursion: false,
          filter: filter
        });
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_async_static_025 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_async_static_026
     * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_2600
     * @tc.desc   Test listFile() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfile_async_static_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_async_static_026');

      try {
        fs.listFile(dpath, (err: BusinessError | null, dirents: Array<string> | undefined) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_async_static_026 err package ' + err?.message + ', code:' + err?.code);
            expect(err?.code == 13900002 && err?.message == 'No such file or directory').assertTrue();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_async_static_026 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_async_static_027
     * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_2700
     * @tc.desc   Test listFile() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfile_async_static_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_async_static_027');

      try {
        await fs.listFile(dpath);
        expect(false).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_async_static_027 end error' + JSON.stringify(err));
        expect(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_async_static_028
     * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_2800
     * @tc.desc   Test listFile() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfile_async_static_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_async_static_028');
      expect(await Utils.prepareFile(dpath, FILE_CONTENT)).assertTrue();

      try {
        await fs.listFile(dpath);
        expect(false).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_async_static_028 end error' + JSON.stringify(err));
        expect(err.code == 13900018 && err.message == 'Not a directory').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfile_async_static_029
     * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_2900
     * @tc.desc   Test listFile() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfile_async_static_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_async_static_029');
      expect(await Utils.prepareFile(dpath, FILE_CONTENT)).assertTrue();

      try {
        fs.listFile(dpath, (err: BusinessError | null, dirents: Array<string> | undefined) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_async_static_029 err package ' + err?.message + ', code:' + err?.code);
            expect(err?.code == 13900018 && err?.message == 'Not a directory').assertTrue();
          }
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_async_static_029 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });
  });
}