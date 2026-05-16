/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, it, TestType, Size, Level, expect } from "@ohos/hypium";
import cert from '@ohos.security.cert';
import { stringToUint8Array } from "./utils/certificate/certPem";
import {
  CERT_INCLUDES_OPENSSL_CRITICAL_FALSE_2_EXTENSION,
  CERT_INCLUDES_OPENSSL_CRITICAL_FALSE_2_EXTENSIONS,
  CERT_INCLUDES_OPENSSL_CRITICAL_FALSE_EXTENSION,
  CERT_INCLUDES_OPENSSL_CRITICAL_TRUE_EXTENSION,
  CERT_INCLUDES_SELF_CRITICAL_EXTENSIONS,
  CERT_INCLUDES_SELF_EXTENSIONS,
  CERT_INCLUDES_SELF_TYPES_EXTENSIONS} from "./utils/extension/extension";
import { compareUint8Array } from "./utils/common/commonFunction";


export default function certExtensionFuncTestUnit() {
  describe("certExtensionFuncTestUnit", () => {

    /**
     * @tc.name SUB_Security_Cert_Framework_CertExtension_Func_0100
     * @tc.number SUB_Security_Cert_Framework_CertExtension_Func_0100
     * @tc.desc Use Promise Type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertExtension_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let expect_number = 0;
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(CERT_INCLUDES_OPENSSL_CRITICAL_TRUE_EXTENSION.cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await  cert.createX509Cert(encodingBlob);
        let extensionObj: cert.CertExtension = x509Cert.getExtensionsObject();
        let oids: cert.DataArray = extensionObj.getOidList(cert.ExtensionOidType.EXTENSION_OID_TYPE_ALL);
        for (let index = 0; index < oids.data.length; index++) {
          let oid: cert.DataBlob = {data: oids.data[index]};
          let entry: cert.DataBlob = extensionObj.getEntry(cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY, oid);
          let ret: boolean = compareUint8Array(entry.data, CERT_INCLUDES_OPENSSL_CRITICAL_TRUE_EXTENSION.extensions[index].entry);
          expect(ret).assertTrue();
          expect_number++;
          let critical: cert.DataBlob = extensionObj.getEntry(cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY_CRITICAL, oid);
          ret = compareUint8Array(critical.data, CERT_INCLUDES_OPENSSL_CRITICAL_TRUE_EXTENSION.extensions[index].critical);
          expect(ret).assertTrue();
          expect_number++;
          let value: cert.DataBlob = extensionObj.getEntry(cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY_VALUE, oid);
          ret = compareUint8Array(value.data, CERT_INCLUDES_OPENSSL_CRITICAL_TRUE_EXTENSION.extensions[index].value);
          expect(ret).assertTrue();
        }
      } catch (error) {
        console.error(`[XTS]:expect_number:${expect_number} catch error: ${JSON.stringify(error)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name SUB_Security_Cert_Framework_CertExtension_Func_0200
     * @tc.number SUB_Security_Cert_Framework_CertExtension_Func_0200
     * @tc.desc Use Promise Type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertExtension_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let expect_number = 0;
        try {
          let encodingBlob: cert.EncodingBlob = {
            data: stringToUint8Array(CERT_INCLUDES_OPENSSL_CRITICAL_FALSE_EXTENSION.cert),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509Cert: cert.X509Cert = await  cert.createX509Cert(encodingBlob);
          let extensionObj: cert.CertExtension = x509Cert.getExtensionsObject();
          let oids: cert.DataArray = extensionObj.getOidList(cert.ExtensionOidType.EXTENSION_OID_TYPE_ALL);
          for (let index = 0; index < oids.data.length; index++) {
            let oid: cert.DataBlob = {data: oids.data[index]};
            let entry: cert.DataBlob = extensionObj.getEntry(cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY, oid);
            let ret: boolean = compareUint8Array(entry.data, CERT_INCLUDES_OPENSSL_CRITICAL_FALSE_EXTENSION.extensions[index].entry);
            expect(ret).assertTrue();
            expect_number++;
            let critical: cert.DataBlob = extensionObj.getEntry(cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY_CRITICAL, oid);
            ret = compareUint8Array(critical.data, CERT_INCLUDES_OPENSSL_CRITICAL_FALSE_EXTENSION.extensions[index].critical);
            expect(ret).assertTrue();
            expect_number++;
            let value: cert.DataBlob = extensionObj.getEntry(cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY_VALUE, oid);
            ret = compareUint8Array(value.data, CERT_INCLUDES_OPENSSL_CRITICAL_FALSE_EXTENSION.extensions[index].value);
            expect(ret).assertTrue();
          }
        } catch (error) {
          console.error(`[XTS]:expect_number:${expect_number} catch error: ${JSON.stringify(error)}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_Cert_Framework_CertExtension_Func_0300
     * @tc.number SUB_Security_Cert_Framework_CertExtension_Func_0300
     * @tc.desc Use Promise Type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertExtension_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let expect_number = 0;
        let oid_number = 0;
        try {
          let encodingBlob: cert.EncodingBlob = {
            data: stringToUint8Array(CERT_INCLUDES_OPENSSL_CRITICAL_FALSE_2_EXTENSION.cert),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509Cert: cert.X509Cert = await  cert.createX509Cert(encodingBlob);
          let extensionObj: cert.CertExtension = x509Cert.getExtensionsObject();
          let oids: cert.DataArray = extensionObj.getOidList(cert.ExtensionOidType.EXTENSION_OID_TYPE_ALL);
          for (let index = 0; index < oids.data.length; index++) {
            let oid: cert.DataBlob = {data: oids.data[index]};
            let entry: cert.DataBlob = extensionObj.getEntry(cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY, oid);
            let ret: boolean = compareUint8Array(entry.data, CERT_INCLUDES_OPENSSL_CRITICAL_FALSE_2_EXTENSION.extensions[index].entry);
            expect(ret).assertTrue();
            expect_number++;
            let critical: cert.DataBlob = extensionObj.getEntry(cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY_CRITICAL, oid);
            ret = compareUint8Array(critical.data, CERT_INCLUDES_OPENSSL_CRITICAL_FALSE_2_EXTENSION.extensions[index].critical);
            expect(ret).assertTrue();
            expect_number++;
            let value: cert.DataBlob = extensionObj.getEntry(cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY_VALUE, oid);
            ret = compareUint8Array(value.data, CERT_INCLUDES_OPENSSL_CRITICAL_FALSE_2_EXTENSION.extensions[index].value);
            expect(ret).assertTrue();
            oid_number++;
            expect_number = 0;
          }
        } catch (error) {
          console.error(`[XTS]:oid_number:${oid_number}:expect_number:${expect_number} catch error: ${JSON.stringify(error)}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_Cert_Framework_CertExtension_Func_0400
     * @tc.number SUB_Security_Cert_Framework_CertExtension_Func_0400
     * @tc.desc Use Promise Type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertExtension_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let expect_number = 0;
        let oid_number = 0;
        try {
          let encodingBlob: cert.EncodingBlob = {
            data: CERT_INCLUDES_OPENSSL_CRITICAL_FALSE_2_EXTENSIONS,
            encodingFormat: cert.EncodingFormat.FORMAT_DER
          };
          let extensionObj: cert.CertExtension = await cert.createCertExtension(encodingBlob);
          let oids: cert.DataArray = extensionObj.getOidList(cert.ExtensionOidType.EXTENSION_OID_TYPE_ALL);
          for (let index = 0; index < oids.data.length; index++) {
            let oid: cert.DataBlob = {data: oids.data[index]};
            let entry: cert.DataBlob = extensionObj.getEntry(cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY, oid);
            let ret: boolean = compareUint8Array(entry.data, CERT_INCLUDES_OPENSSL_CRITICAL_FALSE_2_EXTENSION.extensions[index].entry);
            expect(ret).assertTrue();
            expect_number++;
            let critical: cert.DataBlob = extensionObj.getEntry(cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY_CRITICAL, oid);
            ret = compareUint8Array(critical.data, CERT_INCLUDES_OPENSSL_CRITICAL_FALSE_2_EXTENSION.extensions[index].critical);
            expect(ret).assertTrue();
            expect_number++;
            let value: cert.DataBlob = extensionObj.getEntry(cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY_VALUE, oid);
            ret = compareUint8Array(value.data, CERT_INCLUDES_OPENSSL_CRITICAL_FALSE_2_EXTENSION.extensions[index].value);
            expect(ret).assertTrue();
            oid_number++;
            expect_number = 0;
          }
        } catch (error) {
          console.error(`[XTS]:oid_number:${oid_number}:expect_number:${expect_number} catch error: ${JSON.stringify(error)}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_Cert_Framework_CertExtension_Func_0500
     * @tc.number SUB_Security_Cert_Framework_CertExtension_Func_0500
     * @tc.desc Use Promise Type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertExtension_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let encodingBlob: cert.EncodingBlob = {
            data: CERT_INCLUDES_SELF_CRITICAL_EXTENSIONS.exts,
            encodingFormat: cert.EncodingFormat.FORMAT_DER
          };
          let extensionObj: cert.CertExtension = await cert.createCertExtension(encodingBlob);
          let oids: cert.DataArray = extensionObj.getOidList(cert.ExtensionOidType.EXTENSION_OID_TYPE_ALL);
          for (let index = 0; index < oids.data.length; index++) {
            let oid: cert.DataBlob = {data: oids.data[index]};
            let entry: cert.DataBlob = extensionObj.getEntry(cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY, oid);
            let ret: boolean = compareUint8Array(entry.data, CERT_INCLUDES_SELF_CRITICAL_EXTENSIONS.extensions[index].entry);
            expect(ret).assertTrue();
            let critical: cert.DataBlob = extensionObj.getEntry(cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY_CRITICAL, oid);
            ret = compareUint8Array(critical.data, CERT_INCLUDES_SELF_CRITICAL_EXTENSIONS.extensions[index].critical);
            expect(ret).assertTrue();
            let value: cert.DataBlob = extensionObj.getEntry(cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY_VALUE, oid);
            ret = compareUint8Array(value.data, CERT_INCLUDES_SELF_CRITICAL_EXTENSIONS.extensions[index].value);
            expect(ret).assertTrue();
          }
        } catch (error) {
          console.error(`[XTS]: catch error: ${JSON.stringify(error)}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_Cert_Framework_CertExtension_Func_0600
     * @tc.number SUB_Security_Cert_Framework_CertExtension_Func_0600
     * @tc.desc Use Promise Type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertExtension_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let encodingBlob: cert.EncodingBlob = {
            data: stringToUint8Array(CERT_INCLUDES_SELF_CRITICAL_EXTENSIONS.cert),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509Cert: cert.X509Cert = await  cert.createX509Cert(encodingBlob);
          let extensionObj: cert.CertExtension = x509Cert.getExtensionsObject();
          let oids: cert.DataArray = extensionObj.getOidList(cert.ExtensionOidType.EXTENSION_OID_TYPE_ALL);
          let oid: cert.DataBlob = {data: oids.data[1]};
          let entry: cert.DataBlob = extensionObj.getEntry(cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY, oid);
          let ret: boolean = compareUint8Array(entry.data, CERT_INCLUDES_SELF_CRITICAL_EXTENSIONS.extensions[0].entry);
          expect(ret).assertTrue();
          let critical: cert.DataBlob = extensionObj.getEntry(cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY_CRITICAL, oid);
          ret = compareUint8Array(critical.data, CERT_INCLUDES_SELF_CRITICAL_EXTENSIONS.extensions[0].critical);
          expect(ret).assertTrue();
          let value: cert.DataBlob = extensionObj.getEntry(cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY_VALUE, oid);
          ret = compareUint8Array(value.data, CERT_INCLUDES_SELF_CRITICAL_EXTENSIONS.extensions[0].value);
          expect(ret).assertTrue();
        } catch (error) {
          console.error(`[XTS]: catch error: ${JSON.stringify(error)}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_Cert_Framework_CertExtension_Func_0700
     * @tc.number SUB_Security_Cert_Framework_CertExtension_Func_0700
     * @tc.desc Use Promise Type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertExtension_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let encodingBlob: cert.EncodingBlob = {
            data: CERT_INCLUDES_SELF_EXTENSIONS.exts,
            encodingFormat: cert.EncodingFormat.FORMAT_DER
          };
          let extensionObj: cert.CertExtension = await cert.createCertExtension(encodingBlob);
          let oids: cert.DataArray = extensionObj.getOidList(cert.ExtensionOidType.EXTENSION_OID_TYPE_ALL);
          for (let index = 0; index < oids.data.length; index++) {
            let oid: cert.DataBlob = {data: oids.data[index]};
            let entry: cert.DataBlob = extensionObj.getEntry(cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY, oid);
            let ret: boolean = compareUint8Array(entry.data, CERT_INCLUDES_SELF_EXTENSIONS.extensions[index].entry);
            expect(ret).assertTrue();
            let critical: cert.DataBlob = extensionObj.getEntry(cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY_CRITICAL, oid);
            ret = compareUint8Array(critical.data, CERT_INCLUDES_SELF_EXTENSIONS.extensions[index].critical);
            expect(ret).assertTrue();
            let value: cert.DataBlob = extensionObj.getEntry(cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY_VALUE, oid);
            ret = compareUint8Array(value.data, CERT_INCLUDES_SELF_EXTENSIONS.extensions[index].value);
            expect(ret).assertTrue();
          }
        } catch (error) {
          console.error(`[XTS]: catch error: ${JSON.stringify(error)}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name SUB_Security_Cert_Framework_CertExtension_Func_0800
     * @tc.number SUB_Security_Cert_Framework_CertExtension_Func_0800
     * @tc.desc Use Promise Type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertExtension_Func_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let encodingBlob: cert.EncodingBlob = {
            data: CERT_INCLUDES_SELF_TYPES_EXTENSIONS.exts,
            encodingFormat: cert.EncodingFormat.FORMAT_DER
          };
          let extensionObj: cert.CertExtension = await cert.createCertExtension(encodingBlob);
          let oids: cert.DataArray = extensionObj.getOidList(cert.ExtensionOidType.EXTENSION_OID_TYPE_ALL);
          for (let index = 0; index < oids.data.length; index++) {
            let oid: cert.DataBlob = {data: oids.data[index]};
            let entry: cert.DataBlob = extensionObj.getEntry(cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY, oid);
            let ret: boolean = compareUint8Array(entry.data, CERT_INCLUDES_SELF_TYPES_EXTENSIONS.extensions[index].entry);
            expect(ret).assertTrue();
            let critical: cert.DataBlob = extensionObj.getEntry(cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY_CRITICAL, oid);
            ret = compareUint8Array(critical.data, CERT_INCLUDES_SELF_TYPES_EXTENSIONS.extensions[index].critical);
            expect(ret).assertTrue();
            let value: cert.DataBlob = extensionObj.getEntry(cert.ExtensionEntryType.EXTENSION_ENTRY_TYPE_ENTRY_VALUE, oid);
            ret = compareUint8Array(value.data, CERT_INCLUDES_SELF_TYPES_EXTENSIONS.extensions[index].value);
            expect(ret).assertTrue();
          }
        } catch (error) {
          console.error(`[XTS]: catch error: ${JSON.stringify(error)}`);
          expect(null).assertFail();
        }
        done();
      });

  })
}