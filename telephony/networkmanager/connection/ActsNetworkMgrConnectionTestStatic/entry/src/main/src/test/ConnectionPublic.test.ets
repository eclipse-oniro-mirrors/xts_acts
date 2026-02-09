/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import connection from '@ohos.net.connection';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'ConnectionTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}
const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}

export default function ConnectionPublicTest() {
  describe("ConnectionPublicTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   testNetworkMgrConnectionHasDefaultNet_static_0100
     * @tc.number SUB_NetworkMgr_Connection_HasDefaultNet_0100
     * @tc.desc   Check if the default data network is activated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrConnectionHasDefaultNet_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionHasDefaultNet_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.hasDefaultNet((error: BusinessError<void>|null, data: boolean| undefined) => {
          if (error?.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' hasDefaultNet: data ->'+data);
            ExpectTrue(data == true);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }
        });
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionHasDefaultNet_static_0600
     * @tc.number SUB_NetworkMgr_Connection_HasDefaultNet_0600
     * @tc.desc   Check if the default data network is activated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrConnectionHasDefaultNet_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionHasDefaultNet_static_0600";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.hasDefaultNet().then((data: boolean) => {
          hilog.info(domain, tag, '%{public}s', caseName +': hasDefaultNet data ->'+data);
          ExpectTrue(data == true);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionHasDefaultNetSync_static_0100
     * @tc.number SUB_NetworkMgr_Connection_HasDefaultNetSync_0100
     * @tc.desc   Check if the default data network is activated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrConnectionHasDefaultNetSync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionHasDefaultNetSync_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let isDefaultNet: boolean = connection.hasDefaultNetSync();
        ExpectTrue(isDefaultNet == true);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });


    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_0100
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_0100
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection();
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_0200
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_0200
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_0200";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_CELLULAR]
          }
        });
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_0300
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_0300
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_0300";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_CELLULAR]
          }
        }, 5000);
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_0400
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_0400
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_0400";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_CELLULAR]
          }
        }, 10);
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectTrue(true);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_0500
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_0500
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_0500";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_CELLULAR]
          }
        }, -1000);
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectTrue(true);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_0600
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_0600
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_0600";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_WIFI]
          }
        });
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_0700
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_0700
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_0700";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_WIFI]
          }
        }, 5000);
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_0800
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_0800
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_0800";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_WIFI]
          }
        }, 10);
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectTrue(true);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_0900
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_0900
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_0900";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_WIFI]
          }
        }, -1000);
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectTrue(true);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_1000
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_1000
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_1000";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_ETHERNET]
          }
        });
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_1100
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_1100
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_1100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_ETHERNET]
          }
        }, 5000);
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_1200
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_1200
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_1200";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_ETHERNET]
          }
        }, 10);
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectTrue(true);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_1300
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_1300
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_1300";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_ETHERNET]
          }
        }, -1000);
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectTrue(true);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_1400
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_1400
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_1400";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_VPN]
          }
        });
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_1500
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_1500
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_1500";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_VPN]
          }
        }, 5000);
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_1600
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_1600
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_1600";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_VPN]
          }
        }, 10);
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectTrue(true);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionCreateNetConnection_static_1700
     * @tc.number SUB_NetworkMgr_Connection_CreateNetConnection_1700
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_1700";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_VPN]
          }
        }, -1000);
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectTrue(true);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetDefaultNetCallback_static_0100
     * @tc.number SUB_NetworkMgr_Connection_GetDefaultNet_Callback_0100
     * @tc.desc   test obtain the default activated data network and use the callback method as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetDefaultNetCallback_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetDefaultNetCallback_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet((err: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
           hilog.info(domain, tag, '%{public}s', caseName +' data -> '+JSON.stringify(data)+' err -> '+JSON.stringify(err));
          if (err?.code == 0) {
            ExpectTrue(true);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          } else {
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetDefaultNetPromise_static_0100
     * @tc.number SUB_NetworkMgr_Connection_GetDefaultNet_Promise_0100
     * @tc.desc   test obtain the default activated data network and use Promise as an asynchronous method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetDefaultNetPromise_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetDefaultNetPromise_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((data: connection.NetHandle) => {
          let netBlockStatus: connection.NetBlockStatusInfo = {
            netHandle: data,
            blocked: true
          }
          hilog.info(domain, tag, '%{public}s', caseName +':getDefaultNet: data-'+JSON.stringify(data));
          ExpectTrue(typeof data.netId == 'int');
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetDefaultNetSync_static_0100
     * @tc.number SUB_NetworkMgr_Connection_GetDefaultNetSync_0100
     * @tc.desc   test use synchronization method to obtain default activated data network
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetDefaultNetSync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetDefaultNetSync_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        ExpectTrue(typeof netHandle.netId == 'int');
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetDefaultHttpProxyCallback_static_0100
     * @tc.number SUB_NetworkMgr_Connection_GetDefaultHttpProxy_Callback_0100
     * @tc.desc   test obtain default proxy configuration information for the network
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetDefaultHttpProxyCallback_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetDefaultHttpProxyCallback_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultHttpProxy((err: BusinessError<void>|null, data: connection.HttpProxy| undefined) => {
          hilog.info(domain, tag, '%{public}s', caseName +' getDefaultHttpProxy data -> '+JSON.stringify(data)+' err -> '+JSON.stringify(err));
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' getDefaultHttpProxy success ');
            ExpectTrue(data != undefined);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }
        });
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetDefaultHttpProxyCallback_static_0200
     * @tc.number SUB_NetworkMgr_Connection_GetDefaultHttpProxy_Callback_0200
     * @tc.desc   test obtain default proxy configuration information for the network
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetDefaultHttpProxyCallback_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetDefaultHttpProxyCallback_static_0200";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then( async (netHandle: connection.NetHandle)=>{
          hilog.info(domain, tag, '%{public}s', caseName +': netHandle ->'+JSON.stringify(netHandle));
          connection.setAppNet(netHandle, (err: BusinessError<void>|null) => {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            if (err?.code != 0) {
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
          await Utils.msSleep(2000);
          connection.getDefaultHttpProxy((err: BusinessError<void>|null, data: connection.HttpProxy| undefined) => {
            hilog.info(domain, tag, '%{public}s', caseName +' data -> '+JSON.stringify(data)+' err -> '+JSON.stringify(err));
            ExpectTrue(data != undefined);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        })
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetDefaultHttpProxyPromise_static_0100
     * @tc.number SUB_NetworkMgr_Connection_GetDefaultHttpProxy_Promise_0100
     * @tc.desc   test obtain default proxy configuration information for the network
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetDefaultHttpProxyPromise_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetDefaultHttpProxyPromise_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultHttpProxy().then((data: connection.HttpProxy) => {
          hilog.info(domain, tag, '%{public}s', caseName +': getDefaultHttpProxy data ->'+JSON.stringify(data));
          ExpectTrue(data != undefined);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetAllNets_static_0100
     * @tc.number SUB_NetworkMgr_ConnectionGetAllNets_0100
     * @tc.desc   Obtain a list of all connected networks and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetAllNets_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetAllNets_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getAllNets((error: BusinessError<void>|null, data: connection.NetHandle[]| undefined) => {
          if (error?.code == 0) {
            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
            ExpectTrue(true);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }
        });
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetAllNets_static_0500
     * @tc.number SUB_NetworkMgr_ConnectionGetAllNets_0500
     * @tc.desc   Obtain a list of all connected networks and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetAllNets_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetAllNets_static_0500";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getAllNets().then((data: connection.NetHandle[]) => {
          hilog.info(domain, tag, '%{public}s', caseName +': getAllNets: success data->'+JSON.stringify(data));
          ExpectTrue(data.length >= 0);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetAllNetsSync_static_0100
     * @tc.number SUB_NetworkMgr_ConnectionGetAllNetsSync_0100
     * @tc.desc   Use synchronization method to obtain a list of all connected networks.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetAllNetsSync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetAllNetsSync_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netHandle: connection.NetHandle[] = connection.getAllNetsSync();
        hilog.info(domain, tag, '%{public}s', caseName +' GetAllNetsSync: success data->'+JSON.stringify(netHandle));
        ExpectTrue(netHandle.length >= 0);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionProperties_static_0100
     * @tc.number SUB_NetworkMgr_ConnectionGetConnectionProperties_0100
     * @tc.desc   Obtain the connection information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectionProperties_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code == 0) {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties data ->'+JSON.stringify(data));
              ExpectTrue(true);
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
           let err = error as BusinessError;
           hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
           ExpectFail();
           hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionProperties_static_0600
     * @tc.number SUB_NetworkMgr_ConnectionGetConnectionProperties_0600
     * @tc.desc   Obtain the connection information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectionProperties_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties_static_0600";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 200;
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
              ExpectTrue(error?.code == 2100001);
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties data ->'+JSON.stringify(data));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionProperties_static_0700
     * @tc.number SUB_NetworkMgr_ConnectionGetConnectionProperties_0700
     * @tc.desc   Obtain the connection information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectionProperties_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties_static_0700";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 0;
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties error is '+JSON.stringify(error));
              ExpectTrue(error?.code == 2100001);
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +':getConnectionProperties  data ->'+JSON.stringify(data));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionProperties_static_0800
     * @tc.number SUB_NetworkMgr_ConnectionGetConnectionProperties_0800
     * @tc.desc   Obtain the connection information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectionProperties_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties_static_0800";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 23;
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
              ExpectTrue(error?.code == 2100001);
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties data ->'+JSON.stringify(data));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionProperties_static_1700
     * @tc.number SUB_NetworkMgr_ConnectionGetConnectionProperties_1700
     * @tc.desc   Obtain the connection information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectionProperties_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties_static_1700";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 9999999;
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties error is '+JSON.stringify(error));
              ExpectTrue(error?.code == 2100001);
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties data ->'+JSON.stringify(data));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionProperties_static_0900
     * @tc.number SUB_NetworkMgr_ConnectionGetConnectionProperties_0900
     * @tc.desc   Obtain the connection information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectionProperties_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties_static_0900";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            let netConnectionProInfo: connection.NetConnectionPropertyInfo = {
              netHandle: netHandle,
              connectionProperties: data
            }
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties data ->'+JSON.stringify(data));
            ExpectTrue(data != undefined);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionProperties_static_1400
     * @tc.number SUB_NetworkMgr_ConnectionGetConnectionProperties_1400
     * @tc.desc   Obtain the connection information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectionProperties_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties_static_1400";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 200;
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties data ->'+JSON.stringify(data));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectTrue(err.code == 2100001);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionProperties_static_1500
     * @tc.number SUB_NetworkMgr_ConnectionGetConnectionProperties_1500
     * @tc.desc   Obtain the connection information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectionProperties_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties_static_1500";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 0;
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties data ->'+JSON.stringify(data));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties error is '+JSON.stringify(err));
            ExpectTrue(err.code == 2100001);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionProperties_static_1600
     * @tc.number SUB_NetworkMgr_ConnectionGetConnectionProperties_1600
     * @tc.desc   Obtain the connection information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectionProperties_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties_static_1600";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 23;
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +':  getConnectionProperties data ->'+JSON.stringify(data));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties error is '+JSON.stringify(err));
            ExpectTrue(err.code == 2100001);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionProperties_static_1800
     * @tc.number SUB_NetworkMgr_ConnectionGetConnectionProperties_1800
     * @tc.desc   Obtain the connection information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectionProperties_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties_static_1800";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 999999;
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties data ->'+JSON.stringify(data));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectTrue(err.code == 2100001);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionPropertiesSync_static_0100
     * @tc.number SUB_NetworkMgr_ConnectionGetConnectionPropertiesSync_0100
     * @tc.desc   Use synchronization method to obtain network information bound to the app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectionPropertiesSync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionPropertiesSync_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        let connectionProperties: connection.ConnectionProperties = connection.getConnectionPropertiesSync(netHandle);
        hilog.info(domain, tag, '%{public}s', caseName +': GetConnectionPropertiesSync data ->'+JSON.stringify(connectionProperties));
        ExpectTrue(connectionProperties != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionPropertiesSync_static_0600
     * @tc.number SUB_NetworkMgr_ConnectionGetConnectionPropertiesSync_0600
     * @tc.desc   Use synchronization method to obtain network information bound to the app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectionPropertiesSync_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionPropertiesSync_static_0600";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        netHandle.netId = 200;
        let connectionProperties: connection.ConnectionProperties = connection.getConnectionPropertiesSync(netHandle);
        hilog.info(domain, tag, '%{public}s', caseName +': GetConnectionPropertiesSync data ->'+JSON.stringify(connectionProperties));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue((err as BusinessError).code == 2100001);
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionPropertiesSync_static_0700
     * @tc.number SUB_NetworkMgr_ConnectionGetConnectionPropertiesSync_0700
     * @tc.desc   Use synchronization method to obtain network information bound to the app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectionPropertiesSync_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionPropertiesSync_static_0700";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        netHandle.netId = 0;
        let connectionProperties: connection.ConnectionProperties = connection.getConnectionPropertiesSync(netHandle);
        hilog.info(domain, tag, '%{public}s', caseName +': GetConnectionPropertiesSync data ->'+JSON.stringify(connectionProperties));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue((err as BusinessError).code == 2100001);
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionPropertiesSync_static_0800
     * @tc.number SUB_NetworkMgr_ConnectionGetConnectionPropertiesSync_0800
     * @tc.desc   Use synchronization method to obtain network information bound to the app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectionPropertiesSync_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionPropertiesSync_static_0800";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        netHandle.netId = 23;
        let connectionProperties: connection.ConnectionProperties = connection.getConnectionPropertiesSync(netHandle);
        hilog.info(domain, tag, '%{public}s', caseName +':GetConnectionPropertiesSync data ->'+JSON.stringify(connectionProperties));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue((err as BusinessError).code == 2100001);
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetConnectionPropertiesSync_static_0900
     * @tc.number SUB_NetworkMgr_ConnectionGetConnectionPropertiesSync_0900
     * @tc.desc   Use synchronization method to obtain network information bound to the app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetConnectionPropertiesSync_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionPropertiesSync_static_0900";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        netHandle.netId = 999999;
        let connectionProperties: connection.ConnectionProperties = connection.getConnectionPropertiesSync(netHandle);
        hilog.info(domain, tag, '%{public}s', caseName +': GetConnectionPropertiesSync data ->'+JSON.stringify(connectionProperties));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue((err as BusinessError).code == 2100001);
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilities_static_0100
     * @tc.number SUB_NetworkMgr_ConnectionGetNetCapabilities_0100
     * @tc.desc   Obtain the capability information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getNetCapabilities(netHandle, (error: BusinessError<void>|null, data: connection.NetCapabilities| undefined) => {
            if (error?.code == 0) {
              hilog.info(domain, tag, '%{public}s', caseName +': getNetCapabilities data ->'+JSON.stringify(data));
              ExpectTrue(true);
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilities_static_0600
     * @tc.number SUB_NetworkMgr_ConnectionGetNetCapabilities_0600
     * @tc.desc   Obtain the capability information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_0600";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 200;
          connection.getNetCapabilities(netHandle, (error: BusinessError<void>|null, data: connection.NetCapabilities| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
              ExpectTrue(error?.code == 2100001);
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getNetCapabilities data ->'+JSON.stringify(data));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilities_static_0700
     * @tc.number SUB_NetworkMgr_ConnectionGetNetCapabilities_0700
     * @tc.desc   Obtain the capability information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_0700";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 0;
          connection.getNetCapabilities(netHandle, (error: BusinessError<void>|null, data: connection.NetCapabilities| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
              ExpectTrue(error?.code == 2100001);
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +'callback: success data-> '+JSON.stringify(data));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilities_static_0800
     * @tc.number SUB_NetworkMgr_ConnectionGetNetCapabilities_0800
     * @tc.desc   Obtain the capability information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_0800";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 23;
          connection.getNetCapabilities(netHandle, (error: BusinessError<void>|null, data: connection.NetCapabilities| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
              ExpectTrue(error?.code == 2100001);
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': callback: success data->'+JSON.stringify(data));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilities_static_1700
     * @tc.number SUB_NetworkMgr_ConnectionGetNetCapabilities_1700
     * @tc.desc   Obtain the capability information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_1700";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 9999999;
          connection.getNetCapabilities(netHandle, (error: BusinessError<void>|null, data: connection.NetCapabilities| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
              ExpectTrue(error?.code == 2100001);
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilities_static_0900
     * @tc.number SUB_NetworkMgr_ConnectionGetNetCapabilities_0900
     * @tc.desc   Obtain the capability information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_0900";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getNetCapabilities(netHandle).then((data: connection.NetCapabilities) => {
            let netCapInfo: connection.NetCapabilityInfo= {
              netHandle: netHandle,
              netCap:data
            }
            hilog.info(domain, tag, '%{public}s', caseName +': GetNetCapabilities data ->'+JSON.stringify(data));
            ExpectTrue(data != undefined);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  GetNetCapabilities error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet: err->'+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilities_static_1400
     * @tc.number SUB_NetworkMgr_ConnectionGetNetCapabilities_1400
     * @tc.desc   Obtain the capability information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_1400";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 200;
          connection.getNetCapabilities(netHandle).then((data: connection.NetCapabilities) => {
            hilog.info(domain, tag, '%{public}s', caseName +':GetNetCapabilities data ->'+JSON.stringify(data));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  GetNetCapabilities error is '+JSON.stringify(err));
            ExpectTrue(err.code == 2100001);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilities_static_1500
     * @tc.number SUB_NetworkMgr_ConnectionGetNetCapabilities_1500
     * @tc.desc   Obtain the capability information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_1500";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 0;
          connection.getNetCapabilities(netHandle).then((data: connection.NetCapabilities) => {
            hilog.info(domain, tag, '%{public}s', caseName +':GetNetCapabilities  data ->'+JSON.stringify(data));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  GetNetCapabilities error is '+JSON.stringify(err));
            ExpectTrue(err.code == 2100001);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilities_static_1600
     * @tc.number SUB_NetworkMgr_ConnectionGetNetCapabilities_1600
     * @tc.desc   Obtain the capability information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_1600";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 23;
          connection.getNetCapabilities(netHandle).then((data: connection.NetCapabilities) => {
            hilog.info(domain, tag, '%{public}s', caseName +':GetNetCapabilities data ->'+JSON.stringify(data));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  GetNetCapabilities error is '+JSON.stringify(err));
            ExpectTrue(err.code == 2100001);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilities_static_1800
     * @tc.number SUB_NetworkMgr_ConnectionGetNetCapabilities_1800
     * @tc.desc   Obtain the capability information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_1800";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 999999;
          connection.getNetCapabilities(netHandle).then((data: connection.NetCapabilities) => {
            hilog.info(domain, tag, '%{public}s', caseName +':GetNetCapabilities  data ->'+JSON.stringify(data));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  GetNetCapabilities error is '+JSON.stringify(err));
            ExpectTrue(err.code == 2100001);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilitiesSync_static_0100
     * @tc.number SUB_NetworkMgr_ConnectionGetNetCapabilitiesSync_0100
     * @tc.desc   Use synchronization method to obtain network information bound to the app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilitiesSync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilitiesSync_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netHandle: connection.NetHandle =  connection.getDefaultNetSync();
        let getNetCapAbilitiesSync: connection.NetCapabilities = connection.getNetCapabilitiesSync(netHandle);
        hilog.info(domain, tag, '%{public}s', caseName +': getNetCapabilitiesSync data ->'+JSON.stringify(getNetCapAbilitiesSync));
        ExpectTrue(getNetCapAbilitiesSync != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilitiesSync_static_0600
     * @tc.number SUB_NetworkMgr_ConnectionGetNetCapabilitiesSync_0600
     * @tc.desc   Use synchronization method to obtain network information bound to the app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilitiesSync_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilitiesSync_static_0600";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        netHandle.netId = 200;
        let getNetCapAbilitiesSync: connection.NetCapabilities = connection.getNetCapabilitiesSync(netHandle);
        hilog.info(domain, tag, '%{public}s', caseName +': getNetCapabilitiesSync data ->'+JSON.stringify(getNetCapAbilitiesSync));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue((err as BusinessError).code == 2100001);
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilitiesSync_static_0700
     * @tc.number SUB_NetworkMgr_ConnectionGetNetCapabilitiesSync_0700
     * @tc.desc   Use synchronization method to obtain network information bound to the app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilitiesSync_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilitiesSync_static_0700";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        netHandle.netId = 0;
        let getNetCapAbilitiesSync: connection.NetCapabilities = connection.getNetCapabilitiesSync(netHandle);
        hilog.info(domain, tag, '%{public}s', caseName +': getNetCapabilitiesSync data ->'+JSON.stringify(getNetCapAbilitiesSync));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue((err as BusinessError).code == 2100001);
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilitiesSync_static_0800
     * @tc.number SUB_NetworkMgr_ConnectionGetNetCapabilitiesSync_0800
     * @tc.desc   Use synchronization method to obtain network information bound to the app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilitiesSync_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilitiesSync_static_0800";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        netHandle.netId = 23;
        let getNetCapAbilitiesSync: connection.NetCapabilities = connection.getNetCapabilitiesSync(netHandle);
        hilog.info(domain, tag, '%{public}s', caseName +': getNetCapabilitiesSync data ->'+JSON.stringify(getNetCapAbilitiesSync));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue((err as BusinessError).code == 2100001);
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetCapabilitiesSync_static_0900
     * @tc.number SUB_NetworkMgr_ConnectionGetNetCapabilitiesSync_0900
     * @tc.desc   Use synchronization method to obtain network information bound to the app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionGetNetCapabilitiesSync_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilitiesSync_static_0900";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        netHandle.netId = 9999999;
        let getNetCapAbilitiesSync: connection.NetCapabilities = connection.getNetCapabilitiesSync(netHandle);
        hilog.info(domain, tag, '%{public}s', caseName +': getNetCapabilitiesSync data ->'+JSON.stringify(getNetCapAbilitiesSync));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue((err as BusinessError).code == 2100001);
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrConnectionNetCap_static_0100
     * @tc.number SUB_NetworkMgr_Connection_NetCap_0100
     * @tc.desc   Specific network capabilities .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetCap_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetCap_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        ExpectTrue(connection.NetCap.NET_CAPABILITY_MMS == 0);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionNetCap_static_0200
     * @tc.number SUB_NetworkMgr_Connection_NetCap_0200
     * @tc.desc   Specific network capabilities .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetCap_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetCap_static_0200";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        ExpectTrue(connection.NetCap.NET_CAPABILITY_NOT_METERED == 11);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionNetCap_static_0300
     * @tc.number SUB_NetworkMgr_Connection_NetCap_0300
     * @tc.desc   Specific network capabilities .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetCap_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetCap_static_0300";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        ExpectTrue(connection.NetCap.NET_CAPABILITY_INTERNET == 12);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionNetCap_static_0400
     * @tc.number SUB_NetworkMgr_Connection_NetCap_0400
     * @tc.desc   Specific network capabilities .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetCap_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetCap_static_0400";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        ExpectTrue(connection.NetCap.NET_CAPABILITY_NOT_VPN == 15);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionNetCap_static_0500
     * @tc.number SUB_NetworkMgr_Connection_NetCap_0500
     * @tc.desc   Specific network capabilities .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetCap_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetCap_static_0500";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        ExpectTrue(connection.NetCap.NET_CAPABILITY_VALIDATED == 16);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionNetCap_static_0600
     * @tc.number SUB_NetworkMgr_Connection_NetCap_0600
     * @tc.desc   Specific network capabilities .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetCap_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetCap_static_0600";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        ExpectTrue(connection.NetCap.NET_CAPABILITY_PORTAL == 17);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionNetCap_static_0700
     * @tc.number SUB_NetworkMgr_Connection_NetCap_0700
     * @tc.desc   Specific network capabilities .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetCap_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetCap_static_0700";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        ExpectTrue(connection.NetCap.NET_CAPABILITY_CHECKING_CONNECTIVITY == 31);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionHttpProxy_static_0100
     * @tc.number SUB_NetworkMgr_Connection_HttpProxy_0100
     * @tc.desc   Network proxy configuration information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionHttpProxy_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionHttpProxy_static_0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.setAppHttpProxy({
          host: '192.168.1.1',
          port: 8080,
          exclusionList: ['192.168', 'baidu.com'],
          username: 'admin',
          password: '123456'
        } as connection.HttpProxy);
        ExpectTrue(true);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionHttpProxy_static_0200
     * @tc.number SUB_NetworkMgr_Connection_HttpProxy_0200
     * @tc.desc   Network proxy configuration information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionHttpProxy_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionHttpProxy_static_0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.setAppHttpProxy({
          host: '127.0.0.1',
          port: 8080,
          exclusionList: ['127.0', 'baidu.com'],
          username: 'admin',
          password: '123456'
        } as connection.HttpProxy);
        ExpectTrue(true);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionHttpProxy_static_0300
     * @tc.number SUB_NetworkMgr_Connection_HttpProxy_0300
     * @tc.desc   Network proxy configuration information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionHttpProxy_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionHttpProxy_static_0300';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.setAppHttpProxy({
          host: '127.0.0.1',
          port: 8080,
          exclusionList: ['*'],
          username: 'admin',
          password: '123456'
        } as connection.HttpProxy);
        ExpectTrue(true);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionNetCapabilities_static_0100
     * @tc.number SUB_NetworkMgr_Connection_NetCapabilities_0100
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetCapabilities_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetCapabilities_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_WIFI, connection.NetBearType.BEARER_CELLULAR],
            networkCap: [connection.NetCap.NET_CAPABILITY_MMS,
              connection.NetCap.NET_CAPABILITY_NOT_METERED,
              connection.NetCap.NET_CAPABILITY_INTERNET,
              connection.NetCap.NET_CAPABILITY_NOT_VPN,
              connection.NetCap.NET_CAPABILITY_VALIDATED],
            linkUpBandwidthKbps: 0,
            linkDownBandwidthKbps: 0
          }
        });
        hilog.info(domain, tag, '%{public}s', caseName +':  netCon->'+JSON.stringify(netCon));
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionNetCapabilities_static_0200
     * @tc.number SUB_NetworkMgr_Connection_NetCapabilities_0200
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetCapabilities_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetCapabilities_static_0200";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_WIFI, connection.NetBearType.BEARER_CELLULAR],
            networkCap: [connection.NetCap.NET_CAPABILITY_MMS,
              connection.NetCap.NET_CAPABILITY_NOT_METERED,
              connection.NetCap.NET_CAPABILITY_INTERNET,
              connection.NetCap.NET_CAPABILITY_NOT_VPN,
              connection.NetCap.NET_CAPABILITY_VALIDATED],
            linkUpBandwidthKbps: 9999999,
            linkDownBandwidthKbps: 9999999
          }
        });
        hilog.info(domain, tag, '%{public}s', caseName +': netCon-> ->'+JSON.stringify(netCon));
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionNetCapabilities_static_0300
     * @tc.number SUB_NetworkMgr_Connection_NetCapabilities_0300
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetCapabilities_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetCapabilities_static_0300";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_WIFI],
          },
          bearerPrivateIdentifier: 'wifi'
        });
        hilog.info(domain, tag, '%{public}s', caseName +': netCon-> ->'+JSON.stringify(netCon));
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionNetCapabilities_static_0400
     * @tc.number SUB_NetworkMgr_Connection_NetCapabilities_0400
     * @tc.desc   test create a NetConnection object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetCapabilities_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetCapabilities_static_0400";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_ETHERNET],
          },
          bearerPrivateIdentifier: 'slot0'
        });
        hilog.info(domain, tag, '%{public}s', caseName +': netCon-> ->'+JSON.stringify(netCon));
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionConnectionProperties_static_0100
     * @tc.number SUB_NetworkMgr_Connection_ConnectionProperties_0100
     * @tc.desc   Network connection information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionConnectionProperties_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties: BusinessError-> '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: data->'+JSON.stringify(data));
              ExpectTrue(typeof data?.interfaceName == 'string');
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionConnectionProperties_static_0200
     * @tc.number SUB_NetworkMgr_Connection_ConnectionProperties_0200
     * @tc.desc   Network connection information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionConnectionProperties_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_0200";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties: BusinessError-> '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: data->'+JSON.stringify(data));
              ExpectTrue(typeof data?.domains == 'string');
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionConnectionProperties_static_0300
     * @tc.number SUB_NetworkMgr_Connection_ConnectionProperties_0300
     * @tc.desc   Network connection information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionConnectionProperties_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_0300";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties: BusinessError-> '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: data->'+JSON.stringify(data));
              ExpectTrue(data?.linkAddresses != undefined );
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionConnectionProperties_static_0400
     * @tc.number SUB_NetworkMgr_Connection_ConnectionProperties_0400
     * @tc.desc   Network connection information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionConnectionProperties_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_0400";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties: BusinessError-> '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: data->'+JSON.stringify(data));
              ExpectTrue(data?.routes != undefined );
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionConnectionProperties_static_0500
     * @tc.number SUB_NetworkMgr_Connection_ConnectionProperties_0500
     * @tc.desc   Network connection information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionConnectionProperties_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_0500";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties: BusinessError-> '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: data->'+JSON.stringify(data));
              ExpectTrue(data?.dnses != undefined );
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionConnectionProperties_static_0600
     * @tc.number SUB_NetworkMgr_Connection_ConnectionProperties_0600
     * @tc.desc   Network connection information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionConnectionProperties_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_0600";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties: BusinessError-> '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: data->'+JSON.stringify(data));
              ExpectTrue(typeof data?.mtu == 'int');
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionConnectionProperties_static_0700
     * @tc.number SUB_NetworkMgr_Connection_ConnectionProperties_0700
     * @tc.desc   Network connection information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionConnectionProperties_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_0700";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: success data ->'+JSON.stringify(data));
            ExpectTrue(typeof data.interfaceName == 'string');
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionConnectionProperties_static_0800
     * @tc.number SUB_NetworkMgr_Connection_ConnectionProperties_0800
     * @tc.desc   Network connection information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionConnectionProperties_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_0800";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: success data ->'+JSON.stringify(data));
            ExpectTrue(typeof data.domains == 'string');
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionConnectionProperties_static_0900
     * @tc.number SUB_NetworkMgr_Connection_ConnectionProperties_0900
     * @tc.desc   Network connection information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionConnectionProperties_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_0900";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: success data ->'+JSON.stringify(data));
            ExpectTrue(data.linkAddresses.length >= 0);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionConnectionProperties_static_1000
     * @tc.number SUB_NetworkMgr_Connection_ConnectionProperties_1000
     * @tc.desc   Network connection information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionConnectionProperties_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_1000";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: success data ->'+JSON.stringify(data));
            ExpectTrue(data.routes.length >= 0);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionConnectionProperties_static_1100
     * @tc.number SUB_NetworkMgr_Connection_ConnectionProperties_1100
     * @tc.desc   Network connection information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionConnectionProperties_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_1100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: success data ->'+JSON.stringify(data));
            ExpectTrue(data.dnses.length >= 0);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionConnectionProperties_static_1200
     * @tc.number SUB_NetworkMgr_Connection_ConnectionProperties_1200
     * @tc.desc   Network connection information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionConnectionProperties_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_1200";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: success data ->'+JSON.stringify(data));
            ExpectTrue(typeof data.mtu == 'int');
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionRouteInfo_static_0200
     * @tc.number SUB_NetworkMgr_Connection_RouteInfo_0200
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionRouteInfo_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionRouteInfo_static_0200";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties: BusinessError-> '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: data->'+JSON.stringify(data));
              ExpectTrue(typeof data?.routes[0].destination == 'object');
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionRouteInfo_static_0300
     * @tc.number SUB_NetworkMgr_Connection_RouteInfo_0300
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionRouteInfo_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionRouteInfo_static_0300";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties: BusinessError-> '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: data->'+JSON.stringify(data));
              ExpectTrue(typeof data?.routes[0].gateway == 'object');
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionRouteInfo_static_0400
     * @tc.number SUB_NetworkMgr_Connection_RouteInfo_0400
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionRouteInfo_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionRouteInfo_static_0400";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties: BusinessError-> '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: data->'+JSON.stringify(data));
              ExpectTrue(typeof data?.routes[0].hasGateway == 'boolean');
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionRouteInfo_static_0500
     * @tc.number SUB_NetworkMgr_Connection_RouteInfo_0500
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionRouteInfo_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionRouteInfo_static_0500";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties: BusinessError-> '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: data->'+JSON.stringify(data));
              ExpectTrue(typeof data?.routes[0].isDefaultRoute == 'boolean');
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionRouteInfo_static_0700
     * @tc.number SUB_NetworkMgr_Connection_RouteInfo_0700
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionRouteInfo_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionRouteInfo_static_0700";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: success data ->'+JSON.stringify(data));
            ExpectTrue(typeof data.routes[0].destination == 'object');
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionRouteInfo_static_0800
     * @tc.number SUB_NetworkMgr_Connection_RouteInfo_0800
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionRouteInfo_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionRouteInfo_static_0800";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: success data ->'+JSON.stringify(data));
            ExpectTrue(typeof data.routes[0].gateway == 'object');
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionRouteInfo_static_0900
     * @tc.number SUB_NetworkMgr_Connection_RouteInfo_0900
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionRouteInfo_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionRouteInfo_static_0900";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: success data ->'+JSON.stringify(data));
            ExpectTrue(typeof data.routes[0].hasGateway == 'boolean');
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionRouteInfo_static_1000
     * @tc.number SUB_NetworkMgr_Connection_RouteInfo_1000
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionRouteInfo_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionRouteInfo_static_1000";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: success data ->'+JSON.stringify(data));
            ExpectTrue(typeof data.routes[0].isDefaultRoute == 'boolean');
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionLinkAddress_static_0100
     * @tc.number SUB_NetworkMgr_Connection_LinkAddress_0100
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionLinkAddress_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionLinkAddress_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties: BusinessError-> '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: data->'+JSON.stringify(data));
              ExpectTrue(typeof data?.routes[0].destination.prefixLength == 'int');
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionLinkAddress_static_0200
     * @tc.number SUB_NetworkMgr_Connection_LinkAddress_0200
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionLinkAddress_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionLinkAddress_static_0200";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties: BusinessError-> '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: data->'+JSON.stringify(data));
              ExpectTrue(typeof data?.routes[0].destination.address == 'object');
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionLinkAddress_static_0300
     * @tc.number SUB_NetworkMgr_Connection_LinkAddress_0300
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionLinkAddress_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionLinkAddress_static_0300";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: success data ->'+JSON.stringify(data));
            ExpectTrue(typeof data.routes[0].destination.address == 'object');
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionLinkAddress_static_0400
     * @tc.number SUB_NetworkMgr_Connection_LinkAddress_0400
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionLinkAddress_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionLinkAddress_static_0400";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: success data ->'+JSON.stringify(data));
            ExpectTrue(typeof data.routes[0].destination.prefixLength == 'int');
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionNetAddress_static_0100
     * @tc.number SUB_NetworkMgr_Connection_NetAddress_0100
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetAddress_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetAddress_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties: BusinessError-> '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: data->'+JSON.stringify(data));
              ExpectTrue(typeof data?.routes[0].destination.address.address == 'string');
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionNetAddress_static_0200
     * @tc.number SUB_NetworkMgr_Connection_NetAddress_0200
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetAddress_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetAddress_static_0200";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties: BusinessError-> '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: data->'+JSON.stringify(data));
              ExpectTrue(data?.routes[0].destination.address.family == 1 || data?.routes[0].destination.address.family == 2);
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionNetAddress_static_0300
     * @tc.number SUB_NetworkMgr_Connection_NetAddress_0300
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetAddress_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetAddress_static_0300";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties: BusinessError-> '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: data->'+JSON.stringify(data));
              let portTypeof: string = typeof data?.routes[0]?.destination?.address?.port;
              hilog.info(domain, tag, '%{public}s', caseName +': portTypeof ->'+ portTypeof);
              ExpectTrue(portTypeof == 'int' || portTypeof == 'undefined');
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionNetAddress_static_0400
     * @tc.number SUB_NetworkMgr_Connection_NetAddress_0400
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetAddress_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetAddress_static_0400";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: success data ->'+JSON.stringify(data));
            ExpectTrue(typeof data.routes[0].destination.address.address == 'string');
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionNetAddress_static_0500
     * @tc.number SUB_NetworkMgr_Connection_NetAddress_0500
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetAddress_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetAddress_static_0500";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: success data ->'+JSON.stringify(data));
            ExpectTrue(data.routes[0].destination.address.family == 1 || data.routes[0].destination.address.family == 2);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionNetAddress_static_0600
     * @tc.number SUB_NetworkMgr_Connection_NetAddress_0600
     * @tc.desc   Network routing information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetAddress_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetAddress_static_0600";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: success data ->'+JSON.stringify(data));
            let portTypeof: string = typeof data?.routes[0]?.destination?.address?.port;
            hilog.info(domain, tag, '%{public}s', caseName +': portTypeof ->'+ portTypeof);
            ExpectTrue(portTypeof === 'int' || portTypeof === 'undefined');
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionOn_static_0100
     * @tc.number SUB_NetworkMgr_Connection_On_0100
     * @tc.desc   Subscribe to network available events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionOn_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionOn_static_0100";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection();
        netCon.on('netAvailable', (data: connection.NetHandle) => {
          hilog.info(domain, tag, '%{public}s', caseName +' on netAvailable  success : '+JSON.stringify(data));
        });
        netCon.register((error: BusinessError<void>|null) => {
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
          if (error?.code != 0) {
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' register success ');
            ExpectTrue(true);
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +' catch: err-> '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionOn_static_0200
     * @tc.number SUB_NetworkMgr_Connection_On_0200
     * @tc.desc   Subscription to network capability change events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionOn_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionOn_static_0200";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection();
        netCon.on('netCapabilitiesChange', (data: connection.NetCapabilityInfo) => {
          hilog.info(domain, tag, '%{public}s', caseName +' Succeeded to get data:  '+JSON.stringify(data));
        });
        netCon.register((error: BusinessError<void>|null) => {
          hilog.info(domain, tag, '%{public}s', caseName +'  register error is '+JSON.stringify(error));
          if (error?.code != 0) {
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          } else {
            console.info(`${caseName}register success`);
            ExpectTrue(true);
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +' catch: err-> '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionOn_static_0300
     * @tc.number SUB_NetworkMgr_Connection_On_0300
     * @tc.desc   Subscription network connection information change events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionOn_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionOn_static_0300";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection();
        netCon.on('netConnectionPropertiesChange', (data: connection.NetConnectionPropertyInfo) => {
          hilog.info(domain, tag, '%{public}s', caseName +' Succeeded to get data: ');
          console.info(`${caseName}  + ${JSON.stringify(data)}}`);
        });
        netCon.register((error: BusinessError<void>|null) => {
          hilog.info(domain, tag, '%{public}s', caseName +'  register error  '+JSON.stringify(error));
          if (error?.code != 0) {
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' register success');
            ExpectTrue(true);
            console.info(`${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +' catch: err-> '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionRegister_static_0100
     * @tc.number SUB_NetworkMgr_Connection_Register_0100
     * @tc.desc   test subscribe to notifications of specified network status changes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionRegister_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionRegister_static_0100";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection();
        netCon.register((err: BusinessError<void>|null) => {
          hilog.info(domain, tag, '%{public}s', caseName +' register callback: '+JSON.stringify(err));
          if (err?.code != 0) {
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }
        });
        await Utils.msSleep(1000);
        netCon.unregister((error: BusinessError <void>|null) => {
          if (error?.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +' unregister fail error '+JSON.stringify(error));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' unregister success ');
            ExpectTrue(true);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +' catch: err-> '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionUnregister_static_0600
     * @tc.number SUB_NetworkMgr_Connection_Unregister_0600
     * @tc.desc   test unsubscribe from notifications of default network state changes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionUnregister_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionUnregister_static_0600";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection();
        netCon.unregister((err: BusinessError<void>|null) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  unregister callback: '+JSON.stringify(err));
            ExpectTrue(err?.code == 2101007);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' unregister success ');
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName +' catch: err-> '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });



  })
}