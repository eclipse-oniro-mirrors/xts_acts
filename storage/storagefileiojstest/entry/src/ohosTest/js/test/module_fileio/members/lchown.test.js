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

export default function fileioLchown() {
describe('fileio_lchown', function () {

  /**
   * @tc.name   fileio_test_lchown_sync_000
   * @tc.number SUB_DF_FILEIO_LCHOWN_SYNC_0000
   * @tc.desc   Test lchownSync() interface, invalid path. The test file was modified successfully.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_lchown_sync_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_lchown_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      fileio.lchownSync(fpath, stat.uid + 1, stat.gid + 1);
      let stat1 = fileio.statSync(fpath);
      expect(stat.uid == stat1.uid).assertTrue();
      expect(stat.gid == stat1.gid).assertTrue();
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.info('fileio_test_lchown_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_lchown_async_000
   * @tc.number SUB_DF_FILEIO_LCHOWN_ASYNC_0000
   * @tc.desc   Test the lchownASync() interface with promise,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_lchown_async_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_lchown_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      await fileio.lchown(fpath, stat.uid + 1, stat.gid + 1);
      let stat1 = fileio.statSync(fpath);
      expect(stat.uid == stat1.uid).assertTrue();
      expect(stat.gid == stat1.gid).assertTrue();
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.info('fileio_test_lchown_async_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_lchown_async_001
   * @tc.number SUB_DF_FILEIO_LCHOWNASYNC_0100
   * @tc.desc   Test the chownAsync() interface with callback. The test file was modified successfully.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
   it('fileio_test_lchown_async_001', Level.LEVEL0, async function (done) {
     let fpath = await nextFileName('fileio_test_lchown_async_001');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
 
     try {
       let stat = fileio.statSync(fpath);
       fileio.lchown(fpath, stat.uid + 1, stat.gid + 1, (err) => {
         if (err) {
           console.error('fileio_test_lchmod_async_000 has failed in callback: ' + err);
         }
         let stat1 = fileio.statSync(fpath);
         expect(stat.uid == stat1.uid).assertTrue();
         expect(stat.gid == stat1.gid).assertTrue();
         fileio.unlinkSync(fpath);
         done();
       });
     } catch (e) {
       console.info('fileio_test_lchown_async_001 has failed for ' + e);
       expect(null).assertFail();
     }
   });

   /**
    * @tc.name   fileio_test_lchown_promise_error_001
    * @tc.number SUB_DF_FILEIO_LCHOWN_PROMISE_ERROR_001
    * @tc.desc   Test lchown() interface with empty string path. Promise.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_lchown_promise_error_001', Level.LEVEL2, async function () {
    let fpath = await nextFileName('fileio_test_lchown_promise_error_001');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     try {
       await fileio.lchown('', 1, 1);
       let stat = fileio.statSync(fpath);
       expect(isIntNum(stat.uid)).assertTrue();
       fileio.unlinkSync(fpath);
     } catch (err) {
       console.log('fileio_test_lchown_promise_error_001: ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
   });

   /**
    * @tc.name   fileio_test_lchown_promise_error_002
    * @tc.number SUB_DF_FILEIO_LCHOWN_PROMISE_ERROR_002
    * @tc.desc   Test lchown() interface with null path. Promise.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_lchown_promise_error_002', Level.LEVEL2, async function () {
    let fpath = await nextFileName('fileio_test_lchown_promise_error_002');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     try {
       await fileio.lchown(null, 1, 1);
       let stat = fileio.statSync(fpath);
       expect(isIntNum(stat.uid)).assertTrue();
       fileio.unlinkSync(fpath);
     } catch (err) {
       console.log('fileio_test_lchown_promise_error_002: ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
   });

   /**
    * @tc.name   fileio_test_lchown_promise_error_003
    * @tc.number SUB_DF_FILEIO_LCHOWN_PROMISE_ERROR_003
    * @tc.desc   Test lchown() interface with undefined path. Promise.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_lchown_promise_error_003', Level.LEVEL2, async function () {
    let fpath = await nextFileName('fileio_test_lchown_promise_error_003');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     try {
       await fileio.lchown(undefined, 1, 1);
       let stat = fileio.statSync(fpath);
       expect(isIntNum(stat.uid)).assertTrue();
       fileio.unlinkSync(fpath);
     } catch (err) {
       console.log('fileio_test_lchown_promise_error_003: ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
   });

   /**
    * @tc.name   fileio_test_lchown_promise_error_004
    * @tc.number SUB_DF_FILEIO_LCHOWN_PROMISE_ERROR_004
    * @tc.desc   Test lchown() interface with null uid. Promise.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_lchown_promise_error_004', Level.LEVEL2, async function () {
     let fpath = await nextFileName('fileio_test_lchown_promise_error_004');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     try {
       await fileio.lchown(fpath, null, 1);
       let stat = fileio.statSync(fpath);
       expect(isIntNum(stat.uid)).assertTrue();
       fileio.unlinkSync(fpath);
     } catch (err) {
       console.log('fileio_test_lchown_promise_error_004: ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
   });

   /**
    * @tc.name   fileio_test_lchown_promise_error_005
    * @tc.number SUB_DF_FILEIO_LCHOWN_PROMISE_ERROR_005
    * @tc.desc   Test lchown() interface with undefined uid. Promise.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_lchown_promise_error_005', Level.LEVEL2, async function () {
     let fpath = await nextFileName('fileio_test_lchown_promise_error_005');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     try {
       await fileio.lchown(fpath, undefined, 1);
       let stat = fileio.statSync(fpath);
       expect(isIntNum(stat.uid)).assertTrue();
       fileio.unlinkSync(fpath);
     } catch (err) {
       console.log('fileio_test_lchown_promise_error_005: ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
   });

   /**
    * @tc.name   fileio_test_lchown_promise_error_006
    * @tc.number SUB_DF_FILEIO_LCHOWN_PROMISE_ERROR_006
    * @tc.desc   Test lchown() interface with null gid. Promise.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_lchown_promise_error_006', Level.LEVEL2, async function () {
     let fpath = await nextFileName('fileio_test_lchown_promise_error_006');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     try {
       await fileio.lchown(fpath, 1, null);
       let stat = fileio.statSync(fpath);
       expect(isIntNum(stat.uid)).assertTrue();
       fileio.unlinkSync(fpath);
     } catch (err) {
       console.log('fileio_test_lchown_promise_error_006: ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
   });

   /**
    * @tc.name   fileio_test_lchown_promise_error_007
    * @tc.number SUB_DF_FILEIO_LCHOWN_PROMISE_ERROR_007
    * @tc.desc   Test lchown() interface with undefined gid. Promise.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_lchown_promise_error_007', Level.LEVEL2, async function () {
     let fpath = await nextFileName('fileio_test_lchown_promise_error_007');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     try {
       await fileio.lchown(fpath, 1, undefined);
       let stat = fileio.statSync(fpath);
       expect(isIntNum(stat.uid)).assertTrue();
       fileio.unlinkSync(fpath);
     } catch (err) {
       console.log('fileio_test_lchown_promise_error_007: ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
   });

   /**
    * @tc.name   fileio_test_lchown_callback_error_001
    * @tc.number SUB_DF_FILEIO_LCHOWN_CALLBACK_ERROR_001
    * @tc.desc   Test lchown() interface with empty string path. Callback.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('fileio_test_lchown_callback_error_001', Level.LEVEL2, async function (done) {
      let fpath = await nextFileName('fileio_test_lchown_callback_error_001');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fileio.lchown('', 1, 1, (err) => {
          if (err) {
            console.log('fileio_test_lchown_callback_error_001: ' + err.message + ', code: ' + err.code);
            expect(err.message == 'No such file or directory').assertTrue();
            done();
          }
          let stat = fileio.statSync(fpath);
          expect(isIntNum(stat.uid)).assertTrue();
          fileio.unlinkSync(fpath);
          done();
        });
     } catch (err) {
       console.log('fileio_test_lchown_callback_error_001 err: ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
       done();
     }
   });

   /**
    * @tc.name   fileio_test_lchown_callback_error_002
    * @tc.number SUB_DF_FILEIO_LCHOWN_CALLBACK_ERROR_002
    * @tc.desc   Test lchown() interface with null path. Callback.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_lchown_callback_error_002', Level.LEVEL2, async function (done) {
    let fpath = await nextFileName('fileio_test_lchown_callback_error_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     try {
       fileio.lchown(null, 1, 1, (err) => {
         if (err) {
           console.log('fileio_test_lchown_callback_error_002: ' + err.message + ', code: ' + err.code);
           expect(err.message == 'Invalid path' || err.message == 'Invalid arg').assertTrue();
           done();
         }
         let stat = fileio.statSync(fpath);
         expect(isIntNum(stat.uid)).assertTrue();
         fileio.unlinkSync(fpath);
         done();
       });
     } catch (err) {
       console.log('fileio_test_lchown_callback_error_002 err: ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
       done();
     }
   });

   /**
    * @tc.name   fileio_test_lchown_callback_error_003
    * @tc.number SUB_DF_FILEIO_LCHOWN_CALLBACK_ERROR_003
    * @tc.desc   Test lchown() interface with undefined path. Callback.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_lchown_callback_error_003', Level.LEVEL2, async function (done) {
    let fpath = await nextFileName('fileio_test_lchown_callback_error_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     try {
       fileio.lchown(undefined, 1, 1, (err) => {
         if (err) {
           console.log('fileio_test_lchown_callback_error_003: ' + err.message + ', code: ' + err.code);
           expect(err.message == 'Invalid path' || err.message == 'Invalid arg').assertTrue();
           done();
         }
         let stat = fileio.statSync(fpath);
         expect(isIntNum(stat.uid)).assertTrue();
         fileio.unlinkSync(fpath);
         done();
       });
     } catch (err) {
       console.log('fileio_test_lchown_callback_error_003 err: ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
       done();
     }
   });

   /**
    * @tc.name   fileio_test_lchown_callback_error_004
    * @tc.number SUB_DF_FILEIO_LCHOWN_CALLBACK_ERROR_004
    * @tc.desc   Test lchown() interface with null uid. Callback.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_lchown_callback_error_004', Level.LEVEL2, async function (done) {
     let fpath = await nextFileName('fileio_test_lchown_callback_error_004');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     try {
       fileio.lchown(fpath, null, 1, (err) => {
         if (err) {
           console.log('fileio_test_lchown_callback_error_004: ' + err.message + ', code: ' + err.code);
           expect(err.message == 'Invalid uid' || err.message == 'Invalid arg').assertTrue();
           done();
         }
         let stat = fileio.statSync(fpath);
         expect(isIntNum(stat.uid)).assertTrue();
         fileio.unlinkSync(fpath);
         done();
       });
     } catch (err) {
       console.log('fileio_test_lchown_callback_error_004 err: ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
       done();
     }
   });

   /**
    * @tc.name   fileio_test_lchown_callback_error_005
    * @tc.number SUB_DF_FILEIO_LCHOWN_CALLBACK_ERROR_005
    * @tc.desc   Test lchown() interface with undefined uid. Callback.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_lchown_callback_error_005', Level.LEVEL2, async function (done) {
     let fpath = await nextFileName('fileio_test_lchown_callback_error_005');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     try {
       fileio.lchown(fpath, undefined, 1, (err) => {
         if (err) {
           console.log('fileio_test_lchown_callback_error_005: ' + err.message + ', code: ' + err.code);
           expect(err.message == 'Invalid uid' || err.message == 'Invalid arg').assertTrue();
           fileio.unlinkSync(fpath);
           done();
         }
         let stat = fileio.statSync(fpath);
         expect(isIntNum(stat.uid)).assertTrue();
         fileio.unlinkSync(fpath);
         done();
       });
     } catch (err) {
       console.log('fileio_test_lchown_callback_error_005 err: ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
       fileio.unlinkSync(fpath);
       done();
     }
   });

   /**
    * @tc.name   fileio_test_lchown_callback_error_006
    * @tc.number SUB_DF_FILEIO_LCHOWN_CALLBACK_ERROR_006
    * @tc.desc   Test lchown() interface with null gid. Callback.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_lchown_callback_error_006', Level.LEVEL2, async function (done) {
     let fpath = await nextFileName('fileio_test_lchown_callback_error_006');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     try {
       fileio.lchown(fpath, 1, null, (err) => {
         if (err) {
           console.log('fileio_test_lchown_callback_error_006: ' + err.message + ', code: ' + err.code);
           expect(err.message == 'Invalid gid' || err.message == 'Invalid arg').assertTrue();
           done();
         }
         let stat = fileio.statSync(fpath);
         expect(isIntNum(stat.uid)).assertTrue();
         fileio.unlinkSync(fpath);
         done();
       });
     } catch (err) {
       console.log('fileio_test_lchown_callback_error_006 err: ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
       done();
     }
   });

   /**
    * @tc.name   fileio_test_lchown_callback_error_007
    * @tc.number SUB_DF_FILEIO_LCHOWN_CALLBACK_ERROR_007
    * @tc.desc   Test lchown() interface with undefined gid. Callback.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_lchown_callback_error_007', Level.LEVEL2, async function (done) {
     let fpath = await nextFileName('fileio_test_lchown_callback_error_007');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     try {
       fileio.lchown(fpath, 1, undefined, (err) => {
         if (err) {
           console.log('fileio_test_lchown_callback_error_007: ' + err.message + ', code: ' + err.code);
           expect(err.message == 'Invalid gid' || err.message == 'Invalid arg').assertTrue();
           done();
         }
         let stat = fileio.statSync(fpath);
         expect(isIntNum(stat.uid)).assertTrue();
         fileio.unlinkSync(fpath);
         done();
       });
     } catch (err) {
       console.log('fileio_test_lchown_callback_error_007 err: ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
       done();
     }
   });

   /**
    * @tc.name   fileio_test_lchown_sync_error_001
    * @tc.number SUB_DF_FILEIO_LCHOWN_SYNC_ERROR_001
    * @tc.desc   Test lchownSync() interface with empty string path.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_lchown_sync_error_001', Level.LEVEL2, async function () {
    let fpath = await nextFileName('fileio_test_lchown_sync_error_001');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     try {
       fileio.lchownSync('', 1, 1);
       let stat = fileio.statSync(fpath);
       expect(isIntNum(stat.uid)).assertTrue();
       fileio.unlinkSync(fpath);
     } catch (err) {
       console.log('fileio_test_lchown_sync_error_001: ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
   });

   /**
    * @tc.name   fileio_test_lchown_sync_error_002
    * @tc.number SUB_DF_FILEIO_LCHOWN_SYNC_ERROR_002
    * @tc.desc   Test lchownSync() interface with null path.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_lchown_sync_error_002', Level.LEVEL2, async function () {
    let fpath = await nextFileName('fileio_test_lchown_sync_error_002');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     try {
       fileio.lchownSync(null, 1, 1);
       let stat = fileio.statSync(fpath);
       expect(isIntNum(stat.uid)).assertTrue();
       fileio.unlinkSync(fpath);
     } catch (err) {
       console.log('fileio_test_lchown_sync_error_002: ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
   });

   /**
    * @tc.name   fileio_test_lchown_sync_error_003
    * @tc.number SUB_DF_FILEIO_LCHOWN_SYNC_ERROR_003
    * @tc.desc   Test lchownSync() interface with undefined path.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_lchown_sync_error_003', Level.LEVEL2, async function () {
    let fpath = await nextFileName('fileio_test_lchown_sync_error_003');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     try {
       fileio.lchownSync(undefined, 1, 1);
       let stat = fileio.statSync(fpath);
       expect(isIntNum(stat.uid)).assertTrue();
       fileio.unlinkSync(fpath);
     } catch (err) {
       console.log('fileio_test_lchown_sync_error_003: ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
   });

   /**
    * @tc.name   fileio_test_lchown_sync_error_004
    * @tc.number SUB_DF_FILEIO_LCHOWN_SYNC_ERROR_004
    * @tc.desc   Test lchownSync() interface with null uid.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_lchown_sync_error_004', Level.LEVEL2, async function () {
     let fpath = await nextFileName('fileio_test_lchown_sync_error_004');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     try {
       fileio.lchownSync(fpath, null, 1);
       let stat = fileio.statSync(fpath);
       expect(isIntNum(stat.uid)).assertTrue();
       fileio.unlinkSync(fpath);
     } catch (err) {
       console.log('fileio_test_lchown_sync_error_004: ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
   });

   /**
    * @tc.name   fileio_test_lchown_sync_error_005
    * @tc.number SUB_DF_FILEIO_LCHOWN_SYNC_ERROR_005
    * @tc.desc   Test lchownSync() interface with undefined uid.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_lchown_sync_error_005', Level.LEVEL2, async function () {
     let fpath = await nextFileName('fileio_test_lchown_sync_error_005');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     try {
       fileio.lchownSync(fpath, undefined, 1);
       let stat = fileio.statSync(fpath);
       expect(isIntNum(stat.uid)).assertTrue();
       fileio.unlinkSync(fpath);
     } catch (err) {
       console.log('fileio_test_lchown_sync_error_005: ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
   });

   /**
    * @tc.name   fileio_test_lchown_sync_error_006
    * @tc.number SUB_DF_FILEIO_LCHOWN_SYNC_ERROR_006
    * @tc.desc   Test lchownSync() interface with null gid.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_lchown_sync_error_006', Level.LEVEL2, async function () {
     let fpath = await nextFileName('fileio_test_lchown_sync_error_006');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     try {
       fileio.lchownSync(fpath, 1, null);
       let stat = fileio.statSync(fpath);
       expect(isIntNum(stat.uid)).assertTrue();
       fileio.unlinkSync(fpath);
     } catch (err) {
       console.log('fileio_test_lchown_sync_error_006: ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
   });

   /**
    * @tc.name   fileio_test_lchown_sync_error_007
    * @tc.number SUB_DF_FILEIO_LCHOWN_SYNC_ERROR_007
    * @tc.desc   Test lchownSync() interface with undefined gid.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_lchown_sync_error_007', Level.LEVEL2, async function () {
     let fpath = await nextFileName('fileio_test_lchown_sync_error_007');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     try {
       fileio.lchownSync(fpath, 1, undefined);
       let stat = fileio.statSync(fpath);
       expect(isIntNum(stat.uid)).assertTrue();
       fileio.unlinkSync(fpath);
     } catch (err) {
       console.log('fileio_test_lchown_sync_error_007: ' + err.message + ', code: ' + err.code);
       expect(false).assertTrue();
     }
   });
 });
}
