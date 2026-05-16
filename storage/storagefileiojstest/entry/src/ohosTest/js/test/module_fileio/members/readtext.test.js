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
  fileio, FILE_CONTENT, prepareFile, nextFileName,
  describe, it, expect,
} from '../../Common';
import { Level } from '@ohos/hypium';

export default function fileioReadtext() {
describe('fileio_readtext', function () {

  /**
   * @tc.name   fileio_test_readtext_sync_000
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0000
   * @tc.desc   Test readtextSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_readtext_sync_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_readtext_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      let str = fileio.readTextSync(fpath);
      expect(str == FILE_CONTENT).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_test_readtext_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_readtext_sync_001
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0100
   * @tc.desc   Test readtextSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_readtext_sync_001', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_readtext_sync_001');
    let pos = 1;
    let len = 0;
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let str = fileio.readTextSync(fpath, { position: pos });
      expect(str == FILE_CONTENT.substring(pos, FILE_CONTENT.length + 1)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_test_readtext_sync_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_readtext_sync_002
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0200
   * @tc.desc   Test readtextSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_readtext_sync_002', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_readtext_sync_002');
    let pos = 1;
    let len = FILE_CONTENT.length;
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let str = fileio.readTextSync(fpath, { position: pos, length: len });
      expect(str == FILE_CONTENT.substring(pos, len + 1)).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_test_readtext_sync_002 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_readtext_sync_003
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0300
   * @tc.desc   Test readtextSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_readtext_sync_003', Level.LEVEL0, function () {
    try {
      fileio.readTextSync();
      expect(null).assertFail();
    } catch (e) {
      console.log('fileio_test_readtext_sync_003 has failed for ' + e);
    }
  });

  /**
   * @tc.name   fileio_test_readtext_sync_004
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0400
   * @tc.desc   Test readtextSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_readtext_sync_004', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_readtext_sync_004');

    try {
      fileio.readTextSync(fpath);
      expect(null).assertFail();
    } catch (e) {
      console.log('fileio_test_readtext_sync_004 has failed for ' + e);
    }
  });

  /**
   * @tc.name   fileio_test_readtext_sync_005
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0500
   * @tc.desc   Test readtextSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_readtext_sync_005', Level.LEVEL0, async function () {
    const invalidLength = -1;
    let fpath = await nextFileName('fileio_test_readtext_sync_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.readTextSync(fpath, { length: invalidLength });
      expect(false).assertTrue();
    } catch (e) {
      fileio.unlinkSync(fpath);
      console.log('fileio_test_readtext_sync_005 has failed for ' + e);
    }
  });

  /**
   * @tc.name   fileio_test_readtext_sync_006
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0600
   * @tc.desc   Test readtextSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_readtext_sync_006', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileio_test_readtext_sync_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let str = fileio.readTextSync(fpath, undefined);
      expect(str == FILE_CONTENT).assertTrue();
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileio_test_readtext_sync_006 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_readtext_sync_007
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0700
   * @tc.desc   Test readtextSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_readtext_sync_007', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileio_test_readtext_sync_007');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let str = fileio.readTextSync(fpath, {
        position: undefined,
        length: undefined,
        encoding: undefined,
      });
      expect(str == FILE_CONTENT).assertTrue();
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileio_test_readtext_sync_007 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_readtext_sync_008
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0800
   * @tc.desc   Test readtextSync() interfaces. filePath parameter is empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_readtext_sync_008', Level.LEVEL3, function () {
    try {
      fileio.readTextSync('');
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_test_readtext_sync_008 has failed for ' + e);
      expect(e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_readtext_sync_009
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_0900
   * @tc.desc   Test readtextSync() interfaces. filePath parameter is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_readtext_sync_009', Level.LEVEL3, function () {
    try {
      fileio.readTextSync(null);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_test_readtext_sync_009 has failed for ' + e);
      expect(e.message == 'Invalid path').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_readtext_sync_010
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_1000
   * @tc.desc   Test readtextSync() interfaces. filePath parameter is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_readtext_sync_010', Level.LEVEL3, function () {
    try {
      fileio.readTextSync(undefined);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_test_readtext_sync_010 has failed for ' + e);
      expect(e.message == 'Invalid path').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_readtext_sync_011
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_1100
   * @tc.desc   Test readtextSync() interfaces. options parameter is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_readtext_sync_011', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileio_test_readtext_sync_011');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let str = fileio.readTextSync(fpath, null);
      expect(str == FILE_CONTENT).assertTrue();
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileio_test_readtext_sync_011 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_readtext_sync_012
   * @tc.number SUB_DF_FILEIO_READ_TEXT_SYNC_1200
   * @tc.desc   Test readtextSync() interfaces. options parameter is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_readtext_sync_012', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileio_test_readtext_sync_012');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let str = fileio.readTextSync(fpath, undefined);
      expect(str == FILE_CONTENT).assertTrue();
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.log('fileio_test_readtext_sync_012 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_readtext_async_000
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0000
   * @tc.desc   Test readtext() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_readtext_async_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_readtext_async_000');
    let pos = 1;
    let len = FILE_CONTENT.length;
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.readText(fpath, { position: pos, length: len, encoding: 'utf-8' }, function (err, str) {
        expect(str == FILE_CONTENT.substr(pos, len)).assertTrue();
        fileio.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileio_test_readtext_async_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_readtext_async_001
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0100
   * @tc.desc   Test readtext() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_readtext_async_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_readtext_async_001');
    let pos = 1;
    let len = FILE_CONTENT.length;
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.readText(fpath, { position: 1 }, function (err, str) {
        expect(str == FILE_CONTENT.substr(pos, len)).assertTrue();
        expect(fileio.unlinkSync(fpath) == null).assertTrue();
        done();
      });
    } catch (e) {
      console.log('fileio_test_readtext_async_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_readtext_async_002
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0200
   * @tc.desc   Test readtext() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_readtext_async_002', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_readtext_async_002');
    let pos = 1;
    let len = FILE_CONTENT.length;
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.readText(fpath, { position: 1 }, function (err, str) {
        expect(str == FILE_CONTENT.substr(pos, len)).assertTrue();
        expect(fileio.unlinkSync(fpath) == null).assertTrue();
      });
      fileio.readText(fpath, { position: 1 })
        .then(function (str) {
          expect(str == FILE_CONTENT.substr(pos, len)).assertTrue();
        })
        .catch(function (e) {
          expect(e == null).assertTrue();
        });
      done();
    } catch (e) {
      console.log('fileio_test_readtext_async_002 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_readtext_async_003
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0300
   * @tc.desc   Test readtext() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_readtext_async_003', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_readtext_async_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    
    try {
      let str = await fileio.readText(fpath, undefined);
      expect(str == FILE_CONTENT).assertTrue();
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileio_test_readtext_async_003 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_readtext_async_004
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0400
   * @tc.desc   Test readtext() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_readtext_async_004', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_readtext_async_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    
    try {
      fileio.readText(fpath, undefined, (err, str) => {
        if (err) {
          console.log('fileio_test_readtext_async_004 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(str == FILE_CONTENT).assertTrue();
        fileio.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileio_test_readtext_async_004 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_readtext_async_005
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0500
   * @tc.desc   Test readtext() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_readtext_async_005', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_readtext_async_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let str = await fileio.readText(fpath, {
        position: undefined,
        length: undefined,
        encoding: undefined,
      });
      expect(str == FILE_CONTENT).assertTrue();
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileio_test_readtext_async_005 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_readtext_async_006
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0600
   * @tc.desc   Test readtext() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_readtext_async_006', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_readtext_async_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.readText(fpath, {
        position: undefined,
        length: undefined,
        encoding: undefined,
      }, (err, str) => {
        if (err) {
          console.log('fileio_test_readtext_async_006 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(str == FILE_CONTENT).assertTrue();
        fileio.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileio_test_readtext_async_006 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_readtext_async_006Adapt001
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0600
   * @tc.desc   Test readtext() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_readtext_async_006Adapt001', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_readtext_async_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let str = await fileio.readText(fpath);
      expect(str == FILE_CONTENT).assertTrue();
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileio_test_readtext_async_006 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_readtext_async_007
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0700
   * @tc.desc   Test readtext() interfaces. Promise. filePath parameter is empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_readtext_async_007', Level.LEVEL3, async function (done) {
    try {
      await fileio.readText('');
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_test_readtext_async_007 has failed for ' + e);
      expect(e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_test_readtext_async_008
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0800
   * @tc.desc   Test readtext() interfaces. Promise. filePath parameter is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_readtext_async_008', Level.LEVEL3, async function (done) {
    try {
      await fileio.readText(null);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_test_readtext_async_008 has failed for ' + e);
      expect(e.message == 'Invalid path').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_test_readtext_async_009
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_0900
   * @tc.desc   Test readtext() interfaces. Promise. filePath parameter is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_readtext_async_009', Level.LEVEL3, async function (done) {
    try {
      await fileio.readText(undefined);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileio_test_readtext_async_009 has failed for ' + e);
      expect(e.message == 'Invalid path').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_test_readtext_async_010
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_1000
   * @tc.desc   Test readtext() interfaces. Promise. options parameter is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_readtext_async_010', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_readtext_async_010');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let str = await fileio.readText(fpath, null);
      expect(str == FILE_CONTENT).assertTrue();
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileio_test_readtext_async_010 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_readtext_async_011
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_1100
   * @tc.desc   Test readtext() interfaces. Promise. options parameter is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_readtext_async_011', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_readtext_async_011');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let str = await fileio.readText(fpath, undefined);
      expect(str == FILE_CONTENT).assertTrue();
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileio_test_readtext_async_011 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_readtext_async_012
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_1200
   * @tc.desc   Test readtext() interfaces. Callback. filePath parameter is empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_readtext_async_012', Level.LEVEL3, async function (done) {
    try {
      fileio.readText('', { position: 1 }, (err, str) => {
        if (err) {
          console.log('fileio_test_readtext_async_012 error: ' + err);
          expect(err.message == 'Invalid argument').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileio_test_readtext_async_012 has failed for ' + e);
      expect(e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_test_readtext_async_013
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_1300
   * @tc.desc   Test readtext() interfaces. Callback. filePath parameter is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_readtext_async_013', Level.LEVEL3, async function (done) {
    try {
      fileio.readText(null, { position: 1 }, (err, str) => {
        if (err) {
          console.log('fileio_test_readtext_async_013 error: ' + err);
          expect(err.message == 'Invalid path').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileio_test_readtext_async_013 has failed for ' + e);
      expect(e.message == 'Invalid path').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_test_readtext_async_014
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_1400
   * @tc.desc   Test readtext() interfaces. Callback. filePath parameter is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_readtext_async_014', Level.LEVEL3, async function (done) {
    try {
      fileio.readText(undefined, { position: 1 }, (err, str) => {
        if (err) {
          console.log('fileio_test_readtext_async_014 error: ' + err);
          expect(err.message == 'Invalid path').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileio_test_readtext_async_014 has failed for ' + e);
      expect(e.message == 'Invalid path').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_test_readtext_async_015
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_1500
   * @tc.desc   Test readtext() interfaces. Callback. options parameter is null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_readtext_async_015', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_readtext_async_015');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.readText(fpath, null, (err, str) => {
        if (err) {
          console.log('fileio_test_readtext_async_015 error package: ' + err);
          expect(false).assertTrue();
          done();
        }
        expect(str == FILE_CONTENT).assertTrue();
        fileio.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileio_test_readtext_async_015 has failed for ' + e);
      expect(false).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileio_test_readtext_async_016
   * @tc.number SUB_DF_FILEIO_READ_TEXT_ASYNC_1600
   * @tc.desc   Test readtext() interfaces. Callback. options parameter is undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileio_test_readtext_async_016', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_test_readtext_async_016');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.readText(fpath, undefined, (err, str) => {
        if (err) {
          console.log('fileio_test_readtext_async_016 error package: ' + err);
          expect(false).assertTrue();
          done();
        }
        expect(str == FILE_CONTENT).assertTrue();
        fileio.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileio_test_readtext_async_016 has failed for ' + e);
      expect(false).assertTrue();
      done();
    }
  });
});
}
