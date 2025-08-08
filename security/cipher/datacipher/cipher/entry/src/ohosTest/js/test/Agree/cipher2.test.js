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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import cipher from '@system.cipher';
export default function cipher2_test() {
describe('cipher2_test', function () {
  let plainTextRsa;
  let cipherTextRsa;
  let rsaPublicKey;
  let rsaPrivateKey;
  let plainTextAes;
  let cipherTextAes;
  let aesKey;
  let cipherResult;
  let cipherResultFail;
  beforeAll(function () {
	plainTextRsa = 'Hello,World! 123 rsa key2###';
	cipherTextRsa = 'EGyJbxPvBjX4m+hxfbFxojT9KjjLII7Sz8NmjWiy/K+F4WvlGhSOQS9RME2hu208EjvaLvKTgv7Ijo2\n'+
	'dGKO0OD4UlEI3LiNFT+cFhfXIVYs16vKQhWtkJEfkJIPjmO5NekxpelYcqmdxUqq5T/7+uq4vRbVyK1/4P57VWLyMTM=';
	rsaPublicKey = 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCU9YGbkTHKMi6iFFiPC8fYQkrt\n' +
	'jG9Y3gwmQkhDD31MtqvaMZyIus2eKZcAiSIGE8Yt3j0Y5Yej6m5OYxICB9oZ88T4\n' +
	'SoaaUsh/hb7HyUFEWWcGHQEFXNLWtRXs+LCPE6/VETbY66o+BcALlUxyQeq8AqK7\n' +
	'ahs3QFPDo5+CSwxIoQIDAQAB';
	rsaPrivateKey = 'MIICXQIBAAKBgQCU9YGbkTHKMi6iFFiPC8fYQkrtjG9Y3gwmQkhQQ31MtqvaMZyI\n' +
	'us2eKZcAiSIGE8Yt3j0Y5Yej6m5OYxICB9oZ88T4SoaaUsh/hb7HyUFEWWcGHQEF\n' +
	'XNLWtRXs+LCPE6/VETbY66o+BcALlUxyQeq8AqK7ahs3QFPDo5+CSwxIoQIDAQAB\n' +
	'AoGAAPIIfDotgfIbExLfsG3G5fEe9ZbM7kVH25JOuF3ycUIrQnk81RJTDJbxItJw\n' +
	'JbKKzZTWTVNylvw7JzkHdLZvrNzsI8c/0abMrl64ZUugtumhkmrn6xW6H6z4GQnR\n' +
	'havHgRlFL2giWX99J/bMRntMzGCXH8elwIwuPZrYCcdQ5PECQQDw+qsWqTGJyGXr\n' +
	'SGyR5Djn+ZAuqFQvfH6vj6b2ridSbZ0RKgRGTXgH4JsaNnqnVpGilWjUHVbSRvPD\n' +
	'lZu28qpNAkEAnj52PkGPG9tvG4eaC4Y+LNDKOcU4Ybn07Jz+mZwOGkxb8sgw/kw6\n' +
	'H8xPV/7F7GWLjopUsaHnWuWIegzxQY8ZpQJBAKdmGm+VfRovoc099F2sYnOTA7vF\n' +
	'pvWNoBuo+N0nwZ0bFB8WRv3nVthyCIy/B5kzI9wvz7B56RQNwcxqmM8P54kCQAbY\n' +
	'Zt8MkPdAh87mD8jdlsSzh3v2RxkbJTgzFmRotsd2dCfNdykYtRN5EBmbYM54GhBh\n' +
	'dYZlnX92HHBDLRCL8y0CQQDuKZNoBooqVUwcrCFqpeAX/bGYiVmFxcIqyu5vYzVJ\n' +
	'Ff5Fpkxm4FLmrjhiGwL1CKIm5RRL9kT6tsv4do6ALylb';
	plainTextAes = '%%%%Hello,World! 123 aes key2###(^^^)';
	cipherTextAes = 'IclkeCOt6pPODqNyprSZizYdJLBFLwXsEFJo34IJwZp7JmfQJXDbqGpexINBMke4';
	aesKey = 'MTIzNDU2Nzg5MDEyMzQ1Njc4OTAxMjMONTY3ODkwMzI=';
	cipherResult = true;
	cipherResultFail = false;
  });
  beforeEach(function () {});
  afterEach(function () {});
  
  /**
   * @tc.number     SUB_Security_DataPro_cipher_0100
   * @tc.name       RSA algorithm encryption succeeded
   * @tc.desc       [C-SECURITY-1800]
   */
   it('SUB_Security_DataPro_cipher_0100', 0, function () {
	  cipher.rsa({
		action: 'encrypt',
		text: plainTextRsa,
		key: rsaPublicKey,
		transformation: 'RSA/None/OAEPWithSHA256AndMGF1Padding',
		success: data => {
		  console.log(`cipher.rsa encrypt success: ${data.text}`);
		  expect(cipherResult).toBeTrue();
		},
		fail: (data,code) => {
		  this.err = `${code}: ${data}`;
		  console.log(`cipher.rsa encrypt fail: ${code}: ${data}`);
		  expect(cipherResultFail).toBeTrue();
		},
		complete: () => {
		  console.log(`Rsa encrypt end...`);
		}
	  });
   });
   
  /**
   * @tc.number     SUB_Security_DataPro_cipher_0200
   * @tc.name       RSA algorithm decryption succeeded
   * @tc.desc       [C-SECURITY-1800]
   */
   it('SUB_Security_DataPro_cipher_0200', 1, function () {
	  cipher.rsa({
		action: 'decrypt',
		text: plainTextRsa,
		key: rsaPrivateKey,
		transformation: 'RSA/None/OAEPWithSHA256AndMGF1Padding',
		success: data => {
		  console.log(`cipher.aes encrypt success: ${data.text}`);
		  expect(cipherResult).toBeTrue();
		},
		fail: (data,code) => {
		  this.err = `${code}: ${data}`;
		  console.log(`action is invalid, cipher.aes encrypt fail: ${code}: ${data}`);
		  expect(cipherResultFail).toBeTrue();
		},
		complete: () => {
		  console.log(`Rsa encrypt end...`);
		}
	  });
   });
   
  /**
   * @tc.number     SUB_Security_DataPro_cipher_0300
   * @tc.name       RSA encryption test when the value of action is abnormal
   * @tc.desc       [C-SECURITY-1800]
   */
   it('SUB_Security_DataPro_cipher_0300', 2, function () {
	  cipher.rsa({
		action: 'encrypt123',
		text: plainTextRsa,
		key: rsaPublicKey,
		transformation: 'RSA/None/OAEPWithSHA256AndMGF1Padding',
		success: data => {
		  console.log(`cipher.rsa encrypt success: ${data.text}`);
		  expect(cipherResultFail).toBeTrue();
		},
		fail: (data,code) => {
		  this.err = `${code}: ${data}`;
		  console.log(`action is invalid,cipher.rsa encrypt fail: ${code}: ${data}`);
		  expect(cipherResult).toBeTrue();
		},
		complete: () => {
		  console.log(`Rsa encrypt end...`);
		}
	  });
   });
   
  /**
   * @tc.number     SUB_Security_DataPro_cipher_0400
   * @tc.name       RSA encryption test when the value of action is abnormal
   * @tc.desc       [C-SECURITY-1800]
   */
   it('SUB_Security_DataPro_cipher_0400', 2, function () {
	  cipher.rsa({
		action: 'encrypt',
		text: plainTextRsa,
		key: '1234560GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCU9YGbkTHKMi6iFFiPC8fYQkrt\n' +
		'jG9Y3gwmQkhDD31MtqvaMZyIus2eKZcAiSIGE8Yt3j0Y5Yej6m5OYxICB9oZ88T4\n' +
		'SoaaUsh/hb7HyUFEWWcGHQEFXNLWtRXs+LCPE6/VETbY66o+BcALlUxyQeq8AqK7\n' +
		'ahs3QFPDo5+CSwxIoQIDAQAB',
		transformation: 'RSA/None/OAEPWithSHA256AndMGF1Padding',
		success: data => {
		  console.log(`cipher.rsa encrypt success: ${data.text}`);
		  expect(cipherResultFail).toBeTrue();
		},
		fail: (data,code) => {
		  this.err = `${code}: ${data}`;
		  console.log(`key is invalid, cipher.rsa encrypt fail: ${code}: ${data}`);
		  expect(cipherResult).toBeTrue();
		},
		complete: () => {
		  console.log(`Rsa encrypt end...`);
		}
	  });
   });
   
  /**
   * @tc.number     SUB_Security_DataPro_cipher_0500
   * @tc.name       RSA encryption test when the value of action is abnormal
   * @tc.desc       [C-SECURITY-1800]
   */
   it('SUB_Security_DataPro_cipher_0500', 2, function () {
	  cipher.rsa({
		action: 'encrypt',
		text: '~!@#$%^&*()_+<>?:"~,./183456789012345678901234567890123456789',
		key: rsaPublicKey,
		transformation: 'RSA/None/OAEPWithSHA256AndMGF1Padding',
		success: data => {
		  console.log(`cipher.rsa encrypt success: ${data.text}`);
		  expect(cipherResult).toBeTrue();
		},
		fail: (data,code) => {
		  this.err = `${code}: ${data}`;
		  console.log(`cipher.rsa encrypt fail: ${code}: ${data}`);
		  expect(cipherResultFail).toBeTrue();
		},
		complete: () => {
		  console.log(`Rsa encrypt end...`);
		}
	  });
    });
	
  /**
   * @tc.number     SUB_Security_DataPro_cipher_0600
   * @tc.name       RSA encryption test when the value of action is abnormal
   * @tc.desc       [C-SECURITY-1800]
   */
   it('SUB_Security_DataPro_cipher_0600', 2, function () {
	  cipher.rsa({
		action: 'decrypt',
		text: plainTextRsa,
		key: rsaPublicKey,
		transformation: 'RSA',
		success: data => {
		  console.log(`cipher.rsa encrypt success: ${data.text}`);
		  expect(cipherResultFail).toBeTrue();
		},
		fail: (data,code) => {
		  this.err = `${code}: ${data}`;
		  console.log(`transformation is invalid, cipher.rsa decrypt fail: ${code}: ${data}`);
		  expect(cipherResult).toBeTrue();
		},
		complete: () => {
		  console.log(`Rsa encrypt end...`);
		}
	  });
    });
	
  /**
   * @tc.number     SUB_Security_DataPro_cipher_0700
   * @tc.name       RSA encryption test when the value of action is abnormal
   * @tc.desc       [C-SECURITY-1800]
   */
   it('SUB_Security_DataPro_cipher_0700', 2, function () {
	  cipher.rsa({
		action: 'decrypt123',
		text: cipherTextRsa,
		key: rsaPublicKey,
		transformation: 'RSA/None/OAEPWithSHA256AndMGF1Padding',
		success: data => {
		  console.log(`cipher.rsa decrypt success: ${data.text}`);
		  expect(cipherResultFail).toBeTrue();
		},
		fail: (data,code) => {
		  this.err = `${code}: ${data}`;
		  console.log(`action is invalid, cipher.rsa decrypt fail: ${code}: ${data}`);
		  expect(cipherResult).toBeTrue();
		},
		complete: () => {
		  console.log(`Rsa encrypt end...`);
		}
	  });
    });
	
  /**
   * @tc.number     SUB_Security_DataPro_cipher_0800
   * @tc.name       RSA encryption test when the value of action is abnormal
   * @tc.desc       [C-SECURITY-1800]
   */
   it('SUB_Security_DataPro_cipher_0800', 3, function () {
	  cipher.rsa({
		action: 'decrypt',
		text: cipherTextRsa,
		key: '123456IBAAKBgQCU9YGbkTHKMi6iFFiPC8fYQkrtjG9Y3gwmQkhQQ31MtqvaMZyI\n' +
		'us2eKZcAiSIGE8Yt3j0Y5Yej6m5OYxICB9oZ88T4SoaaUsh/hb7HyUFEWWcGHQEF\n' +
		'XNLWtRXs+LCPE6/VETbY66o+BcALlUxyQeq8AqK7ahs3QFPDo5+CSwxIoQIDAQAB\n' +
		'AoGAAPIIfDotgfIbExLfsG3G5fEe9ZbM7kVH25JOuF3ycUIrQnk81RJTDJbxItJw\n' +
		'JbKKzZTWTVNylvw7JzkHdLZvrNzsI8c/0abMrl64ZUugtumhkmrn6xW6H6z4GQnR\n' +
		'havHgRlFL2giWX99J/bMRntMzGCXH8elwIwuPZrYCcdQ5PECQQDw+qsWqTGJyGXr\n' +
		'SGyR5Djn+ZAuqFQvfH6vj6b2ridSbZ0RKgRGTXgH4JsaNnqnVpGilWjUHVbSRvPD\n' +
		'lZu28qpNAkEAnj52PkGPG9tvG4eaC4Y+LNDKOcU4Ybn07Jz+mZwOGkxb8sgw/kw6\n' +
		'H8xPV/7F7GWLjopUsaHnWuWIegzxQY8ZpQJBAKdmGm+VfRovoc099F2sYnOTA7vF\n' +
		'pvWNoBuo+N0nwZ0bFB8WRv3nVthyCIy/B5kzI9wvz7B56RQNwcxqmM8P54kCQAbY\n' +
		'Zt8MkPdAh87mD8jdlsSzh3v2RxkbJTgzFmRotsd2dCfNdykYtRN5EBmbYM54GhBh\n' +
		'dYZlnX92HHBDLRCL8y0CQQDuKZNoBooqVUwcrCFqpeAX/bGYiVmFxcIqyu5vYzVJ\n' +
		'Ff5Fpkxm4FLmrjhiGwL1CKIm5RRL9kT6tsv4do6ALylb',
		transformation: 'RSA/None/OAEPWithSHA256AndMGF1Padding',
		success: data => {
		  console.log(`cipher.rsa decrypt success: ${data.text}`);
		  expect(cipherResultFail).toBeTrue();
		},
		fail: (data,code) => {
		  this.err = `${code}: ${data}`;
		  console.log(`key is invalid,cipher.rsa decrypt fail: ${code}: ${data}`);
		  expect(cipherResult).toBeTrue();
		},
		complete: () => {
		  console.log(`Rsa encrypt end...`);
		}
	  });
    });
	
  /**
   * @tc.number     SUB_Security_DataPro_cipher_0900
   * @tc.name       RSA encryption test when the value of action is abnormal
   * @tc.desc       [C-SECURITY-1800]
   */
   it('SUB_Security_DataPro_cipher_0900', 3, function () {
	  cipher.rsa({
		action: 'decrypt',
		text: '~!@#$%^&*()_+<>?:"~,./183456789012345678901234567890123456789',
		key: rsaPrivateKey,
		transformation: 'RSA/None/OAEPWithSHA256AndMGF1Padding',
		success: data => {
		  console.log(`cipher.rsa decrypt success: ${data.text}`);
		  expect(cipherResultFail).toBeTrue();
		},
		fail: (data,code) => {
		  this.err = `${code}: ${data}`;
		  console.log(`cipher.rsa decrypt fail: ${code}: ${data}`);
		  expect(cipherResult).toBeTrue();
		},
		complete: () => {
		  console.log(`Rsa encrypt end...`);
		}
	  });
   });
   
  /**
   * @tc.number     SUB_Security_DataPro_cipher_1000
   * @tc.name       RSA encryption test when the value of action is abnormal
   * @tc.desc       [C-SECURITY-1800]
   */
   it('SUB_Security_DataPro_cipher_1000', 3, function () {
	  cipher.rsa({
		action: 'decrypt',
		text: cipherTextRsa,
		key: rsaPrivateKey,
		transformation: 'RSA',
		success: data => {
		  console.log(`cipher.rsa decrypt success: ${data.text}`);
		  expect(cipherResultFail).toBeTrue();
		},
		fail: (data,code) => {
		  this.err = `${code}: ${data}`;
		  console.log(`transformation is invalid, cipher.aes decrypt fail: ${code}: ${data}`);
		  expect(cipherResult).toBeTrue();
		},
		complete: () => {
		  console.log(`Rsa encrypt end...`);
		}
	  });
   });
   
  /**
   * @tc.number     SUB_Security_DataPro_cipher_1100
   * @tc.name       The AES algorithm is successfully encrypted
   * @tc.desc       [C-SECURITY-1800]
   */
   it('SUB_Security_DataPro_cipher_1100', 3, function () {
	  cipher.aes({
		action: 'decrypt',
		text: cipherTextAes,
		key: aesKey,
		transformation: 'AES/CBC/PKCS5Padding',
		iv: 'MTIzNDU2Nzg5MDEyMzQ1Ng==',
		ivOffset: 0,
		ivLen: 16,
		success: data => {
		  console.log(`cipher.aes encrypt success: ${data.text}`);
		  expect(data.text).toEqual(cipherTextAes);
		},
		fail: (data,code) => {
		  this.err = `${code}: ${data}`;
		  console.log(`cipher.aes decrypt fail: ${code}: ${data}`);
		  expect(cipherResultFail).toBeTrue();
		},
		complete: () => {
		  console.log(`Aes encrypt end...`);
		}
	  });
   });
   
  /**
   * @tc.number     SUB_Security_DataPro_cipher_1200
   * @tc.name       The AES algorithm is successfully encrypted
   * @tc.desc       [C-SECURITY-1800]
   */
   it('SUB_Security_DataPro_cipher_1200', 3, function () {
	  cipher.aes({
		action: 'decrypt',
		text: cipherTextAes,
		key: aesKey,
		transformation: 'AES/CBC/PKCS5Padding',
		iv: 'MTIzNDU2Nzg5MDEyMzQ1Ng==',
		ivOffset: 0,
		ivLen: 16,
		success: data => {
		  console.log(`cipher.aes encrypt success: ${data.text}`);
		  expect(data.text).toEqual(plainTextAes);
		},
		fail: (data,code) => {
		  this.err = `${code}: ${data}`;
		  console.log(`cipher.aes decrypt fail: ${code}: ${data}`);
		  expect(cipherResultFail).toBeTrue();
		},
		complete: () => {
		  console.log(`Aes encrypt end...`);
		}
	  });
   });
   
  /**
   * @tc.number     SUB_Security_DataPro_cipher_2300
   * @tc.name       The AES algorithm is successfully encrypted
   * @tc.desc       [C-SECURITY-1800]
   */
   it('SUB_Security_DataPro_cipher_2300', 3, function () {
	  cipher.aes({
		action: 'decrypt',
		text: cipherTextAes,
		key: aesKey,
		transformation: 'AES',
		iv: 'MTIzNDU2Nzg5MDEyMzQ1Ng==',
		ivOffset: 0,
		ivLen: 16,
		success: data => {
		  console.log(`cipher.aes encrypt success: ${data.text}`);
		  expect(cipherResultFail).toBeTrue();
		},
		fail: (data,code) => {
		  this.err = `${code}: ${data}`;
		  console.log(`transformation is invalid,cipher.aes decrypt fail: ${code}: ${data}`);
		  expect(cipherResult).toBeTrue();
		},
		complete: () => {
		  console.log(`Aes encrypt end...`);
		}
	  });
   });
});}
