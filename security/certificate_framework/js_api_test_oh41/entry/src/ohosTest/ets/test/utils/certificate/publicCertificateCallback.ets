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

import { expect } from "@ohos/hypium";
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
import { IAnyObj } from '../common/commonType';

function createX509CertInstanceCallback(certType: string): Promise<cert.X509Cert> {
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
    cert.createX509Cert(encodingBlob, (err, data) => {
      if (data == null) {
        console.error(
          "[callback] create X509 Cert failed! err code: " + err.code
        );
        reject(err);
      } else {
        console.warn(
          "[callback] create X509 Cert success! format is: " + certformat
        );
        resolve(data);
      }
    });
  });
}

function createX509CertInstanceforCRLTestCallback(flag: string | cert.X509Cert): Promise<cert.X509Cert> {
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

  return new Promise((resolve, reject) => {
    cert.createX509Cert(encodingBlob, (err, data) => {
      if (data == null) {
        console.error(
          "[callback] create X509 Cert failed! err code: " + err.code
        );
        reject(err);
      } else {
        console.warn(
          "[callback] create X509 Cert success! format is: " + certformat
        );
        if (invalidParams == true) {
          const result = flag as cert.X509Cert;
          resolve(result);
        } else {
          resolve(data);
        }
      }
    });
  });
}

async function verifyX509Cert(certInstance: cert.X509Cert, pubKey: cryptoFramework.PubKey): Promise<void> {
  return new Promise<void>((resolve, reject) => {
    certInstance.verify(pubKey, (err) => {
      if (err) {
        console.error("[Callback]verify failed. error is " + err);
        reject(err);
      } else {
        console.log("[Callback]verify success!");
        resolve();
      }
    });
  });
}

async function verifyX509CertCallback(certType: string, flag: string): Promise<void> {
  let gInstance: cert.X509Cert;
  let pubKey: cryptoFramework.PubKey | string;
  return new Promise((resolve, reject) => {
    createX509CertInstanceCallback(certType)
      .then((instance) => {
        gInstance = instance;
        pubKey = gInstance.getPublicKey();
        expect(pubKey != null).assertTrue();
        if (flag != undefined) {
          if (flag == "wrong") {
            pubKey = crlVerifyPubKeyHex;
          } else {
            pubKey = flag;
          }
        }
        return verifyX509Cert(gInstance, pubKey as cryptoFramework.PubKey);
      })
      .then((output) => {
        resolve(output);
      })
      .catch((err: IAnyObj) => {
        console.error(
          "[callback] verifyX509CertCallback failed! error is: " + err
        );
        if (flag != undefined) {
          resolve(err.code);
        } else {
          reject(err);
        }
      });
  });
}

async function checkValidityX509CertCallback(certType: string, date: string): Promise<null> {
  return new Promise((resolve, reject) => {
    createX509CertInstanceCallback(certType)
      .then((instance) => {
        instance.checkValidityWithDate(date);
        resolve(null);
      })
      .catch((err: IAnyObj) => {
        console.error(
          "[callback] checkValidityX509Cert failed! error is: " + err.code
        );
        if (String(err).indexOf("check cert validity failed") != -1) {
          resolve(err.code);
        } else {
          reject(err);
        }
      });
  });
}

async function getX509CertInfoCallback(certType: string, processType: string) {
  let gInstance: cert.X509Cert;
  return new Promise<void>((resolve, reject) => {
    createX509CertInstanceCallback(certType)
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
        console.error("[callback] getX509CertInfo failed! error is: " + err);
        reject(err);
      });
  });
}

async function checkGetEncodedX509CertCallback(certType: string) {
  let gInstance: cert.X509Cert;

  return new Promise<void>((resolve, reject) => {
    createX509CertInstanceCallback(certType)
      .then((instance) => {
        gInstance = instance;
        gInstance.getEncoded((err, EncodingBlob) => {
          if (err) {
            console.error(
              "[callback] getEncoded failed, err code is:" + err.code
            );
            reject(err);
          } else {
            console.warn(
              "[callback] getEncoded success, EncodingBlob is:" + EncodingBlob
            );
            expect(EncodingBlob != null).assertTrue();
            resolve();
          }
        });
      })
      .catch((err: Error) => {
        console.error("[callback] getPublickey failed! error is: " + err);
        reject(err);
      });
  });
}

async function checkGetPublicKeyX509CertCallback(certType: string) {
  let publicKey: cryptoFramework.PubKey;
  return new Promise<void>((resolve, reject) => {
    createX509CertInstanceCallback(certType)
      .then((instance) => {
        publicKey = instance.getPublicKey();
        console.warn("[callback] publicKey success, publicKey is:" + publicKey);
        expect(publicKey != null).assertTrue();
        resolve();
      })
      .catch((err: Error) => {
        console.error("[callback] getPublickey failed! error is: " + err);
        reject(err);
      });
  });
}

function createX509CRLInstanceCallback(certType: string): Promise<cert.X509CRL> {
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
    cert.createX509CRL(encodingBlob, (err, data) => {
      if (err) {
        console.error(
          "[callback] createX509CRL failed! error code is: " + err.code
        );
        reject(err);
      } else {
        console.warn(
          "[callback] createX509CRL success! format is: " + certformat
        );
        resolve(data);
      }
    });
  });
}

function checkIsRevokedX509CRLCallback(crlInstance: cert.X509CRL, flag: string): Promise<boolean> {
  let status: boolean;
  return new Promise((resolve, reject) => {
    createX509CertInstanceforCRLTestCallback(flag)
      .then((certInstance) => {
        status = crlInstance.isRevoked(certInstance);
        console.warn("[callback] isRevoked status is:" + status);
        resolve(status);
      })
      .catch((err: IAnyObj) => {
        console.error("[callback] isRevoked failed! err is: " + err);
        if (String(err).indexOf("get array data failed") != -1) {
          resolve(err.code);
        } else {
          reject(err);
        }
      });
  });
}

async function checkGetEncodedX509CRLCallback(certType: string) {
  let gInstance: cert.X509CRL;
  return new Promise<void>((resolve, reject) => {
    createX509CRLInstanceCallback(certType)
      .then((instance) => {
        gInstance = instance;
        gInstance.getEncoded((err, EncodingBlob) => {
          if (err) {
            console.error("[callback] CRL getEncoded failed, err is:" + err);
            reject(err);
          } else {
            console.warn(
              "[callback] CRL getEncoded success, EncodingBlob is:" +
                EncodingBlob
            );
            expect(EncodingBlob != null).assertTrue();
            resolve();
          }
        });
      })
      .catch((err: Error) => {
        console.error("[callback] CRL getEncoded failed, err is: " + err);
        reject(err);
      });
  });
}

async function convertAsyKey(rsaGenerator: cryptoFramework.AsyKeyGenerator, pubKeyDataBlob: cryptoFramework.DataBlob, priKeyDataBlob: cryptoFramework.DataBlob): Promise<cryptoFramework.KeyPair> {
  return new Promise((resolve, reject) => {
    rsaGenerator.convertKey(
      pubKeyDataBlob,
      priKeyDataBlob,
      (err, convertKeyPair) => {
        if (err) {
          console.error("[Callback]convertKey failed. error is " + err);
          reject(err);
        } else {
          console.log(
            "[Callback]convertKey success. convertKeyPair is " + convertKeyPair
          );
          resolve(convertKeyPair);
        }
      }
    );
  });
}

async function verifyX509CRL(crlInstance: cert.X509CRL, pubKey: cryptoFramework.PubKey): Promise<void> {
  return new Promise<void>((resolve, reject) => {
    crlInstance.verify(pubKey, (err) => {
      if (err) {
        console.error("[Callback]verifyX509Crl failed. error is " + err);
        reject(err);
      } else {
        console.log("[Callback]verifyX509Crl success!");
        resolve();
      }
    });
  });
}

function verifyX509CRLCallback(crlType: string, flag?: string | cryptoFramework.PubKey): Promise<void | number> {
  let certformat: cert.EncodingFormat;
  let priKeyEncodingData: Uint8Array;
  let pubKeyEncodingData: Uint8Array;
  let crlEncodingData: Uint8Array;
  let globalCrlInstance: cert.X509CRL;

  let priEncodingBlob: cryptoFramework.DataBlob;
  let pubEncodingBlob: cryptoFramework.DataBlob;
  let crlEncodingBlob: cert.EncodingBlob;
  if (crlType == "pem" || crlType == "der") {
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
  }

  return new Promise((resolve, reject) => {
    let asyKeyGenerator =
    cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_3");
    expect(asyKeyGenerator != null).assertTrue();
    cert
      .createX509CRL(crlEncodingBlob)
      .then((crlInstance) => {
        expect(crlInstance != null).assertTrue();
        globalCrlInstance = crlInstance;
        return convertAsyKey(asyKeyGenerator, pubEncodingBlob, priEncodingBlob);
      })
      .then((convertKeyPair) => {
        expect(convertKeyPair != null).assertTrue();
        let pubKey = convertKeyPair.pubKey;
        if (flag != undefined) {
          pubKey = flag as cryptoFramework.PubKey;
        }
        return verifyX509CRL(globalCrlInstance, pubKey);
      })
      .then((result) => {
        resolve(result);
      })
      .catch((err: IAnyObj) => {
        console.error(
          "[Callback]verifyX509CRLCallback failed. error is " + err
        );
        if (flag != undefined) {
          resolve(err.code);
        } else {
          reject(err);
        }
      });
  });
}

async function getX509CRLInfoCallback(certType: string, processType: string) {
  let gInstance: cert.X509CRL;
  return new Promise<void>((resolve, reject) => {
    createX509CRLInstanceCallback(certType)
      .then((instance: cert.X509CRL) => {
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
        console.error("[callback] getX509CrtInfo failed! error is: " + err);
        reject(err);
      });
  });
}

function checkGetRevokedCertWithCertX509CRLCallback(crlInstance: cert.X509CRL, flag: string): Promise<cert.X509CRLEntry> {
  let x509CrlEntry: cert.X509CRLEntry;
  return new Promise((resolve: Function, reject: Function) => {
    createX509CertInstanceforCRLTestCallback(flag)
      .then((certInstance: cert.X509Cert) => {
        x509CrlEntry = crlInstance.getRevokedCertWithCert(certInstance);
        expect(x509CrlEntry != null).assertTrue();
        let num = x509CrlEntry.getSerialNumber();
        console.warn("[num] getRevokedCertWithCert num is:" + num);
        resolve(x509CrlEntry);
      })
      .catch((err: Error) => {
        console.error(
          "[callback] getRevokedCertWithCert failed! err is:" + err
        );
        reject(err);
      });
  });
}

async function checkGetRevokedCertsX509CRLCallback(certType: string) {
  let gIndex: number;
  let revocation: string;
  return new Promise<void>((resolve, reject) => {
    createX509CRLInstanceCallback(certType)
      .then((instance) => {
        instance.getRevokedCerts((err, certs) => {
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
            certs[gIndex].getEncoded((err2, eData) => {
              expect(eData != null).assertTrue();
              console.log(
                "[callback] certs i: " + gIndex + " getEncoded is: " + eData
              );
            });
          }
        });
        resolve();
      })
      .catch((err: Error) => {
        console.error("[callback] CRL getPublickey failed! error is: " + err);
        reject(err);
      });
  });
}

async function checkGetRevokedCertX509CRLCallback(certType: string) {
  let certIssuer: cert.DataBlob;
  let cert1: cert.X509CRLEntry;
  let revocation: string;
  return new Promise<void>((resolve, reject) => {
    createX509CRLInstanceCallback(certType)
      .then((instance) => {
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
        resolve();
      })
      .catch((err: Error) => {
        console.error("[callback] CRL getPublickey failed! error is: " + err);
        reject(err);
      });
  });
}

function checkValidateOfCertChainValidatorCallback(algName: string, flag: string) {
  return new Promise<void>((resolve, reject) => {
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
    validator.validate(certChainData, (err: IAnyObj) => {
      if (err) {
        console.error("[callback]: validate error: " + err);
        if (flag == "error") {
          resolve(err.code);
        } else {
          reject(err);
        }
      } else {
        console.warn("[callback]: validate success!");
        resolve();
      }
    });
  });
}

function createX509CRLExtensionsInstanceCallback(certType: string, hasExtension: boolean): Promise<cert.X509CRL> {
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
    cert.createX509CRL(encodingBlob, (err, data) => {
      if (err) {
        console.error(
          "[callback] createX509CRL failed! error code is: " + err.code
        );
        reject(err);
      } else {
        console.warn(
          "[callback] createX509CRL success! format is: " + certformat
        );
        resolve(data);
      }
    });
  });
}

async function checkGetX509CRLExtensionsCallback(extensions: string, hasExtension: boolean): Promise<cert.DataBlob> {
  return new Promise((resolve, reject) => {
    createX509CRLExtensionsInstanceCallback(extensions, hasExtension)
      .then((instance) => {
        const extension = instance.getExtensions();
        resolve(extension);
      })
      .catch((err: Error) => {
        console.error("[callback] get crl extension failed! error is: " + err);
        reject(err);
      });
  });
}

function createX509CRLEntryExtensionsInstanceCallback(certType: string, hasExtension: boolean): Promise<cert.X509CRL> {
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
    cert.createX509CRL(encodingBlob, (err, data) => {
      if (err) {
        console.error(
          "[callback] createX509CRL failed! error code is: " + err.code
        );
        reject(err);
      } else {
        console.warn(
          "[callback] createX509CRL success! format is: " + certformat
        );
        resolve(data);
      }
    });
  });
}

async function checkGetX509CRLEntryExtensionsCallback(extensions: string, hasExtension: boolean): Promise<cert.DataBlob> {
  let cert1: cert.X509CRLEntry;
  return new Promise((resolve, reject) => {
    createX509CRLEntryExtensionsInstanceCallback(extensions, hasExtension)
      .then(async (x509Crl) => {
        const crlEntries = await x509Crl.getRevokedCerts();
        cert1 = crlEntries?.[0];
        const list = cert1.getExtensions();
        resolve(list);
      })
      .catch((err: Error) => {
        console.error("[callback] get crl entry extension failed! error is: " + err);
        reject(err);
      });
  });
}

async function checkHasX509CRLEntryExtensionsCallback(extensions: string, hasExtension: boolean): Promise<boolean> {
  let cert1: cert.X509CRLEntry;
  return new Promise((resolve, reject) => {
    createX509CRLEntryExtensionsInstanceCallback(extensions, hasExtension)
      .then(async (x509Crl) => {
        const crlEntries = await x509Crl.getRevokedCerts();
        cert1 = crlEntries?.[0];
        const hasExtensions = cert1.hasExtensions();
        resolve(hasExtensions);
      })
      .catch((err: Error) => {
        console.error("[callback] crl entry has extension failed! error is: " + err);
        reject(err);
      });
  });
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

  return new Promise((resolve, reject) => {
    cert.createCertExtension(encodingBlob, (err, extensionObj: cert.CertExtension) => {
      if (err) {
        console.error(
          "[callback] create X509 CertExtension failed! err code: " + err.code
        );
        reject(err);
      } else {
        console.warn(
          "[callback] create X509 CertExtension success! format is: " +
            certFormat
        );
        resolve(extensionObj);
      }
    });
  });
}

async function checkHasUnsupportedX509CrlCallback(flag: string): Promise<boolean> {
  return new Promise((resolve, reject) => {
    createX509CertExtensionNormalCallback(flag)
      .then((certExt) => {
        let hasUnsupported = certExt.hasUnsupportedCriticalExtension()
        resolve(hasUnsupported);
      })
      .catch((err: Error) => {
        console.error("[callback] get public key failed! error is: " + err);
        reject(err);
      });
  });
}

function createX509CRLInstanceWithSerialNumberCallback(): Promise<cert.X509CRL> {
  let certformat: cert.EncodingFormat;
  let encodingData: Uint8Array;
  certformat = cert.EncodingFormat.FORMAT_PEM;
  encodingData = stringTouInt8Array(testCrlWith18byteSerialPem);

  let encodingBlob: cert.EncodingBlob = {
    data: encodingData,
    encodingFormat: certformat,
  };

  return new Promise((resolve, reject) => {
    cert.createX509CRL(encodingBlob, (err, data) => {
      if (err) {
        console.error(
          "[callback] createX509CRL failed! error code is: " + err.code
        );
        reject(err);
      } else {
        console.warn(
          "[callback] createX509CRL success! format is: " + certformat
        );
        resolve(data);
      }
    });
  });
}

async function checkX509CRLEntryGetSerialNumberCallback(certType: string) {
  return new Promise<void>((resolve, reject) => {
    createX509CRLInstanceWithSerialNumberCallback()
      .then((instance) => {
        instance.getRevokedCerts((err, certs: Array<cert.X509CRLEntry>) => {
          expect(certs != null && certs.length != 0).assertTrue();
          console.warn("[callback] CRL get revoked certs success");
          const serialNumber = certs[0].getSerialNumber();
          expect(serialNumber !== null).assertTrue();
          expect(serialNumber === BigInt("22214312158469178443624022151750054219611905")).assertTrue();
          console.log("checkX509CRLEntryGetSerialNumberCallback");
        });
        resolve();
      })
      .catch((err: Error) => {
        console.error("[callback] CRL get Public key failed! error is: " + err);
        reject(err);
      });
  });
}

async function checkX509CRLGetRevokedCertCallback() {
  return new Promise<void>((resolve, reject) => {
    createX509CRLInstanceWithSerialNumberCallback()
      .then((instance) => {
        const crlEntry = instance.getRevokedCert(BigInt("22214312158469178443624022151750054219611905"));
        expect(crlEntry !== null).assertTrue();
        resolve();
        resolve();
      })
      .catch((err: Error) => {
        console.error("[callback] CRL getPublickey failed! error is: " + err);
        reject(err);
      });
  });
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
