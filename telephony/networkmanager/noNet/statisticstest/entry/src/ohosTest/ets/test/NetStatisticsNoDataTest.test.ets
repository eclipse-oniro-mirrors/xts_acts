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

import { describe, beforeAll,it, expect } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import statistics from '@ohos.net.statistics';
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

    /*
     * @tc.number: SUB_NetworkMgr_Statistics_GetCellularRxBytes_0500
     * @tc.name  : testNetworkMgrStatisticsGetCellularRxBytes0500
     * @tc.desc  : Get cellular real-time downlink traffic without card;callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetCellularRxBytes0500', 0, async (done: Function) => {
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

    /*
     * @tc.number: SUB_NetworkMgr_Statistics_GetCellularRxBytes_0600
     * @tc.name  : testNetworkMgrStatisticsGetCellularRxBytes0600
     * @tc.desc  : Get cellular real-time downlink traffic without card;promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetCellularRxBytes0600', 0, async (done: Function) => {
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

    /*
     * @tc.number: SUB_NetworkMgr_Statistics_GetCellularTxBytes_0500
     * @tc.name  : testNetworkMgrStatisticsGetCellularTxBytes0500
     * @tc.desc  : Get cellular real-time downlink traffic without card;callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetCellularTxBytes0500', 0, async (done: Function) => {
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

    /*
     * @tc.number: SUB_NetworkMgr_Statistics_GetCellularTxBytes_0600
     * @tc.name  : testNetworkMgrStatisticsGetCellularTxBytes0600
     * @tc.desc  : Get cellular real-time downlink traffic without card;promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetCellularTxBytes0600', 0, async (done: Function) => {
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

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetAllRxBytes_0500
     * @tc.name  : testNetworkMgrStatisticsGetAllRxBytes0500
     * @tc.desc  : Obtain real-time downlink traffic of all network adapters without Ethernet access;callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetAllRxBytes0500', 0, async (done: Function) => {
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

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetAllRxBytes_0600
     * @tc.name  : testNetworkMgrStatisticsGetAllRxBytes0600
     * @tc.desc  : Obtain real-time downlink traffic of all network adapters without Ethernet access;promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetAllRxBytes0600', 0, async (done: Function) => {
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

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetAllTxBytes_0500
     * @tc.name  : testNetworkMgrStatisticsGetAllTxBytes0500
     * @tc.desc  : Obtain real-time upstream traffic of all nics without Ethernet access;callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetAllTxBytes0500', 0, async (done: Function) => {
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

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetAllTxBytes_0600
     * @tc.name  : testNetworkMgrStatisticsGetAllTxBytes0600
     * @tc.desc  : Obtain real-time upstream traffic of all nics without Ethernet access;promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetAllTxBytes0600', 0, async (done: Function) => {
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

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetUidRxBytes_0700
     * @tc.name  : testNetworkMgrStatisticsGetUidRxBytes0700
     * @tc.desc  : The application does not generate downstream traffic;callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetUidRxBytes0700', 0, async (done: Function) => {
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

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetUidRxBytes_0800
     * @tc.name  : testNetworkMgrStatisticsGetUidRxBytes0800
     * @tc.desc  : The application does not generate downstream traffic;callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetUidRxBytes0800', 0, async (done: Function) => {
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

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetUidTxBytes_0700
     * @tc.name  : testNetworkMgrStatisticsGetUidTxBytes0700
     * @tc.desc  : The application does not generate downstream traffic;callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetUidTxBytes0700', 0, async (done: Function) => {
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

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetUidTxBytes_0800
     * @tc.name  : testNetworkMgrStatisticsGetUidTxBytes0800
     * @tc.desc  : The application does not generate downstream traffic;callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetUidTxBytes0800', 0, async (done: Function) => {
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




  });
}

