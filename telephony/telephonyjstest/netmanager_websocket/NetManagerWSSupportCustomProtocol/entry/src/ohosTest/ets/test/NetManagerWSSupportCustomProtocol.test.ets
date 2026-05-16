/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import webSocket from '@ohos.net.webSocket';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType} from '@ohos/hypium';
import { BusinessError } from '@ohos.base';

export default function NetManagerWSSupportCustomProtocol() {
  describe('NetManagerWSSupportCustomProtocol', () => {

    const ExpectFalse = (n:boolean) => {
      try {
        expect(n).assertFalse();
      } catch (err) {
        console.info("expectInfo", `test failed`);
      }
    }

    const ExpectTrue = (n:boolean) => {
      try {
        expect(n).assertTrue();
      } catch (err) {
        console.info("expectInfo", `test failed`);
      }
    }

    /**
     * @tc.name   SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0100
     * @tc.number SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0100
     * @tc.desc   Test callback options protocol connect success.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done : Function) => {
      console.info("SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0100 test start")
      try {
        let webSock = webSocket.createWebSocket();
        webSock.on("error" , (err: BusinessError) => {
          console.info("NETSTACK error: " +  JSON.stringify(err));
          ExpectTrue(err.code == 200);
        })

        webSock.connect("ws://192.168.0.120:9000" , {
          protocol: 'my-protocol'
        } ,  (err , data) => {
          console.info("NETSTACK connect err is : " +  JSON.stringify(err) + "data is" + JSON.stringify(data));
          ExpectTrue(data);
        })
        webSock.off("error");
        done();
      } catch (error){
        console.info("NETSTACK try catch error : " +  JSON.stringify(error));
        ExpectFalse(true);
        done();
      }
      console.info("SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0100 test end");
    })

    /**
     * @tc.name   SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0200
     * @tc.number SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0200
     * @tc.desc   Test promise options protocol connect success.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done : Function) => {
      console.info("SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0200 test start")
      try {
        let webSock = webSocket.createWebSocket();
        webSock.on("error" , (err: BusinessError) => {
          console.info("NETSTACK error: " +  JSON.stringify(err));
          ExpectTrue(err.code == 200);
        })

        webSock.connect("ws://192.168.0.120:9000", {
          protocol: 'my-protocol'
        }).then((data) => {
          console.info("NETSTACK connect data is" + JSON.stringify(data));
          ExpectTrue(data);
        }).catch((error: BusinessError) => {
          console.info("NETSTACK connect error is" + JSON.stringify(error));
        })
        webSock.off("error");
        done();

      } catch (error){
        console.info("NETSTACK try catch error : " +  JSON.stringify(error));
        ExpectFalse(true);
        done();
      }
      console.info("SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0200 test end");
    })

    /**
     * @tc.name   SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0300
     * @tc.number SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0300
     * @tc.desc   Test callback options proxy and protocol connect success.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done : Function) => {
      console.info("SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0300 test start")
      try {
        let proxyConfig:webSocket.ProxyConfiguration = 'system';
        let webSock = webSocket.createWebSocket();
        webSock.on("error" , (err: BusinessError) => {
          console.info("NETSTACK error: " +  JSON.stringify(err));
          ExpectTrue(err.code == 200);
        })

        webSock.connect("ws://192.168.0.120:9000" , {
          proxy: proxyConfig,
          protocol: 'my-protocol'
        } ,  (err , data) => {
          console.info("NETSTACK connect err is : " +  JSON.stringify(err) + "data is" + JSON.stringify(data));
          ExpectTrue(data);
        })
        webSock.off("error");
        done();
      } catch (error){
        console.info("NETSTACK try catch error : " +  JSON.stringify(error));
        ExpectFalse(true);
        done();
      }
      console.info("SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0300 test end");
    })

    /**
     * @tc.name   SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0400
     * @tc.number SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0400
     * @tc.desc   Test promise options proxy and protocol connect success.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done : Function) => {
      console.info("SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0400 test start")
      try {
        let proxyConfig:webSocket.ProxyConfiguration = 'no-proxy';
        let webSock = webSocket.createWebSocket();
        webSock.on("error" , (err: BusinessError) => {
          console.info("NETSTACK error: " +  JSON.stringify(err));
          ExpectTrue(err.code == 200);
        })

        webSock.connect("ws://192.168.0.120:9000", {
          proxy: proxyConfig,
          protocol: 'my-protocol'
        }).then((data) => {
          console.info("NETSTACK connect data is" + JSON.stringify(data));
          ExpectTrue(data);
        }).catch((error: BusinessError) => {
          console.info("NETSTACK connect error is" + JSON.stringify(error));
        })
        webSock.off("error");
        done();

      } catch (error){
        console.info("NETSTACK try catch error : " +  JSON.stringify(error));
        ExpectFalse(true);
        done();
      }
      console.info("SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0400 test end");
    })

    /**
     * @tc.name   SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0500
     * @tc.number SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0500
     * @tc.desc   Test callback options protocol null connect success.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done : Function) => {
      console.info("SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0500 test start")
      try {
        let proxyConfig:webSocket.ProxyConfiguration = {
            host: '111110' ,
            port: 123 ,
            exclusionList: ['32123']
          };
        let webSock = webSocket.createWebSocket();
        webSock.on("error" , (err: BusinessError) => {
          console.info("NETSTACK error: " +  JSON.stringify(err));
          ExpectTrue(err.code == 200);
        })

        webSock.connect("ws://192.168.0.120:9000" , {
          proxy: proxyConfig,
          protocol: null
        } ,  (err , data) => {
          console.info("NETSTACK connect err is : " +  JSON.stringify(err) + "data is" + JSON.stringify(data));
          ExpectTrue(data);
        })
        webSock.off("error");
        done();
      } catch (error){
        console.info("NETSTACK try catch error : " +  JSON.stringify(error));
        ExpectFalse(true);
        done();
      }
      console.info("SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0500 test end");
    })

    /**
     * @tc.name   SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0600
     * @tc.number SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0600
     * @tc.desc   Test callback options protocol undefined connect success.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done : Function) => {
      console.info("SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0600 test start")
      try {
        let webSock = webSocket.createWebSocket();
        webSock.on("error" , (err: BusinessError) => {
          console.info("NETSTACK error: " +  JSON.stringify(err));
          ExpectTrue(err.code == 200);
        })

        webSock.connect("ws://192.168.0.120:9000" , {
          proxy: {
            host: '111110' ,
            port: 123 ,
            exclusionList: ['32123']
          },
          protocol: undefined
        } ,  (err , data) => {
          console.info("NETSTACK connect err is : " +  JSON.stringify(err) + "data is" + JSON.stringify(data));
          ExpectTrue(data);
        })
        webSock.off("error");
        done();
      } catch (error){
        console.info("NETSTACK try catch error : " +  JSON.stringify(error));
        ExpectFalse(true);
        done();
      }
      console.info("SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0600 test end");
    })

    /**
     * @tc.name   SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0700
     * @tc.number SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0700
     * @tc.desc   Test promise options protocol undefined connect success.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done : Function) => {
      console.info("SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0700 test start")
      try {
        let webSock = webSocket.createWebSocket();
        webSock.on("error" , (err: BusinessError) => {
          console.info("NETSTACK error: " +  JSON.stringify(err));
          ExpectTrue(err.code == 200);
        })

        webSock.connect("ws://192.168.0.120:9000", {
          proxy: {
            host: '111110' ,
            port: 123 ,
            exclusionList: ['32123']
          },
          protocol: undefined
        }).then((data) => {
          console.info("NETSTACK connect data is" + JSON.stringify(data));
          ExpectTrue(data);
        }).catch((error: BusinessError) => {
          console.info("NETSTACK connect error is" + JSON.stringify(error));
        })
        webSock.off("error");
        done();

      } catch (error){
        console.info("NETSTACK try catch error : " +  JSON.stringify(error));
        ExpectFalse(true);
        done();
      }
      console.info("SUB_NetworkManager_NetStack_Api_WSSupportCustomProtocol_0700 test end");
    })
  })
}