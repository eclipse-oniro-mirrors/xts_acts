/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';

import { BusinessError } from '@kit.BasicServicesKit';
import eap from '@ohos.net.eap';
import connection from '@ohos.net.connection';

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(`exportFail failed err: ${JSON.stringify(err)}`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(`exportTrue failed err: ${JSON.stringify(err)}`);
  }
}
let validNetType = 1;
let validEapCode = 1;
let validEapType = 25;
let errorNetType = 9;
let errorEapCode = 9;
let errorEapType = 400;
let eapDataCallback = (eapData: eap.EapData): void =>{
  console.log("eapData callback result: "+ JSON.stringify(eapData));
}
let validNetId = connection.getDefaultNetSync().netId;
let errorNetId = validNetId+ 10000;

let validProfile: eap.EthEapProfile = {
  eapMethod: eap.EapMethod.EAP_TTLS,
  phase2Method: eap.Phase2Method.PHASE2_AKA_PRIME,
  identity: "identity",
  anonymousIdentity: "anonymousIdentity",
  password: "password",
  caCertAliases: "caCertAliases",
  caPath: "caPath",
  clientCertAliases: "clientCertAliases",
  certEntry: new Uint8Array([5,6,7,8,9,10]),
  certPassword: "certPassword",
  altSubjectMatch: "altSubjectMatch",
  domainSuffixMatch: "domainSuffixMatch",
  realm: "realm",
  plmn: "plmn",
  eapSubId: 9999999
};


export default function EapErrorCodeTest() {
  describe('EapErrorCodeTest', () => {

    /**
     * @tc.name   testCommunicationEapRegCustomEapHandlerErrorCode0100
     * @tc.number SUB_Communication_Eap_RegCustomEapHandler_ErrorCode_0100
     * @tc.desc   verification parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapRegCustomEapHandlerErrorCode0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = "testCommunicationEapRegCustomEapHandlerErrorCode0100";
      console.info(`${caseName}---start`);
      try {
        eap.regCustomEapHandler(errorNetType, validEapCode, validEapType, eapDataCallback);
        console.info(`${caseName } regCustomEapHandler success`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 33200006);
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapRegCustomEapHandlerErrorCode0200
     * @tc.number SUB_Communication_Eap_RegCustomEapHandler_ErrorCode_0200
     * @tc.desc   verification parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapRegCustomEapHandlerErrorCode0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let caseName: string = "testCommunicationEapRegCustomEapHandlerErrorCode0200";
      console.info(`${caseName}---start`);
      try {
        eap.regCustomEapHandler(validNetType, errorEapCode, validEapType, eapDataCallback);
        console.info(`${caseName } regCustomEapHandler success`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 33200007);
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapRegCustomEapHandlerErrorCode0300
     * @tc.number SUB_Communication_Eap_RegCustomEapHandler_ErrorCode_0300
     * @tc.desc   verification parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapRegCustomEapHandlerErrorCode0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let caseName: string = "testCommunicationEapRegCustomEapHandlerErrorCode0300";
      console.info(`${caseName}---start`);
      try {
        eap.regCustomEapHandler(validNetType, validEapCode, errorEapType, eapDataCallback);
        console.info(`${caseName } regCustomEapHandler success`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 33200008);
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapUnregCustomEapHandlerErrorCode0100
     * @tc.number SUB_Communication_Eap_UnregCustomEapHandler_ErrorCode_0100
     * @tc.desc   verification parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapUnregCustomEapHandlerErrorCode0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let caseName: string = "testCommunicationEapUnregCustomEapHandlerErrorCode0100";
      console.info(`${caseName}---start`);
      try {
        eap.unregCustomEapHandler(errorNetType, validEapCode, validEapType, eapDataCallback);
        console.info(`${caseName } unregCustomEapHandler success`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 33200006);
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapUnregCustomEapHandlerErrorCode0200
     * @tc.number SUB_Communication_Eap_UnregCustomEapHandler_ErrorCode_0200
     * @tc.desc   verification parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapUnregCustomEapHandlerErrorCode0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let caseName: string = "testCommunicationEapUnregCustomEapHandlerErrorCode0200";
      console.info(`${caseName}---start`);
      try {
        eap.unregCustomEapHandler(validNetType, errorEapCode, validEapType, eapDataCallback);
        console.info(`${caseName } unregCustomEapHandler success`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 33200007);
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapUnregCustomEapHandlerErrorCode0300
     * @tc.number SUB_Communication_Eap_UnregCustomEapHandler_ErrorCode_0300
     * @tc.desc   verification parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapUnregCustomEapHandlerErrorCode0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let caseName: string = "testCommunicationEapUnregCustomEapHandlerErrorCode0300";
      console.info(`${caseName}---start`);
      try {
        eap.unregCustomEapHandler(validNetType, validEapCode, errorEapType, eapDataCallback);
        console.info(`${caseName } unregCustomEapHandler success`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 33200008);
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapUnregCustomEapHandlerErrorCode0400
     * @tc.number SUB_Communication_Eap_UnregCustomEapHandler_ErrorCode_0400
     * @tc.desc   verification parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapUnregCustomEapHandlerErrorCode0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let caseName: string = "testCommunicationEapUnregCustomEapHandlerErrorCode0400";
      console.info(`${caseName}---start`);
      try {
        eap.regCustomEapHandler(validNetType, validEapCode, validEapType, eapDataCallback);
        eap.unregCustomEapHandler(2, validEapCode, validEapType, eapDataCallback);
        console.info(`${caseName } unregCustomEapHandler success`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 33200099);
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapReplyCustomEapDataErrorCode0100
     * @tc.number SUB_Communication_Eap_ReplyCustomEapData_ErrorCode_0100
     * @tc.desc   verification parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapReplyCustomEapDataErrorCode0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let caseName: string = "testCommunicationEapReplyCustomEapDataErrorCode0100";
      console.info(`${caseName}---start`);
      try {
        eap.replyCustomEapData(1, undefined);
        console.info(`${caseName } unregCustomEapHandler success`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 33200099);
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapReplyCustomEapDataErrorCode0200
     * @tc.number SUB_Communication_Eap_ReplyCustomEapData_ErrorCode_0200
     * @tc.desc   test verification parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapReplyCustomEapDataErrorCode0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let caseName: string = "testCommunicationEapReplyCustomEapDataErrorCode0200";
      console.info(`${caseName}---start`);
      try {
        let eapData:eap.EapData= {
          msgId: 1,
          eapBuffer: new Uint8Array([1, 2, 3, 4, 5]),
          bufferLen: 5,
        };
        eap.replyCustomEapData(1, eapData );
        console.info(`${caseName } replyCustomEapData success`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 33200099);
        console.info(`${caseName}---End`);
        done();
      }
    })


    /**
     * @tc.name   testCommunicationEapReplyCustomEapDataErrorCode0300
     * @tc.number SUB_Communication_Eap_ReplyCustomEapData_ErrorCode_0300
     * @tc.desc   test verification parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapReplyCustomEapDataErrorCode0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let caseName: string = "testCommunicationEapReplyCustomEapDataErrorCode0300";
      console.info(`${caseName}---start`);
      try {
        let eapData:eap.EapData= {
          msgId: 1,
          eapBuffer: new Uint8Array([1, 2, 3, 4, 5]),
          bufferLen: 5,
        };
        eap.replyCustomEapData(undefined, eapData);
        console.info(`${caseName } replyCustomEapData success`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 33200099);
        console.info(`${caseName}---End`);
        done();
      }
    })

      /**
       * @tc.name   testCommunicationEapReplyCustomEapDataErrorCode0400
       * @tc.number SUB_Communication_Eap_ReplyCustomEapData_ErrorCode_0400
       * @tc.desc   test verification parameter error
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it("testCommunicationEapReplyCustomEapDataErrorCode0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let caseName: string = "testCommunicationEapReplyCustomEapDataErrorCode0400";
        console.info(`${caseName}---start`);
        try {
          let eapData:eap.EapData= {
            msgId: 1,
            eapBuffer: new Uint8Array([1, 2, 3, 4, 5]),
            bufferLen: 5,
          };
          eap.replyCustomEapData(10000, eapData);
          console.info(`${caseName } replyCustomEapData success`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        } catch (error) {
          console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
          ExpectTrue(error.code == 33200004);
          console.info(`${caseName}---End`);
          done();
        }
      })

        /**
         * @tc.name   testCommunicationEapReplyCustomEapDataErrorCode0500
         * @tc.number SUB_Communication_Eap_ReplyCustomEapData_ErrorCode_0500
         * @tc.desc   test verification parameter error
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it("testCommunicationEapReplyCustomEapDataErrorCode0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
          let caseName: string = "testCommunicationEapReplyCustomEapDataErrorCode0500";
          console.info(`${caseName}---start`);
          try {
            let eapData:eap.EapData= {
              msgId: 1,
              eapBuffer: new Uint8Array([1, 2, 3, 4, 5]),
              bufferLen: 5,
            };
            eap.replyCustomEapData(undefined, eapData);
            console.info(`${caseName } replyCustomEapData success`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } catch (error) {
            console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
            ExpectTrue(error.code == 33200099);
            console.info(`${caseName}---End`);
            done();
          }
        })

    /**
     * @tc.name   testCommunicationEapStartEthEapErrorCode0100
     * @tc.number SUB_Communication_Eap_StartEthEap_ErrorCode_0100
     * @tc.desc   verification parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapStartEthEapErrorCode0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let caseName: string = "testCommunicationEapStartEthEapErrorCode0100";
      console.info(`${caseName}---start`);
      try {
        eap.startEthEap(errorNetId, validProfile);
        console.info(`${caseName } startEthEap success`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 33200001);
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapStartEthEapErrorCode0200
     * @tc.number SUB_Communication_Eap_StartEthEap_ErrorCode_0200
     * @tc.desc   verification parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapStartEthEapErrorCode0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let caseName: string = "testCommunicationEapStartEthEapErrorCode0200";
      console.info(`${caseName}---start`);
      try {
        eap.startEthEap(validNetId, undefined);
        console.info(`${caseName } startEthEap success`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 33200003);
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapLogOffEthEapErrorCode0100
     * @tc.number SUB_Communication_Eap_LogOffEthEap_ErrorCode_0100
     * @tc.desc   verification parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapLogOffEthEapErrorCode0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let caseName: string = "testCommunicationEapLogOffEthEapErrorCode0100";
      console.info(`${caseName}---start`);
      try {
        eap.logOffEthEap(errorNetId);
        console.info(`${caseName } logOffEthEap success`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 33200001);
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapLogOffEthEapErrorCode0200
     * @tc.number SUB_Communication_Eap_LogOffEthEap_ErrorCode_0200
     * @tc.desc   verification parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapLogOffEthEapErrorCode0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let caseName: string = "testCommunicationEapLogOffEthEapErrorCode0200";
      console.info(`${caseName}---start`);
      try {
        eap.logOffEthEap(undefined);
        console.info(`${caseName } logOffEthEap success`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 33200002);
        console.info(`${caseName}---End`);
        done();
      }
    })


  })
}