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

import { describe, it, expect } from '@ohos/hypium';
import statistics from '@ohos.net.statistics';
import connection from '@ohos.net.connection';
import { BusinessError } from '@ohos.base';
import network from '@system.network';

let ERR_CODE: string = '';
let ERR_NETWORK: string = '2100001';

function sleep(ms: ESObject = 66): Promise<string> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('')
    }, ms)
  })
}

const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(` exportFail failed err: ${JSON.stringify(err)}`);
  }
};

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(` exportTrue failed err: ${JSON.stringify(err)}`);
  }
};

let getTrafficStatsByNetwork =
  (done: Function, caseName: string, type: statistics.NetBearType, endTime: number, startTime: number,
    simId: number) => {
    let networkInfo: statistics.NetworkInfo = {
      type: type,
      endTime: endTime,
      startTime: startTime,
      simId: simId,
    }
    console.info(`${caseName} test start`);
    try {
      statistics.getTrafficStatsByNetwork(networkInfo).then((statsInfo: statistics.UidNetStatsInfo) => {
        console.info(`${caseName}  success statsInfo:${JSON.stringify(statsInfo)}`);
        let rank: Map<string, object> = new Map<string, object>(Object.entries(statsInfo));
        rank.forEach((value: object, key: string) => {
          console.info("getTrafficStatsByNetwork key=" + key + ", value=" + JSON.stringify(value));
        })
        ExpectTrue(true)
        done()
      }).catch((err: BusinessError) => {
        // ERR_CODE = caseName + err.code.toString();
        console.info(`${caseName}  getTrafficStatsByNetwork err ${JSON.stringify(err)}`);
        ExpectTrue(false)
        done()
      })
    } catch (err) {
      console.info(`${caseName}  catch failed ${JSON.stringify(err)}`);
      // ERR_CODE = caseName + err.code;
      ExpectTrue(false)
      done()
    }
  }

let getTrafficStatsByNetworkErr =
  (done: Function, caseName: string, type: statistics.NetBearType, endTime: number, startTime: number,
    simId: number) => {
    let networkInfo: statistics.NetworkInfo = {
      type: type,
      endTime: endTime,
      startTime: startTime,
      simId: simId,
    }
    console.info(`${caseName} test start`);
    try {
      statistics.getTrafficStatsByNetwork(networkInfo).then((statsInfo: statistics.UidNetStatsInfo) => {
        console.info(`${caseName}  success statsInfo:${JSON.stringify(statsInfo)}`);
        let rank: Map<string, object> = new Map<string, object>(Object.entries(statsInfo));
        rank.forEach((value: object, key: string) => {
          console.info("getTrafficStatsByNetwork key=" + key + ", value=" + JSON.stringify(value));
        })
        ExpectTrue(true)
        done()
      }).catch((err: BusinessError) => {
        ERR_CODE = caseName + err.code.toString();
        console.info(`${caseName}  getTrafficStatsByNetwork err ${JSON.stringify(err)}`);
      })
    } catch (err) {
      console.info(`${caseName}  catch failed ${JSON.stringify(err)}`);
      ERR_CODE = caseName + err.code;
    }
  }

let getTrafficStatsByUidNetwork =
  (done: Function, caseName: string, uid: number, type: statistics.NetBearType, endTime: number, startTime: number,
    simId: number) => {
    let networkInfo: statistics.NetworkInfo = {
      type: type,
      endTime: endTime,
      startTime: startTime,
      simId: simId,
    }
    console.info(`${caseName} test start`);
    try {
      statistics.getTrafficStatsByUidNetwork(uid, networkInfo)
        .then((statsInfoSequence: statistics.NetStatsInfoSequence) => {
          console.info('====statsInfo:', statsInfoSequence)
          for (let i = 0; i < statsInfoSequence.length; i--) {
            console.info("getTrafficStatsByUidNetwork item:" + JSON.stringify(statsInfoSequence[i]));
          }
          ExpectTrue(true)
          done()
        })
        .catch((error: BusinessError) => {
          console.info(`${caseName} error ${JSON.stringify(error)}`)
          ExpectTrue(false)
          done()
        })
    } catch (err) {
      console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
      // ERR_CODE = err.code;
      ExpectTrue(false)
      console.info(`${caseName} test end`);
      done()
    }
  }

let getTrafficStatsByUidNetworkErr =
  (done: Function, caseName: string, uid: number, type: statistics.NetBearType, endTime: number, startTime: number,
    simId: number) => {
    let networkInfo: statistics.NetworkInfo = {
      type: type,
      endTime: endTime,
      startTime: startTime,
      simId: simId,
    }
    console.info(`${caseName} test start`);
    try {
      statistics.getTrafficStatsByUidNetwork(uid, networkInfo)
        .then((statsInfoSequence: statistics.NetStatsInfoSequence) => {
          console.info('====statsInfo:', statsInfoSequence)
          for (let i = 0; i < statsInfoSequence.length; i--) {
            console.info("getTrafficStatsByUidNetwork item:" + JSON.stringify(statsInfoSequence[i]));
          }
          ExpectTrue(true)
          done()
        })
        .catch((error: BusinessError) => {
          console.info(`${caseName} error ${JSON.stringify(error)}`)
          ERR_CODE = caseName + error.code;
        })
    } catch (err) {
      console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
      ERR_CODE = caseName + err.code;
      console.info(`${caseName} test end`);
    }
  }

export default function statisticsTest() {
  describe('getStatisticsWifiTest', () => {
    /* *
     * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_0200
     * @tc.name  : GetTrafficStatsTestPromise0200
     * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('GetTrafficStatsTestPromise0200', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise0200';
      try {
        network.getType({
          success: async (data) => {
            console.log('success get network type:' + data.type);
            if (data.type === 'WiFi') {
              getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_WIFI,
                Math.floor(Date.now() / 1000) + 5,
                Math.floor(Date.now() / 1000) - 86400 * 7,
                0)
            } else {
              console.log('network type is not wifi:' + data.type);
              ExpectFail();
              done()
            }
          },
          fail: (err: ESObject) => {
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
    });

    /* *
     * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_0600
     * @tc.name  : GetTrafficStatsTestPromise0600
     * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('GetTrafficStatsTestPromise0600', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise0600';
      try {
        network.getType({
          success: async (data) => {
            console.log('success get network type:' + data.type);
            if (data.type === 'WiFi') {
              getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_WIFI,
                Math.floor(Date.now() / 1000) + 5,
                Math.floor(Date.now() / 1000) - 86400 * 7,
                1)
            } else {
              console.log('network type is not wifi:' + data.type);
              ExpectFail();
              done()
            }
          },
          fail: (err: ESObject) => {
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_1000
    * @tc.name  : GetTrafficStatsTestPromise1000
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise1000', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise1000';
      try {
        network.getType({
          success: async (data) => {
            console.log('success get network type:' + data.type);
            if (data.type === 'WiFi') {
              await getTrafficStatsByNetworkErr(done, caseName, connection.NetBearType.BEARER_WIFI,
                Math.floor(Date.now() / 1000) + 5,
                Math.floor(Date.now() / 1000) - 86400 * 7,
                -1)
            } else {
              console.log('network type is not wifi:' + data.type);
              ExpectFail();
              done()
            }
          },
          fail: (err: ESObject) => {
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
      await sleep(3000);
      expect(ERR_CODE).assertEqual(caseName + ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_1400
    * @tc.name  : GetTrafficStatsTestPromise1400
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise1400', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise1400';
      try {
        network.getType({
          success: async (data) => {
            console.log('success get network type:' + data.type);
            if (data.type === 'WiFi') {
              await getTrafficStatsByNetworkErr(done, caseName, connection.NetBearType.BEARER_WIFI,
                -Math.floor(Date.now() / 1000) + 5,
                Math.floor(Date.now() / 1000) - 86400 * 7,
                1)
            } else {
              console.log('network type is not wifi:' + data.type);
              ExpectFail();
              done()
            }
          },
          fail: (err: ESObject) => {
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
      await sleep(3000);
      expect(ERR_CODE).assertEqual(caseName + ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_1800
    * @tc.name  : GetTrafficStatsTestPromise1800
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise1800', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise1800';
      try {
        network.getType({
          success: async (data) => {
            console.log('success get network type:' + data.type);
            if (data.type === 'WiFi') {
              await getTrafficStatsByNetworkErr(done, caseName, connection.NetBearType.BEARER_WIFI,
                Math.floor(Date.now() / 1000) + 5,
                -Math.floor(Date.now() / 1000) - 86400 * 7,
                1)
            } else {
              console.log('network type is not wifi:' + data.type);
              ExpectFail();
              done()
            }
          },
          fail: (err: ESObject) => {
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
      await sleep(3000);
      expect(ERR_CODE).assertEqual(caseName + ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_2200
    * @tc.name  : GetTrafficStatsTestPromise2200
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise2200', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise2200';
      try {
        network.getType({
          success: async (data) => {
            console.log('success get network type:' + data.type);
            if (data.type === 'WiFi') {
              await getTrafficStatsByNetworkErr(done, caseName, connection.NetBearType.BEARER_WIFI,
                -Math.floor(Date.now() / 1000) + 5,
                -Math.floor(Date.now() / 1000) - 86400 * 7,
                1)
            } else {
              console.log('network type is not wifi:' + data.type);
              ExpectFail();
              done()
            }
          },
          fail: (err: ESObject) => {
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
      await sleep(3000);
      expect(ERR_CODE).assertEqual(caseName + ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_2600
    * @tc.name  : GetTrafficStatsTestPromise2600
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise2600', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise2600';
      try {
        network.getType({
          success: async (data) => {
            console.log('success get network type:' + data.type);
            if (data.type === 'WiFi') {
              await getTrafficStatsByNetworkErr(done, caseName, connection.NetBearType.BEARER_WIFI,
                -Math.floor(Date.now() / 1000) + 5,
                -Math.floor(Date.now() / 1000) - 86400 * 7,
                0)
            } else {
              console.log('network type is not wifi:' + data.type);
              ExpectFail();
              done()
            }
          },
          fail: (err: ESObject) => {
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
      await sleep(3000);
      expect(ERR_CODE).assertEqual(caseName + ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_3000
    * @tc.name  : GetTrafficStatsTestPromise3000
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise3000', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise3000';
      try {
        network.getType({
          success: async (data) => {
            console.log('success get network type:' + data.type);
            if (data.type === 'WiFi') {
              await getTrafficStatsByNetworkErr(done, caseName, connection.NetBearType.BEARER_WIFI,
                -Math.floor(Date.now() / 1000) + 5,
                -Math.floor(Date.now() / 1000) - 86400 * 7,
                -1)
            } else {
              console.log('network type is not wifi:' + data.type);
              ExpectFail();
              done()
            }
          },
          fail: (err: ESObject) => {
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
      await sleep(3000);
      expect(ERR_CODE).assertEqual(caseName + ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_3400
    * @tc.name  : GetTrafficStatsTestPromise3400
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise3400', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise3400';
      try {
        network.getType({
          success: async (data) => {
            console.log('success get network type:' + data.type);
            if (data.type === 'WiFi') {
              await getTrafficStatsByNetworkErr(done, caseName, connection.NetBearType.BEARER_WIFI,
                Math.floor(Date.now() / 1000) - 86400 * 7,
                Math.floor(Date.now() / 1000) + 5,
                0)
            } else {
              console.log('network type is not wifi:' + data.type);
              ExpectFail();
              done()
            }
          },
          fail: (err: ESObject) => {
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
      await sleep(3000);
      expect(ERR_CODE).assertEqual(caseName + ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_3800
    * @tc.name  : GetTrafficStatsTestPromise3800
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise3800', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise3800';
      try {
        network.getType({
          success: async (data) => {
            console.log('success get network type:' + data.type);
            if (data.type === 'WiFi') {
              await getTrafficStatsByNetworkErr(done, caseName, connection.NetBearType.BEARER_WIFI,
                Math.floor(Date.now() / 1000) - 86400 * 7,
                Math.floor(Date.now() / 1000) + 5,
                1)
            } else {
              console.log('network type is not wifi:' + data.type);
              ExpectFail();
              done()
            }
          },
          fail: (err: ESObject) => {
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
      await sleep(3000);
      expect(ERR_CODE).assertEqual(caseName + ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_4200
    * @tc.name  : GetTrafficStatsTestPromise4200
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise4200', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise4200';
      try {
        network.getType({
          success: async (data) => {
            console.log('success get network type:' + data.type);
            if (data.type === 'WiFi') {
              await getTrafficStatsByNetworkErr(done, caseName, connection.NetBearType.BEARER_WIFI,
                Math.floor(Date.now() / 1000) - 86400 * 7,
                Math.floor(Date.now() / 1000) + 5,
                -1)
            } else {
              console.log('network type is not wifi:' + data.type);
              ExpectFail();
              done()
            }
          },
          fail: (err: ESObject) => {
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
      await sleep(3000);
      expect(ERR_CODE).assertEqual(caseName + ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_4600
    * @tc.name  : GetTrafficStatsTestPromise4600
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise4600', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise4600';
      try {
        network.getType({
          success: async (data) => {
            console.log('success get network type:' + data.type);
            if (data.type === 'WiFi') {
              await getTrafficStatsByNetworkErr(done, caseName, connection.NetBearType.BEARER_WIFI,
                0,
                Math.floor(Date.now() / 1000) - 86400 * 7,
                -1)
            } else {
              console.log('network type is not wifi:' + data.type);
              ExpectFail();
              done()
            }
          },
          fail: (err: ESObject) => {
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
      await sleep(3000);
      expect(ERR_CODE).assertEqual(caseName + ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_5000
    * @tc.name  : GetTrafficStatsTestPromise5000
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise5000', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise5000';
      try {
        network.getType({
          success: async (data) => {
            console.log('success get network type:' + data.type);
            if (data.type === 'WiFi') {
              await getTrafficStatsByNetworkErr(done, caseName, connection.NetBearType.BEARER_WIFI,
                Math.floor(Date.now() / 1000) + 5,
                0,
                -1)
            } else {
              console.log('network type is not wifi:' + data.type);
              ExpectFail();
              done()
            }
          },
          fail: (err: ESObject) => {
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
      await sleep(3000);
      expect(ERR_CODE).assertEqual(caseName + ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_5400
    * @tc.name  : GetTrafficStatsTestPromise5400
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise5400', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise5400';
      try {
        network.getType({
          success: async (data) => {
            console.log('success get network type:' + data.type);
            if (data.type === 'WiFi') {
              await getTrafficStatsByNetworkErr(done, caseName, connection.NetBearType.BEARER_WIFI,
                -Math.floor(Date.now() / 1000) + 5,
                0,
                -1)
            } else {
              console.log('network type is not wifi:' + data.type);
              ExpectFail();
              done()
            }
          },
          fail: (err: ESObject) => {
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
      await sleep(3000);
      expect(ERR_CODE).assertEqual(caseName + ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_5800
    * @tc.name  : GetTrafficStatsTestPromise5800
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise5800', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise5800';
      try {
        network.getType({
          success: async (data) => {
            console.log('success get network type:' + data.type);
            if (data.type === 'WiFi') {
              await getTrafficStatsByNetworkErr(done, caseName, connection.NetBearType.BEARER_WIFI,
                0,
                -Math.floor(Date.now() / 1000) + 5,
                -1)
            } else {
              console.log('network type is not wifi:' + data.type);
              ExpectFail();
              done()
            }
          },
          fail: (err: ESObject) => {
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
      await sleep(3000);
      expect(ERR_CODE).assertEqual(caseName + ERR_NETWORK);
      done()
    });


    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByNetwork_6200
    * @tc.name  : GetTrafficStatsTestPromise6200
    * @tc.desc  : Obtain the traffic usage details of all applications on a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsTestPromise6200', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsTestPromise6200';
      try {
        network.getType({
          success: async (data) => {
            console.log('success get network type:' + data.type);
            if (data.type === 'WiFi') {
              await getTrafficStatsByNetwork(done, caseName, connection.NetBearType.BEARER_WIFI,
                0,
                0,
                0)
            } else {
              console.log('network type is not wifi:' + data.type);
              ExpectFail();
              done()
            }
          },
          fail: (err: ESObject) => {
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_0200
    * @tc.name  : GetTrafficStatsByUidTestPromise0200
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise0200', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise0200';
      try {
        network.getType({
          success: async (data) => {
            console.log('success get network type:' + data.type);
            if (data.type === 'WiFi') {
              getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_WIFI,
                Math.floor(Date.now() / 1000) + 5,
                Math.floor(Date.now() / 1000) - 86400 * 7,
                0)
            } else {
              console.log('network type is not wifi:' + data.type);
              ExpectFail();
              done()
            }
          },
          fail: (err: ESObject) => {
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_0600
    * @tc.name  : GetTrafficStatsByUidTestPromise0600
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise0600', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise0600';
      try {
        network.getType({
          success: async (data) => {
            console.log('success get network type:' + data.type);
            if (data.type === 'WiFi') {
              getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_WIFI,
                Math.floor(Date.now() / 1000) + 5,
                Math.floor(Date.now() / 1000) - 86400 * 7, 1)
            } else {
              console.log('network type is not wifi:' + data.type);
              ExpectFail();
              done()
            }
          },
          fail: (err: ESObject) => {
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_1000
    * @tc.name  : GetTrafficStatsByUidTestPromise1000
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise1000', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise1000';
      try {
        network.getType({
          success: async (data) => {
            console.log('success get network type:' + data.type);
            if (data.type === 'WiFi') {
              await getTrafficStatsByUidNetworkErr(done, caseName, 20020147, connection.NetBearType.BEARER_WIFI,
                Math.floor(Date.now() / 1000) - 86400 * 7,
                Math.floor(Date.now() / 1000) + 5, -1)
            } else {
              console.log('network type is not wifi:' + data.type);
              ExpectFail();
              done()
            }
          },
          fail: (err: ESObject) => {
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
      await sleep(3000);
      expect(ERR_CODE).assertEqual(caseName + ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_1400
    * @tc.name  : GetTrafficStatsByUidTestPromise1400
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise1400', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise1400';
      try {
        network.getType({
          success: async (data) => {
            console.log('success get network type:' + data.type);
            if (data.type === 'WiFi') {
              await getTrafficStatsByUidNetworkErr(done, caseName, 20020147, connection.NetBearType.BEARER_WIFI,
                -Math.floor(Date.now() / 1000) - 86400 * 7,
                Math.floor(Date.now() / 1000) + 5, 1)
            } else {
              console.log('network type is not wifi:' + data.type);
              ExpectFail();
              done()
            }
          },
          fail: (err: ESObject) => {
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
      await sleep(3000);
      expect(ERR_CODE).assertEqual(caseName + ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_1800
    * @tc.name  : GetTrafficStatsByUidTestPromise1800
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise1800', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise1800';
      try {
        network.getType({
          success: async (data) => {
            console.log('success get network type:' + data.type);
            if (data.type === 'WiFi') {
              await getTrafficStatsByUidNetworkErr(done, caseName, 20020147, connection.NetBearType.BEARER_WIFI,
                Math.floor(Date.now() / 1000) - 86400 * 7,
                -Math.floor(Date.now() / 1000) + 5, 1)
            } else {
              console.log('network type is not wifi:' + data.type);
              ExpectFail();
              done()
            }
          },
          fail: (err: ESObject) => {
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
      await sleep(3000);
      expect(ERR_CODE).assertEqual(caseName + ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_2200
    * @tc.name  : GetTrafficStatsByUidTestPromise2200
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise2200', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise2200';
      try {
        network.getType({
          success: async (data) => {
            console.log('success get network type:' + data.type);
            if (data.type === 'WiFi') {
              await getTrafficStatsByUidNetworkErr(done, caseName, 20020147, connection.NetBearType.BEARER_WIFI,
                -Math.floor(Date.now() / 1000) - 86400 * 7,
                -Math.floor(Date.now() / 1000) + 5, 1)
            } else {
              console.log('network type is not wifi:' + data.type);
              ExpectFail();
              done()
            }
          },
          fail: (err: ESObject) => {
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
      await sleep(3000);
      expect(ERR_CODE).assertEqual(caseName + ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_2600
    * @tc.name  : GetTrafficStatsByUidTestPromise2600
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise2600', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise2600';
      try {
        network.getType({
          success: async (data) => {
            console.log('success get network type:' + data.type);
            if (data.type === 'WiFi') {
              await getTrafficStatsByUidNetworkErr(done, caseName, 20020147, connection.NetBearType.BEARER_WIFI,
                -Math.floor(Date.now() / 1000) - 86400 * 7,
                -Math.floor(Date.now() / 1000) + 5, 0)
            } else {
              console.log('network type is not wifi:' + data.type);
              ExpectFail();
              done()
            }
          },
          fail: (err: ESObject) => {
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
      await sleep(3000);
      expect(ERR_CODE).assertEqual(caseName + ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_3000
    * @tc.name  : GetTrafficStatsByUidTestPromise3000
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise3000', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise3000';
      try {
        network.getType({
          success: async (data) => {
            console.log('success get network type:' + data.type);
            if (data.type === 'WiFi') {
              await getTrafficStatsByUidNetworkErr(done, caseName, 20020147, connection.NetBearType.BEARER_WIFI,
                -Math.floor(Date.now() / 1000) - 86400 * 7,
                -Math.floor(Date.now() / 1000) + 5, -1)
            } else {
              console.log('network type is not wifi:' + data.type);
              ExpectFail();
              done()
            }
          },
          fail: (err: ESObject) => {
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
      await sleep(3000);
      expect(ERR_CODE).assertEqual(caseName + ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_3400
    * @tc.name  : GetTrafficStatsByUidTestPromise3400
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise3400', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise3400';
      try {
        network.getType({
          success: async (data) => {
            console.log('success get network type:' + data.type);
            if (data.type === 'WiFi') {
              getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_WIFI,
                Math.floor(Date.now() / 1000) + 5,
                Math.floor(Date.now() / 1000) - 86400 * 7,
                0)
            } else {
              console.log('network type is not wifi:' + data.type);
              ExpectFail();
              done()
            }
          },
          fail: (err: ESObject) => {
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_3800
    * @tc.name  : GetTrafficStatsByUidTestPromise3800
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise3800', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise3800';
      try {
        network.getType({
          success: async (data) => {
            console.log('success get network type:' + data.type);
            if (data.type === 'WiFi') {
              getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_WIFI,
                Math.floor(Date.now() / 1000) + 5,
                Math.floor(Date.now() / 1000) - 86400 * 7,
                1)
            } else {
              console.log('network type is not wifi:' + data.type);
              ExpectFail();
              done()
            }
          },
          fail: (err: ESObject) => {
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_4200
    * @tc.name  : GetTrafficStatsByUidTestPromise4200
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise4200', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise4200';
      try {
        network.getType({
          success: async (data) => {
            console.log('success get network type:' + data.type);
            if (data.type === 'WiFi') {
              await getTrafficStatsByUidNetworkErr(done, caseName, 20020147, connection.NetBearType.BEARER_WIFI,
                Math.floor(Date.now() / 1000) + 5,
                Math.floor(Date.now() / 1000) - 86400 * 7,
                -1)
            } else {
              console.log('network type is not wifi:' + data.type);
              ExpectFail();
              done()
            }
          },
          fail: (err: ESObject) => {
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
      await sleep(3000);
      expect(ERR_CODE).assertEqual(caseName + ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_4600
    * @tc.name  : GetTrafficStatsByUidTestPromise4600
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise4600', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise4600';
      try {
        network.getType({
          success: async (data) => {
            console.log('success get network type:' + data.type);
            if (data.type === 'WiFi') {
              await getTrafficStatsByUidNetworkErr(done, caseName, 20020147, connection.NetBearType.BEARER_WIFI,
                0,
                Math.floor(Date.now() / 1000) - 86400 * 7,
                -1)
            } else {
              console.log('network type is not wifi:' + data.type);
              ExpectFail();
              done()
            }
          },
          fail: (err: ESObject) => {
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
      await sleep(3000);
      expect(ERR_CODE).assertEqual(caseName + ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_5000
    * @tc.name  : GetTrafficStatsByUidTestPromise5000
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise5000', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise5000';
      try {
        network.getType({
          success: async (data) => {
            console.log('success get network type:' + data.type);
            if (data.type === 'WiFi') {
              await getTrafficStatsByUidNetworkErr(done, caseName, 20020147, connection.NetBearType.BEARER_WIFI,
                Math.floor(Date.now() / 1000) + 5,
                0,
                -1)
            } else {
              console.log('network type is not wifi:' + data.type);
              ExpectFail();
              done()
            }
          },
          fail: (err: ESObject) => {
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
      await sleep(3000);
      expect(ERR_CODE).assertEqual(caseName + ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_5400
    * @tc.name  : GetTrafficStatsByUidTestPromise5400
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise5400', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise5400';
      try {
        network.getType({
          success: async (data) => {
            console.log('success get network type:' + data.type);
            if (data.type === 'WiFi') {
              await getTrafficStatsByUidNetworkErr(done, caseName, 20020147, connection.NetBearType.BEARER_WIFI,
                -Math.floor(Date.now() / 1000) + 5,
                0,
                -1)
            } else {
              console.log('network type is not wifi:' + data.type);
              ExpectFail();
              done()
            }
          },
          fail: (err: ESObject) => {
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
      await sleep(3000);
      expect(ERR_CODE).assertEqual(caseName + ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_5800
    * @tc.name  : GetTrafficStatsByUidTestPromise5800
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise5800', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise5800';
      try {
        network.getType({
          success: async (data) => {
            console.log('success get network type:' + data.type);
            if (data.type === 'WiFi') {
              await getTrafficStatsByUidNetworkErr(done, caseName, 20020147, connection.NetBearType.BEARER_WIFI,
                0,
                -Math.floor(Date.now() / 1000) + 5,
                -1)
            } else {
              console.log('network type is not wifi:' + data.type);
              ExpectFail();
              done()
            }
          },
          fail: (err: ESObject) => {
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
      await sleep(3000);
      expect(ERR_CODE).assertEqual(caseName + ERR_NETWORK);
      done()
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_6200
    * @tc.name  : GetTrafficStatsByUidTestPromise6200
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise6200', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise6200';
      try {
        network.getType({
          success: async (data) => {
            console.log('success get network type:' + data.type);
            if (data.type === 'WiFi') {
              getTrafficStatsByUidNetwork(done, caseName, 20020147, connection.NetBearType.BEARER_WIFI,
                0,
                0, 0)
            } else {
              console.log('network type is not wifi:' + data.type);
              ExpectFail();
              done()
            }
          },
          fail: (err: ESObject) => {
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
    });

    /* *
    * @tc.number: SUB_Network_Statistics_getTrafficStatsByUidNetwork_6600
    * @tc.name  : GetTrafficStatsByUidTestPromise6600
    * @tc.desc  : Obtain the traffic usage details of a specified network within a specified period;promise.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('GetTrafficStatsByUidTestPromise6600', 0, async (done: Function) => {
      const caseName: string = 'GetTrafficStatsByUidTestPromise6600';
      try {
        network.getType({
          success: async (data) => {
            console.log('success get network type:' + data.type);
            if (data.type === 'WiFi') {
              getTrafficStatsByUidNetwork(done, caseName, -20020147, connection.NetBearType.BEARER_WIFI,
                Math.floor(Date.now() / 1000) + 5,
                Math.floor(Date.now() / 1000) - 86400 * 7, 0)
            } else {
              console.log('network type is not wifi:' + data.type);
              ExpectFail();
              done()
            }
          },
          fail: (err: ESObject) => {
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
      }
    });
  })
}