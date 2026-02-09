/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import storageStatistics from '@ohos.file.storageStatistics';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
 
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const FILE_CONTENT = 'hello world';
 
export default function storageStatistics_test() {
  let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  let context = abilityDelegator.getAppContext();
  describe("storageStatistics_test", (): void => {
    hilog.info(domain, tag, '%{public}s', 'storageStatistics_test start');
 
    /**
     * @tc.name   storage_statistics_test_get_current_bundle_stats_async_static_000
     * @tc.number SUB_DF_STATISTICS_GET_CURRENT_BUNDLE_STATS_ASYNC_0000
     * @tc.desc   Test getCurrentBundleStats() interfaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('storage_statistics_test_get_current_bundle_stats_async_static_000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'storage_statistics_test_get_current_bundle_stats_async_000 START');
 
        try {
          let bundleStat = await storageStatistics.getCurrentBundleStats();
          expect(bundleStat != null).assertTrue();
          expect(await Utils.isIntNum(bundleStat.appSize) && !await Utils.isNegativeNum(bundleStat.appSize))
            .assertTrue();
          expect(await Utils.isIntNum(bundleStat.cacheSize) && !await Utils.isNegativeNum(bundleStat.cacheSize))
            .assertTrue();
          expect(await Utils.isIntNum(bundleStat.dataSize) && !await Utils.isNegativeNum(bundleStat.dataSize))
            .assertTrue();
          done();
        } catch (e) {
          hilog.info(domain, tag, '%{public}s',
            'storage_statistics_test_get_current_bundle_stats_async_000 has failed for ' + e);
          expect(false).assertTrue();
          done();
        }
 
        hilog.info(domain, tag, '%{public}s', 'storage_statistics_test_get_current_bundle_stats_async_000 END');
      });
 
    /**
     * @tc.name   storage_statistics_test_get_current_bundle_stats_async_static_001
     * @tc.number SUB_DF_STATISTICS_GET_CURRENT_BUNDLE_STATS_ASYNC_0001
     * @tc.desc   Test getCurrentBundleStats() interfaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('storage_statistics_test_get_current_bundle_stats_async_static_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'storage_statistics_test_get_current_bundle_stats_async_001 START');
 
        try {
          storageStatistics.getCurrentBundleStats((error: BusinessError | null,
            bundleStat: storageStatistics.BundleStats | undefined) => {
            expect(bundleStat != null).assertTrue();
            let bundleStatTemp = bundleStat as storageStatistics.BundleStats;
            expect(await Utils.isIntNum(bundleStatTemp.appSize) && !await Utils.isNegativeNum(bundleStatTemp.appSize))
              .assertTrue();
            expect(await Utils.isIntNum(bundleStatTemp.cacheSize) &&
              !await Utils.isNegativeNum(bundleStatTemp.cacheSize))
              .assertTrue();
            expect(await Utils.isIntNum(bundleStatTemp.dataSize) && !await Utils.isNegativeNum(bundleStatTemp.dataSize))
              .assertTrue();
            done();
          });
 
          hilog.info(domain, tag, 'Test PASSED');
        } catch (err) {
          hilog.info(domain, tag, `unknown error: ${err}`);
          expect(false).assertTrue();
          done();
        }
 
        hilog.info(domain, tag, '%{public}s', 'storage_statistics_test_get_current_bundle_stats_async_001 END');
      });
 
    /**
     * @tc.name   storageStatistics_test_get_free_size_sync_static_000
     * @tc.number SUB_DF_STATISTICS_GET_FREE_SIZE_SYNC_0000
     * @tc.desc   Test getFreeSize() interfaces, when the path is a sandbox path, promise way back.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('storageStatistics_test_get_free_size_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'storageStatistics_test_get_free_size_sync_static_000 start');
        try {
          const num = await storageStatistics.getFreeSize();
          hilog.info(domain, tag,
            `storageStatistics_test_get_free_size_sync_static_000 getFreeSize getFilesDir===> + ${num / 1024}`);
          expect(await Utils.isIntNum(num)).assertTrue();
          done();
        } catch (e: BusinessError) {
          hilog.info(domain, tag, '%{public}s',
            'storageStatistics_test_get_free_size_sync_static_000 has failed for' + e.message + ' code: ' + e.code);
          expect(false).assertTrue();
          done();
        }
      });
 
    /**
     * @tc.name   storageStatistics_test_get_free_size_sync_static_001
     * @tc.number SUB_DF_STATISTICS_GET_FREE_SIZE_SYNC_0100
     * @tc.desc   Test getFreeSize() interfaces, when the path is dev, callback way back.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('storageStatistics_test_get_free_size_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'storageStatistics_test_get_free_size_sync_static_001 start');
        try {
          let num = await storageStatistics.getFreeSize();
          hilog.info(domain, tag, '%{public}s',
            'storageStatistics_test_get_free_size_sync_static_001 getFreeSize dev===> ' + (num / 1024));
          expect(await Utils.isIntNum(num)).assertTrue();
          done();
        } catch (e: BusinessError) {
          hilog.info(domain, tag, '%{public}s',
            'storageStatistics_test_get_free_size_sync_static_001 has failed for' + e.message + ' code: ' + e.code);
          expect(false).assertTrue();
          done();
        }
      });
 
    /**
     * @tc.name   storageStatistics_test_get_total_size_sync_static_000
     * @tc.number SUB_DF_STATISTICS_GET_TOTAL_SIZE_SYNC_0000
     * @tc.desc   Test getTotalSize() interfaces, when the path is a sandbox path, promise way back.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('storageStatistics_test_get_total_size_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'storageStatistics_test_get_total_size_sync_static_000 start');
        try {
          let num = await storageStatistics.getTotalSize();
          hilog.info(domain, tag, '%{public}s',
            'storageStatistics_test_get_total_size_sync_static_000 getTotalSizeNumber getFilesDir===> ' + (num / 1024));
          expect(await Utils.isIntNum(num)).assertTrue();
          done();
        } catch (e: BusinessError) {
          hilog.info(domain, tag, '%{public}s',
            'storageStatistics_test_get_total_size_sync_static_000 has failed for' + e.message + ' code: ' + e.code);
          expect(false).assertTrue();
          done();
        }
      });
 
    /**
     * @tc.name   storageStatistics_test_get_total_size_sync_static_001
     * @tc.number SUB_DF_STATISTICS_GET_TOTAL_SIZE_SYNC_0100
     * @tc.desc   Test getTotalSize() interfaces, when the path is dev, callback way back.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('storageStatistics_test_get_total_size_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'storageStatistics_test_get_total_size_sync_static_001 start');
        try {
          let num = await storageStatistics.getTotalSize();
          hilog.info(domain, tag, '%{public}s',
            'storageStatistics_test_get_total_size_sync_static_001 getTotalSizeNumber dev===> ' + (num / 1024));
          expect(await Utils.isIntNum(num)).assertTrue();
          done();
        } catch (e: BusinessError) {
          hilog.info(domain, tag, '%{public}s',
            'storageStatistics_test_get_total_size_sync_static_001 has failed for' + e.message + ' code: ' + e.code);
          expect(false).assertTrue();
          done();
        }
      });
 
    
    /**
     * @tc.name   storageStatistics_test_get_free_size_async_static_000
     * @tc.number SUB_DF_STATISTICS_GET_FREE_SIZE_0000
     * @tc.desc   Test getFreeSize() interfaces, when the path is a sandbox path, promise way back.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('storageStatistics_test_get_free_size_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'storageStatistics_test_get_free_size_async_static_000 start');
        try {
          let num = await storageStatistics.getFreeSize();
          hilog.info(domain, tag, '%{public}s',
            'storageStatistics_test_get_free_size_async_static_000 getFreeSize getFilesDir===> ' + (num / 1024));
          expect(await Utils.isIntNum(num)).assertTrue();
          done();
        } catch (e: BusinessError) {
          hilog.info(domain, tag, '%{public}s',
            'storageStatistics_test_get_free_size_async_static_000 has failed for' + e.message + ' code: ' + e.code);
          expect(false).assertTrue();
          done();
        }
      });
 
    /**
     * @tc.name   storageStatistics_test_get_free_size_async_static_001
     * @tc.number SUB_DF_STATISTICS_GET_FREE_SIZE_0100
     * @tc.desc   Test getFreeSize() interfaces, when the path is dev, callback way back.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('storageStatistics_test_get_free_size_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'storageStatistics_test_get_free_size_async_static_001 start');
        try {
          storageStatistics.getFreeSize((err: BusinessError | null, num: long | undefined) => {
            if (err?.code !== undefined) {
              hilog.info(domain, tag, '%{public}s',
                'storageStatistics_test_get_free_size_async_static_001 has error ' + err?.message + ' code: ' + err?.code);
              expect(false).assertTrue();
            }
            hilog.info(domain, tag, '%{public}s', 'storageStatistics_test_get_free_size_async_static_001 getFreeSize dev===> ');
            if (num !== undefined) {
              let numtrans = num as long;
              expect(await Utils.isIntNum(numtrans)).assertTrue();
            }
            done();
          });
        } catch (e: BusinessError) {
          hilog.info(domain, tag, '%{public}s',
            'storageStatistics_test_get_free_size_async_static_001 has failed for' + e.message + ' code: ' + e.code);
          expect(false).assertTrue();
        }
      });
 
    /**
     * @tc.name   storageStatistics_test_get_total_size_async_static_000
     * @tc.number SUB_DF_STATISTICS_GET_TOTAL_SIZE_0000
     * @tc.desc   Test getTotalSize() interfaces, when the path is a sandbox path, promise way back.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('storageStatistics_test_get_total_size_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'storageStatistics_test_get_total_size_async_static_000 start');
        try {
          let num = await storageStatistics.getTotalSize();
          hilog.info(domain, tag, '%{public}s',
            'storageStatistics_test_get_total_size_async_static_000 getTotalSize getFilesDir===> ' + (num / 1024));
          expect(await Utils.isIntNum(num)).assertTrue();
          done();
        } catch (e: BusinessError) {
          hilog.info(domain, tag, '%{public}s',
            'storageStatistics_test_get_total_size_async_static_000 has failed for' + e.message + ' code: ' + e.code);
          expect(false).assertTrue();
        }
      });
 
    /**
     * @tc.name   storageStatistics_test_get_total_size_async_static_001
     * @tc.number SUB_DF_STATISTICS_GET_TOTAL_SIZE_0100
     * @tc.desc   Test getTotalSize() interfaces, when the path is dev, callback way back.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('storageStatistics_test_get_total_size_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'storageStatistics_test_get_total_size_async_static_001 start');
        try {
          storageStatistics.getTotalSize((err: BusinessError | null, num: long | undefined) => {
            if (err?.code !== undefined) {
              hilog.info(domain, tag, '%{public}s',
                'storageStatistics_test_get_total_size_async_static_001 has error ' + err?.message + ' code: ' + err?.code);
              expect(false).assertTrue();
            }
            hilog.info(domain, tag, '%{public}s', 'storageStatistics_test_get_total_size_async_static_001 getTotalSize dev===> ');
            if (num !== undefined) {
              let numtrans = num as long;
              expect(await Utils.isIntNum(numtrans) as boolean).assertTrue();
            }
            done();
          });
        } catch (e: BusinessError) {
          hilog.info(domain, tag, '%{public}s',
            'storageStatistics_test_get_total_size_async_static_001 has failed for' + e.message + ' code: ' + e.code);
          expect(false).assertTrue();
        }
      });

    /**
     * @tc.name   storage_statistics_test_getFreeSize_static_001
     * @tc.number SUB_DF_STATISTICS_GET_FREE_SIZE_0200
     * @tc.desc   Test getFreeSize() interfaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('storage_statistics_test_getFreeSize_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
      try {
        let sizeNumber = storageStatistics.getFreeSizeSync();
        hilog.info(domain, tag, '%{public}s', "getFreeSizeSync successfully:" + sizeNumber);
        expect(await Utils.isIntNum(sizeNumber)).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "getFreeSize_static_001 has failed for " + error);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   storage_statistics_test_getTotalSize_static_001
     * @tc.number SUB_DF_STATISTICS_GET_TOTAL_SIZE_0200
     * @tc.desc   Test getTotalSize() interfaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('storage_statistics_test_getTotalSize_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
      try {
        let sizeNumber = storageStatistics.getTotalSizeSync();
        hilog.info(domain, tag, '%{public}s', "getTotalSizeSync successfully:" + sizeNumber);
        expect(await Utils.isIntNum(sizeNumber)).assertTrue();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', "getTotalSize_static_001 has failed for " + error);
        expect(false).assertTrue();
      }
    });
  })
  hilog.info(domain, tag, '%{public}s', 'storageStatistics_test end');
 
}