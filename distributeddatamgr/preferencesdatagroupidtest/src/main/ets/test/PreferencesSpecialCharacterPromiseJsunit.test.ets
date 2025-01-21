/*
* Copyright (c) 2023 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import dataPreferences from '@ohos.data.preferences';
import util from '@ohos.util';
import common from "@ohos.app.ability.common"
import huks from '@ohos.security.huks';
const NAME = 'test_preferences';
const KEY_TEST_UINT8ARRAY = 'key_test_uint8array';
let mPreferences;
let context: common.UIAbilityContext

let aesKeyAlias = 'test_aesKeyAlias';
let handle:number;
let IV = '001122334455';
let cipherData:Uint8Array;

function StringToUint8Array(str: String) {
  let arr:number[]=new Array();
  for (let i = 0, j = str.length; i < j; ++i) {
    arr.push(str.charCodeAt(i));
  }
  return new Uint8Array(arr);
}

function Uint8ArrayToString(fileData:Uint8Array) {
  let dataString = '';
  for (let i = 0; i < fileData.length; i++) {
    dataString += String.fromCharCode(fileData[i]);
  }
  return dataString;
}

function GetAesGenerateProperties() {
  let properties: Array<huks.HuksParam> = new Array();
  let index = 0;
  properties[index++] = {
    tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
    value: huks.HuksKeyAlg.HUKS_ALG_AES
  };
  properties[index++] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
    value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_128
  };
  properties[index++] = {
    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
    value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT |
    huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
  }
  return properties;
}

function GetAesEncryptProperties() {
  let properties: Array<huks.HuksParam> = new Array();
  let index = 0;
  properties[index++] = {
    tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
    value: huks.HuksKeyAlg.HUKS_ALG_AES
  };
  properties[index++] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
    value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_128
  };
  properties[index++] = {
    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
    value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT
  }
  properties[index++] = {
    tag: huks.HuksTag.HUKS_TAG_PADDING,
    value: huks.HuksKeyPadding.HUKS_PADDING_PKCS7
  }
  properties[index++] = {
    tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
    value: huks.HuksCipherMode.HUKS_MODE_CBC
  }
  properties[index++] = {
    tag: huks.HuksTag.HUKS_TAG_IV,
    value: StringToUint8Array(IV)
  }
  return properties;
}

function GetAesDecryptProperties() {
  let properties: Array<huks.HuksParam> = new Array();
  let index = 0;
  properties[index++] = {
    tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
    value: huks.HuksKeyAlg.HUKS_ALG_AES
  };
  properties[index++] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
    value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_128
  };
  properties[index++] = {
    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
    value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT
  }
  properties[index++] = {
    tag: huks.HuksTag.HUKS_TAG_PADDING,
    value: huks.HuksKeyPadding.HUKS_PADDING_PKCS7
  }
  properties[index++] = {
    tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
    value: huks.HuksCipherMode.HUKS_MODE_CBC
  }
  properties[index++] = {
    tag: huks.HuksTag.HUKS_TAG_IV,
    value: StringToUint8Array(IV)
  }
  return properties;
}

export default function preferencesSpecialCharacterPromiseTest(){
  describe('preferencesSpecialCharacterPromiseTest', function () {
    beforeAll(async function () {
      console.info('beforeAll');
      context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext
      mPreferences = await dataPreferences.getPreferences(context, NAME);
    })

    afterAll(async function () {
      console.info('afterAll');
      await dataPreferences.deletePreferences(context, NAME);
    })

    /**
     * @tc.name put Uint8Array promise interface test
     * @tc.number SUB_DistributedData_Preference_SDK_SpecialCharacter_0100
     * @tc.desc put Uint8Array promise interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPreferencesPutUint8Array0010', 0, async function () {
      let uInt8Array = new util.TextEncoder().encodeInto("!@#$%^&*() _+-~");
      const promise = mPreferences.put(KEY_TEST_UINT8ARRAY, uInt8Array);
      await promise.then(async (ret) => {
        let pre = await mPreferences.get(KEY_TEST_UINT8ARRAY, new Uint8Array(0));
        expect(uInt8Array.toString() === pre.toString()).assertTrue();
        await mPreferences.flush();
        await dataPreferences.removePreferencesFromCache(context, NAME);
        mPreferences = null;
        mPreferences = await dataPreferences.getPreferences(context, NAME);
        let pre2 = await mPreferences.get(KEY_TEST_UINT8ARRAY, new Uint8Array(0));
        expect(uInt8Array.toString() === pre2.toString()).assertTrue();
      }).catch((err) => {
        expect(null).assertFail();
      });
    })

    /**
     * @tc.name put Uint8Array promise interface test
     * @tc.number SUB_DistributedData_Preference_SDK_SpecialCharacter_0200
     * @tc.desc put Uint8Array promise interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPreferencesPutUint8Array0020', 0, async function () {
      let uInt8Array = new util.TextEncoder().encodeInto("abc123");
      const promise = mPreferences.put(KEY_TEST_UINT8ARRAY, uInt8Array);
      await promise.then(async (ret) => {
        let pre = await mPreferences.get(KEY_TEST_UINT8ARRAY, new Uint8Array(0));
        expect(uInt8Array.toString() === pre.toString()).assertTrue();
        await mPreferences.flush();
        await dataPreferences.removePreferencesFromCache(context, NAME);
        mPreferences = null;
        mPreferences = await dataPreferences.getPreferences(context, NAME);
        let pre2 = await mPreferences.get(KEY_TEST_UINT8ARRAY, new Uint8Array(0));
        expect(uInt8Array.toString() === pre2.toString()).assertTrue();
      }).catch((err) => {
        expect(null).assertFail();
      });
    })

    /**
     * @tc.name put Uint8Array promise interface test
     * @tc.number SUB_DistributedData_Preference_SDK_SpecialCharacter_0300
     * @tc.desc put Uint8Array promise interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPreferencesPutUint8Array0030', 0, async function () {
      let uInt8Array = new util.TextEncoder().encodeInto("abc@#$%123");
      const promise = mPreferences.put(KEY_TEST_UINT8ARRAY, uInt8Array);
      await promise.then(async (ret) => {
        let pre = await mPreferences.get(KEY_TEST_UINT8ARRAY, new Uint8Array(0));
        expect(uInt8Array.toString() === pre.toString()).assertTrue();
        await mPreferences.flush();
        await dataPreferences.removePreferencesFromCache(context, NAME);
        mPreferences = null;
        mPreferences = await dataPreferences.getPreferences(context, NAME);
        let pre2 = await mPreferences.get(KEY_TEST_UINT8ARRAY, new Uint8Array(0));
        expect(uInt8Array.toString() === pre2.toString()).assertTrue();
      }).catch((err) => {
        expect(null).assertFail();
      });
    })

    /**
     * @tc.name put Uint8Array promise interface test
     * @tc.number SUB_DistributedData_Preference_SDK_SpecialCharacter_0400
     * @tc.desc put Uint8Array promise interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPreferencesPutUint8Array0040', 0, async function () {
      let uInt8Array = new Uint8Array(8192);
      uInt8Array.fill(100);
      const promise = mPreferences.put(KEY_TEST_UINT8ARRAY, uInt8Array);
      await promise.then(async (ret) => {
        let pre = await mPreferences.get(KEY_TEST_UINT8ARRAY, new Uint8Array(0));
        expect(uInt8Array.toString() === pre.toString()).assertTrue();
        await mPreferences.flush();
        await dataPreferences.removePreferencesFromCache(context, NAME);
        mPreferences = null;
        mPreferences = await dataPreferences.getPreferences(context, NAME);
        let pre2 = await mPreferences.get(KEY_TEST_UINT8ARRAY, new Uint8Array(0));
        expect(uInt8Array.toString() === pre2.toString()).assertTrue();
      }).catch((err) => {
        expect(null).assertFail();
      });
    })

    /**
     * @tc.name put Uint8Array promise interface test
     * @tc.number SUB_DistributedData_Preference_SDK_SpecialCharacter_0500
     * @tc.desc put Uint8Array promise interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPreferencesPutUint8Array0050', 0, async function (done) {
      let uInt8Array = new Uint8Array(8193);
      uInt8Array.fill(100);
      try {
        await mPreferences.put(KEY_TEST_UINT8ARRAY, uInt8Array);
      } catch (err) {
        console.log("try catch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect("401").assertEqual(err.code.toString());
        done();
      }
    })

    /**
     * @tc.name put Uint8Array promise interface test
     * @tc.number SUB_DistributedData_Preference_SDK_SpecialCharacter_0600
     * @tc.desc put Uint8Array promise interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPreferencesPutUint8Array0060', 0, async function () {
      let genProperties = GetAesGenerateProperties();
      let options: huks.HuksOptions = {
        properties: genProperties
      }
      await huks.generateKeyItem(aesKeyAlias, options)
        .then((data) => {
          console.info(`generate AES Key success, data = ${JSON.stringify(data)}`);
        }).catch((error)=>{
          console.error(`generate AES Key failed`);
        })
      let uInt8Array = new util.TextEncoder().encodeInto("!@#$%^&*() _+-~");
      let encryptProperties = GetAesEncryptProperties();
      let options2: huks.HuksOptions = {
        properties: encryptProperties,
        inData: uInt8Array
      }
      await huks.initSession(aesKeyAlias, options2)
        .then((data) => {
          handle = data.handle;
        }).catch((error)=>{
          console.error(`callback: init encryptdata failed`);
        })
      await huks.finishSession(handle, options2)
        .then((data) => {
          console.info(`encrypt data success, data is `+ Uint8ArrayToString(data.outData as Uint8Array));
          cipherData = data.outData as Uint8Array;
        }).catch((error)=>{
          console.error(`encrypt data failed`);
        })
      await mPreferences.put(KEY_TEST_UINT8ARRAY, cipherData).then(async (ret) => {
        let pre = await mPreferences.get(KEY_TEST_UINT8ARRAY, new Uint8Array(0)) as Uint8Array;
        let decryptOptions = GetAesDecryptProperties()
        let options3: huks.HuksOptions = {
          properties: decryptOptions,
          inData: pre
        }
        await huks.initSession(aesKeyAlias, options3)
          .then((data) => {
            handle = data.handle;
          }).catch((error)=>{
            console.error(`init decryptdata failed`);
          })
        await huks.finishSession(handle, options3)
          .then((data) => {
            console.info(`decrypt data success, data is ` + Uint8ArrayToString(data.outData as Uint8Array));
            console.info(`decrypt data success, data is ` + Uint8ArrayToString(uInt8Array as Uint8Array));
            expect(uInt8Array.toString() === data.outData.toString()).assertTrue();
          }).catch((error)=>{
            console.error(`callback: decrypt data failed`);
          })
        await mPreferences.flush();
        await dataPreferences.removePreferencesFromCache(context, NAME);
        mPreferences = null;
        mPreferences = await dataPreferences.getPreferences(context, NAME);
        let pre2 = await mPreferences.get(KEY_TEST_UINT8ARRAY, new Uint8Array(0)) as Uint8Array;
        let options4: huks.HuksOptions = {
          properties: decryptOptions,
          inData: pre2
        }
        await huks.initSession(aesKeyAlias, options4)
          .then((data) => {
            handle = data.handle;
          }).catch((error)=>{
            console.error(`init decryptdata failed`);
          })
        await huks.finishSession(handle, options4).then((data) => {
            console.info(`decrypt data success, data is ` + Uint8ArrayToString(data.outData as Uint8Array));
            console.info(`decrypt data success, data is ` + Uint8ArrayToString(uInt8Array as Uint8Array));
            expect(uInt8Array.toString() === data.outData.toString()).assertTrue();
          }).catch((error)=>{
            console.error(`decrypt data failed`);
          })
      }).catch((err) => {
        expect(null).assertFail();
      });
      let emptyOptions: huks.HuksOptions = {
        properties: []
      }
      await huks.deleteKeyItem(aesKeyAlias, emptyOptions)
        .then((data) => {
          console.info(`delete data success`);
        }).catch((error)=>{
          console.error(`delete data failed`);
        })
    })
  })
}