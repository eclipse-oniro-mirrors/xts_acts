/*
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs';
import wsAPI from 'libtestNetStackNdk.so'

const WEBSOCKET_OK = 0;
const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;
const CASE_INDEX_3 = 3;
const CASE_INDEX_4 = 4;
const CASE_INDEX_5 = 4;
const CASE_INDEX_6 = 6;
const CASE_INDEX_7 = 7;
const CASE_INDEX_8 = 8;
const CASE_INDEX_9 = 9;
const CASE_INDEX_10 = 10;
const CASE_INDEX_11 = 11;
// 未指定的错误。
const ERROR_CODE_69 = 69;
// 未指定的错误。
const ERROR_CODE_2305001 = 2305001;
const ERROR_CODE_2305069 = 2305069;

// websocket客户端为null。
const ERROR_CODE_1001 = 1001;
// 内存不足，无法在安装websocket连接期间创建上下文。
const ERROR_CODE_1006 = 1006;
// websocket客户端发送的数据为null。
const ERROR_CODE_1011 = 1011;
// websocket客户端发送的数据长度超过了限制。
const ERROR_CODE_1012 = 1012;
// 未连接websocket客户端。
const ERROR_CODE_1017 = 1017;
// websocket客户端没有连接上下文。
const ERROR_CODE_1018 = 1018;
// 参数错误。
const ERROR_CODE_401 = 401;

let pemPath : string = '';
let derPath : string = '';

function getRawFileContentWrapper(filePath: string) : Promise<Uint8Array> {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let context = abilityDelegator.getAppContext();
  return new Promise<Uint8Array>((resolve, reject) => {
    context.resourceManager.getRawFileContent(filePath, (error, model_buffer) => {
      if (error) {
        reject(error);
      } else {
        resolve(model_buffer);
      }
    });
  });
}

async function writeFile() {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let context = abilityDelegator.getAppContext();
  pemPath = context.filesDir + '/cacert.pem';
  try {
    const model_buffer = await getRawFileContentWrapper('cacert.pem');
    let file = fs.openSync(pemPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.writeSync(file.fd, model_buffer.buffer);
    fs.closeSync(file);
    console.log(`[rawfile_copy_to_sandbox] ${pemPath} is copy success`);
  } catch (error) {
    console.log(`[rawfile_copy_to_sandbox] ${pemPath} is copy failed:${error.code}, message: ${error.message}.`);
  }

  derPath = context.filesDir + '/der_cacert.der';
  try {
    const model_buffer = await getRawFileContentWrapper('der_cacert.der');
    let file = fs.openSync(derPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.writeSync(file.fd, model_buffer.buffer);
    fs.closeSync(file);
    console.log(`[rawfile_copy_to_sandbox] ${derPath} is copy success`);
  } catch (error) {
    console.log(`[rawfile_copy_to_sandbox] ${derPath} is copy failed:${error.code}, message: ${error.message}.`);
  }

}

export default function NetStackNDKTest() {

  describe('NetStackNDKWebSocketClientTest', () => {

    beforeAll(async (done: Function) => {
      await writeFile();
      done();
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETSTACKCERTVERIFICATION_0100
     * @tc.name   ：TestOHNetStackCertVerification_0100
     * @tc.desc   ：Certificate chain verification interface.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetStackCertVerification_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHNetStackCertVerification(CASE_INDEX_1, pemPath, derPath);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETSTACKCERTVERIFICATION_0200
     * @tc.name   ：TestOHNetStackCertVerification_0200
     * @tc.desc   ：Certificate chain verification interface.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('testOHNetStackCertVerification_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackCertVerification(CASE_INDEX_2, pemPath, derPath);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETSTACKCERTVERIFICATION_0300
     * @tc.name   ：TestOHNetStackCertVerification_0300
     * @tc.desc   ：Certificate chain verification interface.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetStackCertVerification_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHNetStackCertVerification(CASE_INDEX_3, pemPath, derPath);
      expect(result).assertEqual(ERROR_CODE_69);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETSTACKCERTVERIFICATION_0400
     * @tc.name   ：TestOHNetStackCertVerification_0400
     * @tc.desc   ：Certificate chain verification interface.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetStackCertVerification_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHNetStackCertVerification(CASE_INDEX_4, pemPath, derPath);
      expect(result).assertEqual(ERROR_CODE_69);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETSTACKCERTVERIFICATION_0500
     * @tc.name   ：TestOHNetStackCertVerification_0500
     * @tc.desc   ：Certificate chain verification interface.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetStackCertVerification_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHNetStackCertVerification(CASE_INDEX_5, pemPath, derPath);
      expect(result).assertEqual(ERROR_CODE_69);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETSTACKCERTVERIFICATION_0600
     * @tc.name   ：TestOHNetStackCertVerification_0600
     * @tc.desc   ：Certificate chain verification interface.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetStackCertVerification_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHNetStackCertVerification(CASE_INDEX_6, pemPath, derPath);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETSTACKCERTVERIFICATION_0700
     * @tc.name   ：TestOHNetStackCertVerification_0700
     * @tc.desc   ：Certificate chain verification interface.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetStackCertVerification_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHNetStackCertVerification(CASE_INDEX_7, pemPath, derPath);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETSTACKCERTVERIFICATION_0800
     * @tc.name   ：TestOHNetStackCertVerification_0800
     * @tc.desc   ：Certificate chain verification interface.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetStackCertVerification_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHNetStackCertVerification(CASE_INDEX_8, pemPath, derPath);
      expect(result).assertEqual(ERROR_CODE_69);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETSTACKCERTVERIFICATION_0900
     * @tc.name   ：TestOHNetStackCertVerification_0900
     * @tc.desc   ：Certificate chain verification interface.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetStackCertVerification_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHNetStackCertVerification(CASE_INDEX_9, pemPath, derPath);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETSTACKCERTVERIFICATION_1000
     * @tc.name   ：TestOHNetStackCertVerification_1000
     * @tc.desc   ：Certificate chain verification interface.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetStackCertVerification_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHNetStackCertVerification(CASE_INDEX_10, pemPath, derPath);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETSTACKCERTVERIFICATION_1100
     * @tc.name   ：TestOHNetStackCertVerification_1100
     * @tc.desc   ：Certificate chain verification interface.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetStackCertVerification_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHNetStackCertVerification(CASE_INDEX_11, pemPath, derPath);
      expect(result === ERROR_CODE_2305001 || result === ERROR_CODE_2305069 ).assertTrue();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETSTACKGETPINSETFORHOSTNAME_0100
     * @tc.name   : testOHNetStackGetPinSetForHostName_0100
     * @tc.desc   ：Get certificate interface.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('testOHNetStackGetPinSetForHostName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackGetPinSetForHostName(CASE_INDEX_1, "www.example.com".toString());
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETSTACKGETPINSETFORHOSTNAME_0200
     * @tc.name   : testOHNetStackGetPinSetForHostName_0200
     * @tc.desc   ：Get certificate interface.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetStackGetPinSetForHostName_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHNetStackGetPinSetForHostName(CASE_INDEX_2, "www.example.com".toString());
      expect(result).assertEqual(ERROR_CODE_401);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETSTACKGETPINSETFORHOSTNAME_0300
     * @tc.name   : testOHNetStackGetPinSetForHostName_0300
     * @tc.desc   ：Get certificate interface.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetStackGetPinSetForHostName_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHNetStackGetPinSetForHostName(CASE_INDEX_3, "www.example.com".toString());
      expect(result).assertEqual(ERROR_CODE_401);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETSTACKGETPINSETFORHOSTNAME_0400
     * @tc.name   : testOHNetStackGetPinSetForHostName_0400
     * @tc.desc   ：Get certificate interface.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetStackGetPinSetForHostName_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHNetStackGetPinSetForHostName(CASE_INDEX_4, "www.example.com".toString());
      expect(result).assertEqual(ERROR_CODE_401);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETSTACKGETPINSETFORHOSTNAME_0500
     * @tc.name   : testOHNetStackGetPinSetForHostName_0500
     * @tc.desc   ：Get certificate interface.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetStackGetPinSetForHostName_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : string = wsAPI.OHNetStackGetPinSetForHostName2("notexit.com".toString());
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETSTACKGETPINSETFORHOSTNAME_0600
     * @tc.name   : testOHNetStackGetPinSetForHostName_0600
     * @tc.desc   ：Get certificate interface.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetStackGetPinSetForHostName_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : string = wsAPI.OHNetStackGetPinSetForHostName2("getonepin.com".toString());
      expect(result).assertEqual("sha256//FEDCBA987654321");
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETSTACKGETPINSETFORHOSTNAME_0700
     * @tc.name   : testOHNetStackGetPinSetForHostName_0700
     * @tc.desc   ：Get certificate interface.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetStackGetPinSetForHostName_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : string = wsAPI.OHNetStackGetPinSetForHostName2("getmultipin.com".toString());
      expect(result).assertEqual("sha256//FEDCBA987654321;sha256//ABCDEF987654321;sha256//FEDCBA123456789");
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETSTACKGETPINSETFORHOSTNAME_0800
     * @tc.name   : testOHNetStackGetPinSetForHostName_0800
     * @tc.desc   ：Get certificate interface.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetStackGetPinSetForHostName_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : string = wsAPI.OHNetStackGetPinSetForHostName2("getoverduepin.com".toString());
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETSTACKGETCERTIFICATESFORHOSTNAME_0100
     * @tc.name   : testOHNetStackGetCertificatesForHostName_0100
     * @tc.desc   ：Get certificate interface.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetStackGetCertificatesForHostName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHNetStackGetCertificatesForHostName(CASE_INDEX_1, "www.example.com".toString());
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETSTACKGETCERTIFICATESFORHOSTNAME_0200
     * @tc.name   : testOHNetStackGetCertificatesForHostName_0200
     * @tc.desc   ：Get certificate interface.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetStackGetCertificatesForHostName_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHNetStackGetCertificatesForHostName(CASE_INDEX_2, "www.example.com".toString());
      expect(result).assertEqual(ERROR_CODE_401);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETSTACKGETCERTIFICATESFORHOSTNAME_0300
     * @tc.name   : testOHNetStackGetCertificatesForHostName_0300
     * @tc.desc   ：Get certificate interface.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('testOHNetStackGetCertificatesForHostName_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackGetCertificatesForHostName(CASE_INDEX_3, "www.example.com".toString());
      expect(result).assertEqual(ERROR_CODE_401);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETSTACKGETCERTIFICATESFORHOSTNAME_0400
     * @tc.name   : testOHNetStackGetCertificatesForHostName_0400
     * @tc.desc   ：Get certificate interface.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetStackGetCertificatesForHostName_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHNetStackGetCertificatesForHostName(CASE_INDEX_4, "www.example.com".toString());
      expect(result).assertEqual(ERROR_CODE_401);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETSTACKGETCERTIFICATESFORHOSTNAME_0500
     * @tc.name   : testOHNetStackGetCertificatesForHostName_0500
     * @tc.desc   ：Get certificate interface.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetStackGetCertificatesForHostName_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : Array<string> = wsAPI.OHNetStackGetCertificatesForHostName2("notexit.com".toString());
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETSTACKGETCERTIFICATESFORHOSTNAME_0600
     * @tc.name   : testOHNetStackGetCertificatesForHostName_0600
     * @tc.desc   ：Get certificate interface.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetStackGetCertificatesForHostName_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : Array<string> = wsAPI.OHNetStackGetCertificatesForHostName2("getonecert.com".toString());
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETSTACKGETCERTIFICATESFORHOSTNAME_0700
     * @tc.name   : testOHNetStackGetCertificatesForHostName_0700
     * @tc.desc   ：Get certificate interface.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('testOHNetStackGetCertificatesForHostName_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : Array<string> = wsAPI.OHNetStackGetCertificatesForHostName2("getmulticert.com".toString());
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHNETSTACKDESTROYCERTIFICATESCONTENT_0100
     * @tc.name   : testOHNetStackDestroyCertificatesContent_0100
     * @tc.desc   ：Get certificate interface.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHNetStackDestroyCertificatesContent_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      wsAPI.OHNetStackDestroyCertificatesContent();
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTCONSTRUCT_0100
     * @tc.name   ：TestOHWebSocketClientConstruct_0100
     * @tc.desc   ：The constructor for the Websocket client.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHWebSocketClientConstruct_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientConstruct(CASE_INDEX_1);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTCONSTRUCT_0200
     * @tc.name   ：TestOHWebSocketClientConstruct_0200
     * @tc.desc   ：The constructor for the Websocket client.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHWebSocketClientConstruct_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientConstruct(CASE_INDEX_2);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTCONSTRUCT_0300
     * @tc.name   ：TestOHWebSocketClientConstruct_0300
     * @tc.desc   ：The constructor for the Websocket client.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHWebSocketClientConstruct_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientConstruct(CASE_INDEX_3);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTCONSTRUCT_0400
     * @tc.name   ：TestOHWebSocketClientConstruct_0400
     * @tc.desc   ：The constructor for the Websocket client.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHWebSocketClientConstruct_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientConstruct(CASE_INDEX_4);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTCONSTRUCT_0500
     * @tc.name   ：TestOHWebSocketClientConstruct_0500
     * @tc.desc   ：The constructor for the Websocket client.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHWebSocketClientConstruct_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientConstruct(CASE_INDEX_5);
      expect(result).assertEqual(WEBSOCKET_OK);
    });


    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTADDHEADER_0100
     * @tc.name   ：TestOHWebSocketClientAddHeader_0100
     * @tc.desc   ：Add the header information to the client client request.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHWebSocketClientAddHeader_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number  = wsAPI.OHWebSocketClientAddHeader(CASE_INDEX_1);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTADDHEADER_0200
     * @tc.name   ：TestOHWebSocketClientConstruct_0200
     * @tc.desc   ：Add the header information to the client client request.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHWebSocketClientAddHeader_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number  = wsAPI.OHWebSocketClientAddHeader(CASE_INDEX_2);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTADDHEADER_0300
     * @tc.name   ：TestOHWebSocketClientAddHeader_0300
     * @tc.desc   ：Add the header information to the client client request.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHWebSocketClientAddHeader_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number  = wsAPI.OHWebSocketClientAddHeader(CASE_INDEX_3);
      expect(result).assertEqual(ERROR_CODE_1001);
    });


    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTCONNECT_0100
     * @tc.name   ：TestOHWebSocketClientConnect_0100
     * @tc.desc   ：Connect the client to the server.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHWebSocketClientConnect_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientConnect(CASE_INDEX_1);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTCONNECT_0200
     * @tc.name   ：TestOHWebSocketClientConnect_0200
     * @tc.desc   ：Connect the client to the server.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHWebSocketClientConnect_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientConnect(CASE_INDEX_2);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTCONNECT_0300
     * @tc.name   ：TestOHWebSocketClientConnect_0300
     * @tc.desc   ：Connect the client to the server.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHWebSocketClientConnect_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientConnect(CASE_INDEX_3);
      expect(result).assertEqual(ERROR_CODE_1001);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTCONNECT_0400
     * @tc.name   ：TestOHWebSocketClientConnect_0400
     * @tc.desc   ：Connect the client to the server.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHWebSocketClientConnect_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientConnect(CASE_INDEX_4);
      expect(result).assertEqual(ERROR_CODE_1006);
    });


    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTSEND_0100
     * @tc.name   ：TestOHWebSocketClientSend_0100
     * @tc.desc   ：The client sends data to the server.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHWebSocketClientSend_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientSend(CASE_INDEX_1);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTSEND_0200
     * @tc.name   ：TestOHWebSocketClientSend_0200
     * @tc.desc   ：The client sends data to the server.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHWebSocketClientSend_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientSend(CASE_INDEX_2);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTSEND_0300
     * @tc.name   ：TestOHWebSocketClientSend_0300
     * @tc.desc   ：The client sends data to the server.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHWebSocketClientSend_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientSend(CASE_INDEX_3);
      expect(result).assertEqual(ERROR_CODE_1011);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTSEND_0400
     * @tc.name   ：TestOHWebSocketClientSend_0400
     * @tc.desc   ：The client sends data to the server.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHWebSocketClientSend_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientSend(CASE_INDEX_4);
      expect(result).assertEqual(ERROR_CODE_1012);
    });


    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTCLOSE_0100
     * @tc.name   ：TestOHWebSocketClientClose_0100
     * @tc.desc   ：The client actively closes the websocket connection.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHWebSocketClientClose_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientClose(CASE_INDEX_1);
      expect(result).assertEqual(WEBSOCKET_OK);
    });
    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTCLOSE_0200
     * @tc.name   ：TestOHWebSocketClientClose_0200
     * @tc.desc   ：The client actively closes the websocket connection.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */

    it('testOHWebSocketClientClose_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientClose(CASE_INDEX_2);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTCLOSE_0300
     * @tc.name   ：TestOHWebSocketClientClose_0300
     * @tc.desc   ：The client actively closes the websocket connection.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHWebSocketClientClose_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientClose(CASE_INDEX_3);
      expect(result).assertEqual(ERROR_CODE_1017);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTCLOSE_0400
     * @tc.name   ：TestOHWebSocketClientClose_0400
     * @tc.desc   ：The client actively closes the websocket connection.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHWebSocketClientClose_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientClose(CASE_INDEX_4);
      expect(result).assertEqual(ERROR_CODE_1017);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTCLOSE_0500
     * @tc.name   ：TestOHWebSocketClientClose_0500
     * @tc.desc   ：The client actively closes the websocket connection.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('testOHWebSocketClientClose_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHWebSocketClientClose(CASE_INDEX_5);
      expect(result).assertEqual(ERROR_CODE_1017);
    });


    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTDESTROY_0100
     * @tc.name   ：TestOHWebSocketClientDestroy_0100
     * @tc.desc   ：Release websocket connection context and resources.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHWebSocketClientDestroy_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientDestroy(CASE_INDEX_1);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTDESTROY_0200
     * @tc.name   ：TestOHWebSocketClientDestroy_0200
     * @tc.desc   ：Release websocket connection context and resources.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHWebSocketClientDestroy_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientDestroy(CASE_INDEX_2);
      expect(result).assertEqual(ERROR_CODE_1018);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTDESTROY_0300
     * @tc.name   ：TestOHWebSocketClientDestroy_0300
     * @tc.desc   ：Release websocket connection context and resources.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHWebSocketClientDestroy_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientDestroy(CASE_INDEX_3);
      expect(result).assertEqual(ERROR_CODE_1018);
    });

    /**
     * @tc.number : SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTDESTROY_0400
     * @tc.name   ：TestOHWebSocketClientDestroy_0400
     * @tc.desc   ：Release websocket connection context and resources.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHWebSocketClientDestroy_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientDestroy(CASE_INDEX_4);
      expect(result).assertEqual(WEBSOCKET_OK);
    });
    
    /**
     * @tc.number : SUB_NetStack_IsCleartextPermitted_0100
     * @tc.name   ：testNetStackIsCleartextPermitted_0100
     * @tc.desc   ：test NetStackIsCleartextPermitted is true
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */

    it('testNetStackIsCleartextPermitted_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(`testNetStackIsCleartextPermitted_0100 start`);
      let re: number = wsAPI.OHNetStackIsCleartextPermitted();
      expect(re).assertEqual(WEBSOCKET_OK);
      done();
    });
    
    /**
     * @tc.number : SUB_NetStack_IsCleartextPermittedByHostName_0100
     * @tc.name   ：testNetStackIsCleartextPermittedByHostName_0100
     * @tc.desc   ：test NetStackIsCleartextPermittedByHostName is true.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
     */
    it('testNetStackIsCleartextPermittedByHostName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const hostname: string = "test.com";
      console.info(`testNetStackIsCleartextPermitted_0200 start`);
      let re: number = wsAPI.OHNetStackIsCleartextPermittedByHostName(hostname);
      expect(re).assertEqual(WEBSOCKET_OK);
      done();
    });

  });
}
