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

export default function fileioCopyfile() {
describe('fileio_copyfile', function () {

  /**
   * @tc.number SUB_DF_FILEIO_COPY_FILE_SYNC_0000
   * @tc.name fileio_copy_file_sync_000
   * @tc.desc Test copyFileSync() interfaces. Test file copied successfully.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_copy_file_sync_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_copy_file_sync_000');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.copyFileSync(fpath, fpathTarget);
      fileio.accessSync(fpathTarget);
      fileio.unlinkSync(fpath);
      fileio.unlinkSync(fpathTarget);
    } catch (e) {
      console.info('fileio_copy_file_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_COPY_FILE_SYNC_0100
   * @tc.name fileio_copy_file_sync_001
   * @tc.desc Test copyFileSync() interfaces. Test file copied successfully.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_copy_file_sync_001', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_copy_file_sync_001');
    let fpathTarget = fpath + 'tgt';
    let fd = fileio.openSync(fpath, 0o102, 0o666);

    try {
      fileio.copyFileSync(fd, fpathTarget);
      fileio.accessSync(fpathTarget);
      fileio.closeSync(fd);
      fileio.unlinkSync(fpath);
      fileio.unlinkSync(fpathTarget);
    } catch (e) {
      console.info('fileio_copy_file_sync_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_COPY_FILE_SYNC_0200
   * @tc.name fileio_copy_file_sync_002
   * @tc.desc Test copyFileSync() interfaces, invalid path.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_copy_file_sync_002', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_copy_file_sync_002');
    let fpathTarget = fpath + 'tgt';

    try {
      fileio.copyFileSync(fpath, fpathTarget);
    } catch (e) {
      console.info('fileio_copy_file_sync_002 has failed for ' + e);
      expect(e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_COPY_FILE_SYNC_0300
   * @tc.name fileio_copy_file_sync_003
   * @tc.desc Test copyFileSync() interfaces, No parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_copy_file_sync_003', Level.LEVEL0, function () {
    try {
      fileio.copyFileSync();
    } catch (e) {
      console.info('fileio_copy_file_sync_003 has failed for ' + e);
      expect(e.message == 'Number of arguments unmatched').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_COPY_FILE_SYNC_0400
   * @tc.name fileio_copy_file_sync_004
   * @tc.desc Test copyFileSync() interfaces, No parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileio_copy_file_sync_004', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileio_copy_file_sync_004');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.copyFileSync(fpath, fpathTarget, undefined);
      let stat1 = fileio.statSync(fpath);
      let stat2 = fileio.statSync(fpathTarget);
      expect(stat1.size == stat2.size).assertTrue();
      fileio.unlinkSync(fpath);
      fileio.unlinkSync(fpathTarget);
    } catch (e) {
      console.log('fileio_copy_file_sync_004 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_0000
   * @tc.name fileio_copy_file_async_000
   * @tc.desc Test copyFile() interfaces, return in promise mode. Test file copied successfully.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_copy_file_async_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_copy_file_async_000');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileio.copyFile(fpath, fpathTarget);
      fileio.accessSync(fpathTarget);
      fileio.unlinkSync(fpath);
      fileio.unlinkSync(fpathTarget);
      done();
    } catch (e) {
      console.info('fileio_copy_file_async_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_0100
   * @tc.name fileio_copy_file_async_001
   * @tc.desc Test copyFile() interfaces, return in callback mode. Test file copied successfully.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_copy_file_async_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_copy_file_async_001');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.copyFile(fpath, fpathTarget, function (error) {
        fileio.accessSync(fpathTarget);
        fileio.unlinkSync(fpath);
        fileio.unlinkSync(fpathTarget);
        done();
      });
    } catch (e) {
      console.info('fileio_copy_file_async_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_0200
   * @tc.name fileio_copy_file_async_002
   * @tc.desc Test copyFile() interfaces, return in promise mode. Test file copied successfully.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_copy_file_async_002', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_copy_file_async_002');
    let fpathTarget = fpath + 'tgt';
    let fd = fileio.openSync(fpath, 0o102, 0o666);

    try {
      await fileio.copyFile(fd, fpathTarget);
      fileio.accessSync(fpathTarget);
      fileio.closeSync(fd);
      fileio.unlinkSync(fpath);
      fileio.unlinkSync(fpathTarget);
      done();
    } catch (e) {
      console.info('fileio_copy_file_async_002 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_0300
   * @tc.name fileio_copy_file_async_003
   * @tc.desc Test copyFile() interfaces, Invalid path.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_copy_file_async_003', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_copy_file_async_003');
    let fpathTarget = fpath + 'tgt';
    try {
      await fileio.copyFile(fpath, fpathTarget);
    } catch (e) {
      console.info('fileio_copy_file_async_003 has failed for ' + e);
      expect(e.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_0400
   * @tc.name fileio_copy_file_async_004
   * @tc.desc Test copyFile() interfaces. Invalid argument fd < 0.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_copy_file_async_004', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_copy_file_async_004');
    try {
      await fileio.copyFile(-1, fpath);
    } catch (e) {
      console.info('fileio_copy_file_async_004 has failed for ' + e);
      expect(e.message == 'The first/second argument requires filepath/fd').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_0500
   * @tc.name fileio_copy_file_async_005
   * @tc.desc Test copyFile() interfaces, Invalid mode.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_copy_file_async_005', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_copy_file_async_005');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.copyFile(fpath, fpathTarget, '1', function (error) {
      });
    } catch (e) {
      console.info('fileio_copy_file_async_005 has failed for ' + e);
      expect(e.message == 'Invalid mode' || e.message == 'Invalid arg').assertTrue();
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_0600
   * @tc.name fileio_copy_file_async_006
   * @tc.desc Test copyFile() interfaces, No parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_copy_file_async_006', Level.LEVEL0, async function (done) {
    try {
      await fileio.copyFile();
    } catch (e) {
      console.info('fileio_copy_file_async_006 has failed for ' + e);
      expect(e.message == 'Number of arguments unmatched').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_0700
   * @tc.name fileio_copy_file_async_007
   * @tc.desc Test copyFile() interfaces. Promise.
   * Undefined option arguments, use default mode = 0.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileio_copy_file_async_007', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_copy_file_async_007');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileio.copyFile(fpath, fpathTarget, undefined);
      let stat1 = fileio.statSync(fpath);
      let stat2 = fileio.statSync(fpathTarget);
      expect(stat1.size == stat2.size).assertTrue();
      fileio.unlinkSync(fpath);
      fileio.unlinkSync(fpathTarget);
      done();
    } catch (e) {
      console.log('fileio_copy_file_async_007 has failed for ' + e);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_0800
   * @tc.name fileio_copy_file_async_008
   * @tc.desc Test copyFile() interfaces. Callback.
   * Undefined option arguments, use default mode = 0.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileio_copy_file_async_008', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileio_copy_file_async_008');
    let fpathTarget = fpath + 'tgt';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.copyFile(fpath, fpathTarget, undefined, (err) => {
        if (err) {
          console.log('fileio_copy_file_async_008 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        let stat1 = fileio.statSync(fpath);
        let stat2 = fileio.statSync(fpathTarget);
        expect(stat1.size == stat2.size).assertTrue();
        fileio.unlinkSync(fpath);
        fileio.unlinkSync(fpathTarget);
        done();
      });
    } catch (e) {
      console.log('fileio_copy_file_async_008 has failed for ' + e);
      expect(false).assertTrue();
    }
  });
});
}
