/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import { expect } from "@ohos/hypium";
import { IAnyObj } from '../common/commonType';


function createX509CertInstancePromise(certType: string): Promise<cert.X509Cert> {
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

  return new Promise((resolve, reject) => {
    cert
      .createX509Cert(encodingBlob)
      .then((data) => {
        console.warn(
          "[promise] create X509 Cert success! format is: " + certformat
        );
        resolve(data);
      })
      .catch((err: Error) => {
        reject(err);
      });
  });
}

function createX509CertInstanceforCRLTestPromise(flag: IAnyObj | string): Promise<cert.X509Cert> {
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
    //没有用，解决编译报错问题
    certformat = cert.EncodingFormat.FORMAT_PEM;
    invalidParams = true;
  }

  let encodingBlob: cert.EncodingBlob = {
    data: encodingData,
    encodingFormat: certformat,
  };

  return new Promise((resolve, reject) => {
    cert
      .createX509Cert(encodingBlob)
      .then((data) => {
        console.warn(
          "[promise] create X509 Cert success! format is: " + certformat
        );
        if (invalidParams == true) {
          const cert: cert.X509Cert = flag as cert.X509Cert;
          resolve(cert);
        } else {
          resolve(data);
        }
      })
      .catch((err: Error) => {
        reject(err);
      });
  });
}

async function verifyX509CertPromise(certType: string, flag: string): Promise<void> {
  let gInstance: cert.X509Cert;
  let publicKey: cryptoFramework.PubKey | string;
  return new Promise((resolve, reject) => {
    createX509CertInstancePromise(certType)
      .then((instance) => {
        gInstance = instance;
        publicKey = gInstance.getPublicKey();
        expect(publicKey != null).assertTrue();
        console.log("[promise]  getPublickey success!");
        if (flag != undefined) {
          if (flag == "wrong") {
            publicKey = crlVerifyPubKeyHex;
          } else {
            publicKey = flag;
          }
        }
        return gInstance.verify(publicKey as cryptoFramework.PubKey);
      })
      .then((verifyret) => {
        resolve(verifyret);
      })
      .catch((err: IAnyObj) => {
        console.error("[promise] getPublickey failed! error is: " + err);
        if (flag != undefined) {
          resolve(err.code);
        } else {
          reject(err);
        }
      });
  });
}

async function checkValidityX509CertPromise(certType: string, date: string): Promise<void> {
  let result: void;
  return new Promise((resolve, reject) => {
    createX509CertInstancePromise(certType)
      .then((instance) => {
        result = instance.checkValidityWithDate(date);
        resolve(result);
      })
      .catch((err: IAnyObj) => {
        console.error(
          "[promise] checkValidityX509Cert failed! error is: " + err
        );
        if (String(err).indexOf("check cert validity failed") != -1) {
          resolve(err.code);
        } else {
          reject(err);
        }
      });
  });
}

async function getX509CertInfoPromise(certType: string, processType: string) {
  let gInstance: cert.X509Cert;
  return new Promise<void>((resolve, reject) => {
    createX509CertInstancePromise(certType)
      .then((instance) => {
        gInstance = instance;
        switch (processType) {
          case "getVersion":
            let version = gInstance.getVersion();
            console.log(processType + " is : " + version);
            expect(version != null).assertTrue();
            break;
          case "getSerialNumber":
            let serialNumber = gInstance.getSerialNumber();
            console.log(processType + " is : " + serialNumber);
            expect(serialNumber != null).assertTrue();
            let certSerialNumber = gInstance.getCertSerialNumber();
            expect(certSerialNumber != null).assertTrue();
            break;
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
            reject(processType);
        }
        resolve();
      })
      .catch((err: Error) => {
        console.error("[promise] getX509CertInfo failed! error is: " + err);
        reject(err);
      });
  });
}

async function checkGetEncodedX509CertPromise(certType: string) {
  let gInstance: cert.X509Cert;

  return new Promise<void>((resolve, reject) => {
    createX509CertInstancePromise(certType)
      .then((instance) => {
        gInstance = instance;
        return gInstance.getEncoded();
      })
      .then((encodedBlob) => {
        console.warn(
          "[promise] getEncoded success, EncodingBlob is:" + encodedBlob
        );
        expect(encodedBlob != null).assertTrue();
        resolve();
      })
      .catch((err: Error) => {
        console.error("[promise] getEncoded failed! error is: " + err);
        reject(err);
      });
  });
}

async function checkGetPublicKeyX509CertPromise(certType: string) {
  let publicKey: cryptoFramework.PubKey;
  return new Promise<void>((resolve, reject) => {
    createX509CertInstancePromise(certType)
      .then((instance) => {
        publicKey = instance.getPublicKey();
        console.warn("[promise] publicKey success, publicKey is:" + publicKey);
        expect(publicKey != null).assertTrue();
        resolve();
      })
      .catch((err: Error) => {
        console.error("[promise] publicKey failed! error is: " + err);
        reject(err);
      });
  });
}

function createX509CRLInstancePromise(certType: string): Promise<cert.X509CRL> {
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

  return new Promise((resolve, reject) => {
    cert
      .createX509CRL(encodingBlob)
      .then((data) => {
        console.warn(
          "[promise] createX509CRL success! format is: " + certformat
        );
        resolve(data);
      })
      .catch((err: Error) => {
        reject(err);
      });
  });
}

function checkIsRevokedX509CRLPromise(crlInstance: cert.X509CRL, flag: string): Promise<boolean | number> {
  let status: boolean;
  return new Promise((resolve, reject) => {
    createX509CertInstanceforCRLTestPromise(flag)
      .then((certInstance) => {
        status = crlInstance.isRevoked(certInstance);
        console.warn("[promise] isRevoked status is:" + status);
        resolve(status);
      })
      .catch((err: IAnyObj) => {
        console.error("[promise] isRevoked failed! err is: " + err);
        if (String(err).indexOf("get array data failed") != -1) {
          resolve(err.code);
        } else {
          reject(err);
        }
      });
  });
}

async function checkGetEncodedX509CRLPromise(certType: string) {
  let gInstance: cert.X509CRL;
  return new Promise<void>((resolve, reject) => {
    createX509CRLInstancePromise(certType)
      .then((instance) => {
        gInstance = instance;
        return gInstance.getEncoded();
      })
      .then((encodedBlob) => {
        console.warn(
          "[promise] CRL getEncoded success, EncodingBlob is:" + encodedBlob
        );
        expect(encodedBlob != null).assertTrue();
        resolve();
      })
      .catch((err: Error) => {
        console.error("[promise] CRL getEncoded failed! error is: " + err);
        reject(err);
      });
  });
}

function verifyX509CRLPromise(crlType: string, flag?: string | cryptoFramework.PubKey): Promise<void | number> {
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
    certFormat = 2;
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

  return new Promise((resolve, reject) => {
    let asyKeyGenerator =
    cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_3");
    expect(asyKeyGenerator != null);
    cert
      .createX509CRL(crlEncodingBlob)
      .then((crlInstance) => {
        expect(crlInstance != null).assertTrue();
        globalCrlInstance = crlInstance;
        return asyKeyGenerator.convertKey(pubEncodingBlob, priEncodingBlob);
      })
      .then((convertKeyPair) => {
        expect(convertKeyPair != null).assertTrue();
        let pubKey = convertKeyPair.pubKey;
        if (flag != undefined) {
          if (flag != "error") {
            pubKey = flag as cryptoFramework.PubKey;
          } else {
            pubKey = convertKeyPair.priKey;
          }
        }
        return globalCrlInstance.verify(pubKey);
      })
      .then((result) => {
        resolve(result);
      })
      .catch((err: IAnyObj) => {
        console.error(
          "[Promise]verifyX509CRLPromise failed. error is " + err.code
        );
        if (flag != undefined) {
          resolve(err.code);
        } else {
          reject(err);
        }
      });
  });
}

async function getX509CRLInfoPromise(certType: string, processType: string) {
  let gInstance: cert.X509CRL;
  return new Promise<void>((resolve, reject) => {
    createX509CRLInstancePromise(certType)
      .then((instance) => {
        gInstance = instance;
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
            reject(processType);
        }
        resolve();
      })
      .catch((err: Error) => {
        console.error("[promise] getX509CrtInfo failed! error is: " + err);
        reject(err);
      });
  });
}

function checkGetRevokedCertWithCertX509CRLPromise(crlInstance: cert.X509CRL, flag: string): Promise<cert.X509CRLEntry> {
  return new Promise((resolve, reject) => {
    createX509CertInstanceforCRLTestPromise(flag)
      .then((certInstance: cert.X509Cert) => {
        let crlEntry = crlInstance.getRevokedCertWithCert(certInstance);
        console.warn("[promise] getRevokedCertWithCert is:" + crlEntry);
        let num = crlEntry.getSerialNumber();
        console.warn("[promise] getRevokedCertWithCert num is:" + num);
        resolve(crlEntry);
      })
      .catch((err: Error) => {
        console.error("[promise] getRevokedCertWithCert failed!");
        reject(err);
      });
  });
}

async function checkGetRevokedCertsX509CRLPromise(certType: string) {
  let gIndex: number;
  let revocation: string;
  return new Promise<void>((resolve, reject) => {
    createX509CRLInstancePromise(certType)
      .then((instance) => {
        return instance.getRevokedCerts();
      })
      .then((certs) => {
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
          certs[gIndex]
            .getEncoded()
            .then((eData) => {
              expect(eData != null).assertTrue();
              console.log(
                "[Promise] certs i: " + gIndex + " getEncoded is: " + eData
              );
            })
            .catch((err: Error) => {
              console.error(
                "[Promise] certs i: " + gIndex + " getEncoded err is: " + err
              );
              reject(err);
            });
        }
        resolve();
      })
      .catch((err: Error) => {
        console.error("[Promise] CRL gevoked certs failed! error  is: " + err);
        reject(err);
      });
  });
}

async function checkGetRevokedCertX509CRLPromise(certType: string) {
  let certIssuer: cert.DataBlob;
  let revocation: string;
  return new Promise<void>((resolve, reject) => {
    createX509CRLInstancePromise(certType)
      .then((instance) => {
        let cert1 = instance.getRevokedCert(BigInt(1));
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
        resolve();
      })
      .catch((err: Error) => {
        console.error("[Promise] CRL gevoked cert failed! error  is: " + err);
        reject(err);
      });
  });
}

function checkValidateOfCertChainValidatorPromise(algName: string, flag: string): Promise<void> {
  return new Promise((resolve, reject) => {
    let validator: cert.CertChainValidator;
    try {
      validator = cert.createCertChainValidator(algName);
      let algorithm = validator.algorithm;
      console.log(
        "createCertChainValidator success! algorithm is: " + algorithm
      );
    } catch (err) {
      console.error("createCertChainValidator error is: " + err);
      if (String(err).indexOf("create cert chain validator failed") != -1) {
        resolve(err.code);
      } else {
        reject(err);
      }
      return;
    }
    let certArray1 = stringTouInt8Array(chainFirstCaCert);
    let byteLength1 = certArray1.byteLength;
    let uInt16CertLength1 = new Uint16Array([byteLength1]);
    let uInt8CertLength1: Uint8Array;
    if (flag == "error") {
      // 解决编译问题
      // uInt8CertLength1 = new Uint8Array([uInt16CertLength1.buffer]);
      const temp = [123];
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
    validator
      .validate(certChainData)
      .then((data) => {
        console.warn("[promise]: validate success!");
        resolve(data);
      })
      .catch((err: IAnyObj) => {
        console.error("[promise]: validate error: " + err);
        if (flag == "error") {
          resolve(err.code);
        } else {
          reject(err);
        }
      });
  });
}

function createX509CRLExtensionsInstancePromise(certType: string, hasExtension: boolean): Promise<cert.X509CRL> {
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

  return new Promise((resolve, reject) => {
    cert
      .createX509CRL(encodingBlob)
      .then((data) => {
        console.warn(
          "[promise] createX509CRL success! format is: " + certformat
        );
        resolve(data);
      })
      .catch((err: Error) => {
        reject(err);
      });
  });
}

async function checkGetX509CRLExtensionsPromise(certType: string, hasExtension: boolean): Promise<cert.DataBlob> {
  return new Promise((resolve, reject) => {
    createX509CRLExtensionsInstancePromise(certType, hasExtension)
      .then((instance) => {
        const extension = instance.getExtensions();
        resolve(extension);
      })
      .catch((err: Error) => {
        console.error("[Promise] get crl extension failed! error  is: " + err);
        reject(err);
      });
  });
}

async function checkGetX509CRLExtensionsStabilityPromise(certType: string, hasExtension: boolean): Promise<cert.DataBlob> {
  return new Promise((resolve, reject) => {
    createX509CRLExtensionsInstancePromise(certType, hasExtension)
      .then((instance) => {
        for (let i = 0; i < 1000; i++) {
          const extension = instance.getExtensions();
        }
        const extension = instance.getExtensions();
        resolve(extension);
      })
      .catch((err: Error) => {
        console.error("[Promise] get crl extension failed! error  is: " + err);
        reject(err);
      });
  });
}

function createX509CRLEntryExtensionsInstancePromise(certType: string, hasExtension: boolean): Promise<cert.X509CRL> {
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

  return new Promise((resolve, reject) => {
    cert
      .createX509CRL(encodingBlob)
      .then((data) => {
        console.warn(
          "[promise] createX509CRL success! format is: " + certformat
        );
        resolve(data);
      })
      .catch((err: Error) => {
        reject(err);
      });
  });
}

async function checkGetX509CRLEntryExtensionsPromise(certType: string, hasExtension: boolean): Promise<cert.DataBlob> {
  let cert1: cert.X509CRLEntry;
  return new Promise((resolve, reject) => {
    createX509CRLEntryExtensionsInstancePromise(certType, hasExtension)
      .then(async (x509Crl) => {
        const crlEntries = await x509Crl.getRevokedCerts();
        cert1 = crlEntries?.[0];
        const list = cert1.getExtensions();
        resolve(list);
      })
      .catch((err: Error) => {
        console.error("[Promise] get crl entry extension failed! error is: " + err);
        reject(err);
      });
  });
}

async function checkGetX509CRLEntryExtensionsStabilityPromise(certType: string, hasExtension: boolean): Promise<cert.DataBlob> {
  let cert1: cert.X509CRLEntry;
  return new Promise((resolve, reject) => {
    createX509CRLEntryExtensionsInstancePromise(certType, hasExtension)
      .then(async (x509Crl) => {
        const crlEntries = await x509Crl.getRevokedCerts();
        cert1 = crlEntries?.[0];
        for (let i = 0; i < 1000; i++) {
          const list = cert1.getExtensions();
        }
        const list = cert1.getExtensions();
        resolve(list);
      })
      .catch((err: Error) => {
        console.error("[Promise] get crl entry extension failed! error is: " + err);
        reject(err);
      });
  });
}

async function checkHasX509CRLEntryExtensionsPromise(extensions: string, hasExtension: boolean): Promise<boolean> {
  let cert1: cert.X509CRLEntry;
  return new Promise((resolve, reject) => {
    createX509CRLEntryExtensionsInstancePromise(extensions, hasExtension)
      .then(async (x509Crl) => {
        const crlEntries = await x509Crl.getRevokedCerts();
        cert1 = crlEntries?.[0];
        const hasExtensions = cert1.hasExtensions();
        resolve(hasExtensions);
      })
      .catch((err: Error) => {
        console.error("[Promise] crl entry has extension failed! error  is: " + err);
        reject(err);
      });
  });
}

async function createX509CertExtensionNormalPromise(flag: string): Promise<cert.CertExtension> {
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

  return new Promise((resolve, reject) => {
    cert
      .createCertExtension(encodingBlob)
      .then((extensionObj) => {
        console.warn(
          "[promise] create X509 CertExtension success! format is: " +
            certFormat
        );
        resolve(extensionObj);
      })
      .catch((err: Error) => {
        reject(err);
      });
  });
}

async function checkHasUnsupportedX509CrlPromise(flag: string): Promise<boolean> {
  return new Promise((resolve, reject) => {
    createX509CertExtensionNormalPromise(flag)
      .then((certExt) => {
        let hasUnsupported: boolean = certExt.hasUnsupportedCriticalExtension();
        resolve(hasUnsupported);
      })
      .catch((err: Error) => {
        console.error("[Promise] Crl get revoked cert failed! error  is: " + err);
        reject(err);
      });
  });
}

function createX509CRLInstanceWithSerialNumberPromise(): Promise<cert.X509CRL> {
  let certformat: cert.EncodingFormat;
  let encodingData: Uint8Array;

  certformat = cert.EncodingFormat.FORMAT_PEM;
  encodingData = stringTouInt8Array(testCrlWith18byteSerialPem);


  let encodingBlob: cert.EncodingBlob = {
    data: encodingData,
    encodingFormat: certformat,
  };

  return new Promise((resolve, reject) => {
    cert
      .createX509CRL(encodingBlob)
      .then((data) => {
        console.warn(
          "[promise] createX509CRL success! format is: " + certformat
        );
        resolve(data);
      })
      .catch((err: Error) => {
        reject(err);
      });
  });
}

async function checkX509CRLEntryGetSerialNumberPromise(certType: string) {
  return new Promise<void>((resolve, reject) => {
    createX509CRLInstanceWithSerialNumberPromise()
      .then((instance) => {
        return instance.getRevokedCerts();
      })
      .then((certs) => {
        expect(certs != null && certs.length != 0).assertTrue();
        console.warn("[Promise] CRL get revoked certs success");
        const serialNumber = certs[0].getSerialNumber();
        expect(serialNumber !== null).assertTrue();
        expect(serialNumber === BigInt("22214312158469178443624022151750054219611905")).assertTrue();
        resolve();
      })
      .catch((err: Error) => {
        console.error("[Promise] CRL get revoked certs failed! error  is: " + err);
        reject(err);
      });
  });
}

async function checkX509CRLGetRevokedCertPromise() {
  return new Promise<void>((resolve, reject) => {
    createX509CRLInstanceWithSerialNumberPromise()
      .then((instance) => {
        const crlEntry = instance.getRevokedCert(BigInt("22214312158469178443624022151750054219611905"));
        expect(crlEntry !== null).assertTrue();
        resolve();
      })
      .catch((err: Error) => {
        console.error("[Promise] CRL get revoked certs failed! error  is: " + err);
        reject(err);
      });
  });
}

let certUft8WithChineseSubject = '-----BEGIN CERTIFICATE-----\n' +
  'MIIDgTCCAmmgAwIBAgIGAXKnJjrAMA0GCSqGSIb3DQEBCwUAMFcxCzAJBgNVBAYT\n' +
  'AkNOMQ8wDQYDVQQIDAbpmZXopb8xDzANBgNVBAcMBuilv+WuiTEPMA0GA1UECgwG\n' +
  '5rWL6K+VMRUwEwYDVQQDDAzkuK3mlofmtYvor5UwHhcNMjQwNTEzMDgwMjQ3WhcN\n' +
  'MzQwNTExMDgwMjQ3WjBXMQswCQYDVQQGEwJDTjEPMA0GA1UECAwG6ZmV6KW/MQ8w\n' +
  'DQYDVQQHDAbopb/lrokxDzANBgNVBAoMBua1i+ivlTEVMBMGA1UEAwwM5Lit5paH\n' +
  '5rWL6K+VMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArPh1a1JvzN/X\n' +
  'rg/R4SlGiPIQjDpQr9QYPS3ZFjYWUt4HGVKYqW1TDLuN+9yePfxH5OQnu9NGQo1d\n' +
  'sMkri+mq3Vus/UDl/5hRoFhbyRxuc0SlKTBsJN1VAjb2RydfGvwM11NbbOu8w+M5\n' +
  'Ox5Ht6aSCpTOyWp7QWgqmGWXQ0mWTGyLpLmOkvVU1RgcLuwRK9QqbcgfjpbW2c+E\n' +
  'W+eC2p1YeHISkUN0bk/+uHC2NYR/jFnvgkbQk9zi6G2vt1OJOjKbX0BIUaKfLuyr\n' +
  'LINHKQ1VUu+dDx6PEby/zCKRGUdGasJlWEc+94DTPTAN7OyhAowqpY1lQ8cpesqt\n' +
  'ktP6IrPAGwIDAQABo1MwUTAdBgNVHQ4EFgQU4HkPdkcjPWQM93FYM6leQi5lFKww\n' +
  'HwYDVR0jBBgwFoAU4HkPdkcjPWQM93FYM6leQi5lFKwwDwYDVR0TAQH/BAUwAwEB\n' +
  '/zANBgkqhkiG9w0BAQsFAAOCAQEALD4CetOC79QD2AE4DGWQ6j66FZLU4YkQ44lm\n' +
  '1iG0QAtXnnpaan7CN5hCQ3rQhb4jaCauYNqH/iSvym6MqvJ+KJr06luWI0+uThnD\n' +
  'zg+1AMn9Jn+wC95p5+ZstAtwmfHQNYlL++hXQDZspS3JOZDUNSx6HZFhDsyM0Lnk\n' +
  'muO0rwJxeWxPglj1II+JjkXhuji0Pac4jjXamBlKZYMbM16+zGBnORhwWS+hQ7Eu\n' +
  'S2QBpKut3kF/lc8htOApzKEvThTtHsaYp410q4ego7+k3Kbk4a8VpzdQMMipO/Fk\n' +
  'BwOKEuuyb6pLN0btEwGqaZRK2BbbSUX39+06Z/OPbujL8X3/SA==\n' +
  '-----END CERTIFICATE-----\n';

let certUft8WithNullSubject = '-----BEGIN CERTIFICATE-----\n' +
  'MIIBzjCCATegAwIBAgIGAXKnJjrAMA0GCSqGSIb3DQEBCwUAMAAwHhcNMjQwNTE1\n' +
  'MDkzMTQ1WhcNMzQwNTEzMDkzMTQ1WjAAMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCB\n' +
  'iQKBgQCyXbtKPbpKIvQSqFIKThMBHdPkquDJ/Lg8+PDbwP3s+AJ1b6fFhsB9s0oV\n' +
  'knmmYT1CYvN52RVYTJJDPFbEFsbBePQLG/OAaMKDg6SXieVgzbvx5MStJaBDvhqT\n' +
  'GwdzmxKfadghxdOfT65E4KENUipc2WI0/H2BqvwkXahIugBhJQIDAQABo1MwUTAd\n' +
  'BgNVHQ4EFgQUuMkml7Jx2h2A1dEuGt+SLUt2UV8wHwYDVR0jBBgwFoAUuMkml7Jx\n' +
  '2h2A1dEuGt+SLUt2UV8wDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOB\n' +
  'gQAFSN+j8N5bORIt79WaM8rSgtKJspxagkyrQxbX6zerhYy1Jdakp/gk0mzjBllD\n' +
  'LS1tc0elUH9uBeGMNe0EHaFmIW+9ZyBHNSgC5kFO+c9foM5IlgX2rffgoyYhymzg\n' +
  'QjEAdY2Ni2kz9CUvUj8sy/vGtdOXkBFBpGrNUEKz4STKjA==\n' +
  '-----END CERTIFICATE-----\n';

let certUft8WithSpecialSubject = '-----BEGIN CERTIFICATE-----\n' +
  'MIIDizCCAnOgAwIBAgIGAXKnJjrAMA0GCSqGSIb3DQEBCwUAMFwxCzAJBgNVBAYT\n' +
  'AkNOMQ8wDQYDVQQIDAbpmZXopb8xEjAQBgNVBAcMCeilv++/peWuiTEQMA4GA1UE\n' +
  'CgwH5rWLJeivlTEWMBQGA1UEAwwN5Lit5paHQOa1i+ivlTAeFw0yNDA1MTUwOTQx\n' +
  'NTFaFw0zNDA1MTMwOTQxNTFaMFwxCzAJBgNVBAYTAkNOMQ8wDQYDVQQIDAbpmZXo\n' +
  'pb8xEjAQBgNVBAcMCeilv++/peWuiTEQMA4GA1UECgwH5rWLJeivlTEWMBQGA1UE\n' +
  'AwwN5Lit5paHQOa1i+ivlTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEB\n' +
  'ANE1XpjR6Zrk2eJ6e9arl3S3KEQFNidC4wANm2uTAhRKWk9u3GQhyaMtJ44TCv7J\n' +
  'yG4j5Vn5dXHPELYhKrTUoG2vK7qYigDi2xh3VEQcc9yQGa/BMT2j2xoye62OXd4u\n' +
  '3SRKK7suAyBNFuYcOCe7bKaiWoQJJI3+EQjwWVUVcXLdW+spS4DvBA0ZATsZmrs+\n' +
  '4pw1q5U68pm5Fy0n14lCQohK1SdiaccAHK129bK5B5KHYuJZ9/jfJZn2zIv8qHV2\n' +
  '8NNccqBQS36rVGWfRkfSlHscfDhQ4ZxEhInayfu5BY0qxqLLFOtqeQGvmTTjGW/n\n' +
  'L2s47mL0/uWnpFlMJ7BxHoECAwEAAaNTMFEwHQYDVR0OBBYEFKsCCrUUhKQDw4Rl\n' +
  'ndlKCRybnupnMB8GA1UdIwQYMBaAFKsCCrUUhKQDw4RlndlKCRybnupnMA8GA1Ud\n' +
  'EwEB/wQFMAMBAf8wDQYJKoZIhvcNAQELBQADggEBACS1dPSJzMpoZaMohs7Kk0zE\n' +
  'e7Mv+iZElwDi3vfG11CynbOleIFEFGeixRTQyVW5SMmZGMdwaF3uD3Uoas7Q9G8d\n' +
  'NKZsJa0FeFg5aArBBr7ggbVTR5iEDs32cPr9ic/VDNBGqIcQmp10qvZ0cydK10Fl\n' +
  'g/0YJB1pw7zZwz+J5YgTKwkTAbtFLva6yqPno8HG+FruMXF3WxGAsLfIOjL9h7rU\n' +
  'jG5iRiA0WjdrKW4YTNNzjoez3SFx7/P7NWg1gp51HwBSL7mg+ctVjsG9G4xwhrLI\n' +
  'dcJFeuBWEaWbA6lAiW+lAcQKqqfolHOF7VMIB+ieIUR0cavlHEIGLYg/BL5VSKU=\n' +
  '-----END CERTIFICATE-----\n';

let certUft8WithSubject = '-----BEGIN CERTIFICATE-----\n' +
  'MIIBHTCBwwICA+gwCgYIKoZIzj0EAwIwGjEYMBYGA1UEAwwPRXhhbXBsZSBSb290\n' +
  'IENBMB4XDTIzMDkwNTAyNDgyMloXDTI2MDUzMTAyNDgyMlowGjEYMBYGA1UEAwwP\n' +
  'RXhhbXBsZSBSb290IENBMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEHjG74yMI\n' +
  'ueO7z3T+dyuEIrhxTg2fqgeNB3SGfsIXlsiUfLTatUsU0i/sePnrKglj2H8Abbx9\n' +
  'PK0tsW/VgqwDIDAKBggqhkjOPQQDAgNJADBGAiEApVZno/Z7WyDc/muRN1y57uaY\n' +
  'Mjrgnvp/AMdE8qmFiDwCIQCrIYdHVO1awaPgcdALZY+uLQi6mEs/oMJLUcmaag3E\n' +
  'Qw==\n' +
  '-----END CERTIFICATE-----\n';


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
  certUft8WithChineseSubject,
  certUft8WithSpecialSubject,
  certUft8WithNullSubject,
  certUft8WithSubject,
  checkGetX509CRLEntryExtensionsStabilityPromise
};