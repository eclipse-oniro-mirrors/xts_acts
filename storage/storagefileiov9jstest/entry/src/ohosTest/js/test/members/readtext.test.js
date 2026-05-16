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
  fileIO, FILE_CONTENT, prepareFile, nextFileName, describe, it, expect,
} from '../Common';
import { TestType, Size, Level } from '@ohos/hypium';

export default function fileIOReadtext() {
describe('fileIO_fs_readtext', function () {

  /**
   * @tc.name   fileIO_test_readtext_sync_000
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0000
   * @tc.desc   Test readtextSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_readtext_sync_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_readtext_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let str = fileIO.readTextSync(fpath);
      expect(str == FILE_CONTENT).assertTrue();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_readtext_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_readtext_sync_001
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0100
   * @tc.desc   Test readtextSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_readtext_sync_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_readtext_sync_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let str = fileIO.readTextSync(fpath, { offset: 1 });
      expect(str == FILE_CONTENT.substring(1, FILE_CONTENT.length + 1)).assertTrue();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_readtext_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_readtext_sync_002
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0200
   * @tc.desc   Test readtextSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_readtext_sync_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_readtext_sync_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let str = fileIO.readTextSync(fpath, {
        offset: 2,
        length: 4
      });
      expect(str == FILE_CONTENT.substring(2, 6)).assertTrue();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_readtext_sync_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_readtext_sync_003
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0300
   * @tc.desc   Test readtextSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_readtext_sync_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_readtext_sync_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let str = fileIO.readTextSync(fpath, {
        offset: 1,
        length: FILE_CONTENT.length,
        encoding: 'utf-8'
      });
      expect(str == FILE_CONTENT.substring(1, FILE_CONTENT.length + 1)).assertTrue();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_readtext_sync_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_readtext_sync_004
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0400
   * @tc.desc   Test readtextSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_readtext_sync_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {

    try {
      fileIO.readTextSync();
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_readtext_sync_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_readtext_sync_005
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0500
   * @tc.desc   Test readtextSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_readtext_sync_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_readtext_sync_005');

    try {
      fileIO.readTextSync(fpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_readtext_sync_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_readtext_sync_006
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0600
   * @tc.desc   Test readtextSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_readtext_sync_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_readtext_sync_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    
    try {
      const invalidOffset = -1;
      fileIO.readTextSync(fpath, { offset: invalidOffset });
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_readtext_sync_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_readtext_sync_007
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0700
   * @tc.desc   Test readtextSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_readtext_sync_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_readtext_sync_007');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    
    try {
      const invalidOffset = 9999;
      fileIO.readTextSync(fpath, { offset: invalidOffset });
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_readtext_sync_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_readtext_sync_008
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0800
   * @tc.desc   Test readtextSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_readtext_sync_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_readtext_sync_008');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    
    try {
      const invalidLength = -1;
      fileIO.readTextSync(fpath, { length: invalidLength });
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_readtext_sync_008 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_readtext_sync_009
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0900
   * @tc.desc   Test readtextSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_readtext_sync_009', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_readtext_sync_009');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let str = fileIO.readTextSync(fpath, undefined);
      expect(str == FILE_CONTENT).assertTrue();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_readtext_sync_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_readtext_sync_010
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_1000
   * @tc.desc   Test readtextSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_readtext_sync_010', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_readtext_sync_010');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let str = fileIO.readTextSync(fpath, {
        offset: undefined,
        length: undefined,
        encoding: undefined
      });
      expect(str == FILE_CONTENT).assertTrue();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_readtext_sync_010 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_readtext_sync_011
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_1100
   * @tc.desc   Test readtextSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_readtext_sync_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_readtext_sync_011');
    fileIO.mkdirSync(fpath);

    try {
      let str = fileIO.readTextSync(fpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_readtext_sync_011 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900019 && e.message == 'Is a directory').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_readtext_async_000
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0000
   * @tc.desc   Test readtext() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_readtext_async_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_readtext_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    
    try {
      let str = await fileIO.readText(fpath);
      expect(str == FILE_CONTENT).assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_readtext_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_readtext_async_001
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0100
   * @tc.desc   Test readtext() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_readtext_async_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_readtext_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    
    try {
      fileIO.readText(fpath, (err, str) => {
        if (err) {
          console.log('fileIO_test_readtext_async_001 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(str == FILE_CONTENT).assertTrue();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_readtext_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_readtext_async_002
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0200
   * @tc.desc   Test readtext() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_readtext_async_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_readtext_async_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    
    try {
      let str = await fileIO.readText(fpath, { offset: 1 });
      expect(str == FILE_CONTENT.substr(1, FILE_CONTENT.length - 1)).assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_readtext_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });
  
  /**
   * @tc.name   fileIO_test_readtext_async_003
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0300
   * @tc.desc   Test readtext() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_readtext_async_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_readtext_async_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.readText(fpath, { offset: 1 }, (err, str) => {
        if (err) {
          console.log('fileIO_test_readtext_async_003 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(str == FILE_CONTENT.substr(1, FILE_CONTENT.length - 1)).assertTrue();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_readtext_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_readtext_async_004
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0400
   * @tc.desc   Test readtext() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_readtext_async_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_readtext_async_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let str = await fileIO.readText(fpath, {
        offset: 1,
        length: 2
      });
      expect(str == FILE_CONTENT.substr(1, 2)).assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_readtext_async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_readtext_async_005
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0500
   * @tc.desc   Test readtext() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_readtext_async_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_readtext_async_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.readText(fpath, {
        offset: 1,
        length: 2
      }, (err, str) => {
        if (err) {
          console.log('fileIO_test_readtext_async_005 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(str == FILE_CONTENT.substr(1, 2)).assertTrue();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_readtext_async_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });
  
  /**
   * @tc.name   fileIO_test_readtext_async_006
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0600
   * @tc.desc   Test readtext() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_readtext_async_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_readtext_async_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let str = await fileIO.readText(fpath, {
        offset: 1,
        length: FILE_CONTENT.length,
        encoding: 'utf-8'
      });
      expect(str == FILE_CONTENT.slice(1, FILE_CONTENT.length + 1)).assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_readtext_async_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_readtext_async_007
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0700
   * @tc.desc   Test readtext() interfaces. Promise.then().catch()
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_readtext_async_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_readtext_async_007');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.readText(fpath, {
        offset: 1,
        length: FILE_CONTENT.length,
        encoding: 'utf-8'
      }).then((str) => {
        expect(str == FILE_CONTENT.slice(1, FILE_CONTENT.length + 1)).assertTrue();
        fileIO.unlinkSync(fpath);
        done();
      }).catch((err) => {
        console.log('fileIO_test_readtext_async_007 error package: ' + JSON.stringify(err));
        expect(false).assertTrue();
      });
    } catch (e) {
      console.log('fileIO_test_readtext_async_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_readtext_async_008
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0800
   * @tc.desc   Test readtext() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_readtext_async_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_readtext_async_008');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.readText(fpath, {
        offset: 1,
        length: FILE_CONTENT.length,
        encoding: 'utf-8'
      }, (err, str) => {
        if (err) {
          console.log('fileIO_test_readtext_async_008 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(str == FILE_CONTENT.slice(1, FILE_CONTENT.length + 1)).assertTrue();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_readtext_async_008 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_readtext_async_009
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0900
   * @tc.desc   Test readtext() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_readtext_async_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_readtext_async_009');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let str = await fileIO.readText(fpath, {});
      expect(str == FILE_CONTENT).assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_readtext_async_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_readtext_async_010
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_1000
   * @tc.desc   Test readtext() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_readtext_async_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_readtext_async_010');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.readText(fpath, {}, (err, str) => {
        if (err) {
          console.log('fileIO_test_readtext_async_010 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(str == FILE_CONTENT).assertTrue();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_readtext_async_010 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_readtext_async_011
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_1100
   * @tc.desc   Test readtext() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_readtext_async_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_readtext_async_011');

    try {
      await fileIO.readText(fpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_readtext_async_011 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_readtext_async_012
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_1200
   * @tc.desc   Test readtext() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_readtext_async_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_readtext_async_012');

    try {
      fileIO.readText(fpath, (err) => {
        if (err) {
          console.log('fileIO_test_readtext_async_012 error: {message:' + err.message + ', code: ' + err.code + '}');
          expect(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_test_readtext_async_012 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_readtext_async_013
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_1300
   * @tc.desc   Test readtext() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_readtext_async_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_readtext_async_013');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      const invalidOffset = -1;
      await fileIO.readText(fpath, { offset: invalidOffset });
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_readtext_async_013 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_readtext_async_014
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_1400
   * @tc.desc   Test readtext() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_readtext_async_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_readtext_async_014');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    
    try {
      const invalidOffset = 9999;
      await fileIO.readText(fpath, { offset: invalidOffset });
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_readtext_async_014 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_readtext_async_015
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_1500
   * @tc.desc   Test readtext() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_readtext_async_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_readtext_async_015');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      const invalidLength = -1;
      await fileIO.readText(fpath, { length: invalidLength });
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_readtext_async_015 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_readtext_async_016
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_1600
   * @tc.desc   Test readtext() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_readtext_async_016', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_readtext_async_016');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let str = await fileIO.readText(fpath, undefined);
      expect(str == FILE_CONTENT).assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_readtext_async_016 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_readtext_async_017
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_1700
   * @tc.desc   Test readtext() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_readtext_async_017', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_readtext_async_017');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.readText(fpath, undefined, (err, str) => {
        if (err) {
          console.log('fileIO_test_readtext_async_017 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(str == FILE_CONTENT).assertTrue();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_readtext_async_017 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_readtext_async_018
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_1800
   * @tc.desc   Test readtext() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_readtext_async_018', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_readtext_async_018');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let str = await fileIO.readText(fpath, {
        offset: undefined,
        length: undefined,
        encoding: undefined
      });
      expect(str == FILE_CONTENT).assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_readtext_async_018 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_readtext_async_019
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_1900
   * @tc.desc   Test readtext() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_readtext_async_019', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_readtext_async_019');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.readText(fpath, {
        offset: undefined,
        length: undefined,
        encoding: undefined
      }, (err, str) => {
        if (err) {
          console.log('fileIO_test_readtext_async_019 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(str == FILE_CONTENT).assertTrue();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_readtext_async_019 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_readtext_async_020
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_2000
   * @tc.desc   Test readtext() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_readtext_async_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_readtext_async_020');
    fileIO.mkdirSync(fpath);
    
    try {
      let str = await fileIO.readText(fpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_readtext_async_020 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900019 && e.message == 'Is a directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_readtext_async_021
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_2100
   * @tc.desc   Test readtext() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_readtext_async_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_readtext_async_021');
    fileIO.mkdirSync(fpath);
    
    try {
      fileIO.readText(fpath, (err) => {
        if (err) {
          console.log('fileIO_test_readtext_async_021 error package: ' + err.message + ', code: ' + err.code);
          expect(err.code == 13900019 && err.message == 'Is a directory').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_test_readtext_async_021 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });
});
}
