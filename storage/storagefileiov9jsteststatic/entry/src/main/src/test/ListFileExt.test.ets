/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { FileFilter, ListFileExtOptions } from '@ohos.file.fs';
import { BusinessError } from '@ohos.base'

let domain: int = 0x0000
let tag: string = 'testTag';

export const FILE_CONTENT = 'hello world';

export default function fileIOListFileExtStatic() {
  describe('fileIO_fs_listfileext_static', (): void => {

    /**
     * @tc.name   fileIO_test_listfileext_sync_static_000
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_STATIC_0000
     * @tc.desc   Test listFileExtSync() interfaces. Normal test without options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_sync_static_000');
      let fpath1 = dpath + '/listfileext_sync_000.txt';
      let fpath2 = dpath + '/listfileext_sync_000.doc';
      let fpath3 = dpath + '/listfileext_sync_000.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let dirents = fs.listFileExtSync(dpath);
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_sync_static_000 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_sync_static_001
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_STATIC_0100
     * @tc.desc   Test listFileExtSync() interfaces. recursion=false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_sync_static_001');
      let fpath1 = dpath + '/listfileext_sync_001.txt';
      let fpath2 = dpath + '/listfileext_sync_001.doc';
      let fpath3 = dpath + '/listfileext_sync_001.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let options: ListFileExtOptions = {
          recursion: false
        };
        let dirents = fs.listFileExtSync(dpath, options);
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_sync_static_001 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_sync_static_002
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_STATIC_0200
     * @tc.desc   Test listFileExtSync() interfaces. listNum=2 limit return count.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_sync_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_sync_static_002');
      let fpath1 = dpath + '/listfileext_sync_002.txt';
      let fpath2 = dpath + '/listfileext_sync_002.doc';
      let fpath3 = dpath + '/listfileext_sync_002.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let options: ListFileExtOptions = {
          listNum: 2,
          recursion: false
        };
        let dirents = fs.listFileExtSync(dpath, options);
        expect(dirents.length == 2).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_sync_static_002 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_sync_static_003
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_STATIC_0300
     * @tc.desc   Test listFileExtSync() interfaces. recursion=true list subdirectories.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_sync_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_sync_static_003');
      let fpath1 = dpath + '/listfileext_sync_003.txt';
      let fpath2 = dpath + '/listfileext_sync_003.doc';
      let ddpath = dpath + '/subdir';
      let ffpath1 = ddpath + '/sub1.txt';
      let ffpath2 = ddpath + '/sub2.doc';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath2, FILE_CONTENT)).assertTrue();

      try {
        let options: ListFileExtOptions = {
          recursion: true
        };
        let dirents = fs.listFileExtSync(dpath, options);
        expect(dirents.length == 4).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_sync_static_003 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_sync_static_004
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_STATIC_0400
     * @tc.desc   Test listFileExtSync() interfaces. fileFilter filter .txt files.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_sync_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_sync_static_004');
      let fpath1 = dpath + '/listfileext_sync_004.txt';
      let fpath2 = dpath + '/listfileext_sync_004.doc';
      let fpath3 = dpath + '/listfileext_sync_004.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let filter: FileFilter = {
          filter: (name: string): boolean => {
            return name.endsWith('.txt');
          }
        };
        let options: ListFileExtOptions = {
          fileFilter: filter
        };
        let dirents = fs.listFileExtSync(dpath, options);
        expect(dirents.length == 1).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_sync_static_004 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_sync_static_005
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_STATIC_0500
     * @tc.desc   Test listFileExtSync() interfaces. fileFilter return true include all.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_sync_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_sync_static_005');
      let fpath1 = dpath + '/listfileext_sync_005.txt';
      let fpath2 = dpath + '/listfileext_sync_005.doc';
      let fpath3 = dpath + '/listfileext_sync_005.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let filter: FileFilter = {
          filter: (name: string): boolean => {
            return true;
          }
        };
        let options: ListFileExtOptions = {
          fileFilter: filter
        };
        let dirents = fs.listFileExtSync(dpath, options);
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_sync_static_005 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_sync_static_006
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_STATIC_0600
     * @tc.desc   Test listFileExtSync() interfaces. fileFilter return false exclude all.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_sync_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_sync_static_006');
      let fpath1 = dpath + '/listfileext_sync_006.txt';
      let fpath2 = dpath + '/listfileext_sync_006.doc';
      let fpath3 = dpath + '/listfileext_sync_006.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let filter: FileFilter = {
          filter: (name: string): boolean => {
            return false;
          }
        };
        let options: ListFileExtOptions = {
          fileFilter: filter
        };
        let dirents = fs.listFileExtSync(dpath, options);
        expect(dirents.length == 0).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_sync_static_006 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_sync_static_007
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_STATIC_0700
     * @tc.desc   Test listFileExtSync() interfaces. recursion=true with fileFilter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_sync_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_sync_static_007');
      let fpath1 = dpath + '/listfileext_sync_007.txt';
      let fpath2 = dpath + '/listfileext_sync_007.doc';
      let ddpath = dpath + '/subdir';
      let ffpath1 = ddpath + '/sub1.txt';
      let ffpath2 = ddpath + '/sub2.doc';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath2, FILE_CONTENT)).assertTrue();

      try {
        let filter: FileFilter = {
          filter: (name: string): boolean => {
            return name.endsWith('.txt');
          }
        };
        let options: ListFileExtOptions = {
          recursion: true,
          fileFilter: filter
        };
        let dirents = fs.listFileExtSync(dpath, options);
        expect(dirents.length == 2).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_sync_static_007 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_sync_static_008
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_STATIC_0800
     * @tc.desc   Test listFileExtSync() interfaces. listNum=0 list all files.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_sync_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_sync_static_008');
      let fpath1 = dpath + '/listfileext_sync_008.txt';
      let fpath2 = dpath + '/listfileext_sync_008.doc';
      let fpath3 = dpath + '/listfileext_sync_008.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let options: ListFileExtOptions = {
          listNum: 0
        };
        let dirents = fs.listFileExtSync(dpath, options);
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_sync_static_008 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_sync_static_009
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_STATIC_0900
     * @tc.desc   Test listFileExtSync() interfaces. Path not exist error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_sync_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_sync_static_009');

      try {
        let options: ListFileExtOptions = {
          listNum: 2,
          recursion: false
        };
        fs.listFileExtSync(dpath, options);
        expect(false).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_sync_static_009 end error' + err.message);
        expect(err.code === 13900002 && err.message == 'No such file or directory').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_sync_static_010
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_STATIC_1000
     * @tc.desc   Test listFileExtSync() interfaces. Path is file not directory error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_sync_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_sync_static_010');
      expect(await Utils.prepareFile(dpath, FILE_CONTENT)).assertTrue();

      try {
        let options: ListFileExtOptions = {
          listNum: 2,
          recursion: false
        };
        fs.listFileExtSync(dpath, options);
        expect(false).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_sync_static_010 end error' + err.message);
        expect(err.code === 13900018 && err.message == 'Not a directory').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_sync_static_011
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_STATIC_1100
     * @tc.desc   Test listFileExtSync() interfaces. Empty path error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_sync_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      try {
        let options: ListFileExtOptions = {
          listNum: 2,
          recursion: false
        };
        fs.listFileExtSync("", options);
        expect(false).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_sync_static_011 end error ' + err.message);
        expect(err.code === 13900002 && err.message == 'No such file or directory').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_sync_static_012
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_STATIC_1200
     * @tc.desc   Test listFileExtSync() interfaces. options=undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_sync_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_sync_static_012');
      let fpath1 = dpath + '/listfileext_sync_012.txt';
      let fpath2 = dpath + '/listfileext_sync_012.doc';
      let fpath3 = dpath + '/listfileext_sync_012.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let dirents = fs.listFileExtSync(dpath, undefined);
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_sync_static_012 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_sync_static_013
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_STATIC_1300
     * @tc.desc   Test listFileExtSync() interfaces. listNum negative error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_sync_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_sync_static_013');
      let fpath1 = dpath + '/listfileext_sync_013.txt';
      let fpath2 = dpath + '/listfileext_sync_013.doc';
      let fpath3 = dpath + '/listfileext_sync_013.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let options: ListFileExtOptions = {
          listNum: -1
        };
        fs.listFileExtSync(dpath, options);
        expect(false).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        fs.rmdirSync(dpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_sync_static_013 end error' + err.message);
        expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_sync_static_014
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_STATIC_1400
     * @tc.desc   Test listFileExtSync() interfaces. listNum exceed actual file count boundary test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_sync_static_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_sync_static_014');
      let fpath1 = dpath + '/listfileext_sync_014.txt';
      let fpath2 = dpath + '/listfileext_sync_014.doc';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();

      try {
        let options: ListFileExtOptions = {
          listNum: 10
        };
        let dirents = fs.listFileExtSync(dpath, options);
        expect(dirents.length == 2).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_sync_static_014 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_sync_static_015
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_STATIC_1500
     * @tc.desc   Test listFileExtSync() interfaces. options={} empty object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_sync_static_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_sync_static_015');
      let fpath1 = dpath + '/listfileext_sync_015.txt';
      let fpath2 = dpath + '/listfileext_sync_015.doc';
      let fpath3 = dpath + '/listfileext_sync_015.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let options: ListFileExtOptions = {};
        let dirents = fs.listFileExtSync(dpath, options);
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_sync_static_015 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_sync_static_016
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_STATIC_1600
     * @tc.desc   Test listFileExtSync() interfaces. Deep nested directory recursion=true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_sync_static_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_sync_static_016');
      let fpath1 = dpath + '/file1.txt';
      let ddpath = dpath + '/level1';
      let ffpath1 = ddpath + '/file2.txt';
      let dddpath = ddpath + '/level2';
      let fffpath1 = dddpath + '/file3.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      fs.mkdirSync(dddpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fffpath1, FILE_CONTENT)).assertTrue();

      try {
        let options: ListFileExtOptions = {
          recursion: true
        };
        let dirents = fs.listFileExtSync(dpath, options);
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_sync_static_016 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_sync_static_017
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_STATIC_1700
     * @tc.desc   Test listFileExtSync() interfaces. fileFilter includes specific string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_sync_static_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_sync_static_017');
      let fpath1 = dpath + '/test_file.txt';
      let fpath2 = dpath + '/other_file.doc';
      let fpath3 = dpath + '/test_file.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let filter: FileFilter = {
          filter: (name: string): boolean => {
            return name.includes('test');
          }
        };
        let options: ListFileExtOptions = {
          fileFilter: filter
        };
        let dirents = fs.listFileExtSync(dpath, options);
        expect(dirents.length == 2).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_sync_static_017 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_sync_static_018
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_STATIC_1800
     * @tc.desc   Test listFileExtSync() interfaces. recursion+listNum+fileFilter combination.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_sync_static_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_sync_static_018');
      let fpath1 = dpath + '/test1.txt';
      let fpath2 = dpath + '/other.doc';
      let ddpath = dpath + '/subdir';
      let ffpath1 = ddpath + '/test2.txt';
      let ffpath2 = ddpath + '/other.doc';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath2, FILE_CONTENT)).assertTrue();

      try {
        let filter: FileFilter = {
          filter: (name: string): boolean => {
            return name.endsWith('.txt');
          }
        };
        let options: ListFileExtOptions = {
          recursion: true,
          listNum: 2,
          fileFilter: filter
        };
        let dirents = fs.listFileExtSync(dpath, options);
        expect(dirents.length == 2).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_sync_static_018 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_sync_static_019
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_STATIC_1900
     * @tc.desc   Test listFileExtSync() interfaces. recursion=true with listNum.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_sync_static_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_sync_static_019');
      let fpath1 = dpath + '/file1.txt';
      let fpath2 = dpath + '/file2.doc';
      let ddpath = dpath + '/subdir';
      let ffpath1 = ddpath + '/file3.txt';
      let ffpath2 = ddpath + '/file4.doc';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath2, FILE_CONTENT)).assertTrue();

      try {
        let options: ListFileExtOptions = {
          recursion: true,
          listNum: 3
        };
        let dirents = fs.listFileExtSync(dpath, options);
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_sync_static_019 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_sync_static_020
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_STATIC_2000
     * @tc.desc   Test listFileExtSync() interfaces. Empty directory.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_sync_static_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_sync_static_020');
      fs.mkdirSync(dpath);

      try {
        let dirents = fs.listFileExtSync(dpath);
        expect(dirents.length == 0).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_sync_static_020 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_sync_static_021
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_STATIC_2100
     * @tc.desc   Test listFileExtSync() interfaces. fileFilter filter .txt files.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_sync_static_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_sync_static_021');
      let fpath1 = dpath + '/listfileext_sync_004.txt';
      let fpath2 = dpath + '/listfileext_sync_004.doc';
      let fpath3 = dpath + '/listfileext_sync_004.png';
      let fpath4 = dpath + '/listfileext_sync_044.TXT';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath4, FILE_CONTENT)).assertTrue();

      try {
        let filter: FileFilter = {
          filter: (name: string): boolean => {
            const regex = new RegExp('\\.(TXT)$', 'i');
            return regex.test(name);
          }
        };
        let options: ListFileExtOptions = {
          fileFilter: filter
        };
        let dirents = fs.listFileExtSync(dpath, options);
        expect(dirents.length == 2).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_sync_static_021 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_async_static_000
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_STATIC_0000
     * @tc.desc   Test listFileExt() interfaces. Promise. Normal test without options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_async_static_000');
      let fpath1 = dpath + '/listfileext_async_000.txt';
      let fpath2 = dpath + '/listfileext_async_000.doc';
      let fpath3 = dpath + '/listfileext_async_000.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let dirents = await fs.listFileExt(dpath);
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_async_static_000 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_async_static_001
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_STATIC_0100
     * @tc.desc   Test listFileExt() interfaces. Promise. recursion=false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_async_static_001');
      let fpath1 = dpath + '/listfileext_async_001.txt';
      let fpath2 = dpath + '/listfileext_async_001.doc';
      let fpath3 = dpath + '/listfileext_async_001.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let options: ListFileExtOptions = {
          recursion: false
        };
        let dirents = await fs.listFileExt(dpath, options);
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_async_static_001 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_async_static_002
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_STATIC_0200
     * @tc.desc   Test listFileExt() interfaces. Promise. listNum=2 limit return count.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_async_static_002');
      let fpath1 = dpath + '/listfileext_async_002.txt';
      let fpath2 = dpath + '/listfileext_async_002.doc';
      let fpath3 = dpath + '/listfileext_async_002.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let options: ListFileExtOptions = {
          listNum: 2,
          recursion: false
        };
        let dirents = await fs.listFileExt(dpath, options);
        expect(dirents.length == 2).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_async_static_002 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_async_static_003
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_STATIC_0300
     * @tc.desc   Test listFileExt() interfaces. Promise. recursion=true list subdirectories.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_async_static_003');
      let fpath1 = dpath + '/listfileext_async_003.txt';
      let fpath2 = dpath + '/listfileext_async_003.doc';
      let ddpath = dpath + '/subdir';
      let ffpath1 = ddpath + '/sub1.txt';
      let ffpath2 = ddpath + '/sub2.doc';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath2, FILE_CONTENT)).assertTrue();

      try {
        let options: ListFileExtOptions = {
          recursion: true
        };
        let dirents = await fs.listFileExt(dpath, options);
        expect(dirents.length == 4).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_async_static_003 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_async_static_004
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_STATIC_0400
     * @tc.desc   Test listFileExt() interfaces. Promise. fileFilter filter .txt files.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_async_static_004');
      let fpath1 = dpath + '/listfileext_async_004.txt';
      let fpath2 = dpath + '/listfileext_async_004.doc';
      let fpath3 = dpath + '/listfileext_async_004.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let filter: FileFilter = {
          filter: (name: string): boolean => {
            return name.endsWith('.txt');
          }
        };
        let options: ListFileExtOptions = {
          fileFilter: filter
        };
        let dirents = await fs.listFileExt(dpath, options);
        expect(dirents.length == 1).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_async_static_004 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_async_static_005
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_STATIC_0500
     * @tc.desc   Test listFileExt() interfaces. Promise. recursion=true with fileFilter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_async_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_async_static_005');
      let fpath1 = dpath + '/listfileext_async_005.txt';
      let fpath2 = dpath + '/listfileext_async_005.doc';
      let ddpath = dpath + '/subdir';
      let ffpath1 = ddpath + '/sub1.txt';
      let ffpath2 = ddpath + '/sub2.doc';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath2, FILE_CONTENT)).assertTrue();

      try {
        let filter: FileFilter = {
          filter: (name: string): boolean => {
            return name.endsWith('.txt');
          }
        };
        let options: ListFileExtOptions = {
          recursion: true,
          fileFilter: filter
        };
        let dirents = await fs.listFileExt(dpath, options);
        expect(dirents.length == 2).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_async_static_005 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_async_static_006
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_STATIC_0600
     * @tc.desc   Test listFileExt() interfaces. Promise. Path not exist error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_async_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_async_static_006');

      try {
        let options: ListFileExtOptions = {
          listNum: 2,
          recursion: false
        };
        await fs.listFileExt(dpath, options);
        expect(false).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_async_static_006 end error' + err.message);
        expect(err.code === 13900002 && err.message == 'No such file or directory').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_async_static_007
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_STATIC_0700
     * @tc.desc   Test listFileExt() interfaces. Promise. Path is file not directory error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_async_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_async_static_007');
      expect(await Utils.prepareFile(dpath, FILE_CONTENT)).assertTrue();

      try {
        let options: ListFileExtOptions = {
          listNum: 2,
          recursion: false
        };
        await fs.listFileExt(dpath, options);
        expect(false).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_async_static_007 end error' + err.message);
        expect(err.code === 13900018 && err.message == 'Not a directory').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_async_static_008
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_STATIC_0800
     * @tc.desc   Test listFileExt() interfaces. Promise. options=undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_async_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_async_static_008');
      let fpath1 = dpath + '/listfileext_async_008.txt';
      let fpath2 = dpath + '/listfileext_async_008.doc';
      let fpath3 = dpath + '/listfileext_async_008.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let dirents = await fs.listFileExt(dpath, undefined);
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_async_static_008 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_async_static_009
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_STATIC_0900
     * @tc.desc   Test listFileExt() interfaces. Promise. listNum=0 list all files.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_async_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_async_static_009');
      let fpath1 = dpath + '/listfileext_async_009.txt';
      let fpath2 = dpath + '/listfileext_async_009.doc';
      let fpath3 = dpath + '/listfileext_async_009.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let options: ListFileExtOptions = {
          listNum: 0
        };
        let dirents = await fs.listFileExt(dpath, options);
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_async_static_009 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_async_static_010
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_STATIC_1000
     * @tc.desc   Test listFileExt() interfaces. Promise. listNum negative error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_async_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_async_static_010');
      let fpath1 = dpath + '/listfileext_async_010.txt';
      let fpath2 = dpath + '/listfileext_async_010.doc';
      let fpath3 = dpath + '/listfileext_async_010.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let options: ListFileExtOptions = {
          listNum: -1
        };
        await fs.listFileExt(dpath, options);
        expect(false).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        fs.rmdirSync(dpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_async_static_010 end error' + err.message);
        expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_async_static_011
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_STATIC_1100
     * @tc.desc   Test listFileExt() interfaces. Promise. listNum exceed actual file count boundary test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_async_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_async_static_011');
      let fpath1 = dpath + '/listfileext_async_011.txt';
      let fpath2 = dpath + '/listfileext_async_011.doc';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();

      try {
        let options: ListFileExtOptions = {
          listNum: 10
        };
        let dirents = await fs.listFileExt(dpath, options);
        expect(dirents.length == 2).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_async_static_011 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_async_static_012
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_STATIC_1200
     * @tc.desc   Test listFileExt() interfaces. Promise. options={} empty object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_async_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_async_static_012');
      let fpath1 = dpath + '/listfileext_async_012.txt';
      let fpath2 = dpath + '/listfileext_async_012.doc';
      let fpath3 = dpath + '/listfileext_async_012.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let options: ListFileExtOptions = {};
        let dirents = await fs.listFileExt(dpath, options);
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_async_static_012 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_async_static_013
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_STATIC_1300
     * @tc.desc   Test listFileExt() interfaces. Promise. Deep nested directory recursion=true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_async_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_async_static_013');
      let fpath1 = dpath + '/file1.txt';
      let ddpath = dpath + '/level1';
      let ffpath1 = ddpath + '/file2.txt';
      let dddpath = ddpath + '/level2';
      let fffpath1 = dddpath + '/file3.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      fs.mkdirSync(dddpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fffpath1, FILE_CONTENT)).assertTrue();

      try {
        let options: ListFileExtOptions = {
          recursion: true
        };
        let dirents = await fs.listFileExt(dpath, options);
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_async_static_013 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_async_static_014
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_STATIC_1400
     * @tc.desc   Test listFileExt() interfaces. Promise. fileFilter includes specific string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_async_static_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_async_static_014');
      let fpath1 = dpath + '/test_file.txt';
      let fpath2 = dpath + '/other_file.doc';
      let fpath3 = dpath + '/test_file.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let filter: FileFilter = {
          filter: (name: string): boolean => {
            return name.includes('test');
          }
        };
        let options: ListFileExtOptions = {
          fileFilter: filter
        };
        let dirents = await fs.listFileExt(dpath, options);
        expect(dirents.length == 2).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_async_static_014 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_async_static_015
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_STATIC_1500
     * @tc.desc   Test listFileExt() interfaces. Promise. recursion+listNum+fileFilter combination.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_async_static_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_async_static_015');
      let fpath1 = dpath + '/test1.txt';
      let fpath2 = dpath + '/other.doc';
      let ddpath = dpath + '/subdir';
      let ffpath1 = ddpath + '/test2.txt';
      let ffpath2 = ddpath + '/other.doc';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath2, FILE_CONTENT)).assertTrue();

      try {
        let filter: FileFilter = {
          filter: (name: string): boolean => {
            return name.endsWith('.txt');
          }
        };
        let options: ListFileExtOptions = {
          recursion: true,
          listNum: 2,
          fileFilter: filter
        };
        let dirents = await fs.listFileExt(dpath, options);
        expect(dirents.length == 2).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_async_static_015 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_async_static_016
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_STATIC_1600
     * @tc.desc   Test listFileExt() interfaces. Promise. recursion=true with listNum.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_async_static_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_async_static_016');
      let fpath1 = dpath + '/file1.txt';
      let fpath2 = dpath + '/file2.doc';
      let ddpath = dpath + '/subdir';
      let ffpath1 = ddpath + '/file3.txt';
      let ffpath2 = ddpath + '/file4.doc';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath2, FILE_CONTENT)).assertTrue();

      try {
        let options: ListFileExtOptions = {
          recursion: true,
          listNum: 3
        };
        let dirents = await fs.listFileExt(dpath, options);
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_async_static_016 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_async_static_017
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_STATIC_1700
     * @tc.desc   Test listFileExt() interfaces. Promise. Empty directory.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_async_static_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_async_static_017');
      fs.mkdirSync(dpath);

      try {
        let dirents = await fs.listFileExt(dpath);
        expect(dirents.length == 0).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_async_static_017 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_async_static_018
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_STATIC_1800
     * @tc.desc   Test listFileExt() interfaces. Promise. fileFilter return false exclude all.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_async_static_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_async_static_018');
      let fpath1 = dpath + '/listfileext_async_018.txt';
      let fpath2 = dpath + '/listfileext_async_018.doc';
      let fpath3 = dpath + '/listfileext_async_018.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let filter: FileFilter = {
          filter: (name: string): boolean => {
            return false;
          }
        };
        let options: ListFileExtOptions = {
          fileFilter: filter
        };
        let dirents = await fs.listFileExt(dpath, options);
        expect(dirents.length == 0).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_async_static_018 end error' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_async_static_019
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_STATIC_1900
     * @tc.desc   Test listFileExt() interfaces. Promise. Empty directory.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_async_static_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      try {
        await fs.listFileExt('');
        expect(false).assertTrue();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_async_static_019 end error' + err.message);
        expect(err.code === 13900002 && err.message == 'No such file or directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_listfileext_async_static_020
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_STATIC_2000
     * @tc.desc   Test listFileExt() interfaces. Promise. fileFilter filter .txt files.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_listfileext_async_static_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfileext_async_static_020');
      let fpath1 = dpath + '/listfileext_async_004.txt';
      let fpath2 = dpath + '/listfileext_async_004.doc';
      let fpath3 = dpath + '/listfileext_async_004.png';
      let fpath4 = dpath + '/listfileext_async_044.TXT';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath4, FILE_CONTENT)).assertTrue();

      try {
        let filter: FileFilter = {
          filter: (name: string): boolean => {
            const regex = new RegExp('\\.(TXT)$', 'i');
            return regex.test(name);
          }
        };
        let options: ListFileExtOptions = {
          recursion: false,
          listNum: 0,
          fileFilter: filter
        };
        let dirents = await fs.listFileExt(dpath, options);
        expect(dirents.length == 2).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfileext_async_static_020 end error' + err.message);
        expect(false).assertTrue();
      }
    });
  });
}