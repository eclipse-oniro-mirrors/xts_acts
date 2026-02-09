/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import metadataBinding from '@ohos.multimodalAwareness.metadataBinding'
import { describe, beforeAll, Hypium, it, expect, TestType, Size, Level } from "../../../hypium/index";
import { BusinessError } from '@ohos.base'
import hilog from '@ohos.hilog'
import Utils from './Util.test';

let domain: int = 0x0000;
let tag: string = 'metadataBindingTestTag';

export default function metadataBindingTest() {
  describe("metadataBindingTest", (): void => {
    hilog.info(domain, tag, `metadataBindingTest describe enter`);

    /**
     * @tc.name   SUB_MSDP_Api_metadataBinding_static_0100
     * @tc.number SUB_MSDP_Api_metadataBinding_static_0100
     * @tc.desc   SUB_MSDP_Api_metadataBinding_static_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MSDP_Api_metadataBinding_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MSDP_Api_metadataBinding_static_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          metadataBinding.onOperationSubmitMetadata('com.example.mydevicestatusappStatic', (data) => {
            hilog.info(domain, tag, `${caseName} onOperatingHandChanged success` + data);  
          });
          hilog.info(domain, tag, `${caseName} onOperationSubmitMetadata success`);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed error.code: ${e.code} , error.message: ${e.message}`);
          if(error.code == 32100004) {
            hilog.info(domain, tag, `${caseName} The device does not support this API.`);
          } else {
            hilog.info(domain, tag, `${caseName} onOperationSubmitMetadata fail`);
            expect().assertFail();
          }
          done();
        }
        hilog.info(domain, tag, `${caseName} end`);
      });

    /**
     * @tc.name   SUB_MSDP_Api_metadataBinding_static_0200
     * @tc.number SUB_MSDP_Api_metadataBinding_static_0200
     * @tc.desc   SUB_MSDP_Api_metadataBinding_static_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MSDP_Api_metadataBinding_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MSDP_Api_metadataBinding_static_0200";
        hilog.info(domain, tag, `${caseName} enter`);
        let bundleName: string = '';
        try {
          metadataBinding.onOperationSubmitMetadata(bundleName, (data) => {});
          hilog.info(domain, tag, `${caseName} onOperationSubmitMetadata success`);
          expect().assertFail();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed error.code: ${e.code} , error.message: ${e.message}`);
          expect(error.code == 401).assertTrue();
          done();
        }
        hilog.info(domain, tag, `${caseName} end`);
      });

    /**
     * @tc.name   SUB_MSDP_Api_metadataBinding_static_0300
     * @tc.number SUB_MSDP_Api_metadataBinding_static_0300
     * @tc.desc   SUB_MSDP_Api_metadataBinding_static_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MSDP_Api_metadataBinding_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MSDP_Api_metadataBinding_static_0300";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let actulStr: string = 'abcdef';
          metadataBinding.submitMetadata(actulStr);
          hilog.info(domain, tag, `${caseName} submitMetadata success`);
          expect().assertFail();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed error.code: ${e.code} , error.message: ${e.message}`);
          expect(error.code == 32100001).assertTrue();
          done();
        }
        hilog.info(domain, tag, `${caseName} end`);
      });

    /**
     * @tc.name   SUB_MSDP_Api_metadataBinding_static_0400
     * @tc.number SUB_MSDP_Api_metadataBinding_static_0400
     * @tc.desc   SUB_MSDP_Api_metadataBinding_static_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MSDP_Api_metadataBinding_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MSDP_Api_metadataBinding_static_0400";
        hilog.info(domain, tag, `${caseName} enter`);
        let bundleName: string = 'com.example.mydevicestatusappStatic';
        try {
          metadataBinding.offOperationSubmitMetadata(bundleName, (data) => {
            hilog.info(domain, tag, `${caseName} metadataBinding.off success` + data);  
          });
          hilog.info(domain, tag, `${caseName} offOperationSubmitMetadata success`);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed error.code: ${e.code} , error.message: ${e.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} end`);
      });

    /**
     * @tc.name   SUB_MSDP_Api_metadataBinding_static_0500
     * @tc.number SUB_MSDP_Api_metadataBinding_static_0500
     * @tc.desc   SUB_MSDP_Api_metadataBinding_static_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
     it("SUB_MSDP_Api_metadataBinding_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MSDP_Api_metadataBinding_static_0500";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          metadataBinding.offOperationSubmitMetadata('com.example.mydevicestatusappStatic');
          hilog.info(domain, tag, `${caseName} offOperationSubmitMetadata success`);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed error.code: ${e.code} , error.message: ${e.message}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} end`);
      });

    /**
     * @tc.name   SUB_MSDP_Api_metadataBinding_static_0600
     * @tc.number SUB_MSDP_Api_metadataBinding_static_0600
     * @tc.desc   SUB_MSDP_Api_metadataBinding_static_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MSDP_Api_metadataBinding_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MSDP_Api_metadataBinding_static_0600";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          metadataBinding.offOperationSubmitMetadata('');
          hilog.info(domain, tag, `${caseName} offOperationSubmitMetadata success`);
          expect().assertFail();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed error.code: ${e.code} , error.message: ${e.message}`);
          expect(error.code == 401).assertTrue();
          done();
        }
        hilog.info(domain, tag, `${caseName} end`);
      });
  })
}