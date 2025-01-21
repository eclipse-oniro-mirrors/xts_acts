/*
 * Copyright (c) 2023-2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import dataPreferences from "@ohos.data.preferences";
import common from "@ohos.app.ability.common";
import { BusinessError } from '@ohos.base';

const NAME = "test_preferences";
const KEY_TEST_STRING_ELEMENT = "key_test_string";
const KEY_TEST_INT_ELEMENT = "key_test_int";
let mPreferences;
let context: common.UIAbilityContext;

function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

export default function preferencesHelperTest() {
  describe("preferencesHelperTest", () => {
    beforeAll(async () => {
      console.info("beforeAll");
      context = AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
      console.info("context=======>" + context);
      mPreferences = await dataPreferences.getPreferences(context, NAME);
    });

    afterAll(async () => {
      console.info("afterAll");
      await dataPreferences.deletePreferences(context, NAME);
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_GetPreferencesJSAPITest_1300
     * @tc.name   : testGetPreferencesHelper0001
     * @tc.desc   : GetPreferencesSync interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testGetPreferencesHelper0001", 0, async () => {
      mPreferences = await dataPreferences.getPreferences(context, NAME);
      await mPreferences.put(KEY_TEST_STRING_ELEMENT, "test");
      await mPreferences.flush();
      let value = await mPreferences.get(KEY_TEST_STRING_ELEMENT, 0);
      expect(value).assertEqual("test");
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_GetPreferencesJSAPITest_1200
     * @tc.name   : testGetPreferencesHelper0002
     * @tc.desc   : GetPreferences interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testGetPreferencesHelper0002", 0, async (done: Function) => {
      const promise = dataPreferences.getPreferences(context, NAME);
      let preferences: dataPreferences.Preferences;
      promise
        .then(async (pref) => {
          preferences = pref;
          await preferences.put(KEY_TEST_STRING_ELEMENT, "test");
          preferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", (err, ret) => {
            expect("test").assertEqual(ret);
          });
          await dataPreferences.deletePreferences(context, NAME);
          console.info("Succeeded in getting preferences.");
          done();
        })
        .catch((err: BusinessError) => {
          expect(!err).assertTrue();
        });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_RemoveJSAPITest_1300
     * @tc.name   : testRemovePreferencesFromCacheHelper0001
     * @tc.desc   : RemovePreferencesFromCache interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRemovePreferencesFromCacheHelper0001", 0, async (done: Function) => {
      let preferences = await dataPreferences.getPreferences(context, NAME);
      const promise = dataPreferences.removePreferencesFromCache(context, NAME);
      promise
        .then(() => {
          console.info("Succeeded in removing preferences.");
          expect("{}").assertEqual(JSON.stringify(preferences));
          done();
        })
        .catch((err: BusinessError) => {
          expect(!err).assertTrue();
        });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_RemoveJSAPITest_0600
     * @tc.name   : testRemovePreferencesFromCacheHelper0004
     * @tc.desc   : RemovePreferencesFromCache interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRemovePreferencesFromCacheHelper0004", 0, async (done: Function) => {
      let preferences = await dataPreferences.getPreferences(context, NAME);
      await preferences.put(KEY_TEST_STRING_ELEMENT, "test");
      preferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", (err, ret) => {
        expect("test").assertEqual(ret);
      });
      dataPreferences
        .removePreferencesFromCache(context, "test_preferences1")
        .then(() => {
          console.info("Succeeded in removing preferences.");
          preferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", (err, pre) => {
            expect("test").assertEqual(pre);
            done();
          });
        })
        .catch((err: BusinessError) => {
          console.info("Remove preferences from cache error: " + err);
          expect(!err).assertTrue();
          done();
        });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_RemoveJSAPITest_0800
     * @tc.name   : testRemovePreferencesFromCacheHelper0005
     * @tc.desc   : RemovePreferencesFromCache interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRemovePreferencesFromCacheHelper0005", 0, async (done: Function) => {
      let preferences = await dataPreferences.getPreferences(context, {
        name: NAME
      });
      const promise = dataPreferences.removePreferencesFromCache(context, {
        name: NAME
      });
      promise
        .then(() => {
          console.info("Succeeded in removing preferences.");
          expect("{}").assertEqual(JSON.stringify(preferences));
          done();
        })
        .catch((err: BusinessError) => {
          expect(!err).assertTrue();
        });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_RemoveJSAPITest_0700
     * @tc.name   : testRemovePreferencesFromCacheHelper0006
     * @tc.desc   : RemovePreferencesFromCache interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRemovePreferencesFromCacheHelper0006", 0, async (done: Function) => {
      let preferences = await dataPreferences.getPreferences(context, {
        name: NAME
      });
      await preferences.put(KEY_TEST_STRING_ELEMENT, "test");
      preferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", (err, ret) => {
        expect("test").assertEqual(ret);
      });
      dataPreferences
        .removePreferencesFromCache(context, {
          name: "test_preferences1"
        })
        .then(() => {
          console.info("Succeeded in removing preferences.");
          preferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", (err, pre) => {
            expect("test").assertEqual(pre);
            done();
          });
        })
        .catch((err: BusinessError) => {
          console.info("Remove preferences from cache error: " + err);
          expect(!err).assertTrue();
          done();
        });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_DeleteJSAPITest_1800
     * @tc.name   : testPreferencesDeleteHelper0001
     * @tc.desc   : DeletePreferences interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesDeleteHelper0001", 0, async (done: Function) => {
      let preferences = await dataPreferences.getPreferences(context, NAME);
      const promise = dataPreferences.deletePreferences(context, NAME);
      promise
        .then(() => {
          console.info("Succeeded in deleting preferences.");
          expect("{}").assertEqual(JSON.stringify(preferences));
          done();
        })
        .catch((err: BusinessError) => {
          console.info("Delete preferences err: " + err);
          expect(!err).assertTrue();
        });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_DeleteJSAPITest_0700
     * @tc.name   : testPreferencesDeleteHelper0004
     * @tc.desc   : DeletePreferences interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesDeleteHelper0004", 0, async (done: Function) => {
      let preferences = await dataPreferences.getPreferences(context, NAME);
      await preferences.put(KEY_TEST_STRING_ELEMENT, "test");
      preferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", (err, ret) => {
        expect("test").assertEqual(ret);
      });
      dataPreferences
        .deletePreferences(context, "test_preferences1")
        .then(() => {
          console.info("Succeeded in deleting preferences.");
          preferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", (err, pre) => {
            expect("test").assertEqual(pre);
            done();
          });
        })
        .catch((err: BusinessError) => {
          console.info("Delete preferences err: " + err);
          expect(!err).assertTrue();
          done();
        });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_DeleteJSAPITest_0900
     * @tc.name   : testPreferencesDeleteHelper0005
     * @tc.desc   : DeletePreferences interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesDeleteHelper0005", 0, async (done: Function) => {
      let preferences = await dataPreferences.getPreferences(context, {
        name: NAME
      });
      const promise = dataPreferences.deletePreferences(context, {
        name: NAME
      });
      promise
        .then(() => {
          console.info("Succeeded in deleting preferences.");
          expect("{}").assertEqual(JSON.stringify(preferences));
          done();
        })
        .catch((err: BusinessError) => {
          console.info("Delete preferences err: " + err);
          expect(!err).assertTrue();
        });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_DeleteJSAPITest_0800
     * @tc.name   : testPreferencesDeleteHelper0006
     * @tc.desc   : DeletePreferences interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesDeleteHelper0006", 0, async (done: Function) => {
      let preferences = await dataPreferences.getPreferences(context, {
        name: NAME
      });
      await preferences.put(KEY_TEST_STRING_ELEMENT, "test");
      preferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", (err, ret) => {
        expect("test").assertEqual(ret);
      });
      dataPreferences
        .deletePreferences(context, {
          name: "test_preferences1"
        })
        .then(() => {
          console.info("Succeeded in deleting preferences.");
          preferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", (err, pre) => {
            expect("test").assertEqual(pre);
            done();
          });
        })
        .catch((err: BusinessError) => {
          console.info("Delete preferences err: " + err);
          expect(!err).assertTrue();
          done();
        });
    });

    /**
     * @tc.number  : SUB_DistributedData_CrossPlatform_SDK_Preferences_JSAPITest_0400
     * @tc.name    : testMaxKeyLength001
     * @tc.desc    : Test key length
     * @tc.size    : MediumTest
     * @tc.type    : Function
     * @tc.level   : Level 0
     */
    it("testMaxKeyLength001", 0, () => {
      expect(dataPreferences.MAX_KEY_LENGTH == 1024).assertTrue();
    });

    /**
     * @tc.number  : SUB_DistributedData_CrossPlatform_SDK_Preferences_JSAPITest_0500
     * @tc.name    : testMaxValueLength001
     * @tc.desc    : Test value length
     * @tc.size    : MediumTest
     * @tc.type    : Function
     * @tc.level   : Level 0
     */
    it("testMaxValueLength001", 0, () => {
      expect(dataPreferences.MAX_VALUE_LENGTH == 16*1024*1024).assertTrue();
    });

    /**
     * @tc.number  : SUB_DistributedData_CrossPlatform_SDK_Preferences_OnOFFJSAPITest_0800
     * @tc.name    : testPreferencesOn001
     * @tc.desc    : Test on interface
     * @tc.size    : MediumTest
     * @tc.type    : Function
     * @tc.level   : Level 2
     */
    it("testPreferencesOn001", 0, async () => {
      try {
        await mPreferences.clear();
        let observer = (key: string) => {
          console.info("testPreferencesOn001 key " + key);
          expect(KEY_TEST_STRING_ELEMENT).assertEqual(key);
        };
        mPreferences.on("change", observer);
        await mPreferences.put(KEY_TEST_STRING_ELEMENT, "abcd");
        await mPreferences.flush();
      } catch (err) {
        console.info("Failed to testPreferencesOn001. code =" + err.code + ", message =" + err.message);
        expect(!err).assertTrue();
      }
    });

    /**
     * @tc.number  : SUB_DistributedData_CrossPlatform_SDK_Preferences_OnOFFJSAPITest_0600
     * @tc.name    : testPreferencesOn002
     * @tc.desc    : Test on interface
     * @tc.size    : MediumTest
     * @tc.type    : Function
     * @tc.level   : Level 2
     */
    it("testPreferencesOn002", 0, async () => {
      try {
        await mPreferences.clear();
        let observer = (key: string) => {
          console.info("testPreferencesOn002 key " + key);
          expect(KEY_TEST_STRING_ELEMENT).assertEqual(key);
        };
        mPreferences.on("change");
        expect().assertFail();
      } catch (err) {
        console.info("Failed to testPreferencesOn002. code =" + err.code + ", message =" + err.message);
        expect("401").assertEqual(err.code);
      }
    });

    /**
     * @tc.number  : SUB_DistributedData_CrossPlatform_SDK_Preferences_OnOFFJSAPITest_0400
     * @tc.name    : testPreferencesOn003
     * @tc.desc    : Test on interface
     * @tc.size    : MediumTest
     * @tc.type    : Function
     * @tc.level   : Level 2
     */
    it("testPreferencesOn003", 0, async () => {
      try {
        await mPreferences.clear();
        let observer = (key: string) => {
          console.info("testPreferencesOn003 key " + key);
          expect(KEY_TEST_STRING_ELEMENT).assertEqual(key);
        };
        mPreferences.on(null, observer);
        expect().assertFail();
      } catch (err) {
        console.info("Failed to testPreferencesOn003. code =" + err.code + ", message =" + err.message);
        expect("401").assertEqual(err.code);
      }
    });

    /**
     * @tc.number  : SUB_DistributedData_CrossPlatform_SDK_Preferences_OnOFFJSAPITest_0300
     * @tc.name    : testPreferencesOn004
     * @tc.desc    : Test on interface
     * @tc.size    : MediumTest
     * @tc.type    : Function
     * @tc.level   : Level 2
     */
    it("testPreferencesOn004", 0, async () => {
      try {
        await mPreferences.clear();
        let observer = (key: string) => {
          console.info("testPreferencesOn004 key " + key);
          expect(KEY_TEST_STRING_ELEMENT).assertEqual(key);
        };
        mPreferences.on("", observer);
        expect().assertFail();
      } catch (err) {
        console.info("Failed to testPreferencesOn004. code =" + err.code + ", message =" + err.message);
        expect("401").assertEqual(err.code);
      }
    });

    /**
     * @tc.number  : SUB_DistributedData_CrossPlatform_SDK_Preferences_OnOFFJSAPITest_0200
     * @tc.name    : testPreferencesOff001
     * @tc.desc    : Test off interface
     * @tc.size    : MediumTest
     * @tc.type    : Function
     * @tc.level   : Level 2
     */
    it("testPreferencesOff001", 0, async () => {
      try {
        await mPreferences.clear();
        let isTrigger = false;
        let observer = (key: string) => {
          console.info("testPreferencesOff001 key" + key);
          isTrigger = true;
        };
        mPreferences.on("change", observer);
        mPreferences.off("change", observer);
        await mPreferences.put(KEY_TEST_STRING_ELEMENT, "abc");
        await mPreferences.flush();
        await sleep(500);
        expect(isTrigger === false).assertTrue();
      } catch (err) {
        console.info("Failed to testPreferencesOff001. code =" + err.code + ", message =" + err.message);
        expect(!err).assertTrue();
      }
    });

    /**
     * @tc.number  : SUB_DistributedData_CrossPlatform_SDK_Preferences_OnOFFJSAPITest_0100
     * @tc.name    : testPreferencesOff002
     * @tc.desc    : Test off interface
     * @tc.size    : MediumTest
     * @tc.type    : Function
     * @tc.level   : Level 2
     */
    it("testPreferencesOff002", 0, async () => {
      try {
        await mPreferences.clear();
        let isTrigger = false;
        let observer = (key: string) => {
          console.info("testPreferencesOff001 key" + key);
          isTrigger = true;
        };
        mPreferences.on("change", observer);
        mPreferences.off("change");
        await mPreferences.put(KEY_TEST_STRING_ELEMENT, "abc");
        await mPreferences.flush();
        await sleep(500);
        expect(isTrigger === false).assertTrue();
      } catch (err) {
        console.info("Failed to testPreferencesOff001. code =" + err.code + ", message =" + err.message);
        expect(!err).assertTrue();
      }
    });

    /**
     * @tc.number  : SUB_DistributedData_CrossPlatform_SDK_Preferences_OnOFFJSAPITest_0700
     * @tc.name    : testPreferencesOff003
     * @tc.desc    : Test off interface
     * @tc.size    : MediumTest
     * @tc.type    : Function
     * @tc.level   : Level 2
     */
    it("testPreferencesOff003", 0, async () => {
      try {
        await mPreferences.clear();
        let isTrigger = false;
        let observer = (key: string) => {
          console.info("testPreferencesOff003 key" + key);
          isTrigger = true;
        };
        mPreferences.on("change", observer);
        mPreferences.off(null);
        expect().assertFail();
      } catch (err) {
        console.info("Failed to testPreferencesOff003. code =" + err.code + ", message =" + err.message);
        expect("401").assertEqual(err.code);
      }
    });

    /**
     * @tc.number  : SUB_DistributedData_CrossPlatform_SDK_Preferences_OnOFFJSAPITest_0500
     * @tc.name    : testPreferencesOff004
     * @tc.desc    : Test off interface
     * @tc.size    : MediumTest
     * @tc.type    : Function
     * @tc.level   : Level 2
     */
    it("testPreferencesOff004", 0, async () => {
      try {
        await mPreferences.clear();
        let isTrigger = false;
        let observer = (key: string) => {
          console.info("testPreferencesOff004 key" + key);
          isTrigger = true;
        };
        mPreferences.on("change", observer);
        mPreferences.off("");
        expect().assertFail();
      } catch (err) {
        console.info("Failed to testPreferencesOff004. code =" + err.code + ", message =" + err.message);
        expect("401").assertEqual(err.code);
      }
    });
  });
}