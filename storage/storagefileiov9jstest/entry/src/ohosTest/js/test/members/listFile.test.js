/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import {
  fileIO, FILE_CONTENT, prepareFile, nextFileName, describe, it, expect, randomString
} from '../Common';
import { TestType, Size, Level } from '@ohos/hypium';

export default function fileIOListfile() {
  describe('fileIO_fs_listfile', function () {

  /**
   * @tc.name   fileIO_test_listfile_sync_000
   * @tc.number SUB_DF_FILEIO_LISTFILE_SYNC_0000
   * @tc.desc   Test listFileSync()interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_sync_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_sync_000');
    let fpath1 = dpath + '/listfile_sync_000.txt';
    let fpath2 = dpath + '/listfile_sync_000.doc';
    let fpath3 = dpath + '/listfile_sync_000.png';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

    try {
      let dirents = fileIO.listFileSync(dpath);
      expect(dirents.length == 3).assertTrue();
      fileIO.rmdirSync(dpath);
    } catch (err) {
      console.log('fileIO_test_listfile_sync_000 has failed for ' + err.message + ', code:' + err.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_sync_001
   * @tc.number SUB_DF_FILEIO_LISTFILE_SYNC_0100
   * @tc.desc   Test listFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_sync_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_sync_001');
    let fpath1 = dpath + '/listfile_sync_001.txt';
    let fpath2 = dpath + '/listfile_sync_001.doc';
    let fpath3 = dpath + '/listfile_sync_001.png';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

    try {
      let dirents = fileIO.listFileSync(dpath, {
        listNum: 2,
        recursion: false
      });
      expect(dirents.length == 2).assertTrue();
      fileIO.rmdirSync(dpath);
    } catch (err) {
      console.log('fileIO_test_listfile_sync_001 has failed for ' + err.message + ', code:' + err.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_sync_002
   * @tc.number SUB_DF_FILEIO_LISTFILE_SYNC_0200
   * @tc.desc   Test listFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_sync_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_sync_002');
    let fpath1 = dpath + '/listfile_sync_002.txt';
    let fpath2 = dpath + '/listfile_sync_002.doc';
    let fpath3 = dpath + '/listfile_sync_002.png';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

    try {
      let time = new Date().getTime() / 1000;
      let dirents = fileIO.listFileSync(dpath, {
        recursion: false,
        filter:{
          suffix: [".txt", ".doc", ".png"],
          displayName: ["*listfile*"],
          fileSizeOver: 0,
          lastModifiedAfter: time - 3
        }
      });
      expect(dirents.length == 3).assertTrue();
      fileIO.rmdirSync(dpath);
    } catch (err) {
      console.log('fileIO_test_listfile_sync_002 has failed for ' + err.message + ', code:' + err.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_sync_003
   * @tc.number SUB_DF_FILEIO_LISTFILE_SYNC_0300
   * @tc.desc   Test listFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_sync_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_sync_003');
    let fpath1 = dpath + '/listfile_sync_003.txt';
    let fpath2 = dpath + '/listfile_sync_003.doc';
    let fpath3 = dpath + '/listfile_sync_003.png';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

    try {
      let time = new Date().getTime() / 1000;
      let dirents = fileIO.listFileSync(dpath, {
        listNum: 4,
        recursion: false,
        filter:{
          displayName: ["*listfile*"],
          fileSizeOver: 5,
          lastModifiedAfter: time - 3
        }
      });
      expect(dirents.length == 3).assertTrue();
      fileIO.rmdirSync(dpath);
    } catch (err) {
      console.log('fileIO_test_listfile_sync_003 has failed for ' + err.message + ', code:' + err.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_sync_004
   * @tc.number SUB_DF_FILEIO_LISTFILE_SYNC_0400
   * @tc.desc   Test listFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_sync_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_sync_004');
    let fpath1 = dpath + '/listfile_sync_004.txt';
    let fpath2 = dpath + '/listfile_sync_004.doc';
    let fpath3 = dpath + '/listfile_sync_004.png';
    let ddpath = dpath + '/kids';
    let ffpath1 = ddpath + '/firstc.txt';
    let ffpath2 = ddpath + '/firsta.txt';
    let ffpath3 = ddpath + '/aabbcc.hap';
    let dddpath = ddpath + '/' + randomString(5);
    let fffpath1 = dddpath + '/makef.doc';
    let fffpath2 = dddpath + '/akasd.txt';
    let fffpath3 = dddpath + '/tdd.log';
    let fffpath4 = dddpath + '/tdd.txt';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    fileIO.mkdirSync(dddpath);
    expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath3, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fffpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fffpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fffpath3, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fffpath4, FILE_CONTENT)).assertTrue();

    try {
      let time = new Date().getTime() / 1000;
      let dirents = fileIO.listFileSync(dpath, {
        listNum: 6,
        recursion: true,
        filter:{
          suffix: [".txt", ".doc"],
          displayName: ["*listfile*", "*first*", "*akasd*", "*tdd*", "*makef*"],
          fileSizeOver: 0,
          lastModifiedAfter: time - 3
        }
      });
      expect(dirents.length == 6).assertTrue();
      fileIO.rmdirSync(dpath);
    } catch (err) {
      console.log('fileIO_test_listfile_sync_004 has failed for ' + err.message + ', code:' + err.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_sync_005
   * @tc.number SUB_DF_FILEIO_LISTFILE_SYNC_0500
   * @tc.desc   Test listFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_sync_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_sync_005') ;
    let fpath1 = dpath + '/listfile_sync_005.txt';
    let fpath2 = dpath + '/listfile_sync_005.doc';
    let fpath3 = dpath + '/listfile_sync_005.png';
    let fpath4 = dpath + '/timer.txt';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath4, FILE_CONTENT)).assertTrue();

    try {
      let time = new Date().getTime() / 1000;
      let dirents = fileIO.listFileSync(dpath, {
        listNum: 3,
        recursion: false,
        filter:{
          suffix: [".txt"],
          displayName: ["*listfile*", "*time*"],
          fileSizeOver: 4,
          lastModifiedAfter: time - 3
        }
      });
      expect(dirents.length == 2).assertTrue();
      fileIO.rmdirSync(dpath);
    } catch (err) {
      console.log('fileIO_test_listfile_sync_005 has failed for ' + err.message + ', code:' + err.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_sync_006
   * @tc.number SUB_DF_FILEIO_LISTFILE_SYNC_0600
   * @tc.desc   Test listFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_sync_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_sync_006');
    let fpath1 = dpath + '/listfile_sync_006.txt';
    let fpath2 = dpath + '/listfile_sync_006.doc';
    let fpath3 = dpath + '/listfile_sync_006.png';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

    try {
      let time = new Date().getTime() / 1000;
      fileIO.listFileSync(dpath, {
        listNum: 3,
        recursion: false,
        filter:{
          suffix: ["%.txt%"],
          displayName: ["*listfile*"],
          fileSizeOver: 0,
          lastModifiedAfter: time -3
        }
      });
      expect(false).assertTrue();
    } catch (err) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_listfile_sync_006 has failed for ' + err.message + ', code:' + err.code);
      expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_sync_007
   * @tc.number SUB_DF_FILEIO_LISTFILE_SYNC_0700
   * @tc.desc   Test listFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_sync_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_sync_007');
    let fpath1 = dpath + '/listfile_sync_007.txt';
    let fpath2 = dpath + '/listfile_sync_007.doc';
    let fpath3 = dpath + '/listfile_sync_007.png';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

    try {
      let time = new Date().getTime() / 1000;
      let dirents = fileIO.listFileSync(dpath, {
        listNum: 3,
        recursion: false,
        filter:{
          suffix: [".txt"],
          displayName: ["*listfile*"],
          fileSizeOver: 12,
          lastModifiedAfter: time - 3
        }
      });
      expect(dirents.length == 0).assertTrue();
      fileIO.rmdirSync(dpath);
    } catch (err) {
      console.log('fileIO_test_listfile_sync_007 has failed for ' + err.message + ', code:' + err.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_sync_008
   * @tc.number SUB_DF_FILEIO_LISTFILE_SYNC_0800
   * @tc.desc   Test listFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_sync_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_sync_008');
    let fpath1 = dpath + '/listfile_sync_008.txt';
    let fpath2 = dpath + '/listfile_sync_008.doc';
    let fpath3 = dpath + '/listfile_sync_008.png';
    let fpath4 = dpath + '/trespass.txt';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath4, FILE_CONTENT)).assertTrue();

    try {
      let time = new Date().getTime() / 1000;
      let dirents = fileIO.listFileSync(dpath, {
        listNum: 0,
        recursion: false,
        filter:{
          suffix: [".txt"],
          displayName: ["*listfile*", "*trespass*"],
          fileSizeOver: 5,
          lastModifiedAfter: time - 3
        }
      });
      expect(dirents.length == 2).assertTrue();
      fileIO.rmdirSync(dpath);
    } catch (err) {
      console.log('fileIO_test_listfile_sync_008 has failed for ' + err.message + ', code:' + err.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_sync_009
   * @tc.number SUB_DF_FILEIO_LISTFILE_SYNC_0900
   * @tc.desc   Test listFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_sync_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {

    try {
      fileIO.listFileSync();
      expect(false).assertTrue();
    } catch (err) {
      console.log('fileIO_test_listfile_sync_009 has failed for ' + err.message + ', code:' + err.code);
      expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_sync_010
   * @tc.number SUB_DF_FILEIO_LISTFILE_SYNC_1000
   * @tc.desc   Test listFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_sync_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_sync_010');
    let fpath1 = dpath + '/listfile_sync_009.txt';
    let fpath2 = dpath + '/listfile_sync_009.doc';
    let fpath3 = dpath + '/listfile_sync_009.png';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

    try {
      fileIO.listFileSync(dpath, 4);
      expect(false).assertTrue();
    } catch (err) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_listfile_sync_010 has failed for ' + err.message + ', code:' + err.code);
      expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_sync_011
   * @tc.number SUB_DF_FILEIO_LISTFILE_SYNC_1100
   * @tc.desc   Test listFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_listfile_sync_011', Level.LEVEL3, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_sync_011');
    let ddpath = dpath + '/second_dir';
    let fpath1 = dpath + '/listfile_sync_010.txt';
    let fpath2 = dpath + '/listfile_sync_010.doc';
    let fpath3 = dpath + '/listfile_sync_010.png';
    let ffpath1 = ddpath + '/listfile_sync_second_010.txt';
    let ffpath2 = ddpath + '/listfile_sync_second_010.doc';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath2, FILE_CONTENT)).assertTrue();

    try {
      let dirents = fileIO.listFileSync(dpath, {
        listNum: undefined,
        recursion: undefined,
        filter:{
          displayName: undefined,
          fileSizeOver: undefined,
          lastModifiedAfter: undefined
        }
      });
      expect(dirents.length == 4).assertTrue();
      fileIO.rmdirSync(dpath);
    } catch (err) {
      console.log('fileIO_test_listfile_sync_011 has failed for ' + err.message + ', code:' + err.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_sync_012
   * @tc.number SUB_DF_FILEIO_LISTFILE_SYNC_1200
   * @tc.desc   Test listFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_listfile_sync_012', Level.LEVEL3, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_sync_012');
    let ddpath = dpath + '/second_dir';
    let fpath1 = dpath + '/listfile_sync_011.txt';
    let fpath2 = dpath + '/listfile_sync_011.doc';
    let fpath3 = dpath + '/listfile_sync_011.png';
    let ffpath1 = ddpath + '/listfile_sync_second_011.txt';
    let ffpath2 = ddpath + '/listfile_sync_second_011.doc';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath2, FILE_CONTENT)).assertTrue();

    try {
      let dirents = fileIO.listFileSync(dpath, undefined);
      expect(dirents.length == 4).assertTrue();
      fileIO.rmdirSync(dpath);
    } catch (err) {
      console.log('fileIO_test_listfile_sync_012 has failed for ' + err.message + ', code:' + err.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_sync_013
   * @tc.number SUB_DF_FILEIO_LISTFILE_SYNC_1300
   * @tc.desc   Test listFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_sync_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_sync_002');
    let fpath1 = dpath + '/listfile_sync_013.txt';
    let fpath2 = dpath + '/listfile_sync_013.doc';
    let fpath3 = dpath + '/listfile_sync_013.png';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

    try {
      let time = new Date().getTime() / 1000;
      let dirents = fileIO.listFileSync(dpath, {
        listNum: 0,
        recursion: false,
        filter:{
          suffix: [".txt", ".doc", ".png"],
          displayName: ["*listfile*"],
          fileSizeOver: 0,
          lastModifiedAfter: time - 3,
          excludeMedia: false
        }
      });
      expect(dirents.length == 3).assertTrue();
      fileIO.rmdirSync(dpath);
    } catch (err) {
      console.log('fileIO_test_listfile_sync_013 has failed for ' + err.message + ', code:' + err.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_sync_014
   * @tc.number SUB_DF_FILEIO_LISTFILE_SYNC_1400
   * @tc.desc   Test listFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_sync_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_sync_014');

    try {
      let dirents = fileIO.listFileSync(dpath, {
        listNum: 2,
        recursion: false
      });
      expect(false).assertTrue();
    } catch (err) {
      console.log('fileIO_test_listfile_sync_014 has failed for ' + err.message + ', code:' + err.code);
      expect(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_sync_015
   * @tc.number SUB_DF_FILEIO_LISTFILE_SYNC_1500
   * @tc.desc   Test listFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_sync_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_sync_015');
    expect(prepareFile(dpath, FILE_CONTENT)).assertTrue();

    try {
      let dirents = fileIO.listFileSync(dpath, {
        listNum: 2,
        recursion: false
      });
      expect(false).assertTrue();
    } catch (err) {
      console.log('fileIO_test_listfile_sync_015 has failed for ' + err.message + ', code:' + err.code);
      expect(err.code == 13900018 && err.message == 'Not a directory').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_sync_016
   * @tc.number SUB_DF_FILEIO_LISTFILE_SYNC_1600
   * @tc.desc   Test listFileSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_sync_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_sync_016');
    expect(prepareFile(dpath, FILE_CONTENT)).assertTrue();

    try {
      let dirents = fileIO.listFileSync(dpath, {
        listNum: 2,
        recursion: false,
        mimeType: [".txt"],
      });
      expect(false).assertTrue();
    } catch (err) {
      console.log('fileIO_test_listfile_sync_016 has failed for ' + err.message + ', code:' + err.code);
      expect(err.code == 13900018 && err.message == 'Not a directory').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_async_000
   * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_0000
   * @tc.desc   Test listFile() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_async_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_async_000') ;
    let fpath1 = dpath + '/listfile_async_000.txt';
    let fpath2 = dpath + '/listfile_async_000.doc';
    let fpath3 = dpath + '/listfile_async_000.png';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

    try {
      fileIO.listFile(dpath, (err, dirents) => {
        if (err) {
          console.log('fileIO_test_listfile_async_000 err package ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(dirents.length == 3).assertTrue();
        fileIO.rmdirSync(dpath);
      });
    } catch (e) {
      console.log('fileIO_test_listfile_async_000 has failed for ' + e.message + ', code:' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_async_001
   * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_0100
   * @tc.desc   Test listFile() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_async_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_listfile_async_001');
    let fpath1 = dpath + '/listfile_async_001.txt';
    let fpath2 = dpath + '/listfile_async_001_1.doc';
    let fpath3 = dpath + '/listfile_async_001.png';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

    try {
      let dirents = await fileIO.listFile(dpath);
      expect(dirents.length == 3).assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    } catch (err) {
      console.log('fileIO_test_listfile_async_001 has failed for ' + err.message + ', code:' + err.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_async_002
   * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_0200
   * @tc.desc   Test listFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_async_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_async_002');
    let fpath1 = dpath + '/listfile_async_002.txt';
    let fpath2 = dpath + '/listfile_async_002.doc';
    let fpath3 = dpath + '/listfile_async_002.png';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

    try {
      fileIO.listFile(dpath, {
          listNum: 2,
          recursion: false
        }, (err, dirents) => {
          if (err) {
            console.log('fileIO_test_listfile_async_002 err package ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(dirents.length == 2).assertTrue();
          fileIO.rmdirSync(dpath);
      });
    } catch (e) {
      console.log('fileIO_test_listfile_async_002 has failed for ' + e.message + ', code:' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_async_003
   * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_0300
   * @tc.desc   Test listFile() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_async_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_listfile_async_003');
    let fpath1 = dpath + '/listfile_async_003.txt';
    let fpath2 = dpath + '/listfile_async_003.doc';
    let fpath3 = dpath + '/listfile_async_003.png';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

    try {
      let dirents = await fileIO.listFile(dpath, {
        listNum: 2,
        recursion: false
      });
      expect(dirents.length == 2).assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    } catch (err) {
      console.log('fileIO_test_listfile_async_003 has failed for ' + err.message + ', code:' + err.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_async_004
   * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_0400
   * @tc.desc   Test listFile() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_async_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_async_004');
    let fpath1 = dpath + '/listfile_async_004.txt';
    let fpath2 = dpath + '/listfile_async_004.doc';
    let fpath3 = dpath + '/listfile_async_004.png';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

    try {
      let time = new Date().getTime() / 1000;
      fileIO.listFile(dpath, {
          recursion: false,
          filter:{
            suffix: [".txt", ".doc", ".png"],
            displayName: ["*listfile*"],
            fileSizeOver: 0,
            lastModifiedAfter: time - 3
          }
        }, (err, dirents) => {
          if (err) {
            console.log('fileIO_test_listfile_async_004 err package ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(dirents.length == 3).assertTrue();
          fileIO.rmdirSync(dpath);
      });
    } catch (e) {
      console.log('fileIO_test_listfile_async_004 has failed for ' + e.message + ', code:' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_async_005
   * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_0500
   * @tc.desc   Test listFile() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_async_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_listfile_async_005');
    let fpath1 = dpath + '/listfile_async_005.txt';
    let fpath2 = dpath + '/listfile_async_005.doc';
    let fpath3 = dpath + '/listfile_async_005.png';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

    try {
      let time = new Date().getTime() / 1000;
      let dirents = await fileIO.listFile(dpath, {
        recursion: false,
        filter:{
          suffix: [".txt", ".doc", ".png"],
          displayName: ["*listfile*"],
          fileSizeOver: 0,
          lastModifiedAfter: time - 3
        }
      });
      expect(dirents.length == 3).assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    } catch (err) {
      console.log('fileIO_test_listfile_async_005 has failed for ' + err.message + ', code:' + err.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_async_006
   * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_0600
   * @tc.desc   Test listFile() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_async_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_async_006');
    let fpath1 = dpath + '/listfile_async_006.txt';
    let fpath2 = dpath + '/listfile_async_006.doc';
    let fpath3 = dpath + '/listfile_async_006.png';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

    try {
      let time = new Date().getTime() / 1000;
      fileIO.listFile(dpath, {
          listNum: 4,
          recursion: false,
          filter:{
            displayName: ["*listfile*"],
            fileSizeOver: 5,
            lastModifiedAfter: time - 3
          }
        }, (err, dirents) => {
          if (err) {
            console.log('fileIO_test_listfile_async_006 err package ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(dirents.length == 3).assertTrue();
          fileIO.rmdirSync(dpath);
      });
    } catch (e) {
      console.log('fileIO_test_listfile_async_006 has failed for ' + e.message + ', code:' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_async_007
   * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_0700
   * @tc.desc   Test listFile() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_async_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_listfile_async_007');
    let fpath1 = dpath + '/listfile_async_007.txt';
    let fpath2 = dpath + '/listfile_async_007.doc';
    let fpath3 = dpath + '/listfile_async_007.png';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

    try {
      let time = new Date().getTime() / 1000;
      let dirents = await fileIO.listFile(dpath, {
        listNum: 4,
        recursion: false,
        filter:{
          displayName: ["*listfile*"],
          fileSizeOver: 5,
          lastModifiedAfter: time - 3
        }
      });
      expect(dirents.length == 3).assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    } catch (err) {
      console.log('fileIO_test_listfile_async_007 has failed for ' + err.message + ', code:' + err.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_async_008
   * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_0800
   * @tc.desc   Test listFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_async_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_async_008');
    let fpath1 = dpath + '/listfile_async_008.txt';
    let fpath2 = dpath + '/listfile_async_008.doc';
    let fpath3 = dpath + '/listfile_async_008.png';
    let ddpath = dpath + '/kids';
    let ffapth1 = ddpath + '/firstc.txt';
    let ffapth2 = ddpath + '/firsta.txt';
    let ffapth3 = ddpath + '/aabbcc.hap';
    let dddpath = ddpath + '/' + randomString(5);
    let fffpath1 = dddpath + '/makef.doc';
    let fffpath2 = dddpath + '/akasd.txt';
    let fffpath3 = dddpath + '/tdd.log';
    let fffpath4 = dddpath + '/tdd.txt';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    fileIO.mkdirSync(dddpath);
    expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffapth1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffapth2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffapth3, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fffpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fffpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fffpath3, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fffpath4, FILE_CONTENT)).assertTrue();

    try {
      let time = new Date().getTime() / 1000;
      fileIO.listFile(dpath, {
          listNum: 6,
          recursion: true,
          filter:{
            suffix: [".txt", ".doc"],
            displayName: ["*listfile*", "*first*", "*akasd*", "*tdd*", "*makef*"],
            fileSizeOver: 0,
            lastModifiedAfter: time - 3
          }
        }, (err, dirents) => {
          if (err) {
            console.log('fileIO_test_listfile_async_008 err package ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(dirents.length == 6).assertTrue();
          fileIO.rmdirSync(dpath);
      });
    } catch (e) {
      console.log('fileIO_test_listfile_async_008 has failed for ' + e.message + ', code:' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_async_009
   * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_0900
   * @tc.desc   Test listFile() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_async_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_listfile_async_009');
    let fpath1 = dpath + '/listfile_async_009.txt';
    let fpath2 = dpath + '/listfile_async_009.doc';
    let fpath3 = dpath + '/listfile_async_009.png';
    let ddpath = dpath + '/kids';
    let ffapth1 = ddpath + '/firstc.txt';
    let ffapth2 = ddpath + '/firsta.txt';
    let ffapth3 = ddpath + '/aabbcc.hap';
    let dddpath = ddpath + '/' + randomString(5);
    let fffpath1 = dddpath + '/makef.doc';
    let fffpath2 = dddpath + '/akasd.txt';
    let fffpath3 = dddpath + '/tdd.log';
    let fffpath4 = dddpath + '/tdd.txt';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    fileIO.mkdirSync(dddpath);
    expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffapth1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffapth2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffapth3, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fffpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fffpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fffpath3, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fffpath4, FILE_CONTENT)).assertTrue();

    try {
      let time = new Date().getTime() / 1000;
      let dirents = await fileIO.listFile(dpath, {
        listNum: 6,
        recursion: true,
        filter:{
          suffix: [".txt", ".doc"],
          displayName: ["*listfile*", "*first*", "*akasd*", "*tdd*", "*makef*"],
          fileSizeOver: 0,
          lastModifiedAfter: time - 3
        }
      });
      expect(dirents.length == 6).assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    } catch (err) {
      console.log('fileIO_test_listfile_async_009 has failed for ' + err.message + ', code:' + err.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_async_010
   * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_1000
   * @tc.desc   Test listFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_async_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_async_010');
    let fapth1 = dpath + '/listfile_async_010.txt';
    let fapth2 = dpath + '/listfile_async_010.doc';
    let fapth3 = dpath + '/listfile_async_010.png';
    let fapth4 = dpath + '/timer.txt';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fapth1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fapth2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fapth3, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fapth4, FILE_CONTENT)).assertTrue();

    try {
      let time = new Date().getTime() / 1000;
      fileIO.listFile(dpath, {
          listNum: 3,
          recursion: false,
          filter:{
            suffix: [".txt"],
            displayName: ["*listfile*", "*time*"],
            fileSizeOver: 4,
            lastModifiedAfter: time - 3
          }
        }, (err, dirents) => {
          if (err) {
            console.log('fileIO_test_listfile_async_010 err package ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(dirents.length == 2).assertTrue();
          fileIO.rmdirSync(dpath);
      });
    } catch (e) {
      console.log('fileIO_test_listfile_async_010 has failed for ' + e.message + ', code:' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_async_011
   * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_1100
   * @tc.desc   Test listFile() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_async_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_listfile_async_011');
    let fapth1 = dpath + '/listfile_async_011.txt';
    let fapth2 = dpath + '/listfile_async_011.doc';
    let fapth3 = dpath + '/listfile_async_011.png';
    let fapth4 = dpath + '/timer.txt';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fapth1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fapth2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fapth3, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fapth4, FILE_CONTENT)).assertTrue();

    try {
      let time = new Date().getTime() / 1000;
      let dirents = await fileIO.listFile(dpath, {
        listNum: 3,
        recursion: false,
        filter:{
          suffix: [".txt"],
          displayName: ["*listfile*", "*time*"],
          fileSizeOver: 4,
          lastModifiedAfter: time - 3
        }
        });
      expect(dirents.length == 2).assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    } catch (err) {
      console.log('fileIO_test_listfile_async_011 has failed for ' + err.message + ', code:' + err.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_async_012
   * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_1200
   * @tc.desc   Test listFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_async_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_async_012');
    let fapth1 = dpath + '/listfile_async_012.txt';
    let fapth2 = dpath + '/listfile_async_012.doc';
    let fapth3 = dpath + '/listfile_async_012.png';
    let fapth4 = dpath + '/timer.txt';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fapth1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fapth2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fapth3, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fapth4, FILE_CONTENT)).assertTrue();

    try {
      let time = new Date().getTime() / 1000;
      fileIO.listFile(dpath, {
          listNum: 3,
          recursion: false,
          filter:{
            suffix: ["%.txt%"],
            displayName: ["*listfile*"],
            fileSizeOver: 0,
            lastModifiedAfter: time -3
          }
        }, (err) => {
            expect(false).assertTrue();
      });
    } catch (e) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_listfile_async_012 has failed for ' + e.message + ', code:' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_async_013
   * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_1300
   * @tc.desc   Test listFile() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_async_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_listfile_async_013');
    let fapth1 = dpath + '/listfile_async_013.txt';
    let fapth2 = dpath + '/listfile_async_013.doc';
    let fapth3 = dpath + '/listfile_async_013.png';
    let fapth4 = dpath + '/timer.txt';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fapth1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fapth2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fapth3, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fapth4, FILE_CONTENT)).assertTrue();

    try {
      let time = new Date().getTime() / 1000;
      await fileIO.listFile(dpath, {
        listNum: 3,
        recursion: false,
        filter:{
          suffix: ["%.txt%"],
          displayName: ["*listfile*"],
          fileSizeOver: 0,
          lastModifiedAfter: time -3
        }
      });
      expect(false).assertTrue();
    } catch (err) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_listfile_async_013 has failed for ' + err.message + ', code:' + err.code);
      expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_async_014
   * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_1400
   * @tc.desc   Test listFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_async_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_async_014');
    let fapth1 = dpath + '/listfile_async_014.txt';
    let fapth2 = dpath + '/listfile_async_014.doc';
    let fapth3 = dpath + '/listfile_async_014.png';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fapth1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fapth2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fapth3, FILE_CONTENT)).assertTrue();

    try {
      let time = new Date().getTime() / 1000;
      fileIO.listFile(dpath, {
          listNum: 3,
          recursion: false,
          filter:{
            suffix: [".txt"],
            displayName: ["*listfile*"],
            fileSizeOver: 12,
            lastModifiedAfter: time - 3
          }
        }, (err, dirents) => {
          if (err) {
            console.log('fileIO_test_listfile_async_014 err package ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(dirents.length == 0).assertTrue();
          fileIO.rmdirSync(dpath);
      });
    } catch (e) {
      console.log('fileIO_test_listfile_async_014 has failed for ' + e.message + ', code:' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_async_015
   * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_1500
   * @tc.desc   Test listFile() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_async_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_listfile_async_015');
    let fapth1 = dpath + '/listfile_async_015.txt';
    let fapth2 = dpath + '/listfile_async_015.doc';
    let fapth3 = dpath + '/listfile_async_015.png';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fapth1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fapth2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fapth3, FILE_CONTENT)).assertTrue();

    try {
      let time = new Date().getTime() / 1000;
      let dirents = await fileIO.listFile(dpath, {
        listNum: 3,
        recursion: false,
        filter:{
          suffix: [".txt"],
          displayName: ["*listfile*"],
          fileSizeOver: 12,
          lastModifiedAfter: time - 3
        }
      });
      expect(dirents.length == 0).assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    } catch (err) {
      console.log('fileIO_test_listfile_async_015 has failed for ' + err.message + ', code:' + err.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_async_016
   * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_1600
   * @tc.desc   Test listFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_async_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_async_016');
    let fapth1 = dpath + '/listfile_async_016.txt';
    let fapth2 = dpath + '/listfile_async_016.doc';
    let fapth3 = dpath + '/listfile_async_016.png';
    let fapth4 = dpath + '/trespass.txt';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fapth1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fapth2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fapth3, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fapth4, FILE_CONTENT)).assertTrue();

    try {
      let time = new Date().getTime() / 1000;
      fileIO.listFile(dpath, {
          listNum: 0,
          recursion: false,
          filter:{
            suffix: [".txt"],
            displayName: ["*listfile*", "*trespass*"],
            fileSizeOver: 5,
            lastModifiedAfter: time - 3
          }
        }, (err, dirents) => {
          if (err) {
            console.log('fileIO_test_listfile_async_016 err package ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(dirents.length == 2).assertTrue();
          fileIO.rmdirSync(dpath);
      });
    } catch (err) {
      console.log('fileIO_test_listfile_async_016 has failed for ' + err.message + ', code:' + err.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_async_017
   * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_1700
   * @tc.desc   Test listFile() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_async_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_listfile_async_017');
    let fapth1 = dpath + '/listfile_async_017.txt';
    let fapth2 = dpath + '/listfile_async_017.doc';
    let fapth3 = dpath + '/listfile_async_017.png';
    let fapth4 = dpath + '/trespass.txt';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fapth1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fapth2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fapth3, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fapth4, FILE_CONTENT)).assertTrue();

    try {
      let time = new Date().getTime() / 1000;
      let dirents = await fileIO.listFile(dpath, {
        listNum: 0,
        recursion: false,
        filter:{
          suffix: [".txt"],
          displayName: ["*listfile*", "*trespass*"],
          fileSizeOver: 5,
          lastModifiedAfter: time - 3
        }
      });
      expect(dirents.length == 2).assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    } catch (err) {
      console.log('fileIO_test_listfile_async_017 has failed for ' + err.message + ', code:' + err.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_async_018
   * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_1800
   * @tc.desc   Test listFile() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_async_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {

    try {
      await fileIO.listFile();
      expect(false).assertTrue();
    } catch (err) {
      console.log('fileIO_test_listfile_async_018 has failed for ' + err.message + ', code:' + err.code);
      expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_async_019
   * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_1900
   * @tc.desc   Test listFile() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_async_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_listfile_async_019');
    let fapth1 = dpath + '/listfile_async_019.txt';
    let fapth2 = dpath + '/listfile_async_019.doc';
    let fapth3 = dpath + '/listfile_async_019.png';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fapth1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fapth2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fapth3, FILE_CONTENT)).assertTrue();

    try {
      await fileIO.listFile(dpath, 4);
      expect(false).assertTrue();
    } catch (err) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_listfile_async_019 has failed for ' + err.message + ', code:' + err.code);
      expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_async_020
   * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_2000
   * @tc.desc   Test listFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_listfile_async_020', Level.LEVEL3, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_async_020');
    let ddpath = dpath + '/second_dir';
    let fpath1 = dpath + '/listfile_async_020.txt';
    let fpath2 = dpath + '/listfile_async_020.doc';
    let fpath3 = dpath + '/listfile_async_020.png';
    let ffpath1 = ddpath + '/listfile_sync_second_020.txt';
    let ffpath2 = ddpath + '/listfile_sync_second_020.doc';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath2, FILE_CONTENT)).assertTrue();

    try {
      fileIO.listFile(dpath, {
          listNum: undefined,
          recursion: undefined,
          filter:{
            displayName: undefined,
            fileSizeOver: undefined,
            lastModifiedAfter: undefined
          }
        }, (err, dirents) => {
          if (err) {
            console.log('fileIO_test_listfile_async_020 err package ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(dirents.length == 4).assertTrue();
          fileIO.rmdirSync(dpath);
      });
    } catch (e) {
      console.log('fileIO_test_listfile_async_020 has failed for ' + e.message + ', code:' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_async_021
   * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_2100
   * @tc.desc   Test listFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_listfile_async_021', Level.LEVEL3, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_async_021');
    let ddpath = dpath + '/second_dir';
    let fpath1 = dpath + '/listfile_async_021.txt';
    let fpath2 = dpath + '/listfile_async_021.doc';
    let fpath3 = dpath + '/listfile_async_021.png';
    let ffpath1 = ddpath + '/listfile_sync_second_021.txt';
    let ffpath2 = ddpath + '/listfile_sync_second_021.doc';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath2, FILE_CONTENT)).assertTrue();

    try {
      fileIO.listFile(dpath, undefined, (err, dirents) => {
        if (err) {
          console.log('fileIO_test_listfile_async_021 err package ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(dirents.length == 4).assertTrue();
        fileIO.rmdirSync(dpath);
      });
    } catch (e) {
      console.log('fileIO_test_listfile_async_021 has failed for ' + e.message + ', code:' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_async_022
   * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_2200
   * @tc.desc   Test listFile() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_listfile_async_022', Level.LEVEL3, async function (done) {
    let dpath = await nextFileName('fileIO_test_listfile_async_022');
    let ddpath = dpath + '/second_dir';
    let fpath1 = dpath + '/listfile_async_022.txt';
    let fpath2 = dpath + '/listfile_async_022.doc';
    let fpath3 = dpath + '/listfile_async_022.png';
    let ffpath1 = ddpath + '/listfile_sync_second_022.txt';
    let ffpath2 = ddpath + '/listfile_sync_second_022.doc';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath2, FILE_CONTENT)).assertTrue();

    try {
      let dirents = await fileIO.listFile(dpath, {
        listNum: undefined,
        recursion: undefined,
        filter:{
          displayName: undefined,
          fileSizeOver: undefined,
          lastModifiedAfter: undefined
        }
      });
      expect(dirents.length == 4).assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    } catch (err) {
      console.log('fileIO_test_listfile_async_022 has failed for ' + err.message + ', code:' + err.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_async_023
   * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_2300
   * @tc.desc   Test listFile() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_listfile_async_023', Level.LEVEL3, async function (done) {
    let dpath = await nextFileName('fileIO_test_listfile_async_023');
    let ddpath = dpath + '/second_dir';
    let fpath1 = dpath + '/listfile_async_023.txt';
    let fpath2 = dpath + '/listfile_async_023.doc';
    let fpath3 = dpath + '/listfile_async_023.png';
    let ffpath1 = ddpath + '/listfile_sync_second_023.txt';
    let ffpath2 = ddpath + '/listfile_sync_second_023.doc';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath2, FILE_CONTENT)).assertTrue();

    try {
      let dirents = await fileIO.listFile(dpath, undefined);
      expect(dirents.length == 4).assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    } catch (err) {
      console.log('fileIO_test_listfile_async_023 has failed for ' + err.message + ', code:' + err.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_async_024
   * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_2400
   * @tc.desc   Test listFile() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_async_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_async_024');
    let fpath1 = dpath + '/listfile_async_024.txt';
    let fpath2 = dpath + '/listfile_async_024.doc';
    let fpath3 = dpath + '/listfile_async_024.png';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

    try {
      let time = new Date().getTime() / 1000;
      fileIO.listFile(dpath, {
          listNum: 0,
          recursion: false,
          filter:{
            suffix: [".txt", ".doc", ".png"],
            displayName: ["*listfile*"],
            fileSizeOver: 0,
            lastModifiedAfter: time - 3,
            excludeMedia: false
          }
        }, (err, dirents) => {
          if (err) {
            console.log('fileIO_test_listfile_async_024 err package ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(dirents.length == 3).assertTrue();
          fileIO.rmdirSync(dpath);
      });
    } catch (e) {
      console.log('fileIO_test_listfile_async_024 has failed for ' + e.message + ', code:' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_async_025
   * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_2500
   * @tc.desc   Test listFile() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_async_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_listfile_async_025');
    let fpath1 = dpath + '/listfile_async_025.txt';
    let fpath2 = dpath + '/listfile_async_025.doc';
    let fpath3 = dpath + '/listfile_async_025.png';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath1, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpath3, FILE_CONTENT)).assertTrue();

    try {
      let time = new Date().getTime() / 1000;
      let dirents = await fileIO.listFile(dpath, {
        listNum: 0,
        recursion: false,
        filter:{
          suffix: [".txt", ".doc", ".png"],
          displayName: ["*listfile*"],
          fileSizeOver: 0,
          lastModifiedAfter: time - 3,
          excludeMedia: false
        }
      });
      expect(dirents.length == 3).assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    } catch (err) {
      console.log('fileIO_test_listfile_async_025 has failed for ' + err.message + ', code:' + err.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_async_026
   * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_2600
   * @tc.desc   Test listFile() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_async_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_async_026');

    try {
      fileIO.listFile(dpath, (err, dirents) => {
        if (err) {
          console.log('fileIO_test_listfile_async_026 err package ' + err.message + ', code:' + err.code);
          expect(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
        }
      });
    } catch (e) {
      console.log('fileIO_test_listfile_async_026 has failed for ' + e.message + ', code:' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_async_027
   * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_2700
   * @tc.desc   Test listFile() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_async_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_async_027');

    try {
      await fileIO.listFile(dpath);
      expect(false).assertTrue();
    } catch (err) {
      console.log('fileIO_test_listfile_async_027 has failed for ' + err.message + ', code:' + err.code);
      expect(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_async_028
   * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_2800
   * @tc.desc   Test listFile() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_async_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_async_028');
    expect(prepareFile(dpath, FILE_CONTENT)).assertTrue();

    try {
      await fileIO.listFile(dpath);
      expect(false).assertTrue();
    } catch (err) {
      console.log('fileIO_test_listfile_async_028 has failed for ' + err.message + ', code:' + err.code);
      expect(err.code == 13900018 && err.message == 'Not a directory').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_async_029
   * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_2900
   * @tc.desc   Test listFile() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_async_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_async_029');
    expect(prepareFile(dpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.listFile(dpath, (err, dirents) => {
        if (err) {
          console.log('fileIO_test_listfile_async_029 err package ' + err.message + ', code:' + err.code);
          expect(err.code == 13900018 && err.message == 'Not a directory').assertTrue();
        }
      });
    } catch (e) {
      console.log('fileIO_test_listfile_async_026 has failed for ' + e.message + ', code:' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_async_030
   * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_3000
   * @tc.desc   Test listFile() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_async_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_async_030') ;
    fileIO.mkdirSync(dpath);

    try {
      fileIO.listFile(dpath, (err, dirents) => {
        if (err) {
          console.log('fileIO_test_listfile_async_030 err package ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        console.log('fileIO_test_listfile_async_030 dirents： ' + dirents);
        expect(dirents.length == 0).assertTrue();
        fileIO.rmdirSync(dpath);
      });
    } catch (e) {
      console.log('fileIO_test_listfile_async_030 has failed for ' + e.message + ', code:' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_listfile_async_031
   * @tc.number SUB_DF_FILEIO_LISTFILE_ASYNC_3100
   * @tc.desc   Test listFile() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_listfile_async_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_listfile_async_031');
    fileIO.mkdirSync(dpath);

    try {
      fileIO.listFile(dpath, {
          listNum: 2,
          recursion: false
        }, (err, dirents) => {
          if (err) {
            console.log('fileIO_test_listfile_async_031 err package ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          console.log('fileIO_test_listfile_async_031 dirents： ' + dirents);
        expect(dirents.length == 0).assertTrue();
          fileIO.rmdirSync(dpath);
      });
    } catch (e) {
      console.log('fileIO_test_listfile_async_031 has failed for ' + e.message + ', code:' + e.code);
      expect(false).assertTrue();
    }
  });

  
});
}
