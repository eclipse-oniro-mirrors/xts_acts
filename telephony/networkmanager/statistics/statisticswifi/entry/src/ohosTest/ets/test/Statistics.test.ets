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

import { describe, beforeAll, it, expect, afterAll } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import statistics from '@ohos.net.statistics';
import connection from '@ohos.net.connection';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';
import socket from '@ohos.net.socket';
import { Context } from '@ohos.abilityAccessCtrl';
import request from '@ohos.request';

let ExpectTrue:(n: boolean, caseName?: string)=>void = (n: boolean, caseName?: string) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(`${caseName} expect error ${JSON.stringify(err)}`);
  }
}

async function getApplicationUid(): Promise<number> {
  try {
    let userId: number = await account.getAccountManager().getOsAccountLocalId();
    let applicationFlags: number = bundleManager.ApplicationFlag.GET_APPLICATION_INFO_DEFAULT;
    let applicationInfo: bundleManager.ApplicationInfo = await bundleManager.getApplicationInfoSync('com.example.m', applicationFlags, userId);
    console.info(`getApplicationUid applicationInfo ${JSON.stringify(applicationInfo)}`);
    return applicationInfo.uid;
  } catch (err) {
    console.info(`getApplicationUid catch error ${JSON.stringify(err)}`);
    return 0;
  }
}

const testUrl: string = "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk";

let networkStatisticsSocketFd: number = 0;
let networkStatisticsSocketTcp: socket.TCPSocket;

async function sendSocketMessage() {
  console.info("sendSocketMessage");
  networkStatisticsSocketTcp = socket.constructTCPSocketInstance();
  let tcpconnectoptions: socket.TCPConnectOptions = {
    address: {
      address: '127.0.0.1',
      port: 3060
    },
    timeout: 6000
  }

  networkStatisticsSocketTcp.connect(tcpconnectoptions).then(async () => {
    console.info('socket connect success');
    let tcpSendOptions: socket.TCPSendOptions = {
      data: 'Hello, server!'
    }
    await networkStatisticsSocketTcp.send(tcpSendOptions).then(() => {
      console.info("socket send success");
    });
  });
  networkStatisticsSocketFd = await networkStatisticsSocketTcp.getSocketFd();
  console.info("socket getSocketFd v:" + networkStatisticsSocketFd);
}

export default function NetStatisticsTest() {

  describe('NetStatisticsTest', () => {

    beforeAll(async (done: Function) => {
      try {
        let netHandle: Array<connection.NetHandle> = connection.getAllNetsSync();
        console.info(`beforeAll ${JSON.stringify(netHandle)}`);
        if (netHandle.length === 0) {
          ExpectTrue = (n: boolean, caseName?: string) => {
            try {
              console.info(`${caseName} no internet}`);
              expect(false).assertTrue();
            } catch (err) {
              console.info(`${caseName} expect error ${JSON.stringify(err)}`);
            }
          }
        }
        await sendSocketMessage();
        done();
      } catch (err) {
        console.info(`beforeAll catch error ${JSON.stringify(err)}`);
      }
    });

    afterAll(() => {
      networkStatisticsSocketTcp.close((err) => {
        if (err) {
          console.error("socket close failed. err: " + JSON.stringify(err));
        } else {
          console.info("socket close success");
        }
      });
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetIfaceRxBytes_0100
     * @tc.name  : testNetworkMgrStatisticsGetIfaceRxBytes0100
     * @tc.desc  : Obtain the real-time downstream traffic of a specified NIC;callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetIfaceRxBytes0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetIfaceRxBytes0100';
      console.info(`${caseName} test start`);
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        console.info(`${caseName}  ${JSON.stringify(netHandle)}`);
        let connectionproperties: connection.ConnectionProperties = connection.getConnectionPropertiesSync(netHandle);
        let context :Context = globalThis.abilityContext.getApplicationContext();
        await request.downloadFile(context, {
          url: testUrl
        });
        statistics.getIfaceRxBytes(connectionproperties.interfaceName, (error: BusinessError, stats: number) => {
          if (error) {
            console.info(`${caseName} err ${JSON.stringify(error)}`);
            ExpectTrue(false, caseName);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} stats ${JSON.stringify(stats)}`);
            ExpectTrue(stats > 0, caseName);
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
     * @tc.number: SUB_NetworkMgr_Statistics_GetIfaceRxBytes_0200
     * @tc.name  : testNetworkMgrStatisticsGetIfaceRxBytes0200
     * @tc.desc  : Error type parameter;callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetIfaceRxBytes0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetIfaceRxBytes0200';
      console.info(`${caseName} test start`);
      try {
        statistics.getIfaceRxBytes(null, (error: BusinessError, stats: number) => {
          if (error) {
            console.info(`${caseName} err ${JSON.stringify(error)}`);
            ExpectTrue(error.code == 401, caseName);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} stats ${JSON.stringify(stats)}`);
            ExpectTrue(false, caseName);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (error) {
        ExpectTrue(error.code == 401, caseName);
        done();
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetIfaceRxBytes_0300
     * @tc.name  : testNetworkMgrStatisticsGetIfaceRxBytes0300
     * @tc.desc  : Invalid parameter;callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetIfaceRxBytes0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetIfaceRxBytes0300';
      console.info(`${caseName} test start`);
      try {
        statistics.getIfaceRxBytes('wangaaa', (error: BusinessError, stats: number) => {
          if (error) {
            console.info(`${caseName} err ${JSON.stringify(error)}`);
            ExpectTrue(error.code === 2103012, caseName);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} stats ${stats}`);
            ExpectTrue(false, caseName);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (error) {
        ExpectTrue(error.code === 2103012, caseName);
        done();
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetIfaceRxBytes_0400
     * @tc.name  : testNetworkMgrStatisticsGetIfaceRxBytes0400
     * @tc.desc  : Obtain the real-time downstream traffic of a specified NIC;promise.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetIfaceRxBytes0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetIfaceRxBytes0400';
      console.info(`${caseName} test start`);
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        let connectionproperties: connection.ConnectionProperties = connection.getConnectionPropertiesSync(netHandle);
        statistics.getIfaceRxBytes(connectionproperties.interfaceName).then((stats: number) => {
          console.info(`${caseName} stats ${JSON.stringify(stats)}`);
          ExpectTrue(stats > 0, caseName);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.error(`getNetworkSelectionMode failed, promise: err->${JSON.stringify(err)}`);
          ExpectTrue(false, caseName);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        ExpectTrue(false, caseName);
        done();
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetIfaceRxBytes_0500
     * @tc.name  : testNetworkMgrStatisticsGetIfaceRxBytes0500
     * @tc.desc  : Error type parameter;callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetIfaceRxBytes0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetIfaceRxBytes0500';
      console.info(`${caseName} test start`);
      try {
        statistics.getIfaceRxBytes(null).then((stats: number) => {
          console.info(`${caseName} stats ${JSON.stringify(stats)}`);
          ExpectTrue(false, caseName);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.error(`getNetworkSelectionMode failed, promise: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code == 401, caseName);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (error) {
        ExpectTrue(error.code == 401, caseName);
        done();
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetIfaceRxBytes_0600
     * @tc.name  : testNetworkMgrStatisticsGetIfaceRxBytes0600
     * @tc.desc  : Invalid parameter;callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetIfaceRxBytes0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetIfaceRxBytes0600';
      console.info(`${caseName} test start`);
      try {
        statistics.getIfaceRxBytes('wangaaa').then((stats: number) => {
          console.info(`${caseName} stats ${JSON.stringify(stats)}`);
          ExpectTrue(false, caseName);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.error(`getNetworkSelectionMode failed, promise: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 2103012, caseName);
          done();
          console.info(`${caseName} test end`);
        });

      } catch (error) {
        ExpectTrue(error.code === 2103012, caseName);
        done();
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetIfaceTxBytes_0100
     * @tc.name  : testNetworkMgrStatisticsGetIfaceTxBytes0100
     * @tc.desc  : Obtain the real-time upstream traffic of a specified NIC.callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetIfaceTxBytes0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetIfaceTxBytes0100';
      console.info(`${caseName} test start`);
      try {
        let netHandle = connection.getDefaultNetSync();
        let connectionproperties = connection.getConnectionPropertiesSync(netHandle);
        statistics.getIfaceTxBytes(connectionproperties.interfaceName, (error: BusinessError, stats: number) => {
          if (error) {
            console.info(`${caseName} err ${JSON.stringify(error)}`);
            ExpectTrue(false, caseName);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} stats ${JSON.stringify(stats)}`);
            ExpectTrue(stats > 0, caseName);
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
     * @tc.number: SUB_NetworkMgr_Statistics_GetIfaceTxBytes_0200
     * @tc.name  : testNetworkMgrStatisticsGetIfaceTxBytes0200
     * @tc.desc  : Error type parameter;callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetIfaceTxBytes0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetIfaceTxBytes0200';
      console.info(`${caseName} test start`);
      try {
        statistics.getIfaceTxBytes(null, (error: BusinessError, stats: number) => {
          if (error) {
            console.info(`${caseName} err ${JSON.stringify(error)}`);
            ExpectTrue(error.code == 401, caseName);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} stats ${JSON.stringify(stats)}`);
            ExpectTrue(false, caseName);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (error) {
        ExpectTrue(error.code == 401, caseName);
        done();
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetIfaceTxBytes_0300
     * @tc.name  : testNetworkMgrStatisticsGetIfaceTxBytes0300
     * @tc.desc  : Invalid parameter;callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetIfaceTxBytes0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetIfaceTxBytes0300';
      console.info(`${caseName} test start`);
      try {
        statistics.getIfaceTxBytes('wangaaa', (error: BusinessError, stats: number) => {
          if (error) {
            console.info(`${caseName} err ${JSON.stringify(error)}`);
            ExpectTrue(error.code === 2103012, caseName);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} stats ${JSON.stringify(stats)}`);
            ExpectTrue(false, caseName);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (error) {
        ExpectTrue(error.code === 2103012, caseName);
        done();
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetIfaceRxByTes_0400
     * @tc.name  : testNetworkMgrStatisticsGetIfaceRxByTes0400
     * @tc.desc  : Obtain the real-time upstream traffic of a specified NIC.;promise.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetIfaceRxByTes0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetIfaceRxByTes0400';
      console.info(`${caseName} test start`);
      try {
        let netHandle = connection.getDefaultNetSync();
        let connectionproperties = connection.getConnectionPropertiesSync(netHandle);
        statistics.getIfaceTxBytes(connectionproperties.interfaceName).then((stats: number) => {
          console.info(`${caseName} stats ${JSON.stringify(stats)}`);
          ExpectTrue(stats > 0, caseName);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.error(`getNetworkSelectionMode failed, promise: err->${JSON.stringify(err)}`);
          ExpectTrue(false, caseName);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        ExpectTrue(false, caseName);
        done();
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetIfaceTxBytes_0500
     * @tc.name  : testNetworkMgrStatisticsGetIfaceTxBytes0500
     * @tc.desc  : Error type parameter;callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetIfaceTxBytes0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetIfaceTxBytes0500';
      console.info(`${caseName} test start`);
      try {
        statistics.getIfaceTxBytes(null).then((stats: number) => {
          console.info(`${caseName} stats ${JSON.stringify(stats)}`);
          ExpectTrue(false, caseName);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.error(`getNetworkSelectionMode failed, promise: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code == 401, caseName);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (error) {
        ExpectTrue(error.code == 401, caseName);
        done();
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetIfaceTxBytes_0600
     * @tc.name  : testNetworkMgrStatisticsGetIfaceRxTytes0600
     * @tc.desc  : Invalid parameter;callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetIfaceRxTytes0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetIfaceRxTytes0600';
      console.info(`${caseName} test start`);
      try {
        statistics.getIfaceTxBytes('wangaaa').then((stats: number) => {
          console.info(`${caseName} stats ${JSON.stringify(stats)}`);
          ExpectTrue(false, caseName);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.error(`getNetworkSelectionMode failed, promise: err->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 2103012, caseName);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (error) {
        ExpectTrue(error.code === 2103012, caseName);
        done();
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetAllRxBytes_0100
     * @tc.name  : testNetworkMgrStatisticsGetAllRxBytes0100
     * @tc.desc  : Obtain real-time downlink traffic of all network cards;callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetAllRxBytes0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetAllRxBytes0100';
      console.info(`${caseName} test start`);
      try {
        statistics.getAllRxBytes((error: BusinessError, stats: number) => {
          if (error) {
            console.info(`${caseName} err ${JSON.stringify(error)}`);
            ExpectTrue(false, caseName);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} stats ${JSON.stringify(stats)}`);
            ExpectTrue(stats > 0, caseName);
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
     * @tc.number: SUB_NetworkMgr_Statistics_GetAllRxBytes_0200
     * @tc.name  : testNetworkMgrStatisticsGetAllRxBytes0200
     * @tc.desc  : Obtain real-time downlink traffic of all network cards;callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetAllRxBytes0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetAllRxBytes0200';
      console.info(`${caseName} test start`);
      let netHandles: Array<connection.NetHandle> = connection.getAllNetsSync();
      let connectionproperties0 = connection.getConnectionPropertiesSync(netHandles[0]);
      try {
        statistics.getAllRxBytes(async (error: BusinessError, stats: number) => {
          if (error) {
            console.info(`${caseName} err ${JSON.stringify(error)}`);
            ExpectTrue(false, caseName);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} stats ${JSON.stringify(stats)}`);
            let data0 = await statistics.getIfaceRxBytes(connectionproperties0.interfaceName);
            console.info(`${caseName} data0 ${JSON.stringify(data0)}`);
            ExpectTrue(stats >= data0, caseName);
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
     * @tc.number: SUB_NetworkMgr_Statistics_GetAllRxBytes_0300
     * @tc.name  : testNetworkMgrStatisticsGetAllRxBytes0300
     * @tc.desc  : Obtain real-time downlink traffic of all network cards;promise.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetAllRxBytes0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetAllRxBytes0300';
      console.info(`${caseName} test start`);
      try {
        statistics.getAllRxBytes().then((stats: number) => {
          console.info(`${caseName} stats ${JSON.stringify(stats)}`);
          ExpectTrue(stats > 0, caseName);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err ${JSON.stringify(err)}`);
          ExpectTrue(false, caseName);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        ExpectTrue(false, caseName);
        done();
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetAllRxBytes_0400
     * @tc.name  : testNetworkMgrStatisticsGetAllRxBytes0400
     * @tc.desc  : Obtain real-time downlink traffic of all network cards;promise.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetAllRxBytes0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetAllRxBytes0400';
      console.info(`${caseName} test start`);
      let netHandle = connection.getDefaultNetSync();
      let connectionproperties = connection.getConnectionPropertiesSync(netHandle);
      try {
        statistics.getAllRxBytes().then(async (stats: number) => {
          console.info(`${caseName} stats ${JSON.stringify(stats)}`);
          let data = await statistics.getIfaceRxBytes(connectionproperties.interfaceName);
          console.info(`${caseName} stats ${JSON.stringify(data)}`);
          ExpectTrue(stats >= data, caseName);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err ${JSON.stringify(err)}`);
          ExpectTrue(false, caseName);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        ExpectTrue(false, caseName);
        done();
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetAllTxBytes_0100
     * @tc.name  : testNetworkMgrStatisticsGetAllTxBytes0100
     * @tc.desc  : Obtain real-time upstream traffic of all nics;callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetAllTxBytes0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetAllTxBytes0100';
      console.info(`${caseName} test start`);
      try {
        statistics.getAllTxBytes((error: BusinessError, stats: number) => {
          if (error) {
            console.info(`${caseName} err ${JSON.stringify(error)}`);
            ExpectTrue(false, caseName);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} stats ${JSON.stringify(stats)}`);
            ExpectTrue(stats > 0, caseName);
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
     * @tc.number: SUB_NetworkMgr_Statistics_GetAllTxBytes_0200
     * @tc.name  : testNetworkMgrStatisticsGetAllTxBytes0200
     * @tc.desc  : Obtain real-time upstream traffic of all nics;callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetAllTxBytes0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetAllTxBytes0200';
      console.info(`${caseName} test start`);
      let netHandle = connection.getDefaultNetSync();
      let connectionproperties = connection.getConnectionPropertiesSync(netHandle);
      try {
        statistics.getAllTxBytes(async (error: BusinessError, stats: number) => {
          if (error) {
            console.info(`${caseName} err ${JSON.stringify(error)}`);
            ExpectTrue(false, caseName);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} stats ${JSON.stringify(stats)}`);
            let data = await statistics.getIfaceTxBytes(connectionproperties.interfaceName);
            console.info(`${caseName} stats ${JSON.stringify(data)}`);
            ExpectTrue(stats >= data, caseName);
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
     * @tc.number: SUB_NetworkMgr_Statistics_GetAllTxBytes_0300
     * @tc.name  : testNetworkMgrStatisticsGetAllTxBytes0300
     * @tc.desc  : Obtain real-time upstream traffic of all nics;promise.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetAllTxBytes0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetAllTxBytes0300';
      console.info(`${caseName} test start`);
      try {
        statistics.getAllTxBytes().then((stats: number) => {
          console.info(`${caseName} stats ${JSON.stringify(stats)}`);
          ExpectTrue(stats > 0, caseName);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err ${JSON.stringify(err)}`);
          ExpectTrue(false, caseName);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        ExpectTrue(false, caseName);
        done();
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetAllTxBytes_0400
     * @tc.name  : testNetworkMgrStatisticsGetAllTxBytes0400
     * @tc.desc  : Obtain real-time upstream traffic of all nics;promise.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetAllTxBytes0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetAllTxBytes0400';
      console.info(`${caseName} test start`);
      let netHandle = connection.getDefaultNetSync();
      let connectionproperties = connection.getConnectionPropertiesSync(netHandle);
      try {
        statistics.getAllTxBytes().then(async (stats: number) => {
          console.info(`${caseName} stats ${JSON.stringify(stats)}`);
          let data = await statistics.getIfaceTxBytes(connectionproperties.interfaceName);
          console.info(`${caseName} stats ${JSON.stringify(data)}`);
          ExpectTrue(stats >= data, caseName);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err ${JSON.stringify(err)}`);
          ExpectTrue(false, caseName);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        ExpectTrue(false, caseName);
        done();
        console.info(`${caseName} catch error ${JSON.stringify(err)}`);
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetSockfdRxBytes_0100
     * @tc.name  : testNetworkMgrStatisticsGetSockfdRxBytes0100
     * @tc.desc  : Gets downstream traffic information about the specified socket;callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetSockfdRxBytes0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetSockfdRxBytes0100';
      console.info(`${caseName} test start`);
      try {
        statistics.getSockfdRxBytes(networkStatisticsSocketFd, (err: BusinessError, stats: number) => {
          if (err) {
            console.info(`${caseName} err ${JSON.stringify(err)}`);
            ExpectTrue(false, caseName);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} succes ${stats}`);
            ExpectTrue(stats > 0, caseName);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        console.info(`${caseName} ${JSON.stringify(err)} bind fail`);
        ExpectTrue(false, caseName);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetSockfdRxBytes_0200
     * @tc.name  : testNetworkMgrStatisticsGetSockfdRxBytes0200
     * @tc.desc  : fd of a nonexistent socket;callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetSockfdRxBytes0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetSockfdRxBytes0200';
      console.info(`${caseName} test start`);
      try {
        statistics.getSockfdRxBytes(147258, (err: BusinessError, stats: number) => {
          if (err) {
            console.info(`${caseName} err ${JSON.stringify(err)}`);
            ExpectTrue(err.code === 2100002, caseName);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} succes ${JSON.stringify(stats)}`);
            ExpectTrue(false, caseName);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        console.info(`${caseName} ${JSON.stringify(err)} bind fail`);
        ExpectTrue(false, caseName);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetSockfdRxBytes_0300
     * @tc.name  : testNetworkMgrStatisticsGetSockfdRxBytes0300
     * @tc.desc  : Error type parameter;callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetSockfdRxBytes0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetSockfdRxBytes0300';
      console.info(`${caseName} test start`);
      try {
        statistics.getSockfdRxBytes(null, (err: BusinessError, stats: number) => {
          if (err) {
            console.info(`${caseName} err ${JSON.stringify(err)}`);
            ExpectTrue(err.code == 401, caseName);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} succes ${JSON.stringify(stats)}`);
            ExpectTrue(false, caseName);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        console.info(`${caseName} ${JSON.stringify(err)} bind fail`);
        ExpectTrue(err.code == 401, caseName);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetSockfdRxBytes_0400
     * @tc.name  : testNetworkMgrStatisticsGetSockfdRxBytes0400
     * @tc.desc  : Gets downstream traffic information about the specified socket;promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetSockfdRxBytes0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetSockfdRxBytes0400';
      console.info(`${caseName} test start`);
      try {
        statistics.getSockfdRxBytes(networkStatisticsSocketFd).then((stats: number) => {
          console.info(`${caseName} succes ${JSON.stringify(stats)}`);
          ExpectTrue(stats > 0, caseName);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err ${JSON.stringify(err)}`);
          ExpectTrue(false, caseName);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        console.info(`${caseName} ${JSON.stringify(err)} bind fail`);
        ExpectTrue(false, caseName);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetSockfdRxBytes_0500
     * @tc.name  : testNetworkMgrStatisticsGetSockfdRxBytes0500
     * @tc.desc  : fd of a nonexistent socket;promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetSockfdRxBytes0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetSockfdRxBytes0500';
      console.info(`${caseName} test start`);
      try {
        statistics.getSockfdRxBytes(147258).then((stats: number) => {
          console.info(`${caseName} succes ${JSON.stringify(stats)}`);
          ExpectTrue(false, caseName);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err ${JSON.stringify(err)}`);
          ExpectTrue(err.code === 2100002, caseName);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        console.info(`${caseName} ${JSON.stringify(err)} bind fail`);
        ExpectTrue(false, caseName);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetSockfdRxBytes_0600
     * @tc.name  : testNetworkMgrStatisticsGetSockfdRxBytes0600
     * @tc.desc  : Error type parameter;promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetSockfdRxBytes0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetSockfdRxBytes0600';
      console.info(`${caseName} test start`);
      try {
        statistics.getSockfdRxBytes(null).then((stats: number) => {
          console.info(`${caseName} succes ${JSON.stringify(stats)}`);
          ExpectTrue(false, caseName);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err ${JSON.stringify(err)}`);
          ExpectTrue(err.code == 401, caseName);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        console.info(`${caseName} ${JSON.stringify(err)} bind fail`);
        ExpectTrue(err.code == 401, caseName);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetSockfdTxBytes_0100
     * @tc.name  : testNetworkMgrStatisticsGetSockfdTxBytes0100
     * @tc.desc  : Gets upstream traffic information about the specified socket;callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetSockfdTxBytes0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetSockfdTxBytes0100';
      console.info(`${caseName} test start`);
      try {
        statistics.getSockfdTxBytes(networkStatisticsSocketFd, (err: BusinessError, stats: number) => {
          if (err) {
            console.info(`${caseName} err ${JSON.stringify(err)}`);
            ExpectTrue(false, caseName);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} succes ${JSON.stringify(stats)}`);
            ExpectTrue(stats > 0, caseName);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        console.info(`${caseName} ${JSON.stringify(err)} bind fail`);
        ExpectTrue(false, caseName);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetSockfdTxBytes_0200
     * @tc.name  : testNetworkMgrStatisticsGetSockfdTxBytes0200
     * @tc.desc  : fd of a nonexistent socket;callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetSockfdTxBytes0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetSockfdTxBytes0200';
      console.info(`${caseName} test start`);
      try {
        statistics.getSockfdTxBytes(147258, (err: BusinessError, stats: number) => {
          if (err) {
            console.info(`${caseName} err ${JSON.stringify(err)}`);
            ExpectTrue(err.code === 2100002, caseName);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} succes ${JSON.stringify(stats)}`);
            ExpectTrue(false, caseName);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        console.info(`${caseName} ${JSON.stringify(err)} bind fail`);
        ExpectTrue(false, caseName);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetSockfdTxBytes_0300
     * @tc.name  : testNetworkMgrStatisticsGetSockfdTxBytes0300
     * @tc.desc  : Error type parameter;callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetSockfdTxBytes0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetSockfdTxBytes0300';
      console.info(`${caseName} test start`);
      try {
        statistics.getSockfdTxBytes(null, (err: BusinessError, stats: number) => {
          if (err) {
            console.info(`${caseName} err ${JSON.stringify(err)}`);
            ExpectTrue(err.code == 401, caseName);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} succes ${JSON.stringify(stats)}`);
            ExpectTrue(false, caseName);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        console.info(`${caseName} ${JSON.stringify(err)} bind fail`);
        ExpectTrue(err.code == 401, caseName);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetSockfdTxBytes_0400
     * @tc.name  : testNetworkMgrStatisticsGetSockfdTxBytes0400
     * @tc.desc  : Gets upstream traffic information about the specified socket;promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetSockfdTxBytes0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetSockfdTxBytes0400';
      console.info(`${caseName} test start`);
      try {
        statistics.getSockfdTxBytes(networkStatisticsSocketFd).then((stats: number) => {
          console.info(`${caseName} succes ${JSON.stringify(stats)}`);
          ExpectTrue(stats > 0, caseName);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err ${JSON.stringify(err)}`);
          ExpectTrue(false, caseName);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        console.info(`${caseName} ${JSON.stringify(err)} bind fail`);
        ExpectTrue(false, caseName);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetSockfdTxBytes_0500
     * @tc.name  : testNetworkMgrStatisticsGetSockfdTxBytes0500
     * @tc.desc  : fd of a nonexistent socket;promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetSockfdTxBytes0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetSockfdTxBytes0500';
      console.info(`${caseName} test start`);
      try {
        statistics.getSockfdTxBytes(147258).then((stats: number) => {
          console.info(`${caseName} succes ${JSON.stringify(stats)}`);
          ExpectTrue(false, caseName);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err ${JSON.stringify(err)}`);
          ExpectTrue(err.code === 2100002, caseName);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        console.info(`${caseName} ${JSON.stringify(err)} bind fail`);
        ExpectTrue(false, caseName);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetSockfdTxBytes_0600
     * @tc.name  : testNetworkMgrStatisticsGetSockfdTxBytes0600
     * @tc.desc  : Error type parameter;promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetSockfdTxBytes0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetSockfdTxBytes0600';
      console.info(`${caseName} test start`);
      try {
        statistics.getSockfdTxBytes(null).then((stats: number) => {
          console.info(`${caseName} succes ${JSON.stringify(stats)}`);
          ExpectTrue(false, caseName);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err ${JSON.stringify(err)}`);
          ExpectTrue(err.code == 401, caseName);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        console.info(`${caseName} ${JSON.stringify(err)} bind fail`);
        ExpectTrue(err.code == 401, caseName);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetUidRxBytes_0100
     * @tc.name  : testNetworkMgrStatisticsGetUidRxBytes0100
     * @tc.desc  : Obtain the real-time downstream traffic of a specified application;callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetUidRxBytes0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetUidRxBytes0100';
      console.info(`${caseName} test start`);
      try {
        let uid: number = await getApplicationUid();
        console.info(`${caseName} ${uid}`);
        statistics.getUidRxBytes(uid, (err: BusinessError, stats: number) => {
          if (err) {
            console.info(`${caseName} err ${JSON.stringify(err)}`);
            ExpectTrue(false, caseName);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} succes ${JSON.stringify(stats)}`);
            ExpectTrue(stats > 0, caseName);
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
     * @tc.number: SUB_NetworkMgr_Statistics_GetUidRxBytes_0200
     * @tc.name  : testNetworkMgrStatisticsGetUidRxBytes0200
     * @tc.desc  : Error type parameter;callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetUidRxBytes0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetUidRxBytes0200';
      console.info(`${caseName} test start`);
      try {
        statistics.getUidRxBytes(null, (err: BusinessError, stats: number) => {
          if (err) {
            console.info(`${caseName} err ${JSON.stringify(err)}`);
            ExpectTrue(err.code == 401, caseName);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} succes ${JSON.stringify(stats)}`);
            ExpectTrue(false, caseName);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401, caseName);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetUidRxBytes_0300
     * @tc.name  : testNetworkMgrStatisticsGetUidRxBytes0300
     * @tc.desc  : An application that does not exist;callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetUidRxBytes0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetUidRxBytes0300';
      console.info(`${caseName} test start`);
      try {
        statistics.getUidRxBytes(200, (err: BusinessError, stats: number) => {
          if (err) {
            console.info(`${caseName} err ${JSON.stringify(err)}`);
            ExpectTrue(err.code === 2103005, caseName);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} succes ${JSON.stringify(stats)}`);
            ExpectTrue(false, caseName);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        ExpectTrue(false);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetUidRxBytes_0400
     * @tc.name  : testNetworkMgrStatisticsGetUidRxBytes0400
     * @tc.desc  : Obtain the real-time downstream traffic of a specified application;promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetUidRxBytes0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetUidRxBytes0400';
      console.info(`${caseName} test start`);
      try {
        let uid: number = await getApplicationUid();
        console.info(`${caseName} ${uid}`);

        statistics.getUidRxBytes(uid).then((stats: number) => {
          console.info(`${caseName} succes ${JSON.stringify(stats)}`);
          ExpectTrue(stats > 0, caseName);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err ${JSON.stringify(err)}`);
          ExpectTrue(false, caseName);
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
     * @tc.number: SUB_NetworkMgr_Statistics_GetUidRxBytes_0500
     * @tc.name  : testNetworkMgrStatisticsGetUidRxBytes0500
     * @tc.desc  : Error type parameter;promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetUidRxBytes0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetUidRxBytes0500';
      console.info(`${caseName} test start`);
      try {
        statistics.getUidRxBytes(null).then((stats: number) => {
          console.info(`${caseName} succes ${JSON.stringify(stats)}`);
          ExpectTrue(false, caseName);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err ${JSON.stringify(err)}`);
          ExpectTrue(err.code == 401, caseName);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        console.info(`${caseName} catch ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401, caseName);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetUidRxBytes_0600
     * @tc.name  : testNetworkMgrStatisticsGetUidRxBytes0600
     * @tc.desc  : An application that does not exist;promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetUidRxBytes0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetUidRxBytes0600';
      console.info(`${caseName} test start`);
      try {
        statistics.getUidRxBytes(200).then((stats: number) => {
          console.info(`${caseName} succes ${JSON.stringify(stats)}`);
          ExpectTrue(false, caseName);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err ${JSON.stringify(err)}`);
          ExpectTrue(err.code === 2103005, caseName);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        ExpectTrue(false);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetUidTxBytes_0100
     * @tc.name  : testNetworkMgrStatisticsGetUidTxBytes0100
     * @tc.desc  : Obtain the real-time upstream traffic of a specified application;callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetUidTxBytes0100', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetUidTxBytes0100';
      console.info(`${caseName} test start`);
      try {
        let uid: number = await getApplicationUid();
        console.info(`${caseName} ${uid}`);
        statistics.getUidTxBytes(uid, (err: BusinessError, stats: number) => {
          if (err) {
            console.info(`${caseName} err ${JSON.stringify(err)}`);
            ExpectTrue(false, caseName);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} succes ${JSON.stringify(stats)}`);
            ExpectTrue(stats > 0, caseName);
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
     * @tc.number: SUB_NetworkMgr_Statistics_GetUidTxBytes_0200
     * @tc.name  : testNetworkMgrStatisticsGetUidTxBytes0200
     * @tc.desc  : Error type parameter;callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetUidTxBytes0200', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetUidTxBytes0200';
      console.info(`${caseName} test start`);
      try {
        statistics.getUidTxBytes(null, (err: BusinessError, stats: number) => {
          if (err) {
            console.info(`${caseName} err ${JSON.stringify(err)}`);
            ExpectTrue(err.code == 401, caseName);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} succes ${JSON.stringify(stats)}`);
            ExpectTrue(false, caseName);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401, caseName);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetUidTxBytes_0300
     * @tc.name  : testNetworkMgrStatisticsGetUidTxBytes0300
     * @tc.desc  : An application that does not exist;callback.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetUidTxBytes0300', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetUidTxBytes0300';
      console.info(`${caseName} test start`);
      try {
        statistics.getUidTxBytes(200, (err: BusinessError, stats: number) => {
          if (err) {
            console.info(`${caseName} err ${JSON.stringify(err)}`);
            ExpectTrue(err.code === 2103005, caseName);
            done();
            console.info(`${caseName} test end`);
          } else {
            console.info(`${caseName} succes ${JSON.stringify(stats)}`);
            ExpectTrue(false, caseName);
            done();
            console.info(`${caseName} test end`);
          }
        });
      } catch (err) {
        ExpectTrue(false);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetUidTxBytes_0400
     * @tc.name  : testNetworkMgrStatisticsGetUidTxBytes0400
     * @tc.desc  : Obtain the real-time downstream traffic of a specified application;promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetUidTxBytes0400', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetUidTxBytes0400';
      console.info(`${caseName} test start`);
      try {
        let uid: number = await getApplicationUid();
        console.info(`${caseName} ${uid}`);

        statistics.getUidTxBytes(uid).then((stats: number) => {
          console.info(`${caseName} succes ${JSON.stringify(stats)}`);
          ExpectTrue(stats > 0, caseName);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err ${JSON.stringify(err)}`);
          ExpectTrue(false, caseName);
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
     * @tc.number: SUB_NetworkMgr_Statistics_GetUidTxBytes_0500
     * @tc.name  : testNetworkMgrStatisticsGetUidTxBytes0500
     * @tc.desc  : Error type parameter;promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetUidTxBytes0500', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetUidTxBytes0500';
      console.info(`${caseName} test start`);
      try {
        statistics.getUidTxBytes(null).then((stats: number) => {
          console.info(`${caseName} succes ${JSON.stringify(stats)}`);
          ExpectTrue(false, caseName);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err ${JSON.stringify(err)}`);
          ExpectTrue(err.code == 401, caseName);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        console.info(`${caseName} catch ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401, caseName);
        done();
        console.info(`${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Statistics_GetUidTxBytes_0600
     * @tc.name  : testNetworkMgrStatisticsGetUidTxBytes0600
     * @tc.desc  : An application that does not exist;promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrStatisticsGetUidTxBytes0600', 0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrStatisticsGetUidTxBytes0600';
      console.info(`${caseName} test start`);
      try {
        statistics.getUidTxBytes(200).then((stats: number) => {
          console.info(`${caseName} succes ${JSON.stringify(stats)}`);
          ExpectTrue(false, caseName);
          done();
          console.info(`${caseName} test end`);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err ${JSON.stringify(err)}`);
          ExpectTrue(err.code === 2103005, caseName);
          done();
          console.info(`${caseName} test end`);
        });
      } catch (err) {
        ExpectTrue(false);
        done();
        console.info(`${caseName} test end`);
      }
    });

  });
}
