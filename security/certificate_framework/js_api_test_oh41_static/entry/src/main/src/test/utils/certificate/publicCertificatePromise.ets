/*
 * Copyright (C) 2024-2026 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';
import { expect } from "../../../../../hypium/index";
import cert from "@ohos.security.cert";
import cryptoFramework from "@ohos.security.cryptoFramework";
import {
  chainFirstCaCert,
  chainSecondCaCert,
  selfSignedCaCertPem,
  selfSignedCaCertDer,
  testErrorCert,
  testCert,
  testCrlPem,
  testCrlWithoutExtensionPem,
  testCrlDer,
  testCrlWithoutExtensionDer,
  crlVerifyPriKeyHex,
  crlVerifyPubKeyHex,
  crlHex,
  certExtensionNormal01,
  certExtensionInvalid01,
  certExtensionNormal02,
  certExtensionInvalid02,
  testCrlWithSerialPem,
  reg,
  testCrlWith18byteSerialPem,
  testCrlEntryWithExtensionPem,
  testCrlEntryWithExtensionDer,
  certExtensionWithUnSupportedCritical,
} from "../common/commonParam";
import { convertToUint8Array, stringTouInt8Array, uInt8ArrayToString, } from "../common/commonFunction";
// import { IAnyObj } from '../common/commonType';


async function createX509CertInstancePromise(certType: string): Promise<cert.X509Cert> {
  let certformat: cert.EncodingFormat;
  let encodingData: Uint8Array;

  if (certType == "der") {
    certformat = cert.EncodingFormat.FORMAT_DER;
    encodingData = convertToUint8Array(selfSignedCaCertDer);
  } else {
    certformat = cert.EncodingFormat.FORMAT_PEM;
    encodingData = stringTouInt8Array(selfSignedCaCertPem);
  }

  let encodingBlob: cert.EncodingBlob = {
    data: encodingData,
    encodingFormat: certformat,
  };

  let data: cert.X509Cert = await cert.createX509Cert(encodingBlob);

  return data;
}

async function createX509CertInstanceforCRLTestPromise(flag: string): Promise<cert.X509Cert> {
  let certformat: cert.EncodingFormat;
  let encodingData: Uint8Array = new Uint8Array();

  if (flag == "normal") {
    certformat = cert.EncodingFormat.FORMAT_PEM;
    encodingData = stringTouInt8Array(testCert);
  } else {
    certformat = cert.EncodingFormat.FORMAT_PEM;
    encodingData = stringTouInt8Array(testErrorCert);
  }

  let encodingBlob: cert.EncodingBlob = {
    data: encodingData,
    encodingFormat: certformat,
  };

  let data: cert.X509Cert = await cert.createX509Cert(encodingBlob);

  return data;
}

async function verifyX509CertPromise(certType: string, flag: string): Promise<void> {
  try {
    let gInstance: cert.X509Cert = await createX509CertInstancePromise(certType);
    let publicKey: cryptoFramework.PubKey = gInstance.getPublicKey();
    expect(publicKey != null).assertTrue();
    console.log("[promise]  getPublickey success!");
    gInstance.verify(publicKey);
  } catch (error) {
    console.error(`verifyX509CertPromise catch error: ${JSON.stringify(error)}`);
    throw error as Error;
  }
}

async function checkValidityX509CertPromise(certType: string, date: string): Promise<void> {
  try {
    let instance: cert.X509Cert = await createX509CertInstancePromise(certType);
    instance.checkValidityWithDate(date);
  } catch (error) {
    console.error(`checkValidityX509CertPromise catch error: ${JSON.stringify(error)}`);
    throw error as Error;
  }
}

async function getX509CertInfoPromise(certType: string, processType: string): Promise<void> {
  try {
    let gInstance: cert.X509Cert = await createX509CertInstancePromise(certType);
    switch (processType) {
      case "getVersion":
        let version = gInstance.getVersion();
        console.log(processType + " is : " + version);
        expect(version != null).assertTrue();
        break;
      // case "getSerialNumber":
      //   let serialNumber = gInstance.getSerialNumber();
      //   console.log(processType + " is : " + serialNumber);
      //   expect(serialNumber != null).assertTrue();
      //   let certSerialNumber = gInstance.getCertSerialNumber();
      //   expect(certSerialNumber != null).assertTrue();
      //   break;
      case "getIssuerName":
        let issuerName = gInstance.getIssuerName();
        console.log(
          processType + " is : " + uInt8ArrayToString(issuerName.data)
        );
        expect(issuerName != null).assertTrue();
        break;
      case "getSubjectName":
        let subjectName = gInstance.getSubjectName();
        console.log(
          processType + " is : " + uInt8ArrayToString(subjectName.data)
        );
        expect(subjectName != null).assertTrue();
        break;
      case "getNotBeforeTime":
        let notBeforeTime = gInstance.getNotBeforeTime();
        console.log(processType + " is : " + notBeforeTime);
        expect(notBeforeTime != null).assertTrue();
        break;
      case "getNotAfterTime":
        let notAfterTime = gInstance.getNotAfterTime();
        console.log(processType + " is : " + notAfterTime);
        expect(notAfterTime != null).assertTrue();
        break;
      case "getSignature":
        let signature = gInstance.getSignature();
        console.log(
          processType + " is : " + uInt8ArrayToString(signature.data)
        );
        expect(signature != null).assertTrue();
        break;
      case "getSignatureAlgName":
        let signatureAlgName = gInstance.getSignatureAlgName();
        console.log(processType + " is : " + signatureAlgName);
        expect(signatureAlgName != null).assertTrue();
        break;
      case "getSignatureAlgOid":
        let signatureAlgOid = gInstance.getSignatureAlgOid();
        console.log(processType + " is : " + signatureAlgOid);
        expect(signatureAlgOid != null).assertTrue();
        break;
      case "getSignatureAlgParams":
        let signatureAlgParams = gInstance.getSignatureAlgParams();
        console.log(
          processType +
            " is : " +
          uInt8ArrayToString(signatureAlgParams.data)
        );
        expect(signatureAlgParams != null).assertTrue();
        break;
      case "getKeyUsage":
        let keyUsage = gInstance.getKeyUsage();
        console.log(
          processType + " is : " + uInt8ArrayToString(keyUsage.data)
        );
        expect(keyUsage != null).assertTrue();
        break;
      case "getExtKeyUsage":
        let extKeyUsage = gInstance.getExtKeyUsage();
        console.log(processType + " is : " + extKeyUsage.data);
        expect(extKeyUsage != null).assertTrue();
        break;
      case "getBasicConstraints":
        let basicConstraints = gInstance.getBasicConstraints();
        console.log(processType + " is : " + basicConstraints);
        expect(basicConstraints != null).assertTrue();
        break;
      case "getSubjectAltNames":
        let subjectAltNames = gInstance.getSubjectAltNames();
        console.log(processType + " is : " + subjectAltNames.data);
        expect(subjectAltNames != null).assertTrue();
        break;
      case "getIssuerAltNames":
        let issuerAltNames = gInstance.getIssuerAltNames();
        console.log(processType + " is : " + issuerAltNames.data);
        expect(issuerAltNames != null).assertTrue();
        break;
      default:
        console.log("Invalid parameter !");
        break;
    }
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function checkGetEncodedX509CertPromise(certType: string): Promise<void> {
  try {
    let gInstance: cert.X509Cert = await createX509CertInstancePromise(certType)
    let encodedBlob = gInstance.getEncoded();
    expect(encodedBlob != null).assertTrue();
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function checkGetPublicKeyX509CertPromise(certType: string): Promise<void> {
  try {
    let gInstance: cert.X509Cert = await createX509CertInstancePromise(certType);
    let publicKey: cryptoFramework.PubKey = gInstance.getPublicKey();
    console.warn("[promise] publicKey success, publicKey is:" + publicKey);
    expect(publicKey != null).assertTrue();
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function createX509CRLInstancePromise(certType: string): Promise<cert.X509CRL> {
  let certformat: cert.EncodingFormat;
  let encodingData: Uint8Array = new Uint8Array();

  if (certType == "der") {
    certformat = cert.EncodingFormat.FORMAT_DER;
    encodingData = convertToUint8Array(testCrlDer);
  } else {
    certformat = cert.EncodingFormat.FORMAT_PEM;
    encodingData = stringTouInt8Array(testCrlPem);
  }

  let encodingBlob: cert.EncodingBlob = {
    data: encodingData,
    encodingFormat: certformat,
  };

  let data: cert.X509CRL = await cert.createX509CRL(encodingBlob);

  return data;
}

async function checkIsRevokedX509CRLPromise(crlInstance: cert.X509CRL, flag: string): Promise<boolean> {
  try {
    let certInstance: cert.X509Cert = await createX509CertInstanceforCRLTestPromise(flag);
    let status: boolean = crlInstance.isRevoked(certInstance);

    return status;
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    return false;
  }
}

async function checkGetEncodedX509CRLPromise(certType: string): Promise<void> {
  try {
    let gInstance: cert.X509CRL = await createX509CRLInstancePromise(certType);
    let encodedBlob = gInstance.getEncoded();
    expect(encodedBlob != null).assertTrue();
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function verifyX509CRLPromise(crlType: string, flag?: string | cryptoFramework.PubKey): Promise<void> {
  try {
    let certFormat: cert.EncodingFormat;
    let priKeyEncodingData: Uint8Array = new Uint8Array();
    let pubKeyEncodingData: Uint8Array = new Uint8Array();
    let crlEncodingData: Uint8Array = new Uint8Array();
    let globalCrlInstance: cert.X509CRL;
    if (crlType == "pem" || crlType == "der") {
      certFormat = cert.EncodingFormat.FORMAT_DER;
      priKeyEncodingData = convertToUint8Array(crlVerifyPriKeyHex);
      pubKeyEncodingData = convertToUint8Array(crlVerifyPubKeyHex);
      crlEncodingData = convertToUint8Array(crlHex);
    }
    else {
      //解决编译报错
      certFormat = cert.EncodingFormat.FORMAT_PKCS7;
    }
    let priEncodingBlob: cryptoFramework.DataBlob = {
      data: priKeyEncodingData,
    };
    let pubEncodingBlob: cryptoFramework.DataBlob = {
      data: pubKeyEncodingData,
    };
    let crlEncodingBlob: cert.EncodingBlob = {
      data: crlEncodingData,
      encodingFormat: certFormat,
    };

    let asyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_3");
    expect(asyKeyGenerator != null);
    console.log("############################ 0");
    globalCrlInstance = await cert.createX509CRL(crlEncodingBlob)
    console.log("############################ 1");
    expect(globalCrlInstance != null).assertTrue();
    console.log("############################ 1-1");
    let convertKeyPair: cryptoFramework.KeyPair = await asyKeyGenerator.convertKey(pubEncodingBlob, priEncodingBlob);
    console.log("############################ 2");
    expect(convertKeyPair != null).assertTrue();
    let pubKey: cryptoFramework.PubKey = convertKeyPair.pubKey;
    globalCrlInstance.verify(pubKey);
    console.log("############################ 3");
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function getX509CRLInfoPromise(certType: string, processType: string): Promise<void> {
  try{
    let gInstance: cert.X509CRL = await createX509CRLInstancePromise(certType)
    switch (processType) {
      case "getType":
        let type = gInstance.getType();
        console.log(processType + " is : " + type);
        expect(type != null).assertTrue();
        break;
      case "getVersion":
        let version = gInstance.getVersion();
        console.log(processType + " is : " + version);
        expect(version != null).assertTrue();
        break;
      case "getIssuerName":
        let issuerName = gInstance.getIssuerName();
        console.log(
          processType + " is : " + uInt8ArrayToString(issuerName.data)
        );
        expect(issuerName != null).assertTrue();
        break;
      case "getLastUpdate":
        let lastUpdate = gInstance.getLastUpdate();
        console.log(processType + " is : " + lastUpdate);
        expect(lastUpdate != null).assertTrue();
        break;
      case "getNextUpdate":
        let nextUpdate = gInstance.getNextUpdate();
        console.log(processType + " is : " + nextUpdate);
        expect(nextUpdate != null).assertTrue();
        break;
      case "getSignature":
        let signature = gInstance.getSignature();
        console.log(
          processType + " is : " + uInt8ArrayToString(signature.data)
        );
        expect(signature != null).assertTrue();
        break;
      case "getSignatureAlgName":
        let signatureAlgName = gInstance.getSignatureAlgName();
        console.log(processType + " is : " + signatureAlgName);
        expect(signatureAlgName != null).assertTrue();
        break;
      case "getSignatureAlgOid":
        let signatureAlgOid = gInstance.getSignatureAlgOid();
        console.log(processType + " is : " + signatureAlgOid);
        expect(signatureAlgOid != null).assertTrue();
        break;
      case "getSignatureAlgParams":
        let signatureAlgParams = gInstance.getSignatureAlgParams();
        console.log(
          processType +
            " is : " +
          uInt8ArrayToString(signatureAlgParams.data)
        );
        expect(signatureAlgParams != null).assertTrue();
        break;
      case "getTbsInfo":
        let tbsInfo = gInstance.getTBSInfo();
        console.log(
          processType + " is : " + uInt8ArrayToString(tbsInfo.data)
        );
        expect(tbsInfo != null).assertTrue();
        break;
      default:
        console.log("Invalid parameter !");
        break;
    }
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function checkGetRevokedCertWithCertX509CRLPromise(crlInstance: cert.X509CRL, flag: string): Promise<cert.X509CRLEntry> {
  try {
    let certInstance: cert.X509Cert = await createX509CertInstanceforCRLTestPromise(flag)
    let crlEntry = crlInstance.getRevokedCertWithCert(certInstance);
    console.warn("[promise] getRevokedCertWithCert is:" + crlEntry);
    let num: bigint = crlEntry.getSerialNumber();
    console.warn("[promise] getRevokedCertWithCert num is:" + num);

    return crlEntry;
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function checkGetRevokedCertsX509CRLPromise(certType: string): Promise<void> {
  try {
    let gIndex: int;
    let revocation: string;
    let instance: cert.X509CRL = await createX509CRLInstancePromise(certType);
    let certs: cert.X509CRLEntry[] = await instance.getRevokedCerts();
    expect(certs != null && certs.length != 0).assertTrue();
    console.warn("[Promise] CRL get gevoked certs success");
    for (let i = 0; i < certs.length; i++) {
      gIndex = i;
      console.log(
        "[Promise] certs i: " +
          gIndex +
          " serialNumber is: " +
        certs[gIndex].getSerialNumber()
      );
      revocation = certs[gIndex].getRevocationDate();
      expect(revocation != null).assertTrue();
      console.log(
        "[Promise] certs i: " +
          gIndex +
          " revocation date is: " +
          revocation
      );
      let eData: cert.EncodingBlob = await certs[gIndex].getEncoded();
      expect(eData != null).assertTrue();
    }
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function checkGetRevokedCertX509CRLPromise(certType: string): Promise<void> {
  try {
    let certIssuer: cert.DataBlob;
    let revocation: string;
    let instance: cert.X509CRL = await createX509CRLInstancePromise(certType);
    let cert1 = instance.getRevokedCert(BigInt('1'));
    expect(cert1 != null).assertTrue();
    console.warn("[Promise] CRL get gevoked certs success");
    revocation = cert1.getRevocationDate();
    expect(revocation != null).assertTrue();
    console.log("[Promise] cert revocation date is: " + revocation);
    certIssuer = cert1.getCertIssuer();
    expect(certIssuer != null).assertTrue();
    console.log(
      "[Promise] cert certIssuer is: " + uInt8ArrayToString(certIssuer.data)
    );
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function checkValidateOfCertChainValidatorPromise(algName: string, flag: string): Promise<void> {
  try {
    let validator: cert.CertChainValidator = cert.createCertChainValidator(algName);
    let algorithm = validator.algorithm;
    console.log(
      "createCertChainValidator success! algorithm is: " + algorithm
    );
    let certArray1 = stringTouInt8Array(chainFirstCaCert);
    let byteLength1 = certArray1.byteLength;
    let uInt16CertLength1 = new Uint16Array([byteLength1]);
    let uInt8CertLength1: Uint8Array;
    if (flag == "error") {
      // 解决编译问题
      // uInt8CertLength1 = new Uint8Array([uInt16CertLength1.buffer]);
      const temp: number[] = [123];
      uInt8CertLength1 = new Uint8Array(temp);
    } else {
      uInt8CertLength1 = new Uint8Array(uInt16CertLength1.buffer);
    }
    let certArray2 = stringTouInt8Array(chainSecondCaCert);
    let byteLength2 = certArray2.byteLength;
    let uInt16CertLength2 = new Uint16Array([byteLength2]);
    let uInt8CertLength2 = new Uint8Array(uInt16CertLength2.buffer);

    let dataArray = new Uint8Array(
      uInt8CertLength2.length +
      certArray2.length +
      uInt8CertLength1.length +
      certArray1.length
    );
    for (let i = 0; i < uInt8CertLength2.length; i++) {
      dataArray[i] = uInt8CertLength2[i];
    }
    for (let i = 0; i < certArray2.length; i++) {
      dataArray[i + uInt8CertLength2.length] = certArray2[i];
    }
    for (let i = 0; i < uInt8CertLength1.length; i++) {
      dataArray[i + uInt8CertLength2.length + certArray2.length] =
        uInt8CertLength1[i];
    }
    for (let i = 0; i < certArray1.length; i++) {
      dataArray[
      i +
      uInt8CertLength2.length +
      certArray2.length +
      uInt8CertLength1.length
      ] = certArray1[i];
    }
    let certChainData: cert.CertChainData = {
      data: dataArray,
      count: 2,
      encodingFormat: cert.EncodingFormat.FORMAT_PEM,
    };
    console.log("certChainData.data is: " + certChainData.data);
    validator.validate(certChainData)
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function createX509CRLExtensionsInstancePromise(certType: string, hasExtension: boolean): Promise<cert.X509CRL> {
  try {
    let certformat: cert.EncodingFormat;
    let encodingData: Uint8Array;

    if (certType == "der") {
      certformat = cert.EncodingFormat.FORMAT_DER;
      if (!hasExtension) {
        encodingData = convertToUint8Array(testCrlWithoutExtensionDer);
      } else {
        encodingData = convertToUint8Array(testCrlDer);
      }
    } else {
      certformat = cert.EncodingFormat.FORMAT_PEM;
      if (!hasExtension) {
        encodingData = stringTouInt8Array(testCrlWithoutExtensionPem);
      } else {
        encodingData = stringTouInt8Array(testCrlPem);
      }
    }

    let encodingBlob: cert.EncodingBlob = {
      data: encodingData,
      encodingFormat: certformat,
    };

    let crl: cert.X509CRL = await cert.createX509CRL(encodingBlob);

    return crl;
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function checkGetX509CRLExtensionsPromise(certType: string, hasExtension: boolean): Promise<cert.DataBlob> {
  try {
    let instance:cert.X509CRL = await createX509CRLExtensionsInstancePromise(certType, hasExtension);
    let extension: cert.DataBlob = instance.getExtensions();

    return extension;
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function checkGetX509CRLExtensionsStabilityPromise(certType: string, hasExtension: boolean): Promise<cert.DataBlob> {
  try {
    let instance: cert.X509CRL = await createX509CRLExtensionsInstancePromise(certType, hasExtension);
    for (let i = 0; i < 1000; i++) {
      let extension = instance.getExtensions();
    }
    let extension = instance.getExtensions();

    return extension;
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function createX509CRLEntryExtensionsInstancePromise(certType: string, hasExtension: boolean): Promise<cert.X509CRL> {
  try {
    let certformat: cert.EncodingFormat;
    let encodingData: Uint8Array = new Uint8Array();

    if (certType == "der") {
      certformat = cert.EncodingFormat.FORMAT_DER;
      if (hasExtension) {
        encodingData = convertToUint8Array(testCrlEntryWithExtensionDer);
      } else {
        encodingData = convertToUint8Array(testCrlDer);
      }
    } else {
      certformat = cert.EncodingFormat.FORMAT_PEM;
      if (hasExtension) {
        encodingData = stringTouInt8Array(testCrlEntryWithExtensionPem);
      } else {
        encodingData = stringTouInt8Array(testCrlPem);
      }
    }

    let encodingBlob: cert.EncodingBlob = {
      data: encodingData,
      encodingFormat: certformat,
    };

    let data: cert.X509CRL = await cert.createX509CRL(encodingBlob)

    return data;
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function checkGetX509CRLEntryExtensionsPromise(certType: string, hasExtension: boolean): Promise<cert.DataBlob> {
  try {
    let x509Crl: cert.X509CRL = await createX509CRLEntryExtensionsInstancePromise(certType, hasExtension);
    const crlEntries = await x509Crl.getRevokedCerts();
    if (crlEntries) {
      let cert1: cert.X509CRLEntry = crlEntries[0];
      const list = cert1.getExtensions();

      return list;
    } else {
      return {data: new Uint8Array()} as cert.DataBlob
    }
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function checkGetX509CRLEntryExtensionsStabilityPromise(certType: string, hasExtension: boolean): Promise<cert.DataBlob> {
  try {
    let x509Crl: cert.X509CRL = await createX509CRLEntryExtensionsInstancePromise(certType, hasExtension);
    const crlEntries = await x509Crl.getRevokedCerts();
    if (crlEntries) {
      let cert1: cert.X509CRLEntry = crlEntries[0];
      for (let i = 0; i < 1000; i++) {
        const list = cert1.getExtensions();
      }
      const list = cert1.getExtensions();

      return list;
    } else {
      return {data: new Uint8Array()} as cert.DataBlob;
    }
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function checkHasX509CRLEntryExtensionsPromise(extensions: string, hasExtension: boolean): Promise<boolean> {
  try {
    let x509Crl: cert.X509CRL = await createX509CRLEntryExtensionsInstancePromise(extensions, hasExtension)
    const crlEntries = await x509Crl.getRevokedCerts();
    if (crlEntries) {
      let cert1: cert.X509CRLEntry = crlEntries[0];
      const hasExtensions = cert1.hasExtensions();

      return hasExtensions;
    } else {
      return false;
    }
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function createX509CertExtensionNormalPromise(flag: string): Promise<cert.CertExtension> {
  try {
    let encodingData: Uint8Array = new Uint8Array();
    let certFormat = cert.EncodingFormat.FORMAT_DER;

    switch (flag) {
      case "certExtensionNormal01":
        encodingData = new Uint8Array(certExtensionNormal01);
        break;
      case "certExtensionNormal02":
        encodingData = new Uint8Array(certExtensionNormal02);
        break;
      case "certExtensionInvalid01":
        encodingData = new Uint8Array(certExtensionInvalid01);
        break;
      case "certExtensionInvalid02":
        encodingData = new Uint8Array(certExtensionInvalid02);
        break;
      case "certHasCritical":
        encodingData = new Uint8Array(certExtensionWithUnSupportedCritical);
        break;
      case "certNoCritical":
        encodingData = new Uint8Array(certExtensionInvalid02);
        break;
      default:
        break;
    }

    let encodingBlob: cert.EncodingBlob = {
      data: encodingData,
      encodingFormat: certFormat,
    };

    let extensionObj: cert.CertExtension = await cert.createCertExtension(encodingBlob);

    return extensionObj;
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function checkHasUnsupportedX509CrlPromise(flag: string): Promise<boolean> {
  try{
    let certExt: cert.CertExtension = await createX509CertExtensionNormalPromise(flag)
    let hasUnsupported: boolean = certExt.hasUnsupportedCriticalExtension();

    return hasUnsupported;
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function createX509CRLInstanceWithSerialNumberPromise(): Promise<cert.X509CRL> {
  try {
    let certformat: cert.EncodingFormat;
    let encodingData: Uint8Array;

    certformat = cert.EncodingFormat.FORMAT_PEM;
    encodingData = stringTouInt8Array(testCrlWith18byteSerialPem);


    let encodingBlob: cert.EncodingBlob = {
      data: encodingData,
      encodingFormat: certformat,
    };

    let data:cert.X509CRL = await cert.createX509CRL(encodingBlob);

    return data;
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function checkX509CRLEntryGetSerialNumberPromise(certType: string): Promise<void> {
  try {
    let instance: cert.X509CRL = await createX509CRLInstanceWithSerialNumberPromise()
    let certs: cert.X509CRLEntry[] = await instance.getRevokedCerts();
    expect(certs != null && certs.length != 0).assertTrue();
    console.warn("[Promise] CRL get revoked certs success");
    const serialNumber: bigint = certs[0].getSerialNumber();
    expect(serialNumber !== null).assertTrue();
    expect(serialNumber === BigInt("22214312158469178443624022151750054219611905")).assertTrue();
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function checkX509CRLGetRevokedCertPromise(): Promise<void> {
  try {
    let instance: cert.X509CRL = await createX509CRLInstanceWithSerialNumberPromise()
    const crlEntry = instance.getRevokedCert(BigInt("22214312158469178443624022151750054219611905"));
    expect(crlEntry !== null).assertTrue();
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}


export {
  createX509CertInstancePromise,
  verifyX509CertPromise,
  checkValidityX509CertPromise,
  checkGetEncodedX509CertPromise,
  checkGetPublicKeyX509CertPromise,
  getX509CertInfoPromise,
  createX509CRLInstancePromise,
  checkIsRevokedX509CRLPromise,
  checkGetEncodedX509CRLPromise,
  verifyX509CRLPromise,
  getX509CRLInfoPromise,
  checkGetRevokedCertWithCertX509CRLPromise,
  checkGetRevokedCertsX509CRLPromise,
  checkGetRevokedCertX509CRLPromise,
  checkValidateOfCertChainValidatorPromise,
  checkGetX509CRLExtensionsPromise,
  checkHasX509CRLEntryExtensionsPromise,
  createX509CertExtensionNormalPromise,
  checkHasUnsupportedX509CrlPromise,
  checkGetX509CRLEntryExtensionsPromise,
  checkX509CRLEntryGetSerialNumberPromise,
  checkX509CRLGetRevokedCertPromise,
  checkGetX509CRLExtensionsStabilityPromise,
  checkGetX509CRLEntryExtensionsStabilityPromise
};
