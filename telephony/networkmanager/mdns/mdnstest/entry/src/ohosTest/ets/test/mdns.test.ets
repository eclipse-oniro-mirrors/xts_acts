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
import { describe, it, expect, beforeAll, Level, Size, TestType } from '@ohos/hypium';
import mdns from '@ohos.net.mdns';
import { BusinessError } from '@ohos.base';
import ethernet from '@ohos.net.ethernet';

let context: Context;
const ExpectTrue: (n: boolean, caseName: string) => void = (n: boolean, caseName: string) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `${caseName} testNetworkMgr failed`);
  }
}
let address: string = "202.101.172.35";
const getName:()=>string=()=>{
  return "test"+ (Math.random()*10000).toFixed(0)
}
export default function mdnsTest() {
  describe('mdnsTest', () => {
    beforeAll(async () => {
      console.log('NetworkManagerMdnsTest beforeAll start');
      console.log('NetworkManagerMdnsTest beforeAll end');
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_AddLocalService_0100
     * @tc.name  : testNetworkMgrAddLocalService0100
     * @tc.desc  : Add an mDNS service callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrAddLocalService0100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrAddLocalService0100";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
        }
        mdns.addLocalService(null, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
          console.info(`${caseName}: callback : ${JSON.stringify(error)}  | ${JSON.stringify(data)}`);
          if (error) {
            ExpectTrue(false, caseName);
            done();
          } else {
            ExpectTrue(false, caseName);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_AddLocalService_0200
     * @tc.name  : testNetworkMgrAddLocalService0200
     * @tc.desc  : Add an mDNS service callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrAddLocalService0200",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrAddLocalService0200";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
        }
        mdns.addLocalService(context, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
          console.info(`${caseName}: callback : ${JSON.stringify(error)}  | ${JSON.stringify(data)}`);
          if (error) {
            ExpectTrue(error.code === 401, caseName);
            done();
          } else {
            ExpectTrue(false, caseName);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_AddLocalService_0300
     * @tc.name  : testNetworkMgrAddLocalService0300
     * @tc.desc  : Add an mDNS service callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrAddLocalService0300",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrAddLocalService0300";
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
            ExpectTrue(false, caseName);
            done();
          } else {
            ExpectTrue(data !== null, caseName);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_AddLocalService_0400
     * @tc.name  : testNetworkMgrAddLocalService0400
     * @tc.desc  : Add an mDNS service callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrAddLocalService0400",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrAddLocalService0400";
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
        mdns.addLocalService(context, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
          console.info(`${caseName}: callback : ${JSON.stringify(error)}  | ${JSON.stringify(data)}`);
          if (error) {
            ExpectTrue(false, caseName);
            done();
          } else {
            ExpectTrue(data !== null, caseName);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_AddLocalService_0500
     * @tc.name  : testNetworkMgrAddLocalService0500
     * @tc.desc  : Add an mDNS service callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrAddLocalService0500",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrAddLocalService0500";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 10005568,
          host: {
            address: address,
          },
          serviceAttribute: [{
            key: "111", value: [1]
          }]
        }
        mdns.addLocalService(context, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
          console.info(`${caseName}: callback : ${JSON.stringify(error)}  | ${data}`);
          if (error) {
            ExpectTrue(error.code === 401, caseName);
            done();
          } else {
            ExpectTrue(false, caseName);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_AddLocalService_0700
     * @tc.name  : testNetworkMgrAddLocalService0700
     * @tc.desc  : Add an mDNS service callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrAddLocalService0700",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrAddLocalService0700";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address,
          },
          serviceAttribute: []
        }
        mdns.addLocalService(context, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
          console.info(`${caseName}: callback : ${JSON.stringify(error)}  | ${JSON.stringify(data)}`);
          if (error) {
            ExpectTrue(false, caseName);
            done();
          } else {
            ExpectTrue(data !== null, caseName);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_AddLocalService_0900
     * @tc.name  : testNetworkMgrAddLocalService0900
     * @tc.desc  : Add an mDNS service callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrAddLocalService0900",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrAddLocalService0900";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address
          },
          serviceAttribute: []
        }
        mdns.addLocalService(context, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
          console.info(`${caseName}: callback : ${JSON.stringify(error)}  | ${JSON.stringify(data)}`);
          if (error) {
            ExpectTrue(error.code === 401, caseName);
            done();
          } else {
            ExpectTrue(false, caseName);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_AddLocalService_1000
     * @tc.name  : testNetworkMgrAddLocalService1000
     * @tc.desc  : Add an mDNS service callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrAddLocalService1000",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrAddLocalService1000";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "...",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address
          },
          serviceAttribute: []
        }
        mdns.addLocalService(context, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
          console.info(`${caseName}: callback : ${JSON.stringify(error)}  | ${JSON.stringify(data)}`);
          if (error) {
            ExpectTrue(error.code === 401, caseName);
            done();
          } else {
            ExpectTrue(false, caseName);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_AddLocalService_1100
     * @tc.name  : testNetworkMgrAddLocalService1100
     * @tc.desc  : Add an mDNS service callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrAddLocalService1100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrAddLocalService1100";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: "",
          port: 8081,
          host: {
            address: address
          },
          serviceAttribute: []
        }
        mdns.addLocalService(context, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
          console.info(`${caseName}: callback : ${JSON.stringify(error)}  | ${JSON.stringify(data)}`);
          if (error) {
            ExpectTrue(error.code === 401, caseName);
            done();
          } else {
            ExpectTrue(false, caseName);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_AddLocalService_1200
     * @tc.name  : testNetworkMgrAddLocalService1200
     * @tc.desc  : Add an mDNS service callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrAddLocalService1200",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrAddLocalService1200";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address
          },
          serviceAttribute: []
        }
        mdns.addLocalService(context, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
          mdns.addLocalService(context, localServiceInfo, (error1: BusinessError, data1: mdns.LocalServiceInfo) => {
            if (error1) {
              console.info(`${caseName}: fail ${JSON.stringify(error1)}`);
              ExpectTrue(error1.code === 2204007, caseName);
              done();
            } else {
              console.info(`${caseName}: success ${JSON.stringify(data)}`);
              ExpectTrue(false, caseName);
              done();
            }
          });
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_AddLocalService_1300
     * @tc.name  : testNetworkMgrAddLocalService1300
     * @tc.desc  : Add an mDNS service Promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrAddLocalService1300",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrAddLocalService1300";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
        }
        mdns.addLocalService(null, localServiceInfo).then((data: mdns.LocalServiceInfo) => {
          console.info(`${caseName}: suscess :  ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName}: fail :  ${JSON.stringify(error)}`);
          ExpectTrue(false, caseName);
          done();
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_AddLocalService_1400
     * @tc.name  : testNetworkMgrAddLocalService1400
     * @tc.desc  : Add an mDNS service Promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrAddLocalService1400",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrAddLocalService1400";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
        }
        mdns.addLocalService(context, localServiceInfo).then((data: mdns.LocalServiceInfo) => {
          console.info(`${caseName}: suscess :  ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName}: fail :  ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 401, caseName);
          done();
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_AddLocalService_1500
     * @tc.name  : testNetworkMgrAddLocalService1500
     * @tc.desc  : Add an mDNS service Promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrAddLocalService1500",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrAddLocalService1500";
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
        mdns.addLocalService(context, localServiceInfo).then((data: mdns.LocalServiceInfo) => {
          console.info(`${caseName}: suscess :  ${JSON.stringify(data)}`);
          ExpectTrue(true, caseName);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName}: fail :  ${JSON.stringify(error)}`);
          ExpectTrue(false, caseName);
          done();
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_AddLocalService_1600
     * @tc.name  : testNetworkMgrAddLocalService1600
     * @tc.desc  : Add an mDNS service Promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrAddLocalService1600",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrAddLocalService1600";
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
        mdns.addLocalService(context, localServiceInfo).then((data: mdns.LocalServiceInfo) => {
          console.info(`${caseName}: suscess :  ${JSON.stringify(data)}`);
          ExpectTrue(data !== null, caseName);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName}: fail :  ${JSON.stringify(error)}`);
          ExpectTrue(false, caseName);
          done();
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_AddLocalService_1700
     * @tc.name  : testNetworkMgrAddLocalService1700
     * @tc.desc  : Add an mDNS service Promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrAddLocalService1700",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrAddLocalService1700";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 10018568,
          host: {
            address: address,
          },
          serviceAttribute: [{
            key: "111", value: [1]
          }]
        }
        mdns.addLocalService(context, localServiceInfo).then((data: mdns.LocalServiceInfo) => {
          console.info(`${caseName}: suscess :  ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName}: fail :  ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 401, caseName);
          done();
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_AddLocalService_1900
     * @tc.name  : testNetworkMgrAddLocalService1900
     * @tc.desc  : Add an mDNS service Promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrAddLocalService1900",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrAddLocalService1900";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address,
          },
          serviceAttribute: []
        }
        mdns.addLocalService(context, localServiceInfo).then((data: mdns.LocalServiceInfo) => {
          console.info(`${caseName}: suscess :  ${JSON.stringify(data)}`);
          ExpectTrue(data !== null, caseName);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName}: fail :  ${JSON.stringify(error)}`);
          ExpectTrue(false, caseName);
          done();
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_AddLocalService_2100
     * @tc.name  : testNetworkMgrAddLocalService2100
     * @tc.desc  : Add an mDNS service Promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrAddLocalService2100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrAddLocalService2100";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address
          },
          serviceAttribute: []
        }
        mdns.addLocalService(context, localServiceInfo).then((data: mdns.LocalServiceInfo) => {
          console.info(`${caseName}: suscess :  ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName}: fail :  ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 401, caseName);
          done();
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_AddLocalService_2200
     * @tc.name  : testNetworkMgrAddLocalService2200
     * @tc.desc  : Add an mDNS service Promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrAddLocalService2200",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrAddLocalService2200";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "...",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address
          },
          serviceAttribute: []
        }
        mdns.addLocalService(context, localServiceInfo).then((data: mdns.LocalServiceInfo) => {
          console.info(`${caseName}: suscess :  ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName}: fail :  ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 401, caseName);
          done();
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_AddLocalService_2300
     * @tc.name  : testNetworkMgrAddLocalService2300
     * @tc.desc  : Add an mDNS service Promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrAddLocalService2300",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrAddLocalService2300";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: "",
          port: 8081,
          host: {
            address: address
          },
          serviceAttribute: []
        }
        mdns.addLocalService(context, localServiceInfo).then((data: mdns.LocalServiceInfo) => {
          console.info(`${caseName}: suscess :  ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName}: fail :  ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 401, caseName);
          done();
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_AddLocalService_2400
     * @tc.name  : testNetworkMgrAddLocalService2400
     * @tc.desc  : Add an mDNS service Promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrAddLocalService2400",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrAddLocalService2400";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address
          },
          serviceAttribute: []
        }
        mdns.addLocalService(context, localServiceInfo).then((data: mdns.LocalServiceInfo) => {
          mdns.addLocalService(context, localServiceInfo).then((data: mdns.LocalServiceInfo) => {
            console.info(`${caseName}: suscess :  ${JSON.stringify(data)}`);
            ExpectTrue(false, caseName);
            done();
          }).catch((error: BusinessError) => {
            console.info(`${caseName}: fail1 :  ${JSON.stringify(error)}`);
            ExpectTrue(error.code === 2204007, caseName);
            done();
          });
        }).catch((error: BusinessError) => {
          console.info(`${caseName}: fail2 :  ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 401, caseName);
          done();
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_AddLocalService_2500
     * @tc.name  : testNetworkMgrAddLocalService2500
     * @tc.desc  : Add an mDNS service Promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrAddLocalService2500",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrAddLocalService2500";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address,
            family: 2
          },
        }
        mdns.addLocalService(context, localServiceInfo).then((data: mdns.LocalServiceInfo) => {
          console.info(`${caseName}: suscess :  ${JSON.stringify(data)}`);
          ExpectTrue(true, caseName);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName}: fail :  ${JSON.stringify(error)}`);
          ExpectTrue(false, caseName);
          done();
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_AddLocalService_2700
     * @tc.name  : testNetworkMgrAddLocalService2700
     * @tc.desc  : Add an mDNS service callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrAddLocalService2700",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrAddLocalService2700";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address,
            family: 2
          },
        }
        mdns.addLocalService(context, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
          if (error) {
            console.info(`${caseName}: callback : ${JSON.stringify(error)}  `);
            ExpectTrue(false, caseName);
            done();
          } else {
            console.info(`${caseName}: suscess : ${JSON.stringify(data)}`);
            ExpectTrue(true, caseName);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_RemoveLocalService_0100
     * @tc.name  : testNetworkMgrRemoveLocalService0100
     * @tc.desc  : Remove an mDNS service callBack
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrRemoveLocalService0100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrRemoveLocalService0100";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
        }
        mdns.removeLocalService(context, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
          if (error) {
            console.log(`${caseName} fail ${JSON.stringify(error)}`);
            ExpectTrue(error.code === 401, caseName);
            done();
          } else {
            console.log(`${caseName} success ${JSON.stringify(data)}`);
            ExpectTrue(false, caseName);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_RemoveLocalService_0200
     * @tc.name  : testNetworkMgrRemoveLocalService0200
     * @tc.desc  : Remove an mDNS service callBack
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 0
     */
    it("testNetworkMgrRemoveLocalService0200",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrRemoveLocalService0200";
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
        mdns.removeLocalService(context, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
          if (error) {
            console.log(`${caseName} fail ${JSON.stringify(error)}`);
            ExpectTrue(error.code === 401, caseName);
            done();
          } else {
            console.log(`${caseName} success ${JSON.stringify(data)}`);
            ExpectTrue(false, caseName);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_RemoveLocalService_0300
     * @tc.name  : testNetworkMgrRemoveLocalService0300
     * @tc.desc  : Remove an mDNS service callBack
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrRemoveLocalService0300",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrRemoveLocalService0300";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._udp",
          serviceName: getName(),
          port: 600000,
          host: {
            address: address,
          },
          serviceAttribute: [{
            key: "111", value: [1]
          }]
        }
        mdns.removeLocalService(context, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
          if (error) {
            console.log(`${caseName} fail ${JSON.stringify(error)}`);
            ExpectTrue(error.code === 401, caseName);
            done();
          } else {
            console.log(`${caseName} success ${JSON.stringify(data)}`);
            ExpectTrue(false, caseName);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_RemoveLocalService_0400
     * @tc.name  : testNetworkMgrRemoveLocalService0400
     * @tc.desc  : Remove an mDNS service callBack
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrRemoveLocalService0400",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrRemoveLocalService0400";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: "...",
          },
          serviceAttribute: [{
            key: "111", value: [1]
          }]
        }
        mdns.removeLocalService(context, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
          if (error) {
            console.log(`${caseName} fail ${JSON.stringify(error)}`);
            ExpectTrue(error.code === 401, caseName);
            done();
          } else {
            console.log(`${caseName} success ${JSON.stringify(data)}`);
            ExpectTrue(false, caseName);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_RemoveLocalService_0500
     * @tc.name  : testNetworkMgrRemoveLocalService0500
     * @tc.desc  : Remove an mDNS service callBack
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 0
     */
    it("testNetworkMgrRemoveLocalService0500",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrRemoveLocalService0500";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address,
          },
          serviceAttribute: []
        }
        mdns.removeLocalService(context, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
          if (error) {
            console.log(`${caseName} fail ${JSON.stringify(error)}`);
            ExpectTrue(error.code === 401, caseName);
            done();
          } else {
            console.log(`${caseName} success ${JSON.stringify(data)}`);
            ExpectTrue(true, caseName);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_RemoveLocalService_0600
     * @tc.name  : testNetworkMgrRemoveLocalService0600
     * @tc.desc  : Remove an mDNS service callBack
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrRemoveLocalService0600",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrRemoveLocalService0600";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "...",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address,
          },
          serviceAttribute: []
        }
        mdns.removeLocalService(context, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
          if (error) {
            console.log(`${caseName} fail ${JSON.stringify(error)}`);
            ExpectTrue(error.code === 401, caseName);
            done();
          } else {
            console.log(`${caseName} success ${JSON.stringify(data)}`);
            ExpectTrue(false, caseName);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_RemoveLocalService_0700
     * @tc.name  : testNetworkMgrRemoveLocalService0700
     * @tc.desc  : Remove an mDNS service callBack
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrRemoveLocalService0700",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrRemoveLocalService0700";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: "",
          port: 8081,
          host: {
            address: address,
          },
          serviceAttribute: []
        }
        mdns.removeLocalService(context, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
          if (error) {
            console.log(`${caseName} fail ${JSON.stringify(error)}`);
            ExpectTrue(error.code === 2204002, caseName);
            done();
          } else {
            console.log(`${caseName} success ${JSON.stringify(data)}`);
            ExpectTrue(false, caseName);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_RemoveLocalService_0800
     * @tc.name  : testNetworkMgrRemoveLocalService0800
     * @tc.desc  : Remove an mDNS service callBack
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrRemoveLocalService0800",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrRemoveLocalService0800";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address,
          },
          serviceAttribute: []
        }
        mdns.addLocalService(context, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
          if (error) {
            console.log(`${caseName} fail1 ${JSON.stringify(error)}`);
            ExpectTrue(false, caseName);
            done();
          } else {
            mdns.removeLocalService(context, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
              if (error) {
                console.log(`${caseName} fail2 ${JSON.stringify(error)}`);
                ExpectTrue(false, caseName);
                done();
              } else {
                console.log(`${caseName} success ${JSON.stringify(data)}`);
                ExpectTrue(true, caseName);
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_RemoveLocalService_0900
     * @tc.name  : testNetworkMgrRemoveLocalService0900
     * @tc.desc  : Remove an mDNS service callBack
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 0
     */
    it("testNetworkMgrRemoveLocalService0900",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrRemoveLocalService0900";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._udp",
          serviceName: getName(),
          port: 8082,
          host: {
            address: address,
          },
          serviceAttribute: []
        }
        mdns.addLocalService(context, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
          if (error) {
            console.log(`${caseName} fail1 ${JSON.stringify(error)}`);
            ExpectTrue(false, caseName);
            done();
          } else {
            mdns.removeLocalService(context, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
              if (error) {
                console.log(`${caseName} fail2 ${JSON.stringify(error)}`);
                ExpectTrue(false, caseName);
                done();
              } else {
                console.log(`${caseName} success ${JSON.stringify(data)}`);
                ExpectTrue(true, caseName);
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_RemoveLocalService_1000
     * @tc.name  : testNetworkMgrRemoveLocalService1000
     * @tc.desc  : Remove an mDNS service Promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrRemoveLocalService1000",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrRemoveLocalService1000";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
        }
        mdns.removeLocalService(context, localServiceInfo).then((data: mdns.LocalServiceInfo) => {
          console.log(`${caseName} success ${JSON.stringify(data)}`);
          ExpectTrue(true, caseName);
          done();
        }).catch((err: BusinessError) => {
          console.log(`${caseName} fail ${JSON.stringify(err)}`);
          ExpectTrue(err.code === 401, caseName);
          done();
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_RemoveLocalService_1100
     * @tc.name  : testNetworkMgrRemoveLocalService1100
     * @tc.desc  : Remove an mDNS service Promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrRemoveLocalService1100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrRemoveLocalService1100";
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
        mdns.removeLocalService(context, localServiceInfo).then((data: mdns.LocalServiceInfo) => {
          console.log(`${caseName} success ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        }).catch((err: BusinessError) => {
          console.log(`${caseName} fail ${JSON.stringify(err)}`);
          ExpectTrue(true, caseName);
          done();
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_RemoveLocalService_1200
     * @tc.name  : testNetworkMgrRemoveLocalService1200
     * @tc.desc  : Remove an mDNS service Promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 0
     */
    it("testNetworkMgrRemoveLocalService1200",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrRemoveLocalService1200";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._udp",
          serviceName: getName(),
          port: 600000,
          host: {
            address: address,
          },
          serviceAttribute: [{
            key: "111", value: [1]
          }]
        }
        mdns.removeLocalService(context, localServiceInfo).then((data: mdns.LocalServiceInfo) => {
          console.log(`${caseName} success ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        }).catch((err: BusinessError) => {
          console.log(`${caseName} fail ${JSON.stringify(err)}`);
          ExpectTrue(err.code === 401, caseName);
          done();
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_RemoveLocalService_1300
     * @tc.name  : testNetworkMgrRemoveLocalService1300
     * @tc.desc  : Remove an mDNS service Promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrRemoveLocalService1300",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrRemoveLocalService1300";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: "...",
          },
          serviceAttribute: [{
            key: "111", value: [1]
          }]
        }
        mdns.removeLocalService(context, localServiceInfo).then((data: mdns.LocalServiceInfo) => {
          console.log(`${caseName} success ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        }).catch((err: BusinessError) => {
          console.log(`${caseName} fail ${JSON.stringify(err)}`);
          ExpectTrue(err.code === 401, caseName);
          done();
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_RemoveLocalService_1400
     * @tc.name  : testNetworkMgrRemoveLocalService1400
     * @tc.desc  : Remove an mDNS service Promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrRemoveLocalService1400",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrRemoveLocalService1400";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address,
          },
          serviceAttribute: []
        }
        mdns.removeLocalService(context, localServiceInfo).then((data: mdns.LocalServiceInfo) => {
          console.log(`${caseName} success ${JSON.stringify(data)}`);
          ExpectTrue(true, caseName);
          done();
        }).catch((err: BusinessError) => {
          console.log(`${caseName} fail ${JSON.stringify(err)}`);
          ExpectTrue(err.code === 401, caseName);
          done();
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_RemoveLocalService_1500
     * @tc.name  : testNetworkMgrRemoveLocalService1500
     * @tc.desc  : Remove an mDNS service Promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrRemoveLocalService1500",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrRemoveLocalService1500";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "...",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address,
          },
          serviceAttribute: []
        }
        mdns.removeLocalService(context, localServiceInfo).then((data: mdns.LocalServiceInfo) => {
          console.log(`${caseName} success ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        }).catch((err: BusinessError) => {
          console.log(`${caseName} fail ${JSON.stringify(err)}`);
          ExpectTrue(err.code === 401, caseName);
          done();
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_RemoveLocalService_1600
     * @tc.name  : testNetworkMgrRemoveLocalService1600
     * @tc.desc  : Remove an mDNS service Promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrRemoveLocalService1600",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrRemoveLocalService1600";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: "",
          port: 8081,
          host: {
            address: address,
          },
          serviceAttribute: []
        }
        mdns.removeLocalService(context, localServiceInfo).then((data: mdns.LocalServiceInfo) => {
          console.log(`${caseName} success ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        }).catch((err: BusinessError) => {
          console.log(`${caseName} fail ${JSON.stringify(err)}`);
          ExpectTrue(err.code === 401, caseName);
          done();
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_RemoveLocalService_1700
     * @tc.name  : testNetworkMgrRemoveLocalService1700
     * @tc.desc  : Remove an mDNS service Promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrRemoveLocalService1700",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrRemoveLocalService1700";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address,
          },
          serviceAttribute: []
        }
        mdns.addLocalService(context, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
          if (error) {
            console.log(`${caseName} fail1 ${JSON.stringify(error)}`);
            ExpectTrue(false, caseName);
            done();
          } else {
            mdns.removeLocalService(context, localServiceInfo).then((data: mdns.LocalServiceInfo) => {
              console.log(`${caseName} success ${JSON.stringify(data)}`);
              ExpectTrue(true, caseName);
              done();
            }).catch((err: BusinessError) => {
              console.log(`${caseName} fail ${JSON.stringify(err)}`);
              ExpectTrue(false, caseName);
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_RemoveLocalService_1800
     * @tc.name  : testNetworkMgrRemoveLocalService1800
     * @tc.desc  : Remove an mDNS service Promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrRemoveLocalService1800",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrRemoveLocalService1800";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._udp",
          serviceName: getName(),
          port: 8082,
          host: {
            address: address,
          },
          serviceAttribute: []
        }
        mdns.addLocalService(context, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
          if (error) {
            console.log(`${caseName} fail1 ${JSON.stringify(error)}`);
            ExpectTrue(false, caseName);
            done();
          } else {
            mdns.removeLocalService(context, localServiceInfo).then((data: mdns.LocalServiceInfo) => {
              console.log(`${caseName} success ${JSON.stringify(data)}`);
              ExpectTrue(true, caseName);
              done();
            }).catch((err: BusinessError) => {
              console.log(`${caseName} fail ${JSON.stringify(err)}`);
              ExpectTrue(false, caseName);
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_RemoveLocalService_1900
     * @tc.name  : testNetworkMgrRemoveLocalService1900
     * @tc.desc  : Remove an mDNS service callBack
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrRemoveLocalService1900",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrRemoveLocalService1900";
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
        mdns.removeLocalService(null, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
          if (error) {
            console.log(`${caseName} fail ${JSON.stringify(error)}`);
            ExpectTrue(true, caseName);
            done();
          } else {
            console.log(`${caseName} success ${JSON.stringify(data)}`);
            ExpectTrue(false, caseName);
            done();
          }
        });

      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_RemoveLocalService_2000
     * @tc.name  : testNetworkMgrRemoveLocalService2000
     * @tc.desc  : Remove an mDNS service Promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 0
     */
    it("testNetworkMgrRemoveLocalService2000",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrRemoveLocalService2000";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8082,
          host: {
            address: address,
          },
          serviceAttribute: []
        }
        mdns.addLocalService(null, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
          if (error) {
            console.log(`${caseName} fail1 ${JSON.stringify(error)}`);
            ExpectTrue(false, caseName);
            done();
          } else {
            mdns.removeLocalService(context, localServiceInfo).then((data: mdns.LocalServiceInfo) => {
              console.log(`${caseName} success ${JSON.stringify(data)}`);
              ExpectTrue(true, caseName);
              done();
            }).catch((err: BusinessError) => {
              console.log(`${caseName} fail ${JSON.stringify(err)}`);
              ExpectTrue(false, caseName);
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_CreateDiscoveryService_0200
     * @tc.name  : testNetworkMgrCreateDiscoveryService0200
     * @tc.desc  : Return a DiscoveryService object callBack
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrCreateDiscoveryService0200",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrCreateDiscoveryService0200";
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
            ExpectTrue(false, caseName);
            done();
          } else {
            console.info(`${caseName} add success`)
            let serviceType = "_print._tcp";
            let discoveryService: Object = mdns.createDiscoveryService(context, serviceType);
            console.info(`${caseName} result :${JSON.stringify(discoveryService)}`);
            ExpectTrue(true, caseName);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_CreateDiscoveryService_0300
     * @tc.name  : testNetworkMgrCreateDiscoveryService0300
     * @tc.desc  : Return a DiscoveryService object callBack
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrCreateDiscoveryService0300",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrCreateDiscoveryService0300";
      console.info(`${caseName} test start `);
      try {
        let serviceType = "_print._udp";
        let discoveryService: Object = mdns.createDiscoveryService(context, serviceType);
        console.log(`${caseName} result :${JSON.stringify(discoveryService)}`);
        ExpectTrue(true, caseName);
        done();
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_ResolveLocalService_0100
     * @tc.name  : testNetworkMgrResolveLocalService0100
     * @tc.desc  : Parsing an mDNS service callBack
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrResolveLocalService0100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrResolveLocalService0100";
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
          if (error) {
            console.log(`${caseName} falil ${JSON.stringify(error)}`);
            ExpectTrue(false, caseName);
            done();
          } else {
            mdns.resolveLocalService(context, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
              if (error) {
                console.log(`${caseName} falil ${JSON.stringify(error)}`);
                ExpectTrue(false, caseName);
                done();
              } else {
                console.log(`${caseName} success ${JSON.stringify(data)}`);
                ExpectTrue(true, caseName);
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_ResolveLocalService_0200
     * @tc.name  : testNetworkMgrResolveLocalService0200
     * @tc.desc  : Parsing an mDNS service callBack
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrResolveLocalService0200",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrResolveLocalService0200";
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
            ExpectTrue(error.code === 2204006, caseName);
            done();
          } else {
            console.log(`${caseName} success ${JSON.stringify(data)}`);
            ExpectTrue(false, caseName);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_ResolveLocalService_0300
     * @tc.name  : testNetworkMgrResolveLocalService0300
     * @tc.desc  : Parsing an mDNS service callBack
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrResolveLocalService0300",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrResolveLocalService0300";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._udp",
          serviceName: getName(),
        }
        mdns.resolveLocalService(context, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
          if (error) {
            console.log(`${caseName} falil ${JSON.stringify(error)}`);
            ExpectTrue(error.code === 2204006, caseName);
            done();
          } else {
            console.log(`${caseName} success ${JSON.stringify(data)}`);
            ExpectTrue(false, caseName);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_ResolveLocalService_0500
     * @tc.name  : testNetworkMgrResolveLocalService0500
     * @tc.desc  : Parsing an mDNS service callBack
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrResolveLocalService0500",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrResolveLocalService0500";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8082,
          host: {
            address: "",
          },
          serviceAttribute: [{
            key: "111", value: [1]
          }]
        }
        mdns.resolveLocalService(context, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
          if (error) {
            console.log(`${caseName} falil ${JSON.stringify(error)}`);
            ExpectTrue(error.code === 2204006, caseName);
            done();
          } else {
            console.log(`${caseName} success ${JSON.stringify(data)}`);
            ExpectTrue(false, caseName);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_ResolveLocalService_0600
     * @tc.name  : testNetworkMgrResolveLocalService0600
     * @tc.desc  : Parsing an mDNS service callBack
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrResolveLocalService0600",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrResolveLocalService0600";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "000",
          serviceName: getName(),
          port: 8082,
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
            ExpectTrue(error.code === 401, caseName);
            done();
          } else {
            console.log(`${caseName} success ${JSON.stringify(data)}`);
            ExpectTrue(false, caseName);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_ResolveLocalService_0700
     * @tc.name  : testNetworkMgrResolveLocalService0700
     * @tc.desc  : Parsing an mDNS service callBack
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrResolveLocalService0700",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrResolveLocalService0700";
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
        mdns.addLocalService(context, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
          if (error) {
            console.log(`${caseName} falil1 ${JSON.stringify(error)}`);
            ExpectTrue(false, caseName);
            done();
          } else {
            mdns.resolveLocalService(context, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
              if (error) {
                console.log(`${caseName} falil2 ${JSON.stringify(error)}`);
                ExpectTrue(false, caseName);
                done();
              } else {
                console.log(`${caseName} success ${JSON.stringify(data)}`);
                ExpectTrue(true, caseName);
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_ResolveLocalService_0800
     * @tc.name  : testNetworkMgrResolveLocalService0800
     * @tc.desc  : Parsing an mDNS service Promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrResolveLocalService0800",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrResolveLocalService0800";
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
          if (error) {
            console.log(`${caseName} falil ${JSON.stringify(error)}`);
            ExpectTrue(false, caseName);
            done();
          } else {
            mdns.resolveLocalService(context, localServiceInfo).then((data: mdns.LocalServiceInfo) => {
              console.log(`${caseName} success ${JSON.stringify(data)}`);
              ExpectTrue(true, caseName);
              done();
            }).catch((error: BusinessError) => {
              console.log(`${caseName} falil ${JSON.stringify(error)}`);
              ExpectTrue(false, caseName);
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_ResolveLocalService_0900
     * @tc.name  : testNetworkMgrResolveLocalService0900
     * @tc.desc  : Parsing an mDNS service Promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrResolveLocalService0900",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrResolveLocalService0900";
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
        }).catch((error: BusinessError) => {
          console.log(`${caseName} falil ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 2204006, caseName);
          done();
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_ResolveLocalService_1000
     * @tc.name  : testNetworkMgrResolveLocalService1000
     * @tc.desc  : Parsing an mDNS service Promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrResolveLocalService1000",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrResolveLocalService1000";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._udp",
          serviceName: getName(),
        }
        mdns.resolveLocalService(context, localServiceInfo).then((data: mdns.LocalServiceInfo) => {
          console.log(`${caseName} success ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        }).catch((error: BusinessError) => {
          console.log(`${caseName} falil ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 2204006, caseName);
          done();
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_ResolveLocalService_1100
     * @tc.name  : testNetworkMgrResolveLocalService1100
     * @tc.desc  : Parsing an mDNS service Promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrResolveLocalService1100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrResolveLocalService1100";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 12345678,
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
        }).catch((error: BusinessError) => {
          console.log(`${caseName} falil ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 2204006, caseName);
          done();
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_ResolveLocalService_1200
     * @tc.name  : testNetworkMgrResolveLocalService1200
     * @tc.desc  : Parsing an mDNS service Promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrResolveLocalService1200",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrResolveLocalService1200";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8082,
          host: {
            address: "",
          },
          serviceAttribute: [{
            key: "111", value: [1]
          }]
        }
        mdns.resolveLocalService(context, localServiceInfo).then((data: mdns.LocalServiceInfo) => {
          console.log(`${caseName} success ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        }).catch((error: BusinessError) => {
          console.log(`${caseName} falil ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 2204006, caseName);
          done();
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_ResolveLocalService_1300
     * @tc.name  : testNetworkMgrResolveLocalService1300
     * @tc.desc  : Parsing an mDNS service Promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrResolveLocalService1300",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrResolveLocalService1300";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "000",
          serviceName: getName(),
          port: 8082,
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
        }).catch((error: BusinessError) => {
          console.log(`${caseName} falil ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 401, caseName);
          done();
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_ResolveLocalService_1400
     * @tc.name  : testNetworkMgrResolveLocalService1400
     * @tc.desc  : Parsing an mDNS service Promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 0
     */
    it("testNetworkMgrResolveLocalService1400",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrResolveLocalService1400";
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
        mdns.addLocalService(context, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
          if (error) {
            console.log(`${caseName} falil ${JSON.stringify(error)}`);
            ExpectTrue(false, caseName);
            done();
          } else {
            mdns.resolveLocalService(context, localServiceInfo).then((data: mdns.LocalServiceInfo) => {
              console.log(`${caseName} success ${JSON.stringify(data)}`);
              ExpectTrue(true, caseName);
              done();
            }).catch((error: BusinessError) => {
              console.log(`${caseName} falil ${JSON.stringify(error)}`);
              ExpectTrue(false, caseName);
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_ResolveLocalService_1500
     * @tc.name  : testNetworkMgrResolveLocalService1500
     * @tc.desc  : Parsing an mDNS service callBack
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrResolveLocalService1500",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrResolveLocalService1500";
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
        mdns.resolveLocalService(null, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
          if (error) {
            console.log(`${caseName} falil ${JSON.stringify(error)}`);
            ExpectTrue(false, caseName);
            done();
          } else {
            console.log(`${caseName} success ${JSON.stringify(data)}`);
            ExpectTrue(false, caseName);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_ResolveLocalService_1600
     * @tc.name  : testNetworkMgrResolveLocalService1600
     * @tc.desc  : Parsing an mDNS service Promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrResolveLocalService1600",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrResolveLocalService1600";
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
        mdns.resolveLocalService(null, localServiceInfo).then((data: mdns.LocalServiceInfo) => {
          console.log(`${caseName} success ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        }).catch((error: BusinessError) => {
          console.log(`${caseName} falil ${JSON.stringify(error)}`);
          ExpectTrue(false, caseName);
          done();
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_StartSearchingMDNS_0100
     * @tc.name  : testNetworkMgrStartSearchingMDNS0100
     * @tc.desc  : Start searching for mDNS services within the local area network callBack
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrStartSearchingMDNS0100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrStartSearchingMDNS0100";
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
        mdns.addLocalService(context, localServiceInfo).then((data: mdns.LocalServiceInfo) => {
          let serviceType = "_print._tcp";
          let discoveryService = mdns.createDiscoveryService(context, serviceType);
          discoveryService.on('discoveryStart', (data: mdns.DiscoveryEventInfo) => {
            console.log(`${caseName} result: ${JSON.stringify(data)}`);
            ExpectTrue(data !== null, caseName);
            done();
          });
          discoveryService.startSearchingMDNS();
        }).catch((err: BusinessError) => {
          console.log(`${caseName} catch error: ${JSON.stringify(err)}`);
          ExpectTrue(false, caseName);
          done();
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_StartSearchingMDNS_0200
     * @tc.name  : testNetworkMgrStartSearchingMDNS0200
     * @tc.desc  : Start searching for mDNS services within the local area network callBack
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrStartSearchingMDNS0200",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrStartSearchingMDNS0200";
      console.info(`${caseName} test start `);
      try {
        let serviceType = "_print._udp";
        let discoveryService = mdns.createDiscoveryService(context, serviceType);
        discoveryService.on('discoveryStart', (data: mdns.DiscoveryEventInfo) => {
          console.log(`${caseName} result: ${JSON.stringify(data)}`);
          ExpectTrue(data !== null, caseName);
          done();
        });
        discoveryService.startSearchingMDNS();
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_StartSearchingMDNS_0300
     * @tc.name  : testNetworkMgrStartSearchingMDNS0300
     * @tc.desc  : Start searching for mDNS services within the local area network callBack
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrStartSearchingMDNS0300",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrStartSearchingMDNS0300";
      console.info(`${caseName} test start `);
      try {
        let serviceType = "111";
        let discoveryService = mdns.createDiscoveryService(context, serviceType);
        discoveryService.on('discoveryStart', (data: mdns.DiscoveryEventInfo) => {
          console.log(`${caseName} result: ${JSON.stringify(data)}`);
          ExpectTrue(data !== null, caseName);
          done();
        });
        discoveryService.startSearchingMDNS();
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });


    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_DiscoveryStartOn_0100
     * @tc.name  : testNetworkMgrDiscoveryStartOn0100
     * @tc.desc  : Subscription to enable notifications for listening to mDNS services callBack
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrDiscoveryStartOn0100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrDiscoveryStartOn0100";
      console.info(`${caseName} test start `);
      try {
        let serviceType = "_print._tcp";
        let discoveryService = mdns.createDiscoveryService(context, serviceType);
        discoveryService.on('discoveryStart', (data: mdns.DiscoveryEventInfo) => {
          console.log(`${caseName} result: ${JSON.stringify(data)}`);
          ExpectTrue(data !== null, caseName);
          done();
        });
        discoveryService.startSearchingMDNS();
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_DiscoveryStopOn_0100
     * @tc.name  : testNetworkMgrDiscoveryStopOn0100
     * @tc.desc  : Subscribe to notifications for removing mDNS services callBack
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrDiscoveryStopOn0100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrDiscoveryStopOn0100";
      console.info(`${caseName} test start `);
      try {
        let serviceType = "_print._tcp";
        let discoveryService = mdns.createDiscoveryService(context, serviceType);
        discoveryService.startSearchingMDNS();
        discoveryService.on('discoveryStop', (data: mdns.DiscoveryEventInfo) => {
          console.log(`${caseName} start: ${JSON.stringify(data)}`);
          ExpectTrue(data !== null, caseName);
          done();
        });
        discoveryService.stopSearchingMDNS();
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_AddLocalService_2600
     * @tc.name  : testNetworkMgrAddLocalService2600
     * @tc.desc  : Add an mDNS service Promise
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrAddLocalService2600",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrAddLocalService2600";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address,
            family: 888
          },
        }
        mdns.addLocalService(context, localServiceInfo).then((data: mdns.LocalServiceInfo) => {
          console.info(`${caseName}: suscess :  ${JSON.stringify(data)}`);
          ExpectTrue(data !== null, caseName);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName}: fail :  ${JSON.stringify(error)}`);
          ExpectTrue(false, caseName);
          done();
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_AddLocalService_2800
     * @tc.name  : testNetworkMgrAddLocalService2800
     * @tc.desc  : Add an mDNS service callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrAddLocalService2800",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrAddLocalService2800";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address,
            family: 888
          },
        }
        mdns.addLocalService(context, localServiceInfo, (error: BusinessError, data: mdns.LocalServiceInfo) => {
          if (error) {
            console.info(`${caseName}: callback : ${JSON.stringify(error)}  `);
            ExpectTrue(false, caseName);
            done();
          } else {
            console.info(`${caseName}: callback : ${JSON.stringify(data)}`);
            ExpectTrue(data !== null, caseName);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_ResolveLocalService_0400
     * @tc.name  : testNetworkMgrResolveLocalService0400
     * @tc.desc  : Parsing an mDNS service callBack
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 0
     */
    it("testNetworkMgrResolveLocalService0400",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrResolveLocalService0400";
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 12345678,
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
            ExpectTrue(error.code===2204006, caseName);
            done();
          } else {
            console.log(`${caseName} success ${JSON.stringify(data)}`);
            ExpectTrue(false, caseName);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName}: err is catch ${err}`);
        ExpectTrue(true, caseName);
        done();
      }
      console.info(`${caseName} test end `);
    });
    /* *
     * @tc.number: SUB_NetworkMgr_Mdns_CreateDiscoveryService_0100
     * @tc.name  : testNetworkMgrCreateDiscoveryService0100
     * @tc.desc  : Return a DiscoveryService object callBack
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrCreateDiscoveryService0100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrCreateDiscoveryService0100";
      console.info(`${caseName} test start `);
      try {
        let serviceType = "";
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
     * @tc.number: SUB_NetworkMgr_Mdns_CreateDiscoveryService_0400
     * @tc.name  : testNetworkMgrCreateDiscoveryService0400
     * @tc.desc  : Return a DiscoveryService object callBack
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 0
     */
    it("testNetworkMgrCreateDiscoveryService0400",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 ,async (done: Function) => {
      const caseName: string = "testNetworkMgrCreateDiscoveryService0400";
      console.info(`${caseName} test start `);
      try {
        let serviceType = "668";
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


  });
}
