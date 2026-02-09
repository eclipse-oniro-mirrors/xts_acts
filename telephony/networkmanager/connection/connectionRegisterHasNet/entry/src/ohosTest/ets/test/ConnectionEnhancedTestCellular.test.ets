/**
 * Copyright (C) 2021-2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

import connection from '@ohos.net.connection';
import { describe, expect, it , TestType, Size, Level, beforeEach } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import { CommonUtils } from './CommonUtils.test'
let isNetLost = false;
let isNetAvailable = false;
let isNetUnavailable = false;
let isNetConnectionPropertiesChange = false;
let isNetCapabilitiesChange = false;
let netCapInfo: connection.NetCapabilityInfo | undefined = undefined;
let netPropertyInfo: connection.NetConnectionPropertyInfo | undefined = undefined;
let availableNet: connection.NetHandle | undefined = undefined;
let lostNet: connection.NetHandle | undefined = undefined;
let ListenTimes : number = 0;
const NetBearTypeBEARER_CELLULAR = connection.NetBearType.BEARER_CELLULAR;
const NetBearTypeBEARER_WIFI = connection.NetBearType.BEARER_WIFI;
const NetBearTypeBEARER_BLUETOOTH = connection.NetBearType.BEARER_BLUETOOTH;
const NetBearTypeBEARER_ETHERNET = connection.NetBearType.BEARER_ETHERNET;
const NetBearTypeBEARER_VPN = connection.NetBearType.BEARER_VPN;
const NetCapNET_CAPABILITY_MMS = connection.NetCap.NET_CAPABILITY_MMS;
const NetCapNET_CAPABILITY_NOT_METERED = connection.NetCap.NET_CAPABILITY_NOT_METERED;
const NetCapNET_CAPABILITY_INTERNET = connection.NetCap.NET_CAPABILITY_INTERNET;
const NetCapNET_CAPABILITY_NOT_VPN = connection.NetCap.NET_CAPABILITY_NOT_VPN;
const NetCapNET_NET_CAPABILITY_VALIDATED = connection.NetCap.NET_CAPABILITY_VALIDATED;
const NetCapNET_CAPABILITY_PORTAL = connection.NetCap.NET_CAPABILITY_PORTAL;
const NetCapNET_CAPABILITY_CHECKING_CONNECTIVITY = connection.NetCap.NET_CAPABILITY_CHECKING_CONNECTIVITY;
let util = new CommonUtils()


let netConnOnEventAll = async (caseName: string, netConn: connection.NetConnection) => {
  console.info(caseName + ": ==  Subscribing to Events start  === ")
  netConn.on('netAvailable', (value: connection.NetHandle) => {
    ListenTimes += 1;
    isNetAvailable = true;
    availableNet = value;
    console.info(caseName+ " === on netAvailable " + JSON.stringify(value));
  });
  netConn.on('netConnectionPropertiesChange', (value: connection.NetConnectionPropertyInfo) => {
    ListenTimes += 10;
    isNetConnectionPropertiesChange = true;
    netPropertyInfo = value;
    console.info(caseName +" ===on netConnectionPropertiesChange" + JSON.stringify(value));
  });
  netConn.on('netCapabilitiesChange', (value: connection.NetCapabilityInfo) => {
    ListenTimes += 100;
    isNetCapabilitiesChange = true;
    netCapInfo = value;
    console.info(caseName + " ===on netCapabilitiesChange " + JSON.stringify(value));
  });
  netConn.on('netLost', (value: connection.NetHandle) => {
    ListenTimes += 1000;
    isNetLost = true;
    lostNet = value;
    console.info(caseName +" === on netLost" + JSON.stringify(value));
  });
  netConn.on('netUnavailable', () => {
    ListenTimes += 10000;
    isNetUnavailable = true;
    console.info(caseName +" ===on netUnavailable ");
  });
  console.info(caseName + ": ==  Subscribing to Events end  === ");
}

const ExpectFail: (caseName:string) => void = (caseName:string) => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(caseName+'exportFail failed err:' +JSON.stringify(err));
  }
};
const ExpectTrue: ( caseName:string, n: boolean | undefined) => void = (caseName:string, n: boolean | undefined) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(caseName+'exportFail failed err:' +JSON.stringify(err));
  }
};


export default function ConnectionEnhancedTestCellular() {
  describe('Telephony_NetworkManagerEnhancedCellularTest', () => {
    beforeEach(() => {
      ListenTimes = 0;
      isNetLost = false;
      isNetAvailable = false;
      isNetUnavailable = false;
      isNetConnectionPropertiesChange = false;
      isNetCapabilitiesChange = false;
      netCapInfo = undefined;
      netPropertyInfo = undefined;
      availableNet = undefined;
    })
    const TIMEOUT = 1000;

    /**
     * @tc.name   testNetworkManagerEnhancedTestCellular0100
     * @tc.number SUB_NetworkManager_Register_Enhanced_TestCellular_0100
     * @tc.desc   check netAvailable、netConnectionPropertiesChange、netCapabilitiesChange event
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkManagerEnhancedTestCellular0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'testNetworkManagerEnhancedTestCellular0100';
      console.info(`${caseName}---Start`);
      try {
        let netConn = connection.createNetConnection();
        console.info(caseName+ " register start");
        netConnOnEventAll(caseName, netConn);
        netConn.register((error: BusinessError) => {
          if (error) {
            console.info(caseName + " register fail: " + JSON.stringify(error));
            ExpectFail(caseName);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(caseName + " register success");
          }
        });
        await util.sleep(500);
        console.info(`${caseName}---check isNetAvailable`);
        ExpectTrue(caseName, isNetAvailable);
        console.info(`${caseName}---check isNetLost`);
        ExpectTrue(caseName, !isNetLost);
        console.info(`${caseName}---check isNetUnavailable`);
        ExpectTrue(caseName, !isNetUnavailable);
        console.info(`${caseName}---check isNetConnectionPropertiesChange`);
        ExpectTrue(caseName, isNetConnectionPropertiesChange);
        console.info(`${caseName}---check isNetCapabilitiesChange`);
        ExpectTrue(caseName, isNetCapabilitiesChange);
        console.info(`${caseName}---check netCapInfo.netHandle`);
        ExpectTrue(caseName, netCapInfo?.netHandle?.netId === availableNet?.netId);
        console.info(`${caseName}---check NetBearTypeBEARER_CELLULAR`);
        ExpectTrue(caseName, netCapInfo?.netCap.bearerTypes.includes(NetBearTypeBEARER_CELLULAR));
        console.info(`${caseName}---check NetCapNET_CAPABILITY_INTERNET`);
        ExpectTrue(caseName, netCapInfo?.netCap.networkCap?.includes(NetCapNET_CAPABILITY_INTERNET));
        console.info(`${caseName}---check NetCapNET_CAPABILITY_NOT_VPN`);
        ExpectTrue(caseName, netCapInfo?.netCap.networkCap?.includes(NetCapNET_CAPABILITY_NOT_VPN));
        console.info(`${caseName}---check NetCapNET_NET_CAPABILITY_VALIDATED`);
        ExpectTrue(caseName, netCapInfo?.netCap.networkCap?.includes(NetCapNET_NET_CAPABILITY_VALIDATED));
        console.info(`${caseName}---check netPropertyInfo.netHandle`);
        ExpectTrue(caseName, netPropertyInfo?.netHandle?.netId == availableNet?.netId);
        console.info(`${caseName}---check linkAddresses：`+ JSON.stringify(netPropertyInfo?.connectionProperties.linkAddresses));
        netPropertyInfo?.connectionProperties.linkAddresses.forEach((addr: connection.LinkAddress) => {
          ExpectTrue(caseName, util.isValidV4NetAddress(caseName, addr.address) || util.isValidIPv6Address(caseName, addr.address, false));
        })
        console.info(`${caseName}---check dnses：` + JSON.stringify(netPropertyInfo?.connectionProperties.dnses));
        netPropertyInfo?.connectionProperties.dnses.forEach((addr: connection.NetAddress) => {
          ExpectTrue(caseName, util.isValidV4NetAddress(caseName, addr) || util.isValidIPv6Address(caseName, addr, false));
        })
        console.info(`${caseName}---check route：` + JSON.stringify(netPropertyInfo?.connectionProperties.routes));
        netPropertyInfo?.connectionProperties.routes.forEach((route: connection.RouteInfo) => {
          let res: boolean = util.isValidV4NetAddress(caseName, route.destination.address) || util.isValidIPv6Address(caseName, route.destination.address, true);
          if (!res) {
            console.error(caseName + "check route.destination address：" + JSON.stringify(route.destination.address) + " failed");
            ExpectFail(caseName);
          } else {
            ExpectTrue(caseName, res);
          }
          let res1: boolean = util.isValidV4NetAddress(caseName, route.gateway) || util.isValidIPv6Address(caseName, route.gateway, true);
          if (!res1) {
            console.error(caseName + "check route.gateway address：" + JSON.stringify(route.gateway) + " failed");
            ExpectFail(caseName);
          } else {
            ExpectTrue(caseName, res);
          }
        })

        console.info(caseName + " unregister start");
        netConn.unregister((error: BusinessError) => {
          if (error) {
            console.info(caseName + "unregister fail: " + JSON.stringify(error));
            ExpectFail(caseName);
          } else {
            console.info(caseName + " unregister success ");
            console.info(caseName + " ListenTimes is :" + ListenTimes);
            ExpectTrue(caseName, ListenTimes === 111);
          }
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch err is `, JSON.stringify(err));
        ExpectFail(caseName);
        console.info(`${caseName} --test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkManagerEnhancedTestCellular0200
     * @tc.number SUB_NetworkManager_Register_Enhanced_TestCellular_0200
     * @tc.desc   check netAvailable、netConnectionPropertiesChange、netCapabilitiesChange event, netSpecifier focus on BEARER_CELLULAR
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkManagerEnhancedTestCellular0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'testNetworkManagerEnhancedTestCellular0200';
      console.info(`${caseName}---Start`);
      try {
        let netConn: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_CELLULAR]
          },
        },5000);
        console.info(caseName+ " register start");
        netConnOnEventAll(caseName, netConn);
        netConn.register((error: BusinessError) => {
          if (error) {
            console.info(caseName + " register fail: " + JSON.stringify(error));
            ExpectFail(caseName);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(caseName + " register success");
          }
        });
        await util.sleep(500);
        console.info(`${caseName}---check isNetAvailable`);
        ExpectTrue(caseName, isNetAvailable);
        console.info(`${caseName}---check isNetLost`);
        ExpectTrue(caseName, !isNetLost);
        console.info(`${caseName}---check isNetUnavailable`);
        ExpectTrue(caseName, !isNetUnavailable);
        console.info(`${caseName}---check isNetConnectionPropertiesChange`);
        ExpectTrue(caseName, isNetConnectionPropertiesChange);
        console.info(`${caseName}---check isNetCapabilitiesChange`);
        ExpectTrue(caseName, isNetCapabilitiesChange);
        console.info(`${caseName}---check netCapInfo.netHandle`);
        ExpectTrue(caseName, netCapInfo?.netHandle?.netId === availableNet?.netId);
        console.info(`${caseName}---check NetBearTypeBEARER_CELLULAR`);
        ExpectTrue(caseName, netCapInfo?.netCap.bearerTypes.includes(NetBearTypeBEARER_CELLULAR));
        console.info(`${caseName}---check NetCapNET_CAPABILITY_INTERNET`);
        ExpectTrue(caseName, netCapInfo?.netCap.networkCap?.includes(NetCapNET_CAPABILITY_INTERNET));
        console.info(`${caseName}---check NetCapNET_CAPABILITY_NOT_VPN`);
        ExpectTrue(caseName, netCapInfo?.netCap.networkCap?.includes(NetCapNET_CAPABILITY_NOT_VPN));
        console.info(`${caseName}---check NetCapNET_NET_CAPABILITY_VALIDATED`);
        ExpectTrue(caseName, netCapInfo?.netCap.networkCap?.includes(NetCapNET_NET_CAPABILITY_VALIDATED));
        console.info(`${caseName}---check netPropertyInfo.netHandle`);
        ExpectTrue(caseName, netPropertyInfo?.netHandle?.netId == availableNet?.netId);
        console.info(`${caseName}---check linkAddresses：`+ JSON.stringify(netPropertyInfo?.connectionProperties.linkAddresses));
        netPropertyInfo?.connectionProperties.linkAddresses.forEach((addr: connection.LinkAddress) => {
          ExpectTrue(caseName, util.isValidV4NetAddress(caseName, addr.address) || util.isValidIPv6Address(caseName, addr.address, false));
        })
        console.info(`${caseName}---check dnses：` + JSON.stringify(netPropertyInfo?.connectionProperties.dnses));
        netPropertyInfo?.connectionProperties.dnses.forEach((addr: connection.NetAddress) => {
          ExpectTrue(caseName, util.isValidV4NetAddress(caseName, addr) || util.isValidIPv6Address(caseName, addr, false));
        })
        console.info(`${caseName}---check route：` + JSON.stringify(netPropertyInfo?.connectionProperties.routes));
        netPropertyInfo?.connectionProperties.routes.forEach((route: connection.RouteInfo) => {
          let res: boolean = util.isValidV4NetAddress(caseName, route.destination.address) || util.isValidIPv6Address(caseName, route.destination.address, true);
          if (!res) {
            console.info(caseName + "check route.destination address：" + JSON.stringify(route.destination.address) + " failed");
            ExpectFail(caseName);
          } else {
            ExpectTrue(caseName, res);
          }
          let res1: boolean = util.isValidV4NetAddress(caseName, route.gateway) || util.isValidIPv6Address(caseName, route.gateway, true);
          if (!res1) {
            console.error(caseName + "check route.gateway address：" + JSON.stringify(route.gateway) + " failed");
            ExpectFail(caseName);
          } else {
            ExpectTrue(caseName, res);
          }
        })

        console.info(caseName + " unregister start");
        netConn.unregister((error: BusinessError) => {
          if (error) {
            console.info(caseName + "unregister fail: " + JSON.stringify(error));
            ExpectFail(caseName);
          } else {
            console.info(caseName + " unregister success ");
            console.info(caseName + " ListenTimes is :" + ListenTimes);
            ExpectTrue(caseName, ListenTimes === 111);
          }
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch err is `, JSON.stringify(err));
        ExpectFail(caseName);
        console.info(`${caseName} --test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkManagerEnhancedTestCellular0300
     * @tc.number SUB_NetworkManager_Register_Enhanced_TestCellular_0300
     * @tc.desc   check netAvailable、netConnectionPropertiesChange、netCapabilitiesChange event, register twice, netSpecifier focus on BEARER_CELLULAR
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkManagerEnhancedTestCellular0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'testNetworkManagerEnhancedTestCellular0300';
      console.info(`${caseName}---Start`);
      try {
        let netConn: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_CELLULAR]
          },
        },5000);
        console.info(caseName+ " register start");
        netConnOnEventAll(caseName, netConn);
        netConn.register((error: BusinessError) => {
          if (error) {
            console.info(caseName + " register fail: " + JSON.stringify(error));
            ExpectFail(caseName);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(caseName + " register success");
          }
        });
        // register twice
        let netConn2: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_CELLULAR]
          },
        },5000);
        console.info(caseName+ " register start");
        netConnOnEventAll(caseName, netConn2);
        netConn2.register((error: BusinessError) => {
          if (error) {
            console.info(caseName + " register fail: " + JSON.stringify(error));
            ExpectFail(caseName);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(caseName + " register success");
          }
        });
        await util.sleep(500);
        console.info(`${caseName}---check isNetAvailable`);
        ExpectTrue(caseName, isNetAvailable);
        console.info(`${caseName}---check isNetLost`);
        ExpectTrue(caseName, !isNetLost);
        console.info(`${caseName}---check isNetUnavailable`);
        ExpectTrue(caseName, !isNetUnavailable);
        console.info(`${caseName}---check isNetConnectionPropertiesChange`);
        ExpectTrue(caseName, isNetConnectionPropertiesChange);
        console.info(`${caseName}---check isNetCapabilitiesChange`);
        ExpectTrue(caseName, isNetCapabilitiesChange);
        console.info(`${caseName}---check netCapInfo.netHandle`);
        ExpectTrue(caseName, netCapInfo?.netHandle?.netId === availableNet?.netId);
        console.info(`${caseName}---check NetBearTypeBEARER_CELLULAR`);
        ExpectTrue(caseName, netCapInfo?.netCap.bearerTypes.includes(NetBearTypeBEARER_CELLULAR));
        console.info(`${caseName}---check NetCapNET_CAPABILITY_INTERNET`);
        ExpectTrue(caseName, netCapInfo?.netCap.networkCap?.includes(NetCapNET_CAPABILITY_INTERNET));
        console.info(`${caseName}---check NetCapNET_CAPABILITY_NOT_VPN`);
        ExpectTrue(caseName, netCapInfo?.netCap.networkCap?.includes(NetCapNET_CAPABILITY_NOT_VPN));
        console.info(`${caseName}---check NetCapNET_NET_CAPABILITY_VALIDATED`);
        ExpectTrue(caseName, netCapInfo?.netCap.networkCap?.includes(NetCapNET_NET_CAPABILITY_VALIDATED));
        console.info(`${caseName}---check netPropertyInfo.netHandle`);
        ExpectTrue(caseName, netPropertyInfo?.netHandle?.netId == availableNet?.netId);
        console.info(`${caseName}---check linkAddresses：`+ JSON.stringify(netPropertyInfo?.connectionProperties.linkAddresses));
        netPropertyInfo?.connectionProperties.linkAddresses.forEach((addr: connection.LinkAddress) => {
          ExpectTrue(caseName, util.isValidV4NetAddress(caseName, addr.address) || util.isValidIPv6Address(caseName, addr.address, false));
        })
        console.info(`${caseName}---check dnses：` + JSON.stringify(netPropertyInfo?.connectionProperties.dnses));
        netPropertyInfo?.connectionProperties.dnses.forEach((addr: connection.NetAddress) => {
          ExpectTrue(caseName, util.isValidV4NetAddress(caseName, addr) || util.isValidIPv6Address(caseName, addr, false));
        })
        console.info(`${caseName}---check route：` + JSON.stringify(netPropertyInfo?.connectionProperties.routes));
        netPropertyInfo?.connectionProperties.routes.forEach((route: connection.RouteInfo) => {
          let res: boolean = util.isValidV4NetAddress(caseName, route.destination.address) || util.isValidIPv6Address(caseName, route.destination.address, true);
          if (!res) {
            console.info(caseName + "check route.destination address：" + JSON.stringify(route.destination.address) + " failed");
            ExpectFail(caseName);
          } else {
            ExpectTrue(caseName, res);
          }
          let res1: boolean = util.isValidV4NetAddress(caseName, route.gateway) || util.isValidIPv6Address(caseName, route.gateway, true);
          if (!res1) {
            console.error(caseName + "check route.gateway address：" + JSON.stringify(route.gateway) + " failed");
            ExpectFail(caseName);
          } else {
            ExpectTrue(caseName, res);
          }
        })

        console.info(caseName + " unregister start");
        netConn.unregister((error: BusinessError) => {
          if (error) {
            console.info(caseName + "unregister fail: " + JSON.stringify(error));
            ExpectFail(caseName);
          } else {
            console.info(caseName + " unregister success ");
            console.info(caseName + " ListenTimes is :" + ListenTimes);
            ExpectTrue(caseName, ListenTimes === 222);
          }
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch err is `, JSON.stringify(err));
        ExpectFail(caseName);
        console.info(`${caseName} --test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkManagerEnhancedTestCellular0400
     * @tc.number SUB_NetworkManager_Register_Enhanced_TestCellular_0400
     * @tc.desc   check netAvailable、netConnectionPropertiesChange、netCapabilitiesChange event, netSpecifier focus on BEARER_CELLULAR
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkManagerEnhancedTestCellular0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'testNetworkManagerEnhancedTestCellular0400';
      console.info(`${caseName}---Start`);
      try {
        let netConn: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_WIFI]
          },
        }, 500);
        console.info(caseName+ " register start");
        netConnOnEventAll(caseName, netConn);
        netConn.register((error: BusinessError) => {
          if (error) {
            console.info(caseName + " register fail: " + JSON.stringify(error));
            ExpectFail(caseName);
            console.info(`${caseName}---End`);
            done();
          } else {
            console.info(caseName + " register success");
          }
        });
        await util.sleep(800);
        console.info(`${caseName}---check isNetAvailable`);
        ExpectTrue(caseName, !isNetAvailable);
        console.info(`${caseName}---check isNetLost`);
        ExpectTrue(caseName, !isNetLost);
        console.info(`${caseName}---check isNetUnavailable`);
        ExpectTrue(caseName, isNetUnavailable);
        console.info(`${caseName}---check isNetConnectionPropertiesChange`);
        ExpectTrue(caseName, !isNetConnectionPropertiesChange);
        console.info(`${caseName}---check isNetCapabilitiesChange`);
        ExpectTrue(caseName, !isNetCapabilitiesChange);

        console.info(caseName + " unregister start");
        netConn.unregister((error: BusinessError) => {
          if (error) {
            console.info(caseName + "unregister fail: " + JSON.stringify(error));
            ExpectFail(caseName);
          } else {
            console.info(caseName + " unregister success ");
            console.info(caseName + " ListenTimes is :" + ListenTimes);
            ExpectTrue(caseName, ListenTimes === 10000);
          }
          console.info(`${caseName}---End`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} catch err is `, JSON.stringify(err));
        ExpectFail(caseName);
        console.info(`${caseName} --test end`);
        done();
      }
    });
  })
}
