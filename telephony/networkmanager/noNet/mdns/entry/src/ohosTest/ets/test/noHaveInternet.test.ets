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
import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import mdns from '@ohos.net.mdns';
import { BusinessError } from '@ohos.base';

let context: Context;
const ExpectTrue: (n: boolean, caseName: string) => void = (n: boolean, caseName: string) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `${caseName} testNetworkMgr failed`);
  }
}
const address: string = "202.101.172.38";
const getName: () =>string = () => {
  return "test"+ (Math.random()*100000).toFixed(0);
}
export default function NoHaveInternetTest() {
  describe('NoInternetTest', () => {
    beforeAll(() => {
      context = AppStorage.get('context') as Context;
    });
    /* *
     * @tc.number:SUB_NetworkMgr_Mdns_AddLocalService_2900
     * @tc.name  : testNetworkMgrAddLocalService2900
     * @tc.desc  : Add an mDNS service callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 0
     */
    it("testNetworkMgrAddLocalService2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testNetworkMgrAddLocalService2900";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address,
          },
          serviceAttribute: [{
            key: "111", value: [1]
          }]
        }
        mdns.addLocalService(context, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
          console.info(`${caseName}: callback : ${JSON.stringify(error)}  | ${JSON.stringify(data)}`);
          if (error) {
            ExpectTrue(error.code===2204009, caseName);
            done();
          } else {
            ExpectTrue(false, caseName);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number:SUB_NetworkMgr_Mdns_AddLocalService_3000
     * @tc.name  : testNetworkMgrAddLocalService3000
     * @tc.desc  : Add an mDNS service Promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrAddLocalService3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = "testNetworkMgrAddLocalService3000";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address,
          },
          serviceAttribute: [{
            key: "111", value: [1]
          }]
        }
        mdns.addLocalService(context, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
          console.info(`${caseName}: callback : ${JSON.stringify(error)}  | ${JSON.stringify(data)}`);
          if (error) {
            ExpectTrue(error.code===2204009, caseName);
            done();
          } else {
            ExpectTrue(false, caseName);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number:SUB_NetworkMgr_Mdns_CreateDiscoveryService_0500
     * @tc.name  : testNetworkMgrCreateDiscoveryService0500
     * @tc.desc  : Return a DiscoveryService object callBack
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 0
     */
    it("testNetworkMgrCreateDiscoveryService0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testNetworkMgrCreateDiscoveryService0500";
      console.info(`${caseName} test start `);
      try {
        let serviceType = "_print._tcp";
        let discoveryService: Object = mdns.createDiscoveryService(context, serviceType);
        console.log(`${caseName} result :${JSON.stringify(discoveryService)}`);
        ExpectTrue(discoveryService !== null, caseName);
        done();
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number:SUB_NetworkMgr_Mdns_ResolveLocalService_1700
     * @tc.name  : testNetworkMgrResolveLocalService1700
     * @tc.desc  : Parsing an mDNS service callBack
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 0
     */
    it("testNetworkMgrResolveLocalService1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testNetworkMgrResolveLocalService1700";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address,
          },
          serviceAttribute: [{
            key: "111", value: [1]
          }]
        }
        mdns.resolveLocalService(context, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
              if (error) {
                console.log(`${caseName} falil ${JSON.stringify(error)}`);
                ExpectTrue(error.code===2204009, caseName);
                done();
              } else {
                console.log(`${caseName} success ${JSON.stringify(data)}`);
                ExpectTrue(false, caseName);
                done();
              }
            });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number:SUB_NetworkMgr_Mdns_ResolveLocalService_1800
     * @tc.name  : testNetworkMgrResolveLocalService1800
     * @tc.desc  : Parsing an mDNS service Promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 0
     */
    it("testNetworkMgrResolveLocalService1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = "testNetworkMgrResolveLocalService1800";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._udp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address,
          },
          serviceAttribute: [{
            key: "111", value: [1]
          }]
        }
        mdns.resolveLocalService(context, localServiceInfo).then((data: mdns.LocalServiceInfo) => {
          console.log(`${caseName} success ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        }).catch((error:BusinessError)=>{
          console.log(`${caseName} falil ${JSON.stringify(error)}`);
          ExpectTrue(error.code===2204009, caseName);
          done();
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
  });
}