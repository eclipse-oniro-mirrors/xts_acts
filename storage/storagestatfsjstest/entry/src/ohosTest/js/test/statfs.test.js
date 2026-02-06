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

import {describe, it, expect, isIntNum, statfs} from './Common';
import featureAbility from '@ohos.ability.featureAbility';
import { Level } from '@ohos/hypium';

export default function statfs_test() {
describe('statfs_test', function () {

    /**
     * @tc.number SUB_DF_STATFS_GET_FREE_BYTES_0000
     * @tc.name statfs_test_get_free_bytes_async_000
     * @tc.desc Test getFreeBytes() interfaces, When the path is a sandbox path, promise way back.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
    */
  it('statfs_test_get_free_bytes_async_000', Level.LEVEL0, async function (done) {
    try {
      let context = featureAbility.getContext();
      let data = await context.getFilesDir();
      let number = await statfs.getFreeBytes(data);
      console.info("getFreeBytes getFilesDir===>" + (number / 1024));
      expect(isIntNum(number)).assertTrue();
      done();
    } catch (e) {
      console.info('statfs_test_get_free_bytes_async_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

    /**
     * @tc.number SUB_DF_STATFS_GET_FREE_BYTES_0010
     * @tc.name statfs_test_get_free_bytes_async_001
     * @tc.desc Test getFreeBytes() interfaces, When the path is dev, callback way back.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
    */
  it('statfs_test_get_free_bytes_async_001', Level.LEVEL0, async function (done) {
    try {
      statfs.getFreeBytes("/dev",(err,number)=>{
        console.info("getFreeBytesNumber dev===>:" + (number / 1024));
        expect(isIntNum(number)).assertTrue();
        done();
      });
    } catch (e) {
      console.info('statfs_test_get_free_bytes_async_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

    /**
     * @tc.number SUB_DF_STATFS_GET_FREE_BYTES_0020
     * @tc.name statfs_test_get_free_bytes_async_002
     * @tc.desc Test getFreeBytes() interfaces, When the parameter type is wrong.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
    */
  it('statfs_test_get_free_bytes_async_002', Level.LEVEL0, async function (done) {
    try {
      await statfs.getFreeBytes(1);
    } catch (err) {
      console.info('statfs_test_get_free_bytes_async_002 has failed for ' + err);
      expect(err.message == "Invalid path").assertTrue();
      done();
    }
  });

    /**
     * @tc.number SUB_DF_STATFS_GET_FREE_BYTES_0030
     * @tc.name statfs_test_get_free_bytes_async_003
     * @tc.desc Test getFreeBytes() interfaces, When there are no parameters.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
    */
  it('statfs_test_get_free_bytes_async_003', Level.LEVEL0, async function (done) {
    try {
      await statfs.getFreeBytes();
    } catch (err) {
      console.info('statfs_test_get_free_bytes_async_003 has failed for ' + err);
      expect(err.message == "Number of arguments unmatched").assertTrue();
      done();
    }
  });

    /**
     * @tc.number SUB_DF_STATFS_GET_FREE_BYTES_0040
     * @tc.name statfs_test_get_free_bytes_async_004
     * @tc.desc Test getFreeBytes() interfaces, When the path is empty.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
    */
  it('statfs_test_get_free_bytes_async_004', Level.LEVEL0, async function (done) {
    try {
      await statfs.getFreeBytes("");
    } catch (err) {
      console.info('statfs_test_get_free_bytes_async_004 has failed for ' + err);
      expect(err.message == "No such file or directory").assertTrue();
      done();
    }
  });

    /**
     * @tc.number SUB_DF_STATFS_GET_TOTAL_BYTES_0000
     * @tc.name statfs_test_get_total_bytes_async_000
     * @tc.desc Test getTotalBytes() interfaces, When the path is a sandbox path, promise way back.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
    */
     it('statfs_test_get_total_bytes_async_000', Level.LEVEL0, async function (done) {
      try {
        let context = featureAbility.getContext();
        let data = await context.getFilesDir();
        let number = await statfs.getTotalBytes(data);
        console.info("getTotalBytesNumber GetFilesDir====>:" + (number / 1024));
        expect(isIntNum(number)).assertTrue();
        done();
      } catch (e) {
        console.info('statfs_test_get_total_bytes_async_000 has failed for ' + e);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_DF_STATFS_GET_TOTAL_BYTES_0010
     * @tc.name statfs_test_get_total_bytes_async_001
     * @tc.desc Test getTotalBytes() interfaces, When the path is dev, callback way back.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
    */
    it('statfs_test_get_total_bytes_async_001', Level.LEVEL0, async function (done) {
      try {
        statfs.getTotalBytes("/dev",(err,number)=>{
          console.info("getTotalBytesNumber dev===>:" + (number / 1024));
          expect(isIntNum(number)).assertTrue();
          done();
        });
      } catch (e) {
        console.info('statfs_test_get_total_bytes_async_001 has failed for ' + e);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_DF_STATFS_GET_TOTAL_BYTES_0020
     * @tc.name statfs_test_get_total_bytes_async_002
     * @tc.desc Test getTotalBytes() interfaces, When the parameter type is wrong.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
    */
    it('statfs_test_get_total_bytes_async_002', Level.LEVEL0, async function (done) {
      try {
        await statfs.getTotalBytes(1);
      } catch (err) {
        console.info('statfs_test_get_total_bytes_async_002 has failed for ' + err);
        expect(err.message == "Invalid path").assertTrue();
        done();
      }
    });
  
    /**
     * @tc.number SUB_DF_STATFS_GET_TOTAL_BYTES_0030
     * @tc.name statfs_test_get_total_bytes_async_003
     * @tc.desc Test getTotalBytes() interfaces, When there are no parameters.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
    */
    it('statfs_test_get_total_bytes_async_003', Level.LEVEL0, async function (done) {
      try {
        await statfs.getTotalBytes();
      } catch (err) {
        console.info('statfs_test_get_total_bytes_async_003 has failed for ' + err);
        expect(err.message == "Number of arguments unmatched").assertTrue();
        done();
      }
    });
  
    /**
     * @tc.number SUB_DF_STATFS_GET_TOTAL_BYTES_0040
     * @tc.name statfs_test_get_total_bytes_async_004
     * @tc.desc Test getTotalBytes() interfaces, When the path is empty.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
    */
    it('statfs_test_get_total_bytes_async_004', Level.LEVEL0, async function (done) {
      try {
        await statfs.getTotalBytes("");
      } catch (err) {
        console.info('statfs_test_get_total_bytes_async_004 has failed for ' + err);
        expect(err.message == "No such file or directory").assertTrue();
        done();
      }
    });
});
}
