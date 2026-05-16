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

export default function fileioFdOpenStream() {
describe('fileio_FdOpenStream', async function () {

  /**
   * @tc.name   fileio_test_fdopenstream_sync_000
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_SYNC_0000
   * @tc.desc   Test fdopenStreamSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_fdopenstream_sync_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_fdopenstream_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      let fd = fileio.openSync(fpath, 0o2);
      let mode = 'r+';
      let fp = fileio.fdopenStreamSync(fd, mode);
      let buf = new ArrayBuffer(4096);
      let data = fp.readSync(buf, {});
      expect(data == FILE_CONTENT.length).assertTrue();
      expect(fp !== null).assertTrue();
      expect(fp.closeSync() == null).assertTrue();
      expect(fileio.unlinkSync(fpath) == null).assertTrue();
    } catch (e) {
      expect(null).assertFail();
    }
  })

  /**
   * @tc.name   fileio_test_fdopenstream_sync_001
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_SYNC_0010
   * @tc.desc   Test fdopenStreamSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_fdopenstream_sync_001', Level.LEVEL0, function () {
    try {
      let fd = -1;
      let mode = 'r+';
      let fp = fileio.fdopenStreamSync(fd, mode);
      throw new Error('Bad file descriptor');
    } catch (e) {
      console.log('fileio_test_fdopenstream_sync_001 has failed for ' + e);
    }
  })

  /**
   * @tc.name   fileio_test_fdopenstream_async_000
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_000
   * @tc.desc   Test fdopenStream() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_fdopenstream_async_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_fdopenstream_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      let fd = fileio.openSync(fpath, 0o2);
      expect(isIntNum(fd)).assertTrue();
      let mode = 'r+';
      let fp = await fileio.fdopenStream(fd, mode);
      fp.read(new ArrayBuffer(4096), {}, function (err, data) {
        expect(fp !== null).assertTrue();
        fp.closeSync();
        expect(data.bytesRead == FILE_CONTENT.length).assertTrue();
        fileio.unlinkSync(fpath);
        done();
      })
    } catch (e) {
      console.log('fileio_test_fdopenstream_async_000 has failed for ' + e);
      expect(null).assertFail();
    }
  })

  /**
   * @tc.name   fileio_test_fdopenstream_async_001
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_001
   * @tc.desc   Test fdopenStream() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
   it('fileio_test_fdopenstream_async_001', Level.LEVEL0, async function (done) {
     let fpath = await nextFileName('fileio_test_fdopenstream_async_001');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     try {
       let fd = fileio.openSync(fpath, 0o2);
       expect(isIntNum(fd)).assertTrue();
       let mode = 'r+';
       fileio.fdopenStream(fd, mode, function (err, fp) {
         expect(fp !== null).assertTrue();
         fp.read(new ArrayBuffer(4096), {}, function (err, data) {
           expect(fp !== null).assertTrue();
           fp.closeSync();
           expect(data.bytesRead == FILE_CONTENT.length).assertTrue();
           fileio.unlinkSync(fpath);
           done();
         })
       })
     } catch (e) {
       console.info('fileio_test_fdopenstream_async_001 has failed for ' + e);
       expect(null).assertFail();
     }
   });

   /**
    * @tc.name   fileio_test_fdopenstream_promise_error_001
    * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_PROMISE_ERROR_001
    * @tc.desc   Test fdopenStream() interface with null fd. Promise.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_fdopenstream_promise_error_001', Level.LEVEL2, async function () {
     try {
       await fileio.fdopenStream(null, 'r+');
       expect(false).assertTrue();
     } catch (err) {
       console.log('fileio_test_fdopenstream_promise_error_001: ' + err.message + ', code: ' + err.code);
       expect(err.message == 'Arg fd is required to be type integer').assertTrue();
     }
   });

   /**
    * @tc.name   fileio_test_fdopenstream_promise_error_002
    * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_PROMISE_ERROR_002
    * @tc.desc   Test fdopenStream() interface with undefined fd. Promise.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_fdopenstream_promise_error_002', Level.LEVEL2, async function () {
     try {
       await fileio.fdopenStream(undefined, 'r+');
       expect(false).assertTrue();
     } catch (err) {
       console.log('fileio_test_fdopenstream_promise_error_002: ' + err.message + ', code: ' + err.code);
       expect(err.message == 'Arg fd is required to be type integer').assertTrue();
     }
   });

   /**
    * @tc.name   fileio_test_fdopenstream_promise_error_003
    * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_PROMISE_ERROR_003
    * @tc.desc   Test fdopenStream() interface with empty string mode. Promise.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_fdopenstream_promise_error_003', Level.LEVEL2, async function () {
     let fpath = await nextFileName('fileio_test_fdopenstream_promise_error_003');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     let fd = fileio.openSync(fpath, 0o2);
     try {
       await fileio.fdopenStream(fd, '');
       expect(false).assertTrue();
     } catch (err) {
       console.log('fileio_test_fdopenstream_promise_error_003: ' + err.message + ', code: ' + err.code);
       expect(err.message == 'Invalid argument').assertTrue();
       fileio.closeSync(fd);
       fileio.unlinkSync(fpath);
     }
   });

   /**
    * @tc.name   fileio_test_fdopenstream_promise_error_004
    * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_PROMISE_ERROR_004
    * @tc.desc   Test fdopenStream() interface with null mode. Promise.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_fdopenstream_promise_error_004', Level.LEVEL2, async function () {
     let fpath = await nextFileName('fileio_test_fdopenstream_promise_error_004');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     let fd = fileio.openSync(fpath, 0o2);
     try {
       await fileio.fdopenStream(fd, null);
       expect(false).assertTrue();
     } catch (err) {
       console.log('fileio_test_fdopenstream_promise_error_004: ' + err.message + ', code: ' + err.code);
       expect(err.message == 'Arg mode is required to be type string').assertTrue();
       fileio.closeSync(fd);
       fileio.unlinkSync(fpath);
     }
   });

   /**
    * @tc.name   fileio_test_fdopenstream_promise_error_005
    * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_PROMISE_ERROR_005
    * @tc.desc   Test fdopenStream() interface with undefined mode. Promise.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_fdopenstream_promise_error_005', Level.LEVEL2, async function () {
     let fpath = await nextFileName('fileio_test_fdopenstream_promise_error_005');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     let fd = fileio.openSync(fpath, 0o2);
     try {
       await fileio.fdopenStream(fd, undefined);
       expect(false).assertTrue();
     } catch (err) {
       console.log('fileio_test_fdopenstream_promise_error_005: ' + err.message + ', code: ' + err.code);
       expect(err.message == 'Arg mode is required to be type string').assertTrue();
       fileio.closeSync(fd);
       fileio.unlinkSync(fpath);
     }
   });

   /**
    * @tc.name   fileio_test_fdopenstream_callback_error_001
    * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_CALLBACK_ERROR_001
    * @tc.desc   Test fdopenStream() interface with null fd. Callback.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_fdopenstream_callback_error_001', Level.LEVEL2, async function (done) {
     try {
       fileio.fdopenStream(null, 'r+', (err, fp) => {
         if (err) {
           console.log('fileio_test_fdopenstream_callback_error_001: ' + err.message + ', code: ' + err.code);
           expect(err.message == 'Arg fd is required to be type integer').assertTrue();
           done();
         }
       });
     } catch (err) {
       console.log('fileio_test_fdopenstream_callback_error_001 err: ' + err.message + ', code: ' + err.code);
       expect(err.message == 'Arg fd is required to be type integer').assertTrue();
       done();
     }
   });

   /**
    * @tc.name   fileio_test_fdopenstream_callback_error_002
    * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_CALLBACK_ERROR_002
    * @tc.desc   Test fdopenStream() interface with undefined fd. Callback.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_fdopenstream_callback_error_002', Level.LEVEL2, async function (done) {
     try {
       fileio.fdopenStream(undefined, 'r+', (err, fp) => {
         if (err) {
           console.log('fileio_test_fdopenstream_callback_error_002: ' + err.message + ', code: ' + err.code);
           expect(err.message == 'Arg fd is required to be type integer').assertTrue();
           done();
         }
       });
     } catch (err) {
       console.log('fileio_test_fdopenstream_callback_error_002 err: ' + err.message + ', code: ' + err.code);
       expect(err.message == 'Arg fd is required to be type integer').assertTrue();
       done();
     }
   });

   /**
    * @tc.name   fileio_test_fdopenstream_callback_error_003
    * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_CALLBACK_ERROR_003
    * @tc.desc   Test fdopenStream() interface with empty string mode. Callback.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_fdopenstream_callback_error_003', Level.LEVEL2, async function (done) {
     let fpath = await nextFileName('fileio_test_fdopenstream_callback_error_003');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     let fd = fileio.openSync(fpath, 0o2);
     try {
       fileio.fdopenStream(fd, '', (err, fp) => {
         if (err) {
           console.log('fileio_test_fdopenstream_callback_error_003: ' + err.message + ', code: ' + err.code);
           expect(err.message == 'Invalid argument').assertTrue();
           fileio.closeSync(fd);
           fileio.unlinkSync(fpath);
           done();
         }
       });
     } catch (err) {
       console.log('fileio_test_fdopenstream_callback_error_003 err: ' + err.message + ', code: ' + err.code);
       expect(err.message == 'Invalid argument').assertTrue();
       fileio.closeSync(fd);
       fileio.unlinkSync(fpath);
       done();
     }
   });

   /**
    * @tc.name   fileio_test_fdopenstream_callback_error_004
    * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_CALLBACK_ERROR_004
    * @tc.desc   Test fdopenStream() interface with null mode. Callback.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('fileio_test_fdopenstream_callback_error_004', Level.LEVEL2, async function (done) {
      let fpath = await nextFileName('fileio_test_fdopenstream_callback_error_004');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let fd = fileio.openSync(fpath, 0o2);
      try {
        fileio.fdopenStream(fd, null, (err, fp) => {
          if (err) {
            console.log('fileio_test_fdopenstream_callback_error_004: ' + err.message + ', code: ' + err.code);
            expect(err.message == 'Arg mode is required to be type string').assertTrue();
            fileio.closeSync(fd);
            fileio.unlinkSync(fpath);
            done();
          }
        });
     } catch (err) {
       console.log('fileio_test_fdopenstream_callback_error_004 err: ' + err.message + ', code: ' + err.code);
       expect(err.message == 'Arg mode is required to be type string').assertTrue();
       fileio.closeSync(fd);
       fileio.unlinkSync(fpath);
       done();
     }
   });

   /**
    * @tc.name   fileio_test_fdopenstream_callback_error_005
    * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_CALLBACK_ERROR_005
    * @tc.desc   Test fdopenStream() interface with undefined mode. Callback.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_fdopenstream_callback_error_005', Level.LEVEL2, async function (done) {
     let fpath = await nextFileName('fileio_test_fdopenstream_callback_error_005');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     let fd = fileio.openSync(fpath, 0o2);
     try {
       fileio.fdopenStream(fd, undefined, (err, fp) => {
         if (err) {
           console.log('fileio_test_fdopenstream_callback_error_005: ' + err.message + ', code: ' + err.code);
           expect(err.message == 'Arg mode is required to be type string').assertTrue();
           fileio.closeSync(fd);
           fileio.unlinkSync(fpath);
           done();
         }
       });
     } catch (err) {
       console.log('fileio_test_fdopenstream_callback_error_005 err: ' + err.message + ', code: ' + err.code);
       expect(err.message == 'Arg mode is required to be type string').assertTrue();
       fileio.closeSync(fd);
       fileio.unlinkSync(fpath);
       done();
     }
   });

   /**
    * @tc.name   fileio_test_fdopenstream_sync_error_001
    * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_SYNC_ERROR_001
    * @tc.desc   Test fdopenStreamSync() interface with null fd.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_fdopenstream_sync_error_001', Level.LEVEL2, async function () {
     try {
       fileio.fdopenStreamSync(null, 'r+');
       expect(false).assertTrue();
     } catch (err) {
       console.log('fileio_test_fdopenstream_sync_error_001: ' + err.message + ', code: ' + err.code);
       expect(err.message == 'Arg fd is required to be type integer').assertTrue();
     }
   });

   /**
    * @tc.name   fileio_test_fdopenstream_sync_error_002
    * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_SYNC_ERROR_002
    * @tc.desc   Test fdopenStreamSync() interface with undefined fd.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_fdopenstream_sync_error_002', Level.LEVEL2, async function () {
     try {
       fileio.fdopenStreamSync(undefined, 'r+');
       expect(false).assertTrue();
     } catch (err) {
       console.log('fileio_test_fdopenstream_sync_error_002: ' + err.message + ', code: ' + err.code);
       expect(err.message == 'Arg fd is required to be type integer').assertTrue();
     }
   });

   /**
    * @tc.name   fileio_test_fdopenstream_sync_error_003
    * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_SYNC_ERROR_003
    * @tc.desc   Test fdopenStreamSync() interface with empty string mode.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_fdopenstream_sync_error_003', Level.LEVEL2, async function () {
     let fpath = await nextFileName('fileio_test_fdopenstream_sync_error_003');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     let fd = fileio.openSync(fpath, 0o2);
     try {
       fileio.fdopenStreamSync(fd, '');
       expect(false).assertTrue();
     } catch (err) {
       console.log('fileio_test_fdopenstream_sync_error_003: ' + err.message + ', code: ' + err.code);
       expect(err.message == 'Invalid argument').assertTrue();
       fileio.closeSync(fd);
       fileio.unlinkSync(fpath);
     }
   });

   /**
    * @tc.name   fileio_test_fdopenstream_sync_error_004
    * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_SYNC_ERROR_004
    * @tc.desc   Test fdopenStreamSync() interface with null mode.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_fdopenstream_sync_error_004', Level.LEVEL2, async function () {
     let fpath = await nextFileName('fileio_test_fdopenstream_sync_error_004');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     let fd = fileio.openSync(fpath, 0o2);
     try {
       fileio.fdopenStreamSync(fd, null);
       expect(false).assertTrue();
     } catch (err) {
       console.log('fileio_test_fdopenstream_sync_error_004: ' + err.message + ', code: ' + err.code);
       expect(err.message == 'Arg mode is required to be type string').assertTrue();
       fileio.closeSync(fd);
       fileio.unlinkSync(fpath);
     }
   });

   /**
    * @tc.name   fileio_test_fdopenstream_sync_error_005
    * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_SYNC_ERROR_005
    * @tc.desc   Test fdopenStreamSync() interface with undefined mode.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('fileio_test_fdopenstream_sync_error_005', Level.LEVEL2, async function () {
      let fpath = await nextFileName('fileio_test_fdopenstream_sync_error_005');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let fd = fileio.openSync(fpath, 0o2);
      try {
        fileio.fdopenStreamSync(fd, undefined);
        expect(false).assertTrue();
      } catch (err) {
        console.log('fileio_test_fdopenstream_sync_error_005: ' + err.message + ', code: ' + err.code);
        expect(err.message == 'Arg mode is required to be type string').assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      }
    });
  })}
