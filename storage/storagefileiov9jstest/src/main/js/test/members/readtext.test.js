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

export default function fileIOReadtext() {
describe('fileIO_fs_readtext', function () {

  /**
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0000
   * @tc.name fileIO_test_readtext_sync_000
   * @tc.desc Test readtextSync() interfaces.
   * Read file content by path, verify normal function.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_readtext_sync_000', 0, async function () {
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
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0100
   * @tc.name fileIO_test_readtext_sync_001
   * @tc.desc Test readtextSync() interfaces.
   * str.substring(startIndex, [endIndex - 1]): Extracts and returns a string by index.
   * Read file content by path when offset = 1.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_readtext_sync_001', 0, async function () {
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
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0200
   * @tc.name fileIO_test_readtext_sync_002
   * @tc.desc Test readtextSync() interfaces.
   * Read file content by path when offset = 2, length = 4.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_readtext_sync_002', 0, async function () {
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
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0300
   * @tc.name fileIO_test_readtext_sync_003
   * @tc.desc Test readtextSync() interfaces.
   * Read file content by path when offset = 1, length = 11, encoding = 'utf-8'.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_readtext_sync_003', 0, async function () {
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
      console.log('fileIO_test_readtext_sync_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0400
   * @tc.name fileIO_test_readtext_sync_004
   * @tc.desc Test readtextSync() interfaces.
   * Missing parameter.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_readtext_sync_004', 0, async function () {

    try {
      fileIO.readTextSync();
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_readtext_sync_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0500
   * @tc.name fileIO_test_readtext_sync_005
   * @tc.desc Test readtextSync() interfaces.
   * The path point to nothing, no such file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
  */
  it('fileIO_test_readtext_sync_005', 0, async function () {
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
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0600
   * @tc.name fileIO_test_readtext_sync_006
   * @tc.desc Test readtextSync() interfaces.
   * Read file content with invalid offset < 0.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
  */
  it('fileIO_test_readtext_sync_006', 0, async function () {
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
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0700
   * @tc.name fileIO_test_readtext_sync_007
   * @tc.desc Test readtextSync() interfaces.
   * Read file content with invalid offset = 9999.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
  */
  it('fileIO_test_readtext_sync_007', 0, async function () {
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
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0800
   * @tc.name fileIO_test_readtext_sync_008
   * @tc.desc Test readtextSync() interfaces.
   * Read file content with invalid length < 0.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
  */
  it('fileIO_test_readtext_sync_008', 0, async function () {
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
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0000
   * @tc.name fileIO_test_readtext_async_000
   * @tc.desc Test readtext() interfaces. Promise.
   * Read file content by path, verify normal function.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_readtext_async_000', 0, async function (done) {
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
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0100
   * @tc.name fileIO_test_readtext_async_001
   * @tc.desc Test readtext() interfaces. Callback.
   * Read file content by path, verify normal function.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_readtext_async_001', 0, async function (done) {
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
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0200
   * @tc.name fileIO_test_readtext_async_002
   * @tc.desc Test readtext() interfaces. Promise.
   * Read file content by path when offset = 1.
   * str.substr(startIndex, [length]): Extracts and returns a string by index and length of str.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_readtext_async_002', 0, async function (done) {
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
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0300
   * @tc.name fileIO_test_readtext_async_003
   * @tc.desc Test readtext() interfaces. Callback.
   * Read file content by path when offset = 1.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_readtext_async_003', 0, async function (done) {
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
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0400
   * @tc.name fileIO_test_readtext_async_004
   * @tc.desc Test readtext() interfaces. Promise.
   * Read file content by path when offset = 1, length = 2.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_readtext_async_004', 0, async function (done) {
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
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0500
   * @tc.name fileIO_test_readtext_async_005
   * @tc.desc Test readtext() interfaces. Callback.
   * Read file content by path when offset = 1, length = 2.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_readtext_async_005', 0, async function (done) {
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
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0600
   * @tc.name fileIO_test_readtext_async_006
   * @tc.desc Test readtext() interfaces. Promise.
   * Read file content by path when offset = 1, length = 11, encoding = 'utf-8'.
   * str.slice(startIndex, [endIndex - 1]): Extracts and returns a string by index.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_readtext_async_006', 0, async function (done) {
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
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0700
   * @tc.name fileIO_test_readtext_async_007
   * @tc.desc Test readtext() interfaces. Promise.then().catch()
   * Read file content by path when offset = 1, length = 11, encoding = 'utf-8'.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_readtext_async_007', 0, async function (done) {
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
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0800
   * @tc.name fileIO_test_readtext_async_008
   * @tc.desc Test readtext() interfaces. Callback.
   * Read file content by path when offset = 1, length = 11, encoding = 'utf-8'.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_readtext_async_008', 0, async function (done) {
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
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0900
   * @tc.name fileIO_test_readtext_async_009
   * @tc.desc Test readtext() interfaces. Promise.
   * Read file content by path when option parameter is empty.
   * str.slice(startIndex, [endIndex - 1]): Extracts and returns a string by index.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_readtext_async_009', 0, async function (done) {
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
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_1000
   * @tc.name fileIO_test_readtext_async_010
   * @tc.desc Test readtext() interfaces. Callback.
   * Read file content by path when option parameter is empty.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_readtext_async_010', 0, async function (done) {
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
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_1100
   * @tc.name fileIO_test_readtext_async_011
   * @tc.desc Test readtext() interfaces. Promise.
   * The path point to nothing, no such file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_readtext_async_011', 0, async function (done) {
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
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_1200
   * @tc.name fileIO_test_readtext_async_012
   * @tc.desc Test readtext() interfaces. Callback.
   * The path point to nothing, no such file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_readtext_async_012', 0, async function (done) {
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
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_1300
   * @tc.name fileIO_test_readtext_async_013
   * @tc.desc Test readtext() interfaces.
   * Read file content with invalid offset < 0.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_readtext_async_013', 0, async function (done) {
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
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_1400
   * @tc.name fileIO_test_readtext_async_014
   * @tc.desc Test readtext() interfaces.
   * Read file content with invalid offset = 9999.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_readtext_async_014', 0, async function (done) {
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
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_1500
   * @tc.name fileIO_test_readtext_async_015
   * @tc.desc Test readtext() interfaces.
   * Read file content with invalid length < 0.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_readtext_async_015', 0, async function (done) {
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
});
}
