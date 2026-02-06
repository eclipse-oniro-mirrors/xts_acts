/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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

import { describe, expect, it, beforeAll, Size, Level, TestType, beforeEach, afterEach } from '@ohos/hypium';
import mdns from '@ohos.net.mdns';

let context = AppStorage.get('context') as Context;
let radomAddress: string = "202.101.172.35";
let getName:()=>string=()=>{
  return "test"+ (Math.random()*1000).toFixed(0)+(Math.random()*5000).toFixed(0)+(Math.random()*800).toFixed(0)
}
let localServiceInfoTypeTcp:()=> mdns.LocalServiceInfo =()=> {
  let localServiceInfoType : mdns.LocalServiceInfo;
  localServiceInfoType = {
    serviceType: serviceTypeTcp,
    serviceName: getName(),
    port: 8081,
    host: {
      address: radomAddress,
    },
    serviceAttribute: []
  }
  return localServiceInfoType
}
let ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}
let ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(` exportFail failed err: ${JSON.stringify(err)}`);
  }
};
let serviceTypeTcp= "_print._tcp";
let serviceTypeUdp= "_print._udp";
let removeTheService = (localServiceInfo: mdns.LocalServiceInfo) => {
  try {
    mdns.removeLocalService(context, localServiceInfo, (error, data: mdns.LocalServiceInfo) => {
      if (error) {
        console.log(` function removeTheService removeLocalService fail ${JSON.stringify(error)}`);
      } else {
        console.log(` function removeTheService removeLocalService success data is :${JSON.stringify(data)} `);
      }
    })
  } catch (err) {
    console.info(`removeLocalService catch  err is `+JSON.stringify(err));
  }
}

function sleep (time:number):Promise<string>{
  return new Promise<string>((resolve)=>{
    setTimeout(()=>{
      resolve('ok')},time)
  });
}

export default function NetworkManagerMdnsTest() {

  describe('NetworkManagerMdnsTest',  () => {
    beforeAll(async () => {
      console.log('NetworkManagerMdnsTest beforeAll start.');
      if(context == undefined){
        context = getContext() as Context
      }
      console.log("context====", JSON.stringify(context))
    });

    afterEach(async ()=>{
      await sleep(500);
    });


    /**
     * @tc.number:SUB_Telephony_NetManager_startSearchingMDNS_0100
     * @tc.name  : testTelephonyNetManagerStartSearchingMDNS0100
     * @tc.desc  : Subscribing to the Notification of Enabling the mDNS Service Listening Function
     * @tc.size  : SMALLTEST
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testTelephonyNetManagerStartSearchingMDNS0100', Size.SMALLTEST | TestType.FUNCTION | Level.LEVEL2 , async (done: Function) => {
      let caseName = 'testTelephonyNetManagerStartSearchingMDNS0100';
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo = localServiceInfoTypeTcp();
        let discoveryService = mdns.createDiscoveryService(context , serviceTypeTcp);
        discoveryService.on("discoveryStart", ()=>{
          console.log(`${caseName} on discoveryStart : startSearching `);
          ExpectTrue(true);
          removeTheService(localServiceInfo);
          done();
          console.info(`${caseName}---End`);
        });
        mdns.addLocalService(context , localServiceInfo, async (err, data) => {
          if (err) {
            console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.log(`${caseName} addLocalService success, LocalServiceInfo is `+JSON.stringify(data));
            discoveryService.startSearchingMDNS();
          }
        });
      }catch (err) {
        console.info(`${caseName} catch err is `+JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number:SUB_Telephony_NetManager_startSearchingMDNS_0200
     * @tc.name  : testTelephonyNetManagerStartSearchingMDNS0200
     * @tc.desc  : Disable the function of listening on the MDNS service.
     * @tc.size  : SMALLTEST
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyNetManagerStartSearchingMDNS0200', Size.SMALLTEST | TestType.FUNCTION | Level.LEVEL3 , async (done: Function) => {
      let caseName = 'testTelephonyNetManagerStartSearchingMDNS0200';
      console.info(`${caseName} test start `);
      try {
        let callback: ()=>void = ()=>{
          console.log(`${caseName}  on or off discoveryStart  `);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }
        let localServiceInfo = localServiceInfoTypeTcp();
        let discoveryService = mdns.createDiscoveryService(context , serviceTypeTcp);
        discoveryService.on("discoveryStart", callback);
        discoveryService.off("discoveryStart", callback);
        mdns.addLocalService(context , localServiceInfo, async (err, data) => {
          if (err) {
            console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.log(`${caseName} addLocalService success, LocalServiceInfo is `+JSON.stringify(data));
            discoveryService.startSearchingMDNS();
            await sleep(1000)
            ExpectTrue(true);
            removeTheService(localServiceInfo);
            done();
            console.info(`${caseName}---End`);
          }
        });
      }catch (err) {
        console.info(`${caseName} catch err is `+JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });


    /**
     * @tc.number SUB_Telephony_NetManager_stopSearchingMDNS_0100
     * @tc.name  : testTelephonyNetManagerStopSearchingMDNS0100
     * @tc.desc Subscribe to the notification of stopping listening on the MDNS service.
     * @tc.size  : SMALLTEST
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyNetManagerStopSearchingMDNS0100', Size.SMALLTEST | TestType.FUNCTION| Level.LEVEL3 , async  (done: Function) => {
      let caseName = 'testTelephonyNetManagerStopSearchingMDNS0100';
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo = localServiceInfoTypeTcp();
        let discoveryService = mdns.createDiscoveryService(context , serviceTypeTcp);
        discoveryService.on("discoveryStop", ()=>{
          console.log(`${caseName} on discoveryStop : stopSearchingMDNS`);
          ExpectTrue(true);
          removeTheService(localServiceInfo);
          done();
        });
        mdns.addLocalService(context , localServiceInfo, async (err, data) => {
          if (err) {
            console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.log(`${caseName} addLocalService success `);
            discoveryService.startSearchingMDNS();
            discoveryService.stopSearchingMDNS();
          }
        });
      }catch (err) {
        console.info(`${caseName} catch err is `+JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number SUB_Telephony_NetManager_stopSearchingMDNS_0200
     * @tc.name  : testTelephonyNetManagerStopSearchingMDNS0200
     * @tc.desc This interface is used to unsubscribe from the notification of stopping listening on the MDNS service.
     * @tc.size  : SMALLTEST
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyNetManagerStopSearchingMDNS0200', Size.SMALLTEST | TestType.FUNCTION| Level.LEVEL3 , async  (done: Function) => {
      let caseName = 'testTelephonyNetManagerStopSearchingMDNS0200';
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo = localServiceInfoTypeTcp();
        let discoveryService = mdns.createDiscoveryService(context , serviceTypeTcp);
        let callback: ()=>void = ()=>{
          console.log(`${caseName}  on or off discoveryStop  `);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }
        discoveryService.on("discoveryStop", callback);
        discoveryService.off("discoveryStop", callback);
        mdns.addLocalService(context , localServiceInfo, async (err, data) => {
          if (err) {
            console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.log(`${caseName} addLocalService success `);
            discoveryService.startSearchingMDNS();
            discoveryService.stopSearchingMDNS();
            await sleep(500);
            ExpectTrue(true);
            removeTheService(localServiceInfo);
            console.info(`${caseName}---End`);
            done();
          }
        });
      }catch (err) {
        console.info(`${caseName} catch err is `+JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });


    /**
     * @tc.number SUB_Telephony_NetManager_on_serviceFound_0100
     * @tc.name testTelephonyNetManagerOnServiceFound0100
     * @tc.desc Subscribe to notifications of MDNS service discovery.
     * @tc.size  : SMALLTEST
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyNetManagerOnServiceFound0100', Size.SMALLTEST | TestType.FUNCTION| Level.LEVEL3 , async  (done: Function) => {
      let caseName = 'testTelephonyNetManagerOnServiceFound0100';
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo = localServiceInfoTypeTcp();
        let discoveryService = mdns.createDiscoveryService(context , serviceTypeTcp);
        discoveryService.on("serviceFound", (data: mdns.LocalServiceInfo)=>{
          console.log(`${caseName} on serviceFound , data is ${JSON.stringify(data)}`);
          ExpectTrue(true);
          discoveryService.stopSearchingMDNS();
          removeTheService(localServiceInfo);
          console.info(`${caseName}---End`);
          done();
        });
        mdns.addLocalService(context , localServiceInfo, async (err, data) => {
          if (err) {
            console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.log(`${caseName} addLocalService success `);
            discoveryService.startSearchingMDNS();
          }
        });
      }catch (err) {
        console.info(`${caseName} catch err is `+JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number SUB_Telephony_NetManager_on_serviceFound_0200
     * @tc.name testTelephonyNetManagerOnServiceFound0200
     * @tc.desc Subscribe to notifications of MDNS service discovery.
     * @tc.size  : SMALLTEST
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyNetManagerOnServiceFound0200', Size.SMALLTEST | TestType.FUNCTION| Level.LEVEL3 , async  (done: Function) => {
      let caseName = 'testTelephonyNetManagerOnServiceFound0200';
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo = localServiceInfoTypeTcp();
        let discoveryService = mdns.createDiscoveryService(context , serviceTypeUdp);
        discoveryService.on("serviceFound", (data: mdns.LocalServiceInfo)=>{
          console.log(`${caseName} on serviceFound , data is ${JSON.stringify(data)}`);
          ExpectFail();
          done();
        });
        mdns.addLocalService(context , localServiceInfo, async (err, data) => {
          if (err) {
            console.log(`${caseName} add LocalService fail ${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.log(`${caseName} add LocalService success `);
            discoveryService.startSearchingMDNS();
            await sleep(1000);
            ExpectTrue(true);
            discoveryService.stopSearchingMDNS();
            removeTheService(localServiceInfo);
            done();
            console.info(`${caseName}---End`);
          }
        });
      }catch (err) {
        console.info(`${caseName} catch err is `+JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });


    /**
     * @tc.number SUB_Telephony_NetManager_on_serviceFound_0300
     * @tc.name testTelephonyNetManagerOnServiceFound0300
     * @tc.desc Unsubscribe from notifications about MDNS service discovery.
     * @tc.size  : SMALLTEST
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyNetManagerOnServiceFound0300', Size.SMALLTEST | TestType.FUNCTION| Level.LEVEL3 , async  (done: Function) => {
      let caseName = 'testTelephonyNetManagerOnServiceFound0300';
      console.info(`${caseName} test start `);
      try {
        let callback: ()=>void = ()=>{
          console.log(`${caseName}  on or off serviceFound  `);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }
        let localServiceInfo = localServiceInfoTypeTcp();
        let discoveryService = mdns.createDiscoveryService(context , serviceTypeTcp);
        discoveryService.on("serviceFound", callback);
        discoveryService.off("serviceFound", callback);
        mdns.addLocalService(context , localServiceInfo, async (err, data) => {
          if (err) {
            console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.log(`${caseName} addLocalService success `);
            discoveryService.startSearchingMDNS();
            await sleep(500);
            removeTheService(localServiceInfo);
            ExpectTrue(true);
            done();
          }
        });
      }catch (err) {
        console.info(`${caseName} catch err is `+JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number SUB_Telephony_NetManager_on_serviceLost_0100
     * @tc.name testTelephonyNetManagerOnServiceLost0100
     * @tc.desc Subscribe to the notification that the MDNS service is removed.
     * @tc.size  : SMALLTEST
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyNetManagerOnServiceLost0100', Size.SMALLTEST | TestType.FUNCTION| Level.LEVEL3 , async  (done: Function) => {
      let caseName = 'testTelephonyNetManagerOnServiceLost0100';
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo = localServiceInfoTypeTcp();
        let discoveryService = mdns.createDiscoveryService(context , serviceTypeTcp);
        discoveryService.on("serviceLost", (data: mdns.LocalServiceInfo)=>{
          console.log(`${caseName} on serviceLost , data is ${JSON.stringify(data)}`);
          ExpectTrue(true);
          done();
        });
        mdns.addLocalService(context , localServiceInfo, async (err, data) => {
          if (err) {
            console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} addLocalService success `);
            discoveryService.startSearchingMDNS();
          }
        });
        await sleep(3000);
        removeTheService(localServiceInfo);
        await sleep(200);
        discoveryService.stopSearchingMDNS();
      }catch (err) {
        console.info(`${caseName} catch err is `+JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number SUB_Telephony_NetManager_on_serviceLost_0200
     * @tc.name testTelephonyNetManagerOnServiceLost0200
     * @tc.desc Subscribe to the notification that the MDNS service is removed.
     * @tc.size  : SMALLTEST
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyNetManagerOnServiceLost0200', Size.SMALLTEST | TestType.FUNCTION| Level.LEVEL3 , async  (done: Function) => {
      let caseName = 'testTelephonyNetManagerOnServiceLost0200';
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo = localServiceInfoTypeTcp();
        let discoveryService = mdns.createDiscoveryService(context , serviceTypeUdp);
        discoveryService.on("serviceLost", (data: mdns.LocalServiceInfo)=>{
          console.log(`${caseName} on serviceLost , data is ${JSON.stringify(data)}`);
          ExpectFail();
          done();
        });
        mdns.addLocalService(context , localServiceInfo, async (err, data) => {
          if (err) {
            console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} addLocalService success `);
            discoveryService.startSearchingMDNS();
            removeTheService(localServiceInfo);
            await sleep(500);
            ExpectTrue(true);
            done();
          }
        });
      }catch (err) {
        console.info(`${caseName} catch err is `+JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number SUB_Telephony_NetManager_on_serviceLost_0300
     * @tc.name testTelephonyNetManagerOnServiceLost0300
     * @tc.desc This interface is used to unsubscribe from the notification that the MDNS service is removed.
     * @tc.size  : SMALLTEST
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyNetManagerOnServiceLost0300', Size.SMALLTEST | TestType.FUNCTION| Level.LEVEL3 , async  (done: Function) => {
      let caseName = 'testTelephonyNetManagerOnServiceLost0300';
      console.info(`${caseName} test start `);
      try {
        let callback: ()=>void = ()=>{
          console.log(`${caseName}  on or off serviceLost  `);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }
        let localServiceInfo = localServiceInfoTypeTcp();
        let discoveryService = mdns.createDiscoveryService(context , serviceTypeTcp);
        discoveryService.on("serviceLost", callback);
        discoveryService.off("serviceLost", callback);
        mdns.addLocalService(context , localServiceInfo, async (err, data) => {
          if (err) {
            console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} addLocalService success `);
            discoveryService.startSearchingMDNS();
            removeTheService(localServiceInfo);
            await sleep(500);
            ExpectTrue(true);
            done();
          }
        });
      }catch (err) {
        console.info(`${caseName} catch err is `+JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number SUB_Telephony_NetManager_MdnsError_0100
     * @tc.name Test MdnsError enum
     * @tc.desc  Function test
     * @tc.size  : SMALLTEST
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('SUB_Telephony_NetManager_MdnsError_0100', Size.SMALLTEST | TestType.FUNCTION| Level.LEVEL3 , async  (done: Function) => {
      let caseName = 'SUB_Telephony_NetManager_MdnsError_0100';
      console.info(`${caseName} test start `);
      try {
        ExpectTrue(mdns.MdnsError.INTERNAL_ERROR == 0);
        ExpectTrue(mdns.MdnsError.ALREADY_ACTIVE == 1);
        ExpectTrue(mdns.MdnsError.MAX_LIMIT == 2);
        console.info(caseName + "test finish!");
        done();
      }catch (err) {
        console.info(`${caseName} catch err is `+JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });
  });
}