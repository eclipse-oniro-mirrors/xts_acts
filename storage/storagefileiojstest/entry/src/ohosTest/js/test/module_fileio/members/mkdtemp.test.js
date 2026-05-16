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

export default function fileioMkdtemp() {
describe('fileio_mkdtemp', function () {

  /**
   * @tc.name   fileio_test_mkdtemp_sync_000
   * @tc.number SUB_DF_FILEIO_MKDTEMP_SYNC_0000
   * @tc.desc   Test mkdtempSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_mkdtemp_sync_000', Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileio_test_mkdtemp_sync_000');
    dpath = dpath + 'XXXX';

    try {
      let res = fileio.mkdtempSync(dpath);
      expect(null).assertFail();
    } catch (e) {
      console.log('fileio_test_mkdtemp_sync_000 has failed for ' + e);
    }
  });

  /**
   * @tc.name   fileio_test_mkdtemp_sync_001
   * @tc.number SUB_DF_FILEIO_MKDTEMP_SYNC_0010
   * @tc.desc   Test mkdtempSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_mkdtemp_sync_001', Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileio_test_mkdtemp_sync_001');
    dpath = dpath + 'XXXXXX';

    try {
      let res = fileio.mkdtempSync(dpath);
      expect(fileio.rmdirSync(res) == null).assertTrue();
    } catch (e) {
      console.log('fileio_test_mkdtemp_sync_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });
  
  /**
   * @tc.name   fileio_test_mkdtemp_async_000
   * @tc.number SUB_DF_FILEIO_MKDTEMP_ASYNC_0000
   * @tc.desc   Test mkdtempASync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_mkdtemp_async_000', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileio_test_mkdtemp_async_000');
    dpath = dpath + 'XXXXXX';
    try {
      let res = await fileio.mkdtemp(dpath);
      expect(fileio.rmdirSync(res) == null).assertTrue();
      done();
    } catch (e) {
      console.log('fileio_test_mkdtemp_async_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_mkdtemp_async_001
   * @tc.number SUB_DF_FILEIO_MKDTEMP_ASYNC_0010
   * @tc.desc   Test mkdtempASync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_mkdtemp_async_001', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileio_test_mkdtemp_async_001');
    dpath = dpath + 'XXXXXX';

    try {
      fileio.mkdtemp(dpath, function (err, res) {
        expect(fileio.rmdirSync(res) == null).assertTrue();
        done();
      });
    } catch (e) {
      console.log('fileio_test_mkdtemp_async_001 has failed for ' + e);
      expect(null).assertFail();
    }
   });

   /**
    * @tc.name   fileio_test_mkdtemp_promise_error_001
    * @tc.number SUB_DF_FILEIO_MKDTEMP_PROMISE_ERROR_001
    * @tc.desc   Test mkdtemp() interface with empty string prefix. Promise.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_mkdtemp_promise_error_001', Level.LEVEL2, async function () {
     try {
       await fileio.mkdtemp('');
       expect(false).assertTrue();
     } catch (err) {
       console.log('fileio_test_mkdtemp_promise_error_001: ' + err.message + ', code: ' + err.code);
       expect(err.message == 'Invalid argument').assertTrue();
     }
   });

   /**
    * @tc.name   fileio_test_mkdtemp_promise_error_002
    * @tc.number SUB_DF_FILEIO_MKDTEMP_PROMISE_ERROR_002
    * @tc.desc   Test mkdtemp() interface with null prefix. Promise.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it('fileio_test_mkdtemp_promise_error_002', Level.LEVEL2, async function () {
     try {
       await fileio.mkdtemp(null);
       expect(false).assertTrue();
     } catch (err) {
       console.log('fileio_test_mkdtemp_promise_error_002: ' + err.message + ', code: ' + err.code);
       expect(err.message == 'Invalid path').assertTrue();
     }
   });

    /**
     * @tc.name   fileio_test_mkdtemp_promise_error_003
     * @tc.number SUB_DF_FILEIO_MKDTEMP_PROMISE_ERROR_003
     * @tc.desc   Test mkdtemp() interface with undefined prefix. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('fileio_test_mkdtemp_promise_error_003', Level.LEVEL2, async function () {
      try {
        await fileio.mkdtemp(undefined);
        expect(false).assertTrue();
      } catch (err) {
        console.log('fileio_test_mkdtemp_promise_error_003: ' + err.message + ', code: ' + err.code);
        expect(err.message == 'Invalid path').assertTrue();
      }
    });

    /**
     * @tc.name   fileio_test_mkdtemp_sync_error_001
     * @tc.number SUB_DF_FILEIO_MKDTEMP_SYNC_ERROR_001
     * @tc.desc   Test mkdtempSync() interface with empty string prefix.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('fileio_test_mkdtemp_sync_error_001', Level.LEVEL2, async function () {
      try {
        fileio.mkdtempSync('');
        expect(false).assertTrue();
      } catch (err) {
        console.log('fileio_test_mkdtemp_sync_error_001: ' + err.message + ', code: ' + err.code);
        expect(err.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileio_test_mkdtemp_sync_error_002
     * @tc.number SUB_DF_FILEIO_MKDTEMP_SYNC_ERROR_002
     * @tc.desc   Test mkdtempSync() interface with null prefix.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('fileio_test_mkdtemp_sync_error_002', Level.LEVEL2, async function () {
      try {
        fileio.mkdtempSync(null);
        expect(false).assertTrue();
      } catch (err) {
        console.log('fileio_test_mkdtemp_sync_error_002: ' + err.message + ', code: ' + err.code);
        expect(err.message == 'Invalid path').assertTrue();
      }
    });

    /**
     * @tc.name   fileio_test_mkdtemp_sync_error_003
     * @tc.number SUB_DF_FILEIO_MKDTEMP_SYNC_ERROR_003
     * @tc.desc   Test mkdtempSync() interface with undefined prefix.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc)level  LEVEL2
     */
    it('fileio_test_mkdtemp_sync_error_003', Level.LEVEL2, async function () {
      try {
        fileio.mkdtempSync(undefined);
        expect(false).assertTrue();
      } catch (err) {
        console.log('fileio_test_mkdtemp_sync_error_003: ' + err.message + ', code: ' + err.code);
        expect(err.message == 'Invalid path').assertTrue();
      }
    });

    /**
     * @tc.name   fileio_test_mkdtemp_callback_error_001
     * @tc.number SUB_DF_FILEIO_MKDTEMP_CALLBACK_ERROR_001
     * @tc.desc   Test mkdtemp() interface with empty string prefix. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('fileio_test_mkdtemp_callback_error_001', Level.LEVEL2, async function (done) {
      fileio.mkdtemp('', function (err, res) {
        if (err) {
          console.log('fileio_test_mkdtemp_callback_error_001: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'Invalid argument').assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    });

    /**
     * @tc.name   fileio_test_mkdtemp_callback_error_002
     * @tc.number SUB_DF_FILEIO_MKDTEMP_CALLBACK_ERROR_002
     * @tc.desc   Test mkdtemp() interface with null prefix. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('fileio_test_mkdtemp_callback_error_002', Level.LEVEL2, async function (done) {
      try {
        fileio.mkdtemp(null, function (err, res) {
          if (err) {
            console.log('fileio_test_mkdtemp_callback_error_002: ' + err.message + ', code: ' + err.code);
            expect(err.message == 'Invalid path').assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (err) {
        console.log('fileio_test_mkdtemp_callback_error_002 err: ' + err.message + ', code: ' + err.code);
        expect(err.message == 'Invalid path').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileio_test_mkdtemp_callback_error_003
     * @tc.number SUB_DF_FILEIO_MKDTEMP_CALLBACK_ERROR_003
     * @tc.desc   Test mkdtemp() interface with undefined prefix. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('fileio_test_mkdtemp_callback_error_003', Level.LEVEL2, async function (done) {
      try{
        fileio.mkdtemp(undefined, function (err, res) {
          if (err) {
            console.log('fileio_test_mkdtemp_callback_error_003: ' + err.message + ', code: ' + err.code);
            expect(err.message == 'Invalid path').assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (err) {
        console.log('fileio_test_mkdtemp_callback_error_003 err: ' + err.message + ', code: ' + err.code);
        expect(err.message == 'Invalid path').assertTrue();
        done();
      }
    });
});}
