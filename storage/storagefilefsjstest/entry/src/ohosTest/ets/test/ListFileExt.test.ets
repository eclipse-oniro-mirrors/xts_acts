/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium";
import { fs, nextFileName, prepareFile, FILE_CONTENT} from "./Common.test.ets";
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { ListFileExtOptions, FileFilter } from '@ohos.file.fs';


let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;

export default function ListFileExtTest() {
  abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  let context = abilityDelegator.getAppContext();
  let data = context.filesDir;
  console.log('ListFileExtTest data ' + data);
  describe("ListFileExtTest", () => {

    /**
     * @tc.name   filefs_test_listfileext_sync_000
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_0000
     * @tc.desc   Test listFileExtSync() interfaces. Normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_sync_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_sync_000');
      let fpath1 = dpath + '/listfileext_sync_000.txt';
      let fpath2 = dpath + '/listfileext_sync_000.doc';
      let fpath3 = dpath + '/listfileext_sync_000.png';
      fs.mkdirSync(dpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let dirents = fs.listFileExtSync(dpath);
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        console.log('filefs_test_listfileext_sync_000 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_sync_001
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_0100
     * @tc.desc   Test listFileExtSync() interfaces. With recursion=false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_sync_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_sync_001');
      let fpath1 = dpath + '/listfileext_sync_001.txt';
      let fpath2 = dpath + '/listfileext_sync_001.doc';
      let fpath3 = dpath + '/listfileext_sync_001.png';
      fs.mkdirSync(dpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let dirents = fs.listFileExtSync(dpath, {
          recursion: false
        });
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        console.log('filefs_test_listfileext_sync_001 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_sync_002
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_0200
     * @tc.desc   Test listFileExtSync() interfaces. With listNum=2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_sync_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_sync_002');
      let fpath1 = dpath + '/listfileext_sync_002.txt';
      let fpath2 = dpath + '/listfileext_sync_002.doc';
      let fpath3 = dpath + '/listfileext_sync_002.png';
      fs.mkdirSync(dpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let dirents = fs.listFileExtSync(dpath, {
          listNum: 2,
          recursion: false
        });
        expect(dirents.length == 2).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        console.log('filefs_test_listfileext_sync_002 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_sync_003
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_0300
     * @tc.desc   Test listFileExtSync() interfaces. With recursion=true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_sync_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_sync_003');
      let fpath1 = dpath + '/listfileext_sync_003.txt';
      let fpath2 = dpath + '/listfileext_sync_003.doc';
      let fpath3 = dpath + '/listfileext_sync_003.png';
      let ddpath = dpath + '/subdir';
      let ffpath1 = ddpath + '/sub_file1.txt';
      let ffpath2 = ddpath + '/sub_file2.doc';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();
      expect(prepareFile(ffpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(ffpath2, FILE_CONTENT)).assertTrue();

      try {
        let dirents = fs.listFileExtSync(dpath, {
          recursion: true
        });
        expect(dirents.length == 5).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        console.log('filefs_test_listfileext_sync_003 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_sync_004
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_0400
     * @tc.desc   Test listFileExtSync() interfaces. With fileFilter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_sync_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_sync_004');
      let fpath1 = dpath + '/listfileext_sync_004.txt';
      let fpath2 = dpath + '/listfileext_sync_004.doc';
      let fpath3 = dpath + '/listfileext_sync_004.png';
      let fpath4 = dpath + '/listfileext_sync_444.TXT';
      fs.mkdirSync(dpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath4, FILE_CONTENT)).assertTrue();

      try {
        let fileFilter: FileFilter = {
          filter: (name: string): boolean => {
            return name.endsWith('.txt');
          }
        };
        let options: ListFileExtOptions = {
          recursion: false,
          listNum: 0,
          fileFilter: fileFilter
        };
        let dirents = fs.listFileExtSync(dpath, options);
        expect(dirents.length == 1).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        console.log('filefs_test_listfileext_sync_004 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_sync_005
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_0500
     * @tc.desc   Test listFileExtSync() interfaces. With fileFilter returning true for all.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_sync_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_sync_005');
      let fpath1 = dpath + '/listfileext_sync_005.txt';
      let fpath2 = dpath + '/listfileext_sync_005.doc';
      let fpath3 = dpath + '/listfileext_sync_005.png';
      fs.mkdirSync(dpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let fileFilter: FileFilter = {
          filter: (name: string): boolean => {
            return true;
          }
        };
        let dirents = fs.listFileExtSync(dpath, {
          recursion: false,
          fileFilter: fileFilter
        });
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        console.log('filefs_test_listfileext_sync_005 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_sync_006
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_0600
     * @tc.desc   Test listFileExtSync() interfaces. With fileFilter returning false for all.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_sync_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_sync_006');
      let fpath1 = dpath + '/listfileext_sync_006.txt';
      let fpath2 = dpath + '/listfileext_sync_006.doc';
      let fpath3 = dpath + '/listfileext_sync_006.png';
      fs.mkdirSync(dpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let fileFilter: FileFilter = {
          filter: (name: string): boolean => {
            return false;
          }
        };
        let dirents = fs.listFileExtSync(dpath, {
          recursion: false,
          fileFilter: fileFilter
        });
        expect(dirents.length == 0).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        console.log('filefs_test_listfileext_sync_006 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_sync_007
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_0700
     * @tc.desc   Test listFileExtSync() interfaces. With recursion=true and fileFilter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_sync_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_sync_007');
      let fpath1 = dpath + '/listfileext_sync_007.txt';
      let fpath2 = dpath + '/listfileext_sync_007.doc';
      let fpath3 = dpath + '/listfileext_sync_007.png';
      let ddpath = dpath + '/subdir';
      let ffpath1 = ddpath + '/sub_file1.txt';
      let ffpath2 = ddpath + '/sub_file2.doc';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();
      expect(prepareFile(ffpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(ffpath2, FILE_CONTENT)).assertTrue();

      try {
        let fileFilter: FileFilter = {
          filter: (name: string): boolean => {
            return name.endsWith('.txt');
          }
        };
        let dirents = fs.listFileExtSync(dpath, {
          recursion: true,
          fileFilter: fileFilter
        });
        expect(dirents.length == 2).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        console.log('filefs_test_listfileext_sync_007 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_sync_008
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_0800
     * @tc.desc   Test listFileExtSync() interfaces. With listNum=0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_sync_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_sync_008');
      let fpath1 = dpath + '/listfileext_sync_008.txt';
      let fpath2 = dpath + '/listfileext_sync_008.doc';
      let fpath3 = dpath + '/listfileext_sync_008.png';
      fs.mkdirSync(dpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let dirents = fs.listFileExtSync(dpath, {
          listNum: 0,
          recursion: false
        });
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        console.log('filefs_test_listfileext_sync_008 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_sync_009
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_0900
     * @tc.desc   Test listFileExtSync() interfaces. Error: path not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_sync_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_sync_009');

      try {
        fs.listFileExtSync(dpath);
        expect(false).assertTrue();
      } catch (err) {
        console.log('filefs_test_listfileext_sync_009 has failed for ' + err.message + ', code:' + err.code);
        expect(err.code === 13900002 && err.message == 'No such file or directory').assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_sync_010
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_1000
     * @tc.desc   Test listFileExtSync() interfaces. Error: path is file not directory.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_sync_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_sync_010');
      expect(prepareFile(dpath, FILE_CONTENT)).assertTrue();

      try {
        fs.listFileExtSync(dpath);
        expect(false).assertTrue();
      } catch (err) {
        console.log('filefs_test_listfileext_sync_010 has failed for ' + err.message + ', code:' + err.code);
        expect(err.code === 13900018 && err.message == 'Not a directory').assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_sync_011
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_1100
     * @tc.desc   Test listFileExtSync() interfaces. Error: empty path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_sync_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try {
        fs.listFileExtSync('');
        expect(false).assertTrue();
      } catch (err) {
        console.log('filefs_test_listfileext_sync_011 has failed for ' + err.message + ', code:' + err.code);
        expect(err.code === 13900002 && err.message == 'No such file or directory').assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_sync_012
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_1200
     * @tc.desc   Test listFileExtSync() interfaces. With undefined options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_sync_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_sync_012');
      let fpath1 = dpath + '/listfileext_sync_012.txt';
      let fpath2 = dpath + '/listfileext_sync_012.doc';
      let fpath3 = dpath + '/listfileext_sync_012.png';
      fs.mkdirSync(dpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let dirents = fs.listFileExtSync(dpath, undefined);
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        console.log('filefs_test_listfileext_sync_012 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_sync_013
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_1300
     * @tc.desc   Test listFileExtSync() interfaces. With all options undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('filefs_test_listfileext_sync_013', Level.LEVEL3, async () => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_sync_013');
      let ddpath = dpath + '/subdir';
      let fpath1 = dpath + '/listfileext_sync_013.txt';
      let fpath2 = dpath + '/listfileext_sync_013.doc';
      let fpath3 = dpath + '/listfileext_sync_013.png';
      let ffpath1 = ddpath + '/sub_file1.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();
      expect(prepareFile(ffpath1, FILE_CONTENT)).assertTrue();

      try {
        let dirents = fs.listFileExtSync(dpath, {
          recursion: undefined,
          listNum: undefined,
          fileFilter: undefined
        });
        console.log('filefs_test_listfileext_sync_013 dirents.length ' + dirents.length);
        expect(dirents.length == 4).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        console.log('filefs_test_listfileext_sync_013 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

        /**
     * @tc.name   filefs_test_listfileext_sync_014
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_1400
     * @tc.desc   Test listFileExtSync() interfaces. With listNum negative.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_sync_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_sync_014');
      let fpath1 = dpath + '/listfileext_sync_014.txt';
      let fpath2 = dpath + '/listfileext_sync_014.doc';
      let fpath3 = dpath + '/listfileext_sync_014.png';
      fs.mkdirSync(dpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        fs.listFileExtSync(dpath, {
          listNum: -1,
          recursion: false
        });
        expect(false).assertTrue();
      } catch (err) {
        console.log('filefs_test_listfileext_sync_014 has failed for ' + err.message + ', code:' + err.code);
        expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
        fs.rmdirSync(dpath);
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_sync_015
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_1500
     * @tc.desc   Test listFileExtSync() interfaces. With listNum exceeds file count.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_sync_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_sync_015');
      let fpath1 = dpath + '/listfileext_sync_015.txt';
      let fpath2 = dpath + '/listfileext_sync_015.doc';
      let fpath3 = dpath + '/listfileext_sync_015.png';
      fs.mkdirSync(dpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let dirents = fs.listFileExtSync(dpath, {
          listNum: 10,
          recursion: false
        });
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        console.log('filefs_test_listfileext_sync_015 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_sync_016
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_1600
     * @tc.desc   Test listFileExtSync() interfaces. With empty options object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_sync_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_sync_016');
      let fpath1 = dpath + '/listfileext_sync_016.txt';
      let fpath2 = dpath + '/listfileext_sync_016.doc';
      let fpath3 = dpath + '/listfileext_sync_016.png';
      fs.mkdirSync(dpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let dirents = fs.listFileExtSync(dpath, {});
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        console.log('filefs_test_listfileext_sync_016 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_sync_017
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_1700
     * @tc.desc   Test listFileExtSync() interfaces. Deep nested directories with recursion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_sync_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_sync_017');
      let ddpath1 = dpath + '/level1';
      let ddpath2 = ddpath1 + '/level2';
      let ddpath3 = ddpath2 + '/level3';
      let fpath1 = dpath + '/root.txt';
      let fpath2 = ddpath1 + '/file1.txt';
      let fpath3 = ddpath2 + '/file2.txt';
      let fpath4 = ddpath3 + '/file3.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath1);
      fs.mkdirSync(ddpath2);
      fs.mkdirSync(ddpath3);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath4, FILE_CONTENT)).assertTrue();

      try {
        let dirents = fs.listFileExtSync(dpath, {
          recursion: true
        });
        console.log('filefs_test_listfileext_sync_017 has dirents.length' + dirents.length);
        expect(dirents.length == 4).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        console.log('filefs_test_listfileext_sync_017 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_sync_018
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_1800
     * @tc.desc   Test listFileExtSync() interfaces. With fileFilter containing specific string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_sync_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_sync_018');
      let fpath1 = dpath + '/listfileext_sync_018.txt';
      let fpath2 = dpath + '/test_file.doc';
      let fpath3 = dpath + '/other.png';
      fs.mkdirSync(dpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let fileFilter: FileFilter = {
          filter: (name: string): boolean => {
            return name.includes('sync');
          }
        };
        let dirents = fs.listFileExtSync(dpath, {
          recursion: false,
          fileFilter: fileFilter
        });
        expect(dirents.length == 1).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        console.log('filefs_test_listfileext_sync_018 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_sync_019
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_1900
     * @tc.desc   Test listFileExtSync() interfaces. With all three parameters combined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_sync_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_sync_019');
      let ddpath = dpath + '/subdir';
      let fpath1 = dpath + '/listfileext_sync_019.txt';
      let fpath2 = dpath + '/listfileext_sync_019.doc';
      let fpath3 = dpath + '/other.png';
      let ffpath1 = ddpath + '/sub_file.txt';
      let ffpath2 = ddpath + '/sub_other.doc';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();
      expect(prepareFile(ffpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(ffpath2, FILE_CONTENT)).assertTrue();

      try {
        let fileFilter: FileFilter = {
          filter: (name: string): boolean => {
            return name.endsWith('.txt');
          }
        };
        let dirents = fs.listFileExtSync(dpath, {
          recursion: true,
          listNum: 2,
          fileFilter: fileFilter
        });
        expect(dirents.length == 2).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        console.log('filefs_test_listfileext_sync_019 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_sync_020
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_2000
     * @tc.desc   Test listFileExtSync() interfaces. With recursion=true and listNum.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_sync_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_sync_020');
      let ddpath = dpath + '/subdir';
      let fpath1 = dpath + '/file1.txt';
      let fpath2 = dpath + '/file2.doc';
      let fpath3 = dpath + '/file3.png';
      let ffpath1 = ddpath + '/sub_file1.txt';
      let ffpath2 = ddpath + '/sub_file2.doc';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();
      expect(prepareFile(ffpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(ffpath2, FILE_CONTENT)).assertTrue();

      try {
        let dirents = fs.listFileExtSync(dpath, {
          recursion: true,
          listNum: 3
        });
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        console.log('filefs_test_listfileext_sync_020 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_sync_021
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_2100
     * @tc.desc   Test listFileExtSync() interfaces. Empty directory.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_sync_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_sync_021');
      fs.mkdirSync(dpath);

      try {
        let dirents = fs.listFileExtSync(dpath);
        expect(dirents.length == 0).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        console.log('filefs_test_listfileext_sync_021 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_sync_022
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_2200
     * @tc.desc   Test listFileExtSync() interfaces. With listNum negative.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_sync_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try {
        fs.listFileExtSync(undefined, {
          listNum: 0,
          recursion: false
        });
        expect(false).assertTrue();
      } catch (err) {
        console.log('filefs_test_listfileext_sync_022 has failed for ' + err.message + ', code:' + err.code);
        expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_sync_023
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_2300
     * @tc.desc   Test listFileExtSync() interfaces. With null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_sync_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_sync_023');
      fs.mkdirSync(dpath);
      try {
        fs.listFileExtSync(dpath, null);
        expect(false).assertTrue();
      } catch (err) {
        console.log('filefs_test_listfileext_sync_023 has failed for ' + err.message + ', code:' + err.code);
        expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_sync_024
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_SYNC_2400
     * @tc.desc   Test listFileExtSync() interfaces. With fileFilter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_sync_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_sync_024');
      let fpath1 = dpath + '/listfileext_sync_004.txt';
      let fpath2 = dpath + '/listfileext_sync_004.doc';
      let fpath3 = dpath + '/listfileext_sync_004.png';
      let fpath4 = dpath + '/listfileext_sync_444.TXT';
      fs.mkdirSync(dpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath4, FILE_CONTENT)).assertTrue();

      try {
        let fileFilter: FileFilter = {
          filter: (name: string): boolean => {
            return /\.(TXT)$/i.test(name);
          }
        };
        let options: ListFileExtOptions = {
          recursion: false,
          listNum: 0,
          fileFilter: fileFilter
        };
        let dirents = fs.listFileExtSync(dpath, options);
        console.log('filefs_test_listfileext_sync_024 dirents.length ' + dirents.length);
        expect(dirents.length == 2).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err) {
        console.log('filefs_test_listfileext_sync_024 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_async_000
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_0000
     * @tc.desc   Test listFileExt() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_async_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_async_000');
      let fpath1 = dpath + '/listfileext_async_000.txt';
      let fpath2 = dpath + '/listfileext_async_000.doc';
      let fpath3 = dpath + '/listfileext_async_000.png';
      fs.mkdirSync(dpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let dirents = await fs.listFileExt(dpath);
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        console.log('filefs_test_listfileext_async_000 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_async_001
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_0100
     * @tc.desc   Test listFileExt() interfaces. Promise with recursion=false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_async_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_async_001');
      let fpath1 = dpath + '/listfileext_async_001.txt';
      let fpath2 = dpath + '/listfileext_async_001.doc';
      let fpath3 = dpath + '/listfileext_async_001.png';
      fs.mkdirSync(dpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let dirents = await fs.listFileExt(dpath, {
          recursion: false
        });
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        console.log('filefs_test_listfileext_async_001 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_async_002
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_0200
     * @tc.desc   Test listFileExt() interfaces. Promise with listNum=2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_async_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_async_002');
      let fpath1 = dpath + '/listfileext_async_002.txt';
      let fpath2 = dpath + '/listfileext_async_002.doc';
      let fpath3 = dpath + '/listfileext_async_002.png';
      fs.mkdirSync(dpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let dirents = await fs.listFileExt(dpath, {
          listNum: 2,
          recursion: false
        });
        expect(dirents.length == 2).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        console.log('filefs_test_listfileext_async_002 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_async_003
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_0300
     * @tc.desc   Test listFileExt() interfaces. Promise with recursion=true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_async_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_async_003');
      let fpath1 = dpath + '/listfileext_async_003.txt';
      let fpath2 = dpath + '/listfileext_async_003.doc';
      let fpath3 = dpath + '/listfileext_async_003.png';
      let ddpath = dpath + '/subdir';
      let ffpath1 = ddpath + '/sub_file1.txt';
      let ffpath2 = ddpath + '/sub_file2.doc';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();
      expect(prepareFile(ffpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(ffpath2, FILE_CONTENT)).assertTrue();

      try {
        let dirents = await fs.listFileExt(dpath, {
          recursion: true
        });
        expect(dirents.length == 5).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        console.log('filefs_test_listfileext_async_003 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_async_004
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_0400
     * @tc.desc   Test listFileExt() interfaces. Promise with fileFilter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_async_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_async_004');
      let fpath1 = dpath + '/listfileext_async_004.txt';
      let fpath2 = dpath + '/listfileext_async_004.doc';
      let fpath3 = dpath + '/listfileext_async_004.png';
      let fpath4 = dpath + '/listfileext_async_444.TXT';
      fs.mkdirSync(dpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath4, FILE_CONTENT)).assertTrue();

      try {
        let fileFilter: FileFilter = {
          filter: (name: string): boolean => {
            return name.endsWith('.txt');
          }
        };
        let options: ListFileExtOptions = {
          recursion: false,
          listNum: 0,
          fileFilter: fileFilter
        };
        let dirents = await fs.listFileExt(dpath, options);
        expect(dirents.length == 1).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        console.log('filefs_test_listfileext_async_004 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_async_005
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_0500
     * @tc.desc   Test listFileExt() interfaces. Promise with recursion=true and fileFilter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_async_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_async_005');
      let fpath1 = dpath + '/listfileext_async_005.txt';
      let fpath2 = dpath + '/listfileext_async_005.doc';
      let fpath3 = dpath + '/listfileext_async_005.png';
      let ddpath = dpath + '/subdir';
      let ffpath1 = ddpath + '/sub_file1.txt';
      let ffpath2 = ddpath + '/sub_file2.doc';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();
      expect(prepareFile(ffpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(ffpath2, FILE_CONTENT)).assertTrue();

      try {
        let fileFilter: FileFilter = {
          filter: (name: string): boolean => {
            return name.endsWith('.txt');
          }
        };
        let dirents = await fs.listFileExt(dpath, {
          recursion: true,
          fileFilter: fileFilter
        });
        expect(dirents.length == 2).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        console.log('filefs_test_listfileext_async_005 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_async_006
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_0600
     * @tc.desc   Test listFileExt() interfaces. Promise error: path not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_async_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_async_006');

      try {
        await fs.listFileExt(dpath);
        expect(false).assertTrue();
      } catch (err) {
        console.log('filefs_test_listfileext_async_006 has failed for ' + err.message + ', code:' + err.code);
        expect(err.code === 13900002 && err.message == 'No such file or directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_async_007
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_0700
     * @tc.desc   Test listFileExt() interfaces. Promise error: path is file not directory.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_async_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_async_007');
      expect(prepareFile(dpath, FILE_CONTENT)).assertTrue();

      try {
        await fs.listFileExt(dpath);
        expect(false).assertTrue();
      } catch (err) {
        console.log('filefs_test_listfileext_async_007 has failed for ' + err.message + ', code:' + err.code);
        expect(err.code === 13900018 && err.message == 'Not a directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_async_008
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_0800
     * @tc.desc   Test listFileExt() interfaces. Promise with undefined options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_async_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_async_008');
      let fpath1 = dpath + '/listfileext_async_008.txt';
      let fpath2 = dpath + '/listfileext_async_008.doc';
      let fpath3 = dpath + '/listfileext_async_008.png';
      fs.mkdirSync(dpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let dirents = await fs.listFileExt(dpath, undefined);
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        console.log('filefs_test_listfileext_async_008 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_async_009
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_0900
     * @tc.desc   Test listFileExt() interfaces. Promise with listNum=0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_async_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_async_009');
      let fpath1 = dpath + '/listfileext_async_009.txt';
      let fpath2 = dpath + '/listfileext_async_009.doc';
      let fpath3 = dpath + '/listfileext_async_009.png';
      fs.mkdirSync(dpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let dirents = await fs.listFileExt(dpath, {
          listNum: 0,
          recursion: false
        });
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        console.log('filefs_test_listfileext_async_009 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_async_010
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_1000
     * @tc.desc   Test listFileExt() interfaces. Promise with listNum negative.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_async_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_async_010');
      let fpath1 = dpath + '/listfileext_async_010.txt';
      let fpath2 = dpath + '/listfileext_async_010.doc';
      let fpath3 = dpath + '/listfileext_async_010.png';
      fs.mkdirSync(dpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        await fs.listFileExt(dpath, {
          listNum: -1,
          recursion: false
        });
        expect(false).assertTrue();
      } catch (err) {
        console.log('filefs_test_listfileext_async_010 has failed for ' + err.message + ', code:' + err.code);
        expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
        fs.rmdirSync(dpath);
        done();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_async_011
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_1100
     * @tc.desc   Test listFileExt() interfaces. Promise with listNum exceeds file count.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_async_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_async_011');
      let fpath1 = dpath + '/listfileext_async_011.txt';
      let fpath2 = dpath + '/listfileext_async_011.doc';
      let fpath3 = dpath + '/listfileext_async_011.png';
      fs.mkdirSync(dpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let dirents = await fs.listFileExt(dpath, {
          listNum: 10,
          recursion: false
        });
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        console.log('filefs_test_listfileext_async_011 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_async_012
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_1200
     * @tc.desc   Test listFileExt() interfaces. Promise with empty options object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_async_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_async_012');
      let fpath1 = dpath + '/listfileext_async_012.txt';
      let fpath2 = dpath + '/listfileext_async_012.doc';
      let fpath3 = dpath + '/listfileext_async_012.png';
      fs.mkdirSync(dpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let dirents = await fs.listFileExt(dpath, {});
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        console.log('filefs_test_listfileext_async_012 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_async_013
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_1300
     * @tc.desc   Test listFileExt() interfaces. Promise with deep nested directories.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_async_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_async_013');
      let ddpath1 = dpath + '/level1';
      let ddpath2 = ddpath1 + '/level2';
      let ddpath3 = ddpath2 + '/level3';
      let fpath1 = dpath + '/root.txt';
      let fpath2 = ddpath1 + '/file1.txt';
      let fpath3 = ddpath2 + '/file2.txt';
      let fpath4 = ddpath3 + '/file3.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath1);
      fs.mkdirSync(ddpath2);
      fs.mkdirSync(ddpath3);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath4, FILE_CONTENT)).assertTrue();

      try {
        let dirents = await fs.listFileExt(dpath, {
          recursion: true
        });
        console.log('filefs_test_listfileext_async_013 dirents.length ' + dirents.length);
        expect(dirents.length == 4).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        console.log('filefs_test_listfileext_async_013 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_async_014
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_1400
     * @tc.desc   Test listFileExt() interfaces. Promise with fileFilter containing specific string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_async_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_async_014');
      let fpath1 = dpath + '/listfileext_async_014.txt';
      let fpath2 = dpath + '/test_file.doc';
      let fpath3 = dpath + '/other.png';
      fs.mkdirSync(dpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let fileFilter: FileFilter = {
          filter: (name: string): boolean => {
            return name.includes('async');
          }
        };
        let dirents = await fs.listFileExt(dpath, {
          recursion: false,
          fileFilter: fileFilter
        });
        expect(dirents.length == 1).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        console.log('filefs_test_listfileext_async_014 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_async_015
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_1500
     * @tc.desc   Test listFileExt() interfaces. Promise with all three parameters combined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_async_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_async_015');
      let ddpath = dpath + '/subdir';
      let fpath1 = dpath + '/listfileext_async_015.txt';
      let fpath2 = dpath + '/listfileext_async_015.doc';
      let fpath3 = dpath + '/other.png';
      let ffpath1 = ddpath + '/sub_file.txt';
      let ffpath2 = ddpath + '/sub_other.doc';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();
      expect(prepareFile(ffpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(ffpath2, FILE_CONTENT)).assertTrue();

      try {
        let fileFilter: FileFilter = {
          filter: (name: string): boolean => {
            return name.endsWith('.txt');
          }
        };
        let dirents = await fs.listFileExt(dpath, {
          recursion: true,
          listNum: 2,
          fileFilter: fileFilter
        });
        expect(dirents.length == 2).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        console.log('filefs_test_listfileext_async_015 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_async_016
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_1600
     * @tc.desc   Test listFileExt() interfaces. Promise with recursion=true and listNum.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_async_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_async_016');
      let ddpath = dpath + '/subdir';
      let fpath1 = dpath + '/file1.txt';
      let fpath2 = dpath + '/file2.doc';
      let fpath3 = dpath + '/file3.png';
      let ffpath1 = ddpath + '/sub_file1.txt';
      let ffpath2 = ddpath + '/sub_file2.doc';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();
      expect(prepareFile(ffpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(ffpath2, FILE_CONTENT)).assertTrue();

      try {
        let dirents = await fs.listFileExt(dpath, {
          recursion: true,
          listNum: 3
        });
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        console.log('filefs_test_listfileext_async_016 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_async_017
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_1700
     * @tc.desc   Test listFileExt() interfaces. Promise with empty directory.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_async_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_async_017');
      fs.mkdirSync(dpath);

      try {
        let dirents = await fs.listFileExt(dpath);
        expect(dirents.length == 0).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        console.log('filefs_test_listfileext_async_017 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_async_018
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_1800
     * @tc.desc   Test listFileExt() interfaces. Promise with fileFilter returning false for all.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_async_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_async_018');
      let fpath1 = dpath + '/listfileext_async_018.txt';
      let fpath2 = dpath + '/listfileext_async_018.doc';
      let fpath3 = dpath + '/listfileext_async_018.png';
      fs.mkdirSync(dpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let fileFilter: FileFilter = {
          filter: (name: string): boolean => {
            return false;
          }
        };
        let dirents = await fs.listFileExt(dpath, {
          recursion: false,
          fileFilter: fileFilter
        });
        expect(dirents.length == 0).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        console.log('filefs_test_listfileext_async_018 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_async_019
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_1900
     * @tc.desc   Test listFileExt() interfaces. Promise with listNum negative.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_async_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await fs.listFileExt(undefined, {
          listNum: 0,
          recursion: false
        });
        expect(false).assertTrue();
      } catch (err) {
        console.log('filefs_test_listfileext_async_019 has failed for ' + err.message + ', code:' + err.code);
        expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_async_020
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_2000
     * @tc.desc   Test listFileExt() interfaces. Error: empty path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_async_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await fs.listFileExt('');
        expect(false).assertTrue();
      } catch (err) {
        console.log('filefs_test_listfileext_async_020 has failed for ' + err.message + ', code:' + err.code);
        expect(err.code === 13900002 && err.message == 'No such file or directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_async_021
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_2100
     * @tc.desc   Test listFileExt() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_async_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_async_021');
      let fpath1 = dpath + '/listfile_async_025.txt';
      let fpath2 = dpath + '/listfile_async_025.doc';
      let fpath3 = dpath + '/listfile_async_025.png';
      fs.mkdirSync(dpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();
  
      try {
        await fs.listFileExt(dpath, null);
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.log('filefs_test_listfileext_async_021 has failed for ' + err.message + ', code:' + err.code);
        expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
        fs.rmdirSync(dpath);
        done();
      }
    });

    /**
     * @tc.name   filefs_test_listfileext_async_022
     * @tc.number SUB_DF_FILEIO_LISTFILEEXT_ASYNC_2200
     * @tc.desc   Test listFileExt() interfaces. Promise with fileFilter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('filefs_test_listfileext_async_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let dpath = await nextFileName(data + 'filefs_test_listfileext_async_022');
      let fpath1 = dpath + '/listfileext_async_004.txt';
      let fpath2 = dpath + '/listfileext_async_004.doc';
      let fpath3 = dpath + '/listfileext_async_004.png';
      let fpath4 = dpath + '/listfileext_async_444.TXT';
      fs.mkdirSync(dpath);
      expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();
      expect(prepareFile(fpath4, FILE_CONTENT)).assertTrue();

      try {
        let fileFilter: FileFilter = {
          filter: (name: string): boolean => {
            return /\.(TXT)$/i.test(name);
          }
        };
        let options: ListFileExtOptions = {
          recursion: false,
          listNum: 0,
          fileFilter: fileFilter
        };
        let dirents = await fs.listFileExt(dpath, options);
        console.log('filefs_test_listfileext_async_022 dirents.length ' + dirents.length);
        expect(dirents.length == 2).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (err) {
        console.log('filefs_test_listfileext_async_022 has failed for ' + err.message + ', code:' + err.code);
        expect(false).assertTrue();
      }
    });
  });
}