/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
  fileio, FILE_CONTENT, prepareFile, nextFileName, isString, isBoolean, forceRemoveDir,
  describe, it, expect,
} from '../../Common';
import { Level } from '@ohos/hypium';

export default function fileioDirRead() {
describe('fileio_dir_read', function () {

  /**
   * @tc.number SUB_DF_FILEIO_DIR_READ_ASYNC_0000
   * @tc.name fileio_test_dir_read_async_000
   * @tc.desc Test Dir read() interface,return in promise mode.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_dir_read_async_000', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileio_test_dir_read_async_000') + 'd';
    let fpath = dpath + '/f1';

    try {
      fileio.mkdirSync(dpath);
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let dd = fileio.opendirSync(dpath);
      let dir = await dd.read();
      dd.closeSync();
      fileio.unlinkSync(fpath);
      fileio.rmdirSync(dpath);
      done();
    }
    catch (e) {
      console.info('fileio_test_dir_read_async_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_DIR_READ_ASYNC_0100
   * @tc.name fileio_test_dir_read_async_001
   * @tc.desc Test Dir read() interface,return in callback mode.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_dir_read_async_001', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileio_test_dir_read_async_001') + 'd';
    let fpath = dpath + '/f1';

    try {
      fileio.mkdirSync(dpath);
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let dd = fileio.opendirSync(dpath);
      dd.read(function (err, dirent) {
        dd.closeSync();
        fileio.unlinkSync(fpath);
        fileio.rmdirSync(dpath);
        done();
      });
    } catch (e) {
      console.info('fileio_test_dir_read_async_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_DIR_READ_ASYNC_0200
   * @tc.name fileio_test_dir_read_async_002
   * @tc.desc Test Dir read() interface,there are multiple parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
   it('fileio_test_dir_read_async_002', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileio_test_dir_read_async_002') + 'd';
    let fpath = dpath + '/f1';
    let dd  = null
    try {
      fileio.mkdirSync(dpath);
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      dd = fileio.opendirSync(dpath);
      dd.read(-1,function (err, dirent) {

      });
    } catch (e) {
      console.info('fileio_test_dir_read_async_002 has failed for ' + e);
      expect(e.message == "Number of arguments unmatched").assertTrue();
      dd.closeSync();
      fileio.unlinkSync(fpath);
      fileio.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_DIR_READ_SYNC_0000
   * @tc.name fileio_dir_read_sync_000
   * @tc.desc Test Dir readSync() interface.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_dir_read_sync_000', Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileio_dir_read_sync_000') + 'd';
    let fpath = dpath + '/f1';

    try {
      fileio.mkdirSync(dpath);
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let dd = fileio.opendirSync(dpath);
      dd.readSync();
      dd.closeSync();
      fileio.unlinkSync(fpath);
      fileio.rmdirSync(dpath);
    } catch (e) {
      console.info('fileio_dir_read_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_DIR_READ_SYNC_0100
   * @tc.name fileio_dir_read_sync_001
   * @tc.desc Test Dir.readSync() interface,there are multiple parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_dir_read_sync_001', Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileio_dir_read_sync_001') + 'd';
    let fpath = dpath + '/f1';
    let dd = null;
    try {
      fileio.mkdirSync(dpath);
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      dd = fileio.opendirSync(dpath);
      dd.readSync(-1);
    } catch (e) {
      console.info('fileio_dir_read_sync_001 has failed for ' + e);
      expect(e.message == "Number of arguments unmatched").assertTrue();
      dd.closeSync();
      fileio.unlinkSync(fpath);
      fileio.rmdirSync(dpath);
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_DIR_READ_SYNC_NAME_0000
   * @tc.name fileio_dir_read_sync_name_000
   * @tc.desc Test Dir.readSync() interface.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_dir_read_sync_name_000', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileio_dir_read_sync_name_000') + 'd';
    let fpath = dpath + '/f1';
    try {
      fileio.mkdirSync(dpath);
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let dd = await fileio.opendir(dpath);
      let dir = dd.readSync();
      expect(isString(dir.name)).assertTrue();
      expect(fpath.indexOf(dir.name) > -1).assertTrue();
      fileio.unlinkSync(fpath);
      fileio.rmdirSync(dpath);
      done();
    } catch (e) {
      console.info('fileio_dir_read_sync_name_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_DIR_READ_SYNC_NAME_0100
   * @tc.name fileio_dir_read_sync_name_001
   * @tc.desc Test Dir.readSync() interface. Synchronous loop reads next directory entry.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_dir_read_sync_name_001', Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileio_dir_read_sync_name_001') + 'd';
    fileio.mkdirSync(dpath);
    let fdpath = dpath;

    try {
      for (let i = 0; i < 10; i++) {
        console.info('time' + i);
        dpath = dpath + '/d' + i;
        fileio.mkdirSync(dpath);
      }
      let dir = fileio.opendirSync(fdpath);
      let dirent = dir.readSync();
      while (dirent) {
        fdpath = fdpath + '/' + dirent.name;
        dir = fileio.opendirSync(fdpath);
        dirent = dir.readSync();
      }
      forceRemoveDir(dpath, 10);
    } catch (e) {
      console.info('fileio_dir_read_sync_name_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_DIR_READ_SYNC_ISBLOCKDEVICE_0000
   * @tc.name fileio_dir_read_sync_isBlockDevice_000
   * @tc.desc Test Dir.readSync() interface.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_dir_read_sync_isBlockDevice_000', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileio_dir_read_sync_isBlockDevice_000') + 'd';
    let fpath = dpath + '/f1';
    try {
      fileio.mkdirSync(dpath);
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let dd = await fileio.opendir(dpath);
      let dir = dd.readSync();
      expect(isBoolean(dir.isBlockDevice())).assertTrue();
      expect(dir.isBlockDevice() === false).assertTrue();
      fileio.unlinkSync(fpath);
      fileio.rmdirSync(dpath);
      done();
    } catch (e) {
      console.info('fileio_dir_read_sync_isBlockDevice_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_DIR_READ_SYNC_ISCHARACTERDEVICE_0000
   * @tc.name fileio_dir_read_sync_isCharacterDevice_000
   * @tc.desc Test Dir.readSync() interface.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_dir_read_sync_isCharacterDevice_000', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileio_dir_read_sync_isCharacterDevice_000') + 'd';
    let fpath = dpath + '/f1';
    try {
      fileio.mkdirSync(dpath);
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let dd = await fileio.opendir(dpath);
      let dir = dd.readSync();
      expect(isBoolean(dir.isCharacterDevice())).assertTrue();
      expect(dir.isCharacterDevice() === false).assertTrue();
      fileio.unlinkSync(fpath);
      fileio.rmdirSync(dpath);
      done();
    } catch (e) {
      console.info('fileio_dir_read_sync_isCharacterDevice_000 has failed for ' + e);
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_DIR_READ_SYNC_ISDIRECTORY_0000
   * @tc.name fileio_dir_read_sync_isDirectory_000
   * @tc.desc Test Dir.readSync() interface.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_dir_read_sync_isDirectory_000', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileio_dir_read_sync_isDirectory_000') + 'd';
    let fpath = dpath + '/f1';
    try {
      fileio.mkdirSync(dpath);
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let dd = await fileio.opendir(dpath);
      let dir = dd.readSync();
      expect(isBoolean(dir.isDirectory())).assertTrue();
      expect(dir.isDirectory() === false).assertTrue();
      fileio.unlinkSync(fpath);
      fileio.rmdirSync(dpath);
      done();
    } catch (e) {
      console.info('fileio_dir_read_sync_isDirectory_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_DIR_READ_SYNC_ISFIFO_0000
   * @tc.name fileio_dir_read_sync_isFIFO_000
   * @tc.desc Test Dir.readSync() interface.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_dir_read_sync_isFIFO_000', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileio_dir_read_sync_isFIFO_000') + 'd';
    let fpath = dpath + '/f1';
    try {
      fileio.mkdirSync(dpath);
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let dd = await fileio.opendir(dpath);
      let dir = dd.readSync();
      expect(isBoolean(dir.isFIFO())).assertTrue();
      expect(dir.isFIFO() === false).assertTrue();
      fileio.unlinkSync(fpath);
      fileio.rmdirSync(dpath);
      done();
    } catch (e) {
      console.info('fileio_dir_read_sync_isFIFO_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_DIR_READ_SYNC_ISFILE_0000
   * @tc.name fileio_dir_read_sync_isFile_000
   * @tc.desc Test Dir.readSync() interface.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_dir_read_sync_isFile_000', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileio_dir_read_sync_isFile_000') + 'd';
    let fpath = dpath + '/f1';
    try {
      fileio.mkdirSync(dpath);
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let dd = await fileio.opendir(dpath);
      let dir = dd.readSync();
      expect(isBoolean(dir.isFile())).assertTrue();
      expect(dir.isFile()).assertTrue();
      fileio.unlinkSync(fpath);
      fileio.rmdirSync(dpath);
      done();
    } catch (e) {
      console.info('fileio_dir_read_sync_isFile_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_DIR_READ_SYNC_ISCOCKET_0000
   * @tc.name fileio_dir_read_sync_isSocket_000
   * @tc.desc Test Dir.readSync() interface.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_dir_read_sync_isSocket_000', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileio_dir_read_sync_isSocket_000') + 'd';
    let fpath = dpath + '/f1';
    try {
      fileio.mkdirSync(dpath);
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let dd = await fileio.opendir(dpath);
      let dir = dd.readSync();
      expect(isBoolean(dir.isSocket())).assertTrue();
      expect(dir.isSocket() === false).assertTrue();
      fileio.unlinkSync(fpath);
      fileio.rmdirSync(dpath);
      done();
    } catch (e) {
      console.info('fileio_dir_read_sync_isSocket_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_DIR_READ_SYNC_ISSYMBOLICLINK_0000
   * @tc.name fileio_dir_read_sync_isSymbolicLink_000
   * @tc.desc Test Dir.readSync() interface.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_dir_read_sync_isSymbolicLink_000', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileio_dir_read_sync_isSymbolicLink_000') + 'd';
    let fpath = dpath + '/f1';
    try {
      fileio.mkdirSync(dpath);
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let dd = await fileio.opendir(dpath);
      let dir = dd.readSync();
      expect(isBoolean(dir.isSymbolicLink())).assertTrue();
      expect(dir.isSymbolicLink() === false).assertTrue();
      fileio.unlinkSync(fpath);
      fileio.rmdirSync(dpath);
      done();
    } catch (e) {
      console.info('fileio_dir_read_sync_isSymbolicLink_000 has failed for ' + e);
      expect(null);
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_DIR_READ_ASYNC_NAME_0000
   * @tc.name fileio_dir_read_async_name_000
   * @tc.desc Test Dir.readAsync() interface.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_dir_read_async_name_000', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileio_dir_read_async_name_000') + 'd';
    let fpath = dpath + '/f1';
    try {
      fileio.mkdirSync(dpath);
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let dd = await fileio.opendir(dpath);
      let dir = await dd.read();
      expect(isString(dir.name)).assertTrue();
      expect(fpath.indexOf(dir.name) > -1).assertTrue();
      fileio.unlinkSync(fpath);
      fileio.rmdirSync(dpath);
      done();
    } catch (e) {
      console.info('fileio_dir_read_async_name_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_DIR_READ_ASYNC_NAME_0100
   * @tc.name fileio_dir_read_async_name_001
   * @tc.desc Test Dir.readAsync() interface. Asynchronously loop to read next directory item.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_dir_read_async_name_001', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileio_dir_read_async_name_001') + 'd';
    fileio.mkdirSync(dpath);
    let fdpath = dpath;

    try {
      for (let i = 0; i < 10; i++) {
        console.info('time' + i);
        dpath = dpath + '/d' + i;
        fileio.mkdirSync(dpath);
      }
      let dir = fileio.opendirSync(fdpath);
      let dirent = await dir.read();
      while (dirent) {
        fdpath = fdpath + '/' + dirent.name;
        dir = fileio.opendirSync(fdpath);
        dirent = await dir.read();
      }
      forceRemoveDir(dpath, 10);
      done();
    } catch (e) {
      console.info('fileio_dir_read_async_name_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_DIR_READ_ASYNC_ISBLOCKDEVICE_0000
   * @tc.name fileio_dir_read_async_isBlockDevice_000
   * @tc.desc Test Dir.readAsync() interface.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_dir_read_async_isBlockDevice_000', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileio_dir_read_async_isBlockDevice_000') + 'd';
    let fpath = dpath + '/f1';
    try {
      fileio.mkdirSync(dpath);
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let dd = await fileio.opendir(dpath);
      let dir = await dd.read();
      expect(isBoolean(dir.isBlockDevice())).assertTrue();
      expect(dir.isBlockDevice() === false).assertTrue();
      fileio.unlinkSync(fpath);
      fileio.rmdirSync(dpath);
      done();
    } catch (e) {
      console.info('fileio_dir_read_async_isBlockDevice_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_DIR_READ_ASYNC_ISCHARACTERDEVICE_0000
   * @tc.name fileio_dir_read_async_isCharacterDevice_000
   * @tc.desc Test Dir.readAsync() interface.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */

  it('fileio_dir_read_async_isCharacterDevice_000', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileio_dir_read_async_isCharacterDevice_000') + 'd';
    let fpath = dpath + '/f1';
    try {
      fileio.mkdirSync(dpath);
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let dd = await fileio.opendir(dpath);
      let dir = await dd.read();
      expect(isBoolean(dir.isCharacterDevice())).assertTrue();
      expect(dir.isCharacterDevice() === false).assertTrue();
      fileio.unlinkSync(fpath);
      fileio.rmdirSync(dpath);
      done();
    } catch (e) {
      console.info('fileio_dir_read_async_isCharacterDevice_000 has failed for ' + e);
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_DIR_READ_ASYNC_ISDIRECTORY_0000
   * @tc.name fileio_dir_read_async_isDirectory_000
   * @tc.desc Test Dir.readAsync() interface.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_dir_read_async_isDirectory_000', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileio_dir_read_async_isDirectory_000') + 'd';
    let fpath = dpath + '/f1';
    try {
      fileio.mkdirSync(dpath);
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let dd = await fileio.opendir(dpath);
      let dir = await dd.read();
      expect(isBoolean(dir.isDirectory())).assertTrue();
      expect(dir.isDirectory() === false).assertTrue();
      fileio.unlinkSync(fpath);
      fileio.rmdirSync(dpath);
      done();
    } catch (e) {
      console.info('fileio_dir_read_async_isDirectory_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_DIR_READ_ASYNC_ISFIFO_0000
   * @tc.name fileio_dir_read_async_isFIFO_000
   * @tc.desc Test Dir.readAsync() interface.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_dir_read_async_isFIFO_000', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileio_dir_read_async_isFIFO_000') + 'd';
    let fpath = dpath + '/f1';
    try {
      fileio.mkdirSync(dpath);
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let dd = await fileio.opendir(dpath);
      let dir = await dd.read();
      expect(isBoolean(dir.isFIFO())).assertTrue();
      expect(dir.isFIFO() === false).assertTrue();
      fileio.unlinkSync(fpath);
      fileio.rmdirSync(dpath);
      done();
    } catch (e) {
      console.info('fileio_dir_read_async_isFIFO_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_DIR_READ_ASYNC_ISFILE_0000
   * @tc.name fileio_dir_read_async_isFile_000
   * @tc.desc Test Dir.readAsync() interface.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_dir_read_async_isFile_000', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileio_dir_read_async_isFile_000') + 'd';
    let fpath = dpath + '/f1';
    try {
      fileio.mkdirSync(dpath);
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let dd = await fileio.opendir(dpath);
      let dir = await dd.read();
      expect(isBoolean(dir.isFile())).assertTrue();
      expect(dir.isFile()).assertTrue();
      fileio.unlinkSync(fpath);
      fileio.rmdirSync(dpath);
      done();
    } catch (e) {
      console.info('fileio_dir_read_async_isFile_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_DIR_READ_ASYNC_ISSOCKET_0000
   * @tc.name fileio_dir_read_async_isSocket_000
   * @tc.desc Test Dir.readAsync() interface.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_dir_read_async_isSocket_000', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileio_dir_read_async_isSocket_000') + 'd';
    let fpath = dpath + '/f1';
    try {
      fileio.mkdirSync(dpath);
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let dd = await fileio.opendir(dpath);;
      let dir = await dd.read();;
      expect(isBoolean(dir.isSocket())).assertTrue();
      expect(dir.isSocket() === false).assertTrue();
      fileio.unlinkSync(fpath);
      fileio.rmdirSync(dpath);
      done();
    } catch (e) {
      console.info('fileio_dir_read_async_isSocket_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_DIR_READ_ASYNC_ISSYMBOLICLINK_0000
   * @tc.name fileio_dir_read_async_isSymbolicLink_000
   * @tc.desc Test Dir.readAsync() interface.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_dir_read_async_isSymbolicLink_000', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileio_dir_read_async_isSymbolicLink_000') + 'd';
    let fpath = dpath + '/f1';
    try {
      fileio.mkdirSync(dpath);
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let dd = await fileio.opendir(dpath);
      let dir = await dd.read();
      expect(isBoolean(dir.isSymbolicLink())).assertTrue();
      expect(dir.isSymbolicLink() === false).assertTrue();
      fileio.unlinkSync(fpath);
      fileio.rmdirSync(dpath);
      done();
    } catch (e) {
      console.info('fileio_dir_read_async_isSymbolicLink_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });
})}
