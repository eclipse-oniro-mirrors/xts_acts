/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import {
  stringTouInt8Array,
  uInt8ArrayToString,
} from "../common/publicDoString";
import {
  chainFirstCaCert,
  chainSecondCaCert,
  selfSignedCaCertPem,
  selfSignedCaCertDer,
  testErrorCert,
  testCert,
  testCrlPem,
  testCrlDer,
  crlVerifyPriKeyHex,
  crlVerifyPubKeyHex,
  crlHex,
} from "../common/publicParam";

function createX509CertInstanceCallback(certType) {
  var certformat;
  var encodingData;

  if (certType == "der") {
    certformat = cert.EncodingFormat.FORMAT_DER;
    encodingData = new Uint8Array(
      selfSignedCaCertDer.match(/[\da-f]{2}/gi).map(function (h) {
        return parseInt(h, 16);
      })
    );
  } else {
    certformat = cert.EncodingFormat.FORMAT_PEM;
    encodingData = stringTouInt8Array(selfSignedCaCertPem);
  }

  var encodingBlob = {
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

function createX509CertInstanceforCrlTestCallback(flag) {
  var certformat;
  var encodingData;
  var invalidParams = false;

  if (flag == "normal") {
    certformat = cert.EncodingFormat.FORMAT_PEM;
    encodingData = stringTouInt8Array(testCert);
  } else if (flag == "error") {
    certformat = cert.EncodingFormat.FORMAT_PEM;
    encodingData = stringTouInt8Array(testErrorCert);
  } else {
    invalidParams = true;
  }

  var encodingBlob = {
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
          resolve(flag);
        } else {
          resolve(data);
        }
      }
    });
  });
}

async function verifyX509Cert(certInstance, pubKey) {
  return new Promise((resolve, reject) => {
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

async function verifyX509CertCallback(certType, flag) {
  var gInstance;
  var pubKey;
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
        return verifyX509Cert(gInstance, pubKey);
      })
      .then((output) => {
        resolve(output);
      })
      .catch((err) => {
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

async function checkValidityX509CertCallback(certType, date) {
  return new Promise((resolve, reject) => {
    createX509CertInstanceCallback(certType)
      .then((instance) => {
        instance.checkValidityWithDate(date);
        resolve(null);
      })
      .catch((err) => {
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

async function getX509CertInfoCallback(certType, processType) {
  var gInstance;
  return new Promise((resolve, reject) => {
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
      .catch((err) => {
        console.error("[callback] getX509CertInfo failed! error is: " + err);
        reject(err);
      });
  });
}

async function checkGetEncodedX509CertCallback(certType) {
  var gInstance;

  return new Promise((resolve, reject) => {
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
      .catch((err) => {
        console.error("[callback] getPublickey failed! error is: " + err);
        reject(err);
      });
  });
}

async function checkGetPublicKeyX509CertCallback(certType) {
  var publicKey;
  return new Promise((resolve, reject) => {
    createX509CertInstanceCallback(certType)
      .then((instance) => {
        publicKey = instance.getPublicKey();
        console.warn("[callback] publicKey success, publicKey is:" + publicKey);
        expect(publicKey != null).assertTrue();
        resolve();
      })
      .catch((err) => {
        console.error("[callback] getPublickey failed! error is: " + err);
        reject(err);
      });
  });
}

function createX509CrlInstanceCallback(certType) {
  var certformat;
  var encodingData;

  if (certType == "der") {
    certformat = cert.EncodingFormat.FORMAT_DER;
    encodingData = new Uint8Array(
      testCrlDer.match(/[\da-f]{2}/gi).map(function (h) {
        return parseInt(h, 16);
      })
    );
  } else {
    certformat = cert.EncodingFormat.FORMAT_PEM;
    encodingData = stringTouInt8Array(testCrlPem);
  }

  var encodingBlob = {
    data: encodingData,
    encodingFormat: certformat,
  };

  return new Promise((resolve, reject) => {
    cert.createX509Crl(encodingBlob, (err, data) => {
      if (err) {
        console.error(
          "[callback] createX509Crl failed! error code is: " + err.code
        );
        reject(err);
      } else {
        console.warn(
          "[callback] createX509Crl success! format is: " + certformat
        );
        resolve(data);
      }
    });
  });
}

function checkIsRevokedX509CrlCallback(crlInstance, flag) {
  var status;
  return new Promise((resolve, reject) => {
    createX509CertInstanceforCrlTestCallback(flag)
      .then((certInstance) => {
        status = crlInstance.isRevoked(certInstance);
        console.warn("[callback] isRevoked status is:" + status);
        resolve(status);
      })
      .catch((err) => {
        console.error("[callback] isRevoked failed! err is: " + err);
        if (String(err).indexOf("get array data failed") != -1) {
          resolve(err.code);
        } else {
          reject(err);
        }
      });
  });
}

async function checkGetEncodedX509CrlCallback(certType) {
  var gInstance;
  return new Promise((resolve, reject) => {
    createX509CrlInstanceCallback(certType)
      .then((instance) => {
        gInstance = instance;
        gInstance.getEncoded((err, EncodingBlob) => {
          if (err) {
            console.error("[callback] Crl getEncoded failed, err is:" + err);
            reject(err);
          } else {
            console.warn(
              "[callback] Crl getEncoded success, EncodingBlob is:" +
                EncodingBlob
            );
            expect(EncodingBlob != null).assertTrue();
            resolve();
          }
        });
      })
      .catch((err) => {
        console.error("[callback] Crl getEncoded failed, err is: " + err);
        reject(err);
      });
  });
}

async function convertAsyKey(rsaGenerator, pubKeyDataBlob, priKeyDataBlob) {
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

async function verifyX509Crl(crlInstance, pubKey) {
  return new Promise((resolve, reject) => {
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

function verifyX509CrlCallback(crlType, flag) {
  var certformat;
  var priKeyEncodingData;
  var pubKeyEncodingData;
  var crlEncodingData;
  var globalCrlInstance;

  if (crlType == "pem" || crlType == "der") {
    certformat = cert.EncodingFormat.FORMAT_DER;
    priKeyEncodingData = new Uint8Array(
      crlVerifyPriKeyHex.match(/[\da-f]{2}/gi).map(function (h) {
        return parseInt(h, 16);
      })
    );
    pubKeyEncodingData = new Uint8Array(
      crlVerifyPubKeyHex.match(/[\da-f]{2}/gi).map(function (h) {
        return parseInt(h, 16);
      })
    );
    crlEncodingData = new Uint8Array(
      crlHex.match(/[\da-f]{2}/gi).map(function (h) {
        return parseInt(h, 16);
      })
    );
    var priEncodingBlob = {
      data: priKeyEncodingData,
    };
    var pubEncodingBlob = {
      data: pubKeyEncodingData,
    };
    var crlEncodingBlob = {
      data: crlEncodingData,
      encodingFormat: certformat,
    };
  }

  return new Promise((resolve, reject) => {
    var asyKeyGenerator =
      cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_3");
    expect(asyKeyGenerator != null).assertTrue();
    cert
      .createX509Crl(crlEncodingBlob)
      .then((crlInstance) => {
        expect(crlInstance != null).assertTrue();
        globalCrlInstance = crlInstance;
        return convertAsyKey(asyKeyGenerator, pubEncodingBlob, priEncodingBlob);
      })
      .then((convertKeyPair) => {
        expect(convertKeyPair != null).assertTrue();
        let pubKey = convertKeyPair.pubKey;
        if (flag != undefined) {
          if (flag != "error") {
            pubKey = flag;
          } else {
            pubKey = convertKeyPair.PriKey;
          }
        }
        return verifyX509Crl(globalCrlInstance, pubKey);
      })
      .then((result) => {
        resolve(result);
      })
      .catch((err) => {
        console.error(
          "[Callback]verifyX509CrlCallback failed. error is " + err
        );
        if (flag != undefined) {
          resolve(err.code);
        } else {
          reject(err);
        }
      });
  });
}

async function getX509CrlInfoCallback(certType, processType) {
  var gInstance;
  return new Promise((resolve, reject) => {
    createX509CrlInstanceCallback(certType)
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
            let tbsInfo = gInstance.getTbsInfo();
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
      .catch((err) => {
        console.error("[callback] getX509CrtInfo failed! error is: " + err);
        reject(err);
      });
  });
}

function checkGetRevokedCertWithCertX509CrlCallback(crlInstance, flag) {
  var x509CrlEntry;
  return new Promise((resolve, reject) => {
    createX509CertInstanceforCrlTestCallback(flag)
      .then((certInstance) => {
        x509CrlEntry = crlInstance.getRevokedCertWithCert(certInstance);
        expect(x509CrlEntry != null).assertTrue();
        let num = x509CrlEntry.getSerialNumber();
        console.warn("[num] getRevokedCertWithCert num is:" + num);
        resolve(x509CrlEntry);
      })
      .catch((err) => {
        console.error(
          "[callback] getRevokedCertWithCert failed! err is:" + err
        );
        reject(err);
      });
  });
}

async function checkGetRevokedCertsX509CrlCallback(certType) {
  var gIndex;
  var revocation;
  return new Promise((resolve, reject) => {
    createX509CrlInstanceCallback(certType)
      .then((instance) => {
        instance.getRevokedCerts((err, certs) => {
          expect(certs != null && certs.length != 0).assertTrue();
          console.warn("[callback] Crl get gevoked certs success");
          for (var i = 0; i < certs.length; i++) {
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
      .catch((err) => {
        console.error("[callback] Crl getPublickey failed! error is: " + err);
        reject(err);
      });
  });
}

async function checkGetRevokedCertX509CrlCallback(certType) {
  var certIssuer;
  var cert1;
  var revocation;
  return new Promise((resolve, reject) => {
    createX509CrlInstanceCallback(certType)
      .then((instance) => {
        cert1 = instance.getRevokedCert(1);
        expect(cert1 != null).assertTrue();
        console.warn("[callback] Crl get gevoked cert success");
        revocation = cert1.getRevocationDate();
        expect(revocation != null).assertTrue();
        console.log("[callback] cert revocation date is: " + revocation);
        certIssuer = cert1.getCertIssuer();
        expect(certIssuer != null).assertTrue();
        console.log(
          "[Callback] cert certIssuer is: " +
            +uInt8ArrayToString(certIssuer.data)
        );
        resolve();
      })
      .catch((err) => {
        console.error("[callback] Crl getPublickey failed! error is: " + err);
        reject(err);
      });
  });
}

function checkValidateOfCertChainValidatorCallback(algName, flag) {
  return new Promise((resolve, reject) => {
    try {
      var validator = cert.createCertChainValidator(algName);
      var algorithm = validator.algorithm;
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
    var certArray1 = stringTouInt8Array(chainFirstCaCert);
    var byteLength1 = certArray1.byteLength;
    var uInt16CertLength1 = new Uint16Array([byteLength1]);
    if (flag == "error") {
      var uInt8CertLength1 = new Uint8Array([uInt16CertLength1.buffer]);
    } else {
      var uInt8CertLength1 = new Uint8Array(uInt16CertLength1.buffer);
    }
    var certArray2 = stringTouInt8Array(chainSecondCaCert);
    var byteLength2 = certArray2.byteLength;
    var uInt16CertLength2 = new Uint16Array([byteLength2]);
    var uInt8CertLength2 = new Uint8Array(uInt16CertLength2.buffer);

    var dataArray = new Uint8Array(
      uInt8CertLength2.length +
        certArray2.length +
        uInt8CertLength1.length +
        certArray1.length
    );
    for (var i = 0; i < uInt8CertLength2.length; i++) {
      dataArray[i] = uInt8CertLength2[i];
    }
    for (var i = 0; i < certArray2.length; i++) {
      dataArray[i + uInt8CertLength2.length] = certArray2[i];
    }
    for (var i = 0; i < uInt8CertLength1.length; i++) {
      dataArray[i + uInt8CertLength2.length + certArray2.length] =
        uInt8CertLength1[i];
    }
    for (var i = 0; i < certArray1.length; i++) {
      dataArray[
        i +
          uInt8CertLength2.length +
          certArray2.length +
          uInt8CertLength1.length
      ] = certArray1[i];
    }
    var certChainData = {
      data: dataArray,
      count: 2,
      encodingFormat: cert.EncodingFormat.FORMAT_PEM,
    };
    console.log("certChainData.data is: " + certChainData.data);
    validator.validate(certChainData, (err) => {
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

export {
  createX509CertInstanceCallback,
  verifyX509CertCallback,
  checkValidityX509CertCallback,
  checkGetEncodedX509CertCallback,
  checkGetPublicKeyX509CertCallback,
  getX509CertInfoCallback,
  createX509CrlInstanceCallback,
  checkIsRevokedX509CrlCallback,
  checkGetEncodedX509CrlCallback,
  verifyX509CrlCallback,
  getX509CrlInfoCallback,
  checkGetRevokedCertWithCertX509CrlCallback,
  checkGetRevokedCertsX509CrlCallback,
  checkGetRevokedCertX509CrlCallback,
  checkValidateOfCertChainValidatorCallback,
};
