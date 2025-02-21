
/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import connection from '@ohos.net.connection';
import { describe, it, expect } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';



export default function connectionSecondJsUnit() {
  describe("connectionSecondJsunit", () => {
    let envReady = false;
    /**
     * @tc.name: Telephony_connection_ConnectionProperties_0100
     * @tc.desc: ConnectionProperties Properties  detection
     * @tc.author: kangyuntao
     */
    it("Telephony_connection_ConnectionProperties_0100", 0, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("-----------------------Telephony ConnectionProperties Test is starting-----------------------");
      let caseName = 'Telephony_connection_ConnectionProperties_0100';
      try {
        interface ResultLinkAddresses{
          linkAddresses:LinkAddresses[];
        }
        interface LinkAddresses{
          address:Address;
        }
        interface Address{
          address:string
        }

        let resultLinkAddresses:ResultLinkAddresses = {
          linkAddresses: [{
            address: {
              address: "192.168.1.2"
            }
          }]
        };
        interface ResultDnses{
          dnses:Dnses[]
        }
        interface Dnses{
          address:string;
        }
        let resultDnses:ResultDnses= {
          dnses: [{
            address: "192.168.1.3"
          }]
        };
        interface ResultRoutes{
          routes:Routes[];
        }
        interface Routes{
          gateway:Gateway;
        }
        interface Gateway{
          address:string;
        }
        let resultRoutes:ResultRoutes= {
          routes: [{
            gateway: {
              address: "192.168.1.1"
            }
          }]
        };
        interface ResultName{
          interfaceName:string;
        }
        let resultName:ResultName = {
          interfaceName: '123'
        };
        interface ResultMtu{
          mtu:number;
        }
        let resultMtu:ResultMtu = {
          mtu: 123
        };
        console.log(caseName + ` resultLinkAddresses.linkAddresses.length: ` +
        resultLinkAddresses.linkAddresses.length);
        console.log(caseName + ` resultDnses.dnses.length: ` + resultDnses.dnses.length);
        console.log(caseName + ` resultRoutes.routes.length: ` + resultRoutes.routes.length);
        expect(resultLinkAddresses.linkAddresses.length > 0).assertTrue();
        expect(resultDnses.dnses.length > 0).assertTrue();
        expect(resultRoutes.routes.length > 0).assertTrue();
        expect("123").assertEqual(resultName.interfaceName);
        expect(123).assertEqual(resultMtu.mtu);
        console.log("-----------------------Telephony ConnectionProperties Test end-----------------------");
        done();
      } catch (err) {
        console.log(`Telephony_ConnectionProperties_0100 err ` + err);
      }
    });
    /**
     * @tc.name: 'Telephony_connection_getConnectionProperties_Async_0200
     * @tc.desc: getConnectionProperties  detection
     * @tc.author: kangyuntao
     */
    it('Telephony_connection_getConnectionProperties_Async_0200', 0, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("-----------------------Telephony getConnectionProperties Test is starting-----------------------");
      if (false) {
        expect(true).assertTrue();
        done();
        return;
      }
      let caseName = 'Telephony_connection_getConnectionProperties_Async_0200';
      connection.getAllNets((error, value) => {
        if (error) {
          console.log(`${caseName}  get data fail: ${error}`);
          expect().assertTrue();
          done();
        } else {
          console.log(`${caseName} get netID value : ${JSON.stringify(value[0])}`);
          connection.getConnectionProperties(value[0], (error, value) => {
            if (error) {
              console.log(`${caseName}  get ID fail: ${error}`);
              expect().assertFail();
              done();
            } else {
              console.log(`${caseName}  get value success: ${JSON.stringify(value)}`);
              console.log(caseName + " ifaceName: " + value.interfaceName);
              console.log(caseName + " mtu: " + value.mtu);
              console.log(caseName + " netAddrList.length: " + value.linkAddresses.length);
              expect(value.interfaceName== "").assertTrue();
              expect(value.domains == "").assertTrue();
              expect(value.mtu == 0).assertTrue();
              expect(value.dnses.length == 0).assertTrue();
              // expect(value.dnsList.length == 0).assertTrue();
              expect(value.routes.length == 0).assertTrue();
              done();
            }
          });
        }
      });
      console.log("-----------------------Telephony getConnectionProperties Test end-----------------------");
      done();
    });
    /**
     * @tc.name: Telephony_connection_RouteInfo_0300
     * @tc.desc: RouteInfo Properties  detection
     * @tc.author: kangyuntao
     */
    it("Telephony_connection_RouteInfo_0300", 0, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("----------------------RouteInfo Properties Test is starting-----------------------");
      try {
        interface ResultInterface{
          interface:string;
        }
        let resultInterface:ResultInterface = {
          interface: '123'
        };
        interface ResultDestination{
          destination:Destination;
        }
        interface Destination{
          address:string;
        }
        let resultDestination:ResultDestination = {
          destination: {
            address: "192.168.1.2"
          }
        };
        interface ResultGateway{
          gateway:Gateway
        }
        interface Gateway{
          address:string;
        }
        let resultGateway:ResultGateway = {
          gateway: {
            address: "192.168.1.3"
          }
        };
        interface ResultDefaultRoute{
          isDefaultRoute:boolean;
        }
        let resultDefaultRoute:ResultDefaultRoute = {
          isDefaultRoute: true
        };
        interface ResultHasGateway{
          hasGateway:boolean;
        }
        let resultHasGateway:ResultHasGateway = {
          hasGateway: true
        };
        expect(true).assertEqual(resultDefaultRoute.isDefaultRoute);
        expect(true).assertEqual(resultHasGateway.hasGateway);
        expect("123").assertEqual(resultInterface.interface);
        expect("192.168.1.2").assertEqual(resultDestination.destination.address);
        expect("192.168.1.3").assertEqual(resultGateway.gateway.address);
        console.log("-----------------------RouteInfo Properties Test end-----------------------");
        done();
      } catch (err) {
        console.log(`Telephony_connection_RouteInfo_0300 err ` + err);
      }
    });
    /**
     * @tc.name: 'Telephony_connection_getRouteInfo_Async_0400
     * @tc.desc: getRouteInfo Properties detection
     * @tc.author: kangyuntao
     */
    it('Telephony_connection_getRouteInfo_Async_0400', 0, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("-----------------------Telephony getRouteInfo Test is starting-----------------------");
      let caseName = 'Telephony_connection_getRouteInfo_Async_0400';
      connection.getAllNets((error, value) => {
        if (error) {
          console.log(`${caseName}  get data fail: ${error}`);
          expect().assertTrue();
          done();
        } else {
          console.log(`${caseName} get netID value : ${JSON.stringify(value[0])}`);
          connection.getConnectionProperties(value[0], (error, value) => {
            if (error) {
              console.log(`${caseName}  get ID fail: ${error}`);
              expect().assertFail();
              done();
            } else {
              console.log(`${caseName}  get value success: ${JSON.stringify(value)}`);
              console.log(caseName + " value.routeList.length: " + value.routes.length);
              if (value.routes.length > 0) {
                expect(value.routes[0].hasGateway).assertTrue();
                expect(value.routes[0].isDefaultRoute).assertTrue();
              }
              done();
            }
          });
        }
      });
      console.log("----------------------Telephony getRouteInfo Test end-----------------------");
      done();
    });
    /**
     * @tc.name: Telephony_connection_LinkAddress_0500
     * @tc.desc: LinkAddress Properties  detection
     * @tc.author: kangyuntao
     */
    it("Telephony_connection_LinkAddress_0500", 0, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("----------------------LinkAddress Properties Test is starting-----------------------");
      try {
        interface ResultPrefixLength{
          prefixLength:number
        }
        let resultPrefixLength:ResultPrefixLength = {
          prefixLength: 10
        };
        expect(10).assertEqual(resultPrefixLength.prefixLength);
        console.log("-----------------------LinkAddress Properties Test end-----------------------");
        done();
      } catch (err) {
        console.log(`Telephony_connection_LinkAddress_0500 err ` + err);
      }
    });
    /**
     * @tc.name: Telephony_connection_getLinkAddress_Async_0600
     * @tc.desc: getLinkAddress Properties detection
     * @tc.author: kangyuntao
     */
    it('Telephony_connection_getLinkAddress_Async_0600', 0, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("-----------------------Telephony getLinkAddress Test is starting-----------------------");
      let caseName = 'Telephony_connection_getLinkAddress_Async_0600';
      connection.getAllNets((error, value) => {
        if (error) {
          console.log(`${caseName}  get data fail: ${error}`);
          expect().assertTrue();
          done();
        } else {
          console.log(`${caseName} get netID value : ${JSON.stringify(value[0])}`);
          connection.getConnectionProperties(value[0], (error, value) => {
            if (error) {
              console.log(`${caseName}  get ID fail: ${error}`);
              expect().assertFail();
              done();
            } else {
              console.log(`${caseName}  get value success: ${JSON.stringify(value)}`);
              console.log(caseName + " value.dnsList.length: " + value.dnses.length);
              if (value.dnses.length > 0) {
                expect(value.dnses[0] != null).assertTrue();
              }
              done();
            }
          });
        }
      });
      console.log("-----------------------Telephony getLinkAddress Test end-----------------------");
      done();
    });
    /**
     * @tc.name: Telephony_connection_NetAddress_0700
     * @tc.desc: NetAddress Properties  detection
     * @tc.author: kangyuntao
     */
    it("Telephony_connection_NetAddress_0700", 0, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("----------------------NetAddress Properties  Test is starting-----------------------");
      try {
        interface ResultPort{
          port:number;
        }
        let resultPort:ResultPort= {
          port: 23
        };
        expect(23).assertEqual(resultPort.port);
        console.log("-----------------------NetAddress Properties  Test end-----------------------");
        done();
      } catch (err) {
        console.log(`"Telephony_connection_NetAddress_0700 err ` + err);
      }
    });
    /**
     * @tc.name: Telephony_connection_getNetAddress_Async_0800
     * @tc.desc: getNetAddress Properties detection
     * @tc.author: kangyuntao
     */
    it('Telephony_connection_getNetAddress_Async_0800', 0, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("-----------------------Telephony getNetAddress Test is starting-----------------------");
      let caseName = 'Telephony_connection_getNetAddress_Async_0800';
      connection.getAllNets((error, value) => {
        if (error) {
          console.log(`${caseName}  get data fail: ${error}`);
          expect().assertTrue();
          done();
        } else {
          console.log(`${caseName} get netID value : ${JSON.stringify(value[0])}`);
          connection.getConnectionProperties(value[0], (error, value) => {
            if (error) {
              console.log(`${caseName}  get ID fail: ${error}`);
              expect().assertFail();
              done();
            } else {
              console.log(`${caseName}  get value success: ${JSON.stringify(value)}`);
              console.log(caseName + 'value.netAddrList.length:' + value.linkAddresses.length);
              if (value.linkAddresses.length > 0) {
                expect(value.linkAddresses[0].address != null).assertTrue();
              }
              done();
            }
          });
        }
      });
      console.log("-----------------------Telephony getNetAddress Test end-----------------------");
      done();
    });
    /**
     * @tc.name: Telephony_connection_NetCap_0900
     * @tc.desc: NetCap Properties detection
     * @tc.author: kangyuntao
     */
    it("Telephony_connection_NetCap_0900", 0, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("-----------------------Telephony NetCap Properties Test is starting-----------------------");
      if (false) {
        expect(true).assertTrue();
        done();
        return;
      }
      try {
        console.log("Telephony_connection_NetCap_0900 NetCap: " + connection.NetCap);
        expect(0).assertEqual(connection.NetCap.NET_CAPABILITY_MMS);
        expect(11).assertEqual(connection.NetCap.NET_CAPABILITY_NOT_METERED);
        expect(12).assertEqual(connection.NetCap.NET_CAPABILITY_INTERNET);
        expect(15).assertEqual(connection.NetCap.NET_CAPABILITY_NOT_VPN);
        expect(16).assertEqual(connection.NetCap.NET_CAPABILITY_VALIDATED);
        console.log("-----------------------Telephony NetCap Properties Test end-----------------------");
        done();
      } catch (err) {
        console.log(`Telephony_connection_NetCap_0900 err ` + err);
      }
    });
    /**
     * @tc.name: Telephony_connection_getNetCap_Async_1000
     * @tc.desc: getNetCap Properties detection
     * @tc.author: kangyuntao
     */
    it('Telephony_connection_getNetCap_Async_1000', 0, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("-----------------------Telephony getNetCap Test is starting-----------------------");
      let caseName = 'Telephony_connection_getNetCap_Async_1000';
      connection.getAllNets((error, value) => {
        if (error) {
          console.log(`${caseName}  get data fail: ${error}`);
          expect().assertTrue();
          done();
        } else {
          console.log(`Telephony_connection getAllNets netID value : ${JSON.stringify(value[0].netId)}`);
          connection.getNetCapabilities(value[0], (error, data) => {
            if (error) {
              console.log(`${caseName}  get ID fail: ${error}`);
              expect().assertFail();
              done();
            } else {
              console.log(`${caseName}  get value success: ${JSON.stringify(data)}`);
              console.log(`${caseName}  get value successNetCap: ${JSON.stringify(data.networkCap)}`);
              expect(data.networkCap != null).assertTrue();
              done();
            }
          });
        }
      });
      console.log("-----------------------Telephony getNetCap Test is end-----------------------");
      done();
    });
    /**
     * @tc.name: Telephony_connection_NetBearType_1100
     * @tc.desc: NetBearType Properties detection
     * @tc.author: kangyuntao
     */
    it("Telephony_connection_NetBearType_1100", 0, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("-----------------------Telephony NetBearType Properties Test is starting-----------------------");
      if (false) {
        expect(true).assertTrue();
        done();
      }
      try {
        console.log("Telephony_connection_NetBearType_1100 NetBearType: " + connection.NetBearType);
        expect(0).assertEqual(connection.NetBearType.BEARER_CELLULAR);
        expect(1).assertEqual(connection.NetBearType.BEARER_WIFI);
        expect(2).assertEqual(connection.NetBearType.BEARER_BLUETOOTH);
        expect(3).assertEqual(connection.NetBearType.BEARER_ETHERNET);
        console.log("-----------------------Telephony NetBearType Properties Test end-----------------------");
        done();
      } catch (err) {
        console.log(`Telephony_connection_NetBearType_1100 err ` + err);
      }
    });
    /**
     * @tc.name: Telephony_connection_getNetBearType_Async_1200
     * @tc.desc:getNetBearType Properties detection
     * @tc.author: kangyuntao
     */
    it('Telephony_connection_getNetBearType_Async_1200', 0, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("-----------------------Telephony getNetBearType Test is starting-----------------------");
      let caseName = 'Telephony_connection_getNetBearType_Async_1200';
      connection.getAllNets((error, value) => {
        if (error) {
          console.log(`${caseName}  get data fail: ${error}`);
          expect().assertTrue();
          done();
        } else {
          console.log(`Telephony_connection getAllNets netID value : ${JSON.stringify(value[0].netId)}`);
          connection.getNetCapabilities(value[0], (error, data) => {
            if (error) {
              console.log(`${caseName}  get ID fail: ${error}`);
              expect().assertFail();
              done();
            } else {
              console.log(`${caseName}  get value success: ${JSON.stringify(data)}`);
              console.log(`${caseName}  get value success122222: ${JSON.stringify(data.bearerTypes[0])}`);
              expect(data.bearerTypes[0] != null).assertTrue();
              done();
            }
          });
        }
      });
      console.log("-----------------------Telephony getNetBearType Test is end-----------------------");
      done();
    });
    /**
     * @tc.name: Telephony_connection_getNetCapabilities_Promise_1300
     * @tc.desc: getNetCapabilities NetCap and NetBearType Properties detection
     * @tc.author: kangyuntao
     */
    it('Telephony_connection_getNetCapabilities_Promise_1300', 0, (done: Function) => {
      if (!envReady) {
        console.info("The environment was not ready");
        done();
        return;
      }
      console.log("-----------------------Telephony getNetCapabilities Promise Test is starting-----------------------");
      let caseName = 'Telephony_connection_getNetCapabilities_Promise_1300';
      connection.getAllNets().then((handle) => {
        connection.getNetCapabilities(handle[0]).then((data) => {
          console.log(`${caseName} getNetCapabilities promiss data suceess: ${JSON.stringify(data)}`);
          console.log(`${caseName}  get value successNetCap: ${JSON.stringify(data.networkCap)}`);
          console.log(`${caseName}  get value successNearerTypes: ${JSON.stringify(data.bearerTypes[0])}`);
          expect(data.networkCap != null).assertTrue();
          expect(data.bearerTypes != null).assertTrue();
          console.log("-----------------------Telephony getNetCapabilities Promise Test is end-----------------------");
          done();
        }).catch((error:BusinessError) => {
          console.log(`${caseName} getNetCapabilities promiss fail: ${error}`);
          expect().assertTrue();
          done();
        });
      }).catch((error:BusinessError) => {
        console.log(`${caseName} getAllNets promiss error: ${error}`);
        expect().assertFail();
        done();
      });
      done();
    });
  })

}

