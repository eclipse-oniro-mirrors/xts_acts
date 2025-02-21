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

import { describe, expect, it } from '@ohos/hypium';
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
     * @tc.name   : testConnectionSetHttpProxyCallback0100
     * @tc.desc   : Set network application level HTTP proxy configuration information.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testConnectionSetHttpProxyCallback0100', 0, async (done: Function) => {
      const caseName: string = 'testConnectionSetHttpProxyCallback0100';
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
    it('testConnectionSetHttpProxyCallback0200', 0, async (done: Function) => {
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
    it('testConnectionSetHttpProxyCallback0300', 0, async (done: Function) => {
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
    it('testConnectionSetHttpProxyCallback0400', 0, async (done: Function) => {
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
    it('testConnectionSetHttpProxyCallback0500', 0, async (done: Function) => {
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
    it('testConnectionSetHttpProxyCallback0600', 0, async (done: Function) => {
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
    it('testConnectionSetHttpProxyCallback0700', 0, async (done: Function) => {
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
    it('testConnectionSetHttpProxyCallback0800', 0, async (done: Function) => {
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
    it('testConnectionSetHttpProxyCallback0900', 0, async (done: Function) => {
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
     * @tc.name       : testConnectionNetCapabilities0200
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testConnectionNetCapabilities0200', 0, async (done: Function) => {
      const caseName: string = 'testConnectionNetCapabilities0200';
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
  })
}

