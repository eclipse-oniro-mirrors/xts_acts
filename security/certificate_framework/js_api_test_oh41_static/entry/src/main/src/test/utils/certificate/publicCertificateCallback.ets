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
import cryptoFramework from "@ohos.security.cryptoFramework";
import cert from "@ohos.security.cert";
import { convertToUint8Array, stringTouInt8Array, uInt8ArrayToString, } from "../common/commonFunction";
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
  certExtensionNormal02,
  certExtensionInvalid01,
  certExtensionInvalid02,
  testCrlWithSerialPem,
  reg,
  testCrlWith18byteSerialPem,
  testCrlEntryWithExtensionPem,
  testCrlEntryWithExtensionDer,
  certExtensionWithUnSupportedCritical,
} from "../common/commonParam";
// import { IAnyObj } from '../common/commonType';

async function createX509CertInstanceCallback(certType: string): Promise<cert.X509Cert> {
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

  return new Promise<cert.X509Cert>((resolve, reject) => {
    cert.createX509Cert(encodingBlob, (err: BusinessError<void>|null, data: cert.X509Cert|undefined) => {
      if (err || data === undefined) { // success: error is null, failed: data is undefined
        console.error(
          "[callback] create X509 Cert failed! err code: " + err?.code
        );
        reject(err as Error);
      } else {
        console.warn(
          "[callback] create X509 Cert success! format is: " + certformat
        );
        resolve(data as cert.X509Cert);
      }
    });
  });
}

async function createX509CertInstanceforCRLTestCallback(flag: string | cert.X509Cert): Promise<cert.X509Cert> {
  let certformat: cert.EncodingFormat;
  let encodingData: Uint8Array = new Uint8Array();
  let invalidParams = false;

  if (flag == "normal") {
    certformat = cert.EncodingFormat.FORMAT_PEM;
    encodingData = stringTouInt8Array(testCert);
  } else if (flag == "error") {
    certformat = cert.EncodingFormat.FORMAT_PEM;
    encodingData = stringTouInt8Array(testErrorCert);
  } else {
    //解决编译报错
    certformat = cert.EncodingFormat.FORMAT_PEM;
    invalidParams = true;
  }
  let encodingBlob: cert.EncodingBlob = {
    data: encodingData,
    encodingFormat: certformat,
  };

  return new Promise<cert.X509Cert>((resolve, reject) => {
    cert.createX509Cert(encodingBlob, (err: BusinessError<void>|null, data: cert.X509Cert|undefined) => {
      if (err || data === undefined) { // success: error is null, failed: data is undefined
        console.error(
          "[callback] create X509 Cert failed! err code: " + err?.code
        );
        reject(err as Error);
      } else {
        console.warn(
          "[callback] create X509 Cert success! format is: " + certformat
        );
        if (invalidParams == true) {
          const result = flag as cert.X509Cert;
          resolve(result);
        } else {
          resolve(data as cert.X509Cert);
        }
      }
    });
  });
}

async function verifyX509Cert(certInstance: cert.X509Cert, pubKey: cryptoFramework.PubKey): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    certInstance.verify(pubKey, (err: BusinessError<void>|null) => {
      if (err) { // success: error is null, failed: data is undefined
        console.error("[Callback]verify failed. error is " + err);
        reject(err as Error);
      } else {
        console.log("[Callback]verify success!");
        resolve("verify success");
      }
    });
  });
}

async function verifyX509CertCallback(certType: string, flag: string): Promise<string> {
  try {
    let gInstance: cert.X509Cert = await createX509CertInstanceCallback(certType);
    let pubKey: cryptoFramework.PubKey = gInstance.getPublicKey();
    let res: string = await verifyX509Cert(gInstance, pubKey);

    return res;
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function checkValidityX509CertCallback(certType: string, date: string): Promise<void> {
  try {
    let instance: cert.X509Cert = await createX509CertInstanceCallback(certType);
    instance.checkValidityWithDate(date);
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function getX509CertInfoCallback(certType: string, processType: string): Promise<void> {
  try {
    let gInstance: cert.X509Cert = await createX509CertInstanceCallback(certType);
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
    }
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function checkGetEncodedX509CertCallback(certType: string): Promise<string> {
  let gInstance: cert.X509Cert = await createX509CertInstanceCallback(certType);
  return new Promise<string>((resolve, reject) => {
    gInstance.getEncoded((err: BusinessError<void>|null, EncodingBlob: cert.EncodingBlob|undefined) => {
      if (err || EncodingBlob === undefined) { // success: error is null, failed: data is undefined
        console.error(
          "[callback] getEncoded failed, err code is:" + err?.code
        );
        reject(err as Error);
      } else {
        console.warn(
          "[callback] getEncoded success, EncodingBlob is:" + EncodingBlob
        );
        expect(EncodingBlob !== undefined).assertTrue();
        resolve("get encoded success");
      }
    });
  })
}

async function checkGetPublicKeyX509CertCallback(certType: string): Promise<void> {
  try {
    let gInstance: cert.X509Cert = await createX509CertInstanceCallback(certType);
    let publicKey: cryptoFramework.PubKey = gInstance.getPublicKey();
    console.warn("[callback] publicKey success, publicKey is:" + publicKey);
    expect(publicKey != null).assertTrue();
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function createX509CRLInstanceCallback(certType: string): Promise<cert.X509CRL> {
  let certformat: cert.EncodingFormat;
  let encodingData: Uint8Array;

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

  return new Promise<cert.X509CRL>((resolve, reject) => {
    cert.createX509CRL(encodingBlob, (err: BusinessError<void>|null, data: cert.X509CRL|undefined) => {
      if (err || data === undefined) { // success: error is null, failed: data is undefined
        console.error(
          "[callback] createX509CRL failed! error code is: " + err?.code
        );
        reject(err as Error);
      } else {
        console.warn(
          "[callback] createX509CRL success! format is: " + certformat
        );
        resolve(data as cert.X509CRL);
      }
    });
  });
}

async function checkIsRevokedX509CRLCallback(crlInstance: cert.X509CRL, flag: string): Promise<boolean> {
  try {
    let certInstance: cert.X509Cert = await createX509CertInstanceforCRLTestCallback(flag);
    let status: boolean = crlInstance.isRevoked(certInstance);

    return status;
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function checkGetEncodedX509CRLCallback(certType: string): Promise<string> {
  let gInstance: cert.X509CRL = await createX509CRLInstanceCallback(certType);
  return new Promise<string>((resolve, reject) => {
    gInstance.getEncoded((err: BusinessError<void>|null, EncodingBlob: cert.EncodingBlob|undefined) => {
      if (err || EncodingBlob === undefined) { // success: error is null, failed: data is undefined
        console.error("[callback] CRL getEncoded failed, err is:" + err);
        reject(err as Error);
      } else {
        console.warn(
          "[callback] CRL getEncoded success, EncodingBlob is:" +
            EncodingBlob
        );
        expect(EncodingBlob != undefined).assertTrue();
        resolve("CRL get encoded success");
      }
    });
  })
}

async function convertAsyKey(rsaGenerator: cryptoFramework.AsyKeyGenerator,
  pubKeyDataBlob: cryptoFramework.DataBlob, priKeyDataBlob: cryptoFramework.DataBlob): Promise<cryptoFramework.KeyPair> {
  return new Promise<cryptoFramework.KeyPair>((resolve, reject) => {
    rsaGenerator.convertKey(
      pubKeyDataBlob,
      priKeyDataBlob,
      (err: BusinessError<void>|null, convertKeyPair: cryptoFramework.KeyPair|undefined) => {
        if (err || convertKeyPair === undefined) { // success: error is null, failed: data is undefined
          console.error("[Callback]convertKey failed. error is " + err);
          reject(err as Error);
        } else {
          console.log(
            "[Callback]convertKey success. convertKeyPair is " + convertKeyPair
          );
          resolve(convertKeyPair as cryptoFramework.KeyPair);
        }
      }
    );
  });
}

async function verifyX509CRL(crlInstance: cert.X509CRL, pubKey: cryptoFramework.PubKey): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    crlInstance.verify(pubKey, (err: BusinessError<void>|null) => {
      if (err) { // success: error is null, failed: data is undefined
        console.error("[Callback]verifyX509Crl failed. error is " + err);
        reject(err as Error);
      } else {
        console.log("[Callback]verifyX509Crl success!");
        resolve("CRL verify success");
      }
    });
  });
}

async function verifyX509CRLCallback(crlType: string, flag?: string | cryptoFramework.PubKey): Promise<void> {
  let certformat: cert.EncodingFormat;
  let priKeyEncodingData: Uint8Array;
  let pubKeyEncodingData: Uint8Array;
  let crlEncodingData: Uint8Array;

  let priEncodingBlob: cryptoFramework.DataBlob;
  let pubEncodingBlob: cryptoFramework.DataBlob;
  let crlEncodingBlob: cert.EncodingBlob;
  certformat = cert.EncodingFormat.FORMAT_DER;
  priKeyEncodingData = convertToUint8Array(crlVerifyPriKeyHex);
  pubKeyEncodingData = convertToUint8Array(crlVerifyPubKeyHex);
  crlEncodingData = convertToUint8Array(crlHex);
  priEncodingBlob = {
    data: priKeyEncodingData,
  };
  pubEncodingBlob = {
    data: pubKeyEncodingData,
  };
  crlEncodingBlob = {
    data: crlEncodingData,
    encodingFormat: certformat,
  };
  let asyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_3");
  expect(asyKeyGenerator != null).assertTrue();
  let crlInstance: cert.X509CRL = await cert.createX509CRL(crlEncodingBlob);
  expect(crlInstance != null).assertTrue();
  let convertKeyPair: cryptoFramework.KeyPair =
    await convertAsyKey(asyKeyGenerator, pubEncodingBlob, priEncodingBlob);
  expect(convertKeyPair != null).assertTrue();
  let pubKey: cryptoFramework.PubKey = convertKeyPair.pubKey;
  let res: string = await verifyX509CRL(crlInstance, pubKey);
  expect(res).assertEqual("CRL verify success");
}

async function getX509CRLInfoCallback(certType: string, processType: string): Promise<void> {
  try {
    let gInstance: cert.X509CRL = await createX509CRLInstanceCallback(certType);
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
    }
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function checkGetRevokedCertWithCertX509CRLCallback(crlInstance: cert.X509CRL, flag: string): Promise<cert.X509CRLEntry> {
  try {
    let gInstance: cert.X509Cert = await createX509CertInstanceforCRLTestCallback(flag);
    let x509CrlEntry: cert.X509CRLEntry = crlInstance.getRevokedCertWithCert(gInstance);
    expect(x509CrlEntry != null).assertTrue();
    let num: bigint = x509CrlEntry.getSerialNumber();
    console.warn("[num] getRevokedCertWithCert num is:" + num);

    return x509CrlEntry;
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function checkGetRevokedCertsX509CRLCallback(certType: string): Promise<string> {
  let gIndex: int;
  let revocation: string;
  let instance: cert.X509CRL = await createX509CRLInstanceCallback(certType);
  return new Promise<string>((resolve, reject) => {
    instance.getRevokedCerts((err: BusinessError<void>|null, tmp: cert.X509CRLEntry[]|undefined) => {
      if (tmp !== undefined) {
        let certs: cert.X509CRLEntry[] = tmp as cert.X509CRLEntry[];
        expect(certs != null && certs.length != 0).assertTrue();
        console.warn("[callback] CRL get gevoked certs success");
        for (let i = 0; i < certs.length; i++) {
          gIndex = i;
          console.log(
            "[callback] certs i: " +
              gIndex +
              " serialNumber is: " +
            certs[gIndex].getSerialNumber()
          );
          revocation = certs[gIndex].getRevocationDate();
          expect(revocation != null).assertTrue();
          console.log(
            "[callback] certs i: " +
              gIndex +
              " revocation date is: " +
              revocation
          );
          certs[gIndex].getEncoded((err2: BusinessError<void>|null, eData: cert.EncodingBlob|undefined) => {
            expect(eData !== undefined && err2?.code != 0).assertTrue();
            console.log(
              "[callback] certs i: " + gIndex + " getEncoded is: " + eData
            );
          });
        }
      }
    });
    resolve("get revoked certs success");
  })
}

async function checkGetRevokedCertX509CRLCallback(certType: string): Promise<string> {
  let certIssuer: cert.DataBlob;
  let cert1: cert.X509CRLEntry;
  let revocation: string;
  let instance: cert.X509CRL = await createX509CRLInstanceCallback(certType);
  return new Promise<string>((resolve, reject) => {
    cert1 = instance.getRevokedCert(BigInt(1));
    expect(cert1 != null).assertTrue();
    console.warn("[callback] CRL get gevoked cert success");
    revocation = cert1.getRevocationDate();
    expect(revocation != null).assertTrue();
    console.log("[callback] cert revocation date is: " + revocation);
    certIssuer = cert1.getCertIssuer();
    expect(certIssuer != null).assertTrue();
    console.log(
      "[Callback] cert certIssuer is: " +
      uInt8ArrayToString(certIssuer.data)
    );
    resolve("check revoked success");
  })
}

async function checkValidateOfCertChainValidatorCallback(algName: string, flag: string): Promise<string> {
  return new Promise<string>((resolve, reject) => {
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
      //解决编译问题
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
    validator.validate(certChainData, (err: BusinessError<void>|null) => {
      if (err) { // success: error is null, failed: data is undefined
        console.error("[callback]: validate error: " + err);
        reject(err as Error);
      } else {
        console.warn("[callback]: validate success!");
        resolve("check validator success");
      }
    });
  });
}

async function createX509CRLExtensionsInstanceCallback(certType: string, hasExtension: boolean): Promise<cert.X509CRL> {
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

  return new Promise<cert.X509CRL>((resolve, reject) => {
    cert.createX509CRL(encodingBlob, (err: BusinessError<void>|null, data: cert.X509CRL|undefined) => {
      if (err || data === undefined) { // success: error is null, failed: data is undefined
        console.error(
          "[callback] createX509CRL failed! error code is: " + err?.code
        );
        reject(err as Error);
      } else {
        console.warn(
          "[callback] createX509CRL success! format is: " + certformat
        );
        resolve(data as cert.X509CRL);
      }
    });
  });
}

async function checkGetX509CRLExtensionsCallback(extensions: string, hasExtension: boolean): Promise<cert.DataBlob> {
  try {
    let instance: cert.X509CRL = await createX509CRLExtensionsInstanceCallback(extensions, hasExtension);
    let extension: cert.DataBlob = instance.getExtensions();

    return extension;
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function createX509CRLEntryExtensionsInstanceCallback(certType: string, hasExtension: boolean): Promise<cert.X509CRL> {
  let certformat: cert.EncodingFormat;
  let encodingData: Uint8Array;

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

  return new Promise<cert.X509CRL>((resolve, reject) => {
    cert.createX509CRL(encodingBlob, (err: BusinessError<void>|null, data: cert.X509CRL|undefined) => {
      if (err || data === undefined) { // success: error is null, failed: data is undefined
        console.error(
          "[callback] createX509CRL failed! error code is: " + err?.code
        );
        reject(err as Error);
      } else {
        console.warn(
          "[callback] createX509CRL success! format is: " + certformat
        );
        resolve(data as cert.X509CRL);
      }
    });
  });
}

async function checkGetX509CRLEntryExtensionsCallback(extensions: string, hasExtension: boolean): Promise<cert.DataBlob> {
  try {
    let x509Crl: cert.X509CRL = await createX509CRLEntryExtensionsInstanceCallback(extensions, hasExtension);
    let crlEntries: cert.X509CRLEntry[] = await x509Crl.getRevokedCerts();
    if (crlEntries) {
      let cert1: cert.X509CRLEntry = crlEntries[0];
      let list = cert1.getExtensions();

      return list;
    } else {
      return {data:new Uint8Array()} as cert.DataBlob;
    }

  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function checkHasX509CRLEntryExtensionsCallback(extensions: string, hasExtension: boolean): Promise<boolean> {
  try {
    let x509Crl: cert.X509CRL = await createX509CRLEntryExtensionsInstanceCallback(extensions, hasExtension);
    let crlEntries: cert.X509CRLEntry[] = await x509Crl.getRevokedCerts();
    if (crlEntries) {
      let cert1: cert.X509CRLEntry = crlEntries[0];
      let hasExtensions: boolean = cert1.hasExtensions();

      return hasExtensions;
    } else {
      return false;
    }

  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function createX509CertExtensionNormalCallback(flag: string): Promise<cert.CertExtension> {
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

  return new Promise<cert.CertExtension>((resolve, reject) => {
    cert.createCertExtension(encodingBlob, (err: BusinessError<void>|null, extensionObj: cert.CertExtension|undefined) => {
      if (err || extensionObj === undefined) { // success: error is null, failed: data is undefined
        console.error(
          "[callback] create X509 CertExtension failed! err code: " + err?.code
        );
        reject(err as Error);
      } else {
        console.warn(
          "[callback] create X509 CertExtension success! format is: " +
            certFormat
        );
        resolve(extensionObj as cert.CertExtension);
      }
    });
  });
}

async function checkHasUnsupportedX509CrlCallback(flag: string): Promise<boolean> {
  try {
    let certExt: cert.CertExtension = await createX509CertExtensionNormalCallback(flag);
    let hasUnsupported: boolean = certExt.hasUnsupportedCriticalExtension();
  } catch (error) {
    console.error(`“${error}“, error code: ${error.code}`);
    throw error as Error;
  }
  return new Promise<boolean>((resolve, reject) => {});
}

async function createX509CRLInstanceWithSerialNumberCallback(): Promise<cert.X509CRL> {
  let certformat: cert.EncodingFormat;
  let encodingData: Uint8Array;
  certformat = cert.EncodingFormat.FORMAT_PEM;
  encodingData = stringTouInt8Array(testCrlWith18byteSerialPem);

  let encodingBlob: cert.EncodingBlob = {
    data: encodingData,
    encodingFormat: certformat,
  };

  return new Promise<cert.X509CRL>((resolve, reject) => {
    cert.createX509CRL(encodingBlob, (err: BusinessError<void>|null, data: cert.X509CRL|undefined) => {
      if (err || data === undefined) { // success: error is null, failed: data is undefined
        console.error(
          "[callback] createX509CRL failed! error code is: " + err?.code
        );
        reject(err as Error);
      } else {
        console.warn(
          "[callback] createX509CRL success! format is: " + certformat
        );
        resolve(data as cert.X509CRL);
      }
    });
  });
}

async function checkX509CRLEntryGetSerialNumberCallback(certType: string): Promise<string> {
  let instance: cert.X509CRL = await createX509CRLInstanceWithSerialNumberCallback();
  return new Promise<string>((resolve, reject) => {
    instance.getRevokedCerts((err: BusinessError<void>|null, tmp: cert.X509CRLEntry[]|undefined) => {
      if (err || tmp === undefined) { // success: error is null, failed: data is undefined
        reject(err as Error);
      } else {
        let certs: cert.X509CRLEntry[] = tmp as cert.X509CRLEntry[];
        expect(certs != null && certs.length != 0).assertTrue();
        console.warn("[callback] CRL get revoked certs success");
        let serialNumber: BigInt = certs[0].getSerialNumber();
        expect(serialNumber !== null).assertTrue();
        expect(serialNumber === BigInt("22214312158469178443624022151750054219611905")).assertTrue();
        console.log("checkX509CRLEntryGetSerialNumberCallback");
        resolve("check success");
      }
    });
  })
}

async function checkX509CRLGetRevokedCertCallback(): Promise<void> {
  let instance: cert.X509CRL = await createX509CRLInstanceWithSerialNumberCallback();
  let crlEntry: cert.X509CRLEntry = instance.getRevokedCert(BigInt("22214312158469178443624022151750054219611905"));
  expect(crlEntry !== null).assertTrue();
}

export {
  createX509CertInstanceCallback,
  verifyX509CertCallback,
  checkValidityX509CertCallback,
  checkGetEncodedX509CertCallback,
  checkGetPublicKeyX509CertCallback,
  getX509CertInfoCallback,
  createX509CRLInstanceCallback,
  checkIsRevokedX509CRLCallback,
  checkGetEncodedX509CRLCallback,
  verifyX509CRLCallback,
  getX509CRLInfoCallback,
  checkGetRevokedCertWithCertX509CRLCallback,
  checkGetRevokedCertsX509CRLCallback,
  checkGetRevokedCertX509CRLCallback,
  checkValidateOfCertChainValidatorCallback,
  checkGetX509CRLExtensionsCallback,
  checkGetX509CRLEntryExtensionsCallback,
  createX509CertExtensionNormalCallback,
  checkHasUnsupportedX509CrlCallback,
  checkHasX509CRLEntryExtensionsCallback,
  checkX509CRLEntryGetSerialNumberCallback,
  checkX509CRLGetRevokedCertCallback
};
