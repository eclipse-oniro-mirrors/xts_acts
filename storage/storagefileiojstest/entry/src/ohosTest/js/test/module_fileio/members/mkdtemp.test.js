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
});}
