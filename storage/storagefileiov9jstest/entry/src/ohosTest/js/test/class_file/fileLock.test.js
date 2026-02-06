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
  fileIO, FILE_CONTENT, prepareFile, nextFileName, isIntNum, describe, it, expect,
} from '../Common';
import { Level } from '@ohos/hypium';

export default function fileIOFileLock() {
  describe('fileIO_fs_file_lock', function () {

  /**
   * @tc.number FILE_TEST_FILELOCK_PROMISE_0000
   * @tc.name fileIO_test_filelock_promise_000
   * @tc.desc Test lock() interfaces. argument is : default.
   * Open the file, file lock() and unlock()
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_filelock_promise_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_filelock_promise_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      await file.lock();
      file.unlock();
      expect(true).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_filelock_promise_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number FILE_TEST_FILELOCK_PROMISE_0100
   * @tc.name fileIO_test_filelock_promise_001
   * @tc.desc Test lock() interfaces. argument is : true.
   * Open the file, file lock(true) and unlock()
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_filelock_promise_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_filelock_promise_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      await file.lock(true);
      file.unlock();
      expect(true).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_filelock_promise_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number FILE_TEST_FILELOCK_PROMISE_0200
   * @tc.name fileIO_test_filelock_promise_002
   * @tc.desc Test lock() interfaces. argument is : false.
   * Open the file, file lock(false) and unlock()
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_filelock_promise_002', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_filelock_promise_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      await file.lock(false);
      file.unlock();
      expect(true).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_filelock_promise_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number FILE_TEST_FILELOCK_PROMISE_0300
   * @tc.name fileIO_test_filelock_promise_003
   * @tc.desc Test tryLock() interfaces. argument is : default.
   * Open the file, file lock() ,tryLock() and unlock()
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_filelock_promise_003', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_filelock_promise_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      await file.lock();
      file.tryLock();
      file.unlock();
      expect(true).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_filelock_promise_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number FILE_TEST_FILELOCK_PROMISE_0400
   * @tc.name fileIO_test_filelock_promise_004
   * @tc.desc Test tryLock() interfaces. argument is : true.
   * Open the file, file lock() ,tryLock(true) and unlock()
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_filelock_promise_004', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_filelock_promise_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      await file.lock();
      file.tryLock(true);
      file.unlock();
      expect(true).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_filelock_promise_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number FILE_TEST_FILELOCK_PROMISE_0500
   * @tc.name fileIO_test_filelock_promise_005
   * @tc.desc Test tryLock() interfaces. argument is : false.
   * Open the file, file lock() ,tryLock(false) and unlock()
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_filelock_promise_005', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_filelock_promise_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      await file.lock();
      file.tryLock(false);
      file.unlock();
      expect(true).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_filelock_promise_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number FILE_TEST_FILELOCK_PROMISE_0600
   * @tc.name fileIO_test_filelock_promise_006
   * @tc.desc Open the file, no file lock(), tryLock(), unlock(),
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_filelock_promise_006', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_filelock_promise_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      file.tryLock();
      file.unlock();
      expect(true).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_filelock_promise_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number FILE_TEST_FILELOCK_PROMISE_0700
   * @tc.name fileIO_test_filelock_promise_007
   * @tc.desc Open the file, no file lock(), no tryLock(), unlock(),
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_filelock_promise_007', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_filelock_promise_007');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      file.unlock();
      expect(true).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_filelock_promise_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number FILE_TEST_FILELOCK_PROMISE_0800
   * @tc.name fileIO_test_filelock_promise_008
   * @tc.desc Test lock() interfaces.
   * Open the file, file.lock(), use default mode = false.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_filelock_promise_008', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_filelock_promise_008');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      await file.lock(undefined);
      file.unlock();
      expect(true).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_filelock_promise_008 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number FILE_TEST_FILELOCK_PROMISE_0900
   * @tc.name fileIO_test_filelock_promise_009
   * @tc.desc File.trylock(), use default mode = false.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_filelock_promise_009', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_filelock_promise_009');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      await file.lock();
      file.tryLock(undefined);
      file.unlock();
      expect(true).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_filelock_promise_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number FILE_TEST_FILELOCK_PROMISE_ABNORMAL_0000
   * @tc.name fileIO_test_filelock_promise_abnormal_000
   * @tc.desc Test lock() interfaces. argument is : null.
   * Open the file, file lock(null).
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_filelock_promise_abnormal_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_filelock_promise_abnormal_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);

    try {
      expect(isIntNum(file.fd)).assertTrue();
      await file.lock(null);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_filelock_promise_abnormal_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.number FILE_TEST_FILELOCK_PROMISE_ABNORMAL_0100
   * @tc.name fileIO_test_filelock_promise_abnormal_001
   * @tc.desc Test lock() interfaces. argument is : true, true.
   * Open the file, file lock(true, true).
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_filelock_promise_abnormal_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_filelock_promise_abnormal_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);

    try {
      expect(isIntNum(file.fd)).assertTrue();
      await file.lock(true, true);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_filelock_promise_abnormal_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.number FILE_TEST_FILELOCK_PROMISE_ABNORMAL_0200
   * @tc.name fileIO_test_filelock_promise_abnormal_002
   * @tc.desc Test lock() interfaces. argument is : -1.
   * Open the file, file lock(-1).
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_filelock_promise_abnormal_002', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_filelock_promise_abnormal_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);

    try {
      expect(isIntNum(file.fd)).assertTrue();
      await file.lock(-1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_filelock_promise_abnormal_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.number FILE_TEST_FILELOCK_PROMISE_ABNORMAL_0300
   * @tc.name fileIO_test_filelock_promise_abnormal_003
   * @tc.desc Test tryLock() interfaces. argument is : null.
   * Open the file, file lock(), tryLock(null).
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_filelock_promise_abnormal_003', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_filelock_promise_abnormal_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);

    try {
      expect(isIntNum(file.fd)).assertTrue();
      await file.lock();
      file.tryLock(null);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_filelock_promise_abnormal_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.number FILE_TEST_FILELOCK_PROMISE_ABNORMAL_0400
   * @tc.name fileIO_test_filelock_promise_abnormal_004
   * @tc.desc Test tryLock() interfaces. argument is : true, true.
   * Open the file, file lock(), tryLock(true, true).
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_filelock_promise_abnormal_004', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_filelock_promise_abnormal_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);

    try {
      expect(isIntNum(file.fd)).assertTrue();
      await file.lock();
      file.tryLock(true, true);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_filelock_promise_abnormal_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.number FILE_TEST_FILELOCK_PROMISE_ABNORMAL_0500
   * @tc.name fileIO_test_filelock_promise_abnormal_005
   * @tc.desc Test tryLock() interfaces. argument is : -1.
   * Open the file, file lock(), tryLock(-1).
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_filelock_promise_abnormal_005', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_filelock_promise_abnormal_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);

    try {
      expect(isIntNum(file.fd)).assertTrue();
      await file.lock();
      file.tryLock(-1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_filelock_promise_abnormal_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.number FILE_TEST_FILELOCK_PROMISE_ABNORMAL_0600
   * @tc.name fileIO_test_filelock_promise_abnormal_006
   * @tc.desc Test unlock() interfaces. argument is : true.
   * Open the file, file lock(), tryLock(), unlock(true),
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_filelock_promise_abnormal_006', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_filelock_promise_abnormal_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);

    try {
      expect(isIntNum(file.fd)).assertTrue();
      await file.lock();
      file.tryLock();
      file.unlock(true);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_filelock_promise_abnormal_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.number FILE_TEST_FILELOCK_CALLBACK_0000
   * @tc.name fileIO_test_filelock_callback_000
   * @tc.desc Test lock() interfaces. argument is : default.
   * Open the file, file lock() and unlock()
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_filelock_callback_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_filelock_callback_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      file.lock((err) => {
        if (err) {
          console.log('fileIO_test_filelock_callback_000 err ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        file.unlock();
        expect(true).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_filelock_callback_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number FILE_TEST_FILELOCK_CALLBACK_0100
   * @tc.name fileIO_test_filelock_callback_001
   * @tc.desc Test lock() interfaces. argument is : true.
   * Open the file, file lock(true) and unlock()
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_filelock_callback_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_filelock_callback_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      file.lock(true, (err) => {
        if (err) {
          console.log('fileIO_test_filelock_callback_001 err ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        file.unlock();
        expect(true).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_filelock_callback_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number FILE_TEST_FILELOCK_CALLBACK_0200
   * @tc.name fileIO_test_filelock_callback_002
   * @tc.desc Test lock() interfaces. argument is : false.
   * Open the file, file lock(false) and unlock()
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_filelock_callback_002', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_filelock_callback_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      file.lock(false, (err) => {
        if (err) {
          console.log('fileIO_test_filelock_callback_002 err ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        file.unlock();
        expect(true).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_filelock_callback_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number FILE_TEST_FILELOCK_CALLBACK_0300
   * @tc.name fileIO_test_filelock_callback_003
   * @tc.desc Test lock() interfaces.
   * Open the file, file.lock(), use default mode = false.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_filelock_callback_003', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_filelock_callback_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      file.lock(undefined, (err) => {
        if (err) {
          console.log('fileIO_test_filelock_callback_003 err ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        file.unlock();
        expect(true).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_filelock_callback_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number FILE_TEST_FILELOCK_CALLBACK_ABNORMAL_0000
   * @tc.name fileIO_test_filelock_callback_abnormal_000
   * @tc.desc Test lock() interfaces. argument is : null.
   * Open the file, file lock(null).
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_filelock_callback_abnormal_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_filelock_callback_abnormal_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);

    try { 
      expect(isIntNum(file.fd)).assertTrue();
      file.lock(null, (err) => {
          expect(false).assertTrue();
      });
    } catch (e) {
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_filelock_callback_abnormal_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.number FILE_TEST_FILELOCK_CALLBACK_ABNORMAL_0100
   * @tc.name fileIO_test_filelock_callback_abnormal_001
   * @tc.desc Test lock() interfaces. argument is : true, true.
   * Open the file, file lock(true, true).
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_filelock_callback_abnormal_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_filelock_callback_abnormal_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);

    try {
      expect(isIntNum(file.fd)).assertTrue();
      file.lock(true, true, (err) => {
          expect(false).assertTrue();
      });
    } catch (e) {
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_filelock_callback_abnormal_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.number FILE_TEST_FILELOCK_CALLBACK_ABNORMAL_0200
   * @tc.name fileIO_test_filelock_callback_abnormal_002
   * @tc.desc Test lock() interfaces. argument is : -1.
   * Open the file, file lock(-1).
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_filelock_callback_abnormal_002', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_filelock_callback_abnormal_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);

    try {
      expect(isIntNum(file.fd)).assertTrue();
      file.lock(-1, (err) => {
          expect(false).assertTrue();
      });
    } catch (e) {
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_filelock_callback_abnormal_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });
});
}