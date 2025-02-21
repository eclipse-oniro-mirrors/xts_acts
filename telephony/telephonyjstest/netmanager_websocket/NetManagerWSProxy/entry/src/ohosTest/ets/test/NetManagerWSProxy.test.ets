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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';

export default function NetManagerWSProxy() {
  describe('NetManagerWSProxy', () => {

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
     * @tc.number SUB_NetworkManager_NetStack_Api_WSProxy_0100
     * @tc.name SUB_NetworkManager_NetStack_Api_WSProxy_0100
     * @tc.desc Test callback options default connect success.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_NetworkManager_NetStack_Api_WSProxy_0100', 0, (done : Function) => {
      console.info("SUB_NetworkManager_NetStack_Api_WSProxy_0100 test start")
      try {
        let webSock = webSocket.createWebSocket();
        webSock.on("error" , (err: BusinessError) => {
          console.info("NETSTACK error: " +  JSON.stringify(err));
          ExpectTrue(err.code == 200);
        })

        webSock.connect("ws://192.168.0.120:9000" , (err , data) => {
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
      console.info("SUB_NetworkManager_NetStack_Api_WSProxy_0100 test end");
    })

    /**
     * @tc.number SUB_NetworkManager_NetStack_Api_WSProxy_0200
     * @tc.name SUB_NetworkManager_NetStack_Api_WSProxy_0200
     * @tc.desc Test promise options default connect success.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_NetworkManager_NetStack_Api_WSProxy_0200', 0, (done : Function) => {
      console.info("SUB_NetworkManager_NetStack_Api_WSProxy_0200 test start")
      try {
        let webSock = webSocket.createWebSocket();
        webSock.on("error" , (err: BusinessError) => {
          console.info("NETSTACK error: " +  JSON.stringify(err));
          ExpectTrue(err.code == 200);
        })

        webSock.connect("ws://192.168.0.120:9000").then((data) => {
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
      console.info("SUB_NetworkManager_NetStack_Api_WSProxy_0200 test end");
    })


    /**
     * @tc.number SUB_NetworkManager_NetStack_Api_WSProxy_0300
     * @tc.name SUB_NetworkManager_NetStack_Api_WSProxy_0300
     * @tc.desc Test callback options proxy connect success.
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_NetworkManager_NetStack_Api_WSProxy_0300', 0, (done : Function) => {
      console.info("SUB_NetworkManager_NetStack_Api_WSProxy_0300 test start")
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
          }
        } , (err , data) => {
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
      console.info("SUB_NetworkManager_NetStack_Api_WSProxy_0300 test end");
    })

    /**
     * @tc.number SUB_NetworkManager_NetStack_Api_WSProxy_0400
     * @tc.name SUB_NetworkManager_NetStack_Api_WSProxy_0400
     * @tc.desc Test promise options proxy connect success.
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_NetworkManager_NetStack_Api_WSProxy_0400', 0, (done : Function) => {
      console.info("SUB_NetworkManager_NetStack_Api_WSProxy_0400 test start")
      try {
        let webSock = webSocket.createWebSocket();
        webSock.on("error" , (err: BusinessError) => {
          console.info("NETSTACK error: " +  JSON.stringify(err));
          ExpectTrue(err.code == 200);
        })

        webSock.connect("ws://192.168.0.120:9000"  , {
          proxy: {
            host: '111110' ,
            port: 123 ,
            exclusionList: ['32123']
          }
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
      console.info("SUB_NetworkManager_NetStack_Api_WSProxy_0400 test end");
    })

    /**
     * @tc.number SUB_NetworkManager_NetStack_Api_WSProxy_0500
     * @tc.name SUB_NetworkManager_NetStack_Api_WSProxy_0500
     * @tc.desc Test callback options null connect success.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_NetworkManager_NetStack_Api_WSProxy_0500', 0, (done : Function) => {
      console.info("SUB_NetworkManager_NetStack_Api_WSProxy_0500 test start")
      try {
        let webSock = webSocket.createWebSocket();
        webSock.on("error" , (err: BusinessError) => {
          console.info("NETSTACK error: " +  JSON.stringify(err));
          ExpectTrue(err.code == 200);
        })

        webSock.connect("ws://192.168.0.120:9000" , null , (err , data) => {
          console.info("NETSTACK connect err is : " +  JSON.stringify(err) + "data is" + JSON.stringify(data));
          ExpectTrue(err.code  == 401);
        })
        webSock.off("error");
        done();

      } catch (error){
        console.info("NETSTACK try catch error : " +  JSON.stringify(error));
        ExpectFalse(true);
        done();
      }
      console.info("SUB_NetworkManager_NetStack_Api_WSProxy_0500 test end");
    })

    /**
     * @tc.number SUB_NetworkManager_NetStack_Api_WSProxy_0600
     * @tc.name SUB_NetworkManager_NetStack_Api_WSProxy_0600
     * @tc.desc Test callback options undefined connect success.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_NetworkManager_NetStack_Api_WSProxy_0600', 0, (done : Function) => {
      console.info("SUB_NetworkManager_NetStack_Api_WSProxy_0600 test start")
      try {
        let webSock = webSocket.createWebSocket();
        webSock.on("error" , (err: BusinessError) => {
          console.info("NETSTACK error: " +  JSON.stringify(err));
          ExpectTrue(err.code == 200);
        })

        webSock.connect("ws://192.168.0.120:9000" , undefined , (err , data) => {
          console.info("NETSTACK connect err is : " +  JSON.stringify(err) + "data is" + JSON.stringify(data));
          ExpectTrue(err.code  == 401);
        })
        webSock.off("error");
        done();

      } catch (error){
        console.info("NETSTACK try catch error : " +  JSON.stringify(error));
        ExpectFalse(true);
        done();
      }
      console.info("SUB_NetworkManager_NetStack_Api_WSProxy_0600 test end");
    })

    /**
     * @tc.number SUB_NetworkManager_NetStack_Api_WSProxy_0700
     * @tc.name SUB_NetworkManager_NetStack_Api_WSProxy_0700
     * @tc.desc Test callback options proxy null connect success.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_NetworkManager_NetStack_Api_WSProxy_0700', 0, (done : Function) => {
      console.info("SUB_NetworkManager_NetStack_Api_WSProxy_0700 test start")
      try {
        let webSock = webSocket.createWebSocket();
        webSock.on("error" , (err: BusinessError) => {
          console.info("NETSTACK error: " +  JSON.stringify(err));
          ExpectTrue(err.code == 200);
        })

        webSock.connect("ws://192.168.0.120:9000" , {
          proxy: null
        } , (err , data) => {
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
      console.info("SUB_NetworkManager_NetStack_Api_WSProxy_0700 test end");
    })

    /**
     * @tc.number SUB_NetworkManager_NetStack_Api_WSProxy_0800
     * @tc.name SUB_NetworkManager_NetStack_Api_WSProxy_0800
     * @tc.desc Test callback options proxy undefined connect success.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_NetworkManager_NetStack_Api_WSProxy_0800', 0, (done : Function) => {
      console.info("SUB_NetworkManager_NetStack_Api_WSProxy_0800 test start")
      try {
        let webSock = webSocket.createWebSocket();
        webSock.on("error" , (err: BusinessError) => {
          console.info("NETSTACK error: " +  JSON.stringify(err));
          ExpectTrue(err.code == 200);
        })

        webSock.connect("ws://192.168.0.120:9000" , {
          proxy: undefined
        } , (err , data) => {
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
      console.info("SUB_NetworkManager_NetStack_Api_WSProxy_0800 test end");
    })

    /**
     * @tc.number SUB_NetworkManager_NetStack_Api_WSProxy_0900
     * @tc.name SUB_NetworkManager_NetStack_Api_WSProxy_0900
     * @tc.desc Test promise options proxy undefined connect success.
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_NetworkManager_NetStack_Api_WSProxy_0900', 0, (done : Function) => {
      console.info("SUB_NetworkManager_NetStack_Api_WSProxy_0900 test start")
      try {
        let webSock = webSocket.createWebSocket();
        webSock.on("error" , (err: BusinessError) => {
          console.info("NETSTACK error: " +  JSON.stringify(err));
          ExpectTrue(err.code == 200);
        })

        webSock.connect("ws://192.168.0.120:9000"  , {
          proxy: undefined
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
      console.info("SUB_NetworkManager_NetStack_Api_WSProxy_0900 test end");
    })
  })
}