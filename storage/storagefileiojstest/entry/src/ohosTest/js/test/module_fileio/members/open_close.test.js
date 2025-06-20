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
  fileio, FILE_CONTENT, prepareFile, nextFileName, isIntNum,
  describe, it, expect,
} from '../../Common';
import { Level } from '@ohos/hypium';

export default function fileioOpenClose() {
describe('fileio_open_close', function () {

  /**
   * @tc.number SUB_DF_FILEIO_OPEN_CLOSE_SYNC_0000
   * @tc.name fileio_open_close_sync_000
   * @tc.desc Test openSync() and closeSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_open_close_sync_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_open_close_sync_000');

    try {
      let fd = fileio.openSync(fpath, 0o102, 0o666);
      expect(isIntNum(fd)).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_open_close_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_OPEN_CLOSE_SYNC_0010
   * @tc.name fileio_open_close_sync_001
   * @tc.desc Test openSync() and closeSync() interfaces.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_open_close_sync_001', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_open_close_sync_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath);
      expect(isIntNum(fd)).assertTrue();
      expect(fileio.closeSync(fd) == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_open_close_sync_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_OPEN_SYNC_0000
   * @tc.name fileio_open_sync_000
   * @tc.desc Test openSync() interface.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_open_sync_000', Level.LEVEL0, function () {
    try {
      fileio.openSync('/', 0o102, 0o666);
      expect(null).assertFail();
    } catch (e) {
      console.log('fileio_open_sync_000 has failed for ' + e);
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_OPEN_SYNC_0100
   * @tc.name fileio_open_sync_001
   * @tc.desc Test openSync() interface.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_open_sync_001', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_open_sync_001');

    try {
      fileio.openSync(fpath, 0o102);
      expect(null).assertFail();
    } catch (e) {
      console.log('fileio_open_sync_001 has failed for ' + e);
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_OPEN_SYNC_0200
   * @tc.name fileio_open_sync_002
   * @tc.desc Test openSync() interface.
   * Use default: flag = O_RDONLY, mode = S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileio_open_sync_002', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileio_open_sync_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let fd;

    try {
      fd = fileio.openSync(fpath, undefined, undefined);
      expect(isIntNum(fd)).assertTrue();
      let readLen = fileio.readSync(fd, new ArrayBuffer(4096));
      expect(readLen == FILE_CONTENT.length).assertTrue();
      fileio.writeSync(fd, FILE_CONTENT);
      expect(false).assertTrue();
    } catch (e) {
      fileio.closeSync(fd);
      fileio.unlinkSync(fpath);
      console.log('fileio_open_sync_002 has failed for ' + e);
      expect(e.message == 'Bad file descriptor').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_CLOSE_SYNC_0000
   * @tc.name fileio_close_sync_000
   * @tc.desc Test closeSync() interface.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_close_sync_000', Level.LEVEL0, function () {
    try {
      fileio.closeSync();
      expect(null).assertFail();
    } catch (e) {
      console.log('fileio_close_sync_000 has failed for ' + e);
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_CLOSE_SYNC_0010
   * @tc.name fileio_close_sync_001
   * @tc.desc Test closeSync() interface.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_close_sync_001', Level.LEVEL0, function () {
    try {
      fileio.closeSync(-1);
      expect(null).assertFail();
    } catch (e) {
      console.log('fileio_close_sync_001 has failed for ' + e);
    }
  });
});}
