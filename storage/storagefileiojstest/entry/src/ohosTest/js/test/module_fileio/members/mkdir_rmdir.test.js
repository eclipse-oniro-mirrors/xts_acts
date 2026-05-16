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

import { fileio, nextFileName, describe, it, expect } from '../../Common';
import { Level } from '@ohos/hypium';

export default function fileioMkdirRmdir() {
describe('fileio_mkdir_rmdir', function () {

  /**
   * @tc.name   fileio_mkdir_sync_rmdir_sync_000
   * @tc.number SUB_DF_FILEIO_MKDIR_SYNC_RMDIR_SYNC_0000
   * @tc.desc   Test mkdirSync() and rmdirSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_mkdir_sync_rmdir_sync_000', Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileio_mkdir_sync_rmdir_sync_000') + 'd';

    try {
      expect(fileio.mkdirSync(dpath) == null).assertTrue();
      expect(fileio.rmdirSync(dpath) == null).assertTrue();
    } catch (e) {
      console.log('fileio_mkdir_sync_rmdir_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_mkdir_sync_rmdir_sync_001
   * @tc.number SUB_DF_FILEIO_MKDIR_SYNC_RMDIR_SYNC_0100
   * @tc.desc   Test mkdirSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_mkdir_sync_rmdir_sync_001', Level.LEVEL0, function () {
     try {
       expect(fileio.mkdirSync('/') == null).assertTrue();
       expect(null).assertFail();
     } catch (e) {
       console.log('fileio_mkdir_sync_rmdir_sync_001 has failed for ' + e);
     }
  });

  /**
   * @tc.name   fileio_mkdir_sync_rmdir_sync_002
   * @tc.number SUB_DF_FILEIO_MKDIR_SYNC_RMDIR_SYNC_0200
   * @tc.desc   Test mkdirSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
    */
   it('fileio_mkdir_sync_rmdir_sync_002', Level.LEVEL0, function () {
     try {
       expect(fileio.mkdirSync(12) == null).assertTrue();
       expect(null).assertFail();
     } catch (e) {
       console.log('fileio_mkdir_sync_rmdir_sync_002 has failed for ' + e);
     }
  });

  /**
   * @tc.name   fileio_mkdir_sync_rmdir_sync_003
   * @tc.number SUB_DF_FILEIO_MKDIR_SYNC_RMDIR_SYNC_0300
   * @tc.desc   Test mkdirSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
    */
  it('fileio_mkdir_sync_rmdir_sync_003', Level.LEVEL0, async function () {
     let dpath = await nextFileName('fileio_mkdir_sync_rmdir_sync_003');

    try {
       fileio.mkdirSync(dpath, undefined);
       fileio.rmdirSync(dpath);
    } catch (e) {
       console.log('fileio_mkdir_sync_rmdir_sync_003 has failed for ' + e);
       expect(false).assertTrue();
     }
  });

  /**
   * @tc.name   fileio_mkdir_async_rmdir_sync_000
   * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_RMDIR_SYNC_0000
   * @tc.desc   Test mkdir() and rmdirSync() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
    */
  it('fileio_mkdir_async_rmdir_sync_000', Level.LEVEL0, async function (done) {
     let dpath = await nextFileName('fileio_mkdir_async_rmdir_sync_000') + 'd';

    try {
       expect(await fileio.mkdir(dpath) == null).assertTrue();
       expect(fileio.rmdirSync(dpath) == null).assertTrue();
       done();
     } catch (e) {
       console.log('fileio_mkdir_async_rmdir_sync_000 has failed for ' + e);
       expect(null).assertFail();
     }
  });

  /**
    * @tc.name   fileio_mkdir_async_rmdir_sync_001
    * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_RMDIR_SYNC_0100
    * @tc.desc   Test mkdir() and rmdirSync() interfaces. Callback.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileio_mkdir_async_rmdir_sync_001', Level.LEVEL0, async function (done) {
     let dpath = await nextFileName('fileio_mkdir_async_rmdir_sync_001') + 'd';

     try {
       fileio.mkdir(dpath, function (error) {
         expect(fileio.rmdirSync(dpath) == null).assertTrue();
         done();
       });
     } catch (e) {
       console.log('fileio_mkdir_async_rmdir_sync_001 has failed for ' + e);
       expect(null).assertFail();
     }
  });

  /**
    * @tc.name   fileio_mkdir_async_rmdir_sync_002
    * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_RMDIR_SYNC_0200
    * @tc.desc   Test mkdir() and rmdirSync() interfaces. Promise.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
  it('fileio_mkdir_async_rmdir_sync_002', Level.LEVEL0, async function (done) {
     let fpath = await nextFileName('fileio_mkdir_async_rmdir_sync_002');

     try {
       expect(await fileio.mkdir(fpath, 777) == null).assertTrue();
       expect(fileio.rmdirSync(fpath) == null).assertTrue();
       done();
     } catch (e) {
       console.log('fileio_mkdir_async_rmdir_sync_002 has failed for ' + e);
       expect(null).assertFail();
     }
  });

  /**
    * @tc.name   fileio_mkdir_async_rmdir_sync_003
    * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_RMDIR_SYNC_0300
    * @tc.desc   Test mkdir() and rmdirSync() interfaces. Promise.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
  it('fileio_mkdir_async_rmdir_sync_003', Level.LEVEL0, async function (done) {
     let fpath = await nextFileName('fileio_mkdir_async_rmdir_sync_003');

     try {
       expect(await fileio.mkdir(fpath, 400) == null).assertTrue();
       expect(fileio.rmdirSync(fpath) == null).assertTrue();
       done();
     } catch (e) {
       console.log('fileio_mkdir_async_rmdir_sync_003 has failed for ' + e);
       expect(null).assertFail();
     }
  });

  /**
    * @tc.name   fileio_mkdir_async_rmdir_sync_004
    * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_RMDIR_SYNC_0400
    * @tc.desc   Test mkdir() and interfaces. Promise.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileio_mkdir_async_rmdir_sync_004', Level.LEVEL0, async function (done) {
     try {
       expect(await fileio.mkdir(12) == null).assertTrue();
       expect(null).assertFail();
     } catch (e) {
       console.log('fileio_mkdir_async_rmdir_sync_004 has failed for ' + e);
       done();
     }
  });

  /**
    * @tc.name   fileio_mkdir_async_rmdir_sync_005
    * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_RMDIR_SYNC_0500
    * @tc.desc   Test mkdir() interfaces. Promise.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileio_mkdir_async_rmdir_sync_005', Level.LEVEL0, async function (done) {
     let dpath = await nextFileName('fileio_mkdir_async_rmdir_sync_005');

     try {
       await fileio.mkdir(dpath, undefined);
       fileio.rmdirSync(dpath);
       done();
     } catch (e) {
       console.log('fileio_mkdir_async_rmdir_sync_005 has failed for ' + e);
       expect(false).assertTrue();
     }
  });

  /**
    * @tc.name   fileio_mkdir_async_rmdir_sync_006
    * @tc.number SUB_DF_FILEIO_MKDIR_ASYNC_RMDIR_SYNC_0600
    * @tc.desc   Test mkdir() interfaces. Callback.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileio_mkdir_async_rmdir_sync_006', Level.LEVEL0, async function (done) {
     let dpath = await nextFileName('fileio_mkdir_async_rmdir_sync_006');

     try {
       fileio.mkdir(dpath, undefined, (err) => {
         if (err) {
           console.log('fileio_mkdir_async_rmdir_sync_006 error: ' + e);
           expect(false).assertTrue();
         }
         fileio.rmdirSync(dpath);
         done();
       });
     } catch (e) {
       console.log('fileio_mkdir_async_rmdir_sync_006 has failed for ' + e);
       expect(false).assertTrue();
     }
   });

   /**
    * @tc.name   fileio_mkdir_promise_error_001
    * @tc.number SUB_DF_FILEIO_MKDIR_PROMISE_ERROR_001
    * @tc.desc   Test mkdir() interface with empty string path. Promise.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_mkdir_promise_error_001', Level.LEVEL2, async function () {
     try {
       await fileio.mkdir('');
       expect(false).assertTrue();
     } catch (err) {
       console.log('fileio_mkdir_promise_error_001: ' + err.message + ', code: ' + err.code);
       expect(err.message == 'No such file or directory').assertTrue();
     }
   });

   /**
    * @tc.name   fileio_mkdir_promise_error_002
    * @tc.number SUB_DF_FILEIO_MKDIR_PROMISE_ERROR_002
    * @tc.desc   Test mkdir() interface with null path. Promise.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_mkdir_promise_error_002', Level.LEVEL2, async function () {
     try {
       await fileio.mkdir(null);
       expect(false).assertTrue();
     } catch (err) {
       console.log('fileio_mkdir_promise_error_002: ' + err.message + ', code: ' + err.code);
       expect(err.message == 'Invalid path').assertTrue();
     }
   });

   /**
    * @tc.name   fileio_mkdir_promise_error_003
    * @tc.number SUB_DF_FILEIO_MKDIR_PROMISE_ERROR_003
    * @tc.desc   Test mkdir() interface with undefined path. Promise.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_mkdir_promise_error_003', Level.LEVEL2, async function () {
     try {
       await fileio.mkdir(undefined);
       expect(false).assertTrue();
     } catch (err) {
       console.log('fileio_mkdir_promise_error_003: ' + err.message + ', code: ' + err.code);
       expect(err.message == 'Invalid path').assertTrue();
     }
   });

   /**
    * @tc.name   fileio_mkdir_promise_error_004
    * @tc.number SUB_DF_FILEIO_MKDIR_PROMISE_ERROR_004
    * @tc.desc   Test mkdir() interface with null mode. Promise.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_mkdir_promise_error_004', Level.LEVEL2, async function () {
     let fpath = await nextFileName('fileio_mkdir_promise_error_004');
     try {
       await fileio.mkdir(fpath, null);
       expect(false).assertTrue();
     } catch (err) {
       console.log('fileio_mkdir_promise_error_004: ' + err.message + ', code: ' + err.code);
       expect(err.message == 'Invalid mode').assertTrue();
     }
   });

   /**
    * @tc.name   fileio_mkdir_promise_error_005
    * @tc.number SUB_DF_FILEIO_MKDIR_PROMISE_ERROR_005
    * @tc.desc   Test mkdir() interface with undefined mode. Promise.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_mkdir_promise_error_005', Level.LEVEL2, async function () {
     let fpath = await nextFileName('fileio_mkdir_promise_error_005');
     try {
       await fileio.mkdir(fpath, undefined);
       expect(fileio.rmdirSync(fpath) == null).assertTrue();
     } catch (err) {
       console.log('fileio_mkdir_promise_error_005: ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
   });

   /**
    * @tc.name   fileio_mkdir_callback_error_001
    * @tc.number SUB_DF_FILEIO_MKDIR_CALLBACK_ERROR_001
    * @tc.desc   Test mkdir() interface with empty string path. Callback.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_mkdir_callback_error_001', Level.LEVEL2, async function (done) {
     try {
       fileio.mkdir('', (err) => {
         if (err) {
           console.log('fileio_mkdir_callback_error_001: ' + err.message + ', code: ' + err.code);
           expect(err.message == 'No such file or directory').assertTrue();
           done();
         }
       });
     } catch (err) {
       console.log('fileio_mkdir_callback_error_001 err: ' + err.message + ', code: ' + err.code);
       expect(err.message == 'No such file or directory').assertTrue();
       done();
     }
   });

   /**
    * @tc.name   fileio_mkdir_callback_error_002
    * @tc.number SUB_DF_FILEIO_MKDIR_CALLBACK_ERROR_002
    * @tc.desc   Test mkdir() interface with null path. Callback.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_mkdir_callback_error_002', Level.LEVEL2, async function (done) {
     try {
       fileio.mkdir(null, (err) => {
         if (err) {
           console.log('fileio_mkdir_callback_error_002: ' + err.message + ', code: ' + err.code);
           expect(err.message == 'Invalid path').assertTrue();
           done();
         }
       });
     } catch (err) {
       console.log('fileio_mkdir_callback_error_002 err: ' + err.message + ', code: ' + err.code);
       expect(err.message == 'Invalid path').assertTrue();
       done();
     }
   });

   /**
    * @tc.name   fileio_mkdir_callback_error_003
    * @tc.number SUB_DF_FILEIO_MKDIR_CALLBACK_ERROR_003
    * @tc.desc   Test mkdir() interface with undefined path. Callback.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_mkdir_callback_error_003', Level.LEVEL2, async function (done) {
     try {
       fileio.mkdir(undefined, (err) => {
         if (err) {
           console.log('fileio_mkdir_callback_error_003: ' + err.message + ', code: ' + err.code);
           expect(err.message == 'Invalid path').assertTrue();
           done();
         }
       });
     } catch (err) {
       console.log('fileio_mkdir_callback_error_003 err: ' + err.message + ', code: ' + err.code);
       expect(err.message == 'Invalid path').assertTrue();
       done();
     }
   });

   /**
    * @tc.name   fileio_mkdir_callback_mode_error_001
    * @tc.number SUB_DF_FILEIO_MKDIR_CALLBACK_MODE_ERROR_001
    * @tc.desc   Test mkdir() interface with empty string path. Callback with mode.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_mkdir_callback_mode_error_001', Level.LEVEL2, async function (done) {
     try {
       fileio.mkdir('', 0o777, (err) => {
         if (err) {
           console.log('fileio_mkdir_callback_mode_error_001: ' + err.message + ', code: ' + err.code);
           expect(err.message == 'No such file or directory').assertTrue();
           done();
         }
       });
     } catch (err) {
       console.log('fileio_mkdir_callback_mode_error_001 err: ' + err.message + ', code: ' + err.code);
       expect(err.message == 'No such file or directory').assertTrue();
       done();
     }
   });

   /**
    * @tc.name   fileio_mkdir_callback_mode_error_002
    * @tc.number SUB_DF_FILEIO_MKDIR_CALLBACK_MODE_ERROR_002
    * @tc.desc   Test mkdir() interface with null path. Callback with mode.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_mkdir_callback_mode_error_002', Level.LEVEL2, async function (done) {
     try {
       fileio.mkdir(null, 0o777, (err) => {
         if (err) {
           console.log('fileio_mkdir_callback_mode_error_002: ' + err.message + ', code: ' + err.code);
           expect(err.message == 'Invalid path').assertTrue();
           done();
         }
       });
     } catch (err) {
       console.log('fileio_mkdir_callback_mode_error_002 err: ' + err.message + ', code: ' + err.code);
       expect(err.message == 'Invalid path').assertTrue();
       done();
     }
   });

   /**
    * @tc.name   fileio_mkdir_callback_mode_error_003
    * @tc.number SUB_DF_FILEIO_MKDIR_CALLBACK_MODE_ERROR_003
    * @tc.desc   Test mkdir() interface with undefined path. Callback with mode.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_mkdir_callback_mode_error_003', Level.LEVEL2, async function (done) {
     try {
       fileio.mkdir(undefined, 0o777, (err) => {
         if (err) {
           console.log('fileio_mkdir_callback_mode_error_003: ' + err.message + ', code: ' + err.code);
           expect(err.message == 'Invalid path').assertTrue();
           done();
         }
       });
     } catch (err) {
       console.log('fileio_mkdir_callback_mode_error_003 err: ' + err.message + ', code: ' + err.code);
       expect(err.message == 'Invalid path').assertTrue();
         done();
     }
   });

   /**
    * @tc.name   fileio_mkdir_callback_mode_error_004
    * @tc.number SUB_DF_FILEIO_MKDIR_CALLBACK_MODE_ERROR_004
    * @tc.desc   Test mkdir() interface with null mode. Callback with mode.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_mkdir_callback_mode_error_004', Level.LEVEL2, async function (done) {
     let fpath = await nextFileName('fileio_mkdir_callback_mode_error_004');
     try {
       fileio.mkdir(fpath, null, (err) => {
         if (err) {
           console.log('fileio_mkdir_callback_mode_error_004: ' + err.message + ', code: ' + err.code);
           expect(err.message == 'Invalid mode').assertTrue();
           done();
         }
       });
     } catch (err) {
       console.log('fileio_mkdir_callback_mode_error_004 err: ' + err.message + ', code: ' + err.code);
       expect(err.message == 'Invalid mode').assertTrue();
       done();
     }
   });

   /**
    * @tc.name   fileio_mkdir_callback_mode_error_005
    * @tc.number SUB_DF_FILEIO_MKDIR_CALLBACK_MODE_ERROR_005
    * @tc.desc   Test mkdir() interface with undefined mode. Callback with mode.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_mkdir_callback_mode_error_005', Level.LEVEL2, async function (done) {
     let fpath = await nextFileName('fileio_mkdir_callback_mode_error_005');
     try {
       fileio.mkdir(fpath, undefined, (err) => {
         if (err) {
           console.log('fileio_mkdir_callback_mode_error_005: ' + err.message + ', code: ' + err.code);
           expect(err.message == 'Invalid mode').assertTrue();
           done();       
          }
          expect(fileio.rmdirSync(fpath) == null).assertTrue();
          done();
       });
     } catch (err) {
       console.log('fileio_mkdir_callback_mode_error_005 err: ' + err.message + ', code: ' + err.code);
       expect(err.message == 'Invalid mode').assertTrue();
       done();
     }
   });

   /**
    * @tc.name   fileio_mkdir_sync_error_001
    * @tc.number SUB_DF_FILEIO_MKDIR_SYNC_ERROR_001
    * @tc.desc   Test mkdirSync() interface with empty string path.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_mkdir_sync_error_001', Level.LEVEL2, async function () {
     try {
       fileio.mkdirSync('');
       expect(false).assertTrue();
     } catch (err) {
       console.log('fileio_mkdir_sync_error_001: ' + err.message + ', code: ' + err.code);
       expect(err.message == 'No such file or directory').assertTrue();
     }
   });

   /**
    * @tc.name   fileio_mkdir_sync_error_002
    * @tc.number SUB_DF_FILEIO_MKDIR_SYNC_ERROR_002
    * @tc.desc   Test mkdirSync() interface with null path.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_mkdir_sync_error_002', Level.LEVEL2, async function () {
     try {
       fileio.mkdirSync(null);
       expect(false).assertTrue();
     } catch (err) {
       console.log('fileio_mkdir_sync_error_002: ' + err.message + ', code: ' + err.code);
       expect(err.message == 'Invalid path' || err.message == 'Invalid arg').assertTrue();
     }
   });

   /**
    * @tc.name   fileio_mkdir_sync_error_003
    * @tc.number SUB_DF_FILEIO_MKDIR_SYNC_ERROR_003
    * @tc.desc   Test mkdirSync() interface with undefined path.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_mkdir_sync_error_003', Level.LEVEL2, async function () {
     try {
       fileio.mkdirSync(undefined);
       expect(false).assertTrue();
     } catch (err) {
       console.log('fileio_mkdir_sync_error_003: ' + err.message + ', code: ' + err.code);
       expect(err.message == 'Invalid path').assertTrue();
     }
   });

   /**
    * @tc.name   fileio_mkdir_sync_error_004
    * @tc.number SUB_DF_FILEIO_MKDIR_SYNC_ERROR_004
    * @tc.desc   Test mkdirSync() interface with null mode.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_mkdir_sync_error_004', Level.LEVEL2, async function () {
     let fpath = await nextFileName('fileio_mkdir_sync_error_004');
     try {
       fileio.mkdirSync(fpath, null);
       expect(false).assertTrue();
     } catch (err) {
       console.log('fileio_mkdir_sync_error_004: ' + err.message + ', code: ' + err.code);
       expect(err.message == 'Invalid mode').assertTrue();
     }
   });

   /**
    * @tc.name   fileio_mkdir_sync_error_005
    * @tc.number SUB_DF_FILEIO_MKDIR_SYNC_ERROR_005
    * @tc.desc   Test mkdirSync() interface with undefined mode.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_mkdir_sync_error_005', Level.LEVEL2, async function () {
     let fpath = await nextFileName('fileio_mkdir_sync_error_005');
     try {
       fileio.mkdirSync(fpath, undefined);
       expect(fileio.rmdirSync(fpath) == null).assertTrue();
     } catch (err) {
       console.log('fileio_mkdir_sync_error_005: ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
   });
});
}