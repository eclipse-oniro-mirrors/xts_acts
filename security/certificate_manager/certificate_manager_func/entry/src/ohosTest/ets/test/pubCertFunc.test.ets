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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import certManager from '@ohos.security.certManager';
import type common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { GlobalContext } from '../../../../src/main/ets/pages/HomePage';
import certManagerDialog from '@ohos.security.certManagerDialog';
import * as commonParameter from './utils/common/common_parameter';
function createUnit8Array(len: number){
  let buf = new ArrayBuffer(len);
  let uint8Array = new Uint8Array(buf);
  for (let i = 0; i < len; i++){
    uint8Array[i] = 0xb1;
  }
  return uint8Array
}
function generateString(len: number){
  let str: string = 'a';
  return str.repeat(len);
}
let caCert = new Uint8Array([0x30, 0x82, 0x04, 0x31, 0x30, 0x82, 0x03, 0x19, 0xa0, 0x03, 0x02, 0x01, 0x02, 0x02, 0x01, 0x00,
  0x30, 0x0d, 0x06, 0x09, 0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x01, 0x01, 0x05, 0x05, 0x00, 0x30,
  0x81, 0x95, 0x31, 0x0b, 0x30, 0x09, 0x06, 0x03, 0x55, 0x04, 0x06, 0x13, 0x02, 0x47, 0x52, 0x31,
  0x44, 0x30, 0x42, 0x06, 0x03, 0x55, 0x04, 0x0a, 0x13, 0x3b, 0x48, 0x65, 0x6c, 0x6c, 0x65, 0x6e,
  0x69, 0x63, 0x20, 0x41, 0x63, 0x61, 0x64, 0x65, 0x6d, 0x69, 0x63, 0x20, 0x61, 0x6e, 0x64, 0x20,
  0x52, 0x65, 0x73, 0x65, 0x61, 0x72, 0x63, 0x68, 0x20, 0x49, 0x6e, 0x73, 0x74, 0x69, 0x74, 0x75,
  0x74, 0x69, 0x6f, 0x6e, 0x73, 0x20, 0x43, 0x65, 0x72, 0x74, 0x2e, 0x20, 0x41, 0x75, 0x74, 0x68,
  0x6f, 0x72, 0x69, 0x74, 0x79, 0x31, 0x40, 0x30, 0x3e, 0x06, 0x03, 0x55, 0x04, 0x03, 0x13, 0x37,
  0x48, 0x65, 0x6c, 0x6c, 0x65, 0x6e, 0x69, 0x63, 0x20, 0x41, 0x63, 0x61, 0x64, 0x65, 0x6d, 0x69,
  0x63, 0x20, 0x61, 0x6e, 0x64, 0x20, 0x52, 0x65, 0x73, 0x65, 0x61, 0x72, 0x63, 0x68, 0x20, 0x49,
  0x6e, 0x73, 0x74, 0x69, 0x74, 0x75, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x20, 0x52, 0x6f, 0x6f, 0x74,
  0x43, 0x41, 0x20, 0x32, 0x30, 0x31, 0x31, 0x30, 0x1e, 0x17, 0x0d, 0x31, 0x31, 0x31, 0x32, 0x30,
  0x36, 0x31, 0x33, 0x34, 0x39, 0x35, 0x32, 0x5a, 0x17, 0x0d, 0x33, 0x31, 0x31, 0x32, 0x30, 0x31,
  0x31, 0x33, 0x34, 0x39, 0x35, 0x32, 0x5a, 0x30, 0x81, 0x95, 0x31, 0x0b, 0x30, 0x09, 0x06, 0x03,
  0x55, 0x04, 0x06, 0x13, 0x02, 0x47, 0x52, 0x31, 0x44, 0x30, 0x42, 0x06, 0x03, 0x55, 0x04, 0x0a,
  0x13, 0x3b, 0x48, 0x65, 0x6c, 0x6c, 0x65, 0x6e, 0x69, 0x63, 0x20, 0x41, 0x63, 0x61, 0x64, 0x65,
  0x6d, 0x69, 0x63, 0x20, 0x61, 0x6e, 0x64, 0x20, 0x52, 0x65, 0x73, 0x65, 0x61, 0x72, 0x63, 0x68,
  0x20, 0x49, 0x6e, 0x73, 0x74, 0x69, 0x74, 0x75, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x20, 0x43, 0x65,
  0x72, 0x74, 0x2e, 0x20, 0x41, 0x75, 0x74, 0x68, 0x6f, 0x72, 0x69, 0x74, 0x79, 0x31, 0x40, 0x30,
  0x3e, 0x06, 0x03, 0x55, 0x04, 0x03, 0x13, 0x37, 0x48, 0x65, 0x6c, 0x6c, 0x65, 0x6e, 0x69, 0x63,
  0x20, 0x41, 0x63, 0x61, 0x64, 0x65, 0x6d, 0x69, 0x63, 0x20, 0x61, 0x6e, 0x64, 0x20, 0x52, 0x65,
  0x73, 0x65, 0x61, 0x72, 0x63, 0x68, 0x20, 0x49, 0x6e, 0x73, 0x74, 0x69, 0x74, 0x75, 0x74, 0x69,
  0x6f, 0x6e, 0x73, 0x20, 0x52, 0x6f, 0x6f, 0x74, 0x43, 0x41, 0x20, 0x32, 0x30, 0x31, 0x31, 0x30,
  0x82, 0x01, 0x22, 0x30, 0x0d, 0x06, 0x09, 0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x01, 0x01, 0x01,
  0x05, 0x00, 0x03, 0x82, 0x01, 0x0f, 0x00, 0x30, 0x82, 0x01, 0x0a, 0x02, 0x82, 0x01, 0x01, 0x00,
  0xa9, 0x53, 0x00, 0xe3, 0x2e, 0xa6, 0xf6, 0x8e, 0xfa, 0x60, 0xd8, 0x2d, 0x95, 0x3e, 0xf8, 0x2c,
  0x2a, 0x54, 0x4e, 0xcd, 0xb9, 0x84, 0x61, 0x94, 0x58, 0x4f, 0x8f, 0x3d, 0x8b, 0xe4, 0x43, 0xf3,
  0x75, 0x89, 0x8d, 0x51, 0xe4, 0xc3, 0x37, 0xd2, 0x8a, 0x88, 0x4d, 0x79, 0x1e, 0xb7, 0x12, 0xdd,
  0x43, 0x78, 0x4a, 0x8a, 0x92, 0xe6, 0xd7, 0x48, 0xd5, 0x0f, 0xa4, 0x3a, 0x29, 0x44, 0x35, 0xb8,
  0x07, 0xf6, 0x68, 0x1d, 0x55, 0xcd, 0x38, 0x51, 0xf0, 0x8c, 0x24, 0x31, 0x85, 0xaf, 0x83, 0xc9,
  0x7d, 0xe9, 0x77, 0xaf, 0xed, 0x1a, 0x7b, 0x9d, 0x17, 0xf9, 0xb3, 0x9d, 0x38, 0x50, 0x0f, 0xa6,
  0x5a, 0x79, 0x91, 0x80, 0xaf, 0x37, 0xae, 0xa6, 0xd3, 0x31, 0xfb, 0xb5, 0x26, 0x09, 0x9d, 0x3c,
  0x5a, 0xef, 0x51, 0xc5, 0x2b, 0xdf, 0x96, 0x5d, 0xeb, 0x32, 0x1e, 0x02, 0xda, 0x70, 0x49, 0xec,
  0x6e, 0x0c, 0xc8, 0x9a, 0x37, 0x8d, 0xf7, 0xf1, 0x36, 0x60, 0x4b, 0x26, 0x2c, 0x82, 0x9e, 0xd0,
  0x78, 0xf3, 0x0d, 0x0f, 0x63, 0xa4, 0x51, 0x30, 0xe1, 0xf9, 0x2b, 0x27, 0x12, 0x07, 0xd8, 0xea,
  0xbd, 0x18, 0x62, 0x98, 0xb0, 0x59, 0x37, 0x7d, 0xbe, 0xee, 0xf3, 0x20, 0x51, 0x42, 0x5a, 0x83,
  0xef, 0x93, 0xba, 0x69, 0x15, 0xf1, 0x62, 0x9d, 0x9f, 0x99, 0x39, 0x82, 0xa1, 0xb7, 0x74, 0x2e,
  0x8b, 0xd4, 0xc5, 0x0b, 0x7b, 0x2f, 0xf0, 0xc8, 0x0a, 0xda, 0x3d, 0x79, 0x0a, 0x9a, 0x93, 0x1c,
  0xa5, 0x28, 0x72, 0x73, 0x91, 0x43, 0x9a, 0xa7, 0xd1, 0x4d, 0x85, 0x84, 0xb9, 0xa9, 0x74, 0x8f,
  0x14, 0x40, 0xc7, 0xdc, 0xde, 0xac, 0x41, 0x64, 0x6c, 0xb4, 0x19, 0x9b, 0x02, 0x63, 0x6d, 0x24,
  0x64, 0x8f, 0x44, 0xb2, 0x25, 0xea, 0xce, 0x5d, 0x74, 0x0c, 0x63, 0x32, 0x5c, 0x8d, 0x87, 0xe5,
  0x02, 0x03, 0x01, 0x00, 0x01, 0xa3, 0x81, 0x89, 0x30, 0x81, 0x86, 0x30, 0x0f, 0x06, 0x03, 0x55,
  0x1d, 0x13, 0x01, 0x01, 0xff, 0x04, 0x05, 0x30, 0x03, 0x01, 0x01, 0xff, 0x30, 0x0b, 0x06, 0x03,
  0x55, 0x1d, 0x0f, 0x04, 0x04, 0x03, 0x02, 0x01, 0x06, 0x30, 0x1d, 0x06, 0x03, 0x55, 0x1d, 0x0e,
  0x04, 0x16, 0x04, 0x14, 0xa6, 0x91, 0x42, 0xfd, 0x13, 0x61, 0x4a, 0x23, 0x9e, 0x08, 0xa4, 0x29,
  0xe5, 0xd8, 0x13, 0x04, 0x23, 0xee, 0x41, 0x25, 0x30, 0x47, 0x06, 0x03, 0x55, 0x1d, 0x1e, 0x04,
  0x40, 0x30, 0x3e, 0xa0, 0x3c, 0x30, 0x05, 0x82, 0x03, 0x2e, 0x67, 0x72, 0x30, 0x05, 0x82, 0x03,
  0x2e, 0x65, 0x75, 0x30, 0x06, 0x82, 0x04, 0x2e, 0x65, 0x64, 0x75, 0x30, 0x06, 0x82, 0x04, 0x2e,
  0x6f, 0x72, 0x67, 0x30, 0x05, 0x81, 0x03, 0x2e, 0x67, 0x72, 0x30, 0x05, 0x81, 0x03, 0x2e, 0x65,
  0x75, 0x30, 0x06, 0x81, 0x04, 0x2e, 0x65, 0x64, 0x75, 0x30, 0x06, 0x81, 0x04, 0x2e, 0x6f, 0x72,
  0x67, 0x30, 0x0d, 0x06, 0x09, 0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x01, 0x01, 0x05, 0x05, 0x00,
  0x03, 0x82, 0x01, 0x01, 0x00, 0x1f, 0xef, 0x79, 0x41, 0xe1, 0x7b, 0x6e, 0x3f, 0xb2, 0x8c, 0x86,
  0x37, 0x42, 0x4a, 0x4e, 0x1c, 0x37, 0x1e, 0x8d, 0x66, 0xba, 0x24, 0x81, 0xc9, 0x4f, 0x12, 0x0f,
  0x21, 0xc0, 0x03, 0x97, 0x86, 0x25, 0x6d, 0x5d, 0xd3, 0x22, 0x29, 0xa8, 0x6c, 0xa2, 0x0d, 0xa9,
  0xeb, 0x3d, 0x06, 0x5b, 0x99, 0x3a, 0xc7, 0xcc, 0xc3, 0x9a, 0x34, 0x7f, 0xab, 0x0e, 0xc8, 0x4e,
  0x1c, 0xe1, 0xfa, 0xe4, 0xdc, 0xcd, 0x0d, 0xbe, 0xbf, 0x24, 0xfe, 0x6c, 0xe7, 0x6b, 0xc2, 0x0d,
  0xc8, 0x06, 0x9e, 0x4e, 0x8d, 0x61, 0x28, 0xa6, 0x6a, 0xfd, 0xe5, 0xf6, 0x62, 0xea, 0x18, 0x3c,
  0x4e, 0xa0, 0x53, 0x9d, 0xb2, 0x3a, 0x9c, 0xeb, 0xa5, 0x9c, 0x91, 0x16, 0xb6, 0x4d, 0x82, 0xe0,
  0x0c, 0x05, 0x48, 0xa9, 0x6c, 0xf5, 0xcc, 0xf8, 0xcb, 0x9d, 0x49, 0xb4, 0xf0, 0x02, 0xa5, 0xfd,
  0x70, 0x03, 0xed, 0x8a, 0x21, 0xa5, 0xae, 0x13, 0x86, 0x49, 0xc3, 0x33, 0x73, 0xbe, 0x87, 0x3b,
  0x74, 0x8b, 0x17, 0x45, 0x26, 0x4c, 0x16, 0x91, 0x83, 0xfe, 0x67, 0x7d, 0xcd, 0x4d, 0x63, 0x67,
  0xfa, 0xf3, 0x03, 0x12, 0x96, 0x78, 0x06, 0x8d, 0xb1, 0x67, 0xed, 0x8e, 0x3f, 0xbe, 0x9f, 0x4f,
  0x02, 0xf5, 0xb3, 0x09, 0x2f, 0xf3, 0x4c, 0x87, 0xdf, 0x2a, 0xcb, 0x95, 0x7c, 0x01, 0xcc, 0xac,
  0x36, 0x7a, 0xbf, 0xa2, 0x73, 0x7a, 0xf7, 0x8f, 0xc1, 0xb5, 0x9a, 0xa1, 0x14, 0xb2, 0x8f, 0x33,
  0x9f, 0x0d, 0xef, 0x22, 0xdc, 0x66, 0x7b, 0x84, 0xbd, 0x45, 0x17, 0x06, 0x3d, 0x3c, 0xca, 0xb9,
  0x77, 0x34, 0x8f, 0xca, 0xea, 0xcf, 0x3f, 0x31, 0x3e, 0xe3, 0x88, 0xe3, 0x80, 0x49, 0x25, 0xc8,
  0x97, 0xb5, 0x9d, 0x9a, 0x99, 0x4d, 0xb0, 0x3c, 0xf8, 0x4a, 0x00, 0x9b, 0x64, 0xdd, 0x9f, 0x39,
  0x4b, 0xd1, 0x27, 0xd7, 0xb8]);

export default function certManagerPubCertJsAPIFunctionTestUnit() {
  describe('certManagerPubCertJsAPIFunctionTestUnit', () => {
    beforeAll(() => {
    });
    beforeEach(async () => {
    });
    afterEach(() => {
    });
    afterAll(async () => {
    });

    /**
     * @tc.name   SUB_Security_CertManager_PubCertJsApi_Func_0400
     * @tc.number SUB_Security_CertManager_PubCertJsApi_Func_0400
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_PubCertJsApi_Func_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await certManager.getPublicCertificate('');
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        await certManager.getPublicCertificate(null);
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        await certManager.getPublicCertificate(undefined);
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_PubCertJsApi_Func_0500
     * @tc.number SUB_Security_CertManager_PubCertJsApi_Func_0500
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_PubCertJsApi_Func_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await certManager.getPublicCertificate('aabb');
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.name   SUB_Security_CertManager_PubCertJsApi_Func_0600
     * @tc.number SUB_Security_CertManager_PubCertJsApi_Func_0600
     * @tc.desc   Call getPublicCertificate interface with length of keyUri is 255 return 17500001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_PubCertJsApi_Func_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("SUB_Security_CertManager_PubCertJsApi_Func_0600: started.");
      let uri = "oh:t=ak;o=object;u=100;a=20010045";
      let uriObject = generateString(255-27);
      try {
        await certManager.getPublicCertificate(uri.replace("object", uriObject));
        expect(null).assertFail();
      }
      catch (err) {
        console.log("SUB_Security_CertManager_PubCertJsApi_Func_0600：e.code = " + err.code);
        expect(err.code).assertEqual(17500001);
      }
      console.info("SUB_Security_CertManager_PubCertJsApi_Func_0600: end.");
      done();
    });
    /**
     * @tc.name   SUB_Security_CertManager_PubCertJsApi_Func_0700
     * @tc.number SUB_Security_CertManager_PubCertJsApi_Func_0700
     * @tc.desc   Call getPublicCertificate interface with length of keyUri is 256 return 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_PubCertJsApi_Func_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("SUB_Security_CertManager_PubCertJsApi_Func_0700: started.");
      let uri = "oh:t=ak;o=object;u=100;a=20010045";
      let uriObject = generateString(256-27);
      try {
        await certManager.getPublicCertificate(uri.replace("object", uriObject));
        expect(null).assertFail();
      }
      catch (err) {
        console.log("SUB_Security_CertManager_PubCertJsApi_Func_0700 ： e.code = " + err.code);
        expect(err.code).assertEqual(401);
      }
      console.info("SUB_Security_CertManager_PubCertJsApi_Func_0700: end.");
      done();
    });
    /**
     * @tc.name   SUB_Security_CertManager_PubCertJsApi_Func_0900
     * @tc.number SUB_Security_CertManager_PubCertJsApi_Func_0900
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_PubCertJsApi_Func_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await certManager.isAuthorizedApp('');
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        await certManager.isAuthorizedApp(null);
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        await certManager.isAuthorizedApp(undefined);
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_PubCertJsApi_Func_1000
     * @tc.number SUB_Security_CertManager_PubCertJsApi_Func_1000
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_PubCertJsApi_Func_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await certManager.isAuthorizedApp('aabb');
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.name   SUB_Security_CertManager_PubCertJsApi_Func_2000
     * @tc.number SUB_Security_CertManager_PubCertJsApi_Func_2000
     * @tc.desc   Call isAuthorizedApp interface with length of keyUri is 255 return 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_PubCertJsApi_Func_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("SUB_Security_CertManager_PubCertJsApi_Func_2000 started.");
      try {
        await certManager.isAuthorizedApp(generateString(255));
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(401);
        console.log("SUB_Security_CertManager_PubCertJsApi_Func_2000, e.code = " + err.code);
      }
      console.info("SUB_Security_CertManager_PubCertJsApi_Func_2000 end.");
      done();
    });
    /**
     * @tc.name   SUB_Security_CertManager_PubCertJsApi_Func_3000
     * @tc.number SUB_Security_CertManager_PubCertJsApi_Func_3000
     * @tc.desc   Call isAuthorizedApp interface with length of keyUri is 256 return 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_PubCertJsApi_Func_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("SUB_Security_CertManager_PubCertJsApi_Func_3000 started.");
      try {
        await certManager.isAuthorizedApp(generateString(256));
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(401);
        console.log("SUB_Security_CertManager_PubCertJsApi_Func_3000, e.code = " + err.code);
      }
      console.info("SUB_Security_CertManager_PubCertJsApi_Func_3000 end.");
      done();
    });
    /**
     * @tc.name   SUB_Security_CertManager_GetPriCertJsApi_Func_0010
     * @tc.number SUB_Security_CertManager_GetPriCertJsApi_Func_0010
     * @tc.desc   normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_GetPriCertJsApi_Func_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0010: started ");
      let keystore: Uint8Array = commonParameter.priRsaCredData;
      let keystorePwd: string = '123456';
      let certAlias: string = 'appCertAliasDemoRsa';
      let keyUri: string | undefined;

      try{
        await certManager.installPrivateCertificate(null, keystorePwd, certAlias);
        console.log("installPrivateCertificate success")
      }catch(err){
        console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0010：e.code = " + err.code);
        expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_INVALID_PARAMS);
      }

      try{
        await certManager.installPrivateCertificate(undefined, keystorePwd, certAlias);
        console.log("installPrivateCertificate success")
      }catch(err){
        console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0010：e.code = " + err.code);
        expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_INVALID_PARAMS);
      }

      try{
        await certManager.installPrivateCertificate(keystore, "", certAlias);
        console.log("installPrivateCertificate success")
      }catch(err){
        console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0010：e.code = " + err.code);
        expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_INCORRECT_FORMAT);
      }

      try{
        await certManager.installPrivateCertificate(keystore, null, certAlias);
        console.log("installPrivateCertificate success")
      }catch(err){
        console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0010：e.code = " + err.code);
        expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_INVALID_PARAMS);
      }

      try{
        await certManager.installPrivateCertificate(keystore, undefined, certAlias);
        console.log("installPrivateCertificate success")
      }catch(err){
        console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0010：e.code = " + err.code);
        expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_INVALID_PARAMS);
      }

      try{
        await certManager.installPrivateCertificate(keystore, keystorePwd, "");
        console.log("installPrivateCertificate success")
      }catch(err){
        console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0010：e.code = " + err.code);
        expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_INVALID_PARAMS);
      }

      try{
        await certManager.installPrivateCertificate(keystore, keystorePwd, null);
        console.log("installPrivateCertificate success")
      }catch(err){
        console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0010：e.code = " + err.code);
        expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_INVALID_PARAMS);
      }

      try{
        await certManager.installPrivateCertificate(keystore, keystorePwd, undefined);
        console.log("installPrivateCertificate success")
      }catch(err){
        console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0010：e.code = " + err.code);
        expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_INVALID_PARAMS);
      }

      await certManager.installPrivateCertificate(keystore, keystorePwd, certAlias).then((cmResult: certManager.CMResult) => {
        expect(cmResult != null).assertTrue();
        console.warn("SUB_Security_CertManager_GetPriCertJsApi_Func_0010[Promise] cmResult.uri: " + cmResult.uri);
        console.warn("SUB_Security_CertManager_GetPriCertJsApi_Func_0010[Promise] cmResult.certList: " + cmResult.certList);
        console.warn("SUB_Security_CertManager_GetPriCertJsApi_Func_0010[Promise] cmResult.certInfo: " + cmResult.certInfo);
        console.warn("SUB_Security_CertManager_GetPriCertJsApi_Func_0010[Promise] cmResult.credentialList: " + cmResult.credentialList);
        console.warn("SUB_Security_CertManager_GetPriCertJsApi_Func_0010[Promise] cmResult.credential: " + cmResult.credential);
        console.warn("SUB_Security_CertManager_GetPriCertJsApi_Func_0010[Promise] cmResult.appUidList: " + cmResult.appUidList);
        console.warn("SUB_Security_CertManager_GetPriCertJsApi_Func_0010[Promise] cmResult.outData: " + cmResult.outData);
        keyUri = cmResult.uri;
      }).catch((err: BusinessError) => {
        console.error("[Promise] installPrivateCertificate err: " + err.code);
        expect(null).assertFail();
      });
      try {
        let Result : certManager.CMResult = await certManager.getPrivateCertificates();
        console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0010: Result = " + JSON.stringify(Result.credentialList));
      } catch (err) {
        console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0010: e.code " + err.code);
        expect(null).assertFail()
      }
      if (keyUri != undefined) {
        await certManager.uninstallPrivateCertificate(keyUri);
      } else {
        console.error("SUB_Security_CertManager_PriCertJsApi_Func_0200 keyUri is undefined!");
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.name   SUB_Security_CertManager_installPrivateCertificate_Func_0100
     * @tc.number SUB_Security_CertManager_installPrivateCertificate_Func_0100
     * @tc.desc   Call installPrivateCertificate interface with length of keystore is 20480 return 17500003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_Security_CertManager_installPrivateCertificate_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("SUB_Security_CertManager_installPrivateCertificate_Func_0100: started ");
      let keystore: Uint8Array = createUnit8Array(20480);
      let keystorePwd: string = '123456';
      let certAlias: string = 'appCertAliasDemoRsa';
      let keyUri: string | undefined;

      try{
        await certManager.installPrivateCertificate(keystore, keystorePwd, certAlias);
        console.log("installPrivateCertificate success");
        expect(null).assertFail();
      }catch(err){
        console.log("SUB_Security_CertManager_installPrivateCertificate_Func_0100 e.code = " + err.code);
        expect(err.code).assertEqual(17500003);
      }
      done();
    });
    /**
     * @tc.name   SUB_Security_CertManager_installPrivateCertificate_Func_0200
     * @tc.number SUB_Security_CertManager_installPrivateCertificate_Func_0200
     * @tc.desc   Call installPrivateCertificate interface with length of keystore is 20481 return 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_Security_CertManager_installPrivateCertificate_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("SUB_Security_CertManager_installPrivateCertificate_Func_0200: started ");
      let keystore: Uint8Array = createUnit8Array(20481);
      let keystorePwd: string = '123456';
      let certAlias: string = 'appCertAliasDemoRsa';
      let keyUri: string | undefined;

      try{
        await certManager.installPrivateCertificate(keystore, keystorePwd, certAlias);
        console.log("SUB_Security_CertManager_installPrivateCertificate_Func_0200: installPrivateCertificate success");
        expect(null).assertFail();
      }catch(err){
        console.log("SUB_Security_CertManager_installPrivateCertificate_Func_0200 e.code = " + err.code);
        expect(err.code).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.name   SUB_Security_CertManager_installPrivateCertificate_Func_0300
     * @tc.number SUB_Security_CertManager_installPrivateCertificate_Func_0300
     * @tc.desc   Call installPrivateCertificate interface with length of keystorePwd is 32 return 17500003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('SUB_Security_CertManager_installPrivateCertificate_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("SUB_Security_CertManager_installPrivateCertificate_Func_0300: started ");
      let keystore: Uint8Array = commonParameter.priRsaCredData;
      let keystorePwd: string = '11111111111111111111111111111111';
      let certAlias: string = 'appCertAliasDemoRsa';
      let keyUri: string | undefined;
      try{
        await certManager.installPrivateCertificate(keystore, keystorePwd, certAlias);
        console.log("SUB_Security_CertManager_installPrivateCertificate_Func_0300: installPrivateCertificate success");
        expect(null).assertFail();
      }catch(err){
        console.log("SUB_Security_CertManager_installPrivateCertificate_Func_0300 e.code = " + err.code);
        expect(err.code).assertEqual(17500003);
      }
      done();
    });   
    /**
     * @tc.name   SUB_Security_CertManager_installPrivateCertificate_Func_0400
     * @tc.number SUB_Security_CertManager_installPrivateCertificate_Func_0400
     * @tc.desc   Call installPrivateCertificate interface with length of keystorePwd is 33 return 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('SUB_Security_CertManager_installPrivateCertificate_Func_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("SUB_Security_CertManager_installPrivateCertificate_Func_0400: started ");
      let keystore: Uint8Array = commonParameter.priRsaCredData;
      let keystorePwd: string = '111111111111111111111111111111111';
      let certAlias: string = 'appCertAliasDemoRsa';
      let keyUri: string | undefined;
      try{
        await certManager.installPrivateCertificate(keystore, keystorePwd, certAlias);
        console.log("SUB_Security_CertManager_installPrivateCertificate_Func_0400: installPrivateCertificate success");
        expect(null).assertFail();
      }catch(err){
        console.log("SUB_Security_CertManager_installPrivateCertificate_Func_0400 e.code = " + err.code);
        expect(err.code).assertEqual(401);
      }
      done();
    });  
    /**
     * @tc.name   SUB_Security_CertManager_installPrivateCertificate_Func_0500
     * @tc.number SUB_Security_CertManager_installPrivateCertificate_Func_0500
     * @tc.desc   Call installPrivateCertificate interface with type of certAlias is special character return 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('SUB_Security_CertManager_installPrivateCertificate_Func_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("SUB_Security_CertManager_installPrivateCertificate_Func_0500: started ");
      let keystore: Uint8Array = commonParameter.priRsaCredData;
      let keystorePwd: string = '123456';
      let certAlias: string = '@';
      let keyUri: string | undefined;
      try{
        await certManager.installPrivateCertificate(keystore, keystorePwd, certAlias);
        console.log("SUB_Security_CertManager_installPrivateCertificate_Func_0500: installPrivateCertificate success");
        expect(null).assertFail();
      }catch(err){
        console.log("SUB_Security_CertManager_installPrivateCertificate_Func_0500 e.code = " + err.code);
        expect(err.code).assertEqual(401);
      }
      done();
    }); 
    /**
     * @tc.name   SUB_Security_CertManager_installPrivateCertificate_Func_0600
     * @tc.number SUB_Security_CertManager_installPrivateCertificate_Func_0600
     * @tc.desc   Call installPrivateCertificate interface with length of certAlias is 32 available for calling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('SUB_Security_CertManager_installPrivateCertificate_Func_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("SUB_Security_CertManager_installPrivateCertificate_Func_0600: started ");
      let keystore: Uint8Array = commonParameter.priRsaCredData;
      let keystorePwd: string = '123456';
      let certAlias: string = '11111111111111111111111111111111';
      let keyUri: string | undefined;
      try{
        let result: certManager.CMResult = await certManager.installPrivateCertificate(keystore, keystorePwd, certAlias);
        console.log("SUB_Security_CertManager_installPrivateCertificate_Func_0600: installPrivateCertificate success");
        keyUri = result.uri;
        await certManager.uninstallPrivateCertificate(keyUri);
      }catch(err){
        console.log("SUB_Security_CertManager_installPrivateCertificate_Func_0600 e.code = " + err.code);
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.name   SUB_Security_CertManager_installPrivateCertificate_Func_0700
     * @tc.number SUB_Security_CertManager_installPrivateCertificate_Func_0700
     * @tc.desc   Call installPrivateCertificate interface with length of certAlias is 33 return 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('SUB_Security_CertManager_installPrivateCertificate_Func_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("SUB_Security_CertManager_installPrivateCertificate_Func_0700: started ");
      let keystore: Uint8Array = commonParameter.priRsaCredData;
      let keystorePwd: string = '123456';
      let certAlias: string = '111111111111111111111111111111111';
      let keyUri: string | undefined;
      try{
        await certManager.installPrivateCertificate(keystore, keystorePwd, certAlias);
        console.log("SUB_Security_CertManager_installPrivateCertificate_Func_0700: installPrivateCertificate success");
        expect(null).assertFail();
      }catch(err){
        console.log("SUB_Security_CertManager_installPrivateCertificate_Func_0700 e.code = " + err.code);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    
    /**
     * @tc.name   SUB_Security_CertManager_installPrivateCertificate_Func_1100
     * @tc.number SUB_Security_CertManager_installPrivateCertificate_Func_1100
     * @tc.desc   Call installPrivateCertificate interface with length of keystore is 20480 return 17500003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('SUB_Security_CertManager_installPrivateCertificate_Func_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("SUB_Security_CertManager_installPrivateCertificate_Func_1100: started ");
      let keystore: Uint8Array = createUnit8Array(20480);
      let keystorePwd: string = '123456';
      let certAlias: string = 'appCertAliasDemoRsa';
      let keyUri: string | undefined;
	    let level = certManager.AuthStorageLevel.EL1;
      try{
        await certManager.installPrivateCertificate(keystore, keystorePwd, certAlias, level);
        console.log("installPrivateCertificate success");
        expect(null).assertFail();
      }catch(err){
        console.log("SUB_Security_CertManager_installPrivateCertificate_Func_1100 e.code = " + err.code);
        expect(err.code).assertEqual(17500003);
      }
      done();
    });
    /**
     * @tc.name   SUB_Security_CertManager_installPrivateCertificate_Func_1200
     * @tc.number SUB_Security_CertManager_installPrivateCertificate_Func_1200
     * @tc.desc   Call installPrivateCertificate interface with length of keystore is 20481 return 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_Security_CertManager_installPrivateCertificate_Func_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("SUB_Security_CertManager_installPrivateCertificate_Func_1200: started ");
      let keystore: Uint8Array = createUnit8Array(20481);
      let keystorePwd: string = '123456';
      let certAlias: string = 'appCertAliasDemoRsa';
      let keyUri: string | undefined;
	    let level = certManager.AuthStorageLevel.EL1;
      try{
        await certManager.installPrivateCertificate(keystore, keystorePwd, certAlias, level);
        console.log("SUB_Security_CertManager_installPrivateCertificate_Func_1200: installPrivateCertificate success");
        expect(null).assertFail();
      }catch(err){
        console.log("SUB_Security_CertManager_installPrivateCertificate_Func_1200 e.code = " + err.code);
        expect(err.code).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.name   SUB_Security_CertManager_installPrivateCertificate_Func_1300
     * @tc.number SUB_Security_CertManager_installPrivateCertificate_Func_1300
     * @tc.desc   Call installPrivateCertificate interface with length of keystorePwd is 32 return 17500003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('SUB_Security_CertManager_installPrivateCertificate_Func_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("SUB_Security_CertManager_installPrivateCertificate_Func_1300: started ");
      let keystore: Uint8Array = commonParameter.priRsaCredData;
      let keystorePwd: string = '11111111111111111111111111111111';
      let certAlias: string = 'appCertAliasDemoRsa';
      let keyUri: string | undefined;
	    let level = certManager.AuthStorageLevel.EL1;
      try{
        await certManager.installPrivateCertificate(keystore, keystorePwd, certAlias, level);
        console.log("SUB_Security_CertManager_installPrivateCertificate_Func_1300: installPrivateCertificate success");
        expect(null).assertFail();
      }catch(err){
        console.log("SUB_Security_CertManager_installPrivateCertificate_Func_1300 e.code = " + err.code);
        expect(err.code).assertEqual(17500003);
      }
      done();
    });   
    /**
     * @tc.name   SUB_Security_CertManager_installPrivateCertificate_Func_1400
     * @tc.number SUB_Security_CertManager_installPrivateCertificate_Func_1400
     * @tc.desc   Call installPrivateCertificate interface with length of keystorePwd is 33 return 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('SUB_Security_CertManager_installPrivateCertificate_Func_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("SUB_Security_CertManager_installPrivateCertificate_Func_1400: started ");
      let keystore: Uint8Array = commonParameter.priRsaCredData;
      let keystorePwd: string = '111111111111111111111111111111111';
      let certAlias: string = 'appCertAliasDemoRsa';
      let keyUri: string | undefined;
	    let level = certManager.AuthStorageLevel.EL1;
      try{
        await certManager.installPrivateCertificate(keystore, keystorePwd, certAlias, level);
        console.log("SUB_Security_CertManager_installPrivateCertificate_Func_1400: installPrivateCertificate success");
        expect(null).assertFail();
      }catch(err){
        console.log("SUB_Security_CertManager_installPrivateCertificate_Func_1400 e.code = " + err.code);
        expect(err.code).assertEqual(401);
      }
      done();
    });  
    /**
     * @tc.name   SUB_Security_CertManager_installPrivateCertificate_Func_1500
     * @tc.number SUB_Security_CertManager_installPrivateCertificate_Func_1500
     * @tc.desc   Call installPrivateCertificate interface with type of certAlias is special character return 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('SUB_Security_CertManager_installPrivateCertificate_Func_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("SUB_Security_CertManager_installPrivateCertificate_Func_1500: started ");
      let keystore: Uint8Array = commonParameter.priRsaCredData;
      let keystorePwd: string = '123456';
      let certAlias: string = '@';
      let keyUri: string | undefined;
	    let level = certManager.AuthStorageLevel.EL1;
      try{
        await certManager.installPrivateCertificate(keystore, keystorePwd, certAlias, level);
        console.log("SUB_Security_CertManager_installPrivateCertificate_Func_1500: installPrivateCertificate success");
        expect(null).assertFail();
      }catch(err){
        console.log("SUB_Security_CertManager_installPrivateCertificate_Func_1500 e.code = " + err.code);
        expect(err.code).assertEqual(401);
      }
      done();
    }); 
    /**
     * @tc.name   SUB_Security_CertManager_installPrivateCertificate_Func_1600
     * @tc.number SUB_Security_CertManager_installPrivateCertificate_Func_1600
     * @tc.desc   Call installPrivateCertificate with length of certAlias is 32 is available for calling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('SUB_Security_CertManager_installPrivateCertificate_Func_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log("SUB_Security_CertManager_installPrivateCertificate_Func_1600: started ");
      let keystore: Uint8Array = commonParameter.priRsaCredData;
      let keystorePwd: string = '123456';
      let certAlias: string = '11111111111111111111111111111111';
      let keyUri: string | undefined;
	    let level = certManager.AuthStorageLevel.EL1;
      try{
        let result: certManager.CMResult = await certManager.installPrivateCertificate(keystore, keystorePwd, certAlias, level);
        console.log("SUB_Security_CertManager_installPrivateCertificate_Func_1600: installPrivateCertificate success");
        keyUri = result.uri;
        await certManager.uninstallPrivateCertificate(keyUri);
      }catch(err){
        console.log("SUB_Security_CertManager_installPrivateCertificate_Func_1600 e.code = " + err.code);
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.name   SUB_Security_CertManager_installPrivateCertificate_Func_1700
     * @tc.number SUB_Security_CertManager_installPrivateCertificate_Func_1700
     * @tc.desc   Call installPrivateCertificate interface with length of certAlias is 33 return 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_Security_CertManager_installPrivateCertificate_Func_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("SUB_Security_CertManager_installPrivateCertificate_Func_1700: started ");
      let keystore: Uint8Array = commonParameter.priRsaCredData;
      let keystorePwd: string = '123456';
      let certAlias: string = '111111111111111111111111111111111';
      let keyUri: string | undefined;
	  let level = certManager.AuthStorageLevel.EL1;
      try{
        await certManager.installPrivateCertificate(keystore, keystorePwd, certAlias, level);
        console.log("SUB_Security_CertManager_installPrivateCertificate_Func_1700: installPrivateCertificate success");
        expect(null).assertFail();
      }catch(err){
        console.log("SUB_Security_CertManager_installPrivateCertificate_Func_1700 e.code = " + err.code);
        expect(err.code).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.name   SUB_Security_CertManager_uninstallPrivateCertificate_Func_0100
     * @tc.number SUB_Security_CertManager_uninstallPrivateCertificate_Func_0100
     * @tc.desc   Call uninstallPrivateCertificate interface with length of keyUri is 256 return 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_Security_CertManager_uninstallPrivateCertificate_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("SUB_Security_CertManager_uninstallPrivateCertificate_Func_0100: started. ");
      let keyUri: string | undefined = generateString(256);
      try{
        await certManager.uninstallPrivateCertificate(keyUri);
        expect(null).assertFail();
      }catch(err){
        console.log("SUB_Security_CertManager_uninstallPrivateCertificate_Func_0100 e.code = " + err.code);
        expect(err.code).assertEqual(401);
      }
      console.log("SUB_Security_CertManager_uninstallPrivateCertificate_Func_0100: end. ");
      done();
    });
    /**
     * @tc.name   SUB_Security_CertManager_uninstallPrivateCertificate_Func_0200
     * @tc.number SUB_Security_CertManager_uninstallPrivateCertificate_Func_0200
     * @tc.desc   Call uninstallPrivateCertificate interface with length of keyUri is 257 return 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_Security_CertManager_uninstallPrivateCertificate_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("SUB_Security_CertManager_uninstallPrivateCertificate_Func_0200: started. ");
      let keyUri: string | undefined = generateString(257);
      try{
        await certManager.uninstallPrivateCertificate(keyUri);
        expect(null).assertFail();
      }catch(err){
        console.log("SUB_Security_CertManager_uninstallPrivateCertificate_Func_0200 e.code = " + err.code);
        expect(err.code).assertEqual(401);
      }
      console.log("SUB_Security_CertManager_uninstallPrivateCertificate_Func_0200: end. ");
      done();
    });
    /**
     * @tc.name   SUB_Security_CertManager_uninstallPrivateCertificate_Func_0300
     * @tc.number SUB_Security_CertManager_uninstallPrivateCertificate_Func_0300
     * @tc.desc   Call uninstallPrivateCertificate interface with length of keyUri is 256 return 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_Security_CertManager_uninstallPrivateCertificate_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("SUB_Security_CertManager_uninstallPrivateCertificate_Func_0300: started. ");
      let keyUri: string | undefined = generateString(256);
      try{
          certManager.uninstallPrivateCertificate(keyUri, (err, result)=>{
          expect(err.code).assertEqual(401);
          console.log("SUB_Security_CertManager_uninstallPrivateCertificate_Func_0300: end. ");
          done();
        });
      }catch(err){
        console.log("SUB_Security_CertManager_uninstallPrivateCertificate_Func_0300 e.code = " + err.code);
        expect(err.code).assertEqual(401);
        console.log("SUB_Security_CertManager_uninstallPrivateCertificate_Func_0300: end. ");
        done();
      }
    });
    /**
     * @tc.name   SUB_Security_CertManager_uninstallPrivateCertificate_Func_0400
     * @tc.number SUB_Security_CertManager_uninstallPrivateCertificate_Func_0400
     * @tc.desc   Call uninstallPrivateCertificate interface with length of keyUri is 257 return 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_Security_CertManager_uninstallPrivateCertificate_Func_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("SUB_Security_CertManager_uninstallPrivateCertificate_Func_0400: started. ");
      let keyUri: string | undefined = generateString(257);
      try{
          certManager.uninstallPrivateCertificate(keyUri, (err, result)=>{
          expect(err.code).assertEqual(401);
          console.log("SUB_Security_CertManager_uninstallPrivateCertificate_Func_0400: end. ");
          done();
        });
      }catch(err){
        console.log("SUB_Security_CertManager_uninstallPrivateCertificate_Func_0400 e.code = " + err.code);
        expect(err.code).assertEqual(401);
        console.log("SUB_Security_CertManager_uninstallPrivateCertificate_Func_0400: end. ");
        done();
      }
    });
    /**
     * @tc.name   SUB_Security_CertManager_GetPriCertJsApi_Func_0030
     * @tc.number SUB_Security_CertManager_GetPriCertJsApi_Func_0030
     * @tc.desc   normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_GetPriCertJsApi_Func_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0030: started.");
      let keystore: Uint8Array = commonParameter.priRsaCredData;
      let keystorePwd: string = '123456';
      let keyUri: string | undefined;
      let message = '';
      let Uris : (string | undefined)[] = [];

      try {
        for (let i = 1; i < 257; i++) {
          let certAlias : string = 'appCertAliasDemoRsa' + i;
          await certManager.installPrivateCertificate(keystore, keystorePwd, certAlias).then((cmResult: certManager.CMResult) => {
            expect(cmResult != null).assertTrue();
            console.warn("SUB_Security_CertManager_GetPriCertJsApi_Func_0030[Promise] cmResult.uri: " + cmResult.uri);
            console.warn("SUB_Security_CertManager_GetPriCertJsApi_Func_0030[Promise] cmResult.certList: " + cmResult.certList);
            console.warn("SUB_Security_CertManager_GetPriCertJsApi_Func_0030[Promise] cmResult.certInfo: " + cmResult.certInfo);
            console.warn("SUB_Security_CertManager_GetPriCertJsApi_Func_0030[Promise] cmResult.credentialList: " + cmResult.credentialList);
            console.warn("SUB_Security_CertManager_GetPriCertJsApi_Func_0030[Promise] cmResult.credential: " + cmResult.credential);
            console.warn("SUB_Security_CertManager_GetPriCertJsApi_Func_0030[Promise] cmResult.appUidList: " + cmResult.appUidList);
            console.warn("SUB_Security_CertManager_GetPriCertJsApi_Func_0030[Promise] cmResult.outData: " + cmResult.outData);
            keyUri = cmResult.uri;
            Uris.push(keyUri)
          }).catch((err: BusinessError) => {
            console.error("SUB_Security_CertManager_GetPriCertJsApi_Func_0030[Promise] installPrivateCertificate err: " + err.code);
            expect(null).assertFail();
          });
        }
        let Result: certManager.CMResult = await certManager.getPrivateCertificates();
        console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0030: Result = " + JSON.stringify(Result.credentialList));

        if (Result.credentialList != undefined) {
          message += 'result:';
          message += 'count' + Result.credentialList.length;
          message += '\n';
          for (let index = 0; index < Result.credentialList.length; index++) {
            message += 'index ' + index + ': ';
            message += JSON.stringify(Result.credentialList[index]);
            message += '\n';
          }
        } else {
          message += 'credentialList is null';
        }
        console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0030: message = " + message);
        let credentialList = Result.credentialList;
        if (credentialList) {
          expect(credentialList.length).assertEqual(256);
        } else {
          console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0030: Result.credentialList is undefind ");
          expect(null).assertFail();
        }
      } catch (err) {
        console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0030: e.code = " + err.code);
        expect(null).assertFail();
      }
      if (keyUri != undefined) {
        for (let i = 0; i < Uris.length; i++) {
          await certManager.uninstallPrivateCertificate(Uris[i]);
          console.log("SUB_Security_CertManager_GetPriCertJsApi_Func_0030: keyUri "  + i  + "= " + Uris[i]);
        }
      } else {
        console.error("SUB_Security_CertManager_GetPriCertJsApi_Func_0030 keyUri is undefined!");
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CertManager_OpenCertDialogCertJsApi_Func_0030
     * @tc.number Security_CertManager_OpenCertDialogCertJsApi_Func_0030
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_CertManager_OpenCertDialogCertJsApi_Func_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const context : common.Context = GlobalContext.getContext()
      if (canIUse('SystemCapability.Security.CertificateManagerDialog')){
        console.log(`Security_CertManager_OpenCertDialogCertJsApi_Func_0030 device support CertificateManagerDialog`)
        try {
          await certManagerDialog.openCertificateManagerDialog(null, certManagerDialog.CertificateDialogPageType.PAGE_MAIN);
          expect(null).assertFail();
        } catch (err) {
          console.log("SUB_Security_CertManager_PubCertJsApi_Func_0201: e.code = " + err.code);
          expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_INVALID_PARAMS);
        }
        try {
          await certManagerDialog.openCertificateManagerDialog(context, null);
          expect(null).assertFail();
        } catch (err) {
          console.log("SUB_Security_CertManager_PubCertJsApi_Func_0201: e.code = " + err.code);
          expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_INVALID_PARAMS);
        }
        try {
          await certManagerDialog.openCertificateManagerDialog(undefined, certManagerDialog.CertificateDialogPageType.PAGE_MAIN);
          expect(null).assertFail();
        } catch (err) {
          console.log("SUB_Security_CertManager_PubCertJsApi_Func_0201: e.code = " + err.code);
          expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_INVALID_PARAMS);
        }
        try {
          await certManagerDialog.openCertificateManagerDialog(context, undefined);
          expect(null).assertFail();
        } catch (err) {
          console.log("SUB_Security_CertManager_PubCertJsApi_Func_0201: e.code = " + err.code);
          expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_INVALID_PARAMS);
        }
        try {
          await certManagerDialog.openCertificateManagerDialog(context, 9);
          expect(null).assertFail();
        } catch (err) {
          console.log("SUB_Security_CertManager_PubCertJsApi_Func_0201: e.code = " + err.code);
          expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_INVALID_PARAMS);
        }
      } else {
        console.log(`Security_CertManager_OpenCertDialogCertJsApi_Func_0030 device not support CertificateManagerDialog`)
      }

      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_OpenCertDialogCertJsApi_Func_0100
     * @tc.number SUB_Security_CertManager_OpenCertDialogCertJsApi_Func_0100
     * @tc.desc   SUB_Security_CertManager_OpenCertDialogCertJsApi_Func_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_OpenCertDialogCertJsApi_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(certManagerDialog.CertificateDialogErrorCode.ERROR_GENERIC).assertEqual(29700001);
      expect(certManagerDialog.CertificateDialogErrorCode.ERROR_OPERATION_CANCELED).assertEqual(29700002);
      expect(certManagerDialog.CertificateDialogErrorCode.ERROR_OPERATION_FAILED).assertEqual(29700003);
      expect(certManagerDialog.CertificateDialogErrorCode.ERROR_DEVICE_NOT_SUPPORTED).assertEqual(29700004);
      expect(certManagerDialog.CertificateDialogErrorCode.ERROR_NOT_COMPLY_SECURITY_POLICY).assertEqual(29700005);
      expect(certManagerDialog.CertificateDialogErrorCode.ERROR_PARAMETER_VALIDATION_FAILED).assertEqual(29700006);
      expect(certManagerDialog.CertificateDialogErrorCode.ERROR_NO_AVAILABLE_CERTIFICATE).assertEqual(29700007);
      expect(certManagerDialog.CertificateDialogPageType.PAGE_MAIN).assertEqual(1);
      expect(certManagerDialog.CertificateDialogPageType.PAGE_CA_CERTIFICATE).assertEqual(2);
      expect(certManagerDialog.CertificateDialogPageType.PAGE_CREDENTIAL).assertEqual(3);
      expect(certManagerDialog.CertificateDialogPageType.PAGE_INSTALL_CERTIFICATE).assertEqual(4);
      expect(certManagerDialog.CertificateType.CA_CERT).assertEqual(1);
      expect(certManagerDialog.CertificateType.CREDENTIAL_USER).assertEqual(2);
      expect(certManagerDialog.CertificateType.CREDENTIAL_APP).assertEqual(3);
      expect(certManagerDialog.CertificateType.CREDENTIAL_UKEY).assertEqual(4);
      expect(certManagerDialog.CertificateType.CREDENTIAL_SYSTEM).assertEqual(5);
      expect(certManagerDialog.CertificateScope.NOT_SPECIFIED).assertEqual(0);
      expect(certManagerDialog.CertificateScope.CURRENT_USER).assertEqual(1);
      expect(certManagerDialog.CertificateScope.GLOBAL_USER).assertEqual(2);

      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_OpenInstallCertificateDialogCertJsApi_Func_0020
     * @tc.number SUB_Security_CertManager_OpenInstallCertificateDialogCertJsApi_Func_0020
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_OpenInstallCertificateDialogCertJsApi_Func_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("SUB_Security_CertManager_OpenInstallCertificateDialogCertJsApi_Func_0020: started ");
      const context :common.Context = GlobalContext.getContext();
      let certificateType: certManagerDialog.CertificateType = certManagerDialog.CertificateType.CA_CERT;
      let certificateScope: certManagerDialog.CertificateScope = certManagerDialog.CertificateScope.CURRENT_USER;
      try {
        await certManagerDialog.openInstallCertificateDialog(null, certificateType, certificateScope, caCert)
        expect(null).assertFail()
      } catch (err) {
        if (!canIUse('SystemCapability.Security.CertificateManagerDialog')) {
          expect(err.code).assertEqual(801);
        } else {
          if (err.code == 29700004) {
            expect(err.code).assertEqual(29700004);
          } else {
            console.log("SUB_Security_CertManager_OpenInstallCertificateDialogCertJsApi_Func_0020: e.code " + err.code);
            expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_INVALID_PARAMS);
          }
        }
      }
      try {
        await certManagerDialog.openInstallCertificateDialog(undefined, certificateType, certificateScope, caCert)
        expect(null).assertFail()
      } catch (err) {
        if (!canIUse('SystemCapability.Security.CertificateManagerDialog')) {
          expect(err.code).assertEqual(801);
        } else {
          if (err.code == 29700004) {
            expect(err.code).assertEqual(29700004);
          } else {
            console.log("SUB_Security_CertManager_OpenInstallCertificateDialogCertJsApi_Func_0020: e.code " + err.code);
            expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_INVALID_PARAMS);
          }
        }
      }
      try {
        await certManagerDialog.openInstallCertificateDialog(context, certificateType, certificateScope, null)
        expect(null).assertFail()
      } catch (err) {
        if (!canIUse('SystemCapability.Security.CertificateManagerDialog')) {
          expect(err.code).assertEqual(801);
        } else {
          if (err.code == 29700004) {
            expect(err.code).assertEqual(29700004);
          } else {
            console.log("SUB_Security_CertManager_OpenInstallCertificateDialogCertJsApi_Func_0020: e.code " + err.code);
            expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_INVALID_PARAMS);
          }
        }
      }
      try {
        await certManagerDialog.openInstallCertificateDialog(context, certificateType, certificateScope, undefined)
        expect(null).assertFail()
      } catch (err) {
        if (!canIUse('SystemCapability.Security.CertificateManagerDialog')) {
          expect(err.code).assertEqual(801);
        } else {
          if (err.code == 29700004) {
            expect(err.code).assertEqual(29700004);
          } else {
            console.log("SUB_Security_CertManager_OpenInstallCertificateDialogCertJsApi_Func_0020: e.code " + err.code);
            expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_INVALID_PARAMS);
          }
        }
      }
      try {
        await certManagerDialog.openInstallCertificateDialog(context, null, certificateScope, caCert)
        expect(null).assertFail()
      } catch (err) {
        if (!canIUse('SystemCapability.Security.CertificateManagerDialog')) {
          expect(err.code).assertEqual(801);
        } else {
          if (err.code == 29700004) {
            expect(err.code).assertEqual(29700004);
          } else {
            console.log("SUB_Security_CertManager_OpenInstallCertificateDialogCertJsApi_Func_0020: e.code " + err.code);
            expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_INVALID_PARAMS);
          }
        }
      }

      try {
        await certManagerDialog.openInstallCertificateDialog(context, 999, certificateScope, caCert)
        expect(null).assertFail()
      } catch (err) {
        if (!canIUse('SystemCapability.Security.CertificateManagerDialog')) {
          expect(err.code).assertEqual(801);
        } else {
          if (err.code == 29700004) {
            expect(err.code).assertEqual(29700004);
          } else {
            console.log("SUB_Security_CertManager_OpenInstallCertificateDialogCertJsApi_Func_0020: e.code " + err.code);
            expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_INVALID_PARAMS);
          }
        }
      }
      try {
        await certManagerDialog.openInstallCertificateDialog(context, certificateType, null, caCert)
        expect(null).assertFail()
      } catch (err) {
        if (!canIUse('SystemCapability.Security.CertificateManagerDialog')) {
          expect(err.code).assertEqual(801);
        } else {
          if (err.code == 29700004) {
            expect(err.code).assertEqual(29700004);
          } else {
            console.log("SUB_Security_CertManager_OpenInstallCertificateDialogCertJsApi_Func_0020: e.code " + err.code);
            expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_INVALID_PARAMS);
          }
        }
      }

      try {
        await certManagerDialog.openInstallCertificateDialog(context, certificateType, certificateScope, null)
        expect(null).assertFail()
      } catch (err) {
        if (!canIUse('SystemCapability.Security.CertificateManagerDialog')) {
          expect(err.code).assertEqual(801);
        } else {
          if (err.code == 29700004) {
            expect(err.code).assertEqual(29700004);
          } else {
            console.log("SUB_Security_CertManager_OpenInstallCertificateDialogCertJsApi_Func_0020: e.code " + err.code);
            expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_INVALID_PARAMS);
          }
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_OpenInstallCertificateDialogCertJsApi_Func_0040
     * @tc.number SUB_Security_CertManager_OpenInstallCertificateDialogCertJsApi_Func_0040
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_OpenInstallCertificateDialogCertJsApi_Func_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("SUB_Security_CertManager_OpenInstallCertificateDialogCertJsApi_Func_0040: started ");
      const context :common.Context = GlobalContext.getContext();
      let certificateType: certManagerDialog.CertificateType = certManagerDialog.CertificateType.CA_CERT;
      let certificateScope: certManagerDialog.CertificateScope = certManagerDialog.CertificateScope.CURRENT_USER;
      try {
        await certManagerDialog.openInstallCertificateDialog(null, certificateType, certificateScope, caCert)
        expect(null).assertFail()
      } catch (err) {
        if (err.code == 29700004) {
          console.log("SUB_Security_CertManager_OpenInstallCertificateDialogCertJsApi_Func_0040: e.code " + err.code);
          expect(err.code).assertEqual(29700004);
        } else {
          console.log("SUB_Security_CertManager_OpenInstallCertificateDialogCertJsApi_Func_0040: e.code " + err.code);
          expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_INVALID_PARAMS);
        }
      }
      done();
});

    /**
     * @tc.name   SUB_Security_CertManager_OpenInstallCertificateDialog_0011
     * @tc.number SUB_Security_CertManager_OpenInstallCertificateDialog_0011
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_OpenInstallCertificateDialog_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("SUB_Security_CertManager_OpenInstallCertificateDialog_0011: started ");
      const context :common.Context = GlobalContext.getContext();
      let isSupport = certManagerDialog.supportsCACertDialog();
      let certificateType: certManagerDialog.CertificateType = certManagerDialog.CertificateType.CA_CERT;
      let certificateScope: certManagerDialog.CertificateScope = certManagerDialog.CertificateScope.GLOBAL_USER;
      try {
        await certManagerDialog.openInstallCertificateDialog(context, certificateType, certificateScope, caCert)
        expect(null).assertFail()
      } catch (err) {
        if (!canIUse('SystemCapability.Security.CertificateManagerDialog')) {
          expect(err.code).assertEqual(801);
        } else {
          if (isSupport) {
            console.log("SUB_Security_CertManager_OpenInstallCertificateDialog_0011: the device supports CACertDialog. e.code" + err.code);
            expect(err.code).assertEqual(certManagerDialog.CertificateDialogErrorCode.ERROR_NOT_COMPLY_SECURITY_POLICY);
          } else {
            console.log("SUB_Security_CertManager_OpenInstallCertificateDialog_0011: the device don't supports CACertDialog. e.code " + err.code);
            expect(err.code).assertEqual(certManagerDialog.CertificateDialogErrorCode.ERROR_DEVICE_NOT_SUPPORTED);
          }
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_getUkeyCertificateList_func_0010
     * @tc.number SUB_Security_CertManager_getUkeyCertificateList_func_0010
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_getUkeyCertificateList_func_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("SUB_Security_CertManager_getUkeyCertificateList_func_0010: started ");
      let ukeyProvider: string = 'testProvider'; 
      let ukeyInfo: certManager.UkeyInfo = { 
        certPurpose: certManager.CertificatePurpose.PURPOSE_DEFAULT,
      }
      try {
        await certManager.getUkeyCertificateList(ukeyProvider, ukeyInfo).then((cmResult: certManager.CMResult) => {
        let list: Array<certManager.Credential> = cmResult.credentialDetailList ?? [];
        }).catch((err: BusinessError) => {
          if(err.code !== 801){
          console.error(`SUB_Security_CertManager_getUkeyCertificateList_func_0010 failed. Code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(17500001);
          }
        })
      } catch (error) {
        console.error(`SUB_Security_CertManager_getUkeyCertificateList_func_0010 failed. Code: ${error.code}, message: ${error.message}`);
      }
      done();
    });
    /**
     * @tc.name   SUB_Security_CertManager_getUkeyCertificateList_func_0011
     * @tc.number SUB_Security_CertManager_getUkeyCertificateList_func_0011
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_getUkeyCertificateList_func_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("SUB_Security_CertManager_getUkeyCertificateList_func_0011: started ");
      let ukeyProvider: string = 'testProvider'; 
      let ukeyInfo: certManager.UkeyInfo = { 
        certPurpose: certManager.CertificatePurpose.PURPOSE_ALL,
      }
      try {
        await certManager.getUkeyCertificateList(ukeyProvider, ukeyInfo).then((cmResult: certManager.CMResult) => {
        let list: Array<certManager.Credential> = cmResult.credentialDetailList ?? [];
        }).catch((err: BusinessError) => {
          if(err.code !== 801){
          console.error(`SUB_Security_CertManager_getUkeyCertificateList_func_0011 failed. Code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(17500001);
          }
        })
      } catch (error) {
        console.error(`SUB_Security_CertManager_getUkeyCertificateList_func_0011 failed. Code: ${error.code}, message: ${error.message}`);
      }
      done();
    });
    /**
     * @tc.name   SUB_Security_CertManager_getUkeyCertificateList_func_0012
     * @tc.number SUB_Security_CertManager_getUkeyCertificateList_func_0012
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_getUkeyCertificateList_func_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("SUB_Security_CertManager_getUkeyCertificateList_func_0012: started ");
      let ukeyProvider: string = 'testProvider'; 
      let ukeyInfo: certManager.UkeyInfo = { 
        certPurpose: certManager.CertificatePurpose.PURPOSE_SIGN,
      }
      try {
        await certManager.getUkeyCertificateList(ukeyProvider, ukeyInfo).then((cmResult: certManager.CMResult) => {
        let list: Array<certManager.Credential> = cmResult.credentialDetailList ?? [];
        }).catch((err: BusinessError) => {
          if(err.code !== 801){
          console.error(`SUB_Security_CertManager_getUkeyCertificateList_func_0012 failed. Code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(17500001);
          }
        })
      } catch (error) {
        console.error(`SUB_Security_CertManager_getUkeyCertificateList_func_0012 failed. Code: ${error.code}, message: ${error.message}`);
      }
      done();
    });
    /**
     * @tc.name   SUB_Security_CertManager_getUkeyCertificateList_func_0013
     * @tc.number SUB_Security_CertManager_getUkeyCertificateList_func_0013
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_getUkeyCertificateList_func_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log("SUB_Security_CertManager_getUkeyCertificateList_func_0013: started ");
      let ukeyProvider: string = 'testProvider'; 
      let ukeyInfo: certManager.UkeyInfo = { 
        certPurpose: certManager.CertificatePurpose.PURPOSE_ENCRYPT,
      }
      try {
        await certManager.getUkeyCertificateList(ukeyProvider, ukeyInfo).then((cmResult: certManager.CMResult) => {
        let list: Array<certManager.Credential> = cmResult.credentialDetailList ?? [];
        }).catch((err: BusinessError) => {
          if(err.code !== 801){
          console.error(`SUB_Security_CertManager_getUkeyCertificateList_func_0013 failed. Code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(17500001);
          }
        })
      } catch (error) {
        console.error(`SUB_Security_CertManager_getUkeyCertificateList_func_0013 failed. Code: ${error.code}, message: ${error.message}`);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_ImportUkeyCertificate_Func_0100
     * @tc.number SUB_Security_CertManager_ImportUkeyCertificate_Func_0100
     * @tc.desc   import USB key certificate with PURPOSE_SIGN without real USB key, return error code 17500010 on PC device or 801 on non-PC device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_CertManager_ImportUkeyCertificate_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('SUB_Security_CertManager_ImportUkeyCertificate_Func_0100 start');
      let keyUri: string = 'test';
      let certData: Uint8Array = new Uint8Array([0x30, 0x82, 0x0b, 0xc1, 0x02, 0x01]);
      let ukeyInfo: certManager.UkeyInfo = {
        certPurpose: certManager.CertificatePurpose.PURPOSE_SIGN,
      };
      if (canIUse('SystemCapability.Security.Huks.CryptoExtension')) {
        try {
          await certManager.importUkeyCertificate(keyUri, certData, ukeyInfo);
          expect(null).assertFail();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(`SUB_Security_CertManager_ImportUkeyCertificate_Func_0100 failed. Code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(17500010);
        }
      } else {
        try {
          await certManager.importUkeyCertificate(keyUri, certData, ukeyInfo);
          expect(null).assertFail();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(`SUB_Security_CertManager_ImportUkeyCertificate_Func_0100 failed. Code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(801);
        }
      }
      console.info('SUB_Security_CertManager_ImportUkeyCertificate_Func_0100 end');
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_ImportUkeyCertificate_Func_0200
     * @tc.number SUB_Security_CertManager_ImportUkeyCertificate_Func_0200
     * @tc.desc   import USB key certificate with PURPOSE_ENCRYPT without real USB key, return error code 17500010 on PC device or 801 on non-PC device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_CertManager_ImportUkeyCertificate_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('SUB_Security_CertManager_ImportUkeyCertificate_Func_0200 start');
      let keyUri: string = 'test';
      let certData: Uint8Array = new Uint8Array([0x30, 0x82, 0x0b, 0xc1, 0x02, 0x01]);
      let ukeyInfo: certManager.UkeyInfo = {
        certPurpose: certManager.CertificatePurpose.PURPOSE_ENCRYPT,
      };
      if (canIUse('SystemCapability.Security.Huks.CryptoExtension')) {
        try {
          await certManager.importUkeyCertificate(keyUri, certData, ukeyInfo);
          expect(null).assertFail();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(`SUB_Security_CertManager_ImportUkeyCertificate_Func_0200 failed. Code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(17500010);
        }
      } else {
        try {
          await certManager.importUkeyCertificate(keyUri, certData, ukeyInfo);
          expect(null).assertFail();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(`SUB_Security_CertManager_ImportUkeyCertificate_Func_0200 failed. Code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(801);
        }
      }
      console.info('SUB_Security_CertManager_ImportUkeyCertificate_Func_0200 end');
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_ImportUkeyCertificate_Func_0400
     * @tc.number SUB_Security_CertManager_ImportUkeyCertificate_Func_0400
     * @tc.desc   keyUri length equals 256 bytes, return error code 17500010 on PC device or 801 on non-PC device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_CertManager_ImportUkeyCertificate_Func_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('SUB_Security_CertManager_ImportUkeyCertificate_Func_0400 start');
      let keyUri: string = generateString(256);
      let certData: Uint8Array = new Uint8Array([0x30, 0x82, 0x0b, 0xc1, 0x02, 0x01]);
      let ukeyInfo: certManager.UkeyInfo = {
        certPurpose: certManager.CertificatePurpose.PURPOSE_SIGN,
      };
      if (canIUse('SystemCapability.Security.Huks.CryptoExtension')) {
        try {
          await certManager.importUkeyCertificate(keyUri, certData, ukeyInfo);
          expect(null).assertFail();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(`SUB_Security_CertManager_ImportUkeyCertificate_Func_0400 failed. Code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(17500010);
        }
      } else {
        try {
          await certManager.importUkeyCertificate(keyUri, certData, ukeyInfo);
          expect(null).assertFail();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(`SUB_Security_CertManager_ImportUkeyCertificate_Func_0400 failed. Code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(801);
        }
      }
      console.info('SUB_Security_CertManager_ImportUkeyCertificate_Func_0400 end');
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_ImportUkeyCertificate_Func_1400
     * @tc.number SUB_Security_CertManager_ImportUkeyCertificate_Func_1400
     * @tc.desc   import USB key certificate with PURPOSE_DEFAULT without real USB key, return error code 17500010 on PC device or 801 on non-PC device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_CertManager_ImportUkeyCertificate_Func_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('SUB_Security_CertManager_ImportUkeyCertificate_Func_1400 start');
      let keyUri: string = 'test';
      let certData: Uint8Array = new Uint8Array([0x30, 0x82, 0x0b, 0xc1, 0x02, 0x01]);
      let ukeyInfo: certManager.UkeyInfo = {
        certPurpose: certManager.CertificatePurpose.PURPOSE_DEFAULT,
      };
      if (canIUse('SystemCapability.Security.Huks.CryptoExtension')) {
        try {
          await certManager.importUkeyCertificate(keyUri, certData, ukeyInfo);
          expect(null).assertFail();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(`SUB_Security_CertManager_ImportUkeyCertificate_Func_1400 failed. Code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(17500010);
        }
      } else {
        try {
          await certManager.importUkeyCertificate(keyUri, certData, ukeyInfo);
          expect(null).assertFail();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          console.error(`SUB_Security_CertManager_ImportUkeyCertificate_Func_1400 failed. Code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(801);
        }
      }
      console.info('SUB_Security_CertManager_ImportUkeyCertificate_Func_1400 end');
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_ImportUkeyCertificate_Func_1500
     * @tc.number SUB_Security_CertManager_ImportUkeyCertificate_Func_1500
     * @tc.desc   import USB key certificate with PURPOSE_ALL, return error code 17500011.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_CertManager_ImportUkeyCertificate_Func_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('SUB_Security_CertManager_ImportUkeyCertificate_Func_1500 start');
      let keyUri: string = 'test';
      let certData: Uint8Array = new Uint8Array([0x30, 0x82, 0x0b, 0xc1, 0x02, 0x01]);
      let ukeyInfo: certManager.UkeyInfo = {
        certPurpose: certManager.CertificatePurpose.PURPOSE_ALL,
      };
      try {
        await certManager.importUkeyCertificate(keyUri, certData, ukeyInfo);
        expect(null).assertFail();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.error(`SUB_Security_CertManager_ImportUkeyCertificate_Func_1500 failed. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(17500011);
      }
      console.info('SUB_Security_CertManager_ImportUkeyCertificate_Func_1500 end');
      done();
    });
  })
}