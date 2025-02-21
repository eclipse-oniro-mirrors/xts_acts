/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import {describe, it, expect, isIntNum, statvfs} from './Common';
import featureAbility from '@ohos.ability.featureAbility';

export default function statvfs_test() {
describe('statvfs_test', function () {

  /**
   * @tc.number SUB_DF_STATFS_GET_FREE_SIZE_0000
   * @tc.name statvfs_test_get_free_size_async_000
   * @tc.desc Test getFreeSize() interfaces, when the path is a sandbox path, promise way back.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
  */
  it('statvfs_test_get_free_size_async_000', 0, async function (done) {
    try {
      let context = featureAbility.getContext();
      let data = await context.getFilesDir();
      let number = await statvfs.getFreeSize(data);
      console.log("getFreeSize getFilesDir===>" + (number / 1024));
      expect(isIntNum(number)).assertTrue();
      done();
    } catch (e) {
      console.log('statvfs_test_get_free_size_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_STATFS_GET_FREE_SIZE_0100
   * @tc.name statvfs_test_get_free_size_async_001
   * @tc.desc Test getFreeSize() interfaces, when the path is dev, callback way back.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
  */
  it('statvfs_test_get_free_size_async_001', 0, async function (done) {
    try {
      statvfs.getFreeSize("/dev", (err, number) => {
        if (err) {
          console.log('statvfs_test_get_free_size_async_001 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        console.log("getFreeSizeNumber dev===>:" + (number / 1024));
        expect(isIntNum(number)).assertTrue();
        done();
      });
    } catch (e) {
      console.log('statvfs_test_get_free_size_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_STATFS_GET_FREE_SIZE_0200
   * @tc.name statvfs_test_get_free_size_async_002
   * @tc.desc Test getFreeSize() interfaces, when the parameter type is wrong.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
  */
  it('statvfs_test_get_free_size_async_002', 0, async function (done) {
    try {
      await statvfs.getFreeSize(1);
      expect(false).assertTrue();
    } catch (e) {
      console.log('statvfs_test_get_free_size_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_STATFS_GET_FREE_SIZE_0300
   * @tc.name statvfs_test_get_free_size_async_003
   * @tc.desc Test getFreeSize() interfaces, when there are no parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
  */
  it('statvfs_test_get_free_size_async_003', 0, async function (done) {
    try {
      await statvfs.getFreeSize();
      expect(false).assertTrue();
    } catch (e) {
      console.log('statvfs_test_get_free_size_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_STATFS_GET_FREE_SIZE_0400
   * @tc.name statvfs_test_get_free_size_async_004
   * @tc.desc Test getFreeSize() interfaces, when the path is empty.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
  */
  it('statvfs_test_get_free_size_async_004', 0, async function (done) {
    try {
      await statvfs.getFreeSize("");
      expect(false).assertTrue();
    } catch (e) {
      console.log('statvfs_test_get_free_size_async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_STATFS_GET_FREE_SIZE_0500
   * @tc.name statvfs_test_get_free_size_async_005
   * @tc.desc Test getFreeSize() interfaces, when the path is empty.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
  */
  it('statvfs_test_get_free_size_async_005', 0, async function (done) {
    try {
      statvfs.getFreeSize("", (err) => {
        if (err) {
          console.log(
            'statvfs_test_get_free_size_async_005 error package: {' + err.message + ', code: ' + err.code + '}');
          expect(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('statvfs_test_get_free_size_async_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_STATFS_GET_TOTAL_SIZE_0000
   * @tc.name statvfs_test_get_total_size_async_000
   * @tc.desc Test getTotalSize() interfaces, when the path is a sandbox path, promise way back.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
  */
  it('statvfs_test_get_total_size_async_000', 0, async function (done) {

    try {
      let context = featureAbility.getContext();
      let data = await context.getFilesDir();
      let number = await statvfs.getTotalSize(data);
      console.log("getTotalSizeNumber GetFilesDir====>:" + (number / 1024));
      expect(isIntNum(number)).assertTrue();
      done();
    } catch (e) {
      console.log('statvfs_test_get_total_size_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_STATFS_GET_TOTAL_SIZE_0100
   * @tc.name statvfs_test_get_total_size_async_001
   * @tc.desc Test getTotalSize() interfaces, when the path is dev, callback way back.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
  */
  it('statvfs_test_get_total_size_async_001', 0, async function (done) {

    try {
      statvfs.getTotalSize("/dev", (err, number) => {
        if (err) {
          console.log('statvfs_test_get_total_size_async_001 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        console.log("getTotalSizeNumber dev===>:" + (number / 1024));
        expect(isIntNum(number)).assertTrue();
        done();
      });
    } catch (e) {
      console.log('statvfs_test_get_total_size_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });
  
  /**
   * @tc.number SUB_DF_STATFS_GET_TOTAL_SIZE_0200
   * @tc.name statvfs_test_get_total_size_async_002
   * @tc.desc Test getTotalSize() interfaces, when the parameter type is wrong.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
  */
  it('statvfs_test_get_total_size_async_002', 0, async function (done) {

    try {
      await statvfs.getTotalSize(1);
      expect(false).assertTrue();
    } catch (e) {
      console.log('statvfs_test_get_total_size_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
      done();
    }
  });
  
  /**
   * @tc.number SUB_DF_STATFS_GET_TOTAL_SIZE_0300
   * @tc.name statvfs_test_get_total_size_async_003
   * @tc.desc Test getTotalSize() interfaces, when there are no parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
  */
  it('statvfs_test_get_total_size_async_003', 0, async function (done) {

    try {
      await statvfs.getTotalSize();
      expect(false).assertTrue();
    } catch (e) {
      console.log('statvfs_test_get_total_size_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
      done();
    }
  });
  
  /**
   * @tc.number SUB_DF_STATFS_GET_TOTAL_SIZE_0400
   * @tc.name statvfs_test_get_total_size_async_004
   * @tc.desc Test getTotalSize() interfaces, when the path is empty.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
  */
  it('statvfs_test_get_total_size_async_004', 0, async function (done) {

    try {
      await statvfs.getTotalSize("");
      expect(false).assertTrue();
    } catch (e) {
      console.log('statvfs_test_get_total_size_async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_STATFS_GET_TOTAL_SIZE_0500
   * @tc.name statvfs_test_get_total_size_async_005
   * @tc.desc Test getTotalSize() interfaces, when the path is empty.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
  */
  it('statvfs_test_get_total_size_async_005', 0, async function (done) {

    try {
      statvfs.getTotalSize("", (err) => {
        if (err) {
          console.log(
            'statvfs_test_get_total_size_async_005 error package: {' + err.message + ', code: ' + err.code + '}');
          expect(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('statvfs_test_get_total_size_async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });
});
}
