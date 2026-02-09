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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import cert from '@ohos.security.cert';
import util from '@ohos.util';
import * as certPromise from "./utils/certificate/publicCertificatePromise";
import * as certCallback from "./utils/certificate/publicCertificateCallback";
import * as certCommon from "./utils/certificate/publicCertificateCommon";
import {
  uInt8ArrayToString,
  uInt8ArrayToShowStr,
} from "./utils/common/publicDoString";

export default function CertFrameworkFuncTestJSUnit() {
  describe("CertFrameworkFuncTestJSUnit", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });

    /**
     * @tc.name   Security_CertificateFramework_Enum_Func_0100
     * @tc.number Security_CertificateFramework_Enum_Func_0100
     * @tc.desc   X509 Cert Enum Type Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CertificateFramework_Enum_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          certCommon.certificateEnumTypeTest();
          certCommon.certificateEnumTypeTest2();
        } catch (err: BusinessError) {
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   Security_CertificateFramework_CertTest_Func_0100
     * @tc.number Security_CertificateFramework_CertTest_Func_0100
     * @tc.desc   Create Der Cert with Promise Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CertificateFramework_CertTest_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let certObject: cert.X509Cert = await certPromise.createX509CertInstancePromise("der")
          expect(
            certObject != null && certObject != undefined
          ).assertTrue();
          let TBS: cert.DataBlob = certCommon.getX509CertItem(
            certObject,
            cert.CertItemType.CERT_ITEM_TYPE_TBS
          );
          expect(TBS != null && TBS != undefined).assertTrue();
          console.warn(
            "getX509CertItem TBS: " + uInt8ArrayToShowStr(TBS.data)
          );
        } catch (err: BusinessError) {
          console.error(
            "getX509CertItem TBS error, error code is: " + err.code
          );
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   Security_CertificateFramework_CertTest_Func_0200
     * @tc.number Security_CertificateFramework_CertTest_Func_0200
     * @tc.desc   Create Der Cert with Callback Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CertificateFramework_CertTest_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let certObject: cert.X509Cert = await certCallback.createX509CertInstanceCallback("der")
          expect(
            certObject != null && certObject != undefined
          ).assertTrue();
          let pubKey: cert.DataBlob = certCommon.getX509CertItem(
            certObject,
            cert.CertItemType.CERT_ITEM_TYPE_PUBLIC_KEY
          );
          expect(pubKey != null && pubKey != undefined).assertTrue();
          console.log(
            "getX509CertItem pubKey: " + uInt8ArrayToShowStr(pubKey.data)
          );
        } catch (err: BusinessError) {
          console.error(
            "getX509CertItem pubKey error, error code is: " + err.code
          );
          expect(null).assertFail();
        }
        done();
      })

    /**
     * @tc.name   Security_CertificateFramework_CertTest_Func_0300
     * @tc.number Security_CertificateFramework_CertTest_Func_0300
     * @tc.desc   Create Der Cert with Promise Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CertificateFramework_CertTest_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let certObject: cert.X509Cert = await certPromise.createX509CertInstancePromise("der")
          expect(
            certObject != null && certObject != undefined
          ).assertTrue();
          let issuerUniqueID: cert.DataBlob = certCommon.getX509CertItem(
            certObject,
            cert.CertItemType.CERT_ITEM_TYPE_ISSUER_UNIQUE_ID
          );
          expect(
            issuerUniqueID != null && issuerUniqueID != undefined
          ).assertTrue();
          console.warn(
            "getX509CertItem issuerUniqueID: " +
            uInt8ArrayToShowStr(issuerUniqueID.data)
          );
        } catch (err: BusinessError) {
          console.error(
            "getX509CertItem issuerUniqueID error, error code is: " +
            err.code
          );
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   Security_CertificateFramework_CertTest_Func_0400
     * @tc.number Security_CertificateFramework_CertTest_Func_0400
     * @tc.desc   Create Der Cert with Callback Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CertificateFramework_CertTest_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let certObject: cert.X509Cert = await certCallback.createX509CertInstanceCallback("der")
          expect(
            certObject != null && certObject != undefined
          ).assertTrue();
          let subjectUniqueID = certCommon.getX509CertItem(
            certObject,
            cert.CertItemType.CERT_ITEM_TYPE_SUBJECT_UNIQUE_ID
          );
          expect(
            subjectUniqueID != null && subjectUniqueID != undefined
          ).assertTrue();
          console.warn(
            "getX509CertItem subjectUniqueID: " +
            uInt8ArrayToShowStr(subjectUniqueID.data)
          );
        } catch (err: BusinessError) {
          console.error(
            "getX509CertItem subjectUniqueID error, error code is: " +
            err.code
          );
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   Security_CertificateFramework_CertTest_Func_0500
     * @tc.number Security_CertificateFramework_CertTest_Func_0500
     * @tc.desc   Create Der Cert with Promise Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CertificateFramework_CertTest_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let certObject: cert.X509Cert = await certPromise.createX509CertInstancePromise("der")
          expect(
            certObject != null && certObject != undefined
          ).assertTrue();
          let extensions = certCommon.getX509CertItem(
            certObject,
            cert.CertItemType.CERT_ITEM_TYPE_EXTENSIONS
          );
          expect(
            extensions != null && extensions != undefined
          ).assertTrue();
          console.warn(
            "getX509CertItem extensions: " +
            uInt8ArrayToShowStr(extensions.data)
          );
        } catch (err: BusinessError) {
          console.error(
            "getX509CertItem extensions error, error code is: " + err.code
          );
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   Security_CertificateFramework_CertExtensionTest_Func_0100
     * @tc.number Security_CertificateFramework_CertExtensionTest_Func_0100
     * @tc.desc   Create Der CertExtension with Promise Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CertificateFramework_CertExtensionTest_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let extensionObj: cert.CertExtension =
            await certPromise.createX509CertExtensionNormalPromise("certExtensionNormal01")
          expect(
            extensionObj != null && extensionObj != undefined
          ).assertTrue();
          let encodedObj = extensionObj.getEncoded();
          expect(
            encodedObj != null && encodedObj != undefined
          ).assertTrue();
          console.warn(
            "encodedObj data is: " + uInt8ArrayToShowStr(encodedObj.data)
          );
          console.warn(
            "encodedObj encodingFormat is: " + encodedObj.encodingFormat
          );
        } catch (err: BusinessError) {
          console.error("getEncoded error, error code is: " + err.code);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   Security_CertificateFramework_CertExtensionTest_Func_0200
     * @tc.number Security_CertificateFramework_CertExtensionTest_Func_0200
     * @tc.desc   ExtensionOidType is EXTENSION_OID_TYPE_ALL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(
      "Security_CertificateFramework_CertExtensionTest_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let extensionObj: cert.CertExtension =
            await certCallback.createX509CertExtensionNormalCallback("certExtensionNormal02")
          expect(
            extensionObj != null && extensionObj != undefined
          ).assertTrue();
          let oidListObj = extensionObj.getOidList(
            cert.ExtensionOidType.EXTENSION_OID_TYPE_ALL
          );
          expect(
            oidListObj != null && oidListObj != undefined
          ).assertTrue();
          console.warn("oidListObj data is: " + oidListObj.data);
          let oid = oidListObj.data[0];
          let oid1 = oidListObj.data[1];
          let oidDataBlob: cert.DataBlob = {
            data: oid,
          };
          let oidDataBlob1: cert.DataBlob = {
            data: oid1,
          };
          let entryObj = extensionObj.getEntry(
            cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY,
            oidDataBlob
          );
          expect(entryObj != null && entryObj != undefined).assertTrue();
          console.warn("entryObj data is: " + entryObj.data);
          let entryObj1 = extensionObj.getEntry(
            cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY_CRITICAL,
            oidDataBlob1
          );
          expect(entryObj1 != null && entryObj1 != undefined).assertTrue();
          console.warn("entryObj1 data is: " + entryObj1.data);
        } catch (err: BusinessError) {
          console.error("getEntry error, error code is: " + err.code);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   Security_CertificateFramework_CertExtensionTest_Func_0300
     * @tc.number Security_CertificateFramework_CertExtensionTest_Func_0300
     * @tc.desc   ExtensionOidType is EXTENSION_OID_TYPE_CRITICAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CertificateFramework_CertExtensionTest_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let extensionObj: cert.CertExtension =
            await certPromise.createX509CertExtensionNormalPromise("certExtensionNormal02")
          expect(
            extensionObj != null && extensionObj != undefined
          ).assertTrue();
          let oidListObj = extensionObj.getOidList(
            cert.ExtensionOidType.EXTENSION_OID_TYPE_CRITICAL
          );
          expect(
            oidListObj != null && oidListObj != undefined
          ).assertTrue();
          console.warn("oidListObj data is: " + oidListObj.data);
          let oid = oidListObj.data[0];
          let oid2 = oidListObj.data[oidListObj.data.length - 1];
          let oidDataBlob: cert.DataBlob = {
            data: oid,
          };
          let oidDataBlob2: cert.DataBlob = {
            data: oid2,
          };
          let entryObj = extensionObj.getEntry(
            cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY_CRITICAL,
            oidDataBlob
          );
          expect(entryObj != null && entryObj != undefined).assertTrue();
          console.warn(
            "entryObj data is: " + uInt8ArrayToShowStr(entryObj.data)
          );
          let entryObj2 = extensionObj.getEntry(
            cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY_VALUE,
            oidDataBlob2
          );
          expect(entryObj2 != null && entryObj2 != undefined).assertTrue();
          console.warn("entryObj2 data is: " + entryObj2.data);
        } catch (err: BusinessError) {
          console.error("getEntry error, error code is: " + err.code);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   Security_CertificateFramework_CertExtensionTest_Func_0400
     * @tc.number Security_CertificateFramework_CertExtensionTest_Func_0400
     * @tc.desc   ExtensionOidType is EXTENSION_OID_TYPE_UNCRITICAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(
      "Security_CertificateFramework_CertExtensionTest_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let extensionObj: cert.CertExtension =
            await certCallback.createX509CertExtensionNormalCallback("certExtensionNormal02")
          expect(
            extensionObj != null && extensionObj != undefined
          ).assertTrue();
          let oidListObj = extensionObj.getOidList(
            cert.ExtensionOidType.EXTENSION_OID_TYPE_UNCRITICAL
          );
          expect(
            oidListObj != null && oidListObj != undefined
          ).assertTrue();
          console.warn("oidListObj data is: " + oidListObj.data);
          let oid1 = oidListObj.data[1];
          let oid2 = oidListObj.data[oidListObj.data.length - 1];
          let oidDataBlob1: cert.DataBlob = {
            data: oid1,
          };
          let oidDataBlob2: cert.DataBlob = {
            data: oid2,
          };
          let entryObj1 = extensionObj.getEntry(
            cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY,
            oidDataBlob1
          );
          expect(entryObj1 != null && entryObj1 != undefined).assertTrue();
          console.warn(
            "entryObj1 data is: " + uInt8ArrayToShowStr(entryObj1.data)
          );
          let entryObj2 = extensionObj.getEntry(
            cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY_VALUE,
            oidDataBlob2
          );
          expect(entryObj2 != null && entryObj2 != undefined).assertTrue();
          console.warn(
            "entryObj2 data is: " + uInt8ArrayToShowStr(entryObj2.data)
          );
        } catch (err: BusinessError) {
          console.error("getEntry error, error code is: " + err.code);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   Security_CertificateFramework_CertExtensionTest_Func_0500
     * @tc.number Security_CertificateFramework_CertExtensionTest_Func_0500
     * @tc.desc   Use callback style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CertificateFramework_CertExtensionTest_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let extensionObj: cert.CertExtension =
            await certCallback.createX509CertExtensionNormalCallback("certExtensionNormal02")
          expect(
            extensionObj != null && extensionObj != undefined
          ).assertTrue();
          let caStatus = extensionObj.checkCA();
          console.warn("caStatus  is: " + caStatus);
          expect(caStatus > 0).assertTrue();
        } catch (err: BusinessError) {
          console.error("checkCA error, error code is: " + err.code);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   Security_CertificateFramework_CertExtensionTest_Func_0600
     * @tc.number Security_CertificateFramework_CertExtensionTest_Func_0600
     * @tc.desc   Create Der CertExtension with Promise Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(
      "Security_CertificateFramework_CertExtensionTest_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let extensionObj: cert.CertExtension =
            await certPromise.createX509CertExtensionNormalPromise("certExtensioninvalid01")
          expect(
            extensionObj != null && extensionObj != undefined
          ).assertTrue();
        } catch (err: BusinessError) {
          console.error(
            "createX509CertExtensionNormalPromise error, error code is: " +
            err.code
          );
          expect(err.code).assertEqual(401);
        }
        ;
        done();
      });

    /**
     * @tc.name   Security_CertificateFramework_CertExtensionTest_Func_1000
     * @tc.number Security_CertificateFramework_CertExtensionTest_Func_1000
     * @tc.desc   Create Der CertExtension with Promise Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CertificateFramework_CertExtensionTest_Func_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let extensionObj =
            await certPromise.createX509CertExtensionNormalPromise(
              "certExtensionNormal02"
            );
          expect(
            extensionObj != null && extensionObj != undefined
          ).assertTrue();
          let oid = new Uint8Array([50, 60, 70]);
          let oidDataBlob: cert.DataBlob = {
            data: oid,
          };
          let entryObj = extensionObj.getEntry(
            cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY,
            oidDataBlob
          );
          expect(entryObj != null && entryObj != undefined).assertTrue();
        } catch (err: BusinessError) {
          console.error("getEntry error , error code is: " + err.code);
          expect(err.code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.name   Security_CertificateFramework_CertExtensionTest_Func_1400
     * @tc.number Security_CertificateFramework_CertExtensionTest_Func_1400
     * @tc.desc   Create Der CertExtension with Promise Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CertificateFramework_CertExtensionTest_Func_1400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let extensionObj =
            await certPromise.createX509CertExtensionNormalPromise(
              "certExtensionNormal02"
            );
          expect(
            extensionObj != null && extensionObj != undefined
          ).assertTrue();
          let oid1 = new Uint8Array([0, 50, 46, 53, 46, 50, 57, 46, 49, 57]);
          console.warn("oid1 source string is: " + uInt8ArrayToString(oid1));
          let oidDataBlob1: cert.DataBlob = {
            data: oid1,
          };
          let entryObj = extensionObj.getEntry(
            cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY,
            oidDataBlob1
          );
          expect(entryObj != null && entryObj != undefined).assertTrue();
        } catch (err: BusinessError) {
          console.error("getEntry error , error code is: " + err.code);
          expect(err.code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.name   Security_CertificateFramework_CertExtensionTest_Func_1500
     * @tc.number Security_CertificateFramework_CertExtensionTest_Func_1500
     * @tc.desc   Create Der CertExtension with Promise Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CertificateFramework_CertExtensionTest_Func_1500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let extensionObj =
            await certPromise.createX509CertExtensionNormalPromise(
              "certExtensionNormal01"
            );
          expect(
            extensionObj != null && extensionObj != undefined
          ).assertTrue();
          let encodedObj = extensionObj.getEncoded();
          expect(encodedObj != null && encodedObj != undefined).assertTrue();
        } catch (err: BusinessError) {
          console.error("getEncoded error , error code is: " + err.code);
          expect(err.code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.name   Security_CertificateFramework_CertExtensionTest_Func_1600
     * @tc.number Security_CertificateFramework_CertExtensionTest_Func_1600
     * @tc.desc   Use callback style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CertificateFramework_CertExtensionTest_Func_1600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let extensionObj =
            await certCallback.createX509CertExtensionNormalCallback(
              "certExtensionNormal01"
            );
          expect(
            extensionObj != null && extensionObj != undefined
          ).assertTrue();
          let encodedObj: int = extensionObj.checkCA();
          expect(encodedObj != null && encodedObj != undefined).assertTrue();
        } catch (err: BusinessError) {
          console.error("checkCA error , error code is: " + err.code);
          expect(err.code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.name   Security_CertificateFramework_CertExtensionTest_Func_1700
     * @tc.number Security_CertificateFramework_CertExtensionTest_Func_1700
     * @tc.desc   Use callback style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CertificateFramework_CertExtensionTest_Func_1700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let extensionObj =
            await certCallback.createX509CertExtensionNormalCallback(
              "certExtensionInvalid02"
            );
          expect(
            extensionObj != null && extensionObj != undefined
          ).assertTrue();
          let encodedObj = extensionObj.checkCA();
          expect(encodedObj != null && encodedObj != undefined).assertTrue();
        } catch (err: BusinessError) {
          console.error("checkCA error , error code is: " + err.code);
          expect(err.code).assertEqual(19030001);
        }
        done();
      }
    );
  })
}
