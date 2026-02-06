/*
* Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium';
import data_preferences from '@ohos.data.preferences';
import preferences from '@ohos.data.preferences';
import fs from '@ohos.file.fs';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';



const TAG = ["preserence_test"];

const NAME = 'test_preferences_store';
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
let options: data_preferences.Options = { name: 'test_preferences_store' };
let mPreferences:preferences.Preferences;


function isFileExists(path: string) : boolean {
  if (!path) {
    console.info(TAG + 'path is undefined');
    return false;
  }
  try {
    if (fs.accessSync(path)) {
      return true;
    }
  } catch (err) {
    console.info(TAG + 'accessSync failed: ' + JSON.stringify(err));
  }
  return false;
}


export default function PreferencesInterfaceTest() {
  describe('PreferencesInterfaceTest', () => {

    beforeAll(() => {
      console.info('beforeAll');
    })
    beforeEach(async () => {
      console.info('beforeEach');
    })
    afterEach(async () => {
      console.info('afterEach');
    })
    afterAll(() => {
      console.info('afterAll');
    })



    /**
     * @tc.name   testPreferencesStorageType0100
     * @tc.number testPreferencesStorageType0100
     * @tc.desc   testPreferencesStorageType0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPreferencesStorageType0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      try {
        console.info(TAG + "enum value of xml: ${data_preferences.StorageType.XML}");
        console.info(TAG + "enum value of GSkv: ${data_preferences.StorageType.GSKV}");
        expect(0).assertEqual(data_preferences.StorageType.XML);
        expect(1).assertEqual(data_preferences.StorageType.GSKV);

        let isXmlSupported = data_preferences.isStorageTypeSupported(data_preferences.StorageType.XML);
        console.info(TAG + "isXmlSupported: ${isXmlSupported}");
        expect(isXmlSupported).assertTrue();

        let isGSkvSupported = data_preferences.isStorageTypeSupported(data_preferences.StorageType.GSKV);
        if (isGSkvSupported) {
          console.info(TAG + "isGSkvSupported: ${isGSkvSupported}");
          expect(isGSkvSupported).assertTrue();
          console.info("====>testPreferencesStorageType001 success: part1")
        }
        done();
      } catch (err) {
        console.info("====>testPreferencesStorageType001 throw_err:" + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })



    /**
     * @tc.name   testPreferencesStorageType0200
     * @tc.number testPreferencesStorageType0200
     * @tc.desc   testPreferencesStorageType0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testPreferencesStorageType0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      try {
        let boolVar = data_preferences.isStorageTypeSupported(-1);
        expect().assertFail();
        done();
      } catch (err) {
        console.log("try catch err =" + err + ", code =" + err.code +", message =" + err.message);
        expect("401").assertEqual(err.code.toString());
        console.info("====>testPreferencesStorageType001 success: part2")
        done();
      }
    })



    /**
     * @tc.name   testPreferencesStorageType0300
     * @tc.number testPreferencesStorageType0300
     * @tc.desc   testPreferencesStorageType0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testPreferencesStorageType0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      try {
        let boolVar = data_preferences.isStorageTypeSupported(2);
        expect().assertFail();
        done();
      } catch (err) {
        console.log("try catch err =" + err + ", code =" + err.code +", message =" + err.message);
        expect("401").assertEqual(err.code.toString());
        console.info("====>testPreferencesStorageType001 success: part3");
        done();
      }
    })



    /**
     * @tc.name   testPreferencesStorageType0400
     * @tc.number testPreferencesStorageType0400
     * @tc.desc   testPreferencesStorageType0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesStorageType0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done:Function) => {
      let OptionArray: data_preferences.Options[] = [
        { name: "default_storage_0400_1" },
        { name: "default_storage_0400_2", dataGroupId: null },
        { name: "default_storage_0400_3", storageType: null },
        { name: "default_storage_0400_4", storageType: 0 },
        { name: "default_storage_0400_5", storageType: data_preferences.StorageType.XML }
      ]
      let spArray:data_preferences.Preferences[] = []
      for (let i = 0; i < OptionArray.length; i++) {
        try {
          spArray[i] = data_preferences.getPreferencesSync(context, OptionArray[i]);
          expect(spArray[i] != null).assertTrue();
          spArray[i].putSync("key", "value");
          await spArray[i].flush();
          data_preferences.removePreferencesFromCacheSync(context, OptionArray[i]);
          done();
        } catch (err) {
          console.error(TAG + "try put and flush catch err =" + err + ", code =" + err.code + ", message =" + err.message);
          expect().assertFail();
          done();
        }
      }
      for (let i = 0; i < OptionArray.length; i++) {
        if (!isFileExists(context.preferencesDir + '/' + OptionArray[i].name)) {
          console.error(TAG + 'check file failed: ' + context.preferencesDir + '/' +
          OptionArray[i].name);
          expect().assertFail();
          done();
        }
      }
    })


    /**
     * @tc.name   testPreferencesStorageType0500
     * @tc.number testPreferencesStorageType0500
     * @tc.desc   testPreferencesStorageType0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesStorageType0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      let mPreference1 = await data_preferences.getPreferences(context, {name: "storage_0500_1", storageType: null});
      expect(mPreference1 != null).assertTrue();
      mPreference1.putSync("key", "value");
      await mPreference1.flush();
      data_preferences.removePreferencesFromCacheSync(context, {name: "storage_0500_1", storageType: null});
      expect(isFileExists(context.preferencesDir + '/' + "storage_0500_1")).assertTrue();
      try {
        let mPreference2 = await data_preferences.getPreferences(context, {name: "storage_0500_1", storageType: null});
        expect(mPreference2 != null).assertTrue();
        data_preferences.removePreferencesFromCacheSync(context, {name: "storage_0500_1", storageType: null});
        done();
      } catch (err) {
        console.log("try catch err =" + err + ", code =" + err.code +", message =" + err.message);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.name   testPreferencesStorageType0600
     * @tc.number testPreferencesStorageType0600
     * @tc.desc   testPreferencesStorageType0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesStorageType0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done:Function) => {
      let isEnhance = data_preferences.isStorageTypeSupported(data_preferences.StorageType.GSKV);
      if (isEnhance) {
        const Options : data_preferences.Options = {
          name: "storage_0600",
          storageType: data_preferences.StorageType.GSKV
        };

          let mPreference1 = data_preferences.getPreferencesSync(context, Options);
          console.info(TAG + '0600 success mPreference1' + mPreference1);
          expect(mPreference1 != null).assertTrue();
          data_preferences.removePreferencesFromCacheSync(context, Options);
          expect(isFileExists(context.preferencesDir + '/' + "storage_0600.db")).assertTrue();
          const Options2 : data_preferences.Options = {
          name: "storage_0600",
          storageType: data_preferences.StorageType.XML
        };
        try {
          mPreference1 = data_preferences.getPreferencesSync(context, Options2);
          console.info(TAG + '0600 try success' + mPreference1);
          expect(mPreference1 == null).assertTrue();
          done();
        } catch (err) {
          console.log(TAG + "0600 try catch err =" + err + ", code =" + err.code +", message =" + err.message);
          console.info("====>testPreferencesStorageType0600 success")
          expect().assertFail();
          done();
        }
      } else{
        console.info(TAG + 'isEnhance is false');
        done();
      }
    })



    /**
     * @tc.name   testPreferencesStorageType0700
     * @tc.number testPreferencesStorageType0700
     * @tc.desc   testPreferencesStorageType0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesStorageType0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      const Options : data_preferences.Options = {
        name: "storage_006"
      }
      let sp = await data_preferences.getPreferences(context, Options);
      expect(sp != null).assertTrue();
      sp.putSync("key", "value");
      await sp.flush();
      data_preferences.removePreferencesFromCacheSync(context, Options);
      expect(isFileExists(context.preferencesDir + '/' + Options.name)).assertTrue();
      const Options2 : data_preferences.Options = {
        name: "storage_006",
        storageType: data_preferences.StorageType.GSKV
      }
      try {
        sp = data_preferences.getPreferencesSync(context, Options2);
        expect(sp == null).assertTrue();
        done();
      } catch (err) {
        console.log("try catch err =" + err + ", code =" + err.code +", message =" + err.message);
        console.info("====>testPreferencesStorageType006 success")
        done();
      }
    })



    /**
     * @tc.name   testPreferencesStorageType0800
     * @tc.number testPreferencesStorageType0800
     * @tc.desc   testPreferencesStorageType0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPreferencesStorageType0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done:Function) => {
      let isEnhance = data_preferences.isStorageTypeSupported(data_preferences.StorageType.GSKV);
      console.info(TAG + '0800 isStorageTypeSupported success' + isEnhance);
      if (isEnhance) {
        try {
          const Options: data_preferences.Options = {
            name: "storage_007",
            storageType: data_preferences.StorageType.GSKV
          };
          let sp = data_preferences.getPreferencesSync(context, Options);
          expect(sp != null).assertTrue();
          data_preferences.removePreferencesFromCacheSync(context, Options);

          sp = data_preferences.getPreferencesSync(context, Options);
          expect(sp != null).assertTrue();
          data_preferences.removePreferencesFromCacheSync(context, Options);
          done();
        } catch (err) {
          console.log("try catch err =" + err + ", code =" + err.code + ", message =" + err.message);
          expect().assertFail();
          done();
        }
      } else{
        console.info(TAG + 'isEnhance is false');
        done();
      }
    })



    /**
     * @tc.name   testPreferencesStorageType0900
     * @tc.number testPreferencesStorageType0900
     * @tc.desc   testPreferencesStorageType0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPreferencesStorageType0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      try {
        console.info(TAG + "enum value of xml: ${data_preferences.StorageType.XML}");
        expect(0).assertEqual(data_preferences.StorageType.XML);
        let isXmlSupported = data_preferences.isStorageTypeSupported(data_preferences.StorageType.XML);
        console.info(TAG + "isXmlSupported: ${isXmlSupported}");
        if (isXmlSupported) {
          console.info(TAG + "isXmlSupported: ${isXmlSupported}");
          expect(isXmlSupported).assertTrue();
          console.info("====>testPreferencesStorageType0900 success: part1")
        } else {
          console.info(TAG + "isXmlSupported: ${isXmlSupported}");
          expect(isXmlSupported).assertFalse();
          console.info("====>testPreferencesStorageType0900 success: part1");
        }
        done();
      } catch (err) {
        console.info("====>testPreferencesStorageType0900 throw_err:" + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })



    /**
     * @tc.name   testPreferencesStorageType1000
     * @tc.number testPreferencesStorageType1000
     * @tc.desc   testPreferencesStorageType1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPreferencesStorageType1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      try {
        console.info(TAG + "enum value of GSkv: ${data_preferences.StorageType.GSKV}");
        expect(1).assertEqual(data_preferences.StorageType.GSKV);
        let isGSkvSupported = data_preferences.isStorageTypeSupported(data_preferences.StorageType.GSKV);
        if (isGSkvSupported) {
          console.info(TAG + "isGSkvSupported: ${isGSkvSupported}");
          expect(isGSkvSupported).assertTrue();
          console.info("====>testPreferencesStorageType001 success: part1")
        } else {
          console.info(TAG + "isGSkvSupported: ${isGSkvSupported}");
          expect(isGSkvSupported).assertFalse();
          console.info("====>testPreferencesStorageType1000 success: part1");
        }
        done();
      } catch (err) {
        console.info("====>testPreferencesStorageType1000 throw_err:" + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })
  })
}