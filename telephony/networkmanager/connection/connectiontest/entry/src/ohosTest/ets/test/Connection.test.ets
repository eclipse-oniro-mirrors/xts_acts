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

import { describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import connection from '@ohos.net.connection';
import { BusinessError } from '@ohos.base';
import network from '@system.network';

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
let exclusionStr = "10.136.15.254,www.baidu.com";
let exclusionArray = exclusionStr.split(',');

export default function ConnectionTest() {
  describe('ConnectionTest', () => {

    /**
     * @tc.number : SUB_Network_Connection_SetAppHttpProxy_0100
     * @tc.name   : testNetworkConnectionSetHttpProxyCallback0100
     * @tc.desc   : Set network application level HTTP proxy configuration information.
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkConnectionSetHttpProxyCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testNetworkConnectionSetHttpProxyCallback0100';
      console.info(`${caseName}---Start`);
      try {
        const httpProxy: connection.HttpProxy = {
          host: "10.136.15.254",
          port: 8081,
          exclusionList: exclusionArray,
          username: "admin",
        }
        connection.setAppHttpProxy(httpProxy as connection.HttpProxy);
        connection.getDefaultHttpProxy((error:BusinessError,data:connection.HttpProxy) => {
          if(error) {
            console.error(`${caseName} Failed to get default http proxy  .code: ${error.code},message:${error.message}`)
            ExpectFail();
            done();
            return
          }
          console.log(`${caseName} succeeded to get data ${JSON.stringify(data)}`)
          expect(data.host).assertEqual(httpProxy.host)
          done()
        })
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
        console.info(`${caseName}---End`);
      }
    });

    /**
     * @tc.number : SUB_Network_Connection_SetAppHttpProxy_0200
     * @tc.name   : testConnectionSetHttpProxyCallback0200
     * @tc.desc   : Set network application level HTTP proxy configuration information.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testConnectionSetHttpProxyCallback0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testConnectionSetHttpProxyCallback0200';
      console.info(`${caseName}---Start`);

      try {
        const httpProxy: connection.HttpProxy = {
          host: "10.136.15.254",
          port: 8081,
          exclusionList: exclusionArray,
          username: "",
        }
        connection.setAppHttpProxy(httpProxy as connection.HttpProxy);
        connection.getDefaultHttpProxy((error:BusinessError,data:connection.HttpProxy) => {
          if(error) {
            console.error(`${caseName} Failed to get default http proxy  .code: ${error.code},message:${error.message}`)
            ExpectFail();
            done();
            return
          }
          console.log(`${caseName} succeeded to get data ${JSON.stringify(data)}`)
          expect(data.host).assertEqual(httpProxy.host)
          done()
        })
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
        console.info(`${caseName}---End`);
      }
    });

    /**
     * @tc.number : SUB_Network_Connection_SetAppHttpProxy_0300
     * @tc.name   : testConnectionSetHttpProxyCallback0300
     * @tc.desc   : Set network application level HTTP proxy configuration information.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testConnectionSetHttpProxyCallback0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testConnectionSetHttpProxyCallback0300';
      console.info(`${caseName}---Start`);
      try {
        const httpProxy: connection.HttpProxy = {
          host: "10.136.15.254",
          port: 8081,
          exclusionList: exclusionArray,
          username: undefined,
        }
        connection.setAppHttpProxy(httpProxy as connection.HttpProxy);
        ExpectFail()
        done()
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(true)
        done()
        console.info(`${caseName}---End`);
      }
    });

    /**
     * @tc.number : SUB_Network_Connection_SetAppHttpProxy_0400
     * @tc.name   : testConnectionSetHttpProxyCallback0400
     * @tc.desc   : Set network application level HTTP proxy configuration information.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testConnectionSetHttpProxyCallback0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testConnectionSetHttpProxyCallback0400';
      console.info(`${caseName}---Start`);
      try {
        const httpProxy: connection.HttpProxy = {
          host: "10.136.15.254",
          port: 8081,
          exclusionList: exclusionArray,
          password: '123456',
        }
        connection.setAppHttpProxy(httpProxy as connection.HttpProxy);
        connection.getDefaultHttpProxy((error:BusinessError,data:connection.HttpProxy) => {
          if(error) {
            console.error(`${caseName} Failed to get default http proxy  .code: ${error.code},message:${error.message}`)
            ExpectFail();
            done();
            return
          }
          console.log(`${caseName} succeeded to get data ${JSON.stringify(data)}`)
          expect(data.host).assertEqual(httpProxy.host)
          done()
        })
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
        console.info(`${caseName}---End`);
      }
    });

    /**
     * @tc.number : SUB_Network_Connection_SetAppHttpProxy_0500
     * @tc.name   : testConnectionSetHttpProxyCallback0500
     * @tc.desc   : Set network application level HTTP proxy configuration information.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testConnectionSetHttpProxyCallback0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testConnectionSetHttpProxyCallback0500';
      console.info(`${caseName}---Start`);
      try {
        const httpProxy: connection.HttpProxy = {
          host: "10.136.15.254",
          port: 8081,
          exclusionList: exclusionArray,
          password: '',
        }
        connection.setAppHttpProxy(httpProxy as connection.HttpProxy);
        connection.getDefaultHttpProxy((error:BusinessError,data:connection.HttpProxy) => {
          if(error) {
            console.error(`${caseName} Failed to get default http proxy  .code: ${error.code},message:${error.message}`)
            ExpectFail();
            done();
            return
          }
          console.log(`${caseName} succeeded to get data ${JSON.stringify(data)}`)
          expect(data.host).assertEqual(httpProxy.host)
          done()
        })
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
        console.info(`${caseName}---End`);
      }
    });

    /**
     * @tc.number : SUB_Network_Connection_SetAppHttpProxy_0600
     * @tc.name   : testConnectionSetHttpProxyCallback0600
     * @tc.desc   : Set network application level HTTP proxy configuration information.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testConnectionSetHttpProxyCallback0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testConnectionSetHttpProxyCallback0600';
      console.info(`${caseName}---Start`);
      try {
        const httpProxy: connection.HttpProxy = {
          host: "10.136.15.254",
          port: 8081,
          exclusionList: exclusionArray,
          password: undefined,
        }
        connection.setAppHttpProxy(httpProxy as connection.HttpProxy);
        ExpectFail()
        done()
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(true)
        done()
        console.info(`${caseName}---End`);
      }
    });

    /**
     * @tc.number : SUB_Network_Connection_SetAppHttpProxy_0700
     * @tc.name   : testConnectionSetHttpProxyCallback0700
     * @tc.desc   : Set network application level HTTP proxy configuration information.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testConnectionSetHttpProxyCallback0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testConnectionSetHttpProxyCallback0700';
      console.info(`${caseName}---Start`);
      try {
        const httpProxy: connection.HttpProxy = {
          host: "10.136.15.254",
          port: 8081,
          exclusionList: exclusionArray,
          username: undefined,
          password: undefined,
        }
        connection.setAppHttpProxy(httpProxy as connection.HttpProxy);
        ExpectFail()
        done()
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(true)
        done()
        console.info(`${caseName}---End`);
      }
    });

    /**
     * @tc.number : SUB_Network_Connection_SetAppHttpProxy_0800
     * @tc.name   : testConnectionSetHttpProxyCallback0800
     * @tc.desc   : Set network application level HTTP proxy configuration information.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testConnectionSetHttpProxyCallback0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testConnectionSetHttpProxyCallback0800';
      console.info(`${caseName}---Start`);
      try {
        const httpProxy: connection.HttpProxy = {
          host: "10.136.15.254",
          port: 8081,
          exclusionList: exclusionArray,
          username: '',
          password: '',
        }
        connection.setAppHttpProxy(httpProxy as connection.HttpProxy);
        connection.getDefaultHttpProxy((error:BusinessError,data:connection.HttpProxy) => {
          if(error) {
            console.error(`${caseName} Failed to get default http proxy  .code: ${error.code},message:${error.message}`)
            ExpectFail();
            done();
            return
          }
          console.log(`${caseName} succeeded to get data ${JSON.stringify(data)}`)
          expect(data.host).assertEqual(httpProxy.host)
          done()
        })
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
        console.info(`${caseName}---End`);
      }
    });

    /**
     * @tc.number : SUB_Network_Connection_SetAppHttpProxy_0900
     * @tc.name   : testConnectionSetHttpProxyCallback0900
     * @tc.desc   : Set network application level HTTP proxy configuration information.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testConnectionSetHttpProxyCallback0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testConnectionSetHttpProxyCallback0900';
      console.info(`${caseName}---Start`);
      try {
        const httpProxy: connection.HttpProxy = {
          host: "10.136.15.254",
          port: 8081,
          exclusionList: exclusionArray,
          username: 'admin',
          password: '123456',
        }
        connection.setAppHttpProxy(httpProxy as connection.HttpProxy);
        connection.getDefaultHttpProxy((error:BusinessError,data:connection.HttpProxy) => {
          if(error) {
            console.error(`${caseName} Failed to get default http proxy  .code: ${error.code},message:${error.message}`)
            ExpectFail();
            done();
            return
          }
          console.log(`${caseName} succeeded to get data ${JSON.stringify(data)}`)
          expect(data.host).assertEqual(httpProxy.host)
          done()
        })
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
        console.info(`${caseName}---End`);
      }
    });

    /**
     * @tc.number     : SUB_Network_Connection_NetCapabilities_0200
     * @tc.name       : testNetworkConnectionNetCapabilities0200
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNetworkConnectionNetCapabilities0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testNetworkConnectionNetCapabilities0200';
      console.info(`${caseName}---Start`);
      try {
        network.getType({
          success: (data) => {
            console.log('success get network type:' + data.type);
            if(data.type === 'WiFi') {
              let netCon: connection.NetConnection = connection.createNetConnection({
                netCapabilities: {
                  bearerTypes: [connection.NetBearType.BEARER_WIFI]
                },
                bearerPrivateIdentifier: 'wifi'
              })
              console.info(`${caseName} netCon ->${JSON.stringify(netCon)}`)
              ExpectTrue(netCon != undefined)
              console.info(`${caseName} ----end`)
              done()
            }
          },
          fail:(err:ESObject) =>{
            console.log('fail get network type:' + err);
            ExpectFail();
            done()
          }
        });
      } catch (err) {
        console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        done()
        console.info(`${caseName}---End`);
      }
    });


    /**
     * @tc.number : SUB_Network_Connection_setPacUrl_0100
     * @tc.name   : testNetworkConnectionsetPacUrl0100
     * @tc.desc   : Set the system-level proxy auto-config (PAC) script URL to be empty
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkConnectionsetPacUrl0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testNetworkConnectionsetPacUrl0100';
      console.info(`${caseName}---Start`);
      try{
        let pacUrl = ""
        connection.setPacUrl(pacUrl);
        ExpectFail();
        done();
      }catch (err){
        ExpectTrue(err.code == 401)
        console.log(`${caseName} Error in`,err);
        done()
      }
    });


    /**
     * @tc.number : SUB_Network_Connection_getPacUrl_0100
     * @tc.name   : testNetworkConnectiongetPacUrl0100
     * @tc.desc   :get the system-level proxy auto-config (PAC) script URL
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkConnectiongetPacUrl0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testNetworkConnectiongetPacUrl0100';
      console.info(`${caseName}---Start`);
      try{
        let pacUrl :string=  connection.getPacUrl();
        console.log(`${caseName} pacUrl is `,pacUrl);
        ExpectTrue(true);
        done();
      }catch (err){
        if (err){
          console.log(`${caseName}} getPac fail `,JSON.stringify(err));
          ExpectTrue(err.code == 2100003);
        }
        else {
          console.log(`${caseName}} Error in`,JSON.stringify(err));
          ExpectFail();
        }
        done();
      }
    });

    
    /**
     * @tc.number : SUB_Network_Connection_setPacUrl_0200
     * @tc.name   : testConnectionsetPacUrl0200
     * @tc.desc   : Set network application level HTTP proxy configuration information.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testConnectionsetPacUrl0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testConnectionsetPacUrl0200';
      console.info(`${caseName}---Start`);
      try{
        let pacUrl = "https://www.baidu.com";
        connection.setPacUrl(pacUrl)
        ExpectTrue(true);
        done();
      }catch (err){
        console.log(`${caseName} error in `,err)
        ExpectFail();
        done()
      }
    });
  })
}