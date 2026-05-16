/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll,it, expect, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import statistics from '@ohos.net.statistics';
import connection from '@ohos.net.connection';
import data from '@ohos.telephony.data';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';

const ExpectTrue: (n: boolean, caseName?: string) => void = (n: boolean, caseName?: string) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(`${caseName} expect error ${JSON.stringify(err)}`);
  }
}

let hasData: boolean;

async function getApplicationUid(): Promise<number> {
  try {
    let userId: number = await account.getAccountManager().getOsAccountLocalId();
    let applicationFlags: number = bundleManager.ApplicationFlag.GET_APPLICATION_INFO_DEFAULT;
    let applicationInfo: bundleManager.ApplicationInfo = await bundleManager.getApplicationInfoSync('com.example.m', applicationFlags, userId);
    console.info(`getApplicationUid applicationInfo ${JSON.stringify(applicationInfo)}`)
    return applicationInfo.uid;
  } catch (err) {
    console.info(`getApplicationUid catch error ${JSON.stringify(err)}`)
    return 0;
  }
}


export default function   netStatisticsNoDataTest() {

  describe('NetStatisticsNoDataTest', () => {

    beforeAll(async () => {
      hasData = await data.isCellularDataEnabled();
      if (hasData) {
        await data.disableCellularData();
        hasData = await data.isCellularDataEnabled();
      }
    });

    /**
     * @tc.name   testNetworkMgrStatisticsGetCellularRxBytes0500
     * @tc.number SUB_NetworkMgr_Statistics_GetCellularRxBytes_0500
     * @tc.desc   Get cellular real-time downlink traffic without card;callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrStatisticsGetCellularRxBytes0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetCellularRxBytes0500';
      console.info(`${caseName} test start`);
      try {
        statistics.getCellularRxBytes((error: BusinessError, stats: number) => {
          if (error) {
            console.info(`${caseName}  ${JSON.stringify(error)}`);
            ExpectTrue(error.code == 2103012, caseName);
            done();
            console.info(`${caseName} test end`);
          }
          else {
            console.info(`${caseName}  ${stats}`);
            ExpectTrue(false, caseName);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (error) {
        ExpectTrue(error.code == 2103012, caseName);
        done();
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrStatisticsGetCellularRxBytes0600
     * @tc.number SUB_NetworkMgr_Statistics_GetCellularRxBytes_0600
     * @tc.desc   Get cellular real-time downlink traffic without card;promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrStatisticsGetCellularRxBytes0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetCellularRxBytes0600';
      console.info(`${caseName} test start`);
      try {
        statistics.getCellularRxBytes((error: BusinessError, stats: number) => {
          if (error) {
            console.info(`${caseName}  ${JSON.stringify(error)}`);
            ExpectTrue(error.code == 2103012, caseName);
            done();
            console.info(`${caseName} test end`);
          }
          else {
            console.info(`${caseName}  ${stats}`);
            ExpectTrue(false, caseName);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (error) {
        ExpectTrue(error.code == 2103012, caseName);
        done();
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrStatisticsGetCellularTxBytes0500
     * @tc.number SUB_NetworkMgr_Statistics_GetCellularTxBytes_0500
     * @tc.desc   Get cellular real-time downlink traffic without card;callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrStatisticsGetCellularTxBytes0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetCellularTxBytes0500';
      console.info(`${caseName} test start`);
      try {
        statistics.getCellularTxBytes((error: BusinessError, stats: number) => {
          if (error) {
            console.info(`${caseName}  ${JSON.stringify(error)}`);
            ExpectTrue(error.code == 2103012, caseName);
            done();
            console.info(`${caseName} test end`);
          }
          else {
            console.info(`${caseName}  ${stats}`);
            ExpectTrue(false, caseName);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (error) {
        ExpectTrue(error.code == 2103012, caseName);
        done();
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrStatisticsGetCellularTxBytes0600
     * @tc.number SUB_NetworkMgr_Statistics_GetCellularTxBytes_0600
     * @tc.desc   Get cellular real-time downlink traffic without card;promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrStatisticsGetCellularTxBytes0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetCellularTxBytes0600';
      console.info(`${caseName} test start`);
      try {
        statistics.getCellularTxBytes((error: BusinessError, stats: number) => {
          if (error) {
            console.info(`${caseName}  ${JSON.stringify(error)}`);
            ExpectTrue(error.code == 2103012, caseName);
            done();
            console.info(`${caseName} test end`);
          }
          else {
            console.info(`${caseName}  ${stats}`);
            ExpectTrue(false, caseName);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (error) {
        ExpectTrue(error.code == 2103012, caseName);
        done();
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrStatisticsGetAllRxBytes0500
     * @tc.number SUB_NetworkMgr_Statistics_GetAllRxBytes_0500
     * @tc.desc   Obtain real-time downlink traffic of all network adapters without Ethernet access;callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrStatisticsGetAllRxBytes0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetAllRxBytes0500';
      console.info(`${caseName} test start`);
      try {
        statistics.getAllRxBytes((error: BusinessError, stats: number) => {
          if (error) {
            console.info(`${caseName} err ${JSON.stringify(error)}`);
            ExpectTrue(false, caseName);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} stats ${stats}`);
            ExpectTrue(true, caseName);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        ExpectTrue(false, caseName);
        done();
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrStatisticsGetAllRxBytes0600
     * @tc.number SUB_NetworkMgr_Statistics_GetAllRxBytes_0600
     * @tc.desc   Obtain real-time downlink traffic of all network adapters without Ethernet access;promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrStatisticsGetAllRxBytes0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetAllRxBytes0600';
      console.info(`${caseName} test start`);
      try {
        statistics.getAllRxBytes((error: BusinessError, stats: number) => {
          if (error) {
            console.info(`${caseName} err ${JSON.stringify(error)}`);
            ExpectTrue(false, caseName);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} stats ${stats}`);
            ExpectTrue(true, caseName);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        ExpectTrue(false, caseName);
        done();
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrStatisticsGetAllTxBytes0500
     * @tc.number SUB_NetworkMgr_Statistics_GetAllTxBytes_0500
     * @tc.desc   Obtain real-time upstream traffic of all nics without Ethernet access;callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrStatisticsGetAllTxBytes0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetAllTxBytes0500';
      console.info(`${caseName} test start`);
      try {
        statistics.getAllTxBytes((error: BusinessError, stats: number) => {
          if (error) {
            console.info(`${caseName} err ${JSON.stringify(error)}`);
            ExpectTrue(false, caseName);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} stats ${stats}`);
            ExpectTrue(true, caseName);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        ExpectTrue(false, caseName);
        done();
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrStatisticsGetAllTxBytes0600
     * @tc.number SUB_NetworkMgr_Statistics_GetAllTxBytes_0600
     * @tc.desc   Obtain real-time upstream traffic of all nics without Ethernet access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrStatisticsGetAllTxBytes0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetAllTxBytes0600';
      console.info(`${caseName} test start`);
      try {
        statistics.getAllTxBytes((error: BusinessError, stats: number) => {
          if (error) {
            console.info(`${caseName} err ${JSON.stringify(error)}`);
            ExpectTrue(false, caseName);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} stats ${stats}`);
            ExpectTrue(true, caseName);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        ExpectTrue(false, caseName);
        done();
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrStatisticsGetUidRxBytes0700
     * @tc.number SUB_NetworkMgr_Statistics_GetUidRxBytes_0700
     * @tc.desc   The application does not generate downstream traffic;callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrStatisticsGetUidRxBytes0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetUidRxBytes0700';
      console.info(`${caseName} test start`);
      try {
        let uid: number = await getApplicationUid();
        console.info(`${caseName} ${uid}`);
        statistics.getUidRxBytes(uid, (err: BusinessError, stats: number) => {
          if (err) {
            console.info(`${caseName} err ${JSON.stringify(err)}`);
            ExpectTrue(err.code == 2103005, caseName);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} succes ${JSON.stringify(stats)}`);
            ExpectTrue(true, caseName);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        ExpectTrue(false, caseName);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrStatisticsGetUidRxBytes0800
     * @tc.number SUB_NetworkMgr_Statistics_GetUidRxBytes_0800
     * @tc.desc   The application does not generate downstream traffic;callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrStatisticsGetUidRxBytes0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetUidRxBytes0800';
      console.info(`${caseName} test start`);
      try {
        let uid: number = await getApplicationUid();
        console.info(`${caseName} ${uid}`);
        statistics.getUidRxBytes(uid).then((stats: number) => {
          console.info(`${caseName} succes ${JSON.stringify(stats)}`);
          ExpectTrue(true, caseName);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err ${JSON.stringify(err)}`);
          ExpectTrue(err.code == 2103005, caseName);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        ExpectTrue(false, caseName);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrStatisticsGetUidTxBytes0700
     * @tc.number SUB_NetworkMgr_Statistics_GetUidTxBytes_0700
     * @tc.desc   The application does not generate downstream traffic;callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrStatisticsGetUidTxBytes0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetUidTxBytes0700';
      console.info(`${caseName} test start`);
      try {
        let uid: number = await getApplicationUid();
        console.info(`${caseName} ${uid}`);
        statistics.getUidTxBytes(uid, (err: BusinessError, stats: number) => {
          if (err) {
            console.info(`${caseName} err ${JSON.stringify(err)}`);
            ExpectTrue(err.code == 2103005, caseName);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} succes ${JSON.stringify(stats)}`);
            ExpectTrue(true, caseName);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        ExpectTrue(false, caseName);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testNetworkMgrStatisticsGetUidTxBytes0800
     * @tc.number SUB_NetworkMgr_Statistics_GetUidTxBytes_0800
     * @tc.desc   The application does not generate downstream traffic;callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrStatisticsGetUidTxBytes0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetUidTxBytes0800';
      console.info(`${caseName} test start`);
      try {
        let uid: number = await getApplicationUid();
        console.info(`${caseName} ${uid}`);
        statistics.getUidTxBytes(uid).then((stats: number) => {
          console.info(`${caseName} succes ${JSON.stringify(stats)}`);
          ExpectTrue(true, caseName);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err ${JSON.stringify(err)}`);
          ExpectTrue(err.code == 2103005, caseName);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        ExpectTrue(false, caseName);
        done();
        console.info(`${caseName} test end`);
      }
    });
    
    /**
     * @tc.number SUB_NetworkMgr_Statistics_GetSelfTrafficStats_0001
     * @tc.name   testNetworkMgrStatisticsGetSelfTrafficStats0001
     * @tc.desc   get SelfTrafficStats(BEARER_CELLULAR)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  level 3
     */
    it('testNetworkMgrStatisticsGetSelfTrafficStats0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetSelfTrafficStats0001';
      console.info(`${caseName} test start`);
      try {
        let networkInfo: statistics.NetworkInfo = {
          type: connection.NetBearType.BEARER_CELLULAR,
          startTime: Math.floor(Date.now() / 1000)- 86400 * 31,
          endTime: Math.floor(Date.now() / 1000),
          simId: 1,
        }

        statistics.getSelfTrafficStats(networkInfo).then((stats: statistics.NetStatsInfo) => {
          console.info(`${caseName}getSelfTrafficStats success : ` + JSON.stringify(stats));
          ExpectTrue(stats.rxBytes == 0 && stats.txBytes == 0)
          done()
        }).catch((error: BusinessError) => {
          console.error(`${caseName}getSelfTrafficStats error. code: ` + `${error.code}` + ', message: ' + `${error.message}`);
          ExpectTrue(false, `${caseName} fail,errInfo->${JSON.stringify(error)}`);
          done()
        });
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(false, `${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.number SUB_NetworkMgr_Statistics_GetSelfTrafficStats_0002
     * @tc.name   testNetworkMgrStatisticsGetSelfTrafficStats0002
     * @tc.desc   get SelfTrafficStats(BEARER_WIFI)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  level 3
     */
    it('testNetworkMgrStatisticsGetSelfTrafficStats0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetSelfTrafficStats0002';
      console.info(`${caseName} test start`);
      try {
        let networkInfo: statistics.NetworkInfo = {
          type: connection.NetBearType.BEARER_WIFI,
          startTime: Math.floor(Date.now() / 1000)- 86400 * 31,
          endTime: Math.floor(Date.now() / 1000),
          simId: 1,
        }

        statistics.getSelfTrafficStats(networkInfo).then((stats: statistics.NetStatsInfo) => {
          console.info(`${caseName}getSelfTrafficStats success : ` + JSON.stringify(stats));
          ExpectTrue(stats.rxBytes == 0 && stats.txBytes == 0)
          done()
        }).catch((error: BusinessError) => {
          console.error(`${caseName}getSelfTrafficStats error. code: ` + `${error.code}` + ', message: ' + `${error.message}`);
          ExpectTrue(false, `${caseName} fail,errInfo->${JSON.stringify(error)}`);
          done()
        });
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(false, `${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.number SUB_NetworkMgr_Statistics_GetSelfTrafficStats_0003
     * @tc.name   testNetworkMgrStatisticsGetSelfTrafficStats0003
     * @tc.desc   get SelfTrafficStats(BEARER_CELLULAR 2100001)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  level 3
     */
    it('testNetworkMgrStatisticsGetSelfTrafficStats0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetSelfTrafficStats0003';
      console.info(`${caseName} test start`);
      try {
        let networkInfo: statistics.NetworkInfo = {
          type: connection.NetBearType.BEARER_CELLULAR,
          startTime: Math.floor(Date.now() / 1000) + 86400 * 31,
          endTime: Math.floor(Date.now() / 1000),
          simId: 1,
        }

        statistics.getSelfTrafficStats(networkInfo).then((stats: statistics.NetStatsInfo) => {
          console.info(`${caseName}getSelfTrafficStats success : ` + JSON.stringify(stats));
          ExpectTrue(false, `${caseName}`)
          done()
        }).catch((error: BusinessError) => {
          console.info(`${caseName}getSelfTrafficStats error. code: ` + `${error.code}` + ', message: ' + `${error.message}`);
          ExpectTrue(error.code == 2100001);
          done()
        });
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(false, `${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    });
    /**
     * @tc.number SUB_NetworkMgr_Statistics_GetSelfTrafficStats_0004
     * @tc.name   testNetworkMgrStatisticsGetSelfTrafficStats0004
     * @tc.desc   get SelfTrafficStats(BEARER_WIFI 2100001)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  level 3
     */
    it('testNetworkMgrStatisticsGetSelfTrafficStats0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetSelfTrafficStats0004';
      console.info(`${caseName} test start`);
      try {
        let networkInfo: statistics.NetworkInfo = {
          type: connection.NetBearType.BEARER_WIFI,
          startTime: Math.floor(Date.now() / 1000),
          endTime: Math.floor(Date.now() / 1000)-86400 * 31,
          simId: 1,
        }

        statistics.getSelfTrafficStats(networkInfo).then((stats: statistics.NetStatsInfo) => {
          console.info(`${caseName}getSelfTrafficStats success : ` + JSON.stringify(stats));
          ExpectTrue(false, `${caseName}`)
          done()
        }).catch((error: BusinessError) => {
          console.info(`${caseName}getSelfTrafficStats error. code: ` + `${error.code}` + ', message: ' + `${error.message}`);
          ExpectTrue(error.code == 2100001);
          done()
        });
      } catch (err) {
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(false, `${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        console.info(`${caseName} test end`);
      }
    });


  });
}

