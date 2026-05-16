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
  fileio,
  nextFileName,
  describe,
  it,
  expect,
} from '../../Common';
import { Level } from '@ohos/hypium';

export default function fileioDirClose() {
describe('fileio_dir_close', function () {

  /**
   * @tc.name   fileio_test_dir_close_async_000
   * @tc.number SUB_DF_FILEIO_DIR_CLOSE_ASYNC_0000
   * @tc.desc   Test Dir close() interface,return in promise mode.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_dir_close_async_000', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileio_test_dir_close_async_000') + 'd';

    try {
      fileio.mkdirSync(dpath);
      let dd = await fileio.opendir(dpath);
      await dd.close();
      fileio.rmdirSync(dpath);
      done();
    } catch (e) {
      console.info('fileio_test_dir_close_async_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_dir_close_async_001
   * @tc.number SUB_DF_FileIO_Dir_close_Async_0100
   * @tc.desc   Test Dir close() interface,return in callback mode.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_dir_close_async_001', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileio_test_dir_close_async_001') + 'd';

    try {
      fileio.mkdirSync(dpath);
      let dd = await fileio.opendir(dpath);
      dd.close(function (err) {
        fileio.rmdirSync(dpath);
        done();
      });
    } catch (e) {
      console.info('fileio_test_dir_close_async_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

   /**
    * @tc.name   fileio_test_dir_close_async_002
    * @tc.number SUB_DF_FileIO_Dir_close_Async_0200
    * @tc.desc   Test Dir  close() interface,there are multiple parameters.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileio_test_dir_close_async_002', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileio_test_dir_close_async_002') + 'd';
    try {
      fileio.mkdirSync(dpath);
      let dd = await fileio.opendir(dpath);
      dd.close(-1,function (err) {
      });
    } catch (e) {
      console.info('fileio_test_dir_close_async_002 has failed for ' + e);
      expect(e.message == "Number of arguments unmatched").assertTrue();
      fileio.rmdirSync(dpath);
      done(); 
    }
  });
});
}
