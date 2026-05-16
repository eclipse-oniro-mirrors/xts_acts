/*
 * Copyright (C) 2021-2022 Huawei Device Co., Ltd.
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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import http from '@ohos.net.http';

function expectFalse() {
  try {
    expect().assertFail();
  } catch(err) {
    console.info('assertion failure');
  }
}

function expectTrue(data : boolean){
  try {
    expect(data).assertTrue();
  } catch (err){
    console.info('assertion failure');
  }
};


export default function responseCodeJsunit() {
  describe("responseCodeJsunitTest", () => {
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeOK0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_OK_0100
     * @tc.desc   Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeOK0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeOK0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.OK == 200);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodeOK0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrHttpResponseCodeACCEPTED0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_ACCEPTED_0100
     * @tc.desc   Test Test ResponseCode property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeACCEPTED0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeACCEPTED0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.ACCEPTED == 202);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodeACCEPTED0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeNOTAUTHORITATIVE0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_NOT_AUTHORITATIVE_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeNOTAUTHORITATIVE0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeNOTAUTHORITATIVE0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.NOT_AUTHORITATIVE == 203);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodeNOTAUTHORITATIVE0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeNOCONTENT0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_NO_CONTENT_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeNOCONTENT0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeNOCONTENT0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.NO_CONTENT == 204);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodeNOCONTENT0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeMULTCHOICE0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_MULT_CHOICE_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeMULTCHOICE0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeMULTCHOICE0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.MULT_CHOICE == 300);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodeMULTCHOICE0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeMOVEDPERM0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_MOVED_PERM_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeMOVEDPERM0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeMOVEDPERM0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.MOVED_PERM == 301);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodeMOVEDPERM0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeSEEOTHER0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_SEE_OTHER_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeSEEOTHER0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeSEEOTHER0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.SEE_OTHER == 303);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodeSEEOTHER0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeNOTMODIFIED0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_NOT_MODIFIED_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeNOTMODIFIED0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeNOTMODIFIED0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.NOT_MODIFIED == 304);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodeNOTMODIFIED0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeUSEPROXY0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_USE_PROXY_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeUSEPROXY0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeUSEPROXY0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.USE_PROXY == 305);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodeUSEPROXY0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeBADREQUEST0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_BAD_REQUEST_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeBADREQUEST0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeBADREQUEST0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.BAD_REQUEST == 400);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodeBADREQUEST0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeUNAUTHORIZED0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_UNAUTHORIZED_0100
     * @tc.desc   Test Test ResponseCode property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeUNAUTHORIZED0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeUNAUTHORIZED0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.UNAUTHORIZED == 401);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodeUNAUTHORIZED0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodePAYMENTREQUIRED0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_PAYMENT_REQUIRED_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodePAYMENTREQUIRED0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodePAYMENTREQUIRED0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.PAYMENT_REQUIRED == 402);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodePAYMENTREQUIRED0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeBADMETHOD0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_BAD_METHOD_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeBADMETHOD0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeBADMETHOD0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.BAD_METHOD == 405);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodeBADMETHOD0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeNOTACCEPTABLE0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_NOT_ACCEPTABLE_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeNOTACCEPTABLE0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeNOTACCEPTABLE0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.NOT_ACCEPTABLE == 406);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodeNOTACCEPTABLE0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodePROXYAUTH0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_PROXY_AUTH_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodePROXYAUTH0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodePROXYAUTH0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.PROXY_AUTH == 407);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodePROXYAUTH0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeCLIENTTIMEOUT0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_CLIENT_TIMEOUT_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeCLIENTTIMEOUT0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeCLIENTTIMEOUT0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.CLIENT_TIMEOUT == 408);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodeCLIENTTIMEOUT0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeLENGTHREQUIRED0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_LENGTH_REQUIRED_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeLENGTHREQUIRED0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeLENGTHREQUIRED0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.LENGTH_REQUIRED == 411);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodeLENGTHREQUIRED0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodePRECONFAILED0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_PRECON_FAILED_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodePRECONFAILED0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodePRECONFAILED0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.PRECON_FAILED == 412);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodePRECONFAILED0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeENTITYTOOLARGE0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_ENTITY_TOO_LARGE_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeENTITYTOOLARGE0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeENTITYTOOLARGE0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.ENTITY_TOO_LARGE == 413);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodeENTITYTOOLARGE0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeREQTOOLONG0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_REQ_TOO_LONG_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeREQTOOLONG0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeREQTOOLONG0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.REQ_TOO_LONG == 414);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodeREQTOOLONG0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeUNSUPPORTEDTYPE0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_UNSUPPORTED_TYPE_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeUNSUPPORTEDTYPE0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeUNSUPPORTEDTYPE0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.UNSUPPORTED_TYPE == 415);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodeUNSUPPORTEDTYPE0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeRANGENOTSATISFIABLE0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_RANGE_NOT_SATISFIABLE_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeRANGENOTSATISFIABLE0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeRANGENOTSATISFIABLE0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.RANGE_NOT_SATISFIABLE == 416);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodeRANGENOTSATISFIABLE0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeINTERNALERROR0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_INTERNAL_ERROR_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeINTERNALERROR0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeINTERNALERROR0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.INTERNAL_ERROR == 500);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodeINTERNALERROR0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeNOTIMPLEMENTED0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_NOT_IMPLEMENTED_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeNOTIMPLEMENTED0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeNOTIMPLEMENTED0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.NOT_IMPLEMENTED == 501);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodeNOTIMPLEMENTED0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeBADGATEWAY0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_BAD_GATEWAY_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeBADGATEWAY0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeBADGATEWAY0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.BAD_GATEWAY == 502);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodeBADGATEWAY0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeGATEWAYTIMEOUT0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_GATEWAY_TIMEOUT_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeGATEWAYTIMEOUT0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeGATEWAYTIMEOUT0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.GATEWAY_TIMEOUT == 504);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodeGATEWAYTIMEOUT0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeVERSION0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_VERSION_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeVERSION0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeVERSION0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.VERSION == 505);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodeVERSION0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeCREATED0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_CREATED_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeCREATED0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeCREATED0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.CREATED == 201);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodeCREATED0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeRESET0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_RESET_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeRESET0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeRESET0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.RESET == 205);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodeRESET0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodePARTIAL0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_PARTIAL_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodePARTIAL0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodePARTIAL0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.PARTIAL == 206);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodePARTIAL0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeMOVEDTEMP0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_MOVED_TEMP_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeMOVEDTEMP0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeMOVEDTEMP0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.MOVED_TEMP == 302);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodeMOVEDTEMP0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeFORBIDDEN0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_FORBIDDEN_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeFORBIDDEN0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeFORBIDDEN0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.FORBIDDEN == 403);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodeFORBIDDEN0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeNOTFOUND0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_NOT_FOUND_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeNOTFOUND0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeNOTFOUND0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.NOT_FOUND == 404);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodeNOTFOUND0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeCONFLICT0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_CONFLICT_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeCONFLICT0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeCONFLICT0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.CONFLICT == 409);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodeCONFLICT0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeGONE0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_GONE_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeGONE0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeGONE0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.GONE == 410);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodeGONE0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeUNAVAILABLE0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_UNAVAILABLE_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeUNAVAILABLE0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeUNAVAILABLE0100';
      console.info(`${caseName}---Start`);
      try {
        expectTrue(http.ResponseCode.UNAVAILABLE == 503);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.log("testNetworkMgrHttpResponseCodeUNAVAILABLE0100 : error = " + error);
        expectFalse();
        console.info(`${caseName}---End`);
        done();
      }
    });
  })
};