/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import socket from '@ohos.net.socket';
import { BusinessError } from '@ohos.base';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType} from '@ohos/hypium';

let instance: socket.TLSSocket;
let bindAddr: socket.NetAddress = {
  address: '127.0.0.1',
  port: 8080
};

export default function NetManagerTLSSupportSendArrayBufferTest() {
  describe('NetManagerTLSSupportSendArrayBufferTest', ()=> {

    const ExpectTrue = (n: boolean) => {
      try {
        expect(n).assertTrue();
      } catch (err) {
        console.info("expectInfo", `test failed`);
      }
    }
    const ExpectFalse = (n: boolean) => {
      try {
        expect(n).assertFail();
      } catch (err) {
        console.info("expectInfo", `test failed`);
      }
    }

    /**
     * @tc.name   SUB_NetManager_NetStack_Api_TLSSupportSendArrayBuffer_0100
     * @tc.number SUB_NetManager_NetStack_Api_TLSSupportSendArrayBuffer_0100
     * @tc.desc   Test callback TLSSocketInstance send ArrayBuffer fail.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_NetManager_NetStack_Api_TLSSupportSendArrayBuffer_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'SUB_NetManager_NetStack_Api_TLSSupportSendArrayBuffer_0100';
      try {
        let typedArray: Uint8Array = new Uint8Array( [1, 2, 3, 4] );
        let sendDataArrayBuffer = typedArray.buffer as ArrayBuffer;
        instance = socket.constructTLSSocketInstance();
        instance.bind(bindAddr, (err: Error) => {
          if(err) {
            console.info(`${caseName} bind fail, error is ${JSON.stringify(err)}`);
          } else {
            console.info(`${caseName} bind success`);
            instance.send(sendDataArrayBuffer, (err) => {
              if(err == undefined) {
                console.info(`${caseName} send ArrayBuffer success`);
                ExpectFalse(true);
                done();
              } else {
                console.info(`${caseName} send ArrayBuffer fail, error is ${JSON.stringify(err)}`);
                ExpectTrue(err.code == 2303501);
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.name   SUB_NetManager_NetStack_Api_TLSSupportSendArrayBuffer_0200
     * @tc.number SUB_NetManager_NetStack_Api_TLSSupportSendArrayBuffer_0200
     * @tc.desc   Test promise TLSSocketInstance send ArrayBuffer fail.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_NetManager_NetStack_Api_TLSSupportSendArrayBuffer_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName = 'SUB_NetManager_NetStack_Api_TLSSupportSendArrayBuffer_0200';
      try {
        let typedArray: Uint8Array = new Uint8Array( [1, 2, 3, 4] );
        let sendDataArrayBuffer = typedArray.buffer as ArrayBuffer;
        instance = socket.constructTLSSocketInstance();
        instance.bind(bindAddr).then(() => {
          console.info(`${caseName} bind success`);
          instance.send(sendDataArrayBuffer).then(() => {
            console.info(`${caseName} send ArrayBuffer success`);
            ExpectFalse(true);
            done();
          }).catch((err:BusinessError) => {
            console.info(`${caseName} send ArrayBuffer fail, error is ${JSON.stringify(err)}`);
            ExpectTrue(err.code == 2303501);
            done();
          });
        }).catch((err:Error) => {
          console.info(`${caseName} bind fail, error is ${JSON.stringify(err)}`);
        });
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.name   SUB_NetManager_NetStack_Api_TLSSupportSendArrayBuffer_0300
     * @tc.number SUB_NetManager_NetStack_Api_TLSSupportSendArrayBuffer_0300
     * @tc.desc   Test callback TLSSocketInstance send string fail.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_NetManager_NetStack_Api_TLSSupportSendArrayBuffer_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName = 'SUB_NetManager_NetStack_Api_TLSSupportSendArrayBuffer_0300';
      try {
        instance = socket.constructTLSSocketInstance();
        instance.bind(bindAddr, (err: Error) => {
          if(err) {
            console.info(`${caseName} bind fail, error is ${JSON.stringify(err)}`);
          } else {
            console.info(`${caseName} bind success`);
            instance.send("", (err) => {
              if(err == undefined) {
                console.info(`${caseName} send string success`);
                ExpectFalse(true);
                done();
              } else {
                console.info(`${caseName} send string fail, error is ${JSON.stringify(err)}`);
                ExpectTrue(err.code == 401);
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.name   SUB_NetManager_NetStack_Api_TLSSupportSendArrayBuffer_0400
     * @tc.number SUB_NetManager_NetStack_Api_TLSSupportSendArrayBuffer_0400
     * @tc.desc   Test promise TLSSocketInstance send string fail.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_NetManager_NetStack_Api_TLSSupportSendArrayBuffer_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName = 'SUB_NetManager_NetStack_Api_TLSSupportSendArrayBuffer_0400';
      try {
        instance = socket.constructTLSSocketInstance();
        instance.bind(bindAddr).then(() => {
          console.info(`${caseName} bind success`);
          instance.send("").then(() => {
            console.info(`${caseName} send string success`);
            ExpectFalse(true);
            done();
          }).catch((err:BusinessError) => {
            console.info(`${caseName} send string fail, error is ${JSON.stringify(err)}`);
            ExpectTrue(err.code == 401);
            done();
          });
        }).catch((err:Error) => {
          console.info(`${caseName} bind fail, error is ${JSON.stringify(err)}`);
        });
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.name   SUB_NetManager_NetStack_Api_TLSSupportSendArrayBuffer_0500
     * @tc.number SUB_NetManager_NetStack_Api_TLSSupportSendArrayBuffer_0500
     * @tc.desc   Test callback TLSSocketInstance send empty ArrayBuffer fail.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_NetManager_NetStack_Api_TLSSupportSendArrayBuffer_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName = 'SUB_NetManager_NetStack_Api_TLSSupportSendArrayBuffer_0500';
      try {
        let typedArray: Uint8Array = new Uint8Array();
        let sendEmptyArrayBuffer = typedArray.buffer as ArrayBuffer;
        instance = socket.constructTLSSocketInstance();
        instance.bind(bindAddr, (err: Error) => {
          if(err) {
            console.info(`${caseName} bind fail, error is ${JSON.stringify(err)}`);
          } else {
            console.info(`${caseName} bind success`);
            instance.send(sendEmptyArrayBuffer, (err) => {
              if(err == undefined) {
                console.info(`${caseName} send empty ArrayBuffer success`);
                ExpectFalse(true);
                done();
              } else {
                console.info(`${caseName} send empty ArrayBuffer fail, error is ${JSON.stringify(err)}`);
                ExpectTrue(err.code == 401);
                done();
              }
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.name   SUB_NetManager_NetStack_Api_TLSSupportSendArrayBuffer_0600
     * @tc.number SUB_NetManager_NetStack_Api_TLSSupportSendArrayBuffer_0600
     * @tc.desc   Test promise TLSSocketInstance send empty ArrayBuffer fail.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_NetManager_NetStack_Api_TLSSupportSendArrayBuffer_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName = 'SUB_NetManager_NetStack_Api_TLSSupportSendArrayBuffer_0600';
      try {
        let typedArray: Uint8Array = new Uint8Array();
        let sendEmptyArrayBuffer = typedArray.buffer as ArrayBuffer;
        instance = socket.constructTLSSocketInstance();
        instance.bind(bindAddr).then(() => {
          console.info(`${caseName} bind success`);
          instance.send(sendEmptyArrayBuffer).then(() => {
            console.info(`${caseName} send empty ArrayBuffer success`);
            ExpectFalse(true);
            done();
          }).catch((err:BusinessError) => {
            console.info(`${caseName} send empty ArrayBuffer fail, error is ${JSON.stringify(err)}`);
            ExpectTrue(err.code == 401);
            done();
          });
        }).catch((err:Error) => {
          console.info(`${caseName} bind fail, error is ${JSON.stringify(err)}`);
        });
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
    });
  });
}