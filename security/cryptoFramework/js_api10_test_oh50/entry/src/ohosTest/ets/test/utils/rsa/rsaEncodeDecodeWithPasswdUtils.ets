/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import cryptoFramework from '@ohos.security.cryptoFramework';
import {
  priKeyPkcs1Str2048,
  priKeyPkcs1Str3072,
  priKeyPkcs1Str4096,
  priKeyPkcs1Str8192,
  pubKeyPkcs1Str2048,
  pubKeyPkcs1Str3072,
  pubKeyPkcs1Str4096,
  pubKeyPkcs1Str8192
} from '../pkcs1Topkcs8/pkcs1topkcs8';

async function getPriKeyWithPasswd(algName: string, format: string,
  passWd:string, cipherName: string): Promise<string> {
  try {
    let option: cryptoFramework.KeyEncodingConfig  = {
      password: passWd,
      cipherName: cipherName
    };
    let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    let keyPair: cryptoFramework.KeyPair = {} as cryptoFramework.KeyPair;
    if (algName === "RSA2048") {
      keyPair = await generator.convertPemKey(pubKeyPkcs1Str2048, priKeyPkcs1Str2048);
    } else if (algName === "RSA3072") {
      keyPair = await generator.convertPemKey(pubKeyPkcs1Str3072, priKeyPkcs1Str3072);
    } else if (algName === "RSA4096") {
      keyPair = await generator.convertPemKey(pubKeyPkcs1Str4096, priKeyPkcs1Str4096);
    } else if (algName === "RSA8192") {
      keyPair = await generator.convertPemKey(pubKeyPkcs1Str8192, priKeyPkcs1Str8192);
    } else {
      keyPair = await generator.generateKeyPair();
    }
    let priKeyPem: string = keyPair.priKey.getEncodedPem(format, option);

    return priKeyPem;
  } catch (error) {
    console.error('getPriKeyWithPasswd, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

async function convertKeyPairWithPasswdPromise(algName: string, pubKey: string|null,
  priKey: string, passWd: string): Promise<cryptoFramework.KeyPair> {
  try {
    let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    let keyPair: cryptoFramework.KeyPair = await generator.convertPemKey(pubKey, priKey, passWd);

    return keyPair;
  } catch (error) {
    console.error('convertKeyPairWithPasswdPromise, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

function convertKeyPairWithPasswdSync(algName: string, pubKey: string|null,
  priKey: string, passWd: string): cryptoFramework.KeyPair {
  try {
    let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    let keyPair: cryptoFramework.KeyPair = generator.convertPemKeySync(pubKey, priKey, passWd);

    return keyPair;
  } catch (error) {
    console.error('convertKeyPairWithPasswdSync, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

@Concurrent
async function rsaEncodedBySpecTest(algName: string, cipherName: string, format: string): Promise<boolean> {
  try {
    let option: cryptoFramework.KeyEncodingConfig  = {
      password: "a1baC1",
      cipherName: cipherName
    };
    let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    let keyPair: cryptoFramework.KeyPair = {} as cryptoFramework.KeyPair;
    if (algName === "RSA2048") {
      keyPair = await generator.convertPemKey(pubKeyPkcs1Str2048, priKeyPkcs1Str2048);
    } else if (algName === "RSA3072") {
      keyPair = await generator.convertPemKey(pubKeyPkcs1Str3072, priKeyPkcs1Str3072);
    } else if (algName === "RSA4096") {
      keyPair = await generator.convertPemKey(pubKeyPkcs1Str4096, priKeyPkcs1Str4096);
    } else if (algName === "RSA8192") {
      keyPair = await generator.convertPemKey(pubKeyPkcs1Str8192, priKeyPkcs1Str8192);
    } else {
      keyPair = await generator.generateKeyPair();
    }
    let priKeyPem: string = keyPair.priKey.getEncodedPem(format, option);

    return priKeyPem ? true : false
  } catch (error) {
    console.error('rsaEncodedBySpecTest, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

@Concurrent
async function rsaDecodedBySpecPromiseTest(algName: string, cipherName: string, format: string): Promise<boolean> {
  try {
    let option: cryptoFramework.KeyEncodingConfig  = {
      password: "a1baC1",
      cipherName: cipherName
    };
    let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    let keyPair: cryptoFramework.KeyPair = {} as cryptoFramework.KeyPair;
    if (algName === "RSA2048") {
      keyPair = await generator.convertPemKey(pubKeyPkcs1Str2048, priKeyPkcs1Str2048);
    } else if (algName === "RSA3072") {
      keyPair = await generator.convertPemKey(pubKeyPkcs1Str3072, priKeyPkcs1Str3072);
    } else if (algName === "RSA4096") {
      keyPair = await generator.convertPemKey(pubKeyPkcs1Str4096, priKeyPkcs1Str4096);
    } else if (algName === "RSA8192") {
      keyPair = await generator.convertPemKey(pubKeyPkcs1Str8192, priKeyPkcs1Str8192);
    } else {
      keyPair = await generator.generateKeyPair();
    }
    let priKeyPem: string = keyPair.priKey.getEncodedPem(format, option);
    let pubKeyPem: string = keyPair.pubKey.getEncodedPem("X509");
    let convertGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    let convertKeyPair: cryptoFramework.KeyPair = await convertGenerator.convertPemKey(pubKeyPem, priKeyPem, option.password);
    return convertKeyPair ? true : false
  } catch (error) {
    console.error('rsaDecodedBySpecPromiseTest, ' + error.code + " errorMsg " + error.message);
    return false;
  }
}

@Concurrent
async function rsaDecodedBySpecSyncTest(algName: string, cipherName: string, format: string): Promise<boolean> {
  try {
    let option: cryptoFramework.KeyEncodingConfig  = {
      password: "a1baC1",
      cipherName: cipherName
    };
    let generator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    let keyPair: cryptoFramework.KeyPair = {} as cryptoFramework.KeyPair;
    if (algName === "RSA2048") {
      keyPair = await generator.convertPemKey(pubKeyPkcs1Str2048, priKeyPkcs1Str2048);
    } else if (algName === "RSA3072") {
      keyPair = await generator.convertPemKey(pubKeyPkcs1Str3072, priKeyPkcs1Str3072);
    } else if (algName === "RSA4096") {
      keyPair = await generator.convertPemKey(pubKeyPkcs1Str4096, priKeyPkcs1Str4096);
    } else if (algName === "RSA8192") {
      keyPair = await generator.convertPemKey(pubKeyPkcs1Str8192, priKeyPkcs1Str8192);
    } else {
      keyPair = await generator.generateKeyPair();
    }
    let priKeyPem: string = keyPair.priKey.getEncodedPem(format, option);
    let pubKeyPem: string = keyPair.pubKey.getEncodedPem("PKCS1");
    let convertGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    let convertKeyPair: cryptoFramework.KeyPair = convertGenerator.convertPemKeySync(pubKeyPem, priKeyPem, option.password);
    return convertKeyPair ? true : false
  } catch (error) {
    console.error('rsaDecodedBySpecPromiseTest, ' + error.code + " errorMsg " + error.message);
    return false;
  }
}

// passwd: aBc123, cipher:aes192
let rsa_enc_prikey: string =
  "-----BEGIN ENCRYPTED PRIVATE KEY-----\n"                            +
  "MIICTTBXBgkqhkiG9w0BBQ0wSjApBgkqhkiG9w0BBQwwHAQIUFqgpgJl44ECAggA\n" +
  "MAwGCCqGSIb3DQIJBQAwHQYJYIZIAWUDBAEWBBAcrDeow2X+JF6f/M+7XsRYBIIB\n" +
  "8A7nGfaMOfdkQlc9TZQ2z+JeG0zXBaCLg9/QRLASPr8Bjy9kfjWnZdefgG+C7MaZ\n" +
  "s6o2bS3zqqAbjkOoo+/yuBI0dFQ2l5ESdSaCDhnmemy9nc7Po5COKcaWAG+f+2D7\n" +
  "swwWxSGyNhA6iFmFbx40lnZ8ZAIxDiMNJdL+2m9gzj0rL2nyCqV1aLo3u8rzi6ia\n" +
  "OClu+pMTqtEPFIFnqqprO7Vo8beTbDDFFF6hfAv4LS2OwALXImPH4bwRscIrmtJW\n" +
  "TCh+24TQ54AL3+p0p9tGCLOLEfD3Wo5Eg8gvDZIdCcq9CJWUGfPN7f8vazXsL3S2\n" +
  "GuEQkvVNZTzlpd1AJ6U5NdusdNyiodvaMFf0w6g/zE6m35C0dP2insn2zTyU1mmo\n" +
  "qJVO1mVv7UljhSc/s2mgiuenMqw6TYtj+e1IoioHp9ZSktdqsE1BK+EhSGFTKNj0\n" +
  "OnJbpJAsGBZoUeboc15iXHQKg3fQkQaRYNSWD8kAig6wcI0iu0eWWOtk7tH3gre/\n" +
  "+KDVBYQuvKLPJ/UoLeTFmwQgHGzMCOtBIrY42fcDwk5ouPBwzDESDHaK0xSg0rup\n" +
  "+2TpPelXKWSeC7Y5GXIXBBZg+BeSYg2hilzZb2lJkfTC4nwE1yFGr1FH0iOSDcWC\n" +
  "XWKh8Np3pMa2L+xFtXUX4gM=\n"                                         +
  "-----END ENCRYPTED PRIVATE KEY-----"

let rsa_prikey: string =
  "-----BEGIN PRIVATE KEY-----\n"                                      +
  "MIIB4wIBADANBgkqhkiG9w0BAQEFAASCAc0wggHJAgEAAmEAt3khE43S1gVyIKug\n" +
  "1DSP5vWLG//zmyCNBQJbDl87k3yww1u32sSTCXyLI83KCrTQ65EHgb3kquhHBJHq\n" +
  "Nw7zbr+5M27e3JqAPx+s8bvSkRZnPBogrpgO4uoPiwNZtNC7AgMBAAECYGrEyKTS\n" +
  "cZEulh3BAtS6yctDtPJUXnU12hrCJi8U6FyJwWvOYg2jO1XX7jiltx/H3JZHpCGb\n" +
  "9VtVeBPUW4woXA+eeqkybIoLbbc9EoO24sBvJFZOck2tNtpB60mYkHWzYQIxAPRw\n" +
  "md/JF8U5Iv9sa1mdOOFxF5W0QRX5oD0BPYItv10uDVZ/Nda8RXkChuO6MVF4UwIx\n" +
  "AMAmabskDLXtFlhFTawwVZwtqGXcTR2it0JWparNoCD6q8d83kbRntw2aIfmNzUY\n" +
  "+QIwRUvCo4lrnrKy9Dw1NqN2o5qe+AawyN0KiyDV4hi7/lt21oWbqrOW8lZADUEU\n" +
  "iCcXAjATNcPsSbZbmdBaEtOpG0vzyTzEsjmjdNkNcMwvP096/JSf5QPz4JEZQvdA\n" +
  "Xuu2C0ECMAptfAUYFmixC1ZE+7bboy+aSYgoHXF+lTHk4joIx9bU9xQxKTcrrQnG\n" +
  "KIPbnR0s7w==\n"                                                     +
  "-----END PRIVATE KEY-----"

let rsa_pubkey: string =
  "-----BEGIN RSA PUBLIC KEY-----\n"                                   +
  "MGgCYQCounzXFxXIbTBpmQA0r/miTDaOdiMDy2cjW9XVOdhK+HZjJP9ivk4lGz6H\n" +
  "sPlsTUeEXaR1c6utcBmJbs32f2LI2KjRCpkMz5IIHKEUVMqejaQzB6gPi8afz9Yh\n" +
  "OM+BVusCAwEAAQ==\n"                                                 +
  "-----END RSA PUBLIC KEY-----"

// passwd: aBc123, cipher:aes192
let rsa_enc_prikey_pkcs1: string =
  "-----BEGIN RSA PRIVATE KEY-----\n"                                  +
  "Proc-Type: 4,ENCRYPTED\n"                                           +
  "DEK-Info: AES-192-CBC,16C1213F81A4DD5ACD36E010DFD2A00A\n"           +
  "\n"                                                                 +
  "Zu0ae2Y2JNJDyLrgAFasyKc+sMfcLwqkbjbQk2rhBL0c31Kmv3A7ND063NHdpLrJ\n" +
  "X6oEXRMr1JNgzfxz8G20RPKQceLDxZWOH256+BbhA95fnEJKeZGzJmTaTWXQB/sk\n" +
  "KDFuxBgJwtsDQ/iDcGfbGKbGCAR3D3F5tC2XuDdFUkoCIGJ0LER6zDNXOBB8YbEO\n" +
  "TMtiLXvl7RfJ47R7yuZn518cGc8Hrck9EdLL97KweZbXl1SrwW+3ACLUDOR9TI53\n" +
  "CIw8uE2dANe+SxL/e5IrW37WYpp03yxZuHXr4H1wPTyKVH2f8ScNm+QYG+b2+x+w\n" +
  "xDClpUZWqOlp4vI8dFldlwpuWwg2ryRbvMarLtTH1afYCpwt7b0OpcH+nAJwMvpQ\n" +
  "QdHeIDa1J5co8k/m5f1GHDxNRokfWl6nBKymFzQdYPT6SRDbDJF93HkdhG9KGfk1\n" +
  "/n/Qr+AOMERdHxmNxazaCZgN5SNhW62vrHbjBtzzx4DmjvFP6BichqJgPRNqjliW\n" +
  "JL6abYEsiFN9Rs7lKCGkv8y3yKJZ6JqS5XnDgpI0C+YRYNd2VdGthEHA/g4VSQeh\n" +
  "+EyWYdkIzNW0IZkfB8wYg6FRnyc+2GKUI0JGg0xasZ4=\n"                     +
  "-----END RSA PRIVATE KEY-----\n"

// passwd: aBc123, cipher:aes192
let rsa_enc_prikey_error: string =
  "-----BEGIN RSA PRIVATE KEY-----\n"                                  +
  "Proc-Type: 4,ENCRYPTED\n"                                           +
  "DEK-Info: AES-192-CBC,16C1213F81A4DD5ACD36E010DFD2A00A\n"           +
  "Zu0ae2Y2JNJDyLrgAFasyKc+sMfcLwqkbjbQk2rhBL0c31Kmv3A7ND063NHdpLrJ\n" +
  "X6oEXRMr1JNgzfxz8G20RPKQceLDxZWOH256+BbhA95fnEJKeZGzJmTaTWXQB/sk\n" +
  "KDFuxBgJwtsDQ/iDcGfbGKbGCAR3D3F5tC2XuDdFUkoCIGJ0LER6zDNXOBB8YbEO\n" +
  "TMtiLXvl7RfJ47R7yuZn518cGc8Hrck9EdLL97KweZbXl1SrwW+3ACLUDOR9TI53\n" +
  "CIw8uE2dANe+SxL/e5IrW37WYpp03yxZuHXr4H1wPTyKVH2f8ScNm+QYG+b2+x+w\n" +
  "xDClpUZWqOlp4vI8dFldlwpuWwg2ryRbvMarLtTH1afYCpwt7b0OpcH+nAJwMvpQ\n" +
  "QdHeIDa1J5co8k/m5f1GHDxNRokfWl6nBKymFzQdYPT6SRDbDJF93HkdhG9KGfk1\n" +
  "/n/Qr+AOMERdHxmNxazaCZgN5SNhW62vrHbjBtzzx4DmjvFP6BichqJgPRNqjliW\n" +
  "JL6abYEsiFN9Rs7lKCGkv8y3yKJZ6JqS5XnDgpI0C+YRYNd2VdGthEHA/g4VSQeh\n" +
  "+EyWYdkIzNW0IZkfB8wYg6FRnyc+2GKUI0JGg0xasZ4=\n"                     +
  "-----END RSA PRIVATE KEY-----\n"

let passwd_max_string: string =
  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
  "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" +
  "1111111111111111111111111111111111111111111111111111111111111111" +
  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
  "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" +
  "1111111111111111111111111111111111111111111111111111111111111111" +
  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
  "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" +
  "1111111111111111111111111111111111111111111111111111111111111111" +
  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
  "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" +
  "1111111111111111111111111111111111111111111111111111111111111111" +
  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
  "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" +
  "1111111111111111111111111111111111111111111111111111111111111111" +
  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
  "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" +
  "1111111111111111111111111111111111111111111111111111111111111111" +
  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
  "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" +
  "1111111111111111111111111111111111111111111111111111111111111111" +
  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
  "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" +
  "1111111111111111111111111111111111111111111111111111111111111111" +
  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
  "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" +
  "1111111111111111111111111111111111111111111111111111111111111111" +
  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
  "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" +
  "1111111111111111111111111111111111111111111111111111111111111111" +
  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
  "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" +
  "1111111111111111111111111111111111111111111111111111111111111111" +
  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
  "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" +
  "1111111111111111111111111111111111111111111111111111111111111111" +
  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
  "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" +
  "1111111111111111111111111111111111111111111111111111111111111111" +
  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
  "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" +
  "1111111111111111111111111111111111111111111111111111111111111111" +
  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
  "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" +
  "1111111111111111111111111111111111111111111111111111111111111111" +
  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
  "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" +
  "1111111111111111111111111111111111111111111111111111111111111111" +
  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
  "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" +
  "1111111111111111111111111111111111111111111111111111111111111111" +
  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
  "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" +
  "1111111111111111111111111111111111111111111111111111111111111111" +
  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
  "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" +
  "1111111111111111111111111111111111111111111111111111111111111111" +
  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
  "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" +
  "1111111111111111111111111111111111111111111111111111111111111111" +
  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
  "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" +
  "1111111111111111111111111111111111111111111111111111111111111111" +
  "2222222222222222222222222222222222222222222222222222222222222222"

let rsaSpec: string[] = [
  "RSA512", "RSA768", "RSA1024", "RSA2048",
  "RSA3072", "RSA4096", "RSA8192"
]

let cipherSpec: string[] = [
  "AES-128-CBC", "AES-192-CBC",
  "AES-256-CBC", "DES-EDE3-CBC"
]

let PASSWD_MAX_LEN: number = 4096;

export {
  getPriKeyWithPasswd,
  convertKeyPairWithPasswdPromise,
  convertKeyPairWithPasswdSync,
  rsaEncodedBySpecTest,
  rsaDecodedBySpecPromiseTest,
  rsaDecodedBySpecSyncTest,
  passwd_max_string,
  rsa_enc_prikey,
  rsa_enc_prikey_pkcs1,
  rsa_enc_prikey_error,
  rsa_prikey,
  rsa_pubkey,
  rsaSpec,
  cipherSpec,
  PASSWD_MAX_LEN,
}